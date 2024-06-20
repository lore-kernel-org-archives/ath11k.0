Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A266DC2BBCA
	for <ath11k@archiver.kernel.org>; Thu, 20 Jun 2024 01:17:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:Cc:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LM8Jbsxciqb5f7yGy4N7aYIswmToBHm/OC14p7bDwqA=; b=kCpt9ZN21fyl1aV/EGkkI3s0cS
	Z7YYoY46w9eGi/U9tBrMtROr9wVvkU4AmQkcwCGcsp506rfSzyI2DIlo890TuQ/mJ2k8Ij25N0ZCc
	KFXhdumzGnqGPK1gYmdNuGsjG8GWmfzR/2ADoJi4wp2sWnV3JLgOjrk++D2xeFq94tABOZi8x39Fx
	M4GA9QCKrimxxj2qDwlIfNRXjbcKItm/KAgamCqpU+tsi5xhSwapHUXiAkhtWyXBY2AqKmeIxjovN
	fFHlOSnAYzTeBp9q/Xg05zykNPP/LHYwKtikwnY4hc/XzdaMnVPKuw05P7dblPE44JJd3ngegC/Yg
	YPkIQq8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sK6QB-00000003EG1-0RZk;
	Thu, 20 Jun 2024 01:17:03 +0000
Received: from mgamail.intel.com ([192.198.163.13])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sK6Q6-00000003EEy-3BBA;
	Thu, 20 Jun 2024 01:17:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718846219; x=1750382219;
  h=message-id:date:mime-version:cc:subject:to:references:
   from:in-reply-to:content-transfer-encoding;
  bh=eiW/MHJ0UdJLO8lrujvSRMTbc/MZOUzVpzfOqp/fsrc=;
  b=S10A8DW6i4YGmQ8CNxFiO6S+b5d4JEIi2Hl2ICZihUmFxkhgZnQwtZxF
   Qu0zUGRoNt+vhELZEIq+8IkbyXBLJFNL2Y7YQJDVnBwKiWEYAKuzvEIqY
   N8l5IYO4l9+B+VOcAU5PEATxxoymHy2wJzp1f++zyPclZORzdtNA0AT8E
   NymEg377k1tj4YAxdTEVO48i4EKfqlm1QLJJWkRtOR/6NsW3avjJHz3i5
   BfVfgvmCI8/IBlLcwj/prYzVxAn7lhb4t1SGK5MFxsDmvRZug0i3Iohum
   CvDC2mwjNi/ZrIgWaEPoxyZ/jQIZVPdkZOCDCxPIPAzJmjTZlX6X6Gwbh
   A==;
X-CSE-ConnectionGUID: mehzVKw8TgylsEottieYtA==
X-CSE-MsgGUID: gd1mBe7gTLGMajiFgbhzzw==
X-IronPort-AV: E=McAfee;i="6700,10204,11108"; a="18715948"
X-IronPort-AV: E=Sophos;i="6.08,251,1712646000"; 
   d="scan'208";a="18715948"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2024 18:16:57 -0700
X-CSE-ConnectionGUID: DcNvoBqKR3Cd0EDhpcHZ6A==
X-CSE-MsgGUID: koFwvhFKTT2QQL91tyJqgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,251,1712646000"; 
   d="scan'208";a="73272079"
Received: from unknown (HELO [10.239.159.127]) ([10.239.159.127])
  by fmviesa001.fm.intel.com with ESMTP; 19 Jun 2024 18:16:52 -0700
Message-ID: <d4cfdc8f-12a4-44d1-85ee-ce05dd88b3e3@linux.intel.com>
Date: Thu, 20 Jun 2024 09:14:24 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: baolu.lu@linux.intel.com, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Kevin Tian <kevin.tian@intel.com>, Yi Liu <yi.l.liu@intel.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Kalle Valo <kvalo@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Alex Williamson <alex.williamson@redhat.com>, mst@redhat.com,
 Jason Wang <jasowang@redhat.com>, Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Mikko Perttunen <mperttunen@nvidia.com>,
 Jeff Johnson <quic_jjohnson@quicinc.com>, ath10k@lists.infradead.org,
 ath11k@lists.infradead.org, iommu@lists.linux.dev,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 15/21] iommu/vt-d: Add helper to allocate paging domain
