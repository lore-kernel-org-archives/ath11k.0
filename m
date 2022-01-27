Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A095C433FE
	for <ath11k@archiver.kernel.org>; Thu, 27 Jan 2022 05:34:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JhP0AJnnK0cpWMxd79CR+zT2iQcnBsPtBc5dbmzpnt0=; b=dT2Wu/daNcO8rQ
	EzZO6SCEN7kcwQ6Dmy0ypkG26VotLP/RPXwMppPBU/xMxm5ZG+GwTosXdTT01+MnaTn3ZMwdFMN8c
	vCbnKAgIaFvjovhgUFE1rW1KETnUC3oMm9prYcVEbRgv2vj4TW5LW6AvqbmBidQo49pf1AKiSU+hC
	s16Skp94fUeoRkWF6igIdieGHmW9GB8Cmuiiifd8l7oUFPFHI+VyRAc4eZCmuOqcryjp2AoVCT1ts
	vbxKffafgUJl5k1bR3KGXz06BAOeHG411vAYKnEGWLxn3L4O0ifWQzUtKvNX9t2CndeNNJtw7e9vN
	MwkA/aaMiXZfynempoQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nCxPz-00EPYB-IS; Thu, 27 Jan 2022 05:33:59 +0000
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nCxPt-00EPVD-Th
 for ath11k@lists.infradead.org; Thu, 27 Jan 2022 05:33:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1643261633; x=1674797633;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=r71iHHJZT83gDisJ2i6sLgN1YHMGs5Z8too8sVzWT2M=;
 b=wKrHJqeLUkgq2UYBtZaXkPorRyv+YeBX/KftTAQ7gU0m+NTsAbLqE49f
 zBQc5oQ7D68CeVWcXOxtiWm66RPg3NHJoGpqLSJDd6QFIwX0pln+EhHcY
 JgEcUKc3PthlgtylXgJdhrUnJUgiHeM+sndfIKXCcoGcjGgNqKTt58e5A I=;
Received: from unknown (HELO ironmsg03-sd.qualcomm.com) ([10.53.140.143])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 26 Jan 2022 21:33:53 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg03-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2022 21:33:53 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Wed, 26 Jan 2022 21:33:53 -0800
Received: from mpubbise-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Wed, 26 Jan 2022 21:33:51 -0800
From: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, Manikanta Pubbisetty
 <quic_mpubbise@quicinc.com>
Subject: [PATCH RFC 5/8] ath11k: Enable threaded NAPI on WCN6750
Date: Thu, 27 Jan 2022 11:03:26 +0530
Message-ID: <1643261609-13500-6-git-send-email-quic_mpubbise@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1643261609-13500-1-git-send-email-quic_mpubbise@quicinc.com>
References: <1643261609-13500-1-git-send-email-quic_mpubbise@quicinc.com>
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220126_213354_010543_727FC6AE 
X-CRM114-Status: GOOD (  14.82  )
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

Enable threaded NAPI on WCN6750; Unlike traditional NAPI
poll which runs in softirq context and on the core which
scheduled the NAPI, threaded NAPI makes use of kernel threads
which are under direct control of the scheduler and helps
in balancing the NAPI processing load across multiple CPUs,
this helps in improving throughput.

In the case of WCN6750, enabling threaded NAPI has improved
160Mhz RX throughput by nearly 400Mbps.

Tested-on: WCN6750 hw1.0 AHB WLAN.MSL.1.0.1-00573-QCAMSLSWPLZ-1

Signed-off-by: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/ahb.c     | 2 ++
 drivers/net/wireless/ath/ath11k/core.c    | 7 +++++++
 drivers/net/wireless/ath/ath11k/hw.h      | 1 +
 drivers/net/wireless/ath/ath11k/pci_cmn.c | 4 +++-
 4 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/ahb.c b/drivers/net/wireless/ath/ath11k/ahb.c
