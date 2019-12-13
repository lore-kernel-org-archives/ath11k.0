Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from nbd.name ([2a01:4f8:221:3d45::2])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ifhLm-00020S-K2
 for ath11k@lists.infradead.org; Fri, 13 Dec 2019 09:35:08 +0000
From: John Crispin <john@phrozen.org>
Subject: [PATCH] ath11k: set the BA buffer size to 256 when HE is enabled
Date: Fri, 13 Dec 2019 10:35:01 +0100
Message-Id: <20191213093501.26519-1-john@phrozen.org>
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
To: Kalle Valo <kvalo@codeaurora.org>
Cc: Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>, ath11k@lists.infradead.org, John Crispin <john@phrozen.org>

From: Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>

Without this change we are not able to receive 256 bitmapped BA frames.

Signed-off-by: John Crispin <john@phrozen.org>
Signed-off-by: Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/mac.c | 14 ++++++++++++++
 drivers/net/wireless/ath/ath11k/wmi.h |  2 ++
 2 files changed, 16 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index b229b0b3e0bd..82df8af57369 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -1758,6 +1758,20 @@ static void ath11k_mac_op_bss_info_changed(struct ieee80211_hw *hw,
 		if (ret)
 			ath11k_warn(ar->ab, "failed to update bcn template: %d\n",
 				    ret);
+
+		if (vif->bss_conf.he_support) {
+			ret = ath11k_wmi_vdev_set_param_cmd(ar, arvif->vdev_id,
+							    WMI_VDEV_PARAM_BA_MODE,
+							    WMI_BA_MODE_BUFFER_SIZE_256);
+			if (ret)
+				ath11k_warn(ar->ab,
+					    "failed to set BA BUFFER SIZE 256 for vdev: %d\n",
+					    arvif->vdev_id);
+			else
+				ath11k_dbg(ar->ab, ATH11K_DBG_MAC,
+					   "Set BA BUFFER SIZE 256 for VDEV: %d\n",
+					   arvif->vdev_id);
+		}
 	}
 
 	if (changed & (BSS_CHANGED_BEACON_INFO | BSS_CHANGED_BEACON)) {
diff --git a/drivers/net/wireless/ath/ath11k/wmi.h b/drivers/net/wireless/ath/ath11k/wmi.h
index f62f796305aa..284794dadd87 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.h
+++ b/drivers/net/wireless/ath/ath11k/wmi.h
@@ -54,6 +54,7 @@ struct wmi_tlv {
 #define WLAN_SCAN_PARAMS_MAX_BSSID   4
 #define WLAN_SCAN_PARAMS_MAX_IE_LEN  256
 
+#define WMI_BA_MODE_BUFFER_SIZE_256  3
 /*
  * HW mode config type replicated from FW header
  * @WMI_HOST_HW_MODE_SINGLE: Only one PHY is active.
@@ -1004,6 +1005,7 @@ enum wmi_tlv_vdev_param {
 	WMI_VDEV_PARAM_HE_RANGE_EXT,
 	WMI_VDEV_PARAM_ENABLE_BCAST_PROBE_RESPONSE,
 	WMI_VDEV_PARAM_FILS_MAX_CHANNEL_GUARD_TIME,
+	WMI_VDEV_PARAM_BA_MODE = 0x7e,
 	WMI_VDEV_PARAM_SET_HE_SOUNDING_MODE = 0x87,
 	WMI_VDEV_PARAM_PROTOTYPE = 0x8000,
 	WMI_VDEV_PARAM_BSS_COLOR,
-- 
2.20.1


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
