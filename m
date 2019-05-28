Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from alexa-out-blr-02.qualcomm.com ([103.229.18.198]
 helo=alexa-out-blr.qualcomm.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hVY70-0000Rn-DD
 for ath11k@lists.infradead.org; Tue, 28 May 2019 09:09:40 +0000
From: Venkateswara Naralasetty <vnaralas@codeaurora.org>
Subject: [PATCH] ath11k: Fix bug in SMPS support
Date: Tue, 28 May 2019 14:39:31 +0530
Message-Id: <1559034571-25406-1-git-send-email-vnaralas@codeaurora.org>
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
Cc: Venkateswara Naralasetty <vnaralas@codeaurora.org>

Currently firmware ignores SMPS support flags in peer assoc command.
For SMPS to work it is necessary to send SMPS mode parameters to
firmware so that tx chainmask is properly set to that peer.

Signed-off-by: Venkateswara Naralasetty <vnaralas@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/mac.c | 43 +++++++++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index cb0de8e..0839dc9 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -1559,6 +1559,33 @@ static void ath11k_peer_assoc_prepare(struct ath11k *ar,
 	/* TODO: amsdu_disable req? */
 }
 
+static const u32 ath11k_smps_map[] = {
+	[WLAN_HT_CAP_SM_PS_STATIC] = WMI_PEER_SMPS_STATIC,
+	[WLAN_HT_CAP_SM_PS_DYNAMIC] = WMI_PEER_SMPS_DYNAMIC,
+	[WLAN_HT_CAP_SM_PS_INVALID] = WMI_PEER_SMPS_PS_NONE,
+	[WLAN_HT_CAP_SM_PS_DISABLED] = WMI_PEER_SMPS_PS_NONE,
+};
+
+static int ath11k_setup_peer_smps(struct ath11k *ar, struct ath11k_vif *arvif,
+				  const u8 *addr,
+				  const struct ieee80211_sta_ht_cap *ht_cap)
+{
+	int smps;
+
+	if (!ht_cap->ht_supported)
+		return 0;
+
+	smps = ht_cap->cap & IEEE80211_HT_CAP_SM_PS;
+	smps >>= IEEE80211_HT_CAP_SM_PS_SHIFT;
+
+	if (smps >= ARRAY_SIZE(ath11k_smps_map))
+		return -EINVAL;
+
+	return ath11k_wmi_set_peer_param(ar, addr, arvif->vdev_id,
+					 WMI_PEER_MIMO_PS_STATE,
+					 ath11k_smps_map[smps]);
+}
+
 static void ath11k_bss_assoc(struct ieee80211_hw *hw,
 			     struct ieee80211_vif *vif,
 			     struct ieee80211_bss_conf *bss_conf)
@@ -1601,6 +1628,14 @@ static void ath11k_bss_assoc(struct ieee80211_hw *hw,
 		return;
 	}
 
+	ret = ath11k_setup_peer_smps(ar, arvif, bss_conf->bssid,
+				     &ap_sta->ht_cap);
+	if (ret) {
+		ath11k_warn(ar->ab, "failed to setup peer SMPS for vdev %d: %d\n",
+			    arvif->vdev_id, ret);
+		return;
+	}
+
 	WARN_ON(arvif->is_up);
 
 	arvif->aid = bss_conf->aid;
@@ -2370,6 +2405,14 @@ static int ath11k_station_assoc(struct ath11k *ar,
 	if (reassoc)
 		return 0;
 
+	ret = ath11k_setup_peer_smps(ar, arvif, sta->addr,
+				     &sta->ht_cap);
+	if (ret) {
+		ath11k_warn(ar->ab, "failed to setup peer SMPS for vdev %d: %d\n",
+			    arvif->vdev_id, ret);
+		return ret;
+	}
+
 	if (!sta->wme) {
 		arvif->num_legacy_stations++;
 		ret = ath11k_recalc_rtscts_prot(arvif);
-- 
2.7.4


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
