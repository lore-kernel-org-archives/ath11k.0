Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0C94C433EF
	for <ath11k@archiver.kernel.org>; Thu, 27 Jan 2022 05:33:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/OGmIAgtRrSFgKwYs0pNNwgkG/+v0CuMHzTHpPYHXKY=; b=PBkBFd4DK7gFIS
	DE2ZOsBRNn9wpklHE/ygHxCK26OoELTns0M+Hk3VituN95RK53LTB0RRYCbNl94Fo5cHn3VR30Ehr
	UEbxVSGbEkrmw6LRV4AOnOI+Crra0cqauJtzgtDz3yYa70TlzYmF8lpkg3MNM999UXBZ70SHkSmFI
	AdJAlBK6UPE1Sfrbeo3wnDc/co1KR9/XNKmVaDM6bmcJ0JMZJLdS9NapQymdWnpOSbiproxyoxz+i
	Pom2roq3TVk/LO0x6YnqhLINp891JaRnyCaJHgyDihrc+zvJlNd2QuDZmwjVcmFVVa7vhI/Xx9N9o
	EgK9u1WubDy9sdfhBkbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nCxPv-00EPVx-Mt; Thu, 27 Jan 2022 05:33:55 +0000
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nCxPp-00EPTQ-RX
 for ath11k@lists.infradead.org; Thu, 27 Jan 2022 05:33:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1643261629; x=1674797629;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=rjD71jbAoUNdvtwGxcW18e13EHw0v0VdRbA8C0IeJJs=;
 b=tq2mEXges5zOWNoIEZrmrwmqiXv79KYBnYLhOauds2qt9fJO8MhPOL7p
 U9aDK3G/gMGgKPGUrSGUap1yGwUU8DaFQo2GVZZJZXk9jVOrFVydGg5V8
 0p3alkmNGQEDd3M+NYplWZQA/bJV7UgQ7B9uWTYLljd5fxUWyXOyr7Lwp Y=;
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 26 Jan 2022 21:33:49 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg04-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2022 21:33:49 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Wed, 26 Jan 2022 21:33:49 -0800
Received: from mpubbise-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Wed, 26 Jan 2022 21:33:47 -0800
From: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, Manikanta Pubbisetty
 <quic_mpubbise@quicinc.com>
Subject: [PATCH RFC 3/8] ath11k: Cold boot calibration support on WCN6750
Date: Thu, 27 Jan 2022 11:03:24 +0530
Message-ID: <1643261609-13500-4-git-send-email-quic_mpubbise@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1643261609-13500-1-git-send-email-quic_mpubbise@quicinc.com>
References: <1643261609-13500-1-git-send-email-quic_mpubbise@quicinc.com>
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220126_213349_944244_AE00CADC 
X-CRM114-Status: GOOD (  22.18  )
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

Add cold boot calibration support on WCN6750. Unlike other
chipsets where firmware (FW)  is restarted after cold boot
caliration is completed, it is recommended not to restart
the firmware for WCN6750.

Also, QMI message IDs for some of the QMI messages were incorrectly
defined in the original implementation, these has to be corrected
for enabling cold boot support on WCN6750. These corrections are
applicable for all chipsets and will not impact them.

QMI message flow for WCN6750 with cold boot support:
FW_INIT_DONE to HOST -> CALIBRATION Mode to FW -> CAL_DONE to Host ->
FW_READY to Host -> MODE_ON to FW

QMI message flow for other chipsets with cold boot support:
FW_INIT_DONE to Host -> CALIBRATION Mode to FW -> CAL_DONE to Host ->
Trigger FW restart -> FW_INIT_DONE to HOST -> MODE_ON to FW

QMI message flow for chipsets without cold boot support:
FW_INIT_DONE to Host -> MODE_ON to FW

Tested-on: WCN6750 hw1.0 AHB WLAN.MSL.1.0.1-00573-QCAMSLSWPLZ-1

Signed-off-by: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/ahb.c  |  3 ++-
 drivers/net/wireless/ath/ath11k/core.c |  9 ++++++-
 drivers/net/wireless/ath/ath11k/hw.h   |  1 +
 drivers/net/wireless/ath/ath11k/qmi.c  | 44 +++++++++++++++++++++++++++++++++-
 drivers/net/wireless/ath/ath11k/qmi.h  | 12 +++++++---
 5 files changed, 63 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/ahb.c b/drivers/net/wireless/ath/ath11k/ahb.c
index 97ee8c4..4301f62 100644
--- a/drivers/net/wireless/ath/ath11k/ahb.c
+++ b/drivers/net/wireless/ath/ath11k/ahb.c
@@ -378,7 +378,8 @@ static int ath11k_ahb_fwreset_from_cold_boot(struct ath11k_base *ab)
 	int timeout;
 
 	if (ath11k_cold_boot_cal == 0 || ab->qmi.cal_done ||
-	    ab->hw_params.cold_boot_calib == 0)
+	    ab->hw_params.cold_boot_calib == 0 ||
+	    ab->hw_params.cold_boot_fw_restart == 0)
 		return 0;
 
 	ath11k_dbg(ab, ATH11K_DBG_AHB, "wait for cold boot done\n");
diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
index acb8861..643f655 100644
--- a/drivers/net/wireless/ath/ath11k/core.c
+++ b/drivers/net/wireless/ath/ath11k/core.c
@@ -83,6 +83,7 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.idle_ps = false,
 		.supports_sta_ps = false,
 		.cold_boot_calib = true,
+		.cold_boot_fw_restart = true,
 		.fw_mem_mode = 0,
 		.num_vdevs = 16 + 1,
 		.num_peers = 512,
@@ -147,6 +148,7 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.idle_ps = false,
 		.supports_sta_ps = false,
 		.cold_boot_calib = true,
+		.cold_boot_fw_restart = true,
 		.fw_mem_mode = 0,
 		.num_vdevs = 16 + 1,
 		.num_peers = 512,
@@ -210,6 +212,7 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.idle_ps = true,
 		.supports_sta_ps = true,
 		.cold_boot_calib = false,
+		.cold_boot_fw_restart = false,
 		.fw_mem_mode = 0,
 		.num_vdevs = 16 + 1,
 		.num_peers = 512,
@@ -273,6 +276,7 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.idle_ps = false,
 		.supports_sta_ps = false,
 		.cold_boot_calib = false,
+		.cold_boot_fw_restart = false,
 		.fw_mem_mode = 2,
 		.num_vdevs = 8,
 		.num_peers = 128,
@@ -336,6 +340,7 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.idle_ps = true,
 		.supports_sta_ps = true,
 		.cold_boot_calib = false,
+		.cold_boot_fw_restart = false,
 		.fw_mem_mode = 0,
 		.num_vdevs = 16 + 1,
 		.num_peers = 512,
@@ -398,6 +403,7 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.idle_ps = true,
 		.supports_sta_ps = true,
 		.cold_boot_calib = false,
+		.cold_boot_fw_restart = false,
 		.fw_mem_mode = 0,
 		.num_vdevs = 16 + 1,
 		.num_peers = 512,
@@ -459,7 +465,8 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.supports_shadow_regs = true,
 		.idle_ps = true,
 		.supports_sta_ps = true,
-		.cold_boot_calib = false,
+		.cold_boot_calib = true,
+		.cold_boot_fw_restart = false,
 		.fw_mem_mode = 0,
 		.num_vdevs = 16 + 1,
 		.num_peers = 512,
diff --git a/drivers/net/wireless/ath/ath11k/hw.h b/drivers/net/wireless/ath/ath11k/hw.h
index a38745e..ed4b72b 100644
--- a/drivers/net/wireless/ath/ath11k/hw.h
+++ b/drivers/net/wireless/ath/ath11k/hw.h
@@ -193,6 +193,7 @@ struct ath11k_hw_params {
 	bool supports_rssi_stats;
 	bool fw_wmi_diag_event;
 	bool non_wow_suspend;
+	bool cold_boot_fw_restart;
 };
 
 struct ath11k_hw_ops {
diff --git a/drivers/net/wireless/ath/ath11k/qmi.c b/drivers/net/wireless/ath/ath11k/qmi.c
index f50c273..1f9b751d 100644
--- a/drivers/net/wireless/ath/ath11k/qmi.c
+++ b/drivers/net/wireless/ath/ath11k/qmi.c
@@ -1693,6 +1693,13 @@ static struct qmi_elem_info qmi_wlanfw_wlan_ini_resp_msg_v01_ei[] = {
 	},
 };
 
