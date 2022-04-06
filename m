Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9CFFC433F5
	for <ath11k@archiver.kernel.org>; Wed,  6 Apr 2022 09:42:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QmZcNO9Jz1XHhdJmvDipCNN9H3J7U4NoZSFDODkaePg=; b=2qpYf85XeD0WCj
	yX1muTr3Vd8YjraPBXrhy6w1BtoTnDYm2NBzUpMKvceQzZ/TJODNtRBOKP3h9Sk12zmiXmfaY0yap
	EG9rtYbwEYnx8MHILmiInhgL8DcOh/wlQx7QI8NmZktHHTzh8e9ikPzgq7RFiN01M4ToP+AeWRv9N
	Ab9nVzJ3cv/8/4Lax6c70wrbby89Us33Rsa9F+c4qtmu/gkTyMpmFUOxsVoW8SaG/JGsktglds3XI
	V1qW5Zsjt/2eGPboTBz5mMng87EdLR0LVQLFE3eLhCl6TOlBhkmuX+TU4NaoPrIHRBpx40aASOLi9
	fe3WOfgpGaBWAIOW0NkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nc2B0-0053as-E0; Wed, 06 Apr 2022 09:42:10 +0000
Received: from alexa-out.qualcomm.com ([129.46.98.28])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nc2Al-0053PJ-Vs
 for ath11k@lists.infradead.org; Wed, 06 Apr 2022 09:41:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1649238116; x=1680774116;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qEli3OM61q29quVb4hWbU5LNPZDYGQjOjkLxvVl1CEQ=;
 b=hl2cVcc1bjskQMp6OT4Ei4XSFlZ3gzwb0MJpF8Bkk+iuNzt2omI2VEFS
 L29FEHraLNFNViGsojp4RjsGPAo/tf1M+S8N/Jr0OYikElCdgH7Jj4NVg
 cuhlqrYK7xdAe7R7aFV7myULxbS7W+C/Srih0h12/wNA/M+mEMJgG0+X8 4=;
Received: from ironmsg07-lv.qualcomm.com ([10.47.202.151])
 by alexa-out.qualcomm.com with ESMTP; 06 Apr 2022 02:41:55 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg07-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2022 02:41:55 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 6 Apr 2022 02:41:55 -0700
Received: from mpubbise-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 6 Apr 2022 02:41:52 -0700
From: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <robh@kernel.org>, <mka@chromium.org>, Manikanta Pubbisetty
 <quic_mpubbise@quicinc.com>
Subject: [PATCH v4 11/12] ath11k: Update WBM idle ring HP after FW mode on
Date: Wed, 6 Apr 2022 15:11:05 +0530
Message-ID: <20220406094107.17878-12-quic_mpubbise@quicinc.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220406094107.17878-1-quic_mpubbise@quicinc.com>
References: <20220406094107.17878-1-quic_mpubbise@quicinc.com>
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220406_024156_161510_60FBF140 
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Currently, WBM idle ring HP is updated much before the shadow
configuration is sent to the FW. Any update to the shadow
registers before FW mode on request would not be reflected
on to the actual HW registers failing to bring up the device.
Send FW mode ON QMI request before WBM idle ring HP update
to fix this problem.

Tested-on: WCN6750 hw1.0 AHB WLAN.MSL.1.0.1-00573-QCAMSLSWPLZ-1
Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-01720.1-QCAHSPSWPL_V1_V2_SILICONZ_LITE-1
Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.5.0.1-01100-QCAHKSWPL_SILICONZ-1
Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.4.0.1-00192-QCAHKSWPL_SILICONZ-1

Signed-off-by: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/ce.c   |  4 +--
 drivers/net/wireless/ath/ath11k/core.c | 45 ++++++++++++++++++--------
 2 files changed, 32 insertions(+), 17 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/ce.c b/drivers/net/wireless/ath/ath11k/ce.c
