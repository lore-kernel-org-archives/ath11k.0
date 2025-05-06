Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFE14C3ABBE
	for <ath11k@archiver.kernel.org>; Tue,  6 May 2025 20:02:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O66T3TyLYoUscXjBSh5FaUeNQpl3nDLNM+wUgsfeogQ=; b=O7QmY3uTdbqsjMbFACK9t/J/sF
	HPZ2+0QvmTukyaIopFLyVFfh+PYx5ih4y0tFBHJGpEiA5PNvc69gcHIo2kCVzjXEI2S9t1hMI8Nwh
	8bL5ACm05JKWk8hlZUjL4lpNQs4DWveVIEKUjGKMUTEKhQP0tyhWVa1kLrY5V346nAQP/itsGo1hk
	OARGFVUeoKgnqIzSKuZjVUxzPfhdz+cLGbst+EOXtD/u75WUopPfp2iDZEM9OVw9lOreqAAfM8tI1
	pWT+zzvZSHWvwYI3FFTDxNSq1tisl3/yvBy1nLveuAHUm1OXv+koyoQfDCfv61O2Z9aoIDk538E8v
	rMUVx8ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCOUY-0000000DIlx-1z8N;
	Tue, 06 May 2025 20:02:14 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCKWT-0000000CXfF-3QjY
	for ath11k@lists.infradead.org;
	Tue, 06 May 2025 15:47:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 40D77629DE;
	Tue,  6 May 2025 15:47:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E769AC4CEE4;
	Tue,  6 May 2025 15:47:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746546476;
	bh=VlKeYwcQaeqU/yvMlvTPQlqWno4hH3XvK4blLqFDaIY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XprHAZDIFW5jMFgCdD77umcWmeVNB59N9749ubg+qebmsLWLOTaMt4cMlnI17m5gu
	 LkZL1VLjbNNSeKgld8nAEw+B1vmZLxkKTNK+mzcJBdpffbetRoatjnR3w2VTiyKvfy
	 RM1a7UN6Yne2h4jiAEkAa/LysnQznb1AFrJjqhjB9LXTYgliModHPd+2uNBvqe+P7g
	 ax6DwUvdDMDIyDaZkcXrTlyw+ZR0tKvjClQKM+mpy9Pw0QAuogthsFtbRfpmeAqZum
	 xGX/PYJFWp6hcYV3A4+ROuITLc1WGK6KJatbiZSkqHvp5Od1huDQl7ZQ8RCxQbiVPo
	 cDOxSuyMgOrPQ==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1uCKWP-000000008O4-02Ki;
	Tue, 06 May 2025 17:47:53 +0200
Date: Tue, 6 May 2025 17:47:53 +0200
From: Johan Hovold <johan@kernel.org>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: Miaoqing Pan <quic_miaoqing@quicinc.com>,
	Steev Klimaszewski <steev@kali.org>,
	Clayton Craft <clayton@craftyguy.net>,
	Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
	ath11k@lists.infradead.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] wifi: ath11k: fix ring-buffer corruption
Message-ID: <aBovKWIyPRWG-DSR@hovoldconsulting.com>
References: <20250321094916.19098-1-johan+linaro@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250321094916.19098-1-johan+linaro@kernel.org>
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

Hi Jeff,

On Fri, Mar 21, 2025 at 10:49:16AM +0100, Johan Hovold wrote:
> Users of the Lenovo ThinkPad X13s have reported that Wi-Fi sometimes
> breaks and the log fills up with errors like:
> 
>     ath11k_pci 0006:01:00.0: HTC Rx: insufficient length, got 1484, expected 1492
>     ath11k_pci 0006:01:00.0: HTC Rx: insufficient length, got 1460, expected 1484
> 
> which based on a quick look at the driver seemed to indicate some kind
> of ring-buffer corruption.
> 
> Miaoqing Pan tracked it down to the host seeing the updated destination
> ring head pointer before the updated descriptor, and the error handling
> for that in turn leaves the ring buffer in an inconsistent state.
> 
> Add the missing memory barrier to make sure that the descriptor is read
> after the head pointer to address the root cause of the corruption while
> fixing up the error handling in case there are ever any (ordering) bugs
> on the device side.
> 
> Note that the READ_ONCE() are only needed to avoid compiler mischief in
> case the ring-buffer helpers are ever inlined.
> 
> Tested-on: WCN6855 hw2.1 WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.41
> 
> Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=218623
> Link: https://lore.kernel.org/20250310010217.3845141-3-quic_miaoqing@quicinc.com
> Cc: Miaoqing Pan <quic_miaoqing@quicinc.com>
> Cc: stable@vger.kernel.org	# 5.6
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>

This patch fixes a long-standing issue that is hurting user of machines
like the X13s, but as far as I can tell it has not been picked up yet
(perhaps due to the temporary MAINTAINERS glitch that caused the
wireless list not to be CCed?).

Would be good to get this fixed in 6.15 and backported to stable.

The following related patches are also not yet in linux-next:

	https://lore.kernel.org/lkml/20250321145302.4775-1-johan+linaro@kernel.org/
	https://lore.kernel.org/lkml/20250321095219.19369-1-johan+linaro@kernel.org/

Note that I still intend to sending follow-on fixes for the other
missing barriers, but I'm a bit short on time at the moment.

Johan

