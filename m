Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51C59C27C5F
	for <ath11k@archiver.kernel.org>; Mon, 10 Jun 2024 08:59:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OAyPXNbgI40wIyBc2zAKk8zeTjP5wVulSNaRiFwVRqc=; b=pSHHvkOfP6rgJ5hRzyU3PDXjxl
	M7bQtlH4/o4aSD34ESY9Wp/MhGV3hC1JTHgI/+9atSRnSqXQRGkh7jmchYC8bbJfcr1uacAL52mvA
	QU5hO0iaiDWaeW11Qagq0MUP1m4dRSnSgj/5IFLiiGabYwixHx4RjGWv+vpa9XcMZWYQlMDA3XHuh
	thHH9d5aQ6cMvSZtINnU3gIu9d5tEV+zXIlwblVpTO2pFKBOv3cW10kFTPLVk0+8Pjpo0vbc4u3KP
	sAUaFsjXmOgwYyf2aaQ020VdSOeaSRv3rUUCiSAHBDtMXeglFkzesdI2Ysgch6Qi7zH7H/559SgkC
	ZXYQ1fRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGasb-00000004M2I-1roK;
	Mon, 10 Jun 2024 08:59:53 +0000
Received: from mgamail.intel.com ([192.198.163.13])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGarn-00000004Kn7-1rxb;
	Mon, 10 Jun 2024 08:59:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718009943; x=1749545943;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=sQhpQrDpkr5d6QzI9UDmfi+nhpzVyW1CcaBVDpyFpuE=;
  b=oEbkpjF7y5wyGx60rwbyHf0xXmlwMVxozn0wErErzLKXgvZF8iAwF/go
   13lkGOyO/WbglrrGSpW8A4KA9/0QFzVIy9QkDuCpS3vQ0ywo5SSVNXMo3
   cl/52Ow/t+qmWlp8llH0KhIztmqBeexEZPdvIOPRl3HEsMfjEN2kVPhPO
   5kSoCyYM43CgYd7vq9+yaHWGev+wUODlBVWIRj3472WmnQtDdDDiXDVQC
   uAzFo62Zvmoxkt/LbcqDxpMx2ishvEt5kDahnNrE52jj4yygf6lZJt6xj
   1qae5UwPJDkqEnDI4jjmM0uNtNilY1IDiwT/GfcsV09WgRqGVMm21emDU
   Q==;
X-CSE-ConnectionGUID: GenHjBEBRRqx0L4zDAujgw==
X-CSE-MsgGUID: PEMAvyM/QT6CFIA5MP2yRg==
X-IronPort-AV: E=McAfee;i="6600,9927,11098"; a="17581680"
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; 
   d="scan'208";a="17581680"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2024 01:59:02 -0700
X-CSE-ConnectionGUID: GoqNbYNkRoi9JfD2FIY96Q==
X-CSE-MsgGUID: wwmA5EWAQ/CYSTTnenxwlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; 
   d="scan'208";a="43432593"
Received: from unknown (HELO allen-box.sh.intel.com) ([10.239.159.127])
  by fmviesa003.fm.intel.com with ESMTP; 10 Jun 2024 01:58:58 -0700
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
Subject: [PATCH v3 09/21] media: venus: firmware: Use iommu_paging_domain_alloc()
Date: Mon, 10 Jun 2024 16:55:43 +0800
Message-Id: <20240610085555.88197-10-baolu.lu@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240610085555.88197-1-baolu.lu@linux.intel.com>
References: <20240610085555.88197-1-baolu.lu@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240610_015904_190806_510F3653 
X-CRM114-Status: UNSURE (   8.94  )
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

An iommu domain is allocated in venus_firmware_init() and is attached to
core->fw.dev in the same function. Use iommu_paging_domain_alloc() to
make it explicit.

Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
---
 drivers/media/platform/qcom/venus/firmware.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/firmware.c b/drivers/media/platform/qcom/venus/firmware.c
index fe7da2b30482..66a18830e66d 100644
--- a/drivers/media/platform/qcom/venus/firmware.c
+++ b/drivers/media/platform/qcom/venus/firmware.c
@@ -316,10 +316,10 @@ int venus_firmware_init(struct venus_core *core)
 
 	core->fw.dev = &pdev->dev;
 
-	iommu_dom = iommu_domain_alloc(&platform_bus_type);
-	if (!iommu_dom) {
+	iommu_dom = iommu_paging_domain_alloc(core->fw.dev);
+	if (IS_ERR(iommu_dom)) {
 		dev_err(core->fw.dev, "Failed to allocate iommu domain\n");
-		ret = -ENOMEM;
+		ret = PTR_ERR(iommu_dom);
 		goto err_unregister;
 	}
 
-- 
2.34.1


