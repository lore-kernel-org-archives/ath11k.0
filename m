Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D353FC3271E
	for <ath11k@archiver.kernel.org>; Tue,  9 Jul 2024 02:13:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:Cc:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qUOHk3af/wiiU4x9YQj64B9av57lqo+pWVxtsBrHifE=; b=MnAmvKkIYXmxGDqi0Qbn5Z4jAG
	dotfINHIPwErb1mwWjl3IplQ+yoSo34upkX4CjUXUvmhtNft1NudFEf2PCAh7FKTc3rV8BRM5h9GN
	PcfMaYXjjet9FwxVukx8vOEAzWHIFTLCjuxwqKmkUSBl9maUEwABPIdkdXf9v2t3zUN/7HDD7teOx
	J7+zb1v/fPhn5GcpEktOuO7BEP8ChwAyUVK6WRWJPzmsER98in44sZS/fbYIAj9Csqw9wjp915vqr
	nl10P0COboLMfNPE9sRkZeGxRCCxFZkz9ifILDEFFKJBj82OFOwhcDhm1HL8TUyZ0/3OwyEI2sLue
	Zv+tletw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sR0MW-00000005cHY-2DAN;
	Tue, 09 Jul 2024 02:13:48 +0000
Received: from mgamail.intel.com ([198.175.65.17])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sR0MS-00000005cGd-1qkI;
	Tue, 09 Jul 2024 02:13:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720491225; x=1752027225;
  h=message-id:date:mime-version:cc:subject:to:references:
   from:in-reply-to:content-transfer-encoding;
  bh=qmfe73rj7uPFO7PgvLZEQThh1iERDsTRnG6XRTqML+c=;
  b=HsUQSRmdzBEzmKaAG+8UWsADR2+jOuPK9ERW5qJ1ehuOMdRvIl9IW9wv
   1uXWNplKsoAWdAG9XqFULFRjvh5I9U5wxkgyB4ThorwUJXeyMENa/K02m
   Atl1a3+//EgzOfsLh6i/iubNR5zn736Ir8C0th+pVVr39+41rghsAA2jD
   fwaK3qGhS5uYyUJI3aAIvvxjz9Pj8JhY6R+vdWyNZzBSPgbwHD45fKn3A
   IU8vI0WXMA2E1Ej8LEzCQAr8DmzcW3yJX3WgRC0UiwX9XxzlncPhYITNc
   Q0FcyIXHnhCJsXHwetX7PS/brsEhd6HOXgHutTibE8/yD8YU3DtglwQfY
   A==;
X-CSE-ConnectionGUID: waTf8ymGSUenzimr8DDg0A==
X-CSE-MsgGUID: 5SNQQnaER2KxRygkhA/FIA==
X-IronPort-AV: E=McAfee;i="6700,10204,11127"; a="17824234"
X-IronPort-AV: E=Sophos;i="6.09,193,1716274800"; 
   d="scan'208";a="17824234"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2024 19:13:42 -0700
X-CSE-ConnectionGUID: d5zKqABkTUWp4MS7DXpD4g==
X-CSE-MsgGUID: AnVNl0FXQyWJ4eCG+5lDGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,193,1716274800"; 
   d="scan'208";a="52100309"
Received: from unknown (HELO [10.239.159.127]) ([10.239.159.127])
  by fmviesa005.fm.intel.com with ESMTP; 08 Jul 2024 19:13:33 -0700
Message-ID: <56911ed6-d819-4882-9c7e-bfe4ba5826c2@linux.intel.com>
Date: Tue, 9 Jul 2024 10:10:44 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: baolu.lu@linux.intel.com, Joerg Roedel <joro@8bytes.org>,
 Robin Murphy <robin.murphy@arm.com>, Kevin Tian <kevin.tian@intel.com>,
 catalin.marinas@arm.com, kernel-team@android.com, Yi Liu
 <yi.l.liu@intel.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Kalle Valo <kvalo@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Alex Williamson <alex.williamson@redhat.com>, mst@redhat.com,
 Jason Wang <jasowang@redhat.com>, Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Mikko Perttunen <mperttunen@nvidia.com>,
 Jeff Johnson <quic_jjohnson@quicinc.com>, ath10k@lists.infradead.org,
 ath11k@lists.infradead.org, iommu@lists.linux.dev,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 00/21] iommu: Refactoring domain allocation interface
To: Jason Gunthorpe <jgg@ziepe.ca>, Will Deacon <will@kernel.org>
References: <20240610085555.88197-1-baolu.lu@linux.intel.com>
 <172009858593.2049787.5200500337719932334.b4-ty@kernel.org>
 <20240708163407.GC14050@ziepe.ca>
Content-Language: en-US
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <20240708163407.GC14050@ziepe.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240708_191344_568567_3A77D140 
X-CRM114-Status: GOOD (  12.25  )
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

On 7/9/24 12:34 AM, Jason Gunthorpe wrote:
> On Thu, Jul 04, 2024 at 03:18:56PM +0100, Will Deacon wrote:
>> On Mon, 10 Jun 2024 16:55:34 +0800, Lu Baolu wrote:
>>> The IOMMU subsystem has undergone some changes, including the removal
>>> of iommu_ops from the bus structure. Consequently, the existing domain
>>> allocation interface, which relies on a bus type argument, is no longer
>>> relevant:
>>>
>>>      struct iommu_domain *iommu_domain_alloc(struct bus_type *bus)
>>>
>>> [...]
>> Applied a few of these to iommu (iommufd/paging-domain-alloc), thanks!
>>
>> [01/21] iommu: Add iommu_paging_domain_alloc() interface
>>          https://git.kernel.org/iommu/c/a27bf2743cb8
>> [02/21] iommufd: Use iommu_paging_domain_alloc()
>>          https://git.kernel.org/iommu/c/26a581606fab
>> [03/21] vfio/type1: Use iommu_paging_domain_alloc()
>>          https://git.kernel.org/iommu/c/60ffc4501722
>> [04/21] vhost-vdpa: Use iommu_paging_domain_alloc()
>>          https://git.kernel.org/iommu/c/9c159f6de1ae
>> [05/21] drm/msm: Use iommu_paging_domain_alloc()
>>          https://git.kernel.org/iommu/c/45acf35af200
>>
>> [10/21] wifi: ath10k: Use iommu_paging_domain_alloc()
>>          https://git.kernel.org/iommu/c/d5b7485588df
>> [11/21] wifi: ath11k: Use iommu_paging_domain_alloc()
>>          https://git.kernel.org/iommu/c/ef50d41fbf1c
>>
>> [14/21] RDMA/usnic: Use iommu_paging_domain_alloc()
>>          https://git.kernel.org/iommu/c/3b10f25704be
>> [15/21] iommu/vt-d: Add helper to allocate paging domain
>>          https://git.kernel.org/iommu/c/9e9ba576c259
> Great, Lu can you please split the remaining by subsystem and try to
> get them to go through subsystem trees? Joerg can take the leftovers
> at rc6/7 or something like that so we can finish this.

Yes, sure. I guess I need to wait until 6.11-rc1 is out. It's a bit late
in the cycle for the subsystem trees to accept brand new changes.

> I think this is enough that Intel and AMD could now assert that dev is
> non-null?

Yes.

Thanks,
baolu

