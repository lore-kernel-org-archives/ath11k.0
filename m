Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFCFBC27C78
	for <ath11k@archiver.kernel.org>; Mon, 10 Jun 2024 10:02:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=COzfqyw/2J66lisWr44Prrk1Kh1uWon96ltvs/z5lPU=; b=T1Le2JQ9d97XG6euCKq6GYUF/x
	liN6VlUkj+HpLvbAn1OuBNsN3PvOP/t7kS/R03mp7yrpQPd/CnamkSCXDbrl6KE4fMUm29ze7i4dA
	am2H2cMbgN7Z3qbGDkwwlBv103H8bEzVPp01WSZ4ZOCHfzRazBCyeu3D/HBFT171iBAAN9PVfzMvi
	v+3PvYCD0qAQiOI4jxDQNPt7i6m9agzMk3pcVRrKmy4RIWHGDgoD4TvmBmbfjsV7r6IYghQDIgwe1
	Mg33T18YYHGmboX+STsTmECmbMNCR0AasQMXNjrHrra4aEBQSK/Gp4iWl3Ftp/ePu5RzM3IXwYG7y
	Y8VKBaLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGbrF-00000004Y1F-1AbI;
	Mon, 10 Jun 2024 10:02:33 +0000
Received: from mgamail.intel.com ([192.198.163.13])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGasH-00000004Kq1-0BbJ;
	Mon, 10 Jun 2024 08:59:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718009973; x=1749545973;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=sM71nWFg3cNfoT7YtYLr4iW7aTMKAR3F9pN2mUDECnk=;
  b=nVCDtvnTrpfEinQtMaXhcBC7oK0VkSRzJGiHxegbxY/lLg8kuVVTmSBw
   rQ8Gxq8HEp8VK0VxwgPsoRCQVRSV0WEXUQgp8HVLTrj/cEEO8nJFe+kMa
   +rarzyR+sovaj4GPCSBKn52ZGwfgdbFkiLIS7nqjoHmQ3o4Q+eJB/zBhN
   7tPOb12GMpguldeq2JEZJOi6D4E/rL1WzU7tEI8pjWOpQWvv9JqL53hwi
   KoUBUZ/ReUMnrZcBfsG++40jW5ZXRG0bfrnQzM4gKjBmRxfQP4ArZtdqL
   GzCODVwfaltfOkCgearbtDJ8iDVYkDfni4AIqt1WRchm0pH7Yn7DTsZJi
   w==;
X-CSE-ConnectionGUID: giUZPXovRSuPsjUrbT9E1Q==
X-CSE-MsgGUID: 8vVJLkvcSumt56c5bLhKrw==
X-IronPort-AV: E=McAfee;i="6600,9927,11098"; a="17581832"
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; 
   d="scan'208";a="17581832"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2024 01:59:23 -0700
X-CSE-ConnectionGUID: pUWAnATbSkmzoSbiD3n7dw==
X-CSE-MsgGUID: EcaT65n0R1+t1siUeF7hbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; 
   d="scan'208";a="43432756"
Received: from unknown (HELO allen-box.sh.intel.com) ([10.239.159.127])
  by fmviesa003.fm.intel.com with ESMTP; 10 Jun 2024 01:59:19 -0700
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
Subject: [PATCH v3 13/21] soc/fsl/qbman: Use iommu_paging_domain_alloc()
Date: Mon, 10 Jun 2024 16:55:47 +0800
Message-Id: <20240610085555.88197-14-baolu.lu@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240610085555.88197-1-baolu.lu@linux.intel.com>
References: <20240610085555.88197-1-baolu.lu@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240610_015933_435415_33BA6198 
X-CRM114-Status: UNSURE (   9.91  )
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

An iommu domain is allocated in portal_set_cpu() and is attached to
pcfg->dev in the same function.

Use iommu_paging_domain_alloc() to make it explicit.

Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
---
 drivers/soc/fsl/qbman/qman_portal.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/fsl/qbman/qman_portal.c b/drivers/soc/fsl/qbman/qman_portal.c
index e23b60618c1a..456ef5d5c199 100644
--- a/drivers/soc/fsl/qbman/qman_portal.c
+++ b/drivers/soc/fsl/qbman/qman_portal.c
@@ -48,9 +48,10 @@ static void portal_set_cpu(struct qm_portal_config *pcfg, int cpu)
 	struct device *dev = pcfg->dev;
 	int ret;
 
-	pcfg->iommu_domain = iommu_domain_alloc(&platform_bus_type);
-	if (!pcfg->iommu_domain) {
+	pcfg->iommu_domain = iommu_paging_domain_alloc(dev);
+	if (IS_ERR(pcfg->iommu_domain)) {
 		dev_err(dev, "%s(): iommu_domain_alloc() failed", __func__);
+		pcfg->iommu_domain = NULL;
 		goto no_iommu;
 	}
 	ret = fsl_pamu_configure_l1_stash(pcfg->iommu_domain, cpu);
-- 
2.34.1