To: Jason Gunthorpe <jgg@ziepe.ca>
References: <20240610085555.88197-1-baolu.lu@linux.intel.com>
 <20240610085555.88197-16-baolu.lu@linux.intel.com>
 <20240619151254.GI1091770@ziepe.ca>
Content-Language: en-US
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <20240619151254.GI1091770@ziepe.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240619_181659_095310_C4175870 
X-CRM114-Status: GOOD (  20.18  )
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

On 6/19/24 11:12 PM, Jason Gunthorpe wrote:
> On Mon, Jun 10, 2024 at 04:55:49PM +0800, Lu Baolu wrote:
>> The domain_alloc_user operation is currently implemented by allocating a
>> paging domain using iommu_domain_alloc(). This is because it needs to fully
>> initialize the domain before return. Add a helper to do this to avoid using
>> iommu_domain_alloc().
>>
>> Signed-off-by: Lu Baolu<baolu.lu@linux.intel.com>
>> ---
>>   drivers/iommu/intel/iommu.c | 87 +++++++++++++++++++++++++++++++++----
>>   1 file changed, 78 insertions(+), 9 deletions(-)
> It seems Ok, but I have some small thoughts
> 
> Reviewed-by: Jason Gunthorpe<jgg@nvidia.com>
> 
>> diff --git a/drivers/iommu/intel/iommu.c b/drivers/iommu/intel/iommu.c
>> index 2e9811bf2a4e..ccde5f5972e4 100644
>> --- a/drivers/iommu/intel/iommu.c
>> +++ b/drivers/iommu/intel/iommu.c
>> @@ -3633,6 +3633,79 @@ static struct iommu_domain blocking_domain = {
>>   	}
>>   };
>>   
>> +static int iommu_superpage_capability(struct intel_iommu *iommu, bool first_stage)
>> +{
>> +	if (!intel_iommu_superpage)
>> +		return 0;
>> +
>> +	if (first_stage)
>> +		return cap_fl1gp_support(iommu->cap) ? 2 : 1;
>> +
>> +	return fls(cap_super_page_val(iommu->cap));
>> +}
>> +
>> +static struct dmar_domain *paging_domain_alloc(struct device *dev, bool first_stage)
>> +{
>> +	struct device_domain_info *info = dev_iommu_priv_get(dev);
>> +	struct intel_iommu *iommu = info->iommu;
>> +	struct dmar_domain *domain;
>> +	int addr_width;
>> +
>> +	domain = kzalloc(sizeof(*domain), GFP_KERNEL);
>> +	if (!domain)
>> +		return ERR_PTR(-ENOMEM);
>> +
>> +	INIT_LIST_HEAD(&domain->devices);
>> +	INIT_LIST_HEAD(&domain->dev_pasids);
>> +	INIT_LIST_HEAD(&domain->cache_tags);
>> +	spin_lock_init(&domain->lock);
>> +	spin_lock_init(&domain->cache_lock);
>> +	xa_init(&domain->iommu_array);
> You should probably split more, with an 'alloc struct dmar_domain'
> function that can be used by SVA and others too.
> 
>> +	domain->nid = dev_to_node(dev);
>> +	domain->has_iotlb_device = info->ats_enabled;
>> +	domain->use_first_level = first_stage;
>> +
>> +	/* calculate the address width */
>> +	addr_width = agaw_to_width(iommu->agaw);
>> +	if (addr_width > cap_mgaw(iommu->cap))
>> +		addr_width = cap_mgaw(iommu->cap);
>> +	domain->gaw = addr_width;
>> +	domain->agaw = iommu->agaw;
>> +	domain->max_addr = __DOMAIN_MAX_ADDR(addr_width);
>> +
>> +	/* iommu memory access coherency */
>> +	domain->iommu_coherency = iommu_paging_structure_coherency(iommu);
>> +
>> +	/* pagesize bitmap */
>> +	domain->domain.pgsize_bitmap = SZ_4K;
>> +	domain->iommu_superpage = iommu_superpage_capability(iommu, first_stage);
>> +	domain->domain.pgsize_bitmap |= domain_super_pgsize_bitmap(domain);
> Then some of this stuff is really just paging only. Like
> SVA/identity/etc don't have pgszie and other things.

Yeah, good suggestion. I could do this in this series if it needs a new
version or in my next series which will add domain_alloc_paging for the
intel driver.

Best regards,
baolu

