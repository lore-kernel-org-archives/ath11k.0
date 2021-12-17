Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39EBCC433EF
	for <ath11k@archiver.kernel.org>; Fri, 17 Dec 2021 11:36:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=rr6vDXRxwCzO1Qtrwv2NaFFGI1PeR+n3RdTi3DbBIVM=; b=tOKqgctf+q1x/e
	dcaPI8oBtV1Bm6VwcrjSrL26GjhihD+52SO7NETIOnWuOGSL8BGl5n86BZT5W0mMri5n3tgaqdIu6
	6MKvc4j7mfroZ1xZwL8bkOc8zJiVfVC/xLxRgJqEdgFxhw+do3/CVqPxI5ftKVpyCcCVlvDaylWYb
	+/PUu9K1bsu/e6WEwVWPLAZSMFtBEFCvAomVfJ7wTBExAn+WBz0Rpym+jX8ZKsIkLtlRdtWfJTIO8
	BH/+zCuVnz7BIjSs/uX0Hp5x/gSv1d9Xi/jX17sKZ2KJZxj1xkkreU5urnh8TObXfUWCkcgXXFHYN
	n9GUV+9uystvSU4XjCmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1myBX0-009rew-Hs; Fri, 17 Dec 2021 11:36:10 +0000
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1myBNj-009nYD-LI
 for ath11k@lists.infradead.org; Fri, 17 Dec 2021 11:26:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1639740395; x=1671276395;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=xQHI8qkvGBUqrpLQoSf8lIf8WuLZpUK5H/P9FP0iIVc=;
 b=My1AlH0RVtgUzsA6CgYk7Kwpy+bJkp2sX+twk2GlGZBCfsZ5Q+v/c5t7
 NyQ1Pjtd8Kjn+tzvFEv+txguOhTgUi7DGF+9LKVvllcuL9bQJ1iD7lbsd
 kfJPxepxxmLYql1nax2DDF3NzlWIlvoW/qOu0nsBQWndd2WOTrXSuvrGc U=;
Received: from unknown (HELO ironmsg05-sd.qualcomm.com) ([10.53.140.145])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 17 Dec 2021 03:26:33 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg05-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2021 03:26:32 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Fri, 17 Dec 2021 03:26:33 -0800
Received: from FUZHOU.qca.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Fri, 17 Dec 2021 03:26:31 -0800
From: Cheng Wang <quic_chengwan@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_chengwan@quicinc.com>
Subject: [PATCH v2] ath11k: add support of firmware logging for WCN6855
Date: Fri, 17 Dec 2021 19:26:05 +0800
Message-ID: <20211217112605.2823570-1-quic_chengwan@quicinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211217_032635_782825_27A54243 
X-CRM114-Status: GOOD (  17.97  )
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

Host enables WMI firmware logging feature via QMI message.
Host receives firmware logging messages on WMI_DIAG_EVENTID, then
sends logging messages to user space via event tracing infrastructure.

Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-01720.1-QCAHSPSWPL_V1_V2_SILICONZ_LITE-1

Signed-off-by: Cheng Wang <quic_chengwan@quicinc.com>
---
v2: change per comments from Kalle
    fails to apply, rebase.

 drivers/net/wireless/ath/ath11k/core.c  |  6 ++
 drivers/net/wireless/ath/ath11k/hw.h    |  1 +
 drivers/net/wireless/ath/ath11k/qmi.c   | 94 +++++++++++++++++++++++++
 drivers/net/wireless/ath/ath11k/qmi.h   | 12 ++++
 drivers/net/wireless/ath/ath11k/trace.h | 28 ++++++++
 drivers/net/wireless/ath/ath11k/wmi.c   | 10 +++
 6 files changed, 151 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
index 606e867c36ec..c46cdd5ffffb 100644
--- a/drivers/net/wireless/ath/ath11k/core.c
+++ b/drivers/net/wireless/ath/ath11k/core.c
@@ -91,6 +91,7 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.supports_dynamic_smps_6ghz = false,
 		.alloc_cacheable_memory = true,
 		.wakeup_mhi = false,
