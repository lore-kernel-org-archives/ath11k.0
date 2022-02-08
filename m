Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E733C433F5
	for <ath11k@archiver.kernel.org>; Tue,  8 Feb 2022 10:50:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hywS9ZCIwZoQICwsxbWvbLYkkB7VzPuUzpo93WCj5yI=; b=BfJJyhlitQM3G9
	/yRdGCnFIBbLpQ9xMRDDxZp2VY7MUfsVRXpjn9cxflpKRFc5Br7yE9BOxTFWB5N+/81LWX2EoHtv6
	iBCiqskSduGQslG4GfqSdlPP62omBu//Rg4Yqrk/eo7x7z4082Er8xFbe2/5VXZ1pAMO6gPMEusDu
	C7pvRhXAu7XdIDAyE9tzxX7RvyTj0H8Vs5HsUPPCUcxPvdA+ZomTDI65SgP6dNtKbWsLeJLN9RpGy
	KY0FuEDgJuJV0i7gqoFXJER0DYnKYIE3xQwrWZ6JB7/jh6jEBnK53QkXcX+WE2i6sagCzMm4JVW56
	/wPc7YrdEu6rrxmXNYEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nHO4c-00DSH6-6r; Tue, 08 Feb 2022 10:50:14 +0000
Received: from alexa-out.qualcomm.com ([129.46.98.28])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nHO4Y-00DSBL-42
 for ath11k@lists.infradead.org; Tue, 08 Feb 2022 10:50:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1644317410; x=1675853410;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gthDNO/XzgphMh/3xfNqixz/c+u6Cv2YXTjRmSHCnHg=;
 b=Yi+5JvTDAcoegNXkOWZZDGlReQBzfZJj3/oQCr9p0IdtCV88xSw//J5m
 RXsHRvh3hHd2Rc5DJUUfQHhXfdVpIH0ybxGT06R813Ee6ryeUJrI3yTJj
 HF1iDp7Fjb9f8tp14r50jP67kgQKXBMrrMpLH26iU6EZA2F2lcbX8Ro3s U=;
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
 by alexa-out.qualcomm.com with ESMTP; 08 Feb 2022 02:50:10 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg09-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2022 02:50:10 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Tue, 8 Feb 2022 02:50:09 -0800
Received: from wgong-HP3-Z230-SFF-Workstation.qca.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Tue, 8 Feb 2022 02:50:08 -0800
From: Wen Gong <quic_wgong@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_wgong@quicinc.com>
Subject: [PATCH v5 5/5] ath11k: add synchronization operation between
 reconfigure of mac80211 and ath11k_base
Date: Tue, 8 Feb 2022 05:49:47 -0500
Message-ID: <20220208104947.25791-6-quic_wgong@quicinc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220208104947.25791-1-quic_wgong@quicinc.com>
References: <20220208104947.25791-1-quic_wgong@quicinc.com>
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220208_025010_277001_FBB6FC90 
X-CRM114-Status: GOOD (  17.16  )
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

ieee80211_reconfig() of mac80211 is the main function for recovery of
each ieee80211_hw and ath11k, and ath11k_core_reconfigure_on_crash()
is the main function for recovery of ath11k_base, it has more than
one ieee80211_hw and ath11k for each ath11k_base, so it need to add
synchronization between them, otherwise it has many issue.

For example, when ath11k_core_reconfigure_on_crash() is not complete,
mac80211 send a hw scan request to ath11k, it leads firmware crash,
because firmware has not been initialized at that moment, firmware
is only finished downloaded and loaded, it can not receive scan
command.

Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03003-QCAHSPSWPL_V1_V2_SILICONZ_LITE-2

Signed-off-by: Wen Gong <quic_wgong@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/core.c | 51 ++++++++++++++++++++++----
 drivers/net/wireless/ath/ath11k/core.h |  5 +++
 drivers/net/wireless/ath/ath11k/mac.c  | 22 +++++++++++
 3 files changed, 70 insertions(+), 8 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
index 00c83fdb0702..8ce93fd9e1e6 100644
--- a/drivers/net/wireless/ath/ath11k/core.c
+++ b/drivers/net/wireless/ath/ath11k/core.c
@@ -1263,12 +1263,11 @@ static void ath11k_update_11d(struct work_struct *work)
 	}
 }
 
-static void ath11k_core_restart(struct work_struct *work)
+static void ath11k_core_pre_reconfigure_recovery(struct ath11k_base *ab)
 {
-	struct ath11k_base *ab = container_of(work, struct ath11k_base, restart_work);
 	struct ath11k *ar;
 	struct ath11k_pdev *pdev;
-	int i, ret = 0;
+	int i;
 
 	spin_lock_bh(&ab->base_lock);
 	ab->stats.fw_crash_counter++;
@@ -1301,12 +1300,13 @@ static void ath11k_core_restart(struct work_struct *work)
 
 	wake_up(&ab->wmi_ab.tx_credits_wq);
 	wake_up(&ab->peer_mapping_wq);
+}
 
