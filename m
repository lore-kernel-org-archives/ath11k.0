Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFF96C27C5E
	for <ath11k@archiver.kernel.org>; Mon, 10 Jun 2024 09:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fr40brAswpmGmhMFrh6KcZXgHsqtbEnyu9zzTU7pYWQ=; b=AX16jIgDx58N4qFXEId+xLcFIb
	urdJJjHWbS7ViA1cM/2NDyLpIMzEZqRXIz58ytyqTSI6KNtHfMDPCA50YOo0DvVqrWnNASBAu7++q
	B0/7d3Xq8nYL0DEEHmUppcZkmByITAO7REeR76ebJRHY/0LNEPJ2/Mt7t6dF/7rryNsc9n4ZRqpOT
	KegdC1R5cDFNkWOoXDNcTCsgHCcoLPrOwrbrzKJriYdUskGW2VuL0uIETgN7FhjHEuiMZXuY5oLid
	K3ZAk5SRyLFAtUr/YJC/nDh3QaAVNB5YuXue6Qo4AsmtdFejCwLGAuEE4qz2QrNgkluwGf1yTInFJ
	RenA5dHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGat6-00000004MRx-3RwM;
	Mon, 10 Jun 2024 09:00:24 +0000
Received: from mgamail.intel.com ([192.198.163.13])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGasP-00000004Kn7-34sN;
	Mon, 10 Jun 2024 08:59:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718009981; x=1749545981;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=kAf7SPBLso5zp49wUYubqs0YKzd/lC+tt+i0+MOxu64=;
  b=NyMBy0aSn3sfc/7rLw3U1IBGswSTs18eWsh1PtXEAe78yG0wzSp5KrKI
   AJCN2d1YSjYRf/77aDXtzPdkUbnHm2FmdWVCWFEPFJ2KGkD672VaMpp2h
   StiOzN1Wv8r/Yi/x+nRRIMFuKyDC6fh+Rc7URgt7XKEZcNdq1jEll1/OR
   0JpGRK9Vh/zksHkBQM9dt8KK3fey2o5R96HIh0vnISSXxujONVuVneg+3
   cxHg0yk0jT/LhfUcPIispS2XazIxV51hr534wO8+lDk44P50FcjmVmSOw
   ejUyu3LPbGMye5lBI4JUuU4n9OogQpPeNEzSg8qQeKkoJFB7iLEU5Gbgs
   g==;
X-CSE-ConnectionGUID: GPjLljBiQeSOcvK/K+6VAw==
X-CSE-MsgGUID: YxwbRtIOTuOqIG9CJGc2sA==
X-IronPort-AV: E=McAfee;i="6600,9927,11098"; a="17581892"
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; 
   d="scan'208";a="17581892"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2024 01:59:34 -0700
X-CSE-ConnectionGUID: IZUNZ8cdRjO1AyWUbBMniA==
X-CSE-MsgGUID: oS6yPYCwQEWB97mfMcpzCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; 
   d="scan'208";a="43432851"
Received: from unknown (HELO allen-box.sh.intel.com) ([10.239.159.127])
  by fmviesa003.fm.intel.com with ESMTP; 10 Jun 2024 01:59:30 -0700
From: Lu Baolu <baolu.lu@linux.intel.com>
To: Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Kevin Tian <kevin.tian@intel.com>
Cc: Yi Liu <yi.l.liu@intel.com>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Kalle Valo <kvalo@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Alex Williamson <alex.williamson@redhat.com>,
	mst@redhat.com,
	Jason Wang <jasowang@redhat.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Jeff Johnson <quic_jjohnson@quicinc.com>,
	ath10k@lists.infradead.org,
	ath11k@lists.infradead.org,
	iommu@lists.linux.dev,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Lu Baolu <baolu.lu@linux.intel.com>
Subject: [PATCH v3 15/21] iommu/vt-d: Add helper to allocate paging domain
Date: Mon, 10 Jun 2024 16:55:49 +0800
Message-Id: <20240610085555.88197-16-baolu.lu@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240610085555.88197-1-baolu.lu@linux.intel.com>
References: <20240610085555.88197-1-baolu.lu@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240610_015942_750489_8379B992 
X-CRM114-Status: GOOD (  16.04  )
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

The domain_alloc_user operation is currently implemented by allocating a
paging domain using iommu_domain_alloc(). This is because it needs to fully
initialize the domain before return. Add a helper to do this to avoid using
iommu_domain_alloc().

Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
---
 drivers/iommu/intel/iommu.c | 87 +++++++++++++++++++++++++++++++++----
 1 file changed, 78 insertions(+), 9 deletions(-)

