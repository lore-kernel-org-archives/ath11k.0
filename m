Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60F14C27C5F
	for <ath11k@archiver.kernel.org>; Mon, 10 Jun 2024 08:59:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lVPaErnwSFLlCEbCWKg99/NKJKB0jHikHnPfjxibXxA=; b=t/jlJdKi29AIsfMH8iBzoRiahu
	VQwdwEjxPa5vgJxIMqcNoQr11Nt1xn8kohybFvu1voO8yjVd2V02vgRhIYhvnpJ+rtxe4aKvfS9Hl
	ysmK30hswZXlW8tmAHjIr2w4Ro08yNpdl5to+8zwxeJr+pmFAsDcw59aL9VJLcrgGXthYQiTQNgKu
	iYz0BuTPXm9q3/9ekcf/wOx3+Qc931F84GDRsPTHOGenqBNSW+KWoF+MJAwbLTyqGUYZddLFhiokK
	RLRQ0qAdWQXFoJ7jw9hfwktVyyiSBYWn97jnAt6T4Q/lU6HHaepCmbEE5Ft0HNYpsbTtJ8XHbboU5
	tLMQNOFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGarv-00000004LU1-3aik;
	Mon, 10 Jun 2024 08:59:12 +0000
Received: from mgamail.intel.com ([192.198.163.13])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGarN-00000004Kq1-3Hzv;
	Mon, 10 Jun 2024 08:58:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718009917; x=1749545917;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=qU++r+SggSyx2fIXITvVfcmJ8RsRBVMKn+9+u6WfEcI=;
  b=UDqh5Sh7UJu55pRN7wRyZwZKdspYYSP6SyNU0YHgAtoy9tRDrRIY56DK
   xuyP9EtuLuEqqt1SPNvygddWa3NwFgem9LedY+9dzv/7++2lMxAi8m4uP
   sj+sI6tEF9P+V+5aWo4JLvLk2Tdr28Tpv97a6ZjGwyqx6Yu+N4RYxEy9v
   8AvkzFX6EPehbSjK/W58VDHFgLwMZkUEPONfokjK8swdfn5g1+yxxAcaV
   4wrutM5vrqg40/0/5epVwdaQ+YBy6/bzc21Dn6CZipaYkdh8m84o0Aq7f
   E8C+rLwNNgFeJ8Fj8goTkudsp80n4BoD6jO2D80zWWQ12bYhlvCh5u9f7
   g==;
X-CSE-ConnectionGUID: h0fdzcE6TWuXKqp5bv+UZQ==
X-CSE-MsgGUID: lPtzrgxSSOin5D8yBsL7MA==
X-IronPort-AV: E=McAfee;i="6600,9927,11098"; a="17581572"
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; 
   d="scan'208";a="17581572"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2024 01:58:37 -0700
X-CSE-ConnectionGUID: bCISEAxDQLCb2yA7Goorcw==
X-CSE-MsgGUID: H05Iq2PASIy2ktFmbvS+zw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; 
   d="scan'208";a="43432449"
Received: from unknown (HELO allen-box.sh.intel.com) ([10.239.159.127])
  by fmviesa003.fm.intel.com with ESMTP; 10 Jun 2024 01:58:33 -0700
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
Subject: [PATCH v3 04/21] vhost-vdpa: Use iommu_paging_domain_alloc()
Date: Mon, 10 Jun 2024 16:55:38 +0800
Message-Id: <20240610085555.88197-5-baolu.lu@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240610085555.88197-1-baolu.lu@linux.intel.com>
References: <20240610085555.88197-1-baolu.lu@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240610_015838_197535_A7887D86 
X-CRM114-Status: GOOD (  10.37  )
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
 drivers/vhost/vdpa.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/vhost/vdpa.c b/drivers/vhost/vdpa.c
index 63a53680a85c..e31ec9ebc4ce 100644
--- a/drivers/vhost/vdpa.c
+++ b/drivers/vhost/vdpa.c
@@ -1312,26 +1312,24 @@ static int vhost_vdpa_alloc_domain(struct vhost_vdpa *v)
 	struct vdpa_device *vdpa = v->vdpa;
 	const struct vdpa_config_ops *ops = vdpa->config;
 	struct device *dma_dev = vdpa_get_dma_dev(vdpa);
-	const struct bus_type *bus;
 	int ret;
 
 	/* Device want to do DMA by itself */
 	if (ops->set_map || ops->dma_map)
 		return 0;
 
-	bus = dma_dev->bus;
-	if (!bus)
-		return -EFAULT;
-
 	if (!device_iommu_capable(dma_dev, IOMMU_CAP_CACHE_COHERENCY)) {
 		dev_warn_once(&v->dev,
 			      "Failed to allocate domain, device is not IOMMU cache coherent capable\n");
 		return -ENOTSUPP;
 	}
 
-	v->domain = iommu_domain_alloc(bus);
-	if (!v->domain)
-		return -EIO;
+	v->domain = iommu_paging_domain_alloc(dma_dev);
+	if (IS_ERR(v->domain)) {
+		ret = PTR_ERR(v->domain);
+		v->domain = NULL;
+		return ret;
+	}
 
 	ret = iommu_attach_device(v->domain, dma_dev);
 	if (ret)
-- 
2.34.1


