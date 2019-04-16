Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hGGt7-0003lg-VX
 for ath11k@lists.infradead.org; Tue, 16 Apr 2019 05:44:17 +0000
From: Maharaja Kennadyrajan <mkenna@codeaurora.org>
Subject: [PATCH] ath11k: Fix dtim period handling in the driver
Date: Tue, 16 Apr 2019 11:13:40 +0530
Message-Id: <1555393420-14837-1-git-send-email-mkenna@codeaurora.org>
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
Cc: Maharaja Kennadyrajan <mkenna@codeaurora.org>

DTIM period is not handled in the driver which is
configured in the hostapd configuration by the user.
Hence, this patch helps to handle the DTIM period in
the host driver.

Signed-off-by: Maharaja Kennadyrajan <mkenna@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/mac.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 12a2c4421264..4f418a25f2ed 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -1688,6 +1688,23 @@ static void ath11k_bss_info_changed(struct ieee80211_hw *hw,
 				    arvif->vdev_id, ret);
 	}
 
+	if (changed & (BSS_CHANGED_BEACON_INFO | BSS_CHANGED_BEACON)) {
+		arvif->dtim_period = info->dtim_period;
+
+		param_id = WMI_VDEV_PARAM_DTIM_PERIOD;
+		ret = ath11k_wmi_vdev_set_param_cmd(ar, arvif->vdev_id,
+						    param_id,
+						    arvif->dtim_period);
+
+		if (ret)
+			ath11k_warn(ar->ab, "Failed to set dtim period for VDEV %d: %i\n",
+				    arvif->vdev_id, ret);
+		else
+			ath11k_dbg(ar->ab, ATH11K_DBG_MAC,
+				   "DTIM period: %d set for VDEV: %d\n",
+				   arvif->dtim_period, arvif->vdev_id);
+	}
+
 	if (changed & BSS_CHANGED_SSID &&
 	    vif->type == NL80211_IFTYPE_AP) {
 		arvif->u.ap.ssid_len = info->ssid_len;
-- 
2.21.0


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