+static struct qmi_elem_info qmi_wlfw_fw_init_done_ind_msg_v01_ei[] = {
+	{
+		.data_type = QMI_EOTI,
+		.array_type = NO_ARRAY,
+	},
+};
+
 static int ath11k_qmi_host_cap_send(struct ath11k_base *ab)
 {
 	struct qmi_wlanfw_host_cap_req_msg_v01 req;
@@ -2999,6 +3006,19 @@ static void ath11k_qmi_msg_cold_boot_cal_done_cb(struct qmi_handle *qmi_hdl,
 	ath11k_dbg(ab, ATH11K_DBG_QMI, "qmi cold boot calibration done\n");
 }
 
+static void ath11k_qmi_msg_fw_init_done_cb(struct qmi_handle *qmi_hdl,
+					   struct sockaddr_qrtr *sq,
+					   struct qmi_txn *txn,
+					   const void *decoded)
+{
+	struct ath11k_qmi *qmi = container_of(qmi_hdl,
+					      struct ath11k_qmi, handle);
+	struct ath11k_base *ab = qmi->ab;
+
+	ath11k_qmi_driver_event_post(qmi, ATH11K_QMI_EVENT_FW_INIT_DONE, NULL);
+	ath11k_dbg(ab, ATH11K_DBG_QMI, "qmi firmware init done\n");
+}
+
 static const struct qmi_msg_handler ath11k_qmi_msg_handlers[] = {
 	{
 		.type = QMI_INDICATION,
@@ -3029,6 +3049,14 @@ static const struct qmi_msg_handler ath11k_qmi_msg_handlers[] = {
 			sizeof(struct qmi_wlanfw_fw_cold_cal_done_ind_msg_v01),
 		.fn = ath11k_qmi_msg_cold_boot_cal_done_cb,
 	},
+	{
+		.type = QMI_INDICATION,
+		.msg_id = QMI_WLFW_FW_INIT_DONE_IND_V01,
+		.ei = qmi_wlfw_fw_init_done_ind_msg_v01_ei,
+		.decoded_size =
+			sizeof(struct qmi_wlfw_fw_init_done_ind_msg_v01),
+		.fn = ath11k_qmi_msg_fw_init_done_cb,
+	},
 };
 
 static int ath11k_qmi_ops_new_server(struct qmi_handle *qmi_hdl,
@@ -3111,7 +3139,7 @@ static void ath11k_qmi_driver_event_work(struct work_struct *work)
 			if (ret < 0)
 				set_bit(ATH11K_FLAG_QMI_FAIL, &ab->dev_flags);
 			break;
-		case ATH11K_QMI_EVENT_FW_READY:
+		case ATH11K_QMI_EVENT_FW_INIT_DONE:
 			clear_bit(ATH11K_FLAG_QMI_FAIL, &ab->dev_flags);
 			if (test_bit(ATH11K_FLAG_REGISTERED, &ab->dev_flags)) {
 				ath11k_hal_dump_srng_stats(ab);
@@ -3131,6 +3159,20 @@ static void ath11k_qmi_driver_event_work(struct work_struct *work)
 			}
 
 			break;
+		case ATH11K_QMI_EVENT_FW_READY:
+			/* For targets requiring a FW restart upon cold
+			 * boot completion, there is no need to process
+			 * FW ready; such targets will receive FW init
+			 * done message after FW restart.
+			 */
+			if (!ab->hw_params.cold_boot_fw_restart) {
+				clear_bit(ATH11K_FLAG_CRASH_FLUSH,
+					  &ab->dev_flags);
+				clear_bit(ATH11K_FLAG_RECOVERY, &ab->dev_flags);
+				ath11k_core_qmi_firmware_ready(ab);
+				set_bit(ATH11K_FLAG_REGISTERED, &ab->dev_flags);
+			}
+			break;
 		case ATH11K_QMI_EVENT_COLD_BOOT_CAL_DONE:
 			break;
 		default:
diff --git a/drivers/net/wireless/ath/ath11k/qmi.h b/drivers/net/wireless/ath/ath11k/qmi.h
index 593d81ed..f3cea7d 100644
--- a/drivers/net/wireless/ath/ath11k/qmi.h
+++ b/drivers/net/wireless/ath/ath11k/qmi.h
@@ -1,7 +1,7 @@
 /* SPDX-License-Identifier: BSD-3-Clause-Clear */
 /*
  * Copyright (c) 2018-2019 The Linux Foundation. All rights reserved.
- * Copyright (c) 2021, Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2021-2022, Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
 #ifndef ATH11K_QMI_H
@@ -31,8 +31,9 @@
 
 #define QMI_WLFW_REQUEST_MEM_IND_V01		0x0035
 #define QMI_WLFW_FW_MEM_READY_IND_V01		0x0037
-#define QMI_WLFW_COLD_BOOT_CAL_DONE_IND_V01	0x0021
-#define QMI_WLFW_FW_READY_IND_V01		0x0038
+#define QMI_WLFW_COLD_BOOT_CAL_DONE_IND_V01	0x003E
+#define QMI_WLFW_FW_READY_IND_V01		0x0021
+#define QMI_WLFW_FW_INIT_DONE_IND_V01		0x0038
 
 #define QMI_WLANFW_MAX_DATA_SIZE_V01		6144
 #define ATH11K_FIRMWARE_MODE_OFF		4
@@ -69,6 +70,7 @@ enum ath11k_qmi_event_type {
 	ATH11K_QMI_EVENT_FORCE_FW_ASSERT,
 	ATH11K_QMI_EVENT_POWER_UP,
 	ATH11K_QMI_EVENT_POWER_DOWN,
+	ATH11K_QMI_EVENT_FW_INIT_DONE,
 	ATH11K_QMI_EVENT_MAX,
 };
 
@@ -289,6 +291,10 @@ struct qmi_wlanfw_fw_cold_cal_done_ind_msg_v01 {
 	char placeholder;
 };
 
+struct qmi_wlfw_fw_init_done_ind_msg_v01 {
+	char placeholder;
+};
+
 #define QMI_WLANFW_CAP_REQ_MSG_V01_MAX_LEN		0
 #define QMI_WLANFW_CAP_RESP_MSG_V01_MAX_LEN		235
 #define QMI_WLANFW_CAP_REQ_V01				0x0024
-- 
2.7.4


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
