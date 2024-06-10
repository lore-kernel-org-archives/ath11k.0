Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A50CC27C5E
	for <ath11k@archiver.kernel.org>; Mon, 10 Jun 2024 10:02:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ap6c4IUnejCX6LN2RXmfplNrXwUiUrx9CE7MWr+mWwE=; b=QrXDHtq1PS7Vki7e0wOHdTH8A+
	FgJuQfGMNAF/7mXdZPSh7p1Ht90fOa8EGMGBF9V95bM9FVJ6mASmqqzlHdXQbrjZrRz+baXK0TFa8
	Pz7NZAI4V/tgI5aQrleBjzF3fumsbVjvN4kGUfjx/AVtfv7wGQ8wyrz3rboz798+mgOliF8ONIXwn
	27Z1Kn1c+t7OGzaedJDXV7rZ7JwNlNn7k2zpQwuzoVEzOO5tz1K/OgRnM9ONPglqqQ2WyvSBU/DQU
	++jKLNAOsd0itVRqDNO6ad7fJKSVN6roOap0+Yz1TSHVylrckpkXyWkkwiFVyZL3l7JAq81WbqrZ8
	85KQudMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGbrH-00000004Y2a-0C7a;
	Mon, 10 Jun 2024 10:02:35 +0000
Received: from mgamail.intel.com ([192.198.163.13])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGasO-00000004Ku8-3qLM;
	Mon, 10 Jun 2024 08:59:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718009981; x=1749545981;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=v9ajyqSmZ+fyr4zUzek4FxHLrUQ5pgq0PnnoHeKwwEA=;
  b=DJyCd1dcvcmGdiNXAQlXkK7s2cB+tnLSr7LihVYbrwzzkg8ZSqdrJhA/
   ELDVoGNzaUtg+7PYnjvNUaeB0GOrf7fuHGvPYUv7JN4bOwLKKAz+qXXnJ
   40rALsli6j/LobF2z9Uz2rKqzqIxkM+l6LWxbZIbOXI1L5EQflNcSYtVT
   KXIzx//AtWojFssz6uCDN/hKh5604O/bvbH61V/chiZ+9G0RCSVG+uZdC
   ujxdYmLXBpzFWZS4Z3OSz6BwjEfDwvkxlG9xgd1g/i5iyFJPciXSGuwKL
   NdExjVIuYddtRAM7DPCypNBkRwO/fazV7FTNncYPQK4xRVoHezl71ZnJb
   A==;
X-CSE-ConnectionGUID: bMGVxhGYSi2nhxqR5xJT+w==
X-CSE-MsgGUID: Pcm8AK8xRs24lcvG1Xa0AA==
X-IronPort-AV: E=McAfee;i="6600,9927,11098"; a="17581851"
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; 
   d="scan'208";a="17581851"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2024 01:59:29 -0700
X-CSE-ConnectionGUID: GkBRboXmTSyQf4zFvmmGBw==
X-CSE-MsgGUID: c0ivZk7UTYCnDo9fVTczuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; 
   d="scan'208";a="43432808"
Received: from unknown (HELO allen-box.sh.intel.com) ([10.239.159.127])
  by fmviesa003.fm.intel.com with ESMTP; 10 Jun 2024 01:59:24 -0700
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
	Lu Baolu <baolu.lu@linux.intel.com>,
	Jason Gunthorpe <jgg@nvidia.com>
Subject: [PATCH v3 14/21] RDMA/usnic: Use iommu_paging_domain_alloc()
Date: Mon, 10 Jun 2024 16:55:48 +0800
Message-Id: <20240610085555.88197-15-baolu.lu@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240610085555.88197-1-baolu.lu@linux.intel.com>
References: <20240610085555.88197-1-baolu.lu@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240610_015941_404853_6AAB9773 
X-CRM114-Status: UNSURE (   9.99  )
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

usnic_uiom_alloc_pd() allocates a paging domain for a given device.
In this case, iommu_domain_alloc(dev->bus) is equivalent to 
iommu_paging_domain_alloc(dev). Replace it as iommu_domain_alloc()
has been deprecated.

Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
Acked-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/infiniband/hw/usnic/usnic_uiom.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/infiniband/hw/usnic/usnic_uiom.c b/drivers/infiniband/hw/usnic/usnic_uiom.c
index 84e0f41e7dfa..f948b76f984d 100644
--- a/drivers/infiniband/hw/usnic/usnic_uiom.c
+++ b/drivers/infiniband/hw/usnic/usnic_uiom.c
@@ -443,11 +443,11 @@ struct usnic_uiom_pd *usnic_uiom_alloc_pd(struct device *dev)
 	if (!pd)
 		return ERR_PTR(-ENOMEM);
 
-	pd->domain = domain = iommu_domain_alloc(dev->bus);
-	if (!domain) {
+	pd->domain = domain = iommu_paging_domain_alloc(dev);
+	if (IS_ERR(domain)) {
 		usnic_err("Failed to allocate IOMMU domain");
 		kfree(pd);
-		return ERR_PTR(-ENOMEM);
+		return ERR_CAST(domain);
 	}
 
 	iommu_set_fault_handler(pd->domain, usnic_uiom_dma_fault, NULL);
-- 
2.34.1


