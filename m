Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA479C28D13
	for <ath11k@archiver.kernel.org>; Thu, 25 Aug 2022 11:18:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4FJhuuW7TyzgLejmSPVQkk9L8b0Rh2bY/DAAWEQTuRI=; b=ubrqZbVlXPi4u5
	3ZKuQF+6R42cVDXpiZxsRaIabggOIdrlwXSNq4BIR/Qa5RxJwplS2e3gPegaa0Rgj8YC9St2GHuLU
	F4UAHLGo+pHVHVXFAvbxZjXoARG0W4xeHs6nbzMIxYktBWh9qc/2cC4PJ73QMSlefydTOD/Dp7nRb
	ErPsLJ0G2kRX3yz4HWqzrYw7X7U17yIi2JuEOzK5a6/X3Qq7yhfMHdMl65jaZTa0cVOGq0p4+9FpD
	5U3ckWDMSzGjf4FjNJmlBLfK8ZSN+NO9DprwvQnB7GyrpOCr316fGIWhG37k2PmuQULaBBoPDZz2w
	hPyQVfoNUtMEMVN6FKpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRAsr-00CXMi-8F; Thu, 25 Aug 2022 11:18:49 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRAsn-00CXKE-W6
	for ath11k@lists.infradead.org; Thu, 25 Aug 2022 11:18:47 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27P2vcX2017117;
	Thu, 25 Aug 2022 11:18:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=zG5jvxHawmb5OK8jyGHswdT9HH2wnt69TP29blAGMmc=;
 b=X0fC7cJOUP3R58jRmSGy81TehSKoCfiQWHsa2edXm3pp+yC7AxetX1bArwQm/fhrwJYu
 JCGVLi86gqHnKve4pFLS+wvechRoJpFNsMfymdWRHCqZGJrybxQyslmLAeaItTWvkc/n
 jpQAiHKKBND+WGzk42jC2eJ2ml3ElC+vFn3qdBcUZZZEPWmQhygXILoN6NMzakgNDM3h
 ocNznza+FYiGKM2TMOVCfGVkxflknpEFlNzFsTbNOnFMGuUgfaISygPD/VaqKXDx+96h
 ZdEFLV8kBMiOhfsTt18dmZKp6trHekD/VeEhn89p27IGlsD3kEMhUUJGCWLShtsh9bVK yA== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3j60etsawg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Aug 2022 11:18:41 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 27PBIefK026394
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Aug 2022 11:18:40 GMT
Received: from mpubbise-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.29; Thu, 25 Aug 2022 04:18:38 -0700
From: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Manikanta Pubbisetty
	<quic_mpubbise@quicinc.com>
Subject: [PATCH v2 2/4] ath11k: Move hardware initialization logic to start()
Date: Thu, 25 Aug 2022 16:48:16 +0530
Message-ID: <20220825111818.30869-3-quic_mpubbise@quicinc.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220825111818.30869-1-quic_mpubbise@quicinc.com>
References: <20220825111818.30869-1-quic_mpubbise@quicinc.com>
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: ByHC8Eyd9ozYAZNaV-333TyH-SYD2eTA
X-Proofpoint-ORIG-GUID: ByHC8Eyd9ozYAZNaV-333TyH-SYD2eTA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-25_05,2022-08-25_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 mlxscore=0 clxscore=1015 impostorscore=0
 mlxlogscore=999 priorityscore=1501 bulkscore=0 adultscore=0 phishscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208250044
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220825_041846_086482_FB52A68B 
X-CRM114-Status: GOOD (  23.24  )
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

Currently during recovery, hardware is re-initialized as part of
ath11k_core_reconfigure_on_crash(). In order to enable low power
mode support in the driver, it is required to move the hardware
re-initialization logic to ath11k_ops.start() hook.

Since ath11k_ops.start() hook is called during WiFi ON/resume and
also during hardware recovery, it is better to defer the hardware
initialization to ath11k_ops.start() in the case of hardware recovery.
This will help ensure that there is only path for the initialization
of the hardware across different scenarios. A future patch will add
the support of initializing the hardware from start() hook in
WiFi ON/resume cases as well.

Commit 38194f3a605e ("ath11k: add synchronization operation between
reconfigure of mac80211 and ath11k_base") introduced a similar change that
applies just to QCA6390/WCN6855 to defer the initialization of the hardware
during recovery by using wait logic. This is no more needed and therefore
remove it.

Tested-on: WCN6750 hw1.0 AHB WLAN.MSL.1.0.1-00887-QCAMSLSWPLZ-1

Signed-off-by: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/core.c | 87 +++++++++++---------------
 drivers/net/wireless/ath/ath11k/core.h |  6 +-
 drivers/net/wireless/ath/ath11k/mac.c  | 29 +++------
 3 files changed, 44 insertions(+), 78 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
index c3e9e4f7bc24..8cfef7a07a65 100644
--- a/drivers/net/wireless/ath/ath11k/core.c
+++ b/drivers/net/wireless/ath/ath11k/core.c
@@ -1435,10 +1435,8 @@ int ath11k_core_qmi_firmware_ready(struct ath11k_base *ab)
 	return ret;
 }
 
