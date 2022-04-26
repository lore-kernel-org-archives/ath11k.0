Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E69AC433F5
	for <ath11k@archiver.kernel.org>; Tue, 26 Apr 2022 14:55:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NFipprfwD6Kn1SnZEj8ma1nzd5TbmV9e9wQ+g55AMDY=; b=27eUg5TMlEtXLS
	raMuwpyKxz/wh896egruCzOQHfDamnZqe4ivjtJFIICozD8pNmG626PCCi3ip14nRHNoEAe2brjp2
	F1tUvLXuDJwzPTQXDvpnDH3blH/yJD6AKX+kHAXbjqHMIJ6FAmiJr8SGhUavny37SVN8ik0Zku++Q
	QcLOQ5BVHrBwP2T3avBr2FHUnMaHqa5eIR01P0oekVcE/SXIk4Kdo9WHurTqVxotBeS63PsV/Di7/
	xHzKyuK96vb5oZvQNeQrqbEmaERINKm8oXSGUeHwgmLYdJH7sjJzuGbn5OQtObnnHXQaMlidOmfRH
	fkp6Cp/x+vL+sFBHqR6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1njMbR-00F3NL-N9; Tue, 26 Apr 2022 14:55:45 +0000
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1njMbM-00F3FZ-6M
 for ath11k@lists.infradead.org; Tue, 26 Apr 2022 14:55:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1650984940; x=1682520940;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5/ArhOJ2YSU8SxnNkQxv0N1Era+oI/wjwnaEUAY7DRg=;
 b=D7L3PHR/1meSel4CPcnyXaCs87lqWoOOqniVZOcLElqwnYso7NeiPvTv
 n/mz2n2sDRFCzF7emJPtJv2e3nYQCsCFi5zuNGbA953wU7zI9pMhBvLvR
 4RVUSVfBNcEJa0M+3hrV6Ik4nXa01wmInbrd3WXlo56MFJSOBfCJi+zbt Y=;
Received: from unknown (HELO ironmsg02-sd.qualcomm.com) ([10.53.140.142])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 26 Apr 2022 07:55:40 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg02-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2022 07:55:39 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Tue, 26 Apr 2022 07:55:39 -0700
Received: from mpubbise-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Tue, 26 Apr 2022 07:55:37 -0700
From: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <robh@kernel.org>, <mka@chromium.org>, Manikanta Pubbisetty
 <quic_mpubbise@quicinc.com>
Subject: [PATCH v5 06/12] ath11k: Add QMI changes for WCN6750
Date: Tue, 26 Apr 2022 20:24:50 +0530
Message-ID: <20220426145456.8055-7-quic_mpubbise@quicinc.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220426145456.8055-1-quic_mpubbise@quicinc.com>
References: <20220426145456.8055-1-quic_mpubbise@quicinc.com>
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220426_075540_320994_CA8FE663 
X-CRM114-Status: GOOD (  18.99  )
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

In the case of WCN6750, FW doesn't request for DDR memory
via QMI, instead it uses a fixed 12MB reserved Memory region
in the DDR which is called as MSA region. As a result, QMI
message sequence is not same as other ath11k supported devices.

Also, M3 firmware will be bundled into the FW and will be
downloaded to the target as part of Q6 boot.

This is the QMI flow in the case of WCN6750,

1) QMI firmware indication REQ/RESP
2) QMI host capability REQ/RESP
3) QMI target capability REQ/RESP
4) QMI device info REQ/RESP
5) QMI BDF download
6) QMI FW ready

Tested-on: WCN6750 hw1.0 AHB WLAN.MSL.1.0.1-00887-QCAMSLSWPLZ-1
Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-01720.1-QCAHSPSWPL_V1_V2_SILICONZ_LITE-1
Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.5.0.1-01100-QCAHKSWPL_SILICONZ-1
Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.4.0.1-00192-QCAHKSWPL_SILICONZ-1

