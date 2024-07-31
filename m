Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27F58C3DA7F
	for <ath11k@archiver.kernel.org>; Wed, 31 Jul 2024 01:41:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=z1vsEe2p2v5kX81MlLKummfMBaE+uB+JZk73XpplM8Y=; b=YeYZ2Jn6T9OVicgErFqhg3FHet
	eBk/wrv/WlSTk0UyvMWv3HzNZzDoOR9QEijNIuP3EbWcNR4oiovDTPuGaBhn6cnEzUABbb6WiWTVV
	9vSoVFZDRZ6rMjQsq0qwym36qVNSWnmgz6VENhWhGhKbayV9xzcA3qBej1R+0RganeIdGZLbC+Oku
	AwaFtxqjaJUMAlyenX+b9ZQz/mdw/dbMVv9zPglS6I/9dUkM5Eq0+qch3b2L0aViBqDxtishMb9yk
	uNKWuVQLthKv61AnuQSqVs7UfInmtUln6S09QKhPek54OI7fubq9T/JO9e1P3k8+wteXZACuOUydu
	FrFUUBgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYyLD-0000000GxD7-1aGX;
	Wed, 31 Jul 2024 01:41:23 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYyLA-0000000GxCF-2ZFm
	for ath11k@lists.infradead.org;
	Wed, 31 Jul 2024 01:41:22 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46UInbde030011;
	Wed, 31 Jul 2024 01:41:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=z1vsEe2p2v5kX81MlLKumm
	fMBaE+uB+JZk73XpplM8Y=; b=gBup2V05GarHvZ//T33+grH+lbJ4XKyHA3rOxS
	02Tt/1auOibOlKT+R6duue+4lX6IsGd5d1+3MmObKyx2yPQj711DKWgrv0xI5Jvf
	k+etG4HDpF/zcn1UercaHzZozX2ic+LCgj/lxGLqmvYXd5hfL1QGvbmKxIWdyLQs
	l4oqhmOLXgacfpgYN0DJE/MgDfNWhKJKyS/BdokfahwdYepxnIP5d1IAFe9izngX
	3r7REfoody7/of1exRh/I2qjjKqQ54/UrIVS6eoLuYhtZ2R792XZnytEiKGLlcBL
	TqVgCBZPzaKh1Di2KnVEfViEHWtVHRwFmPZApDdFxdeliIVg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40pq523mqf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 31 Jul 2024 01:41:16 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46V1fG79013364
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 31 Jul 2024 01:41:16 GMT
Received: from Z2-SFF-G9-MQ.ap.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 30 Jul 2024 18:41:14 -0700
From: Miaoqing Pan <quic_miaoqing@quicinc.com>
To: <kvalo@kernel.org>
CC: <quic_jjohnson@quicinc.com>, <ath11k@lists.infradead.org>,
        <linux-wireless@vger.kernel.org>,
        Miaoqing Pan <quic_miaoqing@quicinc.com>
Subject: [PATCH v5 1/2] wifi: ath11k: use union for vaddr and iaddr in target_mem_chunk
Date: Wed, 31 Jul 2024 09:41:03 +0800
Message-ID: <20240731014104.798028-1-quic_miaoqing@quicinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: rdRuJSVTLblc4hHspld68Ihm0Llo33ez
X-Proofpoint-ORIG-GUID: rdRuJSVTLblc4hHspld68Ihm0Llo33ez
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-30_21,2024-07-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=795
 adultscore=0 priorityscore=1501 spamscore=0 bulkscore=0 mlxscore=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 suspectscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2407310010
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240730_184120_681135_E46E9519 
X-CRM114-Status: GOOD (  15.78  )
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

The value of 'ab->hw_params.fixed_mem_region' determines that
only one variable 'vaddr' or 'iaddr' is used in target_mem_chunk.
So use an anonymous union instead, easy to check whether the
memory is set or not.

Tested-on: WCN6855 hw2.1 PCI WLAN.HSP.1.1-04358-QCAHSPSWPL_V1_V2_SILICONZ_LITE-1

