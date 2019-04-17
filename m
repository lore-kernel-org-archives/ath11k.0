Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hGgss-0008Kl-7e
 for ath11k@lists.infradead.org; Wed, 17 Apr 2019 09:29:39 +0000
From: Rajkumar Manoharan <rmanohar@codeaurora.org>
Subject: [PATCH 1/3] ath11k: enable mesh mode
Date: Wed, 17 Apr 2019 02:29:16 -0700
Message-Id: <1555493358-16381-2-git-send-email-rmanohar@codeaurora.org>
In-Reply-To: <1555493358-16381-1-git-send-email-rmanohar@codeaurora.org>
References: <1555493358-16381-1-git-send-email-rmanohar@codeaurora.org>
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
Cc: Rajkumar Manoharan <rmanohar@codeaurora.org>

Allow Meshpoint configuration from ath11k and advertise MP
support to mac80211. Firmware supports mesh type from
WLAN.HK.2.1.0.1-00113-QCAHKSWPL_SILICONZ-1 onwards. As of now,
only open auth mesh networking is working.

Known issues:
 - Depends on firmware fix to allow other BSS frames
 - Failed to complete path negotiation in secured mode
 - Target assert while shutting down interface in secured mode

Signed-off-by: Rajkumar Manoharan <rmanohar@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/mac.c | 10 +++++++++-
 drivers/net/wireless/ath/ath11k/wmi.h | 11 +++++++----
 2 files changed, 16 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 12a2c4421264..b384395bb08c 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -2579,6 +2579,7 @@ static int ath11k_sta_state(struct ieee80211_hw *hw,
 	} else if (old_state == IEEE80211_STA_AUTH &&
 		   new_state == IEEE80211_STA_ASSOC &&
 		   (vif->type == NL80211_IFTYPE_AP ||
+		    vif->type == NL80211_IFTYPE_MESH_POINT ||
 		    vif->type == NL80211_IFTYPE_ADHOC)) {
 		ret = ath11k_station_assoc(ar, vif, sta, false);
 		if (ret)
@@ -2591,6 +2592,7 @@ static int ath11k_sta_state(struct ieee80211_hw *hw,
 	} else if (old_state == IEEE80211_STA_ASSOC &&
 		   new_state == IEEE80211_STA_AUTH &&
 		   (vif->type == NL80211_IFTYPE_AP ||
+		    vif->type == NL80211_IFTYPE_MESH_POINT ||
 		    vif->type == NL80211_IFTYPE_ADHOC)) {
 		ret = ath11k_station_disassoc(ar, vif, sta);
 		if (ret)
@@ -3436,6 +3438,8 @@ static int ath11k_add_interface(struct ieee80211_hw *hw,
 	case NL80211_IFTYPE_STATION:
 		arvif->vdev_type = WMI_VDEV_TYPE_STA;
 		break;
+	case NL80211_IFTYPE_MESH_POINT:
+		arvif->vdev_subtype = WMI_VDEV_SUBTYPE_MESH_11S;
 	case NL80211_IFTYPE_AP:
 		arvif->vdev_type = WMI_VDEV_TYPE_AP;
 		break;
@@ -4702,6 +4706,9 @@ static int ath11k_get_survey(struct ieee80211_hw *hw, int idx,
 	{
 		.max    = 16,
 		.types  = BIT(NL80211_IFTYPE_AP)
+#ifdef CONFIG_MAC80211_MESH
+			| BIT(NL80211_IFTYPE_MESH_POINT)
+#endif
 	},
 };
 
@@ -4820,7 +4827,8 @@ static int ath11k_mac_register(struct ath11k *ar)
 	ar->hw->wiphy->available_antennas_tx = cap->tx_chain_mask;
 
 	ar->hw->wiphy->interface_modes = BIT(NL80211_IFTYPE_STATION) |
-					 BIT(NL80211_IFTYPE_AP);
+					 BIT(NL80211_IFTYPE_AP) |
+					 BIT(NL80211_IFTYPE_MESH_POINT);
 
 	ieee80211_hw_set(ar->hw, SIGNAL_DBM);
 	ieee80211_hw_set(ar->hw, SUPPORTS_PS);
diff --git a/drivers/net/wireless/ath/ath11k/wmi.h b/drivers/net/wireless/ath/ath11k/wmi.h
index 8102e80506fa..5d20f57fbacc 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.h
+++ b/drivers/net/wireless/ath/ath11k/wmi.h
@@ -4720,10 +4720,13 @@ enum wmi_vdev_type {
 };
 
 enum wmi_vdev_subtype {
-	WMI_VDEV_SUBTYPE_NONE       = 0,
-	WMI_VDEV_SUBTYPE_P2P_DEVICE = 1,
-	WMI_VDEV_SUBTYPE_P2P_CLIENT = 2,
-	WMI_VDEV_SUBTYPE_P2P_GO     = 3,
+	WMI_VDEV_SUBTYPE_NONE,
+	WMI_VDEV_SUBTYPE_P2P_DEVICE,
+	WMI_VDEV_SUBTYPE_P2P_CLIENT,
+	WMI_VDEV_SUBTYPE_P2P_GO,
+	WMI_VDEV_SUBTYPE_PROXY_STA,
+	WMI_VDEV_SUBTYPE_MESH_NON_11S,
+	WMI_VDEV_SUBTYPE_MESH_11S,
 };
 
 enum wmi_sta_powersave_param {
-- 
1.9.1


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
