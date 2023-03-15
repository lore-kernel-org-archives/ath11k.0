Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86949C6FD1D
	for <ath11k@archiver.kernel.org>; Wed, 15 Mar 2023 10:29:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y4Dp6Qh4CcjPJvZHIF2WXi7n5xlCH9FkjKm9G+7d46Y=; b=fAmKOaCmrS9Qqz
	5XPwlHPvj02R7Okb9Bhw7LlArWuF+FEyX7TcgRom6Dxj/Vw0l/E2avt4NCskiDYhvDxKmxFkC+mXR
	DzOC5qMSWCibPfaA6pACpQW/OQzhTzuE0Kd8h5IErl/qGWQeP0JiAraZsbPPK8Nkf/eJuxHkHp5+C
	EpG551exUmjTDs9mlbq0QMXYsIfYDamzRQeBOK4VvK0tciqaCSwHGCZSTTL/ZlPu8rkSi+nuCpIW8
	/2hfsL2BVuC/pv1JS2rOAGq8yV1YzmBwUSXEale5cMYPEnKXBfuGwtUOYdhoQPe9LGUK3yRKEbIgN
	fE0Z1CMJKiaSTHhF/5eQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pcONk-00D46O-2x;
	Wed, 15 Mar 2023 10:29:20 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pcONh-00D45P-1f
	for ath11k@lists.infradead.org;
	Wed, 15 Mar 2023 10:29:19 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 2F0E1B81DA8;
	Wed, 15 Mar 2023 10:29:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8CB7C433EF;
	Wed, 15 Mar 2023 10:29:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678876154;
	bh=V7p7t5ulCDAthzV6TDbShJmfYxB0GhhSLmZWVhXqVRc=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=obBYlyFtmupp93eGT3dnpin4fgnjugR8oU/rc9NcaFcmi+fEhCyqPsUWLlFKIO1fg
	 WQEtyhOWfkP/lHnA2lRnUz0oko/9qhRIf1dkSfvF7FZCRL8mqQy0UiIx9XiGyHg4FW
	 LtN2VvXt2lcxtCONeB6p6PPrARVMRlFXGTjw7fQoGivQYK5t598MnLvjBwR5/cyYDu
	 9wxMd6fejD/ha4/BVdwsTSX7yPbZu6ntp06Y9kNsoASZy22bhwdXV2i0etC8IThXs/
	 Yb/SIf/77RFdCio/A3JuEJDT9N+gU+WVkKY0oKuyB8jMJveONcqbJuLOCnzMkrJdLE
	 K0fsxJDZs/bGw==
MIME-Version: 1.0
Subject: Re: [PATCH v2] wifi: ath11k: Optimize 6 GHz scan time
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20230309095220.1495-1-quic_mpubbise@quicinc.com>
References: <20230309095220.1495-1-quic_mpubbise@quicinc.com>
To: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <167887615209.12266.424609891131575348.kvalo@kernel.org>
Date: Wed, 15 Mar 2023 10:29:13 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230315_032917_713659_AA7D9F1E 
X-CRM114-Status: GOOD (  13.88  )
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

Fails to apply, please rebase.

error: patch failed: drivers/net/wireless/ath/ath11k/wmi.h:2097
error: drivers/net/wireless/ath/ath11k/wmi.h: patch does not apply
stg import: Diff does not apply cleanly

Patch set to Changes Requested.

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20230309095220.1495-1-quic_mpubbise@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
