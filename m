Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0775DC433EF
	for <ath11k@archiver.kernel.org>; Wed, 16 Mar 2022 06:13:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sieu8l4yuxVF1//XjJONnpOthFuCnqLBRM3ktq+Eb0o=; b=CjguDEpmMLSy4m
	N8zwvmw7e618gdlOwzOUNV4ioemdRyM7sL5x9qaKiFlffwaQmm27NuVdO7NWARcAwF4QzvJuRxrjv
	+gYDVIDTwltKRpkkVe7TrD41l9RPmPlvgwNzwZDWCQY7JlnXqP+1uvFL4PSTtxRqRJi0d51maLwsQ
	7ykUC4hYD+6po6DXaE503DGUt/WPUbZMt11qkQZyuMjAOWWKOBHSPyVyNNbQPnAJAU2h9edpCbg+6
	E+r4weMRoIZKtQZNkZqycZvSSEWnqINmXZFFcJgXGhWERRCj6519HbUZxrlT2Y+JCtp+spT9SFt2D
	O8i5FMCTZs8NPan6gVQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nUMuu-00BeQ4-LV; Wed, 16 Mar 2022 06:13:52 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nUMuT-00BeAH-O1
 for ath11k@lists.infradead.org; Wed, 16 Mar 2022 06:13:27 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id E6FBAB818CB;
 Wed, 16 Mar 2022 06:13:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C6DCC340E9;
 Wed, 16 Mar 2022 06:13:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647411201;
 bh=/gEn69FCXVyKJWnF/AyvAgLAHPy0NbgHxDfUNtsFnIQ=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=m5V+cOhV24K7n6z9Uby3kV4XgKuEC0JAkijn0tWdLK6Whpiy7P44RUhixsl41yxxi
 +wzoR9htC/YqjmIPy/Svons+dX5hlAMkIWjfJ52Qsk9IOO7GLC/biV6IkoLYXm09GY
 Bq5rtsHmX6IJXRxFRtE5xlBJs00jwRsmUkbrZhO0+CvF7dR5mLb8+h1MRYY0mXbdBo
 hShrCmMMQIv9DdEwbYS1VdveGqcJRtfJeb7BoHZkGE93UOCt+ek7HRINell3bY5gAP
 uV7rHWarck4O67wFKRAmWiGyZvAbhdsf6XB9ZXikUBSaveBKUC0aLkMmIuVaqrPyV4
 KIPCQQOhuJAUQ==
From: Kalle Valo <kvalo@kernel.org>
To: Niels Dossche <dossche.niels@gmail.com>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Carl Huang <cjhuang@codeaurora.org>
Subject: Re: [PATCH] ath11k: acquire ab->base_lock in unassign when finding
 the peer by addr
References: <20220314215253.92658-1-dossche.niels@gmail.com>
Date: Wed, 16 Mar 2022 08:13:16 +0200
In-Reply-To: <20220314215253.92658-1-dossche.niels@gmail.com> (Niels Dossche's
 message of "Mon, 14 Mar 2022 22:52:53 +0100")
Message-ID: <87o826pgqr.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220315_231326_000079_E7FAB017 
X-CRM114-Status: GOOD (  10.18  )
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

On what hardware and firmware version did you test this?

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