-static int ath11k_core_reconfigure_on_crash(struct ath11k_base *ab)
+static void ath11k_core_reconfigure_on_crash(struct ath11k_base *ab)
 {
-	int ret;
-
 	mutex_lock(&ab->core_lock);
 	ath11k_thermal_unregister(ab);
 	ath11k_hif_irq_disable(ab);
@@ -1450,27 +1448,8 @@ static int ath11k_core_reconfigure_on_crash(struct ath11k_base *ab)
 	mutex_unlock(&ab->core_lock);
 
 	ath11k_dp_free(ab);
-	ath11k_hal_srng_deinit(ab);
 
 	ab->free_vdev_map = (1LL << (ab->num_radios * TARGET_NUM_VDEVS(ab))) - 1;
-
-	ret = ath11k_hal_srng_init(ab);
-	if (ret)
-		return ret;
-
-	clear_bit(ATH11K_FLAG_CRASH_FLUSH, &ab->dev_flags);
-
-	ret = ath11k_core_qmi_firmware_ready(ab);
-	if (ret)
-		goto err_hal_srng_deinit;
-
-	clear_bit(ATH11K_FLAG_RECOVERY, &ab->dev_flags);
-
-	return 0;
-
-err_hal_srng_deinit:
-	ath11k_hal_srng_deinit(ab);
-	return ret;
 }
 
 void ath11k_core_halt(struct ath11k *ar)
@@ -1608,22 +1587,10 @@ static void ath11k_core_post_reconfigure_recovery(struct ath11k_base *ab)
 static void ath11k_core_restart(struct work_struct *work)
 {
 	struct ath11k_base *ab = container_of(work, struct ath11k_base, restart_work);
-	int ret;
-
-	if (!ab->is_reset)
-		ath11k_core_pre_reconfigure_recovery(ab);
-
-	ret = ath11k_core_reconfigure_on_crash(ab);
-	if (ret) {
-		ath11k_err(ab, "failed to reconfigure driver on crash recovery\n");
-		return;
-	}
-
-	if (ab->is_reset)
-		complete_all(&ab->reconfigure_complete);
 
-	if (!ab->is_reset)
-		ath11k_core_post_reconfigure_recovery(ab);
+	ath11k_core_pre_reconfigure_recovery(ab);
+	ath11k_core_reconfigure_on_crash(ab);
+	ath11k_core_post_reconfigure_recovery(ab);
 }
 
 static void ath11k_core_reset(struct work_struct *work)
@@ -1677,18 +1644,6 @@ static void ath11k_core_reset(struct work_struct *work)
 
 	ab->is_reset = true;
 	atomic_set(&ab->recovery_count, 0);
-	reinit_completion(&ab->recovery_start);
-	atomic_set(&ab->recovery_start_count, 0);
-
-	ath11k_core_pre_reconfigure_recovery(ab);
-
-	reinit_completion(&ab->reconfigure_complete);
-	ath11k_core_post_reconfigure_recovery(ab);
-
-	ath11k_dbg(ab, ATH11K_DBG_BOOT, "waiting recovery start...\n");
-
-	time_left = wait_for_completion_timeout(&ab->recovery_start,
-						ATH11K_RECOVER_START_TIMEOUT_HZ);
 
 	ath11k_hif_power_down(ab);
 	ath11k_hif_power_up(ab);
