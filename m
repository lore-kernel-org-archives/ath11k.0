Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76573C27C6E
	for <ath11k@archiver.kernel.org>; Mon, 10 Jun 2024 09:00:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V/OpfTvPBK5bf8PlPeRXPkb+/HfJ/scOizj3hs0KYHM=; b=2M6ejGwGa/ygzq+KDFDEc/zcAC
	Osc7EBBK5p+Mp4iesGVC0KLRnsTn/l22J7u9cYbAbLU9ZdlW0XMPR426IaVq/dubYWWrOp2yOqJLX
	M4zXQHLNid361h6+a98YrGNFIDvrXFNinz+58TrZwHl13emyh6QrZCHpGTpU8E7IjufSfrA/xEFeF
	Sn3ETqom0OGs17FW4X9lfWwGLWsLUcggNahLki8zGmcE0qSzfbq8NdWJCkCm443Efo2vaTS6hpHfm
	His8Sm0gPJro+do7CVR9oM1gSrGHyvKjCRTO+3HRMe2SxhjWTSmIv4xOvxro20r3Ose22+TH8nU11
	tmiSvCBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGatL-00000004Me9-3Hzy;
	Mon, 10 Jun 2024 09:00:39 +0000
Received: from mgamail.intel.com ([192.198.163.13])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGasb-00000004Ku8-1MxD;
	Mon, 10 Jun 2024 09:00:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718009993; x=1749545993;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=9YhH5rA1b+ID5Xo/cB0X+5j1j2KZOf2zs+wByq5adpQ=;
  b=Vkq6mUA4JM7wLvEiVdbs4vImCxx2mVNcnfdaVdKYglDEjBSEyylLiRdi
   beY4u5Pa7zMEjgbKUQ69goPP1hcYQirTLWLAo35s/m3mXP+n7cnE39A40
   eBVbHAh5fQH9xs4oc3SEwqTQXiIGWPTn00Y3dSgkeXaOv3UdZyrBcOqTU
   128JqJYCQPbND/wp+osKZgL1zZNZ4X8uN1K7cQzhWC0vONDHkfXRosfdz
   mFm/7DtzEgkVooY6U9BDPxFR+NJITNu8NeZ7a9ZC2ZJwIDFM8vOXWfT5P
   gJuwhZzTTVxVAzDbfZ5BKelKfIc6hp14+DzO8yaIFKKK9TYOsTsfXXHBp
   w==;
X-CSE-ConnectionGUID: OIxflmEgT7CBMZ3/dV4OQQ==
X-CSE-MsgGUID: V/wgJsBQRI24zsVF3jLyjQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11098"; a="17581953"
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; 
   d="scan'208";a="17581953"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2024 01:59:44 -0700
X-CSE-ConnectionGUID: 0ICSXuCKQ7SlB4hgj7FQWA==
X-CSE-MsgGUID: YSw+GqFMR2OnMFZIW7S7Hw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; 
   d="scan'208";a="43432960"
Received: from unknown (HELO allen-box.sh.intel.com) ([10.239.159.127])
  by fmviesa003.fm.intel.com with ESMTP; 10 Jun 2024 01:59:40 -0700
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
Subject: [PATCH v3 17/21] ARM: dma-mapping: Use iommu_paging_domain_alloc()
Date: Mon, 10 Jun 2024 16:55:51 +0800
Message-Id: <20240610085555.88197-18-baolu.lu@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240610085555.88197-1-baolu.lu@linux.intel.com>
References: <20240610085555.88197-1-baolu.lu@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240610_015953_731960_49C77662 
X-CRM114-Status: UNSURE (   9.58  )
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

Since arm_iommu_create_mapping() now accepts the device, let's replace
iommu_domain_alloc() with iommu_paging_domain_alloc() to retire the former.

Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
---
 arch/arm/mm/dma-mapping.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mm/dma-mapping.c b/arch/arm/mm/dma-mapping.c
index 52f9c56cc3cb..88c2d68a69c9 100644
--- a/arch/arm/mm/dma-mapping.c
+++ b/arch/arm/mm/dma-mapping.c
@@ -1585,9 +1585,11 @@ arm_iommu_create_mapping(struct device *dev, dma_addr_t base, u64 size)
 
 	spin_lock_init(&mapping->lock);
 
-	mapping->domain = iommu_domain_alloc(dev->bus);
-	if (!mapping->domain)
+	mapping->domain = iommu_paging_domain_alloc(dev);
+	if (IS_ERR(mapping->domain)) {
+		err = PTR_ERR(mapping->domain);
 		goto err4;
+	}
 
 	kref_init(&mapping->kref);
 	return mapping;
-- 
2.34.1


