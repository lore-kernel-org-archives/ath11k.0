Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BB74C433F5
	for <ath11k@archiver.kernel.org>; Mon, 28 Mar 2022 06:10:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sd22lBZPPoA3hpH0C+wyKScQlAdGy66P+Z98F5QFLfQ=; b=s/kxWU5BBE5qLU
	P9ZyLAIeIDszAN+GDix+ZHI0qXf201mTgi03+ljD/VAw1xwptSvIUypWxTUAuOhgvYJSrbuQ0SaEs
	HKZzztTu0c6VDym3glPpw6PnzZpOQu8xeT41IS4r7jGNhnHiY5EqDwdI7LDs3qUk7USMJUFpTF1j3
	tYQyySifbZTwnzEOC373w5K61mgMWW+8GUQL9A2X5gkUcB73UzdbI5sywK1NV8ollLqCleJO87RM5
	l0D6SZAFTQYYm6vKfbPSEYTMJXb8jitW/27M0ZdOa2ygVlaJF8XHL0b3fPkc4JGnkXcLaCZ4Qv9do
	DZ3D+iOweOD4sdJldg5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nYiaS-007QCK-7k; Mon, 28 Mar 2022 06:10:44 +0000
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nYiaC-007PyT-Dw
 for ath11k@lists.infradead.org; Mon, 28 Mar 2022 06:10:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1648447828; x=1679983828;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8S+bVEcyHGRAYP7LA7lx1oMoBf93I1QzQ/FaRoN4iTE=;
 b=GD2zYfUNPNMW7YFm95ePrWCbP8Uq2bk/1LUgrlKU6YwZTszDBfD5/16u
 SqmMDqn5cqf5S0x5eDHzGLeDJZ2EtBw+fjIEzL2VB150EP1pBoBQnZ94T
 nLvFmbafvb+jvavi0NRZkd932JbNTOkyRPnbwatDNbuT2Ou28rG7dRoXP I=;
Received: from unknown (HELO ironmsg02-sd.qualcomm.com) ([10.53.140.142])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 27 Mar 2022 23:10:27 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg02-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2022 23:10:27 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Sun, 27 Mar 2022 23:10:27 -0700
Received: from mpubbise-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Sun, 27 Mar 2022 23:10:25 -0700
From: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, Manikanta Pubbisetty
 <quic_mpubbise@quicinc.com>
Subject: [PATCH v3 09/12] ath11k: Do not put HW in DBS mode for WCN6750
Date: Mon, 28 Mar 2022 11:39:34 +0530
Message-ID: <20220328060937.16738-10-quic_mpubbise@quicinc.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220328060937.16738-1-quic_mpubbise@quicinc.com>
References: <20220328060937.16738-1-quic_mpubbise@quicinc.com>
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220327_231028_623163_49377D6C 
X-CRM114-Status: GOOD (  12.73  )
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

Though WCN6750 is a single PDEV device, it is not a
DBS solution. So, do not put HW in DBS mode for WCN6750.

Tested-on: WCN6750 hw1.0 AHB WLAN.MSL.1.0.1-00573-QCAMSLSWPLZ-1
Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-01720.1-QCAHSPSWPL_V1_V2_SILICONZ_LITE-1
Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.5.0.1-01100-QCAHKSWPL_SILICONZ-1
Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.4.0.1-00192-QCAHKSWPL_SILICONZ-1

Signed-off-by: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/core.c | 2 +-
 drivers/net/wireless/ath/ath11k/wmi.c  | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
index 1955426ca549..d9a06629651c 100644
--- a/drivers/net/wireless/ath/ath11k/core.c
+++ b/drivers/net/wireless/ath/ath11k/core.c
@@ -1249,7 +1249,7 @@ static int ath11k_core_start(struct ath11k_base *ab,
 	}
 
 	/* put hardware to DBS mode */
-	if (ab->hw_params.single_pdev_only) {
+	if (ab->hw_params.single_pdev_only && ab->hw_params.num_rxmda_per_pdev > 1) {
 		ret = ath11k_wmi_set_hw_mode(ab, WMI_HOST_HW_MODE_DBS);
 		if (ret) {
 			ath11k_err(ab, "failed to send dbs mode: %d\n", ret);
diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index 7f97c26bffd9..119fe1e6a07a 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: BSD-3-Clause-Clear
 /*
  * Copyright (c) 2018-2019 The Linux Foundation. All rights reserved.
+ * Copyright (c) 2021, Qualcomm Innovation Center, Inc. All rights reserved.
  */
 #include <linux/skbuff.h>
 #include <linux/ctype.h>
@@ -8196,7 +8197,7 @@ int ath11k_wmi_attach(struct ath11k_base *ab)
 	ab->wmi_ab.preferred_hw_mode = WMI_HOST_HW_MODE_MAX;
 
 	/* It's overwritten when service_ext_ready is handled */
-	if (ab->hw_params.single_pdev_only)
+	if (ab->hw_params.single_pdev_only && ab->hw_params.num_rxmda_per_pdev > 1)
 		ab->wmi_ab.preferred_hw_mode = WMI_HOST_HW_MODE_SINGLE;
 
 	/* TODO: Init remaining wmi soc resources required */
-- 
2.35.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
