Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from m42-4.mailgun.net ([69.72.42.4])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1keZZl-000406-DP
 for ath11k@lists.infradead.org; Mon, 16 Nov 2020 08:09:28 +0000
From: Maharaja Kennadyrajan <mkenna@codeaurora.org>
Subject: [PATCH v3 3/3] ath11k: remove "ath11k_mac_get_ar_vdev_stop_status"
 references
Date: Mon, 16 Nov 2020 13:39:03 +0530
Message-Id: <1605514143-17652-4-git-send-email-mkenna@codeaurora.org>
In-Reply-To: <1605514143-17652-1-git-send-email-mkenna@codeaurora.org>
References: <1605514143-17652-1-git-send-email-mkenna@codeaurora.org>
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
To: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org
Cc: Ritesh Singh <ritesi@codeaurora.org>, Maharaja Kennadyrajan <mkenna@codeaurora.org>

From: Ritesh Singh <ritesi@codeaurora.org>

Unused structure ath11k_vdev_stop_status is removed.
'ath11k_mac_get_ar_vdev_stop_status' api has been replaced
with 'ath11k_mac_get_ar_by_vdev_id' inside vdev_stopped_event.

Signed-off-by: Ritesh Singh <ritesi@codeaurora.org>
Signed-off-by: Maharaja Kennadyrajan <mkenna@codeaurora.org>
---
    V3: Rebased on latest ath.git TOT & added correct version name
        in the subject name in the patches.
    V2: Rebased on latest ath.git TOT(Addressed Kalle's comment).

 drivers/net/wireless/ath/ath11k/core.h |  6 ------
 drivers/net/wireless/ath/ath11k/mac.c  | 36 ----------------------------------
 drivers/net/wireless/ath/ath11k/mac.h  |  2 --
 drivers/net/wireless/ath/ath11k/wmi.c  |  2 +-
 4 files changed, 1 insertion(+), 45 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/core.h b/drivers/net/wireless/ath/ath11k/core.h
index c7ce7c2..f2c05da 100644
--- a/drivers/net/wireless/ath/ath11k/core.h
+++ b/drivers/net/wireless/ath/ath11k/core.h
@@ -432,11 +432,6 @@ struct ath11k_per_peer_tx_stats {
 #define ATH11K_FLUSH_TIMEOUT (5 * HZ)
 #define ATH11K_VDEV_DELETE_TIMEOUT_HZ (5 * HZ)
 
-struct ath11k_vdev_stop_status {
-	bool stop_in_progress;
-	u32  vdev_id;
-};
-
 struct ath11k {
 	struct ath11k_base *ab;
 	struct ath11k_pdev *pdev;
@@ -512,7 +507,6 @@ struct ath11k {
 	struct completion install_key_done;
 
 	int last_wmi_vdev_start_status;
-	struct ath11k_vdev_stop_status vdev_stop_status;
 	struct completion vdev_setup_done;
 	struct completion vdev_delete_done;
 
diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 10d83a9..29777bc 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -537,31 +537,6 @@ struct ath11k *ath11k_mac_get_ar_by_pdev_id(struct ath11k_base *ab, u32 pdev_id)
 	return NULL;
 }
 
-struct ath11k *ath11k_mac_get_ar_vdev_stop_status(struct ath11k_base *ab,
-						  u32 vdev_id)
-{
-	int i;
-	struct ath11k_pdev *pdev;
-	struct ath11k *ar;
-
-	for (i = 0; i < ab->num_radios; i++) {
-		pdev = rcu_dereference(ab->pdevs_active[i]);
-		if (pdev && pdev->ar) {
-			ar = pdev->ar;
-
-			spin_lock_bh(&ar->data_lock);
-			if (ar->vdev_stop_status.stop_in_progress &&
-			    ar->vdev_stop_status.vdev_id == vdev_id) {
-				ar->vdev_stop_status.stop_in_progress = false;
-				spin_unlock_bh(&ar->data_lock);
-				return ar;
-			}
-			spin_unlock_bh(&ar->data_lock);
-		}
-	}
-	return NULL;
-}
-
 static void ath11k_pdev_caps_update(struct ath11k *ar)
 {
 	struct ath11k_base *ab = ar->ab;
@@ -5024,13 +4999,6 @@ static int ath11k_mac_vdev_stop(struct ath11k_vif *arvif)
 
 	reinit_completion(&ar->vdev_setup_done);
 
-	spin_lock_bh(&ar->data_lock);
-
-	ar->vdev_stop_status.stop_in_progress = true;
-	ar->vdev_stop_status.vdev_id = arvif->vdev_id;
-
-	spin_unlock_bh(&ar->data_lock);
-
 	ret = ath11k_wmi_vdev_stop(ar, arvif->vdev_id);
 	if (ret) {
 		ath11k_warn(ar->ab, "failed to stop WMI vdev %i: %d\n",
@@ -5059,10 +5027,6 @@ static int ath11k_mac_vdev_stop(struct ath11k_vif *arvif)
 
 	return 0;
 err:
-	spin_lock_bh(&ar->data_lock);
-	ar->vdev_stop_status.stop_in_progress = false;
-	spin_unlock_bh(&ar->data_lock);
-
 	return ret;
 }
 
diff --git a/drivers/net/wireless/ath/ath11k/mac.h b/drivers/net/wireless/ath/ath11k/mac.h
index 0607479..597104a 100644
--- a/drivers/net/wireless/ath/ath11k/mac.h
+++ b/drivers/net/wireless/ath/ath11k/mac.h
@@ -137,8 +137,6 @@ struct ath11k_vif *ath11k_mac_get_arvif_by_vdev_id(struct ath11k_base *ab,
 						   u32 vdev_id);
 struct ath11k *ath11k_mac_get_ar_by_vdev_id(struct ath11k_base *ab, u32 vdev_id);
 struct ath11k *ath11k_mac_get_ar_by_pdev_id(struct ath11k_base *ab, u32 pdev_id);
-struct ath11k *ath11k_mac_get_ar_vdev_stop_status(struct ath11k_base *ab,
-						  u32 vdev_id);
 
 void ath11k_mac_drain_tx(struct ath11k *ar);
 void ath11k_mac_peer_cleanup_all(struct ath11k *ar);
diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index e374270..f6f7269 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -5856,7 +5856,7 @@ static void ath11k_vdev_stopped_event(struct ath11k_base *ab, struct sk_buff *sk
 	}
 
 	rcu_read_lock();
-	ar = ath11k_mac_get_ar_vdev_stop_status(ab, vdev_id);
+	ar = ath11k_mac_get_ar_by_vdev_id(ab, vdev_id);
 	if (!ar) {
 		ath11k_warn(ab, "invalid vdev id in vdev stopped ev %d",
 			    vdev_id);
-- 
2.7.4


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
