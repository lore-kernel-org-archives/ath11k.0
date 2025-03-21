Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2C61C36002
	for <ath11k@archiver.kernel.org>; Fri, 21 Mar 2025 09:51:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=opa0UQtaYg2Psgqhj3/f5g6zaZXb4/vevawfWhGDPeY=; b=P8uTlQTSQn29t6JWbcS1gC2Gda
	7Qq/HB01xLVMNk39f3J2BU1keS3RQFUOoqQL3fN0c5WKrBaqz1f60of3SCTlPfw453u6nDTnFVYLs
	3G+1WyGl1OPAom+wOI3egS70G8Zmvk3nt+gIgL0AKlaTCqJASkzyDZe3cfA7KJGuGdQU/LEpGVfiR
	7gZZBJmXv3EcRzCsnPcmQFIO4fowJPjJJP40CRegr+71waVHBGRAbns8fIvRhfS/L65JR3lP82B0f
	OtgMyvBHKmmAzdwCBWIryy8ML5ZIKVVWwiLrjuM8xfbQNmpUh5/EMGLiHLWMX6fjrFbwve4qGEJiY
	935GlNKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvZ2T-0000000ERBA-337L;
	Fri, 21 Mar 2025 09:51:41 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvYmS-0000000ENXc-11EO
	for ath11k@lists.infradead.org;
	Fri, 21 Mar 2025 09:35:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3A4235C6D65;
	Fri, 21 Mar 2025 09:32:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8AFCC4CEE8;
	Fri, 21 Mar 2025 09:35:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742549705;
	bh=5Rf2fkdPmUr9DP2uzn0oLDH5fnH7e7xxgEWlMFSo2vM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DrGZ0FQHGOI8f8hAaAKApzJWrfm4mdzxNRkBtqujwzmcFrirGzZWMizi8Ko4kxs+e
	 eD+gutlK9mmaQUorBm1hPftOfrAVfJyjF5hSJSzQqwpaLCgqRXrLJjmDyGVJjw/caM
	 soRD1FZ4y60qd0oss7k/IHxk7qeSLm2J6q5ykLS7yVA8SW4SI62bY3hChnCeyPh0VL
	 WbAZQQMIRce1/68LEgJP39zp01eZ13UMNfnEUK6625FBglY0T9QQBrScsOSeFKIyUS
	 T3r8Wi42Utooa61Dgf5o0oPxUy3Kz+8L/OewZdAcLOcBIfbjCTpAQJG+948DRdCN4E
	 ghwzrAcySpgXg==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1tvYmQ-000000003Fm-3GzD;
	Fri, 21 Mar 2025 10:35:07 +0100
Date: Fri, 21 Mar 2025 10:35:06 +0100
From: Johan Hovold <johan@kernel.org>
To: Miaoqing Pan <quic_miaoqing@quicinc.com>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
	ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org, johan+linaro@kernel.org
Subject: Re: [PATCH v2 ath-next 2/2] wifi: ath11k: fix HTC rx insufficient
 length
Message-ID: <Z90yyrZcORhJJgNU@hovoldconsulting.com>
References: <Z9G5zEOcTdGKm7Ei@hovoldconsulting.com>
 <8ea7fe7c-7b4d-4a6f-ae03-b9ca127c23f8@quicinc.com>
 <Z9METTzUJe9yqVEI@hovoldconsulting.com>
 <b1c79589-4fcd-4630-9551-a620087e0c23@quicinc.com>
 <Z9PjjDFBuSJ7exVj@hovoldconsulting.com>
 <ecfe850c-b263-4bee-b888-c34178e690fc@quicinc.com>
 <Z9gd9Aw5Bug8IKSV@hovoldconsulting.com>
 <f30cf771-a9cd-4d8f-8d10-1640afd33c23@quicinc.com>
 <Z9mwn3GzpPPZSiTG@hovoldconsulting.com>
 <a8fc9f07-013c-4e31-9d9e-46e042d81dbf@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a8fc9f07-013c-4e31-9d9e-46e042d81dbf@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250321_023508_365175_7D0B815C 