-	ret = ath11k_core_reconfigure_on_crash(ab);
-	if (ret) {
-		ath11k_err(ab, "failed to reconfigure driver on crash recovery\n");
-		return;
-	}
+static void ath11k_core_post_reconfigure_recovery(struct ath11k_base *ab)
+{
+	struct ath11k *ar;
+	struct ath11k_pdev *pdev;
+	int i;
 
 	for (i = 0; i < ab->num_radios; i++) {
 		pdev = &ab->pdevs[i];
@@ -1342,6 +1342,27 @@ static void ath11k_core_restart(struct work_struct *work)
 	complete(&ab->driver_recovery);
 }
 
+static void ath11k_core_restart(struct work_struct *work)
+{
+	struct ath11k_base *ab = container_of(work, struct ath11k_base, restart_work);
+	int ret;
+
+	if (!ab->is_reset)
+		ath11k_core_pre_reconfigure_recovery(ab);
+
+	ret = ath11k_core_reconfigure_on_crash(ab);
+	if (ret) {
+		ath11k_err(ab, "failed to reconfigure driver on crash recovery\n");
+		return;
+	}
+
+	if (ab->is_reset)
+		complete_all(&ab->reconfigure_complete);
+
+	if (!ab->is_reset)
+		ath11k_core_post_reconfigure_recovery(ab);
+}
+
 static void ath11k_core_reset(struct work_struct *work)
 {
 	struct ath11k_base *ab = container_of(work, struct ath11k_base, reset_work);
@@ -1393,6 +1414,18 @@ static void ath11k_core_reset(struct work_struct *work)
 
 	ab->is_reset = true;
 	atomic_set(&ab->recovery_count, 0);
+	reinit_completion(&ab->recovery_start);
+	atomic_set(&ab->recovery_start_count, 0);
+
+	ath11k_core_pre_reconfigure_recovery(ab);
+
+	reinit_completion(&ab->reconfigure_complete);
+	ath11k_core_post_reconfigure_recovery(ab);
+
+	ath11k_dbg(ab, ATH11K_DBG_BOOT, "waiting recovery start...\n");
+
+	time_left = wait_for_completion_timeout(&ab->recovery_start,
+						ATH11K_RECOVER_START_TIMEOUT_HZ);
 
 	ath11k_hif_power_down(ab);
 	ath11k_qmi_free_resource(ab);
@@ -1504,6 +1537,8 @@ struct ath11k_base *ath11k_core_alloc(struct device *dev, size_t priv_size,
 	spin_lock_init(&ab->base_lock);
 	mutex_init(&ab->vdev_id_11d_lock);
 	init_completion(&ab->reset_complete);
+	init_completion(&ab->reconfigure_complete);
+	init_completion(&ab->recovery_start);
 
 	INIT_LIST_HEAD(&ab->peers);
 	init_waitqueue_head(&ab->peer_mapping_wq);
diff --git a/drivers/net/wireless/ath/ath11k/core.h b/drivers/net/wireless/ath/ath11k/core.h
index 3fc49e633c29..0fd5a7ee6304 100644
--- a/drivers/net/wireless/ath/ath11k/core.h
+++ b/drivers/net/wireless/ath/ath11k/core.h
@@ -43,6 +43,8 @@ extern unsigned int ath11k_frame_mode;
 #define ATH11K_RESET_MAX_FAIL_COUNT_FIRST 3
 #define ATH11K_RESET_MAX_FAIL_COUNT_FINAL 5
 #define ATH11K_RESET_FAIL_TIMEOUT_HZ (20 * HZ)
+#define ATH11K_RECONFIGURE_TIMEOUT_HZ (10 * HZ)
+#define ATH11K_RECOVER_START_TIMEOUT_HZ (20 * HZ)
 
 enum ath11k_supported_bw {
 	ATH11K_BW_20	= 0,
@@ -795,8 +797,11 @@ struct ath11k_base {
 	struct work_struct reset_work;
 	atomic_t reset_count;
 	atomic_t recovery_count;
+	atomic_t recovery_start_count;
 	bool is_reset;
 	struct completion reset_complete;
+	struct completion reconfigure_complete;
+	struct completion recovery_start;
 	/* continuous recovery fail count */
 	atomic_t fail_cont_count;
 	unsigned long reset_fail_timeout;
diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index c57a8f2c7820..1a735bb804e1 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -5726,6 +5726,27 @@ static int ath11k_mac_config_mon_status_default(struct ath11k *ar, bool enable)
 	return ret;
 }
 
+static void ath11k_mac_wait_reconfigure(struct ath11k_base *ab)
+{
+	int recovery_start_count;
+
+	if (!ab->is_reset)
+		return;
+
+	recovery_start_count = atomic_inc_return(&ab->recovery_start_count);
+	ath11k_dbg(ab, ATH11K_DBG_MAC, "recovery start count %d\n", recovery_start_count);
+
+	if (recovery_start_count == ab->num_radios) {
+		complete(&ab->recovery_start);
+		ath11k_dbg(ab, ATH11K_DBG_MAC, "recovery started success\n");
+	}
+
+	ath11k_dbg(ab, ATH11K_DBG_MAC, "waiting reconfigure...\n");
+
+	wait_for_completion_timeout(&ab->reconfigure_complete,
+				    ATH11K_RECONFIGURE_TIMEOUT_HZ);
+}
+
 static int ath11k_mac_op_start(struct ieee80211_hw *hw)
 {
 	struct ath11k *ar = hw->priv;
@@ -5742,6 +5763,7 @@ static int ath11k_mac_op_start(struct ieee80211_hw *hw)
 		break;
 	case ATH11K_STATE_RESTARTING:
 		ar->state = ATH11K_STATE_RESTARTED;
+		ath11k_mac_wait_reconfigure(ab);
 		break;
 	case ATH11K_STATE_RESTARTED:
 	case ATH11K_STATE_WEDGED:
-- 
2.31.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
