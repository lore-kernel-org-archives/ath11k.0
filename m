Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECC45CF043B
	for <ath11k@archiver.kernel.org>; Wed,  9 Oct 2024 04:16:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c43TJbsGEiI2vCVL4KRiRuZs3pWbqT3Gn91q/Mfi0Hk=; b=y/KT2WUfp0JOzdIYM8tgRtLrTN
	QbJ5gxQQqBGVtjnJMAXqKzt2ZYbjC8lxCxY2eXCvzcghuTqxtaCh7hK92yTL9cD+76bqLcfPgcV1t
	1MW42zX8Us6U97FvaDIcj/6I3yuiH/zv2FVivjHWZIerXk6ksy71I+b5Zpae4K/e2+ZAy3rjGtGcn
	2x9u/N2uEgLNODd2pEoLf/YRuZQWSrz886Z8Voxos28NoahlScwzcd7VOzfVNvOVP6v1amE429yKw
	LPeTuvm1UQYI21C6bTBV8t7IIiyT8lahzT+G/R64hajBkSwpldGYAsKSlThblFQ5ThWwkh82cYLUM
	FIaafc8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syO8B-00000007qzl-0i4Q;
	Wed, 09 Oct 2024 04:16:59 +0000
Received: from mgamail.intel.com ([192.198.163.7])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syO84-00000007qlY-2SgJ;
	Wed, 09 Oct 2024 04:16:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728447413; x=1759983413;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=F/5wX0qVJczRA+WzF+0h7RDUQ6Vlg1N7b7JHM6GAw3Q=;
  b=YyuTNNC/EA6muneZ0r2BPaS8psAsX1xzrSoJk25hloEOSBJdXNx0WFX5
   hL5133PWC2yuqmgcrg2DRsnu8CIxcHL4mZim8TbJxy4MFX0hHyY5yEOVy
   VocY0jjzvqj0Pdj45zOa3TwEewqZOr+V/G89ylArTA9GNvA/TNNhrE1IK
   +H0Rw+6bB8y0YHZ9RNI6Ri1CdUitZjHY1eVsJ38BLis+w4J7wBDD2okfp
   NEl+ggkHM8NWzIdtpWj4XNuZeyPm4ZQ86uo73xrROWvt6pmZMRf1ihNCa
   TboyM8v5YYcwUu/4WmfP/OAiMdEivNR6DxefHD6OX1NR+efcWjuWemBq9
   g==;
X-CSE-ConnectionGUID: BBXs4sCASZGeJrIhsmcN8A==
X-CSE-MsgGUID: bv6TrDR/QMi3z/ShfeIQnA==
X-IronPort-AV: E=McAfee;i="6700,10204,11219"; a="53127032"
X-IronPort-AV: E=Sophos;i="6.11,189,1725346800"; 
   d="scan'208";a="53127032"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2024 21:16:52 -0700
X-CSE-ConnectionGUID: zKivlZtaRWO54jYgwlDlNw==
X-CSE-MsgGUID: hSstibpsRNKP9XCVIJnPUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,189,1725346800"; 
   d="scan'208";a="80095760"
Received: from allen-box.sh.intel.com ([10.239.159.127])
  by fmviesa003.fm.intel.com with ESMTP; 08 Oct 2024 21:16:47 -0700
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
	Lyude Paul <lyude@redhat.com>,
	Beleswar Padhi <b-padhi@ti.com>,
	iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Lu Baolu <baolu.lu@linux.intel.com>,
	Jason Gunthorpe <jgg@nvidia.com>
Subject: [PATCH v4 4/4] iommu: Remove iommu_domain_alloc()
Date: Wed,  9 Oct 2024 12:11:47 +0800
Message-ID: <20241009041147.28391-5-baolu.lu@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241009041147.28391-1-baolu.lu@linux.intel.com>
References: <20241009041147.28391-1-baolu.lu@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241008_211652_771320_D6342BB0 
X-CRM114-Status: GOOD (  10.96  )
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

The iommu_domain_alloc() interface is no longer used in the tree anymore.
Remove it to avoid dead code.

There is increasing demand for supporting multiple IOMMU drivers, and this
is the last bus-based thing standing in the way of that.

Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
---
 include/linux/iommu.h |  6 ------
 drivers/iommu/iommu.c | 36 ------------------------------------
 2 files changed, 42 deletions(-)

diff --git a/include/linux/iommu.h b/include/linux/iommu.h
index bd722f473635..6d809f6e6c8d 100644
--- a/include/linux/iommu.h
+++ b/include/linux/iommu.h
@@ -788,7 +788,6 @@ extern int bus_iommu_probe(const struct bus_type *bus);
 extern bool iommu_present(const struct bus_type *bus);
 extern bool device_iommu_capable(struct device *dev, enum iommu_cap cap);
 extern bool iommu_group_has_isolated_msi(struct iommu_group *group);
-extern struct iommu_domain *iommu_domain_alloc(const struct bus_type *bus);
 struct iommu_domain *iommu_paging_domain_alloc(struct device *dev);
 extern void iommu_domain_free(struct iommu_domain *domain);
 extern int iommu_attach_device(struct iommu_domain *domain,
@@ -1091,11 +1090,6 @@ static inline bool device_iommu_capable(struct device *dev, enum iommu_cap cap)
 	return false;
 }
 
-static inline struct iommu_domain *iommu_domain_alloc(const struct bus_type *bus)
-{
-	return NULL;
-}
-
 static inline struct iommu_domain *iommu_paging_domain_alloc(struct device *dev)
 {
 	return ERR_PTR(-ENODEV);
diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index 83c8e617a2c5..521471706400 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -1994,42 +1994,6 @@ __iommu_group_domain_alloc(struct iommu_group *group, unsigned int type)
 	return __iommu_domain_alloc(dev_iommu_ops(dev), dev, type);
 }
 
-static int __iommu_domain_alloc_dev(struct device *dev, void *data)
-{
-	const struct iommu_ops **ops = data;
-
-	if (!dev_has_iommu(dev))
-		return 0;
-
-	if (WARN_ONCE(*ops && *ops != dev_iommu_ops(dev),
-		      "Multiple IOMMU drivers present for bus %s, which the public IOMMU API can't fully support yet. You will still need to disable one or more for this to work, sorry!\n",
-		      dev_bus_name(dev)))
-		return -EBUSY;
-
-	*ops = dev_iommu_ops(dev);
-	return 0;
-}
-
-/*
- * The iommu ops in bus has been retired. Do not use this interface in
- * new drivers.
- */
-struct iommu_domain *iommu_domain_alloc(const struct bus_type *bus)
-{
-	const struct iommu_ops *ops = NULL;
-	int err = bus_for_each_dev(bus, NULL, &ops, __iommu_domain_alloc_dev);
-	struct iommu_domain *domain;
-
-	if (err || !ops)
-		return NULL;
-
-	domain = __iommu_domain_alloc(ops, NULL, IOMMU_DOMAIN_UNMANAGED);
-	if (IS_ERR(domain))
-		return NULL;
-	return domain;
-}
-EXPORT_SYMBOL_GPL(iommu_domain_alloc);
-
 /**
  * iommu_paging_domain_alloc() - Allocate a paging domain
  * @dev: device for which the domain is allocated
-- 
2.43.0