index 4301f62..fd3bb43 100644
--- a/drivers/net/wireless/ath/ath11k/ahb.c
+++ b/drivers/net/wireless/ath/ath11k/ahb.c
@@ -331,6 +331,8 @@ static void ath11k_ahb_ext_irq_enable(struct ath11k_base *ab)
 		struct ath11k_ext_irq_grp *irq_grp = &ab->ext_irq_grp[i];
 
 		if (!irq_grp->napi_enabled) {
+			if (ab->hw_params.threaded_napi)
+				dev_set_threaded(&irq_grp->napi_ndev, true);
 			napi_enable(&irq_grp->napi);
 			irq_grp->napi_enabled = true;
 		}
diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
index 643f655..161bddf 100644
--- a/drivers/net/wireless/ath/ath11k/core.c
+++ b/drivers/net/wireless/ath/ath11k/core.c
@@ -99,6 +99,7 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.supports_rssi_stats = false,
 		.fw_wmi_diag_event = false,
 		.non_wow_suspend = false,
+		.threaded_napi = false,
 	},
 	{
 		.hw_rev = ATH11K_HW_IPQ6018_HW10,
@@ -164,6 +165,7 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.supports_rssi_stats = false,
 		.fw_wmi_diag_event = false,
 		.non_wow_suspend = false,
+		.threaded_napi = false,
 	},
 	{
 		.name = "qca6390 hw2.0",
@@ -228,6 +230,7 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.supports_rssi_stats = true,
 		.fw_wmi_diag_event = true,
 		.non_wow_suspend = false,
+		.threaded_napi = false,
 	},
 	{
 		.name = "qcn9074 hw1.0",
@@ -292,6 +295,7 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.supports_rssi_stats = false,
 		.fw_wmi_diag_event = false,
 		.non_wow_suspend = false,
+		.threaded_napi = false,
 	},
 	{
 		.name = "wcn6855 hw2.0",
@@ -356,6 +360,7 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.supports_rssi_stats = true,
 		.fw_wmi_diag_event = true,
 		.non_wow_suspend = false,
+		.threaded_napi = false,
 	},
 	{
 		.name = "wcn6855 hw2.1",
@@ -419,6 +424,7 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.supports_rssi_stats = true,
 		.fw_wmi_diag_event = true,
 		.non_wow_suspend = false,
+		.threaded_napi = false,
 	},
 	{
 		.name = "wcn6750 hw1.0",
@@ -482,6 +488,7 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.supports_rssi_stats = true,
 		.fw_wmi_diag_event = false,
 		.non_wow_suspend = true,
+		.threaded_napi = true,
 	},
 };
 
diff --git a/drivers/net/wireless/ath/ath11k/hw.h b/drivers/net/wireless/ath/ath11k/hw.h
index ed4b72b..d33b9b7 100644
--- a/drivers/net/wireless/ath/ath11k/hw.h
+++ b/drivers/net/wireless/ath/ath11k/hw.h
@@ -194,6 +194,7 @@ struct ath11k_hw_params {
 	bool fw_wmi_diag_event;
 	bool non_wow_suspend;
 	bool cold_boot_fw_restart;
+	bool threaded_napi;
 };
 
 struct ath11k_hw_ops {
diff --git a/drivers/net/wireless/ath/ath11k/pci_cmn.c b/drivers/net/wireless/ath/ath11k/pci_cmn.c
index 047fcd7..6550f7c 100644
--- a/drivers/net/wireless/ath/ath11k/pci_cmn.c
+++ b/drivers/net/wireless/ath/ath11k/pci_cmn.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: BSD-3-Clause-Clear
 /*
  * Copyright (c) 2019-2021 The Linux Foundation. All rights reserved.
- * Copyright (c) 2021, Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2021-2022, Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
 #include "core.h"
@@ -425,6 +425,8 @@ void ath11k_pci_ext_irq_enable(struct ath11k_base *ab)
 		struct ath11k_ext_irq_grp *irq_grp = &ab->ext_irq_grp[i];
 
 		if (!irq_grp->napi_enabled) {
+			if (ab->hw_params.threaded_napi)
+				dev_set_threaded(&irq_grp->napi_ndev, true);
 			napi_enable(&irq_grp->napi);
 			irq_grp->napi_enabled = true;
 		}
-- 
2.7.4


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