Signed-off-by: Miaoqing Pan <quic_miaoqing@quicinc.com>
---
v5: use an anonymous union.
---
 drivers/net/wireless/ath/ath11k/qmi.c | 17 ++++++++++-------
 drivers/net/wireless/ath/ath11k/qmi.h |  9 ++++++---
 2 files changed, 16 insertions(+), 10 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/qmi.c b/drivers/net/wireless/ath/ath11k/qmi.c
index 1bc648920ab6..dcfbc6d4f04f 100644
--- a/drivers/net/wireless/ath/ath11k/qmi.c
+++ b/drivers/net/wireless/ath/ath11k/qmi.c
@@ -1955,13 +1955,15 @@ static void ath11k_qmi_free_target_mem_chunk(struct ath11k_base *ab)
 	int i;
 
 	for (i = 0; i < ab->qmi.mem_seg_count; i++) {
-		if ((ab->hw_params.fixed_mem_region ||
-		     test_bit(ATH11K_FLAG_FIXED_MEM_RGN, &ab->dev_flags)) &&
-		     ab->qmi.target_mem[i].iaddr)
-			iounmap(ab->qmi.target_mem[i].iaddr);
+		if (!ab->qmi.target_mem[i].anyaddr)
+			continue;
 
-		if (!ab->qmi.target_mem[i].vaddr)
+		if (ab->hw_params.fixed_mem_region ||
+		    test_bit(ATH11K_FLAG_FIXED_MEM_RGN, &ab->dev_flags)) {
+			iounmap(ab->qmi.target_mem[i].iaddr);
+			ab->qmi.target_mem[i].iaddr = NULL;
 			continue;
+		}
 
 		dma_free_coherent(ab->dev,
 				  ab->qmi.target_mem[i].prev_size,
@@ -2068,7 +2070,7 @@ static int ath11k_qmi_assign_target_mem_chunk(struct ath11k_base *ab)
 			break;
 		case BDF_MEM_REGION_TYPE:
 			ab->qmi.target_mem[idx].paddr = ab->hw_params.bdf_addr;
-			ab->qmi.target_mem[idx].vaddr = NULL;
+			ab->qmi.target_mem[idx].iaddr = NULL;
 			ab->qmi.target_mem[idx].size = ab->qmi.target_mem[i].size;
 			ab->qmi.target_mem[idx].type = ab->qmi.target_mem[i].type;
 			idx++;
@@ -2091,10 +2093,11 @@ static int ath11k_qmi_assign_target_mem_chunk(struct ath11k_base *ab)
 				} else {
 					ab->qmi.target_mem[idx].paddr =
 						ATH11K_QMI_CALDB_ADDRESS;
+					ab->qmi.target_mem[idx].iaddr = NULL;
 				}
 			} else {
 				ab->qmi.target_mem[idx].paddr = 0;
-				ab->qmi.target_mem[idx].vaddr = NULL;
+				ab->qmi.target_mem[idx].iaddr = NULL;
 			}
 			ab->qmi.target_mem[idx].size = ab->qmi.target_mem[i].size;
 			ab->qmi.target_mem[idx].type = ab->qmi.target_mem[i].type;
diff --git a/drivers/net/wireless/ath/ath11k/qmi.h b/drivers/net/wireless/ath/ath11k/qmi.h
index 7e06d100af57..fdf9b5f8c19f 100644
--- a/drivers/net/wireless/ath/ath11k/qmi.h
+++ b/drivers/net/wireless/ath/ath11k/qmi.h
@@ -1,7 +1,7 @@
 /* SPDX-License-Identifier: BSD-3-Clause-Clear */
 /*
  * Copyright (c) 2018-2019 The Linux Foundation. All rights reserved.
- * Copyright (c) 2021-2023 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2021-2024 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
 #ifndef ATH11K_QMI_H
@@ -102,8 +102,11 @@ struct target_mem_chunk {
 	u32 prev_size;
 	u32 prev_type;
 	dma_addr_t paddr;
-	u32 *vaddr;
-	void __iomem *iaddr;
+	union {
+		u32 *vaddr;
+		void __iomem *iaddr;
+		void *anyaddr;
+	};
 };
 
 struct target_info {
-- 
2.25.1


