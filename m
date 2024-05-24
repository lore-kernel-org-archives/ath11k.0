Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2AADC25B75
	for <ath11k@archiver.kernel.org>; Fri, 24 May 2024 02:16:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=oPIIibZHS2oIF+9AMVwuHXVlAOBmlxNv2LLGs8Waick=; b=ccqZcHCaVG1mbD5muN2ZyuaS2d
	SDnIpmDwaGPp7d12ItzTK3WxT5FPje0Znr3Bhu/WjgNKoI8WON8RtMD+93zdiAvNHkTmpU8EFpJFX
	n8T/EbTF3yFvNqxqUHxD0Gb5H83i46DTssU/ptEoOBnVq9Nwq39wdpTznJffTXXeSY0AonPXmC1o2
	weosWd6jINza98IJJ0Pidz3TI/8hP7tD2W202uqsRTKYYP4lpQrnSeQUA6NyNXnYqrvpEhJSqkp4/
	rHEvls/ruqKGi/es6vz20Oenr8NCYi+quL3WXzV80UVVF+je0wS7BAozGHMIQ8aqrpQGEyNNSdgck
	CA2fGzkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sAKTe-00000007pwW-0obJ;
	Fri, 24 May 2024 02:16:14 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sAKTb-00000007pvx-088x
	for ath11k@lists.infradead.org;
	Fri, 24 May 2024 02:16:12 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44NNQrwv017986;
	Fri, 24 May 2024 02:16:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=oPIIibZHS2oIF+9AMVwuHX
	VlAOBmlxNv2LLGs8Waick=; b=SwwmuFczgSVtGP6Rqh8y9FKg/52cPz4kXhiN/s
	w6BlBbopSJrrlAMvmeO8s8y8DrdqscYJvNZFOF4gJoKK92C9W3ZxrTlSzdCLda7S
	MX8Ed7xWdiq8gE+GlpY+L5/Lgb87/baT78dULQgdfUJAqSJrKyipyOXskBUjoJ/0
	mGpLmlZwBuLwaaU0SJzH3K14/RU0tIFuVAFEmFLL1/CMA4kz0EhnuPlPL0kg1hUp
	lEpKD1uVh+KnDukJ9Wr1adYAD0KwPMRzrUv2BbWV/VV35akssQh5NnhQYf80TL36
	6O2Mn5JtOuJRR5XaLlGvs+oClPl21S8nwznxrL5it6r8Hs4w==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yaa8hrxp4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 May 2024 02:16:09 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44O2G86j019220
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 May 2024 02:16:08 GMT
Received: from bqiang-SFF.qca.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 23 May 2024 19:16:06 -0700
From: Baochen Qiang <quic_bqiang@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_bqiang@quicinc.com>
Subject: [PATCH] wifi: ath11k: fix wrong definition of CE ring's base address
Date: Fri, 24 May 2024 10:15:58 +0800
Message-ID: <20240524021558.34452-1-quic_bqiang@quicinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: JUbphbRR8zVlny1qD_ECqb0BF3I_WQi-
X-Proofpoint-ORIG-GUID: JUbphbRR8zVlny1qD_ECqb0BF3I_WQi-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-23_15,2024-05-23_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 bulkscore=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 impostorscore=0
 phishscore=0 suspectscore=0 spamscore=0 mlxlogscore=948 adultscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2405240015
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240523_191611_106653_2B62EF9F 
X-CRM114-Status: GOOD (  13.71  )
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

Base address of CE ring is defined as u32, currently this works
because coherent DMA mask configured as 32 bit:

	#define ATH11K_PCI_COHERENT_DMA_MASK	32

However this mask could be changed once firmware bugs are fixed
to fully support 36 bit DMA addressing. So to protect against any
future changes to the DMA mask, change the type of the fields that
are dependent upon it.

This is found during code review. Compile tested only.

Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/ce.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/ce.h b/drivers/net/wireless/ath/ath11k/ce.h
index 69946fc70077..bcde2fcf02cf 100644
--- a/drivers/net/wireless/ath/ath11k/ce.h
+++ b/drivers/net/wireless/ath/ath11k/ce.h
@@ -1,7 +1,7 @@
 /* SPDX-License-Identifier: BSD-3-Clause-Clear */
 /*
  * Copyright (c) 2018-2019 The Linux Foundation. All rights reserved.
- * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2022, 2024 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
 #ifndef ATH11K_CE_H
@@ -146,7 +146,7 @@ struct ath11k_ce_ring {
 	/* Host address space */
 	void *base_addr_owner_space_unaligned;
 	/* CE address space */
-	u32 base_addr_ce_space_unaligned;
+	dma_addr_t base_addr_ce_space_unaligned;
 
 	/* Actual start of descriptors.
 	 * Aligned to descriptor-size boundary.
@@ -156,7 +156,7 @@ struct ath11k_ce_ring {
 	void *base_addr_owner_space;
 
 	/* CE address space */
-	u32 base_addr_ce_space;
+	dma_addr_t base_addr_ce_space;
 
 	/* HAL ring id */
 	u32 hal_ring_id;

base-commit: fae0804439b5833308ab7d8563c643edb0fa174c
-- 
2.25.1


