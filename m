Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from a27-21.smtp-out.us-west-2.amazonses.com ([54.240.27.21])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iWe2w-000394-57
 for ath11k@lists.infradead.org; Mon, 18 Nov 2019 10:14:15 +0000
From: Vasanthakumar Thiagarajan <vthiagar@codeaurora.org>
Subject: [PATCH V2 2/2] ath11k: Setup REO destination ring before sending
 wmi_init command
Date: Mon, 18 Nov 2019 10:14:12 +0000
Message-ID: <0101016e7e0169a0-ccda6f11-1cd1-4653-8c8c-ce06c103477e-000000@us-west-2.amazonses.com>
In-Reply-To: <1574072039-2927-1-git-send-email-vthiagar@codeaurora.org>
References: <1574072039-2927-1-git-send-email-vthiagar@codeaurora.org>
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

Firmware expects all the required REO destination rings setup
while processing wmi_init command. Not doing this causes connected
stations getting disconnected and not able to connect back.

Signed-off-by: Vasanthakumar Thiagarajan <vthiagar@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/core.c  | 19 +++++++++++--
 drivers/net/wireless/ath/ath11k/dp.c    | 10 +++++--
 drivers/net/wireless/ath/ath11k/dp.h    |  1 +
 drivers/net/wireless/ath/ath11k/dp_rx.c | 49 +++++++++++++++++++++++++++------
 drivers/net/wireless/ath/ath11k/dp_rx.h |  2 ++
 5 files changed, 67 insertions(+), 14 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
index c9c9e4b..5cdc9b2 100644
--- a/drivers/net/wireless/ath/ath11k/core.c
+++ b/drivers/net/wireless/ath/ath11k/core.c
@@ -10,6 +10,7 @@
 #include "ahb.h"
 #include "core.h"
 #include "dp_tx.h"
+#include "dp_rx.h"
 #include "debug.h"
 
 unsigned int ath11k_debug_mask;
@@ -325,6 +326,7 @@ static void ath11k_core_stop(struct ath11k_base *ab)
 		ath11k_qmi_firmware_stop(ab);
 	ath11k_ahb_stop(ab);
 	ath11k_wmi_detach(ab);
+	ath11k_dp_pdev_reo_cleanup(ab);
 
 	/* De-Init of components as needed */
 }
@@ -476,28 +478,38 @@ static int ath11k_core_start(struct ath11k_base *ab,
 		goto err_hif_stop;
 	}
 
+	ath11k_dp_pdev_pre_alloc(ab);
+
+	ret = ath11k_dp_pdev_reo_setup(ab);
+	if (ret) {
+		ath11k_err(ab, "failed to initialize reo destination rings: %d\n", ret);
+		goto err_mac_destroy;
+	}
+
 	ret = ath11k_wmi_cmd_init(ab);
 	if (ret) {
 		ath11k_err(ab, "failed to send wmi init cmd: %d\n", ret);
-		goto err_mac_destroy;
+		goto err_reo_cleanup;
 	}
 
 	ret = ath11k_wmi_wait_for_unified_ready(ab);
 	if (ret) {
 		ath11k_err(ab, "failed to receive wmi unified ready event: %d\n",
 			   ret);
-		goto err_mac_destroy;
+		goto err_reo_cleanup;
 	}
 
 	ret = ath11k_dp_tx_htt_h2t_ver_req_msg(ab);
 	if (ret) {
 		ath11k_err(ab, "failed to send htt version request message: %d\n",
 			   ret);
-		goto err_mac_destroy;
+		goto err_reo_cleanup;
 	}
 
 	return 0;
 
+err_reo_cleanup:
+	ath11k_dp_pdev_reo_cleanup(ab);
 err_mac_destroy:
 	ath11k_mac_destroy(ab);
 err_hif_stop:
@@ -561,6 +573,7 @@ static int ath11k_core_reconfigure_on_crash(struct ath11k_base *ab)
 	ath11k_dp_pdev_free(ab);
 	ath11k_ahb_stop(ab);
 	ath11k_wmi_detach(ab);
+	ath11k_dp_pdev_reo_cleanup(ab);
 	mutex_unlock(&ab->core_lock);
 
 	ath11k_dp_free(ab);
diff --git a/drivers/net/wireless/ath/ath11k/dp.c b/drivers/net/wireless/ath/ath11k/dp.c
index 72c21cf..b966a16 100644
--- a/drivers/net/wireless/ath/ath11k/dp.c
+++ b/drivers/net/wireless/ath/ath11k/dp.c
@@ -684,11 +684,10 @@ void ath11k_dp_pdev_free(struct ath11k_base *ab)
 	}
 }
 
