Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B453DC41513
	for <ath11k@archiver.kernel.org>; Mon, 10 Jun 2024 08:58:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ANdnNKEXEKMU7+nCdQRC8BKJq392jdqzaIpfScTXSn4=; b=huEeRBDpQGPtzDCY9oWoPpxDVG
	rRyNJGDxwGFrxI9h+yIpkz3g7hG1x0T67D3XPPyisBgoLnofMXGsVEU8T5B0jhRG8j1F1piC7pxZA
	DyyBbYbgoGUqbJ5s3K8bYtWsd7+yiUQL5hQeZluh/aN4CaFCL+HPArRjB0lBl66oD2Tz1vp99b0nx
	s7EVhpUA7WJ3Y/rm7nLlnpo/iG1dR/cqotc3hA/3Gy5R3wcbdN3Ra4VCaLlQ8ztabHxKptNStl3mE
	MBB5c3wA9ts8oF6HxRnAHvpfMuOy4IOAH393V4CnUAVg1iJXaK/XP65i/qJD7yaIUnKbHEZ/7IUib
	aaNWcMjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGarR-00000004L5n-2u3h;
	Mon, 10 Jun 2024 08:58:41 +0000
Received: from mgamail.intel.com ([192.198.163.13])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGar6-00000004Kn7-1mcM;
	Mon, 10 Jun 2024 08:58:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718009900; x=1749545900;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=0vujK8zNCKvKagqP+H4Q/hFUwMNe4QRoYI5wcH4k1DU=;
  b=Zfcp0hwkD5sqnrtb6ixVjLCDLfnzcaUBR9BAQjGBXWIkeychoZmM+8HB
   LV6IaknogfqX7f6DSGQztCkUICUxu0H/uoUVWDdDQ2ylXh9kyTGTouIM4
   x2Zl/tkAqdMNZkEs+cduq4P0Xi6+LyXPXd8m8x1fc7/eJcmc9amEhQNE0
   0tVoVliy3y1vj4H2QHMpIfl0JCe2pbL4+BfgKm3tBBrqKOWltM4qQcoVh
   HuN0bt6B0m4FIiywpoR/fazzORQ2R3cltpV4/g04wa45y1slTFVm6a+DE
   IIVIpe8GPjcEdqhNTxYO1rkyOzZaiosHFvrZKMwGNJ8ZWal9yyHdTEHgj
   g==;
X-CSE-ConnectionGUID: ADTsY/C+RXSO7U1JP/bpHg==
X-CSE-MsgGUID: 8BeiBg0rQemQFf/WuzZYlw==
X-IronPort-AV: E=McAfee;i="6600,9927,11098"; a="17581495"
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; 
   d="scan'208";a="17581495"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2024 01:58:17 -0700
X-CSE-ConnectionGUID: DFrvvBhUT0CHyUEqQL0Vhg==
X-CSE-MsgGUID: ar5nZaOiT0efo7DDRkQyLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; 
   d="scan'208";a="43432400"
Received: from unknown (HELO allen-box.sh.intel.com) ([10.239.159.127])
  by fmviesa003.fm.intel.com with ESMTP; 10 Jun 2024 01:58:12 -0700
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
Subject: [PATCH v3 00/21] iommu: Refactoring domain allocation interface
Date: Mon, 10 Jun 2024 16:55:34 +0800
Message-Id: <20240610085555.88197-1-baolu.lu@linux.intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240610_015820_909512_66669FFF 
X-CRM114-Status: GOOD (  20.09  )
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

The IOMMU subsystem has undergone some changes, including the removal
of iommu_ops from the bus structure. Consequently, the existing domain
allocation interface, which relies on a bus type argument, is no longer
relevant:

    struct iommu_domain *iommu_domain_alloc(struct bus_type *bus)

This series is designed to refactor the use of this interface. It
proposes a new interface iommu_paging_domain_alloc() to replace
iommu_domain_alloc(). This interface is for allocating iommu paging
domains for kernel drivers. It takes a device pointer as a parameter,
which better reflects the current design of the IOMMU subsystem.

The majority of device drivers currently using iommu_domain_alloc() do
so to allocate a domain for a specific device and then attach that
domain to the device. These cases can be straightforwardly migrated to
the new interface.

The drm/tegra driver is a bit different in that the device pointer
passed to the helper, which allocates the iommu domain, is not the one
that will be used for the kernel DMA API. Move the existing logic in
iommu_domain_alloc() into the driver to ensure it works as intended.

