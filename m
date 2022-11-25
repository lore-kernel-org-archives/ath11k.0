Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CD62C4167B
	for <ath11k@archiver.kernel.org>; Fri, 25 Nov 2022 11:41:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mPSr3Zddd44ZtEquDQ/oKBI3ixp0W+fO33j3b982w9Q=; b=ciyFbwz6GybB4h
	wMvXv4gtSgJbGojMeXzG1NZEPOnp2BYJyQkH0XQ3LBEoxEOGPTFT/DjO35zSNOv1P950a47qBvmLl
	PXYBHMu4iEXwPaz2QTRlYVopQOcfRzkUW8iVm+PGsJ7Q9sGR3x15fvtwU/hDXbgMKlWGRj5dZ8Uvt
	a2gu899Pc3CEJsa3MV+WoSl1gLd+8IaB8EXUDp3GeHZ0lHKm+7BBrXV2yZxxfpxmERkCWLLjbW97H
	z4tmhXa4KBCUZZFg7YJvUTbDZgaAMcMbzeUdC/MqafNcqrg7iYbfzMEDpJ2P/cWynwQKb8WdyUBM4
	8s1aC24YFdZuyivw1s9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyX4p-00GCcy-Q2; Fri, 25 Nov 2022 11:41:03 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyX4D-00GCUO-5b
	for ath11k@lists.infradead.org; Fri, 25 Nov 2022 11:40:29 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B3A5A62391;
	Fri, 25 Nov 2022 11:40:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04363C433D6;
	Fri, 25 Nov 2022 11:40:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669376424;
	bh=DOrrhLoSridluknHWsDTp9LWzfwnL3Uj7q7jyBqzW/k=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=dD/4UzJhfd7h7XDpEaihTEP9Q5wE/LbPknLiz+1FebuW2+4dNiVzh4BVEIgqEwypG
	 i+uh0DAiwKTw5sJLqIasuNGiX3v9hn2SCtThCWpe4/HYYr/EawAOeV34dn2ocv2oEn
	 XxpwAbihRG3HTwbbCx3tspbi12NG1SlHdv+HPR9m7U6GqCa0GcnLirUUKRC7n2XZ2R
	 QyTPnsxFd9ynrWgDWHShAjDbG5IsZ9gG7fIatTZzGbeNHkbcD8DrM7bhjfJhXlixWn
	 x7z8LeF5sWllmtUhzMAMyFdmlJWMqr9Hg0+f0BM6Wb/n85CzqWyu0VWa0YceeEwVHf
	 kQhS6yp5iIyaw==
MIME-Version: 1.0
Subject: Re: [PATCHv2] wifi: ath11k: Fix race condition with
 htt_ppdu_stats_info
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20221124071104.22506-1-quic_kathirve@quicinc.com>
References: <20221124071104.22506-1-quic_kathirve@quicinc.com>
To: Karthikeyan Kathirvel <quic_kathirve@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 Govindaraj Saminathan <quic_gsaminat@quicinc.com>,
 Karthikeyan Kathirvel <quic_kathirve@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <166937642084.32083.1451291046866929367.kvalo@kernel.org>
Date: Fri, 25 Nov 2022 11:40:22 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221125_034028_063082_CBDC9D5F 
X-CRM114-Status: GOOD (  11.38  )
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

Karthikeyan Kathirvel <quic_kathirve@quicinc.com> wrote:

> The below crash happens when running the traffic with multiple clients
> 
> Crash Signature : Unable to handle kernel paging request at
> virtual address ffffffd700970918 During the crash, PC points to
> "ieee80211_tx_rate_update+0x30/0x68 [mac80211]"
> LR points to "ath11k_dp_htt_htc_t2h_msg_handler+0x5a8/0x8a0 [ath11k]".
> 
> ppdu_stats_info is allocated and accessed from event callback via copy
> engine tasklet, this has a problem when freeing it from ath11k_mac_op_stop.
> 
> Add spin lock to protect htt_ppdu_stats_info and to avoid race condition
> when accessing it from ath11k_mac_op_stop.
> 
> Tested-on : IPQ8074 hw2.0 AHB WLAN.HK.2.7.0.1-01744-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Govindaraj Saminathan <quic_gsaminat@quicinc.com>
> Co-developed-by: Karthikeyan Kathirvel <quic_kathirve@quicinc.com>
> Signed-off-by: Karthikeyan Kathirvel <quic_kathirve@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

This patch added a new checkpatch warning:

drivers/net/wireless/ath/ath11k/dp_rx.c:1542: braces {} are not necessary for single statement blocks

I fixed it in the pending branch.

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20221124071104.22506-1-quic_kathirve@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
