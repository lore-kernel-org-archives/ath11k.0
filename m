Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBF36C7619A
	for <ath11k@archiver.kernel.org>; Wed, 22 Mar 2023 11:55:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=17HYSwqfI4zZ/r6VWtOX7GlZDcHzzNTsA30teXZxcUU=; b=LOPkAQpkR7Expt
	8XbQftbsX/RmsIH3NNnWoqh47ChWjtrblkmWmN/ny2MiNmLR9W7jJqwJ/l7oOuvYgs7fXLK+R40Lg
	L+v3fDk2v7OTuiJzHKjdeLHapp9HK8OHxYOlmJ4KzfdbdQU+VdKR3cub0vM4Yocl26oQRxVzDYPgM
	nw/SDIaROCbojnvKzWvgjWIwYwRyIlzR45yifPvehGVTa2okaWFG1u//DnEh7qfq3FYucI/1aCK2u
	ruRMTqwwsJU0frWfM1PuZlwTR2bDrtIMrzTN9001IPSCcOeKmooXwuYY2viI6rlCHhXTGCG1Ao+qZ
	sCkjXrYgH43l19O1UusQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pex44-00FpqJ-1T;
	Wed, 22 Mar 2023 11:55:36 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pex41-00Fpp5-2i
	for ath11k@lists.infradead.org;
	Wed, 22 Mar 2023 11:55:35 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 4790BB81C0B;
	Wed, 22 Mar 2023 11:55:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22A90C433EF;
	Wed, 22 Mar 2023 11:55:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679486131;
	bh=n2WahzwgiovV5cbRnKKc02LtrVaWlWcnMCVFq52JbH8=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=EsXBPEI8D1ajdQ6EzJd1houYkDZVWvO8RVfu7ofCF6PuI5gYvsHgq78tep0zOXNUl
	 cFrsnalsWwmsvT7TDstbpxTxhraJTNc7OjbDKPtUPCB3fD09OQ7hZYxgN4Mk5Jsh2X
	 7AszjtUQEEeBbFH1fXZ7Jtz5S44yJwwFASzUOyqMdBjGNBx6jpJunby9DyZV0TNX14
	 oK4c72wjnbongt7sAiTCPKXg9k0LqihxJfKcWoFadx5SioLiPi61J6JgRTqc4/nSr3
	 0iyrDoFSldkQQPXBfpPsif4yGAwLCGCOYCEyCc6mPlB2rLJXZIv/6PWMqgi+1QGddC
	 zKPrShR3N6eWg==
MIME-Version: 1.0
Subject: Re: [PATCH v3] wifi: ath11k: Optimize 6 GHz scan time
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20230315112103.18426-1-quic_mpubbise@quicinc.com>
References: <20230315112103.18426-1-quic_mpubbise@quicinc.com>
To: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <167948612507.6445.2579526780286789940.kvalo@kernel.org>
Date: Wed, 22 Mar 2023 11:55:29 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230322_045534_099360_6381A6A8 
X-CRM114-Status: GOOD (  15.06  )
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

> Currently, time taken to scan all supported channels on WCN6750
> is ~8 seconds and connection time is almost 10 seconds. WCN6750
> supports three Wi-Fi bands (i.e., 2.4/5/6 GHz) and the numbers of
> channels for scan come around ~100 channels (default case).
> Since the chip doesn't have support for DBS (Dual Band Simultaneous),
> scans cannot be parallelized resulting in longer scan times.
> 
> Among the 100 odd channels, ~60 channels are in 6 GHz band. Therefore,
> optimizing the scan for 6 GHz channels will bring down the overall
> scan time.
> 
> WCN6750 firmware has support to scan a 6 GHz channel based on co-located
> AP information i.e., RNR IE which is found in the legacy 2.4/5 GHz scan
> results. When a scan request with all supported channel list is enqueued
> to the firmware, then based on WMI_SCAN_CHAN_FLAG_SCAN_ONLY_IF_RNR_FOUND
> scan channel flag, firmware will scan only those 6 GHz channels for which
> RNR IEs are found in the legacy scan results.
> 
> In the proposed design, based on NL80211_SCAN_FLAG_COLOCATED_6GHZ scan
> flag, driver will set the WMI_SCAN_CHAN_FLAG_SCAN_ONLY_IF_RNR_FOUND flag
> for non-PSC channels. Since there is high probability to find 6 GHz APs
> on PSC channels, these channels are always scanned. Only non-PSC channels
> are selectively scanned based on cached RNR information from the legacy
> scan results.
> 
> If NL80211_SCAN_FLAG_COLOCATED_6GHZ is not set in the scan flags,
> then scan will happen on all supported channels (default behavior).
> 
> With these optimizations, scan time is improved by 1.5-1.8 seconds on
> WCN6750. Similar savings have been observed on WCN6855.
> 
> Tested-on: WCN6750 hw1.0 AHB WLAN.MSL.1.0.1-00887-QCAMSLSWPLZ-1
> Tested-on: WCN6855 hw2.1 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.16
> 
> Signed-off-by: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

New warning:

drivers/net/wireless/ath/ath11k/mac.c:3827: line length of 91 exceeds 90 columns

I couldn't quickly figure out how to fix that, any ideas?

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20230315112103.18426-1-quic_mpubbise@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
