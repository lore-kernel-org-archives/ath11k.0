Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hfNU7-0005i0-7c
 for ath11k@lists.infradead.org; Mon, 24 Jun 2019 11:50:08 +0000
From: Manikanta Pubbisetty <mpubbise@codeaurora.org>
Subject: [PATCH 8/8] ath11k: use switch statement when necessary
Date: Mon, 24 Jun 2019 17:19:29 +0530
Message-Id: <1561376969-3999-8-git-send-email-mpubbise@codeaurora.org>
In-Reply-To: <1561376969-3999-1-git-send-email-mpubbise@codeaurora.org>
References: <1561376969-3999-1-git-send-email-mpubbise@codeaurora.org>
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
Cc: Manikanta Pubbisetty <mpubbise@codeaurora.org>

use switch statement instead of mutliple if statements in
ath11k_mac_op_add_interface() in mac.c file.

Signed-off-by: Manikanta Pubbisetty <mpubbise@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/mac.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 2274f77..fa92cf7 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -3828,7 +3828,8 @@ static int ath11k_mac_op_add_interface(struct ieee80211_hw *hw,
 		goto err_vdev_del;
 	}
 
-	if (arvif->vdev_type == WMI_VDEV_TYPE_AP) {
+	switch (arvif->vdev_type) {
+	case WMI_VDEV_TYPE_AP:
 		peer_param.vdev_id = arvif->vdev_id;
 		peer_param.peer_addr = vif->addr;
 		peer_param.peer_type = WMI_PEER_TYPE_DEFAULT;
@@ -3838,18 +3839,15 @@ static int ath11k_mac_op_add_interface(struct ieee80211_hw *hw,
 				    arvif->vdev_id, ret);
 			goto err_vdev_del;
 		}
-	}
 
-	if (arvif->vdev_type == WMI_VDEV_TYPE_AP) {
 		ret = ath11k_mac_set_kickout(arvif);
 		if (ret) {
 			ath11k_warn(ar->ab, "failed to set vdev %i kickout parameters: %d\n",
 				    arvif->vdev_id, ret);
 			goto err_peer_del;
 		}
-	}
-
-	if (arvif->vdev_type == WMI_VDEV_TYPE_STA) {
+		break;
+	case WMI_VDEV_TYPE_STA:
 		param_id = WMI_STA_PS_PARAM_RX_WAKE_POLICY;
 		param_value = WMI_STA_PS_RX_WAKE_POLICY_WAKE;
 		ret = ath11k_wmi_set_sta_ps_param(ar, arvif->vdev_id,
@@ -3879,6 +3877,9 @@ static int ath11k_mac_op_add_interface(struct ieee80211_hw *hw,
 				    arvif->vdev_id, ret);
 			goto err_peer_del;
 		}
+		break;
+	default:
+		break;
 	}
 
 	arvif->txpower = vif->bss_conf.txpower;
-- 
2.7.4


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
