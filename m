Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1E23C05027
	for <ath11k@archiver.kernel.org>; Fri, 20 Jan 2023 19:28:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bDPPU6kPeS1Wq6FdHDNufiR1sFcr8eclLCZbVG0O+tU=; b=Bq/zMrlrSng/UD
	+5jzO3PNf1uHsbqMRZxI84VbvH/Ut6CvkStymVG5yoFnYn7Awr02DE15y0O7PYEMsOoqWe0NsauZB
	yO5A36tiH6CRClIjbtsPjEKhjZCPOJIRZ053x9ZzvhD4RUGz4s468B0n+t3mvgRc57KJY8Atvf9IT
	y5E7fvYY48eB15mWJQrOftUu26LaRDmgi55gYdqDcAq7QO6G27ybzto7TwgYlJJC8QaP7MOQjHiKo
	1uL8XSUxT8y1chBdVmwtuIyLn9axNqrM+LWrZxVGzeoezAYRZxkTN/6yb/P/cGYVGZ/QYoLatxiFK
	cDY5fSCX/jrSeYKbC8FA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIx3z-00C52v-VA; Fri, 20 Jan 2023 19:28:36 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIx3u-00C50a-EB; Fri, 20 Jan 2023 19:28:31 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CB11511FB;
	Fri, 20 Jan 2023 11:29:08 -0800 (PST)
Received: from [10.57.89.132] (unknown [10.57.89.132])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A6FF03F445;
	Fri, 20 Jan 2023 11:28:23 -0800 (PST)
Message-ID: <f24fcba7-2fcb-ed43-05da-60763dbb07bf@arm.com>
Date: Fri, 20 Jan 2023 19:28:19 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 04/10] iommu/dma: Use the gfp parameter in
 __iommu_dma_alloc_noncontiguous()
Content-Language: en-GB
To: Jason Gunthorpe <jgg@nvidia.com>, Lu Baolu <baolu.lu@linux.intel.com>,
 Joerg Roedel <joro@8bytes.org>, Kevin Tian <kevin.tian@intel.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>
Cc: Alex Williamson <alex.williamson@redhat.com>, ath10k@lists.infradead.org,
 ath11k@lists.infradead.org, Christian Borntraeger
 <borntraeger@linux.ibm.com>, dri-devel@lists.freedesktop.org,
 iommu@lists.linux.dev, kvm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-media@vger.kernel.org, linux-rdma@vger.kernel.org,
 linux-remoteproc@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-tegra@vger.kernel.org,
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
 nouveau@lists.freedesktop.org, Niklas Schnelle <schnelle@linux.ibm.com>,
 virtualization@lists.linux-foundation.org
References: <4-v2-ce66f632bd0d+484-iommu_map_gfp_jgg@nvidia.com>
From: Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <4-v2-ce66f632bd0d+484-iommu_map_gfp_jgg@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230120_112830_576966_CAF640BF 
X-CRM114-Status: GOOD (  19.58  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

On 2023-01-18 18:00, Jason Gunthorpe wrote:
> Change the sg_alloc_table_from_pages() allocation that was hardwired to
> GFP_KERNEL to use the gfp parameter like the other allocations in this
> function.
> 
> Auditing says this is never called from an atomic context, so it is safe
> as is, but reads wrong.

I think the point may have been that the sgtable metadata is a 
logically-distinct allocation from the buffer pages themselves. Much 
like the allocation of the pages array itself further down in 
__iommu_dma_alloc_pages(). I see these days it wouldn't be catastrophic 
to pass GFP_HIGHMEM into __get_free_page() via sg_kmalloc(), but still, 
allocating implementation-internal metadata with all the same 
constraints as a DMA buffer has just as much smell of wrong about it IMO.

I'd say the more confusing thing about this particular context is why 
we're using iommu_map_sg_atomic() further down - that seems to have been 
an oversight in 781ca2de89ba, since this particular path has never 
supported being called in atomic context.

Overall I'm starting to wonder if it might not be better to stick a "use 
GFP_KERNEL_ACCOUNT if you allocate" flag in the domain for any level of 
the API internals to pick up as appropriate, rather than propagate 
per-call gfp flags everywhere. As it stands we're still missing 
potential pagetable and other domain-related allocations by drivers in 
.attach_dev and even (in probably-shouldn't-really-happen cases) 
.unmap_pages...

Thanks,
Robin.

> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>   drivers/iommu/dma-iommu.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
> index 8c2788633c1766..e4bf1bb159f7c7 100644
> --- a/drivers/iommu/dma-iommu.c
> +++ b/drivers/iommu/dma-iommu.c
> @@ -822,7 +822,7 @@ static struct page **__iommu_dma_alloc_noncontiguous(struct device *dev,
>   	if (!iova)
>   		goto out_free_pages;
>   
> -	if (sg_alloc_table_from_pages(sgt, pages, count, 0, size, GFP_KERNEL))
> +	if (sg_alloc_table_from_pages(sgt, pages, count, 0, size, gfp))
>   		goto out_free_iova;
>   
>   	if (!(ioprot & IOMMU_CACHE)) {

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
