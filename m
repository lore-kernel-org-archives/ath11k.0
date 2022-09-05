Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A27B0ECAAD5
	for <ath11k@archiver.kernel.org>; Mon,  5 Sep 2022 08:05:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zmVjDV62fFTjLAyNAVLEIMvxAatChOeoGAF0Iy0edwc=; b=QBWnPdsQnIKwPO
	xFTh1DyxyioBw6Fx/Uyi7hGi2sk/Oa15o9aYrHY79q0Sv7dtM5e4/qrH0kL3q6fWHR81AgEybuZ05
	N6mGXw3jHY9VEy1NJ7fDKnhwL5Sq5+Dy9msXOLsc/JITsgZzwiHm4b2P6q0L/68ikIqFqF6mPdhJt
	nCn3gjCPb1oNwUvjWkUGqED40G7SqQfznpD06FxTm+XvxkA/rrnLz5tmtQGjyG+5yCEBiRvu3En2P
	TcXN5WWy2AzoQw4hWe44r3/xyWaT/nTL8u15R/5INfC5nno01WtmjCirIzBuMXYzsONnNvbXc2fne
	DsxlQhusCsavUWCoOg7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oV76R-00E2i3-Qj; Mon, 05 Sep 2022 08:05:07 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oV6NK-00D8hY-1Y
	for ath11k@lists.infradead.org; Mon, 05 Sep 2022 07:18:38 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2856AGvV005471;
	Mon, 5 Sep 2022 07:18:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=uLWXwbEquNRf/qovD/zzCxV+3jSh4dEL18uj+vLHmmg=;
 b=U5r6e0Jrn6ulyeSv2/K5DL9+zpCSMFyMezV046WXPIvS5GfSpp0PAu0T6viQNV+/GR0n
 IChs8ZfekSTAlrHZEArZq7QY2Vjb2pYYeb4SGzTk5MeGg3ae/HXZuvNXHfcyVD0kcVW5
 PnVv5zCKHsmavjtmnlbTVFPko2amAmOSAUNw9SAvcni35wAR2ZkgIO1cy17QFGPKPhYP
 +CePZjXM9JCdbCXA6bOxvhRSxs4FVyGKDEbYHoMh5A9V1SWAzjHNxrm+0wxzEkwAHQKV
 6avH/yWYic8pwNaE0DgEDUjGZSBM0vqpgJUxt9FZLxRjxfaokHP0ApZFop+pAmbIARBX 3w== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3jc07dbb8e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 05 Sep 2022 07:18:29 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 2857ISv3032422
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 5 Sep 2022 07:18:28 GMT
Received: from mpubbise-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.29; Mon, 5 Sep 2022 00:18:27 -0700
From: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Manikanta Pubbisetty
	<quic_mpubbise@quicinc.com>
