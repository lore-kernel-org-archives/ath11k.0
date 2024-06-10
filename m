Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27C35C27C55
	for <ath11k@archiver.kernel.org>; Mon, 10 Jun 2024 10:02:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3RVIGexN1QEWlp04qJ5r/Sc6XYG5nucX3DQOszMb49c=; b=KR4ImocAFNBXDnqbjt3fhhlgVN
	NXBhJHDZc1HKHiKqIWS8k/K6DwNB2pSZLEbsi67CZWct/PJ8vhN+L2+ZCKtzzJBNQ4SXFJb2hA3+f
	xoSHMsmd9GpM4c4NYmacnyu2bhH5szxOVOg2FotOZVoTv6KzY2B/s36kjjRWP4rmDNZYvLU0uLZe3
	MzvtBDJftwGdiuK2aZNRqRSfa/abr19T8W+extq/CGaJWHChuVfMI6waM1vrWcZPV1DRvz+DQemXD
	WEBOdHY72k9mkoq5Opsh+iQfj4jIpCILXyjWfYe6TDRWYZT99FIn2IfgXm3U4tHPswg80Ae0PRwUN
	uFZEDBXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGbr4-00000004Xut-3jkK;
	Mon, 10 Jun 2024 10:02:22 +0000
Received: from mgamail.intel.com ([192.198.163.13])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGar9-00000004Kq1-0hl4;
	Mon, 10 Jun 2024 08:58:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718009903; x=1749545903;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=lO/IPmdUqOg04lYCYxFPmCNa0L0veD8icxIpi6zQo+o=;
  b=ErrazFQGKUipQlX/Y1m/4+WADwQ30ZDksI1JtSlMmOl+U5LN3t//2VOr
   J9bCcZC7dyclBaZ+CcuseM4kdSNpTiGrhIWMhRKycDbfMAabGSTnqqYND
   J0lFgDC0gDtfE8jpfSD3KPM4tFR3aK669CWL5+ejhpY+n/O0krKoKBGVl
   EctijAOvZ89TX8LcqAGhd0uCIAqd9NYRcx1xQmsZbSe6fiZgkp9OGU9tm
   Yl1DQuGyuOYaHUuc+f75ZysXtCat2LNbwRoi9PfpQ11v+st9+Har9Z+HF
   021WDUdSiCMtJgJ4m86AfkH0RmrHo6p3mocowlsKprqr/KuCoEa0gt5vS
   w==;
X-CSE-ConnectionGUID: O1NXuBn3SeyJOiSnX40YBA==
X-CSE-MsgGUID: LoTPxLd/TYajpi4/D2PmTg==
X-IronPort-AV: E=McAfee;i="6600,9927,11098"; a="17581515"
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; 
   d="scan'208";a="17581515"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2024 01:58:22 -0700
X-CSE-ConnectionGUID: T7ftFoB4QDSGxVb/F3iHkQ==
X-CSE-MsgGUID: ImRDR5fxSxuM0OMEzjzIVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; 
   d="scan'208";a="43432409"
Received: from unknown (HELO allen-box.sh.intel.com) ([10.239.159.127])
  by fmviesa003.fm.intel.com with ESMTP; 10 Jun 2024 01:58:17 -0700
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
Subject: [PATCH v3 01/21] iommu: Add iommu_paging_domain_alloc() interface
Date: Mon, 10 Jun 2024 16:55:35 +0800
Message-Id: <20240610085555.88197-2-baolu.lu@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240610085555.88197-1-baolu.lu@linux.intel.com>
References: <20240610085555.88197-1-baolu.lu@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240610_015824_013201_CDED4F45 
X-CRM114-Status: GOOD (  14.26  )
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

Commit <17de3f5fdd35> ("iommu: Retire bus ops") removes iommu ops from
bus. The iommu subsystem no longer relies on bus for operations. So the
bus parameter in iommu_domain_alloc() is no longer relevant.

Add a new interface named iommu_paging_domain_alloc(), which explicitly
indicates the allocation of a paging domain for DMA managed by a kernel
driver. The new interface takes a device pointer as its parameter, that
better aligns with the current iommu subsystem.

Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
---
 include/linux/iommu.h |  6 ++++++
 drivers/iommu/iommu.c | 20 ++++++++++++++++++++
 2 files changed, 26 insertions(+)

diff --git a/include/linux/iommu.h b/include/linux/iommu.h
index 7bc8dff7cf6d..46f1348f1f0a 100644
--- a/include/linux/iommu.h
+++ b/include/linux/iommu.h
@@ -780,6 +780,7 @@ extern bool iommu_present(const struct bus_type *bus);
 extern bool device_iommu_capable(struct device *dev, enum iommu_cap cap);
 extern bool iommu_group_has_isolated_msi(struct iommu_group *group);
 extern struct iommu_domain *iommu_domain_alloc(const struct bus_type *bus);
+struct iommu_domain *iommu_paging_domain_alloc(struct device *dev);
 extern void iommu_domain_free(struct iommu_domain *domain);
 extern int iommu_attach_device(struct iommu_domain *domain,
 			       struct device *dev);
@@ -1086,6 +1087,11 @@ static inline struct iommu_domain *iommu_domain_alloc(const struct bus_type *bus
 	return NULL;
 }
 
+static inline struct iommu_domain *iommu_paging_domain_alloc(struct device *dev)
+{
+	return ERR_PTR(-ENODEV);
+}
+
 static inline void iommu_domain_free(struct iommu_domain *domain)
 {
 }
diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index 9df7cc75c1bc..e03c71a34347 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -2016,6 +2016,10 @@ static int __iommu_domain_alloc_dev(struct device *dev, void *data)
 	return 0;
 }
 
+/*
+ * The iommu ops in bus has been retired. Do not use this interface in
+ * new drivers.
+ */
 struct iommu_domain *iommu_domain_alloc(const struct bus_type *bus)
 {
 	const struct iommu_ops *ops = NULL;
@@ -2032,6 +2036,22 @@ struct iommu_domain *iommu_domain_alloc(const struct bus_type *bus)
 }
 EXPORT_SYMBOL_GPL(iommu_domain_alloc);
 
+/**
+ * iommu_paging_domain_alloc() - Allocate a paging domain
+ * @dev: device for which the domain is allocated
+ *
+ * Allocate a paging domain which will be managed by a kernel driver. Return
+ * allocated domain if successful, or a ERR pointer for failure.
+ */
+struct iommu_domain *iommu_paging_domain_alloc(struct device *dev)
+{
+	if (!dev_has_iommu(dev))
+		return ERR_PTR(-ENODEV);
+
+	return __iommu_domain_alloc(dev_iommu_ops(dev), dev, IOMMU_DOMAIN_UNMANAGED);
+}
+EXPORT_SYMBOL_GPL(iommu_paging_domain_alloc);
+
 void iommu_domain_free(struct iommu_domain *domain)
 {
 	if (domain->type == IOMMU_DOMAIN_SVA)
-- 
2.34.1


