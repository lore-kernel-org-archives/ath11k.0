Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFF07C433F5
	for <ath11k@archiver.kernel.org>; Fri, 29 Apr 2022 17:06:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XkfGmBrF0G+4FcH2axOQMLGmTKPU0ASml56qrdxvElI=; b=h/zkK4GxlAgwAB
	wT5m/EndNvUOeppLtpsO50855bu0rcWG53mgD9ytMe1830GfHZNGqtfjDVGETVpdSmHNaWlCZN/D9
	knTWs3559xOqG3Qo5xGdOdcrlzXR2E7kCVKnDjSRDjVmi9N+gRn7d+nq9GtrxcuBvXCFMXb65Gt1a
	csXIszBKKJgX9hZg8+zT1DqxOaK82PXN0goZmFUocElwSR7Rf3Kni5vaLltaf5XsppQX0PJCCENqJ
	Ny8+C6K0/z2cOrgmFW9CoWplLHRFRrDe38f/aq3ymZwWkpCXN2pJFwiawvlJSqNgzt6Nhkd/RyTO0
	XkxQY7ToxoJmkLjnKH6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nkU4S-00C2Kq-0p; Fri, 29 Apr 2022 17:06:20 +0000
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nkU4N-00C2FE-8i
 for ath11k@lists.infradead.org; Fri, 29 Apr 2022 17:06:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1651251975; x=1682787975;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jhcO1/XDk9eYv2vx9nomKvxmfptn8k84BSut0e3auW0=;
 b=CQPoaPkUswpVkoUmI9zJBZWE4iVQWwnc8gyMb5QRt2dtJfwtQL7JP26n
 Irp2R7uw7ADYeb/SjdrikuKMEqhPqxTX+jiGDYSaC0psR9pooepy3TcQ0
 Rjfa7/9D7wYwObUfg0NVgi/S6OtbH6pdBiAi0Su41OAhaA9sgtPt4WFuk k=;
Received: from unknown (HELO ironmsg02-sd.qualcomm.com) ([10.53.140.142])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 29 Apr 2022 10:06:05 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg02-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2022 10:06:05 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Fri, 29 Apr 2022 10:05:43 -0700
Received: from mpubbise-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Fri, 29 Apr 2022 10:05:41 -0700
From: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <robh@kernel.org>, <mka@chromium.org>, Manikanta Pubbisetty
 <quic_mpubbise@quicinc.com>
Subject: [PATCH v7 6/9] ath11k: Add QMI changes for WCN6750
Date: Fri, 29 Apr 2022 22:34:59 +0530
Message-ID: <20220429170502.20080-7-quic_mpubbise@quicinc.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220429170502.20080-1-quic_mpubbise@quicinc.com>
References: <20220429170502.20080-1-quic_mpubbise@quicinc.com>
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220429_100615_351104_DD85F737 
X-CRM114-Status: GOOD (  19.43  )
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
index 3be4327b4d9c..64cf87fd6a7f 100644
--- a/drivers/net/wireless/ath/ath11k/core.c
+++ b/drivers/net/wireless/ath/ath11k/core.c
@@ -109,6 +109,7 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.hybrid_bus_type = false,
 		.dp_window_idx = 0,
 		.ce_window_idx = 0,
+		.fixed_fw_mem = false,
 	},
 	{
 		.hw_rev = ATH11K_HW_IPQ6018_HW10,
@@ -183,6 +184,7 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.hybrid_bus_type = false,
 		.dp_window_idx = 0,
 		.ce_window_idx = 0,
+		.fixed_fw_mem = false,
 	},
 	{
 		.name = "qca6390 hw2.0",
@@ -256,6 +258,7 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.hybrid_bus_type = false,
 		.dp_window_idx = 0,
 		.ce_window_idx = 0,
+		.fixed_fw_mem = false,
 	},
 	{
 		.name = "qcn9074 hw1.0",
@@ -329,6 +332,7 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.hybrid_bus_type = false,
 		.dp_window_idx = 3,
 		.ce_window_idx = 2,
+		.fixed_fw_mem = false,
 	},
 	{
 		.name = "wcn6855 hw2.0",
@@ -402,6 +406,7 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.hybrid_bus_type = false,
 		.dp_window_idx = 0,
 		.ce_window_idx = 0,
+		.fixed_fw_mem = false,
 	},
 	{
 		.name = "wcn6855 hw2.1",
@@ -474,6 +479,7 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.hybrid_bus_type = false,
 		.dp_window_idx = 0,
 		.ce_window_idx = 0,
+		.fixed_fw_mem = false,
 	},
 	{
 		.name = "wcn6750 hw1.0",
@@ -543,6 +549,7 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.hybrid_bus_type = true,
 		.dp_window_idx = 1,
 		.ce_window_idx = 2,
+		.fixed_fw_mem = true,
 	},
 };
 
diff --git a/drivers/net/wireless/ath/ath11k/hw.h b/drivers/net/wireless/ath/ath11k/hw.h
index b63538084215..b5a4758a6bc5 100644
--- a/drivers/net/wireless/ath/ath11k/hw.h
+++ b/drivers/net/wireless/ath/ath11k/hw.h
@@ -203,6 +203,7 @@ struct ath11k_hw_params {
 	bool hybrid_bus_type;
 	u8 dp_window_idx;
 	u8 ce_window_idx;
+	bool fixed_fw_mem;
 };
 
 struct ath11k_hw_ops {
diff --git a/drivers/net/wireless/ath/ath11k/qmi.c b/drivers/net/wireless/ath/ath11k/qmi.c
index 71e25cb094f8..3eef6a162cc2 100644
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
