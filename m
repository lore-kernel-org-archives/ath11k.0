Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5880BC28B2F
	for <ath11k@archiver.kernel.org>; Mon, 10 Mar 2025 01:02:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZNXqOlaTgzq9RYoXM7r/deIbN8cB/W02WqtkLhrfZkQ=; b=R5OcaNs/urNkbQrbN7/9QHQ27W
	CgM604PJi92rIHh6FhKpoHhgC94K64Azb47wVPYqxGUbFkgBzENtC1y9egroX6XAUuztdB9SKj8ja
	i+o4Nl5yvi50F2s+7zdDz064IP7eboI9W8rOHrxCqqWW/r2kmsh6mjI7fZNQBX+wcar+3BYaRWaNv
	h9y50m9rruha/2Uj0or53i5IjB9Uyg/JKqoIV8M2vsyvc4oUWawRF/7hrpyJcq3s+nFeTjGfDt2i4
	N77QTDOuF+oTpYBwqaIfjO9wNWaioKhZ7igk8LXOqsodxT6I45psMRmpJgKsgzhJCvPHX9/6yD22E
	iEEzOo9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trRXY-00000001MFL-40Mx;
	Mon, 10 Mar 2025 01:02:44 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trRXV-00000001ME2-430U
	for ath11k@lists.infradead.org;
	Mon, 10 Mar 2025 01:02:43 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 529LXgvF009677;
	Mon, 10 Mar 2025 01:02:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZNXqOlaTgzq9RYoXM7r/deIbN8cB/W02WqtkLhrfZkQ=; b=Ol9rPl2K6MAKJ87R
	T/HmAfc18mZLbY1YNRc94HkoEbzKf7A94Qzbf48Obby9QtLCnovt1lfD/OAtmpCE
	GYA44PQ2Iut5/uDske90n3l7MqFkfJNcz8AY2zjOXwxdWfJrYr1TPAGm52fe7Lu6
	p4PRKctW8jOw4CeoajZdFDjBNNDUR7rHi36TFPQg7RGLkY/EPZwE29chGXB35iCU
	QTBwcBCss8WD3V2cGE4Kxqj/XGSNaauAHB/mTecOhprB4zD2mI3j6IrfPQXVvuTf
	4c6NnI/M96YgD+Y4d0CyTX/BBP8ekYMvgqLJPNfRZC5cYlC92HwdSnXUK78Iv3rX
	JlJARA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 458eypb1th-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Mar 2025 01:02:38 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52A12VWO013908
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Mar 2025 01:02:31 GMT
Received: from Z2-SFF-G9-MQ.ap.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sun, 9 Mar 2025 18:02:29 -0700
From: Miaoqing Pan <quic_miaoqing@quicinc.com>
To: <quic_jjohnson@quicinc.com>
CC: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <johan+linaro@kernel.org>,
        Miaoqing Pan
	<quic_miaoqing@quicinc.com>
Subject: [PATCH v2 ath-next 1/2] wifi: ath11k: add function to get next srng desc
Date: Mon, 10 Mar 2025 09:02:16 +0800
Message-ID: <20250310010217.3845141-2-quic_miaoqing@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250310010217.3845141-1-quic_miaoqing@quicinc.com>
References: <20250310010217.3845141-1-quic_miaoqing@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=A9yWP7WG c=1 sm=1 tr=0 ts=67ce3a2e cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=lKsAeyGH6LT-Y4EiwrIA:9 a=RVmHIydaz68A:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: OPv-YiVS16VLNrJGd0MEY-Xb7wjYu00g
X-Proofpoint-GUID: OPv-YiVS16VLNrJGd0MEY-Xb7wjYu00g
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-09_09,2025-03-07_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 mlxlogscore=907
 adultscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1011
 priorityscore=1501 malwarescore=0 impostorscore=0 spamscore=0
 suspectscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2503100006
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250309_180242_014073_4688A5AC 
X-CRM114-Status: GOOD (  14.77  )
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

