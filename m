Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5698C433FE
	for <ath11k@archiver.kernel.org>; Mon, 21 Mar 2022 10:45:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OkI9YaBsbMKfnwQ/JNG5FYUvuWXq3DojK8MaYOacreM=; b=YLa+NdE8KwkuxQ
	oXpgaIUByQINbjJ9iGlcrWKAetloZwB0j93LuHuoVdbyTH+lGRPFjB6+paKfdUD8DTteoD5PS54vu
	eEBbo3ZyPfMhc4iGaIHBYOue1Rc/5MK21hb+JloopHkbyBToL0Ba8/v0Bvc7rubLfRWws+u9t8S8W
	E1AtwXgoJ/7qGzxEjSpQvpzw6TzyePr/wS6wn0gd9xXUwNkeTQAvPdZg9VkNurcGmG1TctreIIBYr
	IqtN5M9bEY4YN6HQjL1yMj+qBzZkfBJrU3DK1I5pyqShSjfSscmmsCFCMicaE8qQ/CBA69cdw55CA
	JdwXsyf4OL1jNRkRrX1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nWFXa-007M8p-Ba; Mon, 21 Mar 2022 10:45:34 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nWFXX-007M8V-B8
 for ath11k@lists.infradead.org; Mon, 21 Mar 2022 10:45:32 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D7FB86130E;
 Mon, 21 Mar 2022 10:45:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBF93C340E8;
 Mon, 21 Mar 2022 10:45:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647859530;
 bh=qlSsmxZgmgoVlxrDmTqHEBFYP6zE8LzIg5s79c49TmA=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=A+B6mNF7/4WRvDlGMwbGcxosKKyVWZNdKI98m5WYcScq8e+O6hE2zDW8d/G9J8+id
 N92XBBYnqDupo89cwDKcRoOX0HUMr9sypt/06hXHQthmYX6dAxmnwgYOuK6b/DSbal
 deP4mqMSlSNbwoupY491RKerE3udhXMmp5FjxOBnlodLkXo8JjqitQpS0ryfLggCtb
 CbE78mO70r7OiL8LudkM3/tV1GqKFXVvlfM2FOQp7+zjp90hGzKmCNcIBruI4562jG
 KV3e8Sp9cmrI2cOggXJf7aZ8y3RpHluGHe2JQi8lEwc3Ej2pzvzbIrR1k4dLlR2nLp
 WyXzxtUqHG5Rw==
From: Kalle Valo <kvalo@kernel.org>
To: Niels Dossche <dossche.niels@gmail.com>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Carl Huang <cjhuang@codeaurora.org>
Subject: Re: [PATCH] ath11k: acquire ab->base_lock in unassign when finding
 the peer by addr
References: <20220314215253.92658-1-dossche.niels@gmail.com>
Date: Mon, 21 Mar 2022 12:45:25 +0200
In-Reply-To: <20220314215253.92658-1-dossche.niels@gmail.com> (Niels Dossche's
 message of "Mon, 14 Mar 2022 22:52:53 +0100")
Message-ID: <87zgljmvne.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220321_034531_470869_36EE81C3 
X-CRM114-Status: GOOD (  19.48  )
X-BeenThere: ath11k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Niels Dossche <dossche.niels@gmail.com> writes:

> ath11k_peer_find_by_addr states via lockdep that ab->base_lock must be
> held when calling that function in order to protect the list. All
> callers except ath11k_mac_op_unassign_vif_chanctx have that lock
> acquired when calling ath11k_peer_find_by_addr. That lock is also not
> transitively held by a path towards ath11k_mac_op_unassign_vif_chanctx.
> The solution is to acquire the lock when calling
> ath11k_peer_find_by_addr inside ath11k_mac_op_unassign_vif_chanctx.
>
> Fixes: 701e48a43e15 ("ath11k: add packet log support for QCA6390")
> Signed-off-by: Niels Dossche <dossche.niels@gmail.com>
> ---
>  drivers/net/wireless/ath/ath11k/mac.c | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
> index 07f499d5ec92..5db2333478a2 100644
> --- a/drivers/net/wireless/ath/ath11k/mac.c
> +++ b/drivers/net/wireless/ath/ath11k/mac.c
> @@ -7077,9 +7077,15 @@ ath11k_mac_op_unassign_vif_chanctx(struct ieee80211_hw *hw,
>  	WARN_ON(!arvif->is_started);
>  
>  	if (ab->hw_params.vdev_start_delay &&
> -	    arvif->vdev_type == WMI_VDEV_TYPE_MONITOR &&
> -	    ath11k_peer_find_by_addr(ab, ar->mac_addr))
> -		ath11k_peer_delete(ar, arvif->vdev_id, ar->mac_addr);
> +	    arvif->vdev_type == WMI_VDEV_TYPE_MONITOR) {
> +		struct ath11k_peer *peer;

In the pending branch I moved the declaration to the beginning of the
function and added this to the commit log:

"I am currently working on a static analyser to detect missing locks and
this was a reported case. I manually verified the report by looking at
the code, but I do not have real hardware so this is compile tested
only."

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
