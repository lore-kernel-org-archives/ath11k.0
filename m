Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B0A1C27C5E
	for <ath11k@archiver.kernel.org>; Mon, 10 Jun 2024 09:01:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5ek3WjndrkPVVqVs+Khkx9kCDyWrz8uFyDTMb2PwVXo=; b=4y2EANonNEGNxN5Cmdye04hCxo
	0/0a2TH8ppFPIngapsy067Dc3d6Pcov0ABv1JfBpaEvEBFnCB0hbhMbE4BArA3g5t0goJIW/Qkc1S
	kfbTGHBvUF2z68Sb94WUot46/DoF1xsWLAL6zTRPJdkS5SRdXfqyxpmjZGn0h4g2H8dlKoxv6v8/G
	HedPz9NgydsN9mOr7pBAXsA66s+mXYn0ONLdyjD7iEzxNNRx8CEEXvJF6N6H2QEim6Kr2++RaIc1E
	244XuWS1icYUx8ukZWpXlLOyj7pst84Y5dJsMyxMlnZUWQmsR4xh5fQms/hSyA9pWyHuAbx1Hn+CO
	f0+6c9Og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGatf-00000004MsI-0zkN;
	Mon, 10 Jun 2024 09:00:59 +0000
Received: from mgamail.intel.com ([192.198.163.13])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGasm-00000004Kq1-36hX;
	Mon, 10 Jun 2024 09:00:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718010004; x=1749546004;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=I56l8aUrWEsOdJKWYfI6TJlpnl4t+tX3NQmfYGnyV7M=;
  b=lA6EN2413t4i38nzh3xoi3x0ic9qLyENaX/17k75qYvOhDKG4sI1C/nB
   uHuCC8kUkeWuIZ9ZQs8m4hzx/MT0SDSQTaa6I7Zw3pk37FJStTnmZxXxP
   lL4quKB3LqECSi9y6XR0J9Iap7gcbYCeQtOnxMMFe9jH9BiHwqrmL+j/e
   3kMOxIryiqAtsp9s1/n5C94PHxtHxCGIyq0gcFah0yKdy87EVm2GOOlA0
   NNf91+yGD5JJPihhfkxuUszzxnwoYazHv+YmAjxLLX1DLcoFlvB6g/KQ5
   C576nlmT21PL4l4pTsmEJWnouwsRRlGsCApVmwFqLOVstHZ+/KNvfefp/
   w==;
X-CSE-ConnectionGUID: fRPLpnXkTzKirUT8HF0L/w==
X-CSE-MsgGUID: Rh17V7cmRHeTELVkuguvHg==
X-IronPort-AV: E=McAfee;i="6600,9927,11098"; a="17581992"
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; 
   d="scan'208";a="17581992"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2024 01:59:56 -0700
X-CSE-ConnectionGUID: dSiXcWhERE2aZC+rbkMwCw==
X-CSE-MsgGUID: zTw8PCNRSvSb9YRaNVvOxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; 
   d="scan'208";a="43433094"
Received: from unknown (HELO allen-box.sh.intel.com) ([10.239.159.127])
  by fmviesa003.fm.intel.com with ESMTP; 10 Jun 2024 01:59:50 -0700
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
Subject: [PATCH v3 19/21] drm/tegra: Remove call to iommu_domain_alloc()
Date: Mon, 10 Jun 2024 16:55:53 +0800
Message-Id: <20240610085555.88197-20-baolu.lu@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240610085555.88197-1-baolu.lu@linux.intel.com>
References: <20240610085555.88197-1-baolu.lu@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240610_020005_165785_B2C48C5B 
X-CRM114-Status: GOOD (  15.31  )
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
the bus structure. The iommu subsystem no longer relies on bus for
operations. So iommu_domain_alloc() interface is no longer relevant.

Normally, iommu_paging_domain_alloc() could be a replacement for
iommu_domain_alloc() if the caller has the right device for IOMMU API
use. Unfortunately, this is not the case for this driver.

Iterate the devices on the platform bus and find a suitable device
whose device DMA is translated by an IOMMU. Then use this device to
allocate an iommu domain. The iommu subsystem prevents domains
allocated by one iommu driver from being attached to devices managed
by any different iommu driver.

Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
---
 drivers/gpu/drm/tegra/drm.c | 34 +++++++++++++++++++++++++---------
 1 file changed, 25 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
index 03d1c76aec2d..ee391f859992 100644
--- a/drivers/gpu/drm/tegra/drm.c
+++ b/drivers/gpu/drm/tegra/drm.c
@@ -1133,6 +1133,17 @@ static bool host1x_drm_wants_iommu(struct host1x_device *dev)
 	return domain != NULL;
 }
 
+static int iommu_mapped_device(struct device *dev, void *data)
+{
+	struct device **iommu_dev = data;
+
+	if (!device_iommu_mapped(dev))
+		return 0;
+
+	*iommu_dev = dev;
+	return 1;
+}
+
 static int host1x_drm_probe(struct host1x_device *dev)
 {
 	struct tegra_drm *tegra;
@@ -1149,16 +1160,21 @@ static int host1x_drm_probe(struct host1x_device *dev)
 		goto put;
 	}
 
-	if (host1x_drm_wants_iommu(dev) && iommu_present(&platform_bus_type)) {
-		tegra->domain = iommu_domain_alloc(&platform_bus_type);
-		if (!tegra->domain) {
-			err = -ENOMEM;
-			goto free;
+	if (host1x_drm_wants_iommu(dev)) {
+		struct device *iommu_dev = NULL;
+
+		bus_for_each_dev(&platform_bus_type, NULL, &iommu_dev, iommu_mapped_device);
+		if (iommu_dev) {
+			tegra->domain = iommu_paging_domain_alloc(iommu_dev);
+			if (IS_ERR(tegra->domain)) {
+				err = PTR_ERR(tegra->domain);
+				goto free;
+			}
+
+			err = iova_cache_get();
+			if (err < 0)
+				goto domain;
 		}
-
-		err = iova_cache_get();
-		if (err < 0)
-			goto domain;
 	}
 
 	mutex_init(&tegra->clients_lock);
-- 
2.34.1


