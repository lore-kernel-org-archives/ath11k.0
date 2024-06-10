Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C118C27C5E
	for <ath11k@archiver.kernel.org>; Mon, 10 Jun 2024 08:58:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qdii365A3dfDth8bMIN65S0AN4mTMUmZMSOhFfC0V8A=; b=FjUp8J5YjbwyZv5BNyswJ1wwQt
	hh5ate+wDiiFIyffVi7I2r1nHUwMRUfO5y+YhB2db5b2mkbFsOK566C4bmjO7Xp3s7OSHqlApjc/l
	a+bGdBEl0Mw/wutXvOA0l6ToW3Y8sF4sLZ4UCSdUdYCPpnxF8Y67TrMrWCU3/jb3sX3q8yvyNXkdd
	jn95MoMpAUrZTksbU2tta22ymdZ9JfnNCAnwA44l8m46bS6HMK5MOeAh805TGF/Gx0GJ0gPDPNw//
	m4ziV10gObfj4egiD2S5/Md+HILdXfUgcESZ4fgwKBnTPz2a5c4Wfnxs+aT17rifv0ONZYDxIPjDi
	Uxcumhhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGare-00000004LG0-0YZD;
	Mon, 10 Jun 2024 08:58:54 +0000
Received: from mgamail.intel.com ([192.198.163.13])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGarE-00000004Ku8-0dho;
	Mon, 10 Jun 2024 08:58:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718009908; x=1749545908;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=V0sWEWGdvvTEoPPivf5bf1akoI1gM9dFCowdFsNKU9w=;
  b=CVSd+8+HQbb1eIyWfs+RlB8m8aMlHIsr7M+fzTwLyzShyovXWPi84g1a
   9/puqDbS79YZA2YpnfmcMaNLM+TfTwzh4LuX2VEAVgBrPq4BiaSfche4i
   NYdbPSegCQzfrZjTXCzaxr3s9nYmkWE7VXqBuEm8K+Fgsx/Eq9rkX2RmC
   VBPEB1+d2pl5gLvWck951SOvxUUYU6QsXoofzcNbdO9OMyzB2sTHqQUWE
   wG+2RXqf7P2Tjzvi4E+I5674Y/Ri/BPmWiPb2VKEYtQnV5Yu/VyS6XNRU
   0WfrqjYQeum7vPqUAKvhzeauZCBhWubs4cbBha2EGnv20lOrnbmorJ4eU
   Q==;
X-CSE-ConnectionGUID: bKvBiHwBR9+S36kxZopoXw==
X-CSE-MsgGUID: dRShlzJbRCClWQlqy2OFuA==
X-IronPort-AV: E=McAfee;i="6600,9927,11098"; a="17581530"
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; 
   d="scan'208";a="17581530"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2024 01:58:27 -0700
X-CSE-ConnectionGUID: bhp1h+vXQo6jelkBwQxcTg==
X-CSE-MsgGUID: deHpkp5nSxiuSR3yUuqFZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; 
   d="scan'208";a="43432419"
Received: from unknown (HELO allen-box.sh.intel.com) ([10.239.159.127])
  by fmviesa003.fm.intel.com with ESMTP; 10 Jun 2024 01:58:23 -0700
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
Subject: [PATCH v3 02/21] iommufd: Use iommu_paging_domain_alloc()
Date: Mon, 10 Jun 2024 16:55:36 +0800
Message-Id: <20240610085555.88197-3-baolu.lu@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240610085555.88197-1-baolu.lu@linux.intel.com>
References: <20240610085555.88197-1-baolu.lu@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240610_015828_670785_5047A87B 
X-CRM114-Status: UNSURE (   9.85  )
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

If the iommu driver doesn't implement its domain_alloc_user callback,
iommufd_hwpt_paging_alloc() rolls back to allocate an iommu paging domain.
Replace iommu_domain_alloc() with iommu_user_domain_alloc() to pass the
device pointer along the path.

Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
---
 drivers/iommu/iommufd/hw_pagetable.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/iommu/iommufd/hw_pagetable.c b/drivers/iommu/iommufd/hw_pagetable.c
index 33d142f8057d..cbddfa3ca95a 100644
--- a/drivers/iommu/iommufd/hw_pagetable.c
+++ b/drivers/iommu/iommufd/hw_pagetable.c
@@ -137,9 +137,10 @@ iommufd_hwpt_paging_alloc(struct iommufd_ctx *ictx, struct iommufd_ioas *ioas,
 		}
 		hwpt->domain->owner = ops;
 	} else {
-		hwpt->domain = iommu_domain_alloc(idev->dev->bus);
-		if (!hwpt->domain) {
-			rc = -ENOMEM;
+		hwpt->domain = iommu_paging_domain_alloc(idev->dev);
+		if (IS_ERR(hwpt->domain)) {
+			rc = PTR_ERR(hwpt->domain);
+			hwpt->domain = NULL;
 			goto out_abort;
 		}
 	}
-- 
2.34.1