@@ -1796,8 +1751,6 @@ struct ath11k_base *ath11k_core_alloc(struct device *dev, size_t priv_size,
 	spin_lock_init(&ab->base_lock);
 	mutex_init(&ab->vdev_id_11d_lock);
 	init_completion(&ab->reset_complete);
-	init_completion(&ab->reconfigure_complete);
-	init_completion(&ab->recovery_start);
 
 	INIT_LIST_HEAD(&ab->peers);
 	init_waitqueue_head(&ab->peer_mapping_wq);
@@ -1823,5 +1776,37 @@ struct ath11k_base *ath11k_core_alloc(struct device *dev, size_t priv_size,
 }
 EXPORT_SYMBOL(ath11k_core_alloc);
 
+int ath11k_core_start_device(struct ath11k_base *ab)
+{
+	int ret;
+
+	if (!test_bit(ATH11K_FLAG_RECOVERY, &ab->dev_flags))
+		return 0;
+
+	ath11k_hal_srng_deinit(ab);
+
+	ret = ath11k_hal_srng_init(ab);
+	if (ret) {
+		ath11k_err(ab, "failed to init srng: %d\n", ret);
+		return ret;
+	}
+
+	clear_bit(ATH11K_FLAG_CRASH_FLUSH, &ab->dev_flags);
+
+	ret = ath11k_core_qmi_firmware_ready(ab);
+	if (ret) {
+		ath11k_err(ab, "failed to init core: %d\n", ret);
+		goto err_hal_srng_deinit;
+	}
+
+	clear_bit(ATH11K_FLAG_RECOVERY, &ab->dev_flags);
+
+	return 0;
+
+err_hal_srng_deinit:
+	ath11k_hal_srng_deinit(ab);
+	return ret;
+}
+
 MODULE_DESCRIPTION("Core module for Qualcomm Atheros 802.11ax wireless LAN cards.");
 MODULE_LICENSE("Dual BSD/GPL");
diff --git a/drivers/net/wireless/ath/ath11k/core.h b/drivers/net/wireless/ath/ath11k/core.h
index afad8f55e433..086cc127c39c 100644
--- a/drivers/net/wireless/ath/ath11k/core.h
+++ b/drivers/net/wireless/ath/ath11k/core.h
@@ -60,8 +60,6 @@ extern unsigned int ath11k_frame_mode;
 #define ATH11K_RESET_MAX_FAIL_COUNT_FIRST 3
 #define ATH11K_RESET_MAX_FAIL_COUNT_FINAL 5
 #define ATH11K_RESET_FAIL_TIMEOUT_HZ (20 * HZ)
-#define ATH11K_RECONFIGURE_TIMEOUT_HZ (10 * HZ)
-#define ATH11K_RECOVER_START_TIMEOUT_HZ (20 * HZ)
 
 enum ath11k_supported_bw {
 	ATH11K_BW_20	= 0,
@@ -913,11 +911,8 @@ struct ath11k_base {
 	struct work_struct reset_work;
 	atomic_t reset_count;
 	atomic_t recovery_count;
-	atomic_t recovery_start_count;
 	bool is_reset;
 	struct completion reset_complete;
-	struct completion reconfigure_complete;
-	struct completion recovery_start;
 	/* continuous recovery fail count */
 	atomic_t fail_cont_count;
 	unsigned long reset_fail_timeout;
@@ -1140,6 +1135,7 @@ int ath11k_core_check_smbios(struct ath11k_base *ab);
 void ath11k_core_halt(struct ath11k *ar);
 int ath11k_core_resume(struct ath11k_base *ab);
 int ath11k_core_suspend(struct ath11k_base *ab);
+int ath11k_core_start_device(struct ath11k_base *ab);
 
 const struct firmware *ath11k_core_firmware_request(struct ath11k_base *ab,
 						    const char *filename);
diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 7e91e347c9ff..56d63e9d2f1a 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -5696,27 +5696,6 @@ static int ath11k_mac_config_mon_status_default(struct ath11k *ar, bool enable)
 	return ret;
 }
 
-static void ath11k_mac_wait_reconfigure(struct ath11k_base *ab)
-{
-	int recovery_start_count;
-
-	if (!ab->is_reset)
-		return;
-
-	recovery_start_count = atomic_inc_return(&ab->recovery_start_count);
-	ath11k_dbg(ab, ATH11K_DBG_MAC, "recovery start count %d\n", recovery_start_count);
-
-	if (recovery_start_count == ab->num_radios) {
-		complete(&ab->recovery_start);
-		ath11k_dbg(ab, ATH11K_DBG_MAC, "recovery started success\n");
-	}
-
-	ath11k_dbg(ab, ATH11K_DBG_MAC, "waiting reconfigure...\n");
-
-	wait_for_completion_timeout(&ab->reconfigure_complete,
-				    ATH11K_RECONFIGURE_TIMEOUT_HZ);
-}
-
 static int ath11k_mac_op_start(struct ieee80211_hw *hw)
 {
 	struct ath11k *ar = hw->priv;
@@ -5725,6 +5704,13 @@ static int ath11k_mac_op_start(struct ieee80211_hw *hw)
 	int ret;
 
 	ath11k_mac_drain_tx(ar);
+
+	ret = ath11k_core_start_device(ab);
+	if (ret) {
+		ath11k_err(ab, "failed to start device : %d\n", ret);
+		return ret;
+	}
+
 	mutex_lock(&ar->conf_mutex);
 
 	switch (ar->state) {
@@ -5733,7 +5719,6 @@ static int ath11k_mac_op_start(struct ieee80211_hw *hw)
 		break;
 	case ATH11K_STATE_RESTARTING:
 		ar->state = ATH11K_STATE_RESTARTED;
-		ath11k_mac_wait_reconfigure(ab);
 		break;
 	case ATH11K_STATE_RESTARTED:
 	case ATH11K_STATE_WEDGED:
-- 
2.37.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