index aaa7b05ff49d..c14c51f38709 100644
--- a/drivers/net/wireless/ath/ath11k/ce.c
+++ b/drivers/net/wireless/ath/ath11k/ce.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: BSD-3-Clause-Clear
 /*
  * Copyright (c) 2018-2019 The Linux Foundation. All rights reserved.
+ * Copyright (c) 2021, Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
 #include "dp_rx.h"
@@ -918,9 +919,6 @@ int ath11k_ce_init_pipes(struct ath11k_base *ab)
 	int i;
 	int ret;
 
-	ath11k_ce_get_shadow_config(ab, &ab->qmi.ce_cfg.shadow_reg_v2,
-				    &ab->qmi.ce_cfg.shadow_reg_v2_len);
-
 	for (i = 0; i < ab->hw_params.ce_count; i++) {
 		pipe = &ab->ce.ce_pipe[i];
 
diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
index 17db898166f0..82044f605a85 100644
--- a/drivers/net/wireless/ath/ath11k/core.c
+++ b/drivers/net/wireless/ath/ath11k/core.c
@@ -1189,21 +1189,14 @@ static void ath11k_core_pdev_destroy(struct ath11k_base *ab)
 	ath11k_debugfs_pdev_destroy(ab);
 }
 
-static int ath11k_core_start(struct ath11k_base *ab,
-			     enum ath11k_firmware_mode mode)
+static int ath11k_core_start(struct ath11k_base *ab)
 {
 	int ret;
 
-	ret = ath11k_qmi_firmware_start(ab, mode);
-	if (ret) {
-		ath11k_err(ab, "failed to attach wmi: %d\n", ret);
-		return ret;
-	}
-
 	ret = ath11k_wmi_attach(ab);
 	if (ret) {
 		ath11k_err(ab, "failed to attach wmi: %d\n", ret);
-		goto err_firmware_stop;
+		return ret;
 	}
 
 	ret = ath11k_htc_init(ab);
@@ -1303,8 +1296,23 @@ static int ath11k_core_start(struct ath11k_base *ab,
 	ath11k_hif_stop(ab);
 err_wmi_detach:
 	ath11k_wmi_detach(ab);
-err_firmware_stop:
-	ath11k_qmi_firmware_stop(ab);
+
+	return ret;
+}
+
+static int ath11k_core_start_firmware(struct ath11k_base *ab,
+				      enum ath11k_firmware_mode mode)
+{
+	int ret;
+
+	ath11k_ce_get_shadow_config(ab, &ab->qmi.ce_cfg.shadow_reg_v2,
+				    &ab->qmi.ce_cfg.shadow_reg_v2_len);
+
+	ret = ath11k_qmi_firmware_start(ab, mode);
+	if (ret) {
+		ath11k_err(ab, "failed to send firmware start: %d\n", ret);
+		return ret;
+	}
 
 	return ret;
 }
@@ -1334,16 +1342,22 @@ int ath11k_core_qmi_firmware_ready(struct ath11k_base *ab)
 {
 	int ret;
 
+	ret = ath11k_core_start_firmware(ab, ATH11K_FIRMWARE_MODE_NORMAL);
+	if (ret) {
+		ath11k_err(ab, "failed to start firmware: %d\n", ret);
+		return ret;
+	}
+
 	ret = ath11k_ce_init_pipes(ab);
 	if (ret) {
 		ath11k_err(ab, "failed to initialize CE: %d\n", ret);
-		return ret;
+		goto err_firmware_stop;
 	}
 
 	ret = ath11k_dp_alloc(ab);
 	if (ret) {
 		ath11k_err(ab, "failed to init DP: %d\n", ret);
-		return ret;
+		goto err_firmware_stop;
 	}
 
 	switch (ath11k_crypto_mode) {
@@ -1364,7 +1378,7 @@ int ath11k_core_qmi_firmware_ready(struct ath11k_base *ab)
 		set_bit(ATH11K_FLAG_RAW_MODE, &ab->dev_flags);
 
 	mutex_lock(&ab->core_lock);
-	ret = ath11k_core_start(ab, ATH11K_FIRMWARE_MODE_NORMAL);
+	ret = ath11k_core_start(ab);
 	if (ret) {
 		ath11k_err(ab, "failed to start core: %d\n", ret);
 		goto err_dp_free;
@@ -1393,6 +1407,9 @@ int ath11k_core_qmi_firmware_ready(struct ath11k_base *ab)
 err_dp_free:
 	ath11k_dp_free(ab);
 	mutex_unlock(&ab->core_lock);
+err_firmware_stop:
+	ath11k_qmi_firmware_stop(ab);
+
 	return ret;
 }
 
-- 
2.35.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