Signed-off-by: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/core.c |  7 +++
 drivers/net/wireless/ath/ath11k/hw.h   |  1 +
 drivers/net/wireless/ath/ath11k/qmi.c  | 76 ++++++++++++++++----------
 3 files changed, 56 insertions(+), 28 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
index 78419a021075..ed600617a71a 100644
--- a/drivers/net/wireless/ath/ath11k/core.c
+++ b/drivers/net/wireless/ath/ath11k/core.c
@@ -102,6 +102,7 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.dbr_debug_support = true,
 		.global_reset = false,
 		.bios_sar_capa = NULL,
+		.fixed_fw_mem = false,
 	},
 	{
 		.hw_rev = ATH11K_HW_IPQ6018_HW10,
@@ -169,6 +170,7 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.dbr_debug_support = true,
 		.global_reset = false,
 		.bios_sar_capa = NULL,
+		.fixed_fw_mem = false,
 	},
 	{
 		.name = "qca6390 hw2.0",
@@ -235,6 +237,7 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.dbr_debug_support = false,
 		.global_reset = true,
 		.bios_sar_capa = NULL,
+		.fixed_fw_mem = false,
 	},
 	{
 		.name = "qcn9074 hw1.0",
@@ -301,6 +304,7 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.dbr_debug_support = true,
 		.global_reset = false,
 		.bios_sar_capa = NULL,
+		.fixed_fw_mem = false,
 	},
 	{
 		.name = "wcn6855 hw2.0",
@@ -367,6 +371,7 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.dbr_debug_support = false,
 		.global_reset = true,
 		.bios_sar_capa = &ath11k_hw_sar_capa_wcn6855,
+		.fixed_fw_mem = false,
 	},
 	{
 		.name = "wcn6855 hw2.1",
@@ -432,6 +437,7 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.dbr_debug_support = false,
 		.global_reset = true,
 		.bios_sar_capa = &ath11k_hw_sar_capa_wcn6855,
+		.fixed_fw_mem = false,
 	},
 	{
 		.name = "wcn6750 hw1.0",
@@ -494,6 +500,7 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.dbr_debug_support = false,
 		.global_reset = false,
 		.bios_sar_capa = NULL,
+		.fixed_fw_mem = true,
 	},
 };
 
