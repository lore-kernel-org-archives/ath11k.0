Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48BF4CF043E
	for <ath11k@archiver.kernel.org>; Wed,  9 Oct 2024 04:16:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C6qCtl+ta7BWHfSYFZuYKOCzByx8c7R8csTOcEtlY2I=; b=SGtXva7uzuUGulNZ9AUJIJTla9
	svz+PcfBGnoF8SUxdOPUmC7kLagh9ELf4ZsEfF/e5slmaAnknjOq5s7hVN6uUw1WHBflcGx0Ka4HT
	e731o8Sxt/CP1ZCPq2bySxZYNqc2oE1mO5KKVDvaXDUNYo/YTScsae1+epng13mH6CzcvTxhYy+ss
	+7ly8Ufnvdt8cDEHGSssB5eyTg+SBelzjAbG6EYhJ/1nL6G7NdUeJlnMR6vPjASJAcsyVDH+Umx5e
	1bLW+2/zb+GoY+rqktA6ROlY17oTvaWmmaAZEGZltXyrnB9LKfYAHLX2PSGJ7EsJXUx7WWpBT8kY0
	uOMB1Kaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syO82-00000007qre-3ku1;
	Wed, 09 Oct 2024 04:16:50 +0000
Received: from mgamail.intel.com ([192.198.163.7])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syO7z-00000007qlY-005b;
	Wed, 09 Oct 2024 04:16:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728447407; x=1759983407;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=FNZtLfJ5rXbaDZePK51gpgINvo8ZfmFIhkL4SyhfFH8=;
  b=cCS0km45F5nBYyZjWgNtM4+jwKP9S7LNvmVjrtCrKJ5aio/gm6vwGp0Y
   OZs7k7BM7yEVhkQ+2GB3rcDmTLihjt8v4M0MHEr3/glV9XMeGHWAB9LaC
   MRNvavSugChxmoPOGY9RjgTXETvprzHzFjbI67VEaKpXZMyUp54Tr/zFs
   IcRlMLK5QBcm24Xa+iEPLYkFAzbstrn4xPBn1OiEadeMbQTCxDvShYCS4
   0NECaHek1vssv1bv0YBg4J33SckJYcqvt3Y5nWi5r5YVv3SkR+dJsar0A
   IzbkBUZUmPdco0eZAfKTXsKcfI8Cb1afiuhVAvL3e4L/MyXg5vFgh6uZE
   Q==;
X-CSE-ConnectionGUID: brZmWXmbSTu4O8M2uAb42g==
X-CSE-MsgGUID: VcbGq/d8Tmu2OsfpkmjpiQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11219"; a="53127020"
X-IronPort-AV: E=Sophos;i="6.11,189,1725346800"; 
   d="scan'208";a="53127020"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2024 21:16:47 -0700
X-CSE-ConnectionGUID: 5W+A5CHwRjGF5/AsJMPzkg==
X-CSE-MsgGUID: qyyee3xYTNuRtsRlsQMXVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,189,1725346800"; 
   d="scan'208";a="80095743"
Received: from allen-box.sh.intel.com ([10.239.159.127])
  by fmviesa003.fm.intel.com with ESMTP; 08 Oct 2024 21:16:41 -0700
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
	Thierry Reding <treding@nvidia.com>
Subject: [PATCH v4 3/4] drm/nouveau/tegra: Use iommu_paging_domain_alloc()
Date: Wed,  9 Oct 2024 12:11:46 +0800
Message-ID: <20241009041147.28391-4-baolu.lu@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241009041147.28391-1-baolu.lu@linux.intel.com>
References: <20241009041147.28391-1-baolu.lu@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241008_211647_095715_805C5D63 
X-CRM114-Status: UNSURE (   9.35  )
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

In nvkm_device_tegra_probe_iommu(), a paging domain is allocated for @dev
and attached to it on success. Use iommu_paging_domain_alloc() to make it
explicit.

Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
Acked-by: Thierry Reding <treding@nvidia.com>
Reviewed-by: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/drm/nouveau/nvkm/engine/device/tegra.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/device/tegra.c b/drivers/gpu/drm/nouveau/nvkm/engine/device/tegra.c
index d1c294f00665..78a83f904bbd 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/device/tegra.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/device/tegra.c
@@ -120,8 +120,8 @@ nvkm_device_tegra_probe_iommu(struct nvkm_device_tegra *tdev)
 	mutex_init(&tdev->iommu.mutex);
 
 	if (device_iommu_mapped(dev)) {
-		tdev->iommu.domain = iommu_domain_alloc(&platform_bus_type);
-		if (!tdev->iommu.domain)
+		tdev->iommu.domain = iommu_paging_domain_alloc(dev);
+		if (IS_ERR(tdev->iommu.domain))
 			goto error;
 
 		/*
-- 
2.43.0


