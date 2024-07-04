Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0ED7C30653
	for <ath11k@archiver.kernel.org>; Thu,  4 Jul 2024 14:30:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:Cc:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xzeNKLKtbxxolodsFDIgNPpr3BeYf1hEjVKpzzYRxSU=; b=n5diUG3LBUdc/NZ9WnGIhVzGz3
	+fl0LfdBc4m8jjmtpzxs4edp/6IBr+qlKAPc3iae/BuOh9XpIwwFdlMxpW4b27eXgFlBL7vmGRlYd
	Zw8U9OVpHZk9cty4khX0l0NWLKgkB5YA1WdK8W40uqG8nRJulK5Mbb3sYJRQi2Hja2qxUYcAXoArW
	Vy9KAKv+il3C4ii95UdFVS4Ip54OGpb2RpuNx1NsjcDu1Pz+9S7xi7W/TXxIQkX16wQcXS4h82YvA
	7Eoi/7Ls4XqZt6eAuZITzTjcky39vdHrJWAgrYRZnVlU75KOWKGllbgkWG5M9QvIcnHqostUH85Ae
	o7qVOYBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPNTN-0000000DT2T-2qql;
	Thu, 04 Jul 2024 14:30:09 +0000
Received: from mgamail.intel.com ([198.175.65.16])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPNTJ-0000000DT14-477D;
	Thu, 04 Jul 2024 14:30:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720103406; x=1751639406;
  h=message-id:date:mime-version:cc:subject:to:references:
   from:in-reply-to:content-transfer-encoding;
  bh=aqW9gjTA95ciOjlGYFV47g4h2LobgpnPA7tQQS4gw9E=;
  b=eOPRxkLqxU+xKf8qWLkav3lWYiBoliOWDCUSTIQwcLz3XF2cM0BP5mBW
   ho4hU2wTPRpPkITMEx/xiGiSd9mc3YVYW0Zfqz/4Mkwz0coqKjAc2JLlP
   hG/0Ah0QFwpCAhPjZTbvkODj5jn8z1Kao1/AGebK+nWDOV07YgFj4dcaq
   rRUCDf40n3HV807MqbWqoitvSqhJmjgZ7Dubz7K4iipdelgBY2ohoVGB8
   mr01NMwKcze9Rfv14InU+i1JpFKHobKEsCqguwmGukmNDiQfQvfeI6jan
   v9QlHDGADoIAVhj4V46zVqVEecljqOhkSFq6wCKSdWozxhz0uBFtGL1Ts
   A==;
X-CSE-ConnectionGUID: 8m1I+j6iTdGxThuHkmU3yg==
X-CSE-MsgGUID: xJ0mt1/kR/+JSYamBZQRZw==
X-IronPort-AV: E=McAfee;i="6700,10204,11123"; a="17522272"
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; 
   d="scan'208";a="17522272"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2024 07:25:00 -0700
X-CSE-ConnectionGUID: up9qyxkjSw6G1sTT0A8oiw==
X-CSE-MsgGUID: KX0cngofS5azc7TaKb/4Jg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; 
   d="scan'208";a="84166564"
Received: from blu2-mobl.ccr.corp.intel.com (HELO [10.125.248.220]) ([10.125.248.220])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2024 07:24:54 -0700
Message-ID: <f273615a-ebbd-488c-a301-e5cefc0715b1@linux.intel.com>
Date: Thu, 4 Jul 2024 22:24:52 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: baolu.lu@linux.intel.com, catalin.marinas@arm.com,
 kernel-team@android.com, Yi Liu <yi.l.liu@intel.com>,
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
Subject: Re: [PATCH v3 00/21] iommu: Refactoring domain allocation interface
To: Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>,
 Robin Murphy <robin.murphy@arm.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Kevin Tian <kevin.tian@intel.com>
References: <20240610085555.88197-1-baolu.lu@linux.intel.com>
 <172009858593.2049787.5200500337719932334.b4-ty@kernel.org>
Content-Language: en-US
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <172009858593.2049787.5200500337719932334.b4-ty@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240704_073006_268674_00EB729A 
X-CRM114-Status: UNSURE (   8.06  )
X-CRM114-Notice: Please train this message.
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

On 2024/7/4 22:18, Will Deacon wrote:
> On Mon, 10 Jun 2024 16:55:34 +0800, Lu Baolu wrote:
>> The IOMMU subsystem has undergone some changes, including the removal
>> of iommu_ops from the bus structure. Consequently, the existing domain
>> allocation interface, which relies on a bus type argument, is no longer
>> relevant:
>>
>>      struct iommu_domain *iommu_domain_alloc(struct bus_type *bus)
>>
>> [...]
> Applied a few of these to iommu (iommufd/paging-domain-alloc), thanks!
> 
> [01/21] iommu: Add iommu_paging_domain_alloc() interface
>          https://git.kernel.org/iommu/c/a27bf2743cb8
> [02/21] iommufd: Use iommu_paging_domain_alloc()
>          https://git.kernel.org/iommu/c/26a581606fab
> [03/21] vfio/type1: Use iommu_paging_domain_alloc()
>          https://git.kernel.org/iommu/c/60ffc4501722
> [04/21] vhost-vdpa: Use iommu_paging_domain_alloc()
>          https://git.kernel.org/iommu/c/9c159f6de1ae
> [05/21] drm/msm: Use iommu_paging_domain_alloc()
>          https://git.kernel.org/iommu/c/45acf35af200
> 
> [10/21] wifi: ath10k: Use iommu_paging_domain_alloc()
>          https://git.kernel.org/iommu/c/d5b7485588df
> [11/21] wifi: ath11k: Use iommu_paging_domain_alloc()
>          https://git.kernel.org/iommu/c/ef50d41fbf1c
> 
> [14/21] RDMA/usnic: Use iommu_paging_domain_alloc()
>          https://git.kernel.org/iommu/c/3b10f25704be
> [15/21] iommu/vt-d: Add helper to allocate paging domain
>          https://git.kernel.org/iommu/c/9e9ba576c259

Will, the patch [15/21] has already been included in my VT-d update pull
request. I have also addressed Yi's comment in that patch. So can you
please remove it from this branch?

Thanks,
baolu

