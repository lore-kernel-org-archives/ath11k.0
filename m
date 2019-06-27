Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by casper.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hgIOa-0002W4-8f
 for ath11k@lists.infradead.org; Thu, 27 Jun 2019 00:36:14 +0000
From: Sriram R <srirrama@codeaurora.org>
Subject: [PATCH] ath11k: Add probe response throttling logic
Date: Thu, 27 Jun 2019 06:05:53 +0530
Message-Id: <1561595753-11351-1-git-send-email-srirrama@codeaurora.org>
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
Cc: Sriram R <srirrama@codeaurora.org>

Drop probe response packets when the pending management tx
count has reached a certain threshold, so as to prioritize
other mgmt packets like auth and assoc to be sent on time
for establishing successful connections.
This might be required in dense networks, multi-vap scenarios
or due to emulated probe requests (DoS attack),
which could lead to association failures due to failure to
send auth/assoc packets as high probe response traffic occupies the
limited target mgmt transmit queue.
Currently the threshold is set to 3/4th of the target management
tx queue.

Signed-off-by: Sriram R <srirrama@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/core.h |  6 ++++++
 drivers/net/wireless/ath/ath11k/mac.c  | 23 +++++++++++++++++++++--
 drivers/net/wireless/ath/ath11k/wmi.c  |  3 +++
 3 files changed, 30 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/core.h b/drivers/net/wireless/ath/ath11k/core.h
index af5c66f..9023367 100644
--- a/drivers/net/wireless/ath/ath11k/core.h
+++ b/drivers/net/wireless/ath/ath11k/core.h
@@ -25,6 +25,11 @@
 
 #define ATH11K_TX_MGMT_NUM_PENDING_MAX	512
 
+#define ATH11K_TX_MGMT_TARGET_MAX_SUPPORT_WMI 64
+
+/* Pending management packets threshold for dropping probe responses */
+#define ATH11K_PRB_RSP_DROP_THRESHOLD ((ATH11K_TX_MGMT_TARGET_MAX_SUPPORT_WMI * 3) / 4)
+
 #define ATH11K_INVALID_HW_MAC_ID	0xFF
 
 enum ath11k_supported_bw {
@@ -485,6 +490,7 @@ struct ath11k {
 	struct idr txmgmt_idr;
 	/* protects txmgmt_idr data */
 	spinlock_t txmgmt_idr_lock;
+	atomic_t num_pending_mgmt_tx;
 
 	/* cycle count is reported twice for each visited channel during scan.
 	 * access protected by data_lock
diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 1a4a333..b8035ec 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -3392,17 +3392,32 @@ static void ath11k_mgmt_over_wmi_tx_work(struct work_struct *work)
 			ath11k_warn(ar->ab, "failed to transmit management frame %d\n",
 				    ret);
 			ieee80211_free_txskb(ar->hw, skb);
+		} else {
+			atomic_inc(&ar->num_pending_mgmt_tx);
 		}
 	}
 }
 
-static int ath11k_mac_mgmt_tx(struct ath11k *ar, struct sk_buff *skb)
+static int ath11k_mac_mgmt_tx(struct ath11k *ar, struct sk_buff *skb,
+			      bool is_prb_rsp)
 {
 	struct sk_buff_head *q = &ar->wmi_mgmt_tx_queue;
 
 	if (test_bit(ATH11K_FLAG_CRASH_FLUSH, &ar->ab->dev_flags))
 		return -ESHUTDOWN;
 
+	/* Drop probe response packets when the pending management tx
+	 * count has reached a certain threshold, so as to prioritize
+	 * other mgmt packets like auth and assoc to be sent on time
+	 * for establishing successful connections.
+	 */
+	if (is_prb_rsp &&
+	    atomic_read(&ar->num_pending_mgmt_tx) > ATH11K_PRB_RSP_DROP_THRESHOLD) {
+		ath11k_warn(ar->ab,
+			    "dropping probe response as pending queue is almost full\n");
+		return -ENOSPC;
+	}
+
 	if (skb_queue_len(q) == ATH11K_TX_MGMT_NUM_PENDING_MAX) {
 		ath11k_warn(ar->ab, "mgmt tx queue is full\n");
 		return -ENOSPC;
@@ -3423,10 +3438,12 @@ static void ath11k_mac_op_tx(struct ieee80211_hw *hw,
 	struct ieee80211_vif *vif = info->control.vif;
 	struct ath11k_vif *arvif = ath11k_vif_to_arvif(vif);
 	struct ieee80211_hdr *hdr = (struct ieee80211_hdr *)skb->data;
+	bool is_prb_rsp;
 	int ret;
 
 	if (ieee80211_is_mgmt(hdr->frame_control)) {
-		ret = ath11k_mac_mgmt_tx(ar, skb);
+		is_prb_rsp = ieee80211_is_probe_resp(hdr->frame_control);
+		ret = ath11k_mac_mgmt_tx(ar, skb, is_prb_rsp);
 		if (ret) {
 			ath11k_warn(ar->ab, "failed to queue management frame %d\n",
 				    ret);
@@ -3601,6 +3618,8 @@ static void ath11k_mac_op_stop(struct ieee80211_hw *hw)
 	rcu_assign_pointer(ar->ab->pdevs_active[ar->pdev_idx], NULL);
 
 	synchronize_rcu();
+
+	atomic_set(&ar->num_pending_mgmt_tx, 0);
 }
 
 static void
diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index 46a3e0f..6dad499 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -3366,6 +3366,9 @@ static int wmi_process_mgmt_tx_comp(struct ath11k *ar, u32 desc_id,
 
 	ieee80211_tx_status_irqsafe(ar->hw, msdu);
 
+	WARN_ON(atomic_read(&ar->num_pending_mgmt_tx) == 0);
+	atomic_dec(&ar->num_pending_mgmt_tx);
+
 	return 0;
 }
 
-- 
2.7.4


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
