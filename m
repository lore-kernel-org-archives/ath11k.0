Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1E57C27C5E
	for <ath11k@archiver.kernel.org>; Mon, 10 Jun 2024 08:59:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fEQZCkflD3rKZFUDL0PzkynUMXhvLxBRYUTZPqnbylA=; b=Ttsv0tsF7naXtL1sf+ymR24nfk
	ALhhODuaGhAg3W6d7mxOfUZd50xrhYjmptksYeAkymp+w4JttSQeXcLIMDN22mR7qOiOiGst8bDKP
	wo3SYWKTm3ASxR+68j2T4wJccWN6Vyo0agdPtYoeejyGQmWTB/a/JMrLI1h+Ay+Nll2GMgDoIaYUw
	6S7t8XEU+QmJa9stsYSraGM9DvOrjK64xDWNpKGqTniLAlPk7af7Xl5ditnJkcfJJDmy9/P605DcA
	Rvpmkkv4RayUGomyAJhLkN9+AtWQsBaQDfExV5X+my7gnyq++rS7CVpiaS+a/YcbDf/kZgcSlpC+p
	sE9cR1FA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGasD-00000004Ljr-33Ob;
	Mon, 10 Jun 2024 08:59:29 +0000
Received: from mgamail.intel.com ([192.198.163.13])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGard-00000004Kq1-2M7G;
	Mon, 10 Jun 2024 08:59:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718009933; x=1749545933;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=3intrfdlq62sPZGdllNzLo1Ahf/WR8/6yPI2eqBXYY8=;
  b=GrvelJR8lc4v8Nby6CPs0NUw/nHUGoklKtcPbh4bQaS89AUi+nUodsfU
   7d7xiW1IQux0rqGb9K/kyFuo3azx3weZFz4TZxAX28vBstTDtbBEmGbLf
   QZHr7nt28h+T7y+hp26VqvEl5xYWzQkab+ctu16ighOS4koaNfp604siz
   SpN6gWZr7oCfIWcrZvql8JSpb+LNM6JMps0xEyxGeUJq1A6nv+Ryl864+
   j1e0YaTXcPL7vkzZq0Z3HorxvsR29WFUgjZpWcZuepAsX5gkFV/cv4dLB
   Xo5maXEGGU+Wo/Hs3nOna1PcxAcuDEoacoEbi5p4rtgpjeJqMvWYEqZ8L
   g==;
X-CSE-ConnectionGUID: J9J1WT3/SEyKDCESG0dfQw==
X-CSE-MsgGUID: LDsGfgOPTQC/LLJEOhiwWw==
X-IronPort-AV: E=McAfee;i="6600,9927,11098"; a="17581635"
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; 
   d="scan'208";a="17581635"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2024 01:58:52 -0700
X-CSE-ConnectionGUID: Ilzg052XTkGNg5Xl4jMrRA==
X-CSE-MsgGUID: 2uqmD9gJTn61hulUVOHf8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; 
   d="scan'208";a="43432549"
Received: from unknown (HELO allen-box.sh.intel.com) ([10.239.159.127])
  by fmviesa003.fm.intel.com with ESMTP; 10 Jun 2024 01:58:48 -0700
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
Subject: [PATCH v3 07/21] gpu: host1x: Use iommu_paging_domain_alloc()
Date: Mon, 10 Jun 2024 16:55:41 +0800
Message-Id: <20240610085555.88197-8-baolu.lu@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240610085555.88197-1-baolu.lu@linux.intel.com>
References: <20240610085555.88197-1-baolu.lu@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240610_015854_192987_760B6AB7 
X-CRM114-Status: UNSURE (   8.81  )
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

An iommu domain is allocated in host1x_iommu_attach() and is attached to
host->dev. Use iommu_paging_domain_alloc() to make it explicit.

Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
---
 drivers/gpu/host1x/dev.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/host1x/dev.c b/drivers/gpu/host1x/dev.c
index 3a0aaa68ac8d..f86a6b12f24a 100644
--- a/drivers/gpu/host1x/dev.c
+++ b/drivers/gpu/host1x/dev.c
@@ -404,9 +404,10 @@ static struct iommu_domain *host1x_iommu_attach(struct host1x *host)
 		if (err < 0)
 			goto put_group;
 
-		host->domain = iommu_domain_alloc(&platform_bus_type);
-		if (!host->domain) {
-			err = -ENOMEM;
+		host->domain = iommu_paging_domain_alloc(host->dev);
+		if (IS_ERR(host->domain)) {
+			err = PTR_ERR(host->domain);
+			host->domain = NULL;
 			goto put_cache;
 		}
 
-- 
2.34.1


