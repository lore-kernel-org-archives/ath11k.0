Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iT0Hq-0000xa-Dk
 for ath11k@lists.infradead.org; Fri, 08 Nov 2019 09:10:36 +0000
Received: from CHECSTEX0180100-LIN.qca.qualcomm.com
 (blr-c-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.19.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: vthiagar@smtp.codeaurora.org)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 4AB9F60134
 for <ath11k@lists.infradead.org>; Fri,  8 Nov 2019 09:10:32 +0000 (UTC)
From: Vasanthakumar Thiagarajan <vthiagar@codeaurora.org>
Subject: [PATCH 1/2] ath11k: Move mac80211 hw allocation before wmi_init
 command
Date: Fri,  8 Nov 2019 14:40:13 +0530
Message-Id: <1573204214-17336-1-git-send-email-vthiagar@codeaurora.org>
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+kvalo=adurom.com@lists.infradead.org
To: ath11k@lists.infradead.org

This is to prepare REO ring setup before sending wmi_init command.
Firmware expects all the required REO rings to be setup while processing
wmi_init command. But as per the current initialization sequence, REO ring
configurations are done only after wmi_init command is sent.
Also refactoring ath11k_mac_create() into ath11k_mac_alloc() and
ath11k_mac_register() to it mac80211 hw structure available before sending
wmi_init command.

Signed-off-by: Vasanthakumar Thiagarajan <vthiagar@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/core.c | 27 ++++++----
 drivers/net/wireless/ath/ath11k/mac.c  | 97 +++++++++++++++++++++-------------
 drivers/net/wireless/ath/ath11k/mac.h  |  3 +-
 3 files changed, 81 insertions(+), 46 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
index b0c71b5..da25f1d 100644
--- a/drivers/net/wireless/ath/ath11k/core.c
+++ b/drivers/net/wireless/ath/ath11k/core.c
@@ -378,23 +378,22 @@ static int ath11k_core_pdev_create(struct ath11k_base *ab)
 		return ret;
 	}
 
-	ret = ath11k_mac_create(ab);
+	ret = ath11k_mac_register(ab);
 	if (ret) {
-		ath11k_err(ab, "failed to create new hw device with mac80211 :%d\n",
-			   ret);
+		ath11k_err(ab, "failed register the radio with mac80211: %d\n", ret);
 		goto err_pdev_debug;
 	}
 
 	ret = ath11k_dp_pdev_alloc(ab);
 	if (ret) {
 		ath11k_err(ab, "failed to attach DP pdev: %d\n", ret);
-		goto err_mac_destroy;
+		goto err_mac_unregister;
 	}
 
 	return 0;
 
-err_mac_destroy:
-	ath11k_mac_destroy(ab);
+err_mac_unregister:
+	ath11k_mac_unregister(ab);
 
 err_pdev_debug:
 	ath11k_debug_pdev_destroy(ab);
@@ -470,28 +469,37 @@ static int ath11k_core_start(struct ath11k_base *ab,
 		goto err_hif_stop;
 	}
 
+	ret = ath11k_mac_allocate(ab);
+	if (ret) {
+		ath11k_err(ab, "failed to create new hw device with mac80211 :%d\n",
+			   ret);
+		goto err_hif_stop;
+	}
+
 	ret = ath11k_wmi_cmd_init(ab);
 	if (ret) {
 		ath11k_err(ab, "failed to send wmi init cmd: %d\n", ret);
-		goto err_hif_stop;
+		goto err_mac_destroy;
 	}
 
 	ret = ath11k_wmi_wait_for_unified_ready(ab);
 	if (ret) {
 		ath11k_err(ab, "failed to receive wmi unified ready event: %d\n",
 			   ret);
-		goto err_hif_stop;
+		goto err_mac_destroy;
 	}
 
 	ret = ath11k_dp_tx_htt_h2t_ver_req_msg(ab);
 	if (ret) {
 		ath11k_err(ab, "failed to send htt version request message: %d\n",
 			   ret);
-		goto err_hif_stop;
+		goto err_mac_destroy;
 	}
 
 	return 0;
 
