Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FB5FC27C5F
	for <ath11k@archiver.kernel.org>; Mon, 10 Jun 2024 08:59:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oRoz4LDkt/UbxdzjLIfinSPySyM8LkCVNiK2R8l1I9w=; b=vitVq+o9fWog+u6WoM7NMKgfoQ
	GK1z3qZlRK7K5U0m0ytfDAYHOh6NZBlhBDdGj4uQkQcC1q/y+j+dEbeF+esCOi6HxCE8KLTMQhfKO
	d4U3vnbVLc0pvy+mRl3sauvftchSDNa+Y6dnaV1NLUSNfDmTCoHXVvdmz5/+sgHd2TaMNMHzsZ2al
	UJUXKVGd0Po3O6CdgYMPqusYePQfD7lO20fQk5Z24Yi4Nk2r25lBk4wkp376LPAVZm7/piz88FWpX
	KP8oRaNoj9QZDfg0zOOj4BAnB15pJ2GXsvzWoU49SjBbKc1YQTC9ZjeyTEonyxRNI4cCQTRgbJaY+
	l0RoTIzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGark-00000004LKO-0ewU;
	Mon, 10 Jun 2024 08:59:00 +0000
Received: from mgamail.intel.com ([192.198.163.13])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGarI-00000004Kn7-3FGZ;
	Mon, 10 Jun 2024 08:58:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718009912; x=1749545912;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=oIx+E7QQWhC/YdRYd5TEuDpoPJpROL8sRrH8nFOhCTw=;
  b=V1CfF+fO+clMJL4q7ejfy2Sg/ONrUj4OC8CfkgJaNQYI6ByC2L+vceRK
   r/w17WlWNy0naex/JKD43VV85jdHsN1av4JX2yeM1r20C5T9JHtyBLioI
   R63jLtGZLuJrV1cgLHjo0hGWZDZ6Gl8rm0itfj4BlvpXxcpvBl2gvOpa1
   9/3JgNHsAv0q5ouLUb7iqCpVazlyRR2cDZr9659vq/GFO0h+fZsIXP85R
   FcfN+drKqTuslzPn3zrhMYGt1TvRyUQT4Adp9Vr80QW1Qa/KnOvFtNHsr
   kdt/C7zrI8h/YstkknazmeQOFfMdi/u7Xmq3UAf+mBHtWdYW4thrpj/Qw
   g==;
X-CSE-ConnectionGUID: +iTdr6B6Q7y+RD/dN7SGbA==
X-CSE-MsgGUID: jRFtV2SQSwOcOp+hyIMXNg==
X-IronPort-AV: E=McAfee;i="6600,9927,11098"; a="17581557"
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; 
   d="scan'208";a="17581557"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2024 01:58:32 -0700
X-CSE-ConnectionGUID: whhgEdvaSOaveMThVGT9OA==
X-CSE-MsgGUID: 6IyxwBSmQmmkJc1+Qq2yEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; 
   d="scan'208";a="43432439"
Received: from unknown (HELO allen-box.sh.intel.com) ([10.239.159.127])
  by fmviesa003.fm.intel.com with ESMTP; 10 Jun 2024 01:58:28 -0700
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
Subject: [PATCH v3 03/21] vfio/type1: Use iommu_paging_domain_alloc()
Date: Mon, 10 Jun 2024 16:55:37 +0800
Message-Id: <20240610085555.88197-4-baolu.lu@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240610085555.88197-1-baolu.lu@linux.intel.com>
References: <20240610085555.88197-1-baolu.lu@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240610_015833_569281_6D82A9B0 
X-CRM114-Status: GOOD (  10.56  )
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

Replace iommu_domain_alloc() with iommu_paging_domain_alloc().

Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
---
 drivers/vfio/vfio_iommu_type1.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/vfio/vfio_iommu_type1.c b/drivers/vfio/vfio_iommu_type1.c
index 3a0218171cfa..0960699e7554 100644
--- a/drivers/vfio/vfio_iommu_type1.c
+++ b/drivers/vfio/vfio_iommu_type1.c
@@ -2135,7 +2135,7 @@ static int vfio_iommu_domain_alloc(struct device *dev, void *data)
 {
 	struct iommu_domain **domain = data;
 
-	*domain = iommu_domain_alloc(dev->bus);
+	*domain = iommu_paging_domain_alloc(dev);
 	return 1; /* Don't iterate */
 }
 
@@ -2192,11 +2192,12 @@ static int vfio_iommu_type1_attach_group(void *iommu_data,
 	 * us a representative device for the IOMMU API call. We don't actually
 	 * want to iterate beyond the first device (if any).
 	 */
-	ret = -EIO;
 	iommu_group_for_each_dev(iommu_group, &domain->domain,
 				 vfio_iommu_domain_alloc);
-	if (!domain->domain)
+	if (IS_ERR(domain->domain)) {
+		ret = PTR_ERR(domain->domain);
 		goto out_free_domain;
+	}
 
 	if (iommu->nesting) {
 		ret = iommu_enable_nesting(domain->domain);
-- 
2.34.1


