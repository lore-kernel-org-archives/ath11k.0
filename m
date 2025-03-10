Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 415D0C2BA1B
	for <ath11k@archiver.kernel.org>; Mon, 10 Mar 2025 01:02:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c+Bnz5MXFNxyk70QqOJh4tmnrisC9p1l21NoG0whgJw=; b=Ocv9VTUmz+moTNH9OZKacnb/P5
	GEuTIr7352fy696f2gXet0V5tDE5/7FcAY/xI1xP3xWCckXPFcS4JvcaoFeNnI/hJRbppviAeySND
	P7lFpuYWdHsQkaeEMFqq/qJAU1hyPZjtaw67muUdIAyFvuLvaHTKcYq/FVquw00ir9Md+q7sboptx
	4qK2kuUvX7AyPh19iaHW+msj4boPtIzCE3qYbydiNV76sj0fWYk4/J480zCoeRpkIuom5Rel1xjP6
	WNXzpt47pOzdkGnO503JeEcSlhbL/iFIIL5ic97viIEjAysYXlGaKTQdjdgpL8VOBsoTuzgDj18D0
	0Avsclwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trRXc-00000001MGj-3pC0;
	Mon, 10 Mar 2025 01:02:48 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trRXY-00000001MEy-26gl
	for ath11k@lists.infradead.org;
	Mon, 10 Mar 2025 01:02:46 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 529Ko9Kd017510;
	Mon, 10 Mar 2025 01:02:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	c+Bnz5MXFNxyk70QqOJh4tmnrisC9p1l21NoG0whgJw=; b=ohpoggXTgLWDaHDW
	xlDLn4AlNbXmmU3s2O5mCz890HI0h6ZzwgCsd27VLGpOUMx6rsPk2ABdxKJJa+K0
	XNrPsJ/6i/EWLSjDeTbIKZKw65fyECz/aHSQFH8K+poGheVNNzk4GnGGVoSJN12U
	Zc9pJ1Q7J4rB76CmMzS4u3lgUlNC5Uyo+Wlo5rU6UlkK06LrwnzdX768bDBN9oSs
	NkDyjaoDn9QeylxUQ0RmZ3HM8C6uOWkmYmks5eovLVn3g9PdOERCAupiEce88X/V
	zbY/Pr54QGlP5gc5DIcrSZx+nk+3wThvMA7MPiBEuOWudrIPDlKLXYdSdtEKzQbd
	a7MkgQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 458eyt31w1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Mar 2025 01:02:34 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52A12XPk017208
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Mar 2025 01:02:33 GMT
Received: from Z2-SFF-G9-MQ.ap.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sun, 9 Mar 2025 18:02:31 -0700
From: Miaoqing Pan <quic_miaoqing@quicinc.com>
To: <quic_jjohnson@quicinc.com>
CC: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <johan+linaro@kernel.org>,
        Miaoqing Pan
	<quic_miaoqing@quicinc.com>
Subject: [PATCH v2 ath-next 2/2] wifi: ath11k: fix HTC rx insufficient length
Date: Mon, 10 Mar 2025 09:02:17 +0800
Message-ID: <20250310010217.3845141-3-quic_miaoqing@quicinc.com>
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
X-Proofpoint-ORIG-GUID: 0LH8pJNppikRHyfsPGizh3ulDdqu111o
X-Authority-Analysis: v=2.4 cv=CupFcm4D c=1 sm=1 tr=0 ts=67ce3a2a cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=Vs1iUdzkB0EA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=oICLHHyMo7b6fcdoYYIA:9 a=RVmHIydaz68A:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 0LH8pJNppikRHyfsPGizh3ulDdqu111o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-09_09,2025-03-07_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 clxscore=1011
 suspectscore=0 phishscore=0 adultscore=0 impostorscore=0 malwarescore=0
 bulkscore=0 spamscore=0 mlxlogscore=999 lowpriorityscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2503100005
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250309_180244_700568_5A92A895 
X-CRM114-Status: GOOD (  20.00  )
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

