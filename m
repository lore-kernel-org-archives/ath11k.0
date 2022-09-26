Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94BBBC07E9D
	for <ath11k@archiver.kernel.org>; Mon, 26 Sep 2022 09:52:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iK7snv/ajmXnOoT083Fys6m7bY/UgsoVABFGLZMpS+E=; b=ZDJQuYKK4k/zDN
	HqCW4n674tBK5c+Yg2yqgz/8K+QOCKHWX1VccOnU7a4zACHsukP4nyHG4ifWf4+m6FPK6HSWnqsSz
	5aB965WkDBixjUjvkiwQZWZOa1ZiV2pkSnWlW3CryT9+uHuQitfHthV2NtzHFJNRAzt6PqJFgg6LV
	Go6UsdV+I9Mawv5nE7pvqZ0dv8cCutmhJ98StudAMjpuGw6nvqGkOpcZhmULUsddk/zYYGhIAz/tW
	wDsaqOBRvNg3i06qCAVLuB9S3MCG/TBRmtd7erMdmBargCYWRoyflx/ISdKPyTTwh5P0RSzh/7NMu
	nVfrQDPN9tcsiu6E6MxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ockms-003oLK-9p; Mon, 26 Sep 2022 09:52:30 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ockbb-003irT-CE
	for ath11k@lists.infradead.org; Mon, 26 Sep 2022 09:40:53 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9A3DD609E9;
	Mon, 26 Sep 2022 09:40:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27397C433C1;
	Mon, 26 Sep 2022 09:40:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664185248;
	bh=KZExA4qLutmcXLykvMCHov9T9r+TzGGb9WvyV10CAX0=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=omilYMEgoE9VFMrzNoPz/7jyv0RzCth5hvOXT9uDsdTbX6L1RXYsjVdsrf+OLARB3
	 XCwP1Hfg2SHobK0w+QJzeUSF35HLrTxpng8DJT9CmuZzmP0HU46Jir/+DpC8sjHPeE
	 PXnWvcGizqLlLLK60jo2qPgCaDRiSs21QcrR8lS597To+IZsMvqff7p8nmolYp6HnJ
	 dYyEVZhHXIssVx8E2A+G2xiBz5sV9tDWeZQL9oO7HXQYQ3OJnLTXKfRc85AYzK/bn9
	 CFLW6+89RFVbr7HidsRselHKmeDSpZq4qtzUeLR1bya8uP5cU3ytUmE5RpVAtqFX19
	 mKvrfX9ZHulbA==
MIME-Version: 1.0
Subject: Re: [PATCH] wifi: ath11k: Remove redundant ath11k_mac_drain_tx
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20220919020259.1746-1-quic_bqiang@quicinc.com>
References: <20220919020259.1746-1-quic_bqiang@quicinc.com>
To: Baochen Qiang <quic_bqiang@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <166418524644.13691.9971262730096379862.kvalo@kernel.org>
Date: Mon, 26 Sep 2022 09:40:47 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220926_024051_504735_D6364F2A 
X-CRM114-Status: UNSURE (   7.47  )
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

Baochen Qiang <quic_bqiang@quicinc.com> wrote:

> ath11k_mac_drain_tx is already called in ath11k_mac_wait_tx_complete, no need to call it again. So remove it.
> 
> This is found in code review.
> 
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3
> 
> Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

d50ebec14535 wifi: ath11k: Remove redundant ath11k_mac_drain_tx

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20220919020259.1746-1-quic_bqiang@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
