Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFBEFC27C5E
	for <ath11k@archiver.kernel.org>; Mon, 10 Jun 2024 09:01:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/7suDWynpK92ihsPjDQ8EaArNADXn0Ufh8fk2rdm2nU=; b=FHgvkO69gvNy4uih51Q/SaPSR5
	0UiJY0Ac9Zc1hL2IDRcguzcKJ7Seeob//ScMeIaf8YGeo20wjdghbt9n09/coSvQrIO+Ti0NVdrkV
	nEmeLsHKjlYPx0w5pGGvnGrJp6G21sI0FSXxxpBQmRmqCR7o/G67YV+aYpBpereXmPSvOWQgYgGso
	Hh4go6YpnOr4KGEc55PGrau7uaxGv3EhGPYPPuk1N4vhz7MBP7pgSeyruh5iZ1cefSa9mvqcMOXcn
	s4Lev8FDbovW+P4wQLCr/72crJYDbHYY99jafAt0zMFZqSnWuWswp6cfakM3Nju4d/gcNoFNq0+kc
	NpbHlsWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGatr-00000004N0y-2qQ7;
	Mon, 10 Jun 2024 09:01:11 +0000
Received: from mgamail.intel.com ([192.198.163.13])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGasu-00000004Ku8-39Yt;
	Mon, 10 Jun 2024 09:00:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718010012; x=1749546012;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=wZSuoOsJ9R3MpkLrN5YRfrHjzrkwvK0M+Y3osdd4hrI=;
  b=Su0eD0n/22aUvTE5HrzuXXlxSixjRWdKlDMcKFfBihgqkWwdH8Ui37uA
   OpOME3c8yYSKVrKg7NIGhNQ6FY8uYDF2Cy18l1Cv58jrCD8fUI1APpA3I
   7oxu8UWP8yGOejf5DIa8DjMUZZOLdgVn8jm3hA8pL70O7mfQ7zimb95Xy
   vNscKIDD5AsgFPb9H82T9G284lGoV5PKnRFHdRmdIIyYMjpRPo4PJ4HrN
   FC6DKVTHfhNvlfLhmvp6bPQ29bf530Gf1K89L6+EDc0HHcEwMf+FJDrIp
   Rj1Tgeyn1f+2n6yFCvLeZw2we0YOKoJa8s3FzjwLjL+ORZUcRE9z9QDMh
   g==;
X-CSE-ConnectionGUID: euagnbH6Rpi67yag9u4DRQ==
X-CSE-MsgGUID: WfXf7SAeTeGHSgmkQEDn7g==
X-IronPort-AV: E=McAfee;i="6600,9927,11098"; a="17582008"
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; 
   d="scan'208";a="17582008"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2024 02:00:01 -0700
X-CSE-ConnectionGUID: UkJOBireQRy0iFWBh3TABg==
X-CSE-MsgGUID: GPssOU7ITwWVQqYExEAGUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; 
   d="scan'208";a="43433176"
Received: from unknown (HELO allen-box.sh.intel.com) ([10.239.159.127])
  by fmviesa003.fm.intel.com with ESMTP; 10 Jun 2024 01:59:57 -0700
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
Subject: [PATCH v3 20/21] iommu: Remove iommu_present()
Date: Mon, 10 Jun 2024 16:55:54 +0800
Message-Id: <20240610085555.88197-21-baolu.lu@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240610085555.88197-1-baolu.lu@linux.intel.com>
References: <20240610085555.88197-1-baolu.lu@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240610_020013_247360_4C1A912A 
X-CRM114-Status: GOOD (  11.92  )
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

The iommu_present() interface is no longer used in the tree anymore.
Remove it to avoid dead code.

Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
---
 include/linux/iommu.h |  6 ------
 drivers/iommu/iommu.c | 25 -------------------------
 2 files changed, 31 deletions(-)

diff --git a/include/linux/iommu.h b/include/linux/iommu.h
index 46f1348f1f0a..ba0b27afc256 100644
--- a/include/linux/iommu.h
+++ b/include/linux/iommu.h
@@ -776,7 +776,6 @@ static inline void iommu_iotlb_gather_init(struct iommu_iotlb_gather *gather)
 }
 
 extern int bus_iommu_probe(const struct bus_type *bus);
-extern bool iommu_present(const struct bus_type *bus);
 extern bool device_iommu_capable(struct device *dev, enum iommu_cap cap);
 extern bool iommu_group_has_isolated_msi(struct iommu_group *group);
 extern struct iommu_domain *iommu_domain_alloc(const struct bus_type *bus);
@@ -1072,11 +1071,6 @@ struct iommu_iotlb_gather {};
 struct iommu_dirty_bitmap {};
 struct iommu_dirty_ops {};
 
-static inline bool iommu_present(const struct bus_type *bus)
-{
-	return false;
-}
-
 static inline bool device_iommu_capable(struct device *dev, enum iommu_cap cap)
 {
 	return false;
diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index e03c71a34347..c7ebdf96e4bc 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -1846,31 +1846,6 @@ int bus_iommu_probe(const struct bus_type *bus)
 	return 0;
 }
 
-/**
- * iommu_present() - make platform-specific assumptions about an IOMMU
- * @bus: bus to check
- *
- * Do not use this function. You want device_iommu_mapped() instead.
- *
- * Return: true if some IOMMU is present and aware of devices on the given bus;
- * in general it may not be the only IOMMU, and it may not have anything to do
- * with whatever device you are ultimately interested in.
- */
-bool iommu_present(const struct bus_type *bus)
-{
-	bool ret = false;
-
-	for (int i = 0; i < ARRAY_SIZE(iommu_buses); i++) {
-		if (iommu_buses[i] == bus) {
-			spin_lock(&iommu_device_lock);
-			ret = !list_empty(&iommu_device_list);
-			spin_unlock(&iommu_device_lock);
-		}
-	}
-	return ret;
-}
-EXPORT_SYMBOL_GPL(iommu_present);
-
 /**
  * device_iommu_capable() - check for a general IOMMU capability
  * @dev: device to which the capability would be relevant, if available
-- 
2.34.1


