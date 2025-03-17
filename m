Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83F4AC35FF3
	for <ath11k@archiver.kernel.org>; Mon, 17 Mar 2025 07:30:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0oBG6A5GCMjO1aWExZq0CyKU1/2CjZGE+WsC49+EMqk=; b=FJtIGNnFfrh6gIx2LFxSEJX//i
	ZzMBW3ocfqEhDK6IgsQkTQvkw6e+ZKXmNZbl1rh754MYyV6ab8IASIs9StWb9Gr44VHG3975kA5Qv
	fv01XODcHyvGRh8Vtx8jSB6PXC6dbsrOF3HUSX5Beo1vKYwrJcXX2AX8+mDk7bToio+cYMS5Xp5Gl
	xcTGSio9A6Zsz1UuMRz+Q67ixV89kL7Kf1KQPncZXYZ2pOvQy+ECaqWRc/ieZGDmvV5Hgo1xIIX8A
	EpLW64vKl7kmwEcti5zgGTSoLidM5dvOZNVntplXH3DY0UpuAAbgPE8aLzESpdDeuJBeEYhTdjAET
	tUHttivQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tu4vo-00000001aHn-13P0;
	Mon, 17 Mar 2025 07:30:40 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tu4mS-00000001XoY-0dlb
	for ath11k@lists.infradead.org;
	Mon, 17 Mar 2025 07:21:01 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52GLDPCs024976;
	Mon, 17 Mar 2025 07:20:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0oBG6A5GCMjO1aWExZq0CyKU1/2CjZGE+WsC49+EMqk=; b=p653lR2MKFzGRPwJ
	P/iLJYhGK6CRKaiue7yYO9Zp4/16l0M7wygqY15HAz8mNT9lCDmXFCeGqg9vDK93
	aBCan8tS0Jw7aD9iErLAevYKFZh0KD2YYIXEGci8xWnZTy4tNh4CVf69WXXLDnRV
	RET2cKrWtSHmv/R00eX9XryRBWsg74scBKW/847ZbXxKLdMELcBePApWHQtkP+d5
	i3Vylru/KcH4u4BQg5UiSPnHOdcsUnhJzgjL8oiNXnaiftbO8bV5lNZMsh6EmCyY
	2NMdc/vGbzYlprAVpdKTiGjSEFlpUQkdkoUnBxATaQfL7JXtw9MU61zQ0W+DvAxN
	1Wxt5A==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45d1utur5q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Mar 2025 07:20:56 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52H7KtuW023158
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Mar 2025 07:20:55 GMT
Received: from localhost.localdomain (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 17 Mar 2025 00:20:53 -0700
From: Miaoqing Pan <quic_miaoqing@quicinc.com>
To: <quic_jjohnson@quicinc.com>
CC: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <johan+linaro@kernel.org>,
        Miaoqing Pan
	<quic_miaoqing@quicinc.com>
Subject: [PATCH v4 ath-next 2/2] wifi: ath11k: fix HTC rx insufficient length
Date: Mon, 17 Mar 2025 15:20:36 +0800
Message-ID: <20250317072036.2066518-3-quic_miaoqing@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250317072036.2066518-1-quic_miaoqing@quicinc.com>
References: <20250317072036.2066518-1-quic_miaoqing@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=H8Pbw/Yi c=1 sm=1 tr=0 ts=67d7cd58 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=Vs1iUdzkB0EA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=YcQLN9OU0fFkaZwozdwA:9 a=RVmHIydaz68A:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: DisQPZIHI7a88h-6wECVvZhkjSVOVsnA
X-Proofpoint-ORIG-GUID: DisQPZIHI7a88h-6wECVvZhkjSVOVsnA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-17_02,2025-03-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 lowpriorityscore=0 bulkscore=0 adultscore=0 spamscore=0 priorityscore=1501
 mlxscore=0 suspectscore=0 malwarescore=0 clxscore=1015 impostorscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503170052
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_002100_313680_B3FF7942 
X-CRM114-Status: GOOD (  18.03  )
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

A relatively unusual race condition occurs between host software
and hardware, where the host sees the updated destination ring head
pointer before the hardware updates the corresponding descriptor.
When this situation occurs, the length of the descriptor returns 0.

The current error handling method is to increment descriptor tail
pointer by 1, but 'sw_index' is not updated, causing descriptor and
skb to not correspond one-to-one, resulting in the following error:

ath11k_pci 0006:01:00.0: HTC Rx: insufficient length, got 1488, expected 1492
ath11k_pci 0006:01:00.0: HTC Rx: insufficient length, got 1460, expected 1484

To address this problem and work around the broken hardware,
temporarily skip processing the current descriptor and handle it
again next time. Also, skip updating the length field of the
descriptor when it is 0, because there's a racing update, may
never see the updated length.

Tested-on: QCA6698AQ hw2.1 PCI WLAN.HSP.1.1-04546-QCAHSPSWPL_V1_V2_SILICONZ_IOE-1

Reported-by: Johan Hovold <johan+linaro@kernel.org>
Closes: https://bugzilla.kernel.org/show_bug.cgi?id=218623
Signed-off-by: Miaoqing Pan <quic_miaoqing@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/ce.c  | 14 +++++++++++---
 drivers/net/wireless/ath/ath11k/hal.c |  6 +++++-
 2 files changed, 16 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/ce.c b/drivers/net/wireless/ath/ath11k/ce.c
index e66e86bdec20..2bc8bc97165a 100644
--- a/drivers/net/wireless/ath/ath11k/ce.c
+++ b/drivers/net/wireless/ath/ath11k/ce.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: BSD-3-Clause-Clear
 /*
  * Copyright (c) 2018-2019 The Linux Foundation. All rights reserved.
- * Copyright (c) 2021-2023 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2021-2023, 2025 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
 #include "dp_rx.h"
@@ -387,18 +387,26 @@ static int ath11k_ce_completed_recv_next(struct ath11k_ce_pipe *pipe,
 
 	ath11k_hal_srng_access_begin(ab, srng);
 
-	desc = ath11k_hal_srng_dst_get_next_entry(ab, srng);
+	desc = ath11k_hal_srng_dst_peek(ab, srng);
 	if (!desc) {
 		ret = -EIO;
 		goto err;
 	}
 
 	*nbytes = ath11k_hal_ce_dst_status_get_length(desc);
-	if (*nbytes == 0) {
+	if (unlikely(*nbytes == 0)) {
+		/* A relatively unusual race condition occurs between host
+		 * software and hardware, where the host sees the updated
+		 * destination ring head pointer before the hardware updates
+		 * the corresponding descriptor. Temporarily skip processing
+		 * the current descriptor and handle it again next time.
+		 */
 		ret = -EIO;
 		goto err;
 	}
 
+	ath11k_hal_srng_dst_next(ab, srng);
+
 	*skb = pipe->dest_ring->skb[sw_index];
 	pipe->dest_ring->skb[sw_index] = NULL;
 
diff --git a/drivers/net/wireless/ath/ath11k/hal.c b/drivers/net/wireless/ath/ath11k/hal.c
index 211c085921b6..16e0b5713445 100644
--- a/drivers/net/wireless/ath/ath11k/hal.c
+++ b/drivers/net/wireless/ath/ath11k/hal.c
@@ -600,7 +600,11 @@ u32 ath11k_hal_ce_dst_status_get_length(void *buf)
 	u32 len;
 
 	len = FIELD_GET(HAL_CE_DST_STATUS_DESC_FLAGS_LEN, desc->flags);
-	desc->flags &= ~HAL_CE_DST_STATUS_DESC_FLAGS_LEN;
+	/* Skip updating the length field of the descriptor when it is 0,
+	 * because there's a racing update, may never see the updated length.
+	 */
+	if (likely(len))
+		desc->flags &= ~HAL_CE_DST_STATUS_DESC_FLAGS_LEN;
 
 	return len;
 }
-- 
2.25.1


