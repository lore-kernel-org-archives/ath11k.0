Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C651CCA486
	for <ath11k@archiver.kernel.org>; Wed, 20 Jul 2022 13:51:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sW7gurGol5bO0XRX9O2GTCN0uGH9RVX/V7tbpeki8RQ=; b=hp5XG3xsB1SAJ9
	2Jfg/Wruzidb0gypw9zGSsY6gCtPNtxsW1X2uLk2d3MwWLTqzkj264hiu3soH2tsoVMmzbFkzmrfJ
	veMPOVxhudmIY11uLZf3HBOpc+/CINh9OCA2GBvTZuc4a2DffyJJ8D9q+JIwVdgjISZIOVjNQFzR2
	bxVmEPspJ+6ZqlMmKJm28KL+Tzxs26RFAvErjKQnBGgsqNN6HGXg6LtAPXmtnkTQMDwlpDA5SkgUA
	qzrBl0/hyGKmumOTUnv8ToUoezEui8a6SGl1+yjAujyZMxSOKD9GLYQKXQokl4lLrRqryoL+3hBR/
	zNV924d1nTckSnNLv7fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEA6y-006Ibm-Vb; Wed, 20 Jul 2022 13:51:36 +0000
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEA6w-006IVJ-CM
	for ath11k@lists.infradead.org; Wed, 20 Jul 2022 13:51:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1658325094; x=1689861094;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=UKaUJPEO4CFW8xiG3a5giDAdwObc+gTj9D9Vpu6hfv0=;
  b=sQLSsqQFZy9dNE1vDDss4v4fblTPgT1sh9f2NbtFbtu5HC0Q0Zij7ONh
   6r7pcgj7pQ9217gDc8WoClHjnj6hSqX1USx9VLE68SvCEmOYmxpLq65AU
   BXsYw9NPJV2wfQqJ9VAo0y5oGNPuCfeWuiirYwFWSigQYAk91xPlfSZp/
   0=;
Received: from unknown (HELO ironmsg05-sd.qualcomm.com) ([10.53.140.145])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 20 Jul 2022 06:51:34 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg05-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2022 06:51:34 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 20 Jul 2022 06:51:33 -0700
Received: from mpubbise-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 20 Jul 2022 06:51:32 -0700
From: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, Manikanta Pubbisetty
	<quic_mpubbise@quicinc.com>
Subject: [PATCH 3/3] ath11k: Increase TCL data ring size for WCN6750
Date: Wed, 20 Jul 2022 19:21:13 +0530
Message-ID: <20220720135113.15755-4-quic_mpubbise@quicinc.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220720135113.15755-1-quic_mpubbise@quicinc.com>
References: <20220720135113.15755-1-quic_mpubbise@quicinc.com>
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220720_065134_483153_4B670EDA 
X-CRM114-Status: GOOD (  13.83  )
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
index a7eaec5798a0..4e1fe062c3c9 100644
--- a/drivers/net/wireless/ath/ath11k/core.c
+++ b/drivers/net/wireless/ath/ath11k/core.c
@@ -112,6 +112,7 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.fixed_fw_mem = false,
 		.support_off_channel_tx = false,
 		.tcl_ring_retry = true,
+		.tx_ring_size = DP_TCL_DATA_RING_SIZE,
 	},
 	{
 		.hw_rev = ATH11K_HW_IPQ6018_HW10,
@@ -189,6 +190,7 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.fixed_fw_mem = false,
 		.support_off_channel_tx = false,
 		.tcl_ring_retry = true,
+		.tx_ring_size = DP_TCL_DATA_RING_SIZE,
 	},
 	{
 		.name = "qca6390 hw2.0",
@@ -265,6 +267,7 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.fixed_fw_mem = false,
 		.support_off_channel_tx = true,
 		.tcl_ring_retry = true,
+		.tx_ring_size = DP_TCL_DATA_RING_SIZE,
 	},
 	{
 		.name = "qcn9074 hw1.0",
@@ -341,6 +344,7 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.fixed_fw_mem = false,
 		.support_off_channel_tx = false,
 		.tcl_ring_retry = true,
+		.tx_ring_size = DP_TCL_DATA_RING_SIZE,
 	},
 	{
 		.name = "wcn6855 hw2.0",
@@ -417,6 +421,7 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.fixed_fw_mem = false,
 		.support_off_channel_tx = true,
 		.tcl_ring_retry = true,
+		.tx_ring_size = DP_TCL_DATA_RING_SIZE,
 	},
 	{
 		.name = "wcn6855 hw2.1",
@@ -492,6 +497,7 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.fixed_fw_mem = false,
 		.support_off_channel_tx = true,
 		.tcl_ring_retry = true,
+		.tx_ring_size = DP_TCL_DATA_RING_SIZE,
 	},
 	{
 		.name = "wcn6750 hw1.0",
@@ -567,6 +573,7 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.fixed_fw_mem = true,
 		.support_off_channel_tx = false,
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
index 9adfd6622c5f..a3b2df51c5b7 100644
--- a/drivers/net/wireless/ath/ath11k/hw.h
+++ b/drivers/net/wireless/ath/ath11k/hw.h
@@ -213,6 +213,7 @@ struct ath11k_hw_params {
 	bool fixed_fw_mem;
 	bool support_off_channel_tx;
 	bool tcl_ring_retry;
+	u32 tx_ring_size;
 };
 
 struct ath11k_hw_ops {
-- 
2.35.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
