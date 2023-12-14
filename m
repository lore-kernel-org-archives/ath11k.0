Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F105C4332F
	for <ath11k@archiver.kernel.org>; Thu, 14 Dec 2023 16:40:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=inz7hgruWKT/m0gVs399XfijN1O1Msuzz1I4VVSggLA=; b=QxQsJ1brxCZiGo9omXV3XbONCX
	aJTwhWC/xFILThsNpejyXy9qyXLZjRrnwy9sdOQ/NfhgvdyPC7YTogXHDs4bunh8h+Tsb3Tpfd+++
	CpvSTXWtRawSR0ahUvKJK9kvcwCSHPC/jSj1tlEXgb+LZHv5MBvqVTXQCYcqkUtmLdoPxExLNJ5E8
	6HxPpa8j2ztlvbCUnkBaBhuqhmPR46v54aLnqgBPWM0l4jY+rlfSQ7eV42eBFnWKijasIh7yFnq3W
	MKoKMwNi2q/YnD6to37jK3FlozbVV7kYrRJn/cMXDCtDn8AgBEYLsfs3j+1EGcAJMBAQpPMHrhqDE
	/MhD61qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDolX-000poh-32;
	Thu, 14 Dec 2023 16:40:51 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDolV-000plE-1s
	for ath11k@lists.infradead.org;
	Thu, 14 Dec 2023 16:40:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id D97DBCE2426;
	Thu, 14 Dec 2023 16:40:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34495C433C8;
	Thu, 14 Dec 2023 16:40:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702572043;
	bh=7q4xziHGQZPDQMbjsW2etL7QNNmAAzU2B1pJxrK6e9U=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=WTv3fVXjIgFvGu1uedym2kbxmcukkRvuBgsdXQTg1ZeOWfiQM6AnWogT8AtbWMdXW
	 1W/bqxkYc+ixqbsVPUjPPMG88tKGOcK02WhUqzuvU9BVCrQWdw/NU1lExdMim2WrqW
	 eIF91R+a2Lba91Mm3ERSN4DM6yuomlcNjZyvYy/LuHFwq7E4eGcGGZuGSTWLYqI+At
	 u8iGMqVCugdDaR5L1bE8KlBUrEz7oAZF+l4GTLmn7p8F76MO4eftL5SCsHE7pJH4CD
	 AYvZBKveayrKsGFXMyoWJxzjvzl8Cd2HHeAyim7VNMjUpeTBNfhWgIk3Qd2qeEkyNU
	 CkUA0zweHLYNg==
From: Kalle Valo <kvalo@kernel.org>
To: Dmitry Antipov <dmantipov@yandex.ru>
Cc: Jeff Johnson <quic_jjohnson@quicinc.com>,  linux-wireless@vger.kernel.org,
    ath11k@lists.infradead.org
Subject: Re: [PATCH] wifi: ath11k: refactor ath11k_wmi_tlv_parse_alloc()
References: <20231214161117.75145-1-dmantipov@yandex.ru>
Date: Thu, 14 Dec 2023 18:40:38 +0200
In-Reply-To: <20231214161117.75145-1-dmantipov@yandex.ru> (Dmitry Antipov's
	message of "Thu, 14 Dec 2023 19:11:14 +0300")
Message-ID: <87fs04n3eh.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231214_084049_796700_4ECE3F5A 
X-CRM114-Status: UNSURE (   9.93  )
X-CRM114-Notice: Please train this message.
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
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Dmitry Antipov <dmantipov@yandex.ru> writes:

> Since 'ath11k_wmi_tlv_parse_alloc()' always operates on
> 'skb->data, skb->len' tuple, it may be simplified to pass
> the only 'skb' argument instead (which also implies
> refactoring of 'ath11k_pull_bcn_tx_status_ev()' and
> 'ath11k_pull_chan_info_ev()' in the same way). Compile
> tested only.
>
> Signed-off-by: Dmitry Antipov <dmantipov@yandex.ru>
> ---
>  drivers/net/wireless/ath/ath11k/testmode.c |  2 +-
>  drivers/net/wireless/ath/ath11k/wmi.c      | 73 +++++++++++-----------
>  drivers/net/wireless/ath/ath11k/wmi.h      |  4 +-
>  3 files changed, 39 insertions(+), 40 deletions(-)

Please Cc ath11k list for all ath11k patches, added it now. No need to
resend because of this.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

