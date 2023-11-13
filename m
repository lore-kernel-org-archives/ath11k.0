Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7B37C4332F
	for <ath11k@archiver.kernel.org>; Mon, 13 Nov 2023 15:39:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lxUL2TMd+Sum9ulo13QbvlRctD6mudfV30PiuF3DPtU=; b=YLq0n7bY+tCTxT
	VGjq4vYV9VLc6uUDdVOxdz2wdMYx0gaI2qC0lDty0U7Br0y6jLP0cPmPAh1TrCGtA9vvv1PlFp+t6
	T+ZTREbCZXe9qNFxgFQA1nXzlCdR6VnoE3Ie/i8dMuqAqAtq41j9ovtvSv1u5CIKblC6JVYGadXqg
	36XtmwtA++v2Sh8rzWAHMwz+lk4Uny0D8TJ5NbMtEJDi5qVndB4prgKlos7YuVv14rhG1O1U5CKMT
	jtcdEGaNChX2PTwcJkEXgzi1O3ZCefFUVeoo0Zp9VUfHL05s2uVQKKn17u77cYzOJQ4NbwwbkfAVw
	kCKwHagTwus2OnZq9PQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r2Z2Y-00EFub-1U;
	Mon, 13 Nov 2023 15:39:54 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r2Z2U-00EFtR-2W
	for ath11k@lists.infradead.org;
	Mon, 13 Nov 2023 15:39:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 0FECFB80E63;
	Mon, 13 Nov 2023 15:39:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 819ABC433C8;
	Mon, 13 Nov 2023 15:39:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699889988;
	bh=QpKKoeuWC0pCYvMri4WMZVGR1FislkCUUfjedW52+8g=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=LsvJlJdUzEM6WzOqNWI4Zo+T3V6Tn0+dD9l/eeJd/4eQbO/JHIIWnzcEqQzFMEYJh
	 drgYzsaZwX2afmMpKIuJYwVswtSUikRDGIYv3jU+oxZmMOmLxDWeYBL9avIPBFY6xW
	 LHabIpBI3PF+GmXYDRJSmBqgI+a3uN3ovxkRjia32a1AzobJtH3t85XmdEEX7SpLRI
	 F4PEl1ZBU/h+p08gpeSVvaveQAdWUaxjNH3F5I52O8G1pD7N7LCv+kx/lKfsltOzk6
	 16yYx5wLsblR4BDgsSF8g2jqovG2bhRL0mnmNcG+zGs12ekN+rsDEIDBommPcK8Hyy
	 b9YTndGFwoC4w==
MIME-Version: 1.0
Subject: Re: [PATCH] wifi: ath11k: Defer on rproc_get failure
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20231027-ath11k-rproc-defer-v1-1-f6b6a812cd18@fairphone.com>
References: <20231027-ath11k-rproc-defer-v1-1-f6b6a812cd18@fairphone.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Jeff Johnson <quic_jjohnson@quicinc.com>,
 ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Luca Weiss <luca.weiss@fairphone.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <169988998449.3390604.914976926360003239.kvalo@kernel.org>
Date: Mon, 13 Nov 2023 15:39:46 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231113_073951_101147_DE4AB742 
X-CRM114-Status: GOOD (  10.43  )
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

Luca Weiss <luca.weiss@fairphone.com> wrote:

> If we already have gotten the rproc_handle (meaning the "qcom,rproc"
> property is defined in the devicetree), it's a valid state that the
> remoteproc module hasn't probed yet so we should defer probing instead
> of just failing to probe.
> 
> This resolves a race condition when the ath11k driver probes and fails
> before the wpss remoteproc driver has probed, like the following:
> 
>   [    6.232360] ath11k 17a10040.wifi: failed to get rproc
>   [    6.232366] ath11k 17a10040.wifi: failed to get rproc: -22
>   [    6.232478] ath11k: probe of 17a10040.wifi failed with error -22
>        ...
>   [    6.252415] remoteproc remoteproc2: 8a00000.remoteproc is available
>   [    6.252776] remoteproc remoteproc2: powering up 8a00000.remoteproc
>   [    6.252781] remoteproc remoteproc2: Booting fw image qcom/qcm6490/fairphone5/wpss.mdt, size 7188
> 
> So, defer the probe if we hit that so we can retry later once the wpss
> remoteproc is available.
> 
> Tested-on: WCN6750 hw1.0 AHB WLAN.MSL.1.0.1-01264-QCAMSLSWPLZ-1.37886.3
> 
> Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

2a3ec40b98b4 wifi: ath11k: Defer on rproc_get failure

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20231027-ath11k-rproc-defer-v1-1-f6b6a812cd18@fairphone.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