+		.fw_wmi_diag_event = false,
 	},
 	{
 		.hw_rev = ATH11K_HW_IPQ6018_HW10,
@@ -149,6 +150,7 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.supports_dynamic_smps_6ghz = false,
 		.alloc_cacheable_memory = true,
 		.wakeup_mhi = false,
+		.fw_wmi_diag_event = false,
 	},
 	{
 		.name = "qca6390 hw2.0",
@@ -206,6 +208,7 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.supports_dynamic_smps_6ghz = false,
 		.alloc_cacheable_memory = false,
 		.wakeup_mhi = true,
+		.fw_wmi_diag_event = true,
 	},
 	{
 		.name = "qcn9074 hw1.0",
@@ -263,6 +266,7 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.supports_dynamic_smps_6ghz = true,
 		.alloc_cacheable_memory = true,
 		.wakeup_mhi = false,
+		.fw_wmi_diag_event = false,
 	},
 	{
 		.name = "wcn6855 hw2.0",
@@ -320,6 +324,7 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.supports_dynamic_smps_6ghz = false,
 		.alloc_cacheable_memory = false,
 		.wakeup_mhi = true,
+		.fw_wmi_diag_event = true,
 	},
 	{
 		.name = "wcn6855 hw2.1",
@@ -376,6 +381,7 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.supports_dynamic_smps_6ghz = false,
 		.alloc_cacheable_memory = false,
 		.wakeup_mhi = true,
+		.fw_wmi_diag_event = true,
 	},
 };
 
diff --git a/drivers/net/wireless/ath/ath11k/hw.h b/drivers/net/wireless/ath/ath11k/hw.h
index 23f3ce741636..4155dc98b851 100644
--- a/drivers/net/wireless/ath/ath11k/hw.h
+++ b/drivers/net/wireless/ath/ath11k/hw.h
@@ -185,6 +185,7 @@ struct ath11k_hw_params {
 	bool supports_dynamic_smps_6ghz;
 	bool alloc_cacheable_memory;
 	bool wakeup_mhi;
+	bool fw_wmi_diag_event;
 };
 
 struct ath11k_hw_ops {
diff --git a/drivers/net/wireless/ath/ath11k/qmi.c b/drivers/net/wireless/ath/ath11k/qmi.c
index 3b9ba0e03a66..88098d6c3fd4 100644
--- a/drivers/net/wireless/ath/ath11k/qmi.c
+++ b/drivers/net/wireless/ath/ath11k/qmi.c
@@ -1584,6 +1584,50 @@ static struct qmi_elem_info qmi_wlanfw_cold_boot_cal_done_ind_msg_v01_ei[] = {
 	},
 };
 
+static struct qmi_elem_info qmi_wlanfw_wlan_ini_req_msg_v01_ei[] = {
+	{
+		.data_type	= QMI_OPT_FLAG,
+		.elem_len	= 1,
+		.elem_size	= sizeof(u8),
+		.array_type	= NO_ARRAY,
+		.tlv_type	= 0x10,
+		.offset		= offsetof(struct qmi_wlanfw_wlan_ini_req_msg_v01,
+					   enablefwlog_valid),
+	},
+	{
+		.data_type	= QMI_UNSIGNED_1_BYTE,
+		.elem_len	= 1,
+		.elem_size	= sizeof(u8),
+		.array_type	= NO_ARRAY,
+		.tlv_type	= 0x10,
+		.offset		= offsetof(struct qmi_wlanfw_wlan_ini_req_msg_v01,
+					   enablefwlog),
+	},
+	{
+		.data_type	= QMI_EOTI,
+		.array_type	= NO_ARRAY,
+		.tlv_type	= QMI_COMMON_TLV_TYPE,
+	},
+};
+
+static struct qmi_elem_info qmi_wlanfw_wlan_ini_resp_msg_v01_ei[] = {
+	{
+		.data_type	= QMI_STRUCT,
+		.elem_len	= 1,
+		.elem_size	= sizeof(struct qmi_response_type_v01),
+		.array_type	= NO_ARRAY,
+		.tlv_type	= 0x02,
+		.offset		= offsetof(struct qmi_wlanfw_wlan_ini_resp_msg_v01,
+					   resp),
+		.ei_array	= qmi_response_type_v01_ei,
+	},
+	{
+		.data_type	= QMI_EOTI,
+		.array_type	= NO_ARRAY,
+		.tlv_type	= QMI_COMMON_TLV_TYPE,
+	},
+};
+
 static int ath11k_qmi_host_cap_send(struct ath11k_base *ab)
 {
 	struct qmi_wlanfw_host_cap_req_msg_v01 req;
@@ -2495,6 +2539,48 @@ static int ath11k_qmi_wlanfw_wlan_cfg_send(struct ath11k_base *ab)
 	return ret;
 }
 