Adding the ath11k_hal_srng_dst_next() function allows for the
separate invocation of ath11k_hal_srng_dst_peek() and
ath11k_hal_srng_dst_next() in certain situations, instead of
calling the ath11k_hal_srng_dst_get_next_entry() function alone.

Tested-on: QCA6698AQ hw2.1 PCI WLAN.HSP.1.1-04546-QCAHSPSWPL_V1_V2_SILICONZ_IOE-1

Signed-off-by: Miaoqing Pan <quic_miaoqing@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/hal.c | 24 ++++++++++++++----------
 drivers/net/wireless/ath/ath11k/hal.h |  3 ++-
 2 files changed, 16 insertions(+), 11 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/hal.c b/drivers/net/wireless/ath/ath11k/hal.c
index 61f4b6dd5380..2fc8409897be 100644
--- a/drivers/net/wireless/ath/ath11k/hal.c
+++ b/drivers/net/wireless/ath/ath11k/hal.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: BSD-3-Clause-Clear
 /*
  * Copyright (c) 2018-2019 The Linux Foundation. All rights reserved.
- * Copyright (c) 2021-2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2021-2025 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 #include <linux/dma-mapping.h>
 #include "hal_tx.h"
@@ -656,18 +656,10 @@ static void ath11k_hal_srng_prefetch_desc(struct ath11k_base *ab,
 	}
 }
 
-u32 *ath11k_hal_srng_dst_get_next_entry(struct ath11k_base *ab,
-					struct hal_srng *srng)
+void ath11k_hal_srng_dst_next(struct ath11k_base *ab, struct hal_srng *srng)
 {
-	u32 *desc;
-
 	lockdep_assert_held(&srng->lock);
 
-	if (srng->u.dst_ring.tp == srng->u.dst_ring.cached_hp)
-		return NULL;
-
-	desc = srng->ring_base_vaddr + srng->u.dst_ring.tp;
-
 	srng->u.dst_ring.tp += srng->entry_size;
 
 	/* wrap around to start of ring*/
@@ -677,6 +669,18 @@ u32 *ath11k_hal_srng_dst_get_next_entry(struct ath11k_base *ab,
 	/* Try to prefetch the next descriptor in the ring */
 	if (srng->flags & HAL_SRNG_FLAGS_CACHED)
 		ath11k_hal_srng_prefetch_desc(ab, srng);
+}
+
+u32 *ath11k_hal_srng_dst_get_next_entry(struct ath11k_base *ab,
+					struct hal_srng *srng)
+{
+	u32 *desc;
+
+	lockdep_assert_held(&srng->lock);
+
+	desc = ath11k_hal_srng_dst_peek(ab, srng);
+	if (desc)
+		ath11k_hal_srng_dst_next(ab, srng);
 
 	return desc;
 }
diff --git a/drivers/net/wireless/ath/ath11k/hal.h b/drivers/net/wireless/ath/ath11k/hal.h
index 601542410c75..317b09ec6c35 100644
--- a/drivers/net/wireless/ath/ath11k/hal.h
+++ b/drivers/net/wireless/ath/ath11k/hal.h
@@ -1,7 +1,7 @@
 /* SPDX-License-Identifier: BSD-3-Clause-Clear */
 /*
  * Copyright (c) 2018-2019 The Linux Foundation. All rights reserved.
- * Copyright (c) 2021-2022, 2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2021-2022, 2024-2025 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
 #ifndef ATH11K_HAL_H
@@ -941,6 +941,7 @@ int ath11k_hal_srng_get_entrysize(struct ath11k_base *ab, u32 ring_type);
 int ath11k_hal_srng_get_max_entries(struct ath11k_base *ab, u32 ring_type);
 void ath11k_hal_srng_get_params(struct ath11k_base *ab, struct hal_srng *srng,
 				struct hal_srng_params *params);
+void ath11k_hal_srng_dst_next(struct ath11k_base *ab, struct hal_srng *srng);
 u32 *ath11k_hal_srng_dst_get_next_entry(struct ath11k_base *ab,
 					struct hal_srng *srng);
 u32 *ath11k_hal_srng_dst_peek(struct ath11k_base *ab, struct hal_srng *srng);
-- 
2.25.1