Subject: [PATCH v2 3/3] wifi: ath11k: Increase TCL data ring size for WCN6750
Date: Mon, 5 Sep 2022 12:48:05 +0530
Message-ID: <20220905071805.31625-4-quic_mpubbise@quicinc.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220905071805.31625-1-quic_mpubbise@quicinc.com>
References: <20220905071805.31625-1-quic_mpubbise@quicinc.com>
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: WO6bNaU6c16pvpmDAIIWig3OvJCsgP5i
X-Proofpoint-ORIG-GUID: WO6bNaU6c16pvpmDAIIWig3OvJCsgP5i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-09-05_05,2022-09-05_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 phishscore=0
 spamscore=0 suspectscore=0 malwarescore=0 mlxlogscore=996 impostorscore=0
 priorityscore=1501 clxscore=1015 adultscore=0 bulkscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2209050035
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220905_001830_170674_EEFDF8CB 
X-CRM114-Status: GOOD (  19.76  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Increase TCL data ring size to 2048 for WCN6750. This is
needed to meet 160 MHz TX throughput.

Add a new hw_param to indicate the TX ring size for
individual devices.

Tested-on: WCN6750 hw1.0 AHB WLAN.MSL.1.0.1-00887-QCAMSLSWPLZ-1

Signed-off-by: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/core.c | 7 +++++++
 drivers/net/wireless/ath/ath11k/dp.c   | 2 +-
 drivers/net/wireless/ath/ath11k/dp.h   | 2 ++
 drivers/net/wireless/ath/ath11k/hw.h   | 1 +
 4 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
index 1bcc108e9a85..e054514b3b09 100644
--- a/drivers/net/wireless/ath/ath11k/core.c
+++ b/drivers/net/wireless/ath/ath11k/core.c
@@ -109,6 +109,7 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.support_off_channel_tx = false,
 		.supports_multi_bssid = false,
 		.tcl_ring_retry = true,
+		.tx_ring_size = DP_TCL_DATA_RING_SIZE,
 	},
 	{
 		.hw_rev = ATH11K_HW_IPQ6018_HW10,
@@ -183,6 +184,7 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.support_off_channel_tx = false,
 		.supports_multi_bssid = false,
 		.tcl_ring_retry = true,
+		.tx_ring_size = DP_TCL_DATA_RING_SIZE,
 	},
 	{
 		.name = "qca6390 hw2.0",
@@ -256,6 +258,7 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.support_off_channel_tx = true,
 		.supports_multi_bssid = true,
 		.tcl_ring_retry = true,
+		.tx_ring_size = DP_TCL_DATA_RING_SIZE,
 	},
 	{
 		.name = "qcn9074 hw1.0",
@@ -329,6 +332,7 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.support_off_channel_tx = false,
 		.supports_multi_bssid = false,
 		.tcl_ring_retry = true,
+		.tx_ring_size = DP_TCL_DATA_RING_SIZE,
 	},
 	{
 		.name = "wcn6855 hw2.0",
@@ -402,6 +406,7 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.support_off_channel_tx = true,
 		.supports_multi_bssid = true,
 		.tcl_ring_retry = true,
+		.tx_ring_size = DP_TCL_DATA_RING_SIZE,
 	},
 	{
 		.name = "wcn6855 hw2.1",
@@ -474,6 +479,7 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.support_off_channel_tx = true,
 		.supports_multi_bssid = true,
 		.tcl_ring_retry = true,
+		.tx_ring_size = DP_TCL_DATA_RING_SIZE,
 	},
 	{
 		.name = "wcn6750 hw1.0",
@@ -546,6 +552,7 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.support_off_channel_tx = false,
 		.supports_multi_bssid = true,
 		.tcl_ring_retry = false,
+		.tx_ring_size = DP_TCL_DATA_RING_SIZE_WCN6750,
 	},
 };
 
diff --git a/drivers/net/wireless/ath/ath11k/dp.c b/drivers/net/wireless/ath/ath11k/dp.c
index 4f7381719840..fff8decf311b 100644
--- a/drivers/net/wireless/ath/ath11k/dp.c
+++ b/drivers/net/wireless/ath/ath11k/dp.c
@@ -401,7 +401,7 @@ static int ath11k_dp_srng_common_setup(struct ath11k_base *ab)
 
 		ret = ath11k_dp_srng_setup(ab, &dp->tx_ring[i].tcl_data_ring,
 					   HAL_TCL_DATA, tcl_num, 0,
-					   DP_TCL_DATA_RING_SIZE);
+					   ab->hw_params.tx_ring_size);
 		if (ret) {
 			ath11k_warn(ab, "failed to set up tcl_data ring (%d) :%d\n",
 				    i, ret);
diff --git a/drivers/net/wireless/ath/ath11k/dp.h b/drivers/net/wireless/ath/ath11k/dp.h
index 8af2985ca2d9..16fb536da5cf 100644
--- a/drivers/net/wireless/ath/ath11k/dp.h
+++ b/drivers/net/wireless/ath/ath11k/dp.h
@@ -1,6 +1,7 @@
 /* SPDX-License-Identifier: BSD-3-Clause-Clear */
 /*
  * Copyright (c) 2018-2019 The Linux Foundation. All rights reserved.
+ * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
 #ifndef ATH11K_DP_H
@@ -203,6 +204,7 @@ struct ath11k_pdev_dp {
 
 #define DP_WBM_RELEASE_RING_SIZE	64
 #define DP_TCL_DATA_RING_SIZE		512
+#define DP_TCL_DATA_RING_SIZE_WCN6750	2048
 #define DP_TX_COMP_RING_SIZE		32768
 #define DP_TX_IDR_SIZE			DP_TX_COMP_RING_SIZE
 #define DP_TCL_CMD_RING_SIZE		32
diff --git a/drivers/net/wireless/ath/ath11k/hw.h b/drivers/net/wireless/ath/ath11k/hw.h
index 5164c471da6e..06c4dc30827b 100644
--- a/drivers/net/wireless/ath/ath11k/hw.h
+++ b/drivers/net/wireless/ath/ath11k/hw.h
@@ -210,6 +210,7 @@ struct ath11k_hw_params {
 	bool support_off_channel_tx;
 	bool supports_multi_bssid;
 	bool tcl_ring_retry;
+	u32 tx_ring_size;
 };
 
 struct ath11k_hw_ops {
-- 
2.37.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
