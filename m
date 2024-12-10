Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 436E6E7717F
	for <ath11k@archiver.kernel.org>; Tue, 10 Dec 2024 04:11:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lhWEOMYkkktpW0W1n07VbgnbFMQPxaVKbb9htPEnhWY=; b=ttoX9VJdQ5kbxdoaDl76Mgivve
	0j39rXj2UmuTeMq7Iwt6AcYTBhLN9adC2TupJWXGnymHrr5dtajMFjK2CPUB2u1vweMoG/wI5ABX2
	jOnse4XwtKDf7yTOC/N29z6hkQVmPZCSkGAFJDfx6stDkGPbj4Cmlz5W1CvidAdwyHvE1dzNFDwJp
	sMLcG638UQhUanBt8DcmgCr7R1jCMlxK8PglxiJZ9L279jTPe6RlbPXSe9a946rJgjUD/G4DxTvCl
	jWWDot6CT6dfmUh+lxpDdNuPuXoEjf+B9g82kOCe1iT3S11Hu//D0ODbDJORrbGr2+dmSOKrHWJ1d
	tMbd6nyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKrb4-0000000AAc7-0DKT;
	Tue, 10 Dec 2024 04:11:42 +0000
Received: from verein.lst.de ([213.95.11.211])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKrb1-0000000AAbZ-1nqZ
	for ath11k@lists.infradead.org;
	Tue, 10 Dec 2024 04:11:41 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
	id 845B168C4E; Tue, 10 Dec 2024 05:11:33 +0100 (CET)
Date: Tue, 10 Dec 2024 05:11:33 +0100
From: Christoph Hellwig <hch@lst.de>
To: Tim Harvey <tharvey@gateworks.com>
Cc: Robin Murphy <robin.murphy@arm.com>, Christoph Hellwig <hch@lst.de>,
	Baochen Qiang <quic_bqiang@quicinc.com>, ath11k@lists.infradead.org,
	linux-wireless <linux-wireless@vger.kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>, iommu@lists.linux.dev,
	P Praneesh <ppranees@codeaurora.org>
Subject: Re: ath11k swiotlb buffer is full (on IMX8M with 4GiB DRAM)
Message-ID: <20241210041133.GA17116@lst.de>
References: <CAJ+vNU0EL3T+GyNAbVbGqYYQ5NM3h7cgAwqxxBMuZjh+-YQ3bA@mail.gmail.com> <1b2ea8b2-6fbe-4118-b6c6-742c8f0be476@quicinc.com> <CAJ+vNU1-OZ3y4p2L+zf64AiVtUv70yZNqkT20jTxyE0_gJb6Jg@mail.gmail.com> <0282be95-9094-4d49-b79e-4f7c976dad00@quicinc.com> <CAJ+vNU32EMHjtchJRb1sODBrUKG2vZW4ZEu1_F0+dCCEjCn7Dg@mail.gmail.com> <20241209081714.GA25363@lst.de> <593c0d63-d8fd-4439-a57a-97340212c197@arm.com> <CAJ+vNU2ypE_Mn_6iKCmf5LYk9Sth=ryWXyewc5MhOKK8VoAKCA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJ+vNU2ypE_Mn_6iKCmf5LYk9Sth=ryWXyewc5MhOKK8VoAKCA@mail.gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_201139_607518_EC6E422B 
X-CRM114-Status: GOOD (  20.13  )
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

On Mon, Dec 09, 2024 at 11:15:02AM -0800, Tim Harvey wrote:
> After a lot of back and forth and investigation this is due to the
> IMX8M SoC's not having an IOMMU thus swiotlb is being used and ath11k
> is requesting some buffers that are too large for swiotlb to provide.
> There is a specific patch which added the HAL_WBM2SW_RELEASE buffers
> to cacheable memory that could be reverted to fix this but the concern
> was that it would impact performance moving those buffers to
> non-cacheable memory (there are three ~1MiB buffers being allocated):
> commit d0e2523bfa9cb ("ath11k: allocate HAL_WBM2SW_RELEASE ring from
> cacheable memory").

The combination of "buffers" and "swiotlb" sounds like Robin was right
below. 

> The chain of events as best I can tell are:
> 
> commit 6452f0a3d565 ("ath11k: allocate dst ring descriptors from
> cacheable memory")
> - Nov 12 2021 (made it into Linux 5.17)
> - changes allocation of reo_dst rings to cacheable memory to allow
> cached descriptor access to optimize CPU usage
> - this is flawed because it uses virt_to_phys() to allocate cacheable
> memory which does not work on systems with an IOMMU enabled or using
> software IOMMU (swiotlb); this causes a kernel crash on client
> association

And this is where it started to take a wrong turn, that everyhing
later basically made worse.  If you have long living and potentially
large DMA allocations, you need to use dma_alloc_* interfaces.

5.17 already had dma_alloc_pages for quite a while which was and still is
the proper interface to use.  For much older kernel you'd be stuck
with dma_alloc_noncoherent or dma_alloc_attrs with the right flag,
but even that would have been much better.

