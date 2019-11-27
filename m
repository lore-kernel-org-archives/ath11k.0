Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from a27-56.smtp-out.us-west-2.amazonses.com ([54.240.27.56])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iZy05-0002Sx-8s
 for ath11k@lists.infradead.org; Wed, 27 Nov 2019 14:09:02 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: [PATCH 08/10] ath11k: add support for controlling tx power to a
 station
Date: Wed, 27 Nov 2019 14:08:56 +0000
Message-ID: <0101016ead318eab-4f6aa790-c057-4b0a-a2d2-3bd5cbacf222-000000@us-west-2.amazonses.com>
In-Reply-To: <1574863720-25728-1-git-send-email-kvalo@codeaurora.org>
References: <1574863720-25728-1-git-send-email-kvalo@codeaurora.org>
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
To: linux-wireless@vger.kernel.org
Cc: ath11k@lists.infradead.org

From: Maharaja Kennadyrajan <mkenna@codeaurora.org>

This patch will add the support to control the transmit power
for traffic to a station associated with the AP.

Underlying firmware will enforce that the maximum tx power will
be based on the regulatory requirements. If the user given
transmit power is greater than the allowed tx power in the given
channel, then the firmware will use the maximum tx power in the
same channel.

Max and Min tx power values will depends on number of tx chain
masks. The allowed tx power range values are from 6 to 23.

When 0 is sent to the firmware as tx power, it will revert to
the default tx power for the station.

Signed-off-by: Maharaja Kennadyrajan <mkenna@codeaurora.org>
Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/debug.h |  3 +++
 drivers/net/wireless/ath/ath11k/mac.c   | 37 +++++++++++++++++++++++++++++++++
 2 files changed, 40 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/debug.h b/drivers/net/wireless/ath/ath11k/debug.h
index aef33f83c9b1..a317a7bdb9a2 100644
--- a/drivers/net/wireless/ath/ath11k/debug.h
+++ b/drivers/net/wireless/ath/ath11k/debug.h
@@ -9,6 +9,9 @@
 #include "hal_tx.h"
 #include "trace.h"
 
+#define ATH11K_TX_POWER_MAX_VAL	70
+#define ATH11K_TX_POWER_MIN_VAL	0
+
 enum ath11k_debug_mask {
 	ATH11K_DBG_AHB		= 0x00000001,
 	ATH11K_DBG_WMI		= 0x00000002,
diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 412c258143ca..5231c4fa0e38 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -2842,6 +2842,41 @@ static int ath11k_mac_op_sta_state(struct ieee80211_hw *hw,
 	return ret;
 }
 
+static int ath11k_mac_op_sta_set_txpwr(struct ieee80211_hw *hw,
+				       struct ieee80211_vif *vif,
+				       struct ieee80211_sta *sta)
+{
+	struct ath11k *ar = hw->priv;
+	struct ath11k_vif *arvif = (void *)vif->drv_priv;
+	int ret = 0;
+	s16 txpwr;
+
+	if (sta->txpwr.type == NL80211_TX_POWER_AUTOMATIC) {
+		txpwr = 0;
+	} else {
+		txpwr = sta->txpwr.power;
+		if (!txpwr)
+			return -EINVAL;
+	}
+
+	if (txpwr > ATH11K_TX_POWER_MAX_VAL || txpwr < ATH11K_TX_POWER_MIN_VAL)
+		return -EINVAL;
+
+	mutex_lock(&ar->conf_mutex);
+
+	ret = ath11k_wmi_set_peer_param(ar, sta->addr, arvif->vdev_id,
+					WMI_PEER_USE_FIXED_PWR, txpwr);
+	if (ret) {
+		ath11k_warn(ar->ab, "failed to set tx power for station ret: %d\n",
+			    ret);
+		goto out;
+	}
+
+out:
+	mutex_unlock(&ar->conf_mutex);
+	return ret;
+}
+
 static void ath11k_mac_op_sta_rc_update(struct ieee80211_hw *hw,
 					struct ieee80211_vif *vif,
 					struct ieee80211_sta *sta,
@@ -5311,6 +5346,7 @@ static const struct ieee80211_ops ath11k_ops = {
 	.cancel_hw_scan                 = ath11k_mac_op_cancel_hw_scan,
 	.set_key                        = ath11k_mac_op_set_key,
 	.sta_state                      = ath11k_mac_op_sta_state,
+	.sta_set_txpwr			= ath11k_mac_op_sta_set_txpwr,
 	.sta_rc_update			= ath11k_mac_op_sta_rc_update,
 	.conf_tx                        = ath11k_mac_op_conf_tx,
 	.set_antenna			= ath11k_mac_op_set_antenna,
@@ -5571,6 +5607,7 @@ static int ath11k_mac_register(struct ath11k *ar)
 	ar->hw->wiphy->n_iface_combinations = ARRAY_SIZE(ath11k_if_comb);
 
 	wiphy_ext_feature_set(ar->hw->wiphy, NL80211_EXT_FEATURE_CQM_RSSI_LIST);
+	wiphy_ext_feature_set(ar->hw->wiphy, NL80211_EXT_FEATURE_STA_TX_PWR);
 
 	ar->hw->wiphy->cipher_suites = cipher_suites;
 	ar->hw->wiphy->n_cipher_suites = ARRAY_SIZE(cipher_suites);
-- 
2.7.4


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
