Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail27.static.mailgun.info ([104.130.122.27])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jRgAs-0008Op-SM
 for ath11k@lists.infradead.org; Thu, 23 Apr 2020 18:02:12 +0000
From: Sathishkumar Muruganandam <murugana@codeaurora.org>
Subject: [PATCH 2/2] ath11k: add DBG_MAC prints to track vdev events
Date: Thu, 23 Apr 2020 23:31:39 +0530
Message-Id: <1587664899-1950-3-git-send-email-murugana@codeaurora.org>
In-Reply-To: <1587664899-1950-1-git-send-email-murugana@codeaurora.org>
References: <1587664899-1950-1-git-send-email-murugana@codeaurora.org>
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
Cc: Sathishkumar Muruganandam <murugana@codeaurora.org>

Added DBG_MAC prints to track vdev create, delete, start and
stop events.

Signed-off-by: Sathishkumar Muruganandam <murugana@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/mac.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 2b3a63ac216c..bfe2d20de351 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -4229,6 +4229,8 @@ static int ath11k_mac_op_add_interface(struct ieee80211_hw *hw,
 	}
 
 	ar->num_created_vdevs++;
+	ath11k_dbg(ab, ATH11K_DBG_MAC, "vdev %pM created, vdev_id %d\n",
+		   vif->addr, arvif->vdev_id);
 	ar->allocated_vdev_map |= 1LL << arvif->vdev_id;
 	ab->free_vdev_map &= ~(1LL << arvif->vdev_id);
 
@@ -4399,6 +4401,8 @@ static void ath11k_mac_op_remove_interface(struct ieee80211_hw *hw,
 			    arvif->vdev_id, ret);
 
 	ar->num_created_vdevs--;
+	ath11k_dbg(ab, ATH11K_DBG_MAC, "vdev %pM deleted, vdev_id %d\n",
+		   vif->addr, arvif->vdev_id);
 	ar->allocated_vdev_map &= ~(1LL << arvif->vdev_id);
 	ab->free_vdev_map |= 1LL << (arvif->vdev_id);
 
@@ -4664,6 +4668,8 @@ ath11k_mac_vdev_start_restart(struct ath11k_vif *arvif,
 	}
 
 	ar->num_started_vdevs++;
+	ath11k_dbg(ab, ATH11K_DBG_MAC,  "vdev %pM started, vdev_id %d\n",
+		   arvif->vif->addr, arvif->vdev_id);
 
 	/* Enable CAC Flag in the driver by checking the channel DFS cac time,
 	 * i.e dfs_cac_ms value which will be valid only for radar channels
@@ -4722,6 +4728,8 @@ static int ath11k_mac_vdev_stop(struct ath11k_vif *arvif)
 	WARN_ON(ar->num_started_vdevs == 0);
 
 	ar->num_started_vdevs--;
+	ath11k_dbg(ab, ATH11K_DBG_MAC, "vdev %pM stopped, vdev_id %d\n",
+		   arvif->vif->addr, arvif->vdev_id);
 
 	if (test_bit(ATH11K_CAC_RUNNING, &ar->dev_flags)) {
 		clear_bit(ATH11K_CAC_RUNNING, &ar->dev_flags);
-- 
2.7.4

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