+err_mac_destroy:
+	ath11k_mac_destroy(ab);
 err_hif_stop:
 	ath11k_ahb_stop(ab);
 err_wmi_detach:
@@ -537,6 +545,7 @@ int ath11k_core_qmi_firmware_ready(struct ath11k_base *ab)
 
 err_core_stop:
 	ath11k_core_stop(ab);
+	ath11k_mac_destroy(ab);
 err_dp_free:
 	ath11k_dp_free(ab);
 	return ret;
diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 412c258..c399498 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -5470,7 +5470,38 @@ static const struct wiphy_iftype_ext_capab ath11k_iftypes_ext_capa[] = {
 	},
 };
 
-static int ath11k_mac_register(struct ath11k *ar)
+static void __ath11k_mac_unregister(struct ath11k *ar)
+{
+	cancel_work_sync(&ar->regd_update_work);
+
+	ieee80211_unregister_hw(ar->hw);
+
+	idr_for_each(&ar->txmgmt_idr, ath11k_mac_tx_mgmt_pending_free, ar);
+	idr_destroy(&ar->txmgmt_idr);
+
+	kfree(ar->mac.sbands[NL80211_BAND_2GHZ].channels);
+	kfree(ar->mac.sbands[NL80211_BAND_5GHZ].channels);
+
+	SET_IEEE80211_DEV(ar->hw, NULL);
+}
+
+void ath11k_mac_unregister(struct ath11k_base *ab)
+{
+	struct ath11k *ar;
+	struct ath11k_pdev *pdev;
+	int i;
+
+	for (i = 0; i < ab->num_radios; i++) {
+		pdev = &ab->pdevs[i];
+		ar = pdev->ar;
+		if (!ar)
+			continue;
+
+		__ath11k_mac_unregister(ar);
+	}
+}
+
+static int __ath11k_mac_register(struct ath11k *ar)
 {
 	struct ath11k_base *ab = ar->ab;
 	struct ath11k_pdev_cap *cap = &ar->pdev->cap;
@@ -5613,32 +5644,48 @@ static int ath11k_mac_register(struct ath11k *ar)
 	return ret;
 }
 
-void ath11k_mac_unregister(struct ath11k_base *ab)
+int ath11k_mac_register(struct ath11k_base *ab)
 {
 	struct ath11k *ar;
 	struct ath11k_pdev *pdev;
 	int i;
+	int ret;
 
 	for (i = 0; i < ab->num_radios; i++) {
 		pdev = &ab->pdevs[i];
 		ar = pdev->ar;
-		if (!ar)
-			continue;
-		cancel_work_sync(&ar->regd_update_work);
+		if (ab->pdevs_macaddr_valid) {
+			ether_addr_copy(ar->mac_addr, pdev->mac_addr);
+		} else {
+			ether_addr_copy(ar->mac_addr, ab->mac_addr);
+			ar->mac_addr[4] += i;
+		}
 
-		ieee80211_unregister_hw(ar->hw);
+		ret = __ath11k_mac_register(ar);
+		if (ret)
+			goto err_cleanup;
 
-		idr_for_each(&ar->txmgmt_idr, ath11k_mac_tx_mgmt_pending_free, ar);
-		idr_destroy(&ar->txmgmt_idr);
+		idr_init(&ar->txmgmt_idr);
+		spin_lock_init(&ar->txmgmt_idr_lock);
+	}
 
-		kfree(ar->mac.sbands[NL80211_BAND_2GHZ].channels);
-		kfree(ar->mac.sbands[NL80211_BAND_5GHZ].channels);
+	/* Initialize channel counters frequency value in hertz */
+	ab->cc_freq_hz = IPQ8074_CC_FREQ_HERTZ;
+	ab->free_vdev_map = (1LL << (ab->num_radios * TARGET_NUM_VDEVS)) - 1;
+
+	return 0;
 
-		SET_IEEE80211_DEV(ar->hw, NULL);
+err_cleanup:
+	for (i = i - 1; i >= 0; i--) {
+		pdev = &ab->pdevs[i];
+		ar = pdev->ar;
+		__ath11k_mac_unregister(ar);
 	}
+
+	return ret;
 }
 