To address this problem, temporarily skip processing the current
descriptor and handle it again next time. However, to prevent this
descriptor from continuously returning 0, use skb cb to set a flag.
If the length returns 0 again, this descriptor will be discarded.

Tested-on: QCA6698AQ hw2.1 PCI WLAN.HSP.1.1-04546-QCAHSPSWPL_V1_V2_SILICONZ_IOE-1

Reported-by: Johan Hovold <johan+linaro@kernel.org>
Closes: https://bugzilla.kernel.org/show_bug.cgi?id=218623
Signed-off-by: Miaoqing Pan <quic_miaoqing@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/ce.c   | 32 ++++++++++++++++++++------
 drivers/net/wireless/ath/ath11k/core.h |  1 +
 2 files changed, 26 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/ce.c b/drivers/net/wireless/ath/ath11k/ce.c
index e66e86bdec20..2573f8c7a994 100644
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
@@ -387,18 +387,36 @@ static int ath11k_ce_completed_recv_next(struct ath11k_ce_pipe *pipe,
 
 	ath11k_hal_srng_access_begin(ab, srng);
 
-	desc = ath11k_hal_srng_dst_get_next_entry(ab, srng);
+	desc = ath11k_hal_srng_dst_peek(ab, srng);
 	if (!desc) {
 		ret = -EIO;
 		goto err;
 	}
 
 	*nbytes = ath11k_hal_ce_dst_status_get_length(desc);
-	if (*nbytes == 0) {
-		ret = -EIO;
-		goto err;
+	if (unlikely(*nbytes == 0)) {
+		struct ath11k_skb_rxcb *rxcb =
+			ATH11K_SKB_RXCB(pipe->dest_ring->skb[sw_index]);
+
+		/* A relatively unusual race condition occurs between host
+		 * software and hardware, where the host sees the updated
+		 * destination ring head pointer before the hardware updates
+		 * the corresponding descriptor.
+		 *
+		 * Temporarily skip processing the current descriptor and handle
+		 * it again next time. However, to prevent this descriptor from
+		 * continuously returning 0, set 'is_desc_len0' flag. If the
+		 * length returns 0 again, this descriptor will be discarded.
+		 */
+		if (!rxcb->is_desc_len0) {
+			rxcb->is_desc_len0 = true;
+			ret = -EIO;
+			goto err;
+		}
 	}
 
+	ath11k_hal_srng_dst_next(ab, srng);
+
 	*skb = pipe->dest_ring->skb[sw_index];
 	pipe->dest_ring->skb[sw_index] = NULL;
 
@@ -430,8 +448,8 @@ static void ath11k_ce_recv_process_cb(struct ath11k_ce_pipe *pipe)
 		dma_unmap_single(ab->dev, ATH11K_SKB_RXCB(skb)->paddr,
 				 max_nbytes, DMA_FROM_DEVICE);
 
-		if (unlikely(max_nbytes < nbytes)) {
-			ath11k_warn(ab, "rxed more than expected (nbytes %d, max %d)",
+		if (unlikely(max_nbytes < nbytes || !nbytes)) {
+			ath11k_warn(ab, "rxed invalid length (nbytes %d, max %d)",
 				    nbytes, max_nbytes);
 			dev_kfree_skb_any(skb);
 			continue;
diff --git a/drivers/net/wireless/ath/ath11k/core.h b/drivers/net/wireless/ath/ath11k/core.h
index 1a3d0de4afde..c8614c5c6493 100644
--- a/drivers/net/wireless/ath/ath11k/core.h
+++ b/drivers/net/wireless/ath/ath11k/core.h
@@ -128,6 +128,7 @@ struct ath11k_skb_rxcb {
 	bool is_continuation;
 	bool is_mcbc;
 	bool is_eapol;
+	bool is_desc_len0;
 	struct hal_rx_desc *rx_desc;
 	u8 err_rel_src;
 	u8 err_code;
-- 
2.25.1


