Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from nbd.name ([2a01:4f8:221:3d45::2])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ifnKa-0007Ed-9c
 for ath11k@lists.infradead.org; Fri, 13 Dec 2019 15:58:19 +0000
From: John Crispin <john@phrozen.org>
Subject: [PATCH v2 7/7] ath11k: add handling for BSS color
Date: Fri, 13 Dec 2019 16:58:02 +0100
Message-Id: <20191213155802.25491-7-john@phrozen.org>
In-Reply-To: <20191213155802.25491-1-john@phrozen.org>
References: <20191213155802.25491-1-john@phrozen.org>
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
To: Johannes Berg <johannes@sipsolutions.net>, Kalle Valo <kvalo@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org, John Crispin <john@phrozen.org>

This patch adds code to handle the BSS_CHANGED_BSS_COLOR flag. It will
trigger the propagation of BSS color settings into the FW. Handling is
slightly different between AP and STA interfaces.

Signed-off-by: John Crispin <john@phrozen.org>

Changes in V2
* handle return codes
---
 drivers/net/wireless/ath/ath11k/mac.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 6a8c1c3b8da2..fec268b9b711 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -1928,6 +1928,33 @@ static void ath11k_mac_op_bss_info_changed(struct ieee80211_hw *hw,
 		ath11k_wmi_send_obss_spr_cmd(ar, arvif->vdev_id,
 					     &info->he_obss_pd);
 
+	if (changed & BSS_CHANGED_HE_BSS_COLOR) {
+		if (vif->type == NL80211_IFTYPE_AP) {
+			ret = ath11k_wmi_send_obss_color_collision_cfg_cmd(
+				ar, arvif->vdev_id, info->he_bss_color.color,
+				ATH11K_BSS_COLOR_COLLISION_DETECTION_AP_PERIOD_MS,
+				!info->he_bss_color.disabled);
+			if (ret)
+				ath11k_warn(ar->ab,
+				    "failed to set bss color collision on vdev %i: %d\n",
+				    arvif->vdev_id,  ret);
+		} else if (vif->type == NL80211_IFTYPE_STATION) {
+			ret = ath11k_wmi_send_bss_color_change_enable_cmd(ar,
+								arvif->vdev_id, 1);
+			if (ret)
+				ath11k_warn(ar->ab,
+				    "failed to enable bss color change on vdev %i: %d\n",
+				    arvif->vdev_id,  ret);
+			ret = ath11k_wmi_send_obss_color_collision_cfg_cmd(
+				ar, arvif->vdev_id, 0,
+				ATH11K_BSS_COLOR_COLLISION_DETECTION_STA_PERIOD_MS, 1);
+			if (ret)
+				ath11k_warn(ar->ab,
+				    "failed to set bss color collision on vdev %i: %d\n",
+				    arvif->vdev_id,  ret);
+}
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
