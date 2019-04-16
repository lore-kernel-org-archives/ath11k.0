Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from nbd.name ([2a01:4f8:221:3d45::2])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hGNsD-0000Lv-1g
 for ath11k@lists.infradead.org; Tue, 16 Apr 2019 13:11:42 +0000
From: John Crispin <john@phrozen.org>
Subject: [PATCH] ath11k: reduce log spam
Date: Tue, 16 Apr 2019 15:11:30 +0200
Message-Id: <20190416131130.14546-1-john@phrozen.org>
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
To: Kalle Valo <kvalo@codeaurora.org>, ath11k@lists.infradead.org
Cc: Shashidhar Lakkavalli <slakkavalli@datto.com>, John Crispin <john@phrozen.org>

ath11k_bss_info_changed() is currently very chatty. Turns the info log
messages into debug ones.

Signed-off-by: Shashidhar Lakkavalli <slakkavalli@datto.com>
Signed-off-by: John Crispin <john@phrozen.org>
---
 drivers/net/wireless/ath/ath11k/mac.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 2f213966c16c..3a10fc395096 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -1849,9 +1849,9 @@ static void ath11k_bss_info_changed(struct ieee80211_hw *hw,
 			ath11k_warn(ar->ab, "Failed to set beacon interval for VDEV: %d\n",
 				    arvif->vdev_id);
 		else
-			ath11k_info(ar->ab,
-				    "Beacon interval: %d set for VDEV: %d\n",
-				    arvif->beacon_interval, arvif->vdev_id);
+			ath11k_dbg(ar->ab, ATH11K_DBG_MAC,
+				   "Beacon interval: %d set for VDEV: %d\n",
+				   arvif->beacon_interval, arvif->vdev_id);
 	}
 
 	if (changed & BSS_CHANGED_BEACON) {
@@ -1863,9 +1863,9 @@ static void ath11k_bss_info_changed(struct ieee80211_hw *hw,
 			ath11k_warn(ar->ab, "Failed to set beacon mode for VDEV: %d\n",
 				    arvif->vdev_id);
 		else
-			ath11k_info(ar->ab,
-				    "Set staggered beacon mode for VDEV: %d\n",
-				    arvif->vdev_id);
+			ath11k_dbg(ar->ab, ATH11K_DBG_MAC,
+				   "Set staggered beacon mode for VDEV: %d\n",
+				   arvif->vdev_id);
 
 		ret = ath11k_mac_setup_bcn_tmpl(arvif);
 		if (ret)
@@ -1906,8 +1906,8 @@ static void ath11k_bss_info_changed(struct ieee80211_hw *hw,
 				ath11k_warn(ar->ab, "Failed to set CTS prot for VDEV: %d\n",
 					    arvif->vdev_id);
 			else
-				ath11k_info(ar->ab, "Set CTS prot: %d for VDEV: %d\n",
-					    cts_prot, arvif->vdev_id);
+				ath11k_dbg(ar->ab, ATH11K_DBG_MAC, "Set CTS prot: %d for VDEV: %d\n",
+					   cts_prot, arvif->vdev_id);
 		} else {
 			ath11k_dbg(ar->ab, ATH11K_DBG_MAC, "defer protection mode setup, vdev is not ready yet\n");
 		}
@@ -1929,9 +1929,9 @@ static void ath11k_bss_info_changed(struct ieee80211_hw *hw,
 			ath11k_warn(ar->ab, "Failed to set erp slot for VDEV: %d\n",
 				    arvif->vdev_id);
 		else
-			ath11k_info(ar->ab,
-				    "Set slottime: %d for VDEV: %d\n",
-				    slottime, arvif->vdev_id);
+			ath11k_dbg(ar->ab, ATH11K_DBG_MAC,
+				   "Set slottime: %d for VDEV: %d\n",
+				   slottime, arvif->vdev_id);
 	}
 
 	if (changed & BSS_CHANGED_ERP_PREAMBLE) {
@@ -1949,9 +1949,9 @@ static void ath11k_bss_info_changed(struct ieee80211_hw *hw,
 			ath11k_warn(ar->ab, "Failed to set preamble for VDEV: %d\n",
 				    arvif->vdev_id);
 		else
-			ath11k_info(ar->ab,
-				    "Set preamble: %d for VDEV: %d\n",
-				    preamble, arvif->vdev_id);
+			ath11k_dbg(ar->ab, ATH11K_DBG_MAC,
+				   "Set preamble: %d for VDEV: %d\n",
+				   preamble, arvif->vdev_id);
 	}
 
 	if (changed & BSS_CHANGED_ASSOC) {
-- 
2.11.0


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
