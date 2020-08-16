Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail29.static.mailgun.info ([104.130.122.29])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k7BHG-00075W-4V
 for ath11k@lists.infradead.org; Sun, 16 Aug 2020 05:32:28 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: [PATCH 5/9] ath11k: delay vdev_start for QCA6390
Date: Sun, 16 Aug 2020 08:31:27 +0300
Message-Id: <1597555891-26112-6-git-send-email-kvalo@codeaurora.org>
In-Reply-To: <1597555891-26112-1-git-send-email-kvalo@codeaurora.org>
References: <1597555891-26112-1-git-send-email-kvalo@codeaurora.org>
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
Cc: linux-wireless@vger.kernel.org

From: Carl Huang <cjhuang@codeaurora.org>

For QCA6390 firmware, bss peer must be created before vdev_start, so delay
vdev_start until bss peer is created.

Tested-on: QCA6390 hw2.0 PCI WLAN.HST.1.0.1-01740-QCAHSTSWPLZ_V2_TO_X86-1
Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.1.0.1-01238-QCAHKSWPL_SILICONZ-2

Signed-off-by: Carl Huang <cjhuang@codeaurora.org>
Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/core.c |  2 ++
 drivers/net/wireless/ath/ath11k/core.h |  1 +
 drivers/net/wireless/ath/ath11k/hw.h   |  1 +
 drivers/net/wireless/ath/ath11k/mac.c  | 51 ++++++++++++++++++++++++++++++++++
 4 files changed, 55 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
index e583b1492eca..c469904057f9 100644
--- a/drivers/net/wireless/ath/ath11k/core.c
+++ b/drivers/net/wireless/ath/ath11k/core.c
@@ -40,6 +40,7 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.rxdma1_enable = true,
 		.num_rxmda_per_pdev = 1,
 		.rx_mac_buf_ring = false,
+		.vdev_start_delay = false,
 	},
 	{
 		.name = "qca6390 hw2.0",
@@ -62,6 +63,7 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.rxdma1_enable = false,
 		.num_rxmda_per_pdev = 2,
 		.rx_mac_buf_ring = true,
+		.vdev_start_delay = true,
 	},
 };
 
diff --git a/drivers/net/wireless/ath/ath11k/core.h b/drivers/net/wireless/ath/ath11k/core.h
index f623f357aa33..d21191c51e10 100644
--- a/drivers/net/wireless/ath/ath11k/core.h
+++ b/drivers/net/wireless/ath/ath11k/core.h
@@ -217,6 +217,7 @@ struct ath11k_vif {
 	int txpower;
 	bool rsnie_present;
 	bool wpaie_present;
+	struct ieee80211_chanctx_conf chanctx;
 };
 
 struct ath11k_vif_iter {
diff --git a/drivers/net/wireless/ath/ath11k/hw.h b/drivers/net/wireless/ath/ath11k/hw.h
index 1a8f63e789a0..cac6cd3c4c57 100644
--- a/drivers/net/wireless/ath/ath11k/hw.h
+++ b/drivers/net/wireless/ath/ath11k/hw.h
@@ -149,6 +149,7 @@ struct ath11k_hw_params {
 	bool rxdma1_enable;
 	int num_rxmda_per_pdev;
 	bool rx_mac_buf_ring;
+	bool vdev_start_delay;
 };
 
 struct ath11k_hw_ops {
diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 5aae1ec27e9f..9759a5db39fc 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -244,6 +244,9 @@ static const u32 ath11k_smps_map[] = {
 	[WLAN_HT_CAP_SM_PS_DISABLED] = WMI_PEER_SMPS_PS_NONE,
 };
 
+static int ath11k_start_vdev_delay(struct ieee80211_hw *hw,
+				   struct ieee80211_vif *vif);
+
 u8 ath11k_mac_bw_to_mac80211_bw(u8 bw)
 {
 	u8 ret = 0;
@@ -2960,6 +2963,14 @@ static int ath11k_mac_station_add(struct ath11k *ar,
 		goto free_tx_stats;
 	}
 
+	if (ab->hw_params.vdev_start_delay) {
+		ret = ath11k_start_vdev_delay(ar->hw, vif);
+		if (ret) {
+			ath11k_warn(ab, "failed to delay vdev start: %d\n", ret);
+			goto free_tx_stats;
+		}
+	}
+
 	return 0;
 
 free_tx_stats:
@@ -5116,6 +5127,39 @@ static void ath11k_mac_op_change_chanctx(struct ieee80211_hw *hw,
 	mutex_unlock(&ar->conf_mutex);
 }
 
+static int ath11k_start_vdev_delay(struct ieee80211_hw *hw,
+				   struct ieee80211_vif *vif)
+{
+	struct ath11k *ar = hw->priv;
+	struct ath11k_base *ab = ar->ab;
+	struct ath11k_vif *arvif = (void *)vif->drv_priv;
+	int ret;
+
+	if (WARN_ON(arvif->is_started))
+		return -EBUSY;
+
+	ret = ath11k_mac_vdev_start(arvif, &arvif->chanctx.def);
+	if (ret) {
+		ath11k_warn(ab, "failed to start vdev %i addr %pM on freq %d: %d\n",
+			    arvif->vdev_id, vif->addr,
+			    arvif->chanctx.def.chan->center_freq, ret);
+		return ret;
+	}
+
+	if (arvif->vdev_type == WMI_VDEV_TYPE_MONITOR) {
+		ret = ath11k_monitor_vdev_up(ar, arvif->vdev_id);
+		if (ret) {
+			ath11k_warn(ab, "failed put monitor up: %d\n", ret);
+			return ret;
+		}
+	}
+
+	arvif->is_started = true;
+
+	/* TODO: Setup ps and cts/rts protection */
+	return 0;
+}
+
 static int
 ath11k_mac_op_assign_vif_chanctx(struct ieee80211_hw *hw,
 				 struct ieee80211_vif *vif,
@@ -5132,6 +5176,13 @@ ath11k_mac_op_assign_vif_chanctx(struct ieee80211_hw *hw,
 		   "mac chanctx assign ptr %pK vdev_id %i\n",
 		   ctx, arvif->vdev_id);
 
+	/* for QCA6390 bss peer must be created before vdev_start */
+	if (ab->hw_params.vdev_start_delay) {
+		memcpy(&arvif->chanctx, ctx, sizeof(*ctx));
+		mutex_unlock(&ar->conf_mutex);
+		return 0;
+	}
+
 	if (WARN_ON(arvif->is_started)) {
 		mutex_unlock(&ar->conf_mutex);
 		return -EBUSY;
-- 
2.7.4


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