X-CRM114-Status: GOOD (  35.22  )
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

On Wed, Mar 19, 2025 at 02:47:12PM +0800, Miaoqing Pan wrote:
> On 3/19/2025 1:42 AM, Johan Hovold wrote:

> > It could if the CPU observes the updates out of order due to the missing
> > barrier. The driver could be processing an earlier interrupt when the
> > new descriptor is added and head pointer updated. If for example the CPU
> > speculatively fetches the descriptor before the head pointer is updated,
> > then the descriptor length may be zero when the CPU sees the updated
> > head pointer.
> 
> Sorry, I still think this situation won't happen. Please see the 
> following code.
> 
> ath11k_hal_srng_access_begin(ab, srng);
>    => srng->u.dst_ring.cached_hp = *srng->u.dst_ring.hp_addr;
> desc = ath11k_hal_srng_dst_get_next_entry(ab, srng);
>    => if (srng->u.dst_ring.tp == srng->u.dst_ring.cached_hp) return NULL;
> //dma_rmb();
> *nbytes = ath11k_hal_ce_dst_status_get_length(desc);
> 
> If the condition 'srng->u.dst_ring.tp == srng->u.dst_ring.cached_hp' is 
> true, the descriptor retrieval fails.

The CPU can still speculate that this condition will be false and load
the descriptor.

If the speculation later turns out to be correct, then the descriptor
may have stale values from before the head pointer was updated.

> > This seems to be what is happening on the X13s since adding the memory
> > barrier makes the zero-length descriptors go away.
> 
> Hmm, it is indeed a bit strange. Could it be that dma_rmb() introduces 
> some delay ?

It's only expected since you must use memory barriers on weakly ordered
architectures like aarch64 to guarantee the ordering.
 
> >> The Copy Engine hardware module copies the metadata to the Status
> >> Descriptor after the DMA is complete, then updates the HP to trigger an
> >> interrupt. I think there might be some issues in this process, such as
> >> the lack of a wmb instruction after the copy is complete, causing the HP
> >> to be updated first.
> > 
> > Yeah, possibly. At least it seems there are more issues than the missing
> > barrier on the machines you test.
> >   
> >>> Now obviously there are further issues in your system, which we should
> >>> make sure we understand before adding workarounds to the driver.
> >>>
> >>> Do you have a pointer to the downstream kernel sources you are testing
> >>> with? Or even better, can you reproduce the issue with mainline after
> >>> adding the PCIe patches that were posted to the lists for these
> >>> platforms?
> >>>
> >> https://github.com/qualcomm-linux/meta-qcom-hwe/blob/scarthgap/recipes-kernel/linux/linux-qcom-base_6.6.bb
> > 
> > Thanks for the pointer. That's a lot of out-of-tree patches on top of
> > stable so not that easy to check the state of the resulting tree.
> 
> Yes, but there are only a few patches for ath11k.

Sure, but there are other components that come into play here such as
the PCIe controller driver.

A colleague of yours recently submitted an updated patch that overrides
the no_snoop bit for qcs8300:

	https://lore.kernel.org/lkml/20250318053836.tievnd5ohzl7bmox@thinkpad/

but that flag appears not to be set in your downstream tree:

	https://github.com/qualcomm-linux/meta-qcom-hwe/blob/scarthgap/recipes-kernel/linux/linux-qcom-base-6.6/drivers/qcs8300/0004-PCI-qcom-Add-QCS8300-PCIe-support.patch

Something like that may prevent a cached descriptor from being
invalidated when the controller updates it.

Similarly, the PCIe controllers are marked as dma-coherent in your
devicetrees. A misconfiguration there could also cause problems.

I suggest we merge my fix that adds the missing memory barrier, and
which users have now been testing for a week without hitting the
corruption (which they used to see several times a day).

Then we can continue to track down why you are having coherency issues
on qcs615 and qcs8300. You really want to make sure that that is fixed
properly as it may lead to subtle bugs elsewhere too.

Johan

