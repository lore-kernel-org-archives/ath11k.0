Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEAB6C43334
	for <ath11k@archiver.kernel.org>; Mon,  6 Jun 2022 14:08:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=znnPi0oNLrK6nHNntBrHa3kD8mZABC2JhkGXpWSYbko=; b=KMGXWAFst5V11G
	TaQw45qM116IOWubNZf9dmqgrWHY+vhj0TPKkm0yvVbN5Bzmz6X0X9hdAga7WJmmSfWEYZGnYumr6
	uTaQW4qPjy4M09B/tuvt7osQm8dMT0BMZGtOpLkDeOcG0eH8k4fvt/hj/lhErFM+7vhFQ5vHpY2vh
	vwOwLv4WXafK+ioaq79WQ5OLixGQzIBKvPSktfFXKNqTcYzuIPwDRI+e8Wv4+WPrih4o5CodVJtG4
	3+v++53lz0qOgdHXp1CMwrjCJEt9z/AS3f6Xf/8oXkbMGuU21NOZk1+wffdHMuARq3ubt/JTkq53e
	jOkQI0t/wcWYO050Dc8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyDPf-001S1a-65; Mon, 06 Jun 2022 14:08:59 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyDPb-001S0u-Ve
	for ath11k@lists.infradead.org; Mon, 06 Jun 2022 14:08:57 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 6D6A5B819F9;
	Mon,  6 Jun 2022 14:08:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D62DC385A9;
	Mon,  6 Jun 2022 14:08:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654524533;
	bh=D0nfxgkU1zrBljYHyZkn5gGyrYOdvPSzjiXG5oFDjTk=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=OaWnneUjkvytyScrO84+4eZ5Fx7jyuBNFOuMR2Ch2X3w+ooU9iorATsgwcicz96PI
	 6DyEBusDL1M+Z5TDZ97ss0CzcbMBeJWjpPKCCcgTfxRFDhYcNCzUusvAhhuh0LXnCT
	 tWHb8ogLckN6aWaHfeHo5jPVzFPurTbHcVB1UT9C9ivg92u9UHb7ue4o5f+hNOkCVy
	 aAgf7YREEwz59vhgzzofwd+tlh6+laAogXC3AIGnyHWnilAy1WN7ra44FmZowSdGbm
	 82BnxAiBbswSTY0eqCFAYpTjgKaZOPOxZEvsDTZkz5jQTLinrOBvZRbWmrARE3vykR
	 6dflpyGyNfilQ==
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: Fix incorrect debug_mask mappings
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20220602115621.15339-1-quic_mpubbise@quicinc.com>
References: <20220602115621.15339-1-quic_mpubbise@quicinc.com>
To: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <165452452992.15301.3587479774647912453.kvalo@kernel.org>
Date: Mon,  6 Jun 2022 14:08:51 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220606_070856_221860_11D8BF2B 
X-CRM114-Status: UNSURE (   8.81  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Manikanta Pubbisetty <quic_mpubbise@quicinc.com> wrote:

> Currently a couple of debug_mask entries are mapped to the same value,
> this could enable unintended driver logging. If enabling DP_TX logs was
> the intention, then this could also enable PCI logs flooding the dmesg
> buffer or vice versa. Fix this by correctly assigning the debug masks.
> 
> Found during code review.
> 
> Tested-on: WCN6750 hw1.0 AHB WLAN.MSL.1.0.1-00887-QCAMSLSWPLZ-1
> 
> Fixes: aa2092a9bab3f ("ath11k: add raw mode and software crypto support")
> Signed-off-by: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

9331f7d3c54a ath11k: Fix incorrect debug_mask mappings

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20220602115621.15339-1-quic_mpubbise@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