diff --git a/drivers/iommu/intel/iommu.c b/drivers/iommu/intel/iommu.c
index 2e9811bf2a4e..ccde5f5972e4 100644
--- a/drivers/iommu/intel/iommu.c
+++ b/drivers/iommu/intel/iommu.c
@@ -3633,6 +3633,79 @@ static struct iommu_domain blocking_domain = {
 	}
 };
 
+static int iommu_superpage_capability(struct intel_iommu *iommu, bool first_stage)
+{
+	if (!intel_iommu_superpage)
+		return 0;
+
+	if (first_stage)
+		return cap_fl1gp_support(iommu->cap) ? 2 : 1;
+
+	return fls(cap_super_page_val(iommu->cap));
+}
+
+static struct dmar_domain *paging_domain_alloc(struct device *dev, bool first_stage)
+{
+	struct device_domain_info *info = dev_iommu_priv_get(dev);
+	struct intel_iommu *iommu = info->iommu;
+	struct dmar_domain *domain;
+	int addr_width;
+
+	domain = kzalloc(sizeof(*domain), GFP_KERNEL);
+	if (!domain)
+		return ERR_PTR(-ENOMEM);
+
+	INIT_LIST_HEAD(&domain->devices);
+	INIT_LIST_HEAD(&domain->dev_pasids);
+	INIT_LIST_HEAD(&domain->cache_tags);
+	spin_lock_init(&domain->lock);
+	spin_lock_init(&domain->cache_lock);
+	xa_init(&domain->iommu_array);
+
+	domain->nid = dev_to_node(dev);
+	domain->has_iotlb_device = info->ats_enabled;
+	domain->use_first_level = first_stage;
+
+	/* calculate the address width */
+	addr_width = agaw_to_width(iommu->agaw);
+	if (addr_width > cap_mgaw(iommu->cap))
+		addr_width = cap_mgaw(iommu->cap);
+	domain->gaw = addr_width;
+	domain->agaw = iommu->agaw;
+	domain->max_addr = __DOMAIN_MAX_ADDR(addr_width);
+
+	/* iommu memory access coherency */
+	domain->iommu_coherency = iommu_paging_structure_coherency(iommu);
+
+	/* pagesize bitmap */
+	domain->domain.pgsize_bitmap = SZ_4K;
+	domain->iommu_superpage = iommu_superpage_capability(iommu, first_stage);
+	domain->domain.pgsize_bitmap |= domain_super_pgsize_bitmap(domain);
+
+	/*
+	 * IOVA aperture: First-level translation restricts the input-address
+	 * to a canonical address (i.e., address bits 63:N have the same value
+	 * as address bit [N-1], where N is 48-bits with 4-level paging and
+	 * 57-bits with 5-level paging). Hence, skip bit [N-1].
+	 */
+	domain->domain.geometry.force_aperture = true;
+	domain->domain.geometry.aperture_start = 0;
+	if (first_stage)
+		domain->domain.geometry.aperture_end = __DOMAIN_MAX_ADDR(domain->gaw - 1);
+	else
+		domain->domain.geometry.aperture_end = __DOMAIN_MAX_ADDR(domain->gaw);
+
+	/* always allocate the top pgd */
+	domain->pgd = iommu_alloc_page_node(domain->nid, GFP_KERNEL);
+	if (!domain->pgd) {
+		kfree(domain);
+		return ERR_PTR(-ENOMEM);
+	}
+	domain_flush_cache(domain, domain->pgd, PAGE_SIZE);
+
+	return domain;
+}
+
 static struct iommu_domain *intel_iommu_domain_alloc(unsigned type)
 {
 	struct dmar_domain *dmar_domain;
@@ -3695,15 +3768,11 @@ intel_iommu_domain_alloc_user(struct device *dev, u32 flags,
 	if (user_data || (dirty_tracking && !ssads_supported(iommu)))
 		return ERR_PTR(-EOPNOTSUPP);
 
-	/*
-	 * domain_alloc_user op needs to fully initialize a domain before
-	 * return, so uses iommu_domain_alloc() here for simple.
-	 */
-	domain = iommu_domain_alloc(dev->bus);
-	if (!domain)
-		return ERR_PTR(-ENOMEM);
-
-	dmar_domain = to_dmar_domain(domain);
+	/* Do not use first stage for user domain translation. */
+	dmar_domain = paging_domain_alloc(dev, false);
+	if (IS_ERR(dmar_domain))
+		return ERR_CAST(dmar_domain);
+	domain = &dmar_domain->domain;
 
 	if (nested_parent) {
 		dmar_domain->nested_parent = true;
-- 
2.34.1