-int ath11k_dp_pdev_alloc(struct ath11k_base *ab)
+void ath11k_dp_pdev_pre_alloc(struct ath11k_base *ab)
 {
 	struct ath11k *ar;
 	struct ath11k_pdev_dp *dp;
-	int ret;
 	int i;
 
 	for (i = 0; i <  ab->num_radios; i++) {
@@ -704,6 +703,13 @@ int ath11k_dp_pdev_alloc(struct ath11k_base *ab)
 		idr_init(&dp->rxdma_mon_buf_ring.bufs_idr);
 		spin_lock_init(&dp->rxdma_mon_buf_ring.idr_lock);
 	}
+}
+
+int ath11k_dp_pdev_alloc(struct ath11k_base *ab)
+{
+	struct ath11k *ar;
+	int ret;
+	int i;
 
 	/* TODO:Per-pdev rx ring unlike tx ring which is mapped to different AC's */
 	for (i = 0; i < ab->num_radios; i++) {
diff --git a/drivers/net/wireless/ath/ath11k/dp.h b/drivers/net/wireless/ath/ath11k/dp.h
index db216f0..2b935df 100644
--- a/drivers/net/wireless/ath/ath11k/dp.h
+++ b/drivers/net/wireless/ath/ath11k/dp.h
@@ -1505,6 +1505,7 @@ void ath11k_dp_vdev_tx_attach(struct ath11k *ar, struct ath11k_vif *arvif);
 void ath11k_dp_free(struct ath11k_base *ab);
 int ath11k_dp_alloc(struct ath11k_base *ab);
 int ath11k_dp_pdev_alloc(struct ath11k_base *ab);
+void ath11k_dp_pdev_pre_alloc(struct ath11k_base *ab);
 void ath11k_dp_pdev_free(struct ath11k_base *ab);
 int ath11k_dp_tx_htt_srng_setup(struct ath11k_base *ab, u32 ring_id,
 				int mac_id, enum hal_ring_type ring_type);
diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index 8c21925..c9cc5ad 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -395,12 +395,51 @@ static void ath11k_dp_rx_pdev_srng_free(struct ath11k *ar)
 	struct ath11k_pdev_dp *dp = &ar->dp;
 
 	ath11k_dp_srng_cleanup(ar->ab, &dp->rx_refill_buf_ring.refill_buf_ring);
-	ath11k_dp_srng_cleanup(ar->ab, &dp->reo_dst_ring);
 	ath11k_dp_srng_cleanup(ar->ab, &dp->rxdma_err_dst_ring);
 	ath11k_dp_srng_cleanup(ar->ab, &dp->rx_mon_status_refill_ring.refill_buf_ring);
 	ath11k_dp_srng_cleanup(ar->ab, &dp->rxdma_mon_buf_ring.refill_buf_ring);
 }
 
+void ath11k_dp_pdev_reo_cleanup(struct ath11k_base *ab)
+{
+	struct ath11k_pdev_dp *dp;
+	struct ath11k *ar;
+	int i;
+
+	for (i = 0; i < ab->num_radios; i++) {
+		ar = ab->pdevs[i].ar;
+		dp = &ar->dp;
+		ath11k_dp_srng_cleanup(ab, &dp->reo_dst_ring);
+	}
+}
+
+int ath11k_dp_pdev_reo_setup(struct ath11k_base *ab)
+{
+	struct ath11k *ar;
+	struct ath11k_pdev_dp *dp;
+	int ret;
+	int i;
+
+	for (i = 0; i < ab->num_radios; i++) {
+		ar = ab->pdevs[i].ar;
+		dp = &ar->dp;
+		ret = ath11k_dp_srng_setup(ab, &dp->reo_dst_ring, HAL_REO_DST,
+					   dp->mac_id, dp->mac_id,
+					   DP_REO_DST_RING_SIZE);
+		if (ret) {
+			ath11k_warn(ar->ab, "failed to setup reo_dst_ring\n");
+			goto err_reo_cleanup;
+		}
+	}
+
+	return 0;
+
+err_reo_cleanup:
+	ath11k_dp_pdev_reo_cleanup(ab);
+
+	return ret;
+}
+
 static int ath11k_dp_rx_pdev_srng_alloc(struct ath11k *ar)
 {
 	struct ath11k_pdev_dp *dp = &ar->dp;
@@ -416,14 +455,6 @@ static int ath11k_dp_rx_pdev_srng_alloc(struct ath11k *ar)
 		return ret;
 	}
 
-	ret = ath11k_dp_srng_setup(ar->ab, &dp->reo_dst_ring, HAL_REO_DST,
-				   dp->mac_id, dp->mac_id,
-				   DP_REO_DST_RING_SIZE);
-	if (ret) {
-		ath11k_warn(ar->ab, "failed to setup reo_dst_ring\n");
-		return ret;
-	}
-
 	ret = ath11k_dp_srng_setup(ar->ab, &dp->rxdma_err_dst_ring,
 				   HAL_RXDMA_DST, 0, dp->mac_id,
 				   DP_RXDMA_ERR_DST_RING_SIZE);
diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.h b/drivers/net/wireless/ath/ath11k/dp_rx.h
index 026820f..eec5dea 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.h
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.h
@@ -48,6 +48,8 @@ int ath11k_peer_rx_tid_setup(struct ath11k *ar, const u8 *peer_mac, int vdev_id,
 			     u8 tid, u32 ba_win_sz, u16 ssn);
 void ath11k_dp_htt_htc_t2h_msg_handler(struct ath11k_base *ab,
 				       struct sk_buff *skb);
+int ath11k_dp_pdev_reo_setup(struct ath11k_base *ab);
+void ath11k_dp_pdev_reo_cleanup(struct ath11k_base *ab);
 int ath11k_dp_rx_pdev_alloc(struct ath11k_base *ab, int pdev_idx);
 void ath11k_dp_rx_pdev_free(struct ath11k_base *ab, int pdev_idx);
 void ath11k_dp_reo_cmd_list_cleanup(struct ath11k_base *ab);
-- 
2.7.4


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
