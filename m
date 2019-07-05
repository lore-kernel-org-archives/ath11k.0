Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from dvalin.narfation.org ([213.160.73.56])
 by merlin.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hjLcl-0001Ad-GP
 for ath11k@lists.infradead.org; Fri, 05 Jul 2019 10:39:28 +0000
From: Sven Eckelmann <sven@narfation.org>
Subject: [PATCH 1/3] ath11k: support for multicast rate control
Date: Fri,  5 Jul 2019 12:31:06 +0200
Message-Id: <20190705103109.3731-2-sven@narfation.org>
In-Reply-To: <20190705103109.3731-1-sven@narfation.org>
References: <20190705103109.3731-1-sven@narfation.org>
MIME-Version: 1.0
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
Errors-To: ath11k-bounces+kvalo=adurom.com@lists.infradead.org
To: ath11k@lists.infradead.org
Cc: Sven Eckelmann <seckelmann@datto.com>

From: Sven Eckelmann <seckelmann@datto.com>

The multicasts have to be done at a rate which is a basic rate. But the
ath11k firmware is always doing them on 1 Mbit/s for 2.4GHz and 6 Mbit/s
for 5GHz. These might not be the basic rates which the AP advertised.
Clients which don't support these rates will therefore not be able to
receive the multicast/broadcast.

Also some mesh protocols try to estimate the probability of a successful
submission of broadcast/multicast frames. In such setups, the multicast
rate is usually manually set to an higher value to better simulate the
rates which are used for unicast transmission.

mac80211 already calculates the correct multicast rate for the driver and
ath11k just has to send this information to the firmware rate control.

Signed-off-by: Sven Eckelmann <seckelmann@datto.com>
---
 drivers/net/wireless/ath/ath11k/mac.c | 53 +++++++++++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 3a3296b83cc1..592fe79e8489 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -1621,8 +1621,17 @@ static void ath11k_mac_op_bss_info_changed(struct ieee80211_hw *hw,
 {
 	struct ath11k *ar = hw->priv;
 	struct ath11k_vif *arvif = ath11k_vif_to_arvif(vif);
+	struct cfg80211_chan_def def;
 	u32 param_id, param_value;
+	enum nl80211_band band;
+	u32 vdev_param;
+	int mcast_rate;
+	u32 preamble;
+	u16 hw_value;
+	u16 bitrate;
 	int ret = 0;
+	u8 rateidx;
+	u8 rate;
 
 	mutex_lock(&ar->conf_mutex);
 
@@ -1768,6 +1777,50 @@ static void ath11k_mac_op_bss_info_changed(struct ieee80211_hw *hw,
 		ath11k_mac_txpower_recalc(ar);
 	}
 
+	if (changed & BSS_CHANGED_MCAST_RATE &&
+	    !ath11k_mac_vif_chan(arvif->vif, &def)) {
+		band = def.chan->band;
+		mcast_rate = vif->bss_conf.mcast_rate[band];
+
+		if (mcast_rate > 0)
+			rateidx = mcast_rate - 1;
+		else
+			rateidx = ffs(vif->bss_conf.basic_rates) - 1;
+
+		if (ar->pdev->cap.supported_bands & WMI_HOST_WLAN_5G_CAP)
+			rateidx += ATH11K_MAC_FIRST_OFDM_RATE_IDX;
+
+		bitrate = ath11k_legacy_rates[rateidx].bitrate;
+		hw_value = ath11k_legacy_rates[rateidx].hw_value;
+
+		if (ath11k_mac_bitrate_is_cck(bitrate))
+			preamble = WMI_RATE_PREAMBLE_CCK;
+		else
+			preamble = WMI_RATE_PREAMBLE_OFDM;
+
+		rate = ATH11K_HW_RATE_CODE(hw_value, 0, preamble);
+
+		ath11k_dbg(ar->ab, ATH11K_DBG_MAC,
+			   "mac vdev %d mcast_rate %x\n",
+			   arvif->vdev_id, rate);
+
+		vdev_param = WMI_VDEV_PARAM_MCAST_DATA_RATE;
+		ret = ath11k_wmi_vdev_set_param_cmd(ar, arvif->vdev_id,
+						    vdev_param, rate);
+		if (ret)
+			ath11k_warn(ar->ab,
+				    "failed to set mcast rate on vdev %i: %d\n",
+				    arvif->vdev_id,  ret);
+
+		vdev_param = WMI_VDEV_PARAM_BCAST_DATA_RATE;
+		ret = ath11k_wmi_vdev_set_param_cmd(ar, arvif->vdev_id,
+						    vdev_param, rate);
+		if (ret)
+			ath11k_warn(ar->ab,
+				    "failed to set bcast rate on vdev %i: %d\n",
+				    arvif->vdev_id,  ret);
+	}
+
 	mutex_unlock(&ar->conf_mutex);
 }
 
-- 
2.20.1


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
