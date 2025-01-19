Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEA09C02187
	for <ath11k@archiver.kernel.org>; Sun, 19 Jan 2025 16:42:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OnnbpKLwE1nEORIer3GMIiZLIUPUq/TLj/ybv3zgOZE=; b=t5s/7FkKRYV8qmY4/HAhXczTXf
	kU4VgyfmaFvCYdP7OXTdX7colzz+j8A/Vba5NgylUQa44MdFu7+XAihK6fJFSMJdSeiX3M4Xbn0nJ
	Lpf5wnBlDMfbXgs8jajdkSr/bu5bMMKGrCFAJPXMgVHglEjZCN/02DNaQTlEiEvdPjDsE7IfKk0y4
	4nBZmqU5mnUiIGXuy430AlutUaMOFXfu+a2keMFGVwCDFAx+l9nwCYvbMU8id4mL9GRtJQoCYfiYo
	kwgVoup5GA6W1tl+NuxjBZbHaO+oPWGgluTnpXJ3Kdz1/HVLggCo16F1lLrYnQCjwX5NnHRkBwY46
	QVCqOXNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZYNi-000000048MG-21df;
	Sun, 19 Jan 2025 16:42:38 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZYNf-000000048L9-2gcB
	for ath11k@lists.infradead.org;
	Sun, 19 Jan 2025 16:42:37 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50JGarMr027683;
	Sun, 19 Jan 2025 16:42:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OnnbpKLwE1nEORIer3GMIiZLIUPUq/TLj/ybv3zgOZE=; b=cY5L9FedaW4aL6Rw
	OUm0vb/bU3iAx8jvBq+6nRqlGhBbasK6OEgLSfOHAnWD3q4IY8Anmvnip8kHIzJs
	DpvUGdw7xxSihMoiS0pWqZ0Bw10C4u5LECj4cakxSfy+t7YXz1d+DhxyxbW3HWJW
	NL+UKv4To5/r5xDegdtfsE1OhLCN6eH679GadWlyrqstarahY+G7BgHne9sZEc8X
	1mGw3jLqgZWN3fw1DqJuaJ6xg8nCWD5fLsuvgHSrxCNnJi1eoJr2EbaDxiWZq7/O
	x30K5Wfwg/q1fFr7PPrIyC6zwR770b9uuYJqrDAoEreLXvgaoNVtDcuiZ+zMRq+9
	GL6tgg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44852d26vq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 19 Jan 2025 16:42:33 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50JGgWCe013168
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 19 Jan 2025 16:42:32 GMT
Received: from hu-ppranees-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sun, 19 Jan 2025 08:42:31 -0800
From: P Praneesh <quic_ppranees@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <tharvey@gateworks.com>
Subject: [PATCH 1/2] wifi: ath11k: Fix DMA buffer allocation to resolve SWIOTLB issues
Date: Sun, 19 Jan 2025 22:12:18 +0530
Message-ID: <20250119164219.647059-2-quic_ppranees@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250119164219.647059-1-quic_ppranees@quicinc.com>
References: <20250119164219.647059-1-quic_ppranees@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: r4QCx1_bmAGo1vfNaBsW5zDFemrBTwEE
X-Proofpoint-GUID: r4QCx1_bmAGo1vfNaBsW5zDFemrBTwEE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-19_03,2025-01-16_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 malwarescore=0
 clxscore=1011 bulkscore=0 mlxscore=0 phishscore=0 mlxlogscore=999
 impostorscore=0 priorityscore=1501 suspectscore=0 spamscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501190131
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250119_084235_686172_DF821EC5 
X-CRM114-Status: GOOD (  15.11  )
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

Currently, the driver allocates cacheable DMA buffers for rings like
HAL_REO_DST and HAL_WBM2SW_RELEASE. The buffers for HAL_WBM2SW_RELEASE
are large (1024 KiB), exceeding the SWIOTLB slot size of 256 KiB. This
leads to "swiotlb buffer is full" error messages on systems without an
IOMMU that use SWIOTLB, causing driver initialization failures. The driver
calls dma_map_single() with these large buffers obtained from kzalloc(),
resulting in ring initialization errors on systems without an IOMMU that
use SWIOTLB.

