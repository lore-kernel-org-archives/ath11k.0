Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail27.static.mailgun.info ([104.130.122.27])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jT44a-0008Ak-C4
 for ath11k@lists.infradead.org; Mon, 27 Apr 2020 13:45:27 +0000
From: Sathishkumar Muruganandam <murugana@codeaurora.org>
Subject: [PATCH v3 1/2] ath11k: fix mgmt_tx_wmi cmd sent to FW for deleted vdev
Date: Mon, 27 Apr 2020 19:14:54 +0530
Message-Id: <1587995095-7808-2-git-send-email-murugana@codeaurora.org>
In-Reply-To: <1587995095-7808-1-git-send-email-murugana@codeaurora.org>
References: <1587995095-7808-1-git-send-email-murugana@codeaurora.org>
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
Cc: Sathishkumar Muruganandam <murugana@codeaurora.org>, linux-wireless@vger.kernel.org

In Multi-AP VAP scenario with frequent interface up-down, there is a
chance that ath11k_mgmt_over_wmi_tx_work() will dequeue a skb
corresponding to currently deleted/stopped vdev.

FW will assert on receiving mgmt_tx_wmi cmd for already deleted vdev.
Hence adding validation checks for arvif present on the corresponding
ar before sending mgmt_tx_wmi cmd.

Signed-off-by: Sathishkumar Muruganandam <murugana@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/mac.c | 29 ++++++++++++++++++++++-------
 1 file changed, 22 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 065b7d6d4ab2..2b3a63ac216c 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -3793,15 +3793,30 @@ static void ath11k_mgmt_over_wmi_tx_work(struct work_struct *work)
 
 	while ((skb = skb_dequeue(&ar->wmi_mgmt_tx_queue)) != NULL) {
 		info = IEEE80211_SKB_CB(skb);
-		arvif = ath11k_vif_to_arvif(info->control.vif);
-
-		ret = ath11k_mac_mgmt_tx_wmi(ar, arvif, skb);
-		if (ret) {
-			ath11k_warn(ar->ab, "failed to transmit management frame %d\n",
-				    ret);
+		if (!info->control.vif) {
+			ath11k_warn(ar->ab, "no vif found for mgmt frame, flags 0x%x\n",
+				    info->control.flags);
 			ieee80211_free_txskb(ar->hw, skb);
+			continue;
+		}
+
+		arvif = ath11k_vif_to_arvif(info->control.vif);
+		if (ar->allocated_vdev_map & (1LL << arvif->vdev_id) &&
+		    arvif->is_started) {
+			ret = ath11k_mac_mgmt_tx_wmi(ar, arvif, skb);
+			if (ret) {
+				ath11k_warn(ar->ab, "failed to tx mgmt frame, vdev_id %d :%d\n",
+					    arvif->vdev_id, ret);
+				ieee80211_free_txskb(ar->hw, skb);
+			} else {
+				atomic_inc(&ar->num_pending_mgmt_tx);
+			}
 		} else {
-			atomic_inc(&ar->num_pending_mgmt_tx);
+			ath11k_warn(ar->ab,
+				    "dropping mgmt frame for vdev %d, flags 0x%x is_started %d\n",
+				    arvif->vdev_id, info->control.flags,
+				    arvif->is_started);
+			ieee80211_free_txskb(ar->hw, skb);
 		}
 	}
 }
-- 
2.7.4

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