Now that all consumers of iommu_domain_alloc() have switched to the new
interface, we can finally remove iommu_domain_alloc(). This removal
paves the way for the IOMMU subsystem to support multiple iommu drivers.
Additionally, the individual iommu driver implementation for domain
allocation could also be simplified, as there will always be a valid
device pointer passed along the path.

The whole series is also available on GitHub:
https://github.com/LuBaolu/intel-iommu/commits/iommu-domain-allocation-refactor-v3

Change log:

v3:
 - Remove the proposed iommu_user_domain_alloc() interface.

v2: https://lore.kernel.org/linux-iommu/20240604015134.164206-1-baolu.lu@linux.intel.com/
 - Drop the vt-d patches which implement paging domain support from this
   series. I will post them in a separate series later.
 - Convert all drivers that call iommu_domain_alloc() to use the new
   interface and remove iommu_domain_alloc() from the tree.
 - For the drm/msm driver, make the code compatible with the no-IOMMU
   case.
 - Various cleanups and refinements.

v1: https://lore.kernel.org/linux-iommu/20240529053250.91284-1-baolu.lu@linux.intel.com/

Lu Baolu (20):
  iommu: Add iommu_paging_domain_alloc() interface
  iommufd: Use iommu_paging_domain_alloc()
  vfio/type1: Use iommu_paging_domain_alloc()
  vhost-vdpa: Use iommu_paging_domain_alloc()
  drm/msm: Use iommu_paging_domain_alloc()
  drm/nouveau/tegra: Use iommu_paging_domain_alloc()
  gpu: host1x: Use iommu_paging_domain_alloc()
  media: nvidia: tegra: Use iommu_paging_domain_alloc()
  media: venus: firmware: Use iommu_paging_domain_alloc()
  wifi: ath10k: Use iommu_paging_domain_alloc()
  wifi: ath11k: Use iommu_paging_domain_alloc()
  remoteproc: Use iommu_paging_domain_alloc()
  soc/fsl/qbman: Use iommu_paging_domain_alloc()
  RDMA/usnic: Use iommu_paging_domain_alloc()
  iommu/vt-d: Add helper to allocate paging domain
  ARM: dma-mapping: Use iommu_paging_domain_alloc()
  drm/rockchip: Use iommu_paging_domain_alloc()
  drm/tegra: Remove call to iommu_domain_alloc()
  iommu: Remove iommu_present()
  iommu: Remove iommu_domain_alloc()

Robin Murphy (1):
  ARM: dma-mapping: Pass device to arm_iommu_create_mapping()

 include/linux/iommu.h                         | 12 +--
 arch/arm/include/asm/dma-iommu.h              |  2 +-
 arch/arm/mm/dma-mapping.c                     | 12 +--
 drivers/gpu/drm/exynos/exynos_drm_dma.c       |  2 +-
 drivers/gpu/drm/msm/msm_iommu.c               |  7 +-
 .../drm/nouveau/nvkm/engine/device/tegra.c    |  4 +-
 drivers/gpu/drm/rockchip/rockchip_drm_drv.c   | 10 ++-
 drivers/gpu/drm/tegra/drm.c                   | 34 ++++++--
 drivers/gpu/host1x/dev.c                      |  7 +-
 drivers/infiniband/hw/usnic/usnic_uiom.c      |  6 +-
 drivers/iommu/intel/iommu.c                   | 87 +++++++++++++++++--
 drivers/iommu/iommu.c                         | 63 +++-----------
 drivers/iommu/iommufd/hw_pagetable.c          |  7 +-
 drivers/iommu/ipmmu-vmsa.c                    |  3 +-
 drivers/iommu/mtk_iommu_v1.c                  |  3 +-
 .../media/platform/nvidia/tegra-vde/iommu.c   |  7 +-
 drivers/media/platform/qcom/venus/firmware.c  |  6 +-
 drivers/media/platform/ti/omap3isp/isp.c      |  2 +-
 drivers/net/wireless/ath/ath10k/snoc.c        |  6 +-
 drivers/net/wireless/ath/ath11k/ahb.c         |  6 +-
 drivers/remoteproc/remoteproc_core.c          |  6 +-
 drivers/soc/fsl/qbman/qman_portal.c           |  5 +-
 drivers/vfio/vfio_iommu_type1.c               |  7 +-
 drivers/vhost/vdpa.c                          | 14 ++-
 24 files changed, 183 insertions(+), 135 deletions(-)

-- 
2.34.1