+int ath11k_qmi_wlanfw_wlan_ini_send(struct ath11k_base *ab, bool enable)
+{
+	int ret;
+	struct qmi_txn txn;
+	struct qmi_wlanfw_wlan_ini_req_msg_v01 req = {};
+	struct qmi_wlanfw_wlan_ini_resp_msg_v01 resp = {};
+
+	req.enablefwlog_valid = true;
+	req.enablefwlog = enable ? 1 : 0;
+
+	ret = qmi_txn_init(&ab->qmi.handle, &txn,
+			   qmi_wlanfw_wlan_ini_resp_msg_v01_ei, &resp);
+	if (ret < 0)
+		goto out;
+
+	ret = qmi_send_request(&ab->qmi.handle, NULL, &txn,
+			       QMI_WLANFW_WLAN_INI_REQ_V01,
+			       QMI_WLANFW_WLAN_INI_REQ_MSG_V01_MAX_LEN,
+			       qmi_wlanfw_wlan_ini_req_msg_v01_ei, &req);
+	if (ret < 0) {
+		ath11k_warn(ab, "qmi failed to send wlan ini request, err = %d\n",
+			    ret);
+		qmi_txn_cancel(&txn);
+		goto out;
+	}
+
+	ret = qmi_txn_wait(&txn, msecs_to_jiffies(ATH11K_QMI_WLANFW_TIMEOUT_MS));
+	if (ret < 0) {
+		ath11k_warn(ab, "qmi failed wlan ini request, err = %d\n", ret);
+		goto out;
+	}
+
+	if (resp.resp.result != QMI_RESULT_SUCCESS_V01) {
+		ath11k_warn(ab, "qmi wlan ini request failed, result: %d, err: %d\n",
+			    resp.resp.result, resp.resp.error);
+		ret = -EINVAL;
+	}
+
+out:
+	return ret;
+}
+
 void ath11k_qmi_firmware_stop(struct ath11k_base *ab)
 {
 	int ret;
@@ -2515,6 +2601,14 @@ int ath11k_qmi_firmware_start(struct ath11k_base *ab,
 
 	ath11k_dbg(ab, ATH11K_DBG_QMI, "qmi firmware start\n");
 
+	if (ab->hw_params.fw_wmi_diag_event) {
+		ret = ath11k_qmi_wlanfw_wlan_ini_send(ab, true);
+		if (ret < 0) {
+			ath11k_warn(ab, "qmi failed to send wlan fw ini:%d\n", ret);
+			return ret;
+		}
+	}
+
 	ret = ath11k_qmi_wlanfw_wlan_cfg_send(ab);
 	if (ret < 0) {
 		ath11k_warn(ab, "qmi failed to send wlan cfg: %d\n", ret);
diff --git a/drivers/net/wireless/ath/ath11k/qmi.h b/drivers/net/wireless/ath/ath11k/qmi.h
index a6fb7d47ee82..2c1cd1e9ad46 100644
--- a/drivers/net/wireless/ath/ath11k/qmi.h
+++ b/drivers/net/wireless/ath/ath11k/qmi.h
@@ -427,10 +427,12 @@ struct qmi_wlanfw_m3_info_resp_msg_v01 {
 #define QMI_WLANFW_WLAN_MODE_RESP_MSG_V01_MAX_LEN	7
 #define QMI_WLANFW_WLAN_CFG_REQ_MSG_V01_MAX_LEN		803
 #define QMI_WLANFW_WLAN_CFG_RESP_MSG_V01_MAX_LEN	7
+#define QMI_WLANFW_WLAN_INI_REQ_MSG_V01_MAX_LEN		4
 #define QMI_WLANFW_WLAN_MODE_REQ_V01			0x0022
 #define QMI_WLANFW_WLAN_MODE_RESP_V01			0x0022
 #define QMI_WLANFW_WLAN_CFG_REQ_V01			0x0023
 #define QMI_WLANFW_WLAN_CFG_RESP_V01			0x0023
+#define QMI_WLANFW_WLAN_INI_REQ_V01			0x002F
 #define QMI_WLANFW_MAX_STR_LEN_V01			16
 #define QMI_WLANFW_MAX_NUM_CE_V01			12
 #define QMI_WLANFW_MAX_NUM_SVC_V01			24
@@ -472,6 +474,16 @@ struct qmi_wlanfw_wlan_cfg_resp_msg_v01 {
 	struct qmi_response_type_v01 resp;
 };
 
+struct qmi_wlanfw_wlan_ini_req_msg_v01 {
+	/* Must be set to true if enablefwlog is being passed */
+	u8 enablefwlog_valid;
+	u8 enablefwlog;
+};
+
+struct qmi_wlanfw_wlan_ini_resp_msg_v01 {
+	struct qmi_response_type_v01 resp;
+};
+
 int ath11k_qmi_firmware_start(struct ath11k_base *ab,
 			      u32 mode);
 void ath11k_qmi_firmware_stop(struct ath11k_base *ab);
diff --git a/drivers/net/wireless/ath/ath11k/trace.h b/drivers/net/wireless/ath/ath11k/trace.h
index 02003dc4207d..a02e54735e88 100644
--- a/drivers/net/wireless/ath/ath11k/trace.h
+++ b/drivers/net/wireless/ath/ath11k/trace.h
@@ -280,6 +280,34 @@ TRACE_EVENT(ath11k_log_dbg_dump,
 		__get_str(msg)
 	)
 );
+
+TRACE_EVENT(ath11k_wmi_diag,
+	    TP_PROTO(struct ath11k_base *ab, const void *data, size_t len),
+
+	TP_ARGS(ab, data, len),
+
+	TP_STRUCT__entry(
+		__string(device, dev_name(ab->dev))
+		__string(driver, dev_driver_string(ab->dev))
+		__field(u16, len)
+		__dynamic_array(u8, data, len)
+	),
+
+	TP_fast_assign(
+		__assign_str(device, dev_name(ab->dev));
+		__assign_str(driver, dev_driver_string(ab->dev));
+		__entry->len = len;
+		memcpy(__get_dynamic_array(data), data, len);
+	),
+
+	TP_printk(
+		"%s %s tlv diag len %d",
+		__get_str(driver),
+		__get_str(device),
+		__entry->len
+	)
+);
+
 #endif /* _TRACE_H_ || TRACE_HEADER_MULTI_READ*/
 
 /* we don't want to use include/trace/events */
diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index 2b4d27d807ab..60a96d1da771 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -7335,6 +7335,13 @@ static void ath11k_wmi_event_wow_wakeup_host(struct ath11k_base *ab, struct sk_b
 	complete(&ab->wow.wakeup_completed);
 }
 
+static void
+ath11k_wmi_diag_event(struct ath11k_base *ab,
+		      struct sk_buff *skb)
+{
+	trace_ath11k_wmi_diag(ab, skb->data, skb->len);
+}
+
 static void ath11k_wmi_tlv_op_rx(struct ath11k_base *ab, struct sk_buff *skb)
 {
 	struct wmi_cmd_hdr *cmd_hdr;
@@ -7454,6 +7461,9 @@ static void ath11k_wmi_tlv_op_rx(struct ath11k_base *ab, struct sk_buff *skb)
 	case WMI_11D_NEW_COUNTRY_EVENTID:
 		ath11k_reg_11d_new_cc_event(ab, skb);
 		break;
+	case WMI_DIAG_EVENTID:
+		ath11k_wmi_diag_event(ab, skb);
+		break;
 	/* TODO: Add remaining events */
 	default:
 		ath11k_dbg(ab, ATH11K_DBG_WMI, "Unknown eventid: 0x%x\n", id);
-- 
2.25.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
