Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12A06C433F5
	for <ath11k@archiver.kernel.org>; Wed,  8 Dec 2021 08:16:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CmqXGhDuRo5yzddYkXdpnwEWQvxnckdkxpPAHqqcsWE=; b=mKGAczZ5ad4ZZy
	WupQZcJRsCDqNARVJSa718YGd8bRYrvltLx1P+Xx3BR5c8YIgMlu+tm0T4/JnqCCIN2QdZdBN6Jwa
	nt6d+a6KVw5m0KhiCktKa71O3k1LuBU06sEjBHixRts4Efln2EwX6P2Up7O48E6fKAh13k55/bZsV
	bjnvFvfpRYWg+qWh5Rirx/LxKT3B3Y04csT6ds6kRfHzh7mdLAUEdWezHdQZUT1hAcuPMcMLII35V
	iYNJlzKfSRQgk8P7lVetpMF5kPma7bmIJB+UA5Vj4GeQsz3L5wn7BPXKejoS9U/JleRrkXVhdE4WU
	rWOXAXGdq7+nCr8SHq6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mus7V-00Bfs3-Tj; Wed, 08 Dec 2021 08:16:09 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mus7R-00Bfrh-WB
 for ath11k@lists.infradead.org; Wed, 08 Dec 2021 08:16:09 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 3B7E2CE2036;
 Wed,  8 Dec 2021 08:16:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77BC4C00446;
 Wed,  8 Dec 2021 08:16:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638951362;
 bh=+pJ69idPT2x0MrraTw0JqUqJMITFA71icoOACygOFZc=;
 h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
 b=lx+NxWZ1HoD3EJeucQCTE4eZTvpTly1DvG/ZMTUKBJDX3HqmZgAV2wS7E9E5NIj7A
 qoF5NT+zEeX71KCSexYz8Ai/1a6TfZDGNiLL4t9wv9Ql0+PteomTHgMt5JXEiH6IE8
 9RZP9Gt2rAtL0wopVpUk+6Tfo2oJdHdabWmwcZ8eC2PQtGBINPnoHE1sOqKPstG/r+
 3z8UUKKycKpVy69TrQu2SvSBe6rvzGXPABf3ZEfE540LRNW1ORKeOnfDdzSdKsLeOW
 rnJGBF4xOdGc02MeO/cdjxwX2epC+X5mSdd9Me7J1wE+57elk+adCqm/H5k8CP85o7
 /t9m2Wzu975fQ==
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: enable IEEE80211_HW_SINGLE_SCAN_ON_ALL_BANDS for
 WCN6855
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20211129101309.2931-1-quic_wgong@quicinc.com>
References: <20211129101309.2931-1-quic_wgong@quicinc.com>
To: Wen Gong <quic_wgong@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 <quic_wgong@quicinc.com>
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <163895135713.29041.4980786229647025244.kvalo@kernel.org>
Date: Wed,  8 Dec 2021 08:16:01 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211208_001606_267544_E8DB9421 
X-CRM114-Status: GOOD (  11.34  )
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

Wen Gong <quic_wgong@quicinc.com> wrote:

> Currently mac80211 will send 3 scan request for each scan of WCN6855,
> they are 2.4 GHz/5 GHz/6 GHz band scan. Firmware of WCN6855 will
> cache the RNR IE(Reduced Neighbor Report element) which exist in the
> beacon of 2.4 GHz/5 GHz of the AP which is co-located with 6 GHz,
> and then use the cache to scan in 6 GHz band scan if the 6 GHz scan
> is in the same scan with the 2.4 GHz/5 GHz band, this will helpful to
> search more AP of 6 GHz. Also it will decrease the time cost of scan
> because firmware will use dual-band scan for the 2.4 GHz/5 GHz, it
> means the 2.4 GHz and 5 GHz scans are doing simultaneously.
> 
> Set the flag IEEE80211_HW_SINGLE_SCAN_ON_ALL_BANDS for WCN6855 since
> it supports 2.4 GHz/5 GHz/6 GHz and it is single pdev which means
> all the 2.4 GHz/5 GHz/6 GHz exist in the same wiphy/ieee80211_hw.
> 
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-01720.1-QCAHSPSWPL_V1_V2_SILICONZ_LITE-1
> 
> Signed-off-by: Wen Gong <quic_wgong@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Sven, after your memory corruption fix is this good to take?

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20211129101309.2931-1-quic_wgong@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
