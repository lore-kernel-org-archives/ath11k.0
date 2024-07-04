Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0E41C38150
	for <ath11k@archiver.kernel.org>; Thu,  4 Jul 2024 14:34:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ODwI17qSE2twGhPNyXj/kKa5tmg35shGk49G9znQA24=; b=VvwvZJvkS6SsL/07Kr5lYDYZjU
	KJtjrrm1842/4lhF7mAWz7TR54eG8xlX/Ruzi+ZZa/+V+8Yrhmn2iQ2GJRSNpl9BVsuWz/rCs8dOJ
	1C+jbmQK69pQaot68nuT3r4jHbmfHkvTsXQY4tHzfQ8aEUQuzctO5Z6AjPaysg47h+LJkhy8GHVNI
	/p0X/wL/DRNfdo3lI2phuGlmC8kog8RT6Hg/K1OUSzfnH/BGL+GSrNCzlC3Akv/ttsmGuMT7gWirx
	hgusMIvL/96IJc1WumnO+mKoZjQiAWmJzQ04NaSQ/sUl2jh3VxoK+IoeRuqEBBW2iNJDKEk79/YWr
	3uxOJMJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPNXP-0000000DTt2-2tRS;
	Thu, 04 Jul 2024 14:34:19 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPNXM-0000000DTrp-1zsw;
	Thu, 04 Jul 2024 14:34:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D31C1627A4;
	Thu,  4 Jul 2024 14:34:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3739DC3277B;
	Thu,  4 Jul 2024 14:34:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720103655;
	bh=mQ26XuKNbwYsAasmtsn6uZeQsrB0KeCZEr54v5bxmwk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IPESSHGT/s4FuGQk/uME6Qr6CIcUCFaXglWtxoxQhPNVROozdqJmGOJgv1gXNtAYw
	 anCv6CPGr3TK7rWm29/7pMqyXuSLyp3c9nW2PFi2lAxVULdnBDWXZxBCXnVshpPsGx
	 K8zEEK/uYH5boR7hO66R7bwcJ/9s+WjtFxAOtDaLC5OTJsfjcDDR+jhUNzbzlILahS
	 Bxb3wIq40PA1HUxutwJfUS/tlPiHFlPMDWuk2dn8efa5iG59EJUsQwX46gdTV4A/Qc
	 KCAAJtDkl2XLALvX2RvIvdFJw8kjBAY3xcw8WgH7VgDa1COJ+VWSJR+RcBjXtGbvA2
	 TvG6WoKAJCrhQ==
Date: Thu, 4 Jul 2024 15:34:07 +0100
From: Will Deacon <will@kernel.org>
To: Baolu Lu <baolu.lu@linux.intel.com>
Cc: Joerg Roedel <joro@8bytes.org>, Robin Murphy <robin.murphy@arm.com>,
	Jason Gunthorpe <jgg@ziepe.ca>, Kevin Tian <kevin.tian@intel.com>,
	catalin.marinas@arm.com, kernel-team@android.com,
	Yi Liu <yi.l.liu@intel.com>, David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>, Kalle Valo <kvalo@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Alex Williamson <alex.williamson@redhat.com>, mst@redhat.com,
	Jason Wang <jasowang@redhat.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Jeff Johnson <quic_jjohnson@quicinc.com>,
	ath10k@lists.infradead.org, ath11k@lists.infradead.org,
	iommu@lists.linux.dev, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 00/21] iommu: Refactoring domain allocation interface
Message-ID: <20240704143407.GA8211@willie-the-truck>
References: <20240610085555.88197-1-baolu.lu@linux.intel.com>
 <172009858593.2049787.5200500337719932334.b4-ty@kernel.org>
 <f273615a-ebbd-488c-a301-e5cefc0715b1@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f273615a-ebbd-488c-a301-e5cefc0715b1@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240704_073416_634481_C33850F6 
X-CRM114-Status: GOOD (  15.12  )
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

On Thu, Jul 04, 2024 at 10:24:52PM +0800, Baolu Lu wrote:
> On 2024/7/4 22:18, Will Deacon wrote:
> > On Mon, 10 Jun 2024 16:55:34 +0800, Lu Baolu wrote:
> > > The IOMMU subsystem has undergone some changes, including the removal
> > > of iommu_ops from the bus structure. Consequently, the existing domain
> > > allocation interface, which relies on a bus type argument, is no longer
> > > relevant:
> > > 
> > >      struct iommu_domain *iommu_domain_alloc(struct bus_type *bus)
> > > 
> > > [...]
> > Applied a few of these to iommu (iommufd/paging-domain-alloc), thanks!
> > 
> > [01/21] iommu: Add iommu_paging_domain_alloc() interface
> >          https://git.kernel.org/iommu/c/a27bf2743cb8
> > [02/21] iommufd: Use iommu_paging_domain_alloc()
> >          https://git.kernel.org/iommu/c/26a581606fab
> > [03/21] vfio/type1: Use iommu_paging_domain_alloc()
> >          https://git.kernel.org/iommu/c/60ffc4501722
> > [04/21] vhost-vdpa: Use iommu_paging_domain_alloc()
> >          https://git.kernel.org/iommu/c/9c159f6de1ae
> > [05/21] drm/msm: Use iommu_paging_domain_alloc()
> >          https://git.kernel.org/iommu/c/45acf35af200
> > 
> > [10/21] wifi: ath10k: Use iommu_paging_domain_alloc()
> >          https://git.kernel.org/iommu/c/d5b7485588df
> > [11/21] wifi: ath11k: Use iommu_paging_domain_alloc()
> >          https://git.kernel.org/iommu/c/ef50d41fbf1c
> > 
> > [14/21] RDMA/usnic: Use iommu_paging_domain_alloc()
> >          https://git.kernel.org/iommu/c/3b10f25704be
> > [15/21] iommu/vt-d: Add helper to allocate paging domain
> >          https://git.kernel.org/iommu/c/9e9ba576c259
> 
> Will, the patch [15/21] has already been included in my VT-d update pull
> request. I have also addressed Yi's comment in that patch. So can you
> please remove it from this branch?

Heh, was just about to say the same thing as I noticed when I was
re-creating 'next'. Yes, I'll drop it now. Since it's on the end, the
other SHAs will remain the same.

Sorry about that,

Will