-int ath11k_mac_create(struct ath11k_base *ab)
+int ath11k_mac_allocate(struct ath11k_base *ab)
 {
 	struct ieee80211_hw *hw;
 	struct ath11k *ar;
@@ -5655,7 +5702,7 @@ int ath11k_mac_create(struct ath11k_base *ab)
 		if (!hw) {
 			ath11k_warn(ab, "failed to allocate mac80211 hw device\n");
 			ret = -ENOMEM;
-			goto err_destroy_mac;
+			goto err_free_mac;
 		}
 
 		ar = hw->priv;
@@ -5676,13 +5723,6 @@ int ath11k_mac_create(struct ath11k_base *ab)
 		ar->num_tx_chains = get_num_chains(pdev->cap.tx_chain_mask);
 		ar->num_rx_chains = get_num_chains(pdev->cap.rx_chain_mask);
 
-		if (ab->pdevs_macaddr_valid) {
-			ether_addr_copy(ar->mac_addr, pdev->mac_addr);
-		} else {
-			ether_addr_copy(ar->mac_addr, ab->mac_addr);
-			ar->mac_addr[4] += i;
-		}
-
 		pdev->ar = ar;
 		spin_lock_init(&ar->data_lock);
 		INIT_LIST_HEAD(&ar->arvifs);
@@ -5700,26 +5740,11 @@ int ath11k_mac_create(struct ath11k_base *ab)
 		INIT_WORK(&ar->wmi_mgmt_tx_work, ath11k_mgmt_over_wmi_tx_work);
 		skb_queue_head_init(&ar->wmi_mgmt_tx_queue);
 		clear_bit(ATH11K_FLAG_MONITOR_ENABLED, &ar->monitor_flags);
-
-		ret = ath11k_mac_register(ar);
-		if (ret) {
-			ath11k_warn(ab, "failed to register hw device\n");
-			pdev->ar = NULL;
-			ieee80211_free_hw(hw);
-			goto err_destroy_mac;
-		}
-
-		idr_init(&ar->txmgmt_idr);
-		spin_lock_init(&ar->txmgmt_idr_lock);
 	}
 
-	/* Initialize channel counters frequency value in hertz */
-	ab->cc_freq_hz = IPQ8074_CC_FREQ_HERTZ;
-	ab->free_vdev_map = (1LL << (ab->num_radios * TARGET_NUM_VDEVS)) - 1;
-
 	return 0;
 
-err_destroy_mac:
+err_free_mac:
 	ath11k_mac_destroy(ab);
 
 	return ret;
diff --git a/drivers/net/wireless/ath/ath11k/mac.h b/drivers/net/wireless/ath/ath11k/mac.h
index 8c37573..f286531 100644
--- a/drivers/net/wireless/ath/ath11k/mac.h
+++ b/drivers/net/wireless/ath/ath11k/mac.h
@@ -118,9 +118,10 @@ struct ath11k_generic_iter {
 
 extern const struct htt_rx_ring_tlv_filter ath11k_mac_mon_status_filter_default;
 
-int ath11k_mac_create(struct ath11k_base *ab);
 void ath11k_mac_destroy(struct ath11k_base *ab);
 void ath11k_mac_unregister(struct ath11k_base *ab);
+int ath11k_mac_register(struct ath11k_base *ab);
+int ath11k_mac_allocate(struct ath11k_base *ab);
 int ath11k_mac_hw_ratecode_to_legacy_rate(u8 hw_rc, u8 preamble, u8 *rateidx,
 					  u16 *rate);
 u8 ath11k_mac_bitrate_to_idx(const struct ieee80211_supported_band *sband,
-- 
2.7.4


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
