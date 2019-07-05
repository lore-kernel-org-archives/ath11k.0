Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from dvalin.narfation.org ([213.160.73.56])
 by merlin.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hjLcl-0001Ae-GO
 for ath11k@lists.infradead.org; Fri, 05 Jul 2019 10:39:28 +0000
From: Sven Eckelmann <sven@narfation.org>
Subject: [PATCH 2/3] ath11k: support for mgmt rate control
Date: Fri,  5 Jul 2019 12:31:07 +0200
Message-Id: <20190705103109.3731-3-sven@narfation.org>
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

The management frames have to be sent at a basic rate. But the ath11k
firmware is always doing them on 1 Mbit/s for 2.4GHz and 6 Mbit/s for 5GHz.
These might not be the basic rates which the AP advertised. Clients which
don't support these rates will therefore not be able to receive them
correctly.

mac80211 already provides a list of basic rates for the driver. ath11k has
to pick the lowest one and send it to the firmware rate control.

Signed-off-by: Sven Eckelmann <seckelmann@datto.com>
---
 drivers/net/wireless/ath/ath11k/mac.c | 60 +++++++++++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 592fe79e8489..cda5b39f1a9b 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -1614,6 +1614,62 @@ static void ath11k_bss_disassoc(struct ieee80211_hw *hw,
 	/* TODO: cancel connection_loss_work */
 }
 
+static u32 ath11k_mac_get_rate_hw_value(int bitrate)
+{
+	u32 preamble;
+	u16 hw_value;
+	int rate;
+	size_t i;
+
+	if (ath11k_mac_bitrate_is_cck(bitrate))
+		preamble = WMI_RATE_PREAMBLE_CCK;
+	else
+		preamble = WMI_RATE_PREAMBLE_OFDM;
+
+	for (i = 0; i < ARRAY_SIZE(ath11k_legacy_rates); i++) {
+		if (ath11k_legacy_rates[i].bitrate != bitrate)
+			continue;
+
+		hw_value = ath11k_legacy_rates[i].hw_value;
+		rate = ATH11K_HW_RATE_CODE(hw_value, 0, preamble);
+
+		return rate;
+	}
+
+	return -EINVAL;
+}
+
+static void ath11k_recalculate_mgmt_rate(struct ath11k *ar,
+					 struct ieee80211_vif *vif,
+					 struct cfg80211_chan_def *def)
+{
+	struct ath11k_vif *arvif = (void *)vif->drv_priv;
+	const struct ieee80211_supported_band *sband;
+	u8 basic_rate_idx;
+	int hw_rate_code;
+	u32 vdev_param;
+	u16 bitrate;
+	int ret;
+
+	lockdep_assert_held(&ar->conf_mutex);
+
+	sband = ar->hw->wiphy->bands[def->chan->band];
+	basic_rate_idx = ffs(vif->bss_conf.basic_rates) - 1;
+	bitrate = sband->bitrates[basic_rate_idx].bitrate;
+
+	hw_rate_code = ath11k_mac_get_rate_hw_value(bitrate);
+	if (hw_rate_code < 0) {
+		ath11k_warn(ar->ab, "bitrate not supported %d\n", bitrate);
+		return;
+	}
+
+	vdev_param = WMI_VDEV_PARAM_MGMT_RATE;
+	ret = ath11k_wmi_vdev_set_param_cmd(ar, arvif->vdev_id, vdev_param,
+					    hw_rate_code);
+	if (ret)
+		ath11k_warn(ar->ab, "failed to set mgmt tx rate %d\n", ret);
+}
+
 static void ath11k_mac_op_bss_info_changed(struct ieee80211_hw *hw,
 					   struct ieee80211_vif *vif,
 					   struct ieee80211_bss_conf *info,
@@ -1821,6 +1877,10 @@ static void ath11k_mac_op_bss_info_changed(struct ieee80211_hw *hw,
 				    arvif->vdev_id,  ret);
 	}
 
+	if (changed & BSS_CHANGED_BASIC_RATES &&
+	    !ath11k_mac_vif_chan(arvif->vif, &def))
+		ath11k_recalculate_mgmt_rate(ar, vif, &def);
+
 	mutex_unlock(&ar->conf_mutex);
 }
 
-- 
2.20.1


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
