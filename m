Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hVFU6-0008H8-5x
 for ath11k@lists.infradead.org; Mon, 27 May 2019 13:16:15 +0000
From: Sriram R <srirrama@codeaurora.org>
Subject: [PATCH] ath11k: Fix error received while aborting hw scan
Date: Mon, 27 May 2019 18:45:58 +0530
Message-Id: <1558962958-13090-1-git-send-email-srirrama@codeaurora.org>
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

Set the appropriate scan cancel request param while stopping
the hw scan. Also, when a interface is stopped, the SDATA_STATE_RUNNING
flag will be cleared before cancelling the scan, hence
the interface can't be found in active interfaces in corresponding
scan cancellation event. Hence search the corresponding 'ar'
by iterating through the active pdev's if the scan state is aborting.

This will avoid 'failed to stop wmi scan' error received
while aborting the scan.

Signed-off-by: Sriram R <srirrama@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/mac.c |  2 +-
 drivers/net/wireless/ath/ath11k/wmi.c | 38 ++++++++++++++++++++++++++++++++++-
 2 files changed, 38 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index cb0de8e..1d2c14c 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -1857,7 +1857,7 @@ void ath11k_scan_finish(struct ath11k *ar)
 static int ath11k_scan_stop(struct ath11k *ar)
 {
 	struct scan_cancel_param arg = {
-		.req_type = WMI_SCAN_STOP_ONE,
+		.req_type = WLAN_SCAN_CANCEL_SINGLE,
 		.scan_id = ATH11K_SCAN_ID,
 	};
 	int ret;
diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index 90d9560..6ca3887 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -5261,6 +5261,30 @@ void ath11k_mgmt_tx_compl_event(struct ath11k_base *ab, struct sk_buff *skb)
 	rcu_read_unlock();
 }
 
+static struct ath11k *ath11k_get_ar_on_scan_abort(struct ath11k_base *ab,
+						  u32 vdev_id)
+{
+	int i;
+	struct ath11k_pdev *pdev;
+	struct ath11k *ar;
+
+	for (i = 0; i < ab->num_radios; i++) {
+		pdev = rcu_dereference(ab->pdevs_active[i]);
+		if (pdev && pdev->ar) {
+			ar = pdev->ar;
+
+			spin_lock_bh(&ar->data_lock);
+			if (ar->scan.state == ATH11K_SCAN_ABORTING &&
+			    ar->scan.vdev_id == vdev_id) {
+				spin_unlock_bh(&ar->data_lock);
+				return ar;
+			}
+			spin_unlock_bh(&ar->data_lock);
+		}
+	}
+	return NULL;
+}
+
 void ath11k_scan_event(struct ath11k_base *ab, u8 *evt_buf, u32 len)
 {
 	struct ath11k *ar;
@@ -5273,7 +5297,19 @@ void ath11k_scan_event(struct ath11k_base *ab, u8 *evt_buf, u32 len)
 	}
 
 	rcu_read_lock();
-	ar = ath11k_get_ar_by_vdev_id(ab, scan_ev.vdev_id);
+
+	/* In case the scan was cancelled, ex. during interface teardown,
+	 * the interface will not be found in active interfaces.
+	 * Rather, in such scenarios, iterate over the active pdev's to
+	 * search 'ar' if the corresponding 'ar' scan is ABORTING and the
+	 * aborting scan's vdev id matches this event info.
+	 */
+	if (scan_ev.event_type == WMI_SCAN_EVENT_COMPLETED &&
+	    scan_ev.reason == WMI_SCAN_REASON_CANCELLED)
+		ar = ath11k_get_ar_on_scan_abort(ab, scan_ev.vdev_id);
+	else
+		ar = ath11k_get_ar_by_vdev_id(ab, scan_ev.vdev_id);
+
 	if (!ar) {
 		ath11k_warn(ab, "Received scan event for unknown vdev");
 		rcu_read_unlock();
-- 
2.7.4


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