To address these issues, replace the flawed buffer allocation mechanism
with the appropriate DMA API. Specifically, use dma_alloc_noncoherent()
for cacheable DMA buffers, ensuring proper freeing of buffers with
dma_free_noncoherent().

Error log:
[   10.194343] ath11k_pci 0000:04:00.0: swiotlb buffer is full (sz:1048583 bytes), total 32768 (slots), used 2529 (slots)
[   10.194406] ath11k_pci 0000:04:00.0: failed to set up tcl_comp ring (0) :-12
[   10.194781] ath11k_pci 0000:04:00.0: failed to init DP: -12

Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.7.0.1-01744-QCAHKSWPL_SILICONZ-1
Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3

Reported-by: Tim Harvey <tharvey@gateworks.com>
Closes: https://lore.kernel.org/all/20241210041133.GA17116@lst.de/
Signed-off-by: P Praneesh <quic_ppranees@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/dp.c | 35 +++++++++-------------------
 1 file changed, 11 insertions(+), 24 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/dp.c b/drivers/net/wireless/ath/ath11k/dp.c
index fbf666d0ecf1..f124b7329e1a 100644
--- a/drivers/net/wireless/ath/ath11k/dp.c
+++ b/drivers/net/wireless/ath/ath11k/dp.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: BSD-3-Clause-Clear
 /*
  * Copyright (c) 2018-2019 The Linux Foundation. All rights reserved.
- * Copyright (c) 2021-2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2021-2025 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
 #include <crypto/hash.h>
@@ -104,14 +104,12 @@ void ath11k_dp_srng_cleanup(struct ath11k_base *ab, struct dp_srng *ring)
 	if (!ring->vaddr_unaligned)
 		return;
 
-	if (ring->cached) {
-		dma_unmap_single(ab->dev, ring->paddr_unaligned, ring->size,
-				 DMA_FROM_DEVICE);
-		kfree(ring->vaddr_unaligned);
-	} else {
+	if (ring->cached)
+		dma_free_noncoherent(ab->dev, ring->size, ring->vaddr_unaligned,
+				     ring->paddr_unaligned, DMA_FROM_DEVICE);
+	else
 		dma_free_coherent(ab->dev, ring->size, ring->vaddr_unaligned,
 				  ring->paddr_unaligned);
-	}
 
 	ring->vaddr_unaligned = NULL;
 }
@@ -249,25 +247,14 @@ int ath11k_dp_srng_setup(struct ath11k_base *ab, struct dp_srng *ring,
 		default:
 			cached = false;
 		}
-
-		if (cached) {
-			ring->vaddr_unaligned = kzalloc(ring->size, GFP_KERNEL);
-			if (!ring->vaddr_unaligned)
-				return -ENOMEM;
-
-			ring->paddr_unaligned = dma_map_single(ab->dev,
-							       ring->vaddr_unaligned,
-							       ring->size,
-							       DMA_FROM_DEVICE);
-			if (dma_mapping_error(ab->dev, ring->paddr_unaligned)) {
-				kfree(ring->vaddr_unaligned);
-				ring->vaddr_unaligned = NULL;
-				return -ENOMEM;
-			}
-		}
 	}
 
-	if (!cached)
+	if (cached)
+		ring->vaddr_unaligned = dma_alloc_noncoherent(ab->dev, ring->size,
+							      &ring->paddr_unaligned,
+							      DMA_FROM_DEVICE,
+							      GFP_KERNEL);
+	else
 		ring->vaddr_unaligned = dma_alloc_coherent(ab->dev, ring->size,
 							   &ring->paddr_unaligned,
 							   GFP_KERNEL);
-- 
2.34.1


