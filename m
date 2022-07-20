Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33EEFC43334
	for <ath11k@archiver.kernel.org>; Wed, 20 Jul 2022 13:49:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ob0pk7f26QRznTlPzwN80jZRWmibMUCJxnpnbtpecNk=; b=YI/zoydjEdeMf6
	XCM3FvlqIuRx22BnuB/pJ+T+9cljmwD9H9GQfEpNSoo4ENCbmf9tRL92OZj1dSvKP+hhhOsTwfPpI
	lc4tWSpPNHD76X1FE5Y/l94YZJtK1VaAoBtG6G+kttM/hkdSsxF62Uz3GXgAWMfo85zfPTYBd577d
	9CDV1PEq4LbHtT4b6VUMwIHI5kUpBbPRIlXqlKT4L0Iy4vDGwloXPl9S9agmRmU8nN/inNn7CLJFj
	GwPudQaQuufCRgpjdXYeo8yWlmlPjKKAlGaXk2iHw0YrdVGn5yJtx0OM79Cogq50Og1ASzRejkEwz
	uJmUAkiEcmW1U2W9Ej0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEA4z-006H6a-L2; Wed, 20 Jul 2022 13:49:33 +0000
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEA4w-006H2p-AV
	for ath11k@lists.infradead.org; Wed, 20 Jul 2022 13:49:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1658324970; x=1689860970;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Luffi8Hk7UDy9ZDtGfNl3xBLWLmljerJ/dWknoJXS2U=;
  b=wRb9EoZotsNKigtvJODoD41mXq2JXo3+ZIPPxgO++KJw2vWR7BVublv3
   5Z4g4fo1aSflRoyhYm5+vfIGyDzvymgK+2lwv8HUMvQj12lgg/VtbL73n
   +0u3GnRv+pMM2SEGL897lmyN+0kgsEIfXN/ra/vKNwXdv8xWzEYwuLmMS
   4=;
Received: from unknown (HELO ironmsg02-sd.qualcomm.com) ([10.53.140.142])
  by alexa-out-sd-02.qualcomm.com with ESMTP; 20 Jul 2022 06:49:30 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg02-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2022 06:49:30 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 20 Jul 2022 06:49:29 -0700
Received: from mpubbise-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 20 Jul 2022 06:49:27 -0700
From: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, Manikanta Pubbisetty
	<quic_mpubbise@quicinc.com>
Subject: [PATCH 2/2] ath11k: Add cold boot calibration support on WCN6750
Date: Wed, 20 Jul 2022 19:19:09 +0530
Message-ID: <20220720134909.15626-3-quic_mpubbise@quicinc.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220720134909.15626-1-quic_mpubbise@quicinc.com>
References: <20220720134909.15626-1-quic_mpubbise@quicinc.com>
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220720_064930_425649_78EF51DC 
X-CRM114-Status: GOOD (  15.67  )
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
chipsets where firmware(FW)  is restarted after cold boot
calibration is completed, it is recommended not to restart
the firmware for WCN6750.

For WCN6750, FW sends both CAL_DONE & FW_READY QMI indication
to the driver after cold boot calibration is completed.

QMI message flow for WCN6750 with cold boot support:
FW_INIT_DONE to HOST -> CALIBRATION Mode to FW -> CAL_DONE to Host ->
FW_READY to Host -> MODE_ON to FW

QMI message flow for other chipsets with cold boot support:
FW_INIT_DONE to Host -> CALIBRATION Mode to FW -> FW_READY to Host ->
Trigger FW restart -> FW_INIT_DONE to HOST -> MODE_ON to FW

QMI message flow for chipsets without cold boot support:
FW_INIT_DONE to Host -> MODE_ON to FW

Tested-on: WCN6750 hw1.0 AHB WLAN.MSL.1.0.1-00887-QCAMSLSWPLZ-1

Signed-off-by: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/ahb.c  |  3 ++-
 drivers/net/wireless/ath/ath11k/core.c |  9 ++++++++-
 drivers/net/wireless/ath/ath11k/hw.h   |  1 +
 drivers/net/wireless/ath/ath11k/qmi.c  | 22 ++++++++++++++++++++--
 4 files changed, 31 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/ahb.c b/drivers/net/wireless/ath/ath11k/ahb.c
index d7d33d5cdfc5..11769f10cc07 100644
--- a/drivers/net/wireless/ath/ath11k/ahb.c
+++ b/drivers/net/wireless/ath/ath11k/ahb.c
@@ -361,7 +361,8 @@ static int ath11k_ahb_fwreset_from_cold_boot(struct ath11k_base *ab)
 	int timeout;
 
 	if (ath11k_cold_boot_cal == 0 || ab->qmi.cal_done ||
-	    ab->hw_params.cold_boot_calib == 0)
+	    ab->hw_params.cold_boot_calib == 0 ||
+	    ab->hw_params.cbcal_restart_fw == 0)
 		return 0;
 
 	ath11k_dbg(ab, ATH11K_DBG_AHB, "wait for cold boot done\n");
diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
index c8e0bc935838..5930f7c0b51a 100644
--- a/drivers/net/wireless/ath/ath11k/core.c
+++ b/drivers/net/wireless/ath/ath11k/core.c
@@ -84,6 +84,7 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.idle_ps = false,
 		.supports_sta_ps = false,
 		.cold_boot_calib = true,