diff --git a/drivers/net/wireless/ath/ath11k/hw.h b/drivers/net/wireless/ath/ath11k/hw.h
index b7ece3d5678c..c2ee39f977c2 100644
--- a/drivers/net/wireless/ath/ath11k/hw.h
+++ b/drivers/net/wireless/ath/ath11k/hw.h
@@ -196,6 +196,7 @@ struct ath11k_hw_params {
 	bool dbr_debug_support;
 	bool global_reset;
 	const struct cfg80211_sar_capa *bios_sar_capa;
+	bool fixed_fw_mem;
 };
 
 struct ath11k_hw_ops {
diff --git a/drivers/net/wireless/ath/ath11k/qmi.c b/drivers/net/wireless/ath/ath11k/qmi.c
index df49f8b68556..57804c152692 100644
--- a/drivers/net/wireless/ath/ath11k/qmi.c
+++ b/drivers/net/wireless/ath/ath11k/qmi.c
@@ -1799,10 +1799,6 @@ static int ath11k_qmi_fw_ind_register_send(struct ath11k_base *ab)
 	req->client_id = QMI_WLANFW_CLIENT_ID;
 	req->fw_ready_enable_valid = 1;
 	req->fw_ready_enable = 1;
-	req->request_mem_enable_valid = 1;
-	req->request_mem_enable = 1;
-	req->fw_mem_ready_enable_valid = 1;
-	req->fw_mem_ready_enable = 1;
 	req->cal_done_enable_valid = 1;
 	req->cal_done_enable = 1;
 	req->fw_init_done_enable_valid = 1;
@@ -1811,6 +1807,17 @@ static int ath11k_qmi_fw_ind_register_send(struct ath11k_base *ab)
 	req->pin_connect_result_enable_valid = 0;
 	req->pin_connect_result_enable = 0;
 
+	/* WCN6750 doesn't request for DDR memory via QMI,
+	 * instead it uses a fixed 12MB reserved memory
+	 * region in DDR.
+	 */
+	if (!ab->hw_params.fixed_fw_mem) {
+		req->request_mem_enable_valid = 1;
+		req->request_mem_enable = 1;
+		req->fw_mem_ready_enable_valid = 1;
+		req->fw_mem_ready_enable = 1;
+	}
+
 	ret = qmi_txn_init(handle, &txn,
 			   qmi_wlanfw_ind_register_resp_msg_v01_ei, resp);
 	if (ret < 0)
@@ -2839,27 +2846,6 @@ ath11k_qmi_driver_event_post(struct ath11k_qmi *qmi,
 	return 0;
 }
 
-static int ath11k_qmi_event_server_arrive(struct ath11k_qmi *qmi)
-{
-	struct ath11k_base *ab = qmi->ab;
-	int ret;
-
-	ret = ath11k_qmi_fw_ind_register_send(ab);
-	if (ret < 0) {
-		ath11k_warn(ab, "failed to send qmi firmware indication: %d\n",
-			    ret);
-		return ret;
-	}
-
-	ret = ath11k_qmi_host_cap_send(ab);
-	if (ret < 0) {
-		ath11k_warn(ab, "failed to send qmi host cap: %d\n", ret);
-		return ret;
-	}
-
-	return ret;
-}
-
 static int ath11k_qmi_event_mem_request(struct ath11k_qmi *qmi)
 {
 	struct ath11k_base *ab = qmi->ab;
@@ -2901,9 +2887,33 @@ static int ath11k_qmi_event_load_bdf(struct ath11k_qmi *qmi)
 		return ret;
 	}
 
-	ret = ath11k_qmi_wlanfw_m3_info_send(ab);
+	return 0;
+}
+
+static int ath11k_qmi_event_server_arrive(struct ath11k_qmi *qmi)
+{
+	struct ath11k_base *ab = qmi->ab;
+	int ret;
+
+	ret = ath11k_qmi_fw_ind_register_send(ab);
+	if (ret < 0) {
+		ath11k_warn(ab, "failed to send qmi firmware indication: %d\n",
+			    ret);
+		return ret;
+	}
+
+	ret = ath11k_qmi_host_cap_send(ab);
 	if (ret < 0) {
-		ath11k_warn(ab, "failed to send qmi m3 info req: %d\n", ret);
+		ath11k_warn(ab, "failed to send qmi host cap: %d\n", ret);
+		return ret;
+	}
+
+	if (!ab->hw_params.fixed_fw_mem)
+		return ret;
+
+	ret = ath11k_qmi_event_load_bdf(qmi);
+	if (ret < 0) {
+		ath11k_warn(ab, "qmi failed to download BDF:%d\n", ret);
 		return ret;
 	}
 
@@ -3103,8 +3113,18 @@ static void ath11k_qmi_driver_event_work(struct work_struct *work)
 			break;
 		case ATH11K_QMI_EVENT_FW_MEM_READY:
 			ret = ath11k_qmi_event_load_bdf(qmi);
-			if (ret < 0)
+			if (ret < 0) {
 				set_bit(ATH11K_FLAG_QMI_FAIL, &ab->dev_flags);
+				break;
+			}
+
+			ret = ath11k_qmi_wlanfw_m3_info_send(ab);
+			if (ret < 0) {
+				ath11k_warn(ab,
+					    "failed to send qmi m3 info req: %d\n", ret);
+				set_bit(ATH11K_FLAG_QMI_FAIL, &ab->dev_flags);
+			}
+
 			break;
 		case ATH11K_QMI_EVENT_FW_READY:
 			clear_bit(ATH11K_FLAG_QMI_FAIL, &ab->dev_flags);
-- 
2.35.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
