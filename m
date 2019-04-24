Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hJ9rI-0000wQ-4l
 for ath11k@lists.infradead.org; Wed, 24 Apr 2019 04:50:13 +0000
From: Karthikeyan Periyasamy <periyasa@codeaurora.org>
Subject: [PATCH] ath11k: Fix "failed to synchronize setup for vdev" warn
Date: Wed, 24 Apr 2019 10:19:33 +0530
Message-Id: <1556081373-12635-1-git-send-email-periyasa@codeaurora.org>
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
Cc: Karthikeyan Periyasamy <periyasa@codeaurora.org>

In ath11k_mac_vdev_stop(), vdev_stop_status get marked after the
WMI vdev stop success. In concurrent scenario, ath11k_vdev_stopped_event()
get called before the above mark get enabled in ath11k_mac_vdev_stop().
which leads to fail vdev stop, since ath11k_get_ar_vdev_stop_status()
not able to find the vdev_stop_status mark. Enabled the vdev_stop_status
mark before requesting the WMI vdev stop, so that we ensure vdev_stop_status
mark get available in all concurrent scenario.

Warn:
ath11k c000000.wifi1: invalid vdev id in vdev stopped ev 0
ath11k c000000.wifi1: failed to synchronize setup for vdev 0: -110
ath11k c000000.wifi1: failed to stop vdev 0: -110

Signed-off-by: Karthikeyan Periyasamy <periyasa@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/mac.c | 22 +++++++++++++++-------
 1 file changed, 15 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index ddb8beb..3dc830c 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -3910,23 +3910,25 @@ static int ath11k_mac_vdev_stop(struct ath11k_vif *arvif)
 
 	reinit_completion(&ar->vdev_setup_done);
 
+	spin_lock_bh(&ar->data_lock);
+
+	ar->vdev_stop_status.stop_in_progress = true;
+	ar->vdev_stop_status.vdev_id = arvif->vdev_id;
+
+	spin_unlock_bh(&ar->data_lock);
+
 	ret = ath11k_wmi_vdev_stop(ar, arvif->vdev_id);
 	if (ret) {
 		ath11k_warn(ar->ab, "failed to stop WMI vdev %i: %d\n",
 			    arvif->vdev_id, ret);
-		return ret;
+		goto err;
 	}
 
-	spin_lock_bh(&ar->data_lock);
-	ar->vdev_stop_status.stop_in_progress = true;
-	ar->vdev_stop_status.vdev_id = arvif->vdev_id;
-	spin_unlock_bh(&ar->data_lock);
-
 	ret = ath11k_mac_vdev_setup_sync(ar);
 	if (ret) {
 		ath11k_warn(ar->ab, "failed to synchronize setup for vdev %i: %d\n",
 			    arvif->vdev_id, ret);
-		return ret;
+		goto err;
 	}
 
 	WARN_ON(ar->num_started_vdevs == 0);
@@ -3936,6 +3938,12 @@ static int ath11k_mac_vdev_stop(struct ath11k_vif *arvif)
 	/* TODO: Recalc radar */
 
 	return 0;
+err:
+	spin_lock_bh(&ar->data_lock);
+	ar->vdev_stop_status.stop_in_progress = false;
+	spin_unlock_bh(&ar->data_lock);
+
+	return ret;
 }
 
 static int ath11k_mac_vdev_start(struct ath11k_vif *arvif,
-- 
1.9.1


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