+		.cbcal_restart_fw = true,
 		.fw_mem_mode = 0,
 		.num_vdevs = 16 + 1,
 		.num_peers = 512,
@@ -160,6 +161,7 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.idle_ps = false,
 		.supports_sta_ps = false,
 		.cold_boot_calib = true,
+		.cbcal_restart_fw = true,
 		.fw_mem_mode = 0,
 		.num_vdevs = 16 + 1,
 		.num_peers = 512,
@@ -235,6 +237,7 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.idle_ps = true,
 		.supports_sta_ps = true,
 		.cold_boot_calib = false,
+		.cbcal_restart_fw = false,
 		.fw_mem_mode = 0,
 		.num_vdevs = 16 + 1,
 		.num_peers = 512,
@@ -310,6 +313,7 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.idle_ps = false,
 		.supports_sta_ps = false,
 		.cold_boot_calib = false,
+		.cbcal_restart_fw = false,
 		.fw_mem_mode = 2,
 		.num_vdevs = 8,
 		.num_peers = 128,
@@ -385,6 +389,7 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.idle_ps = true,
 		.supports_sta_ps = true,
 		.cold_boot_calib = false,
+		.cbcal_restart_fw = false,
 		.fw_mem_mode = 0,
 		.num_vdevs = 16 + 1,
 		.num_peers = 512,
@@ -459,6 +464,7 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.idle_ps = true,
 		.supports_sta_ps = true,
 		.cold_boot_calib = false,
+		.cbcal_restart_fw = false,
 		.fw_mem_mode = 0,
 		.num_vdevs = 16 + 1,
 		.num_peers = 512,
@@ -532,7 +538,8 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.supports_shadow_regs = true,
 		.idle_ps = true,
 		.supports_sta_ps = true,
-		.cold_boot_calib = false,
+		.cold_boot_calib = true,
+		.cbcal_restart_fw = false,
 		.fw_mem_mode = 0,
 		.num_vdevs = 16 + 1,
 		.num_peers = 512,
diff --git a/drivers/net/wireless/ath/ath11k/hw.h b/drivers/net/wireless/ath/ath11k/hw.h
index 77dc5c851c9b..5b88fe164a63 100644
--- a/drivers/net/wireless/ath/ath11k/hw.h
+++ b/drivers/net/wireless/ath/ath11k/hw.h
@@ -178,6 +178,7 @@ struct ath11k_hw_params {
 	bool idle_ps;
 	bool supports_sta_ps;
 	bool cold_boot_calib;
+	bool cbcal_restart_fw;
 	int fw_mem_mode;
 	u32 num_vdevs;
 	u32 num_peers;
diff --git a/drivers/net/wireless/ath/ath11k/qmi.c b/drivers/net/wireless/ath/ath11k/qmi.c
index e6ced8597e1d..2be45683260c 100644
--- a/drivers/net/wireless/ath/ath11k/qmi.c
+++ b/drivers/net/wireless/ath/ath11k/qmi.c
@@ -3014,8 +3014,10 @@ static void ath11k_qmi_msg_fw_ready_cb(struct qmi_handle *qmi_hdl,
 
 	ath11k_dbg(ab, ATH11K_DBG_QMI, "qmi firmware ready\n");
 
-	ab->qmi.cal_done = 1;
-	wake_up(&ab->qmi.cold_boot_waitq);
+	if (!ab->qmi.cal_done) {
+		ab->qmi.cal_done = 1;
+		wake_up(&ab->qmi.cold_boot_waitq);
+	}
 
 	ath11k_qmi_driver_event_post(qmi, ATH11K_QMI_EVENT_FW_READY, NULL);
 }
@@ -3029,6 +3031,8 @@ static void ath11k_qmi_msg_cold_boot_cal_done_cb(struct qmi_handle *qmi_hdl,
 					      struct ath11k_qmi, handle);
 	struct ath11k_base *ab = qmi->ab;
 
+	ab->qmi.cal_done = 1;
+	wake_up(&ab->qmi.cold_boot_waitq);
 	ath11k_dbg(ab, ATH11K_DBG_QMI, "qmi cold boot calibration done\n");
 }
 
@@ -3200,6 +3204,20 @@ static void ath11k_qmi_driver_event_work(struct work_struct *work)
 
 			break;
 		case ATH11K_QMI_EVENT_FW_READY:
+			/* For targets requiring a FW restart upon cold
+			 * boot completion, there is no need to process
+			 * FW ready; such targets will receive FW init
+			 * done message after FW restart.
+			 */
+			if (ab->hw_params.cbcal_restart_fw)
+				break;
+
+			clear_bit(ATH11K_FLAG_CRASH_FLUSH,
+				  &ab->dev_flags);
+			clear_bit(ATH11K_FLAG_RECOVERY, &ab->dev_flags);
+			ath11k_core_qmi_firmware_ready(ab);
+			set_bit(ATH11K_FLAG_REGISTERED, &ab->dev_flags);
+
 			break;
 		case ATH11K_QMI_EVENT_COLD_BOOT_CAL_DONE:
 			break;
-- 
2.35.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
