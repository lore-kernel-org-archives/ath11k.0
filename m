Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hvi4h-00087K-Hm
 for ath11k@lists.infradead.org; Thu, 08 Aug 2019 13:03:25 +0000
From: Maharaja Kennadyrajan <mkenna@codeaurora.org>
Subject: [PATCH 08/15] ath11k: Rename ath11k_base struct from 'sc' to 'ab in
 dp.c
Date: Thu,  8 Aug 2019 18:33:05 +0530
Message-Id: <1565269392-2838-9-git-send-email-mkenna@codeaurora.org>
In-Reply-To: <1565269392-2838-1-git-send-email-mkenna@codeaurora.org>
References: <1565269392-2838-1-git-send-email-mkenna@codeaurora.org>
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

To avoid confusion and better readability, renamed the
ath11k_base struct from 'sc' to 'ab' in dp.c file.

Signed-off-by: Maharaja Kennadyrajan <mkenna@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/dp.c | 40 ++++++++++++++--------------
 1 file changed, 20 insertions(+), 20 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/dp.c b/drivers/net/wireless/ath/ath11k/dp.c
index 18a354d75d00..b55d9d023a55 100644
--- a/drivers/net/wireless/ath/ath11k/dp.c
+++ b/drivers/net/wireless/ath/ath11k/dp.c
@@ -11,7 +11,7 @@
 #include "dp_rx.h"
 #include "peer.h"
 
-static void ath11k_dp_htt_htc_tx_complete(struct ath11k_base *sc,
+static void ath11k_dp_htt_htc_tx_complete(struct ath11k_base *ab,
 					  struct sk_buff *skb)
 {
 	dev_kfree_skb_any(skb);
@@ -745,7 +745,7 @@ int ath11k_dp_htt_connect(struct ath11k_dp *dp)
 	/* connect to control service */
 	conn_req.service_id = ATH11K_HTC_SVC_ID_HTT_DATA_MSG;
 
-	status = ath11k_htc_connect_service(&dp->sc->htc, &conn_req,
+	status = ath11k_htc_connect_service(&dp->ab->htc, &conn_req,
 					    &conn_resp);
 
 	if (status)
@@ -805,22 +805,22 @@ static int ath11k_dp_tx_pending_cleanup(int buf_id, void *skb, void *ctx)
 	return 0;
 }
 
-void ath11k_dp_free(struct ath11k_base *sc)
+void ath11k_dp_free(struct ath11k_base *ab)
 {
-	struct ath11k_dp *dp = &sc->dp;
+	struct ath11k_dp *dp = &ab->dp;
 	int i;
 
-	ath11k_dp_link_desc_cleanup(sc, dp->link_desc_banks,
+	ath11k_dp_link_desc_cleanup(ab, dp->link_desc_banks,
 				    HAL_WBM_IDLE_LINK, &dp->wbm_idle_ring);
 
-	ath11k_dp_srng_common_cleanup(sc);
+	ath11k_dp_srng_common_cleanup(ab);
 
-	ath11k_dp_reo_cmd_list_cleanup(sc);
+	ath11k_dp_reo_cmd_list_cleanup(ab);
 
 	for (i = 0; i < DP_TCL_NUM_RING_MAX; i++) {
 		spin_lock_bh(&dp->tx_ring[i].tx_idr_lock);
 		idr_for_each(&dp->tx_ring[i].txbuf_idr,
-			     ath11k_dp_tx_pending_cleanup, sc);
+			     ath11k_dp_tx_pending_cleanup, ab);
 		idr_destroy(&dp->tx_ring[i].txbuf_idr);
 		spin_unlock_bh(&dp->tx_ring[i].tx_idr_lock);
 
@@ -832,37 +832,37 @@ void ath11k_dp_free(struct ath11k_base *sc)
 	/* Deinit any SOC level resource */
 }
 
-int ath11k_dp_alloc(struct ath11k_base *sc)
+int ath11k_dp_alloc(struct ath11k_base *ab)
 {
-	struct ath11k_dp *dp = &sc->dp;
+	struct ath11k_dp *dp = &ab->dp;
 	struct hal_srng *srng = NULL;
 	size_t size = 0;
 	u32 n_link_desc = 0;
 	int ret;
 	int i;
 
-	dp->sc = sc;
+	dp->ab = ab;
 
 	INIT_LIST_HEAD(&dp->reo_cmd_list);
 	INIT_LIST_HEAD(&dp->reo_cmd_cache_flush_list);
 	spin_lock_init(&dp->reo_cmd_lock);
 
-	ret = ath11k_wbm_idle_ring_setup(sc, &n_link_desc);
+	ret = ath11k_wbm_idle_ring_setup(ab, &n_link_desc);
 	if (ret) {
-		ath11k_warn(sc, "failed to setup wbm_idle_ring: %d\n", ret);
+		ath11k_warn(ab, "failed to setup wbm_idle_ring: %d\n", ret);
 		return ret;
 	}
 
-	srng = &sc->hal.srng_list[dp->wbm_idle_ring.ring_id];
+	srng = &ab->hal.srng_list[dp->wbm_idle_ring.ring_id];
 
-	ret = ath11k_dp_link_desc_setup(sc, dp->link_desc_banks,
+	ret = ath11k_dp_link_desc_setup(ab, dp->link_desc_banks,
 					HAL_WBM_IDLE_LINK, srng, n_link_desc);
 	if (ret) {
-		ath11k_warn(sc, "failed to setup link desc: %d\n", ret);
+		ath11k_warn(ab, "failed to setup link desc: %d\n", ret);
 		return ret;
 	}
 
-	ret = ath11k_dp_srng_common_setup(sc);
+	ret = ath11k_dp_srng_common_setup(ab);
 	if (ret)
 		goto fail_link_desc_cleanup;
 
@@ -881,17 +881,17 @@ int ath11k_dp_alloc(struct ath11k_base *sc)
 	}
 
 	for (i = 0; i < HAL_DSCP_TID_MAP_TBL_NUM_ENTRIES_MAX; i++)
-		ath11k_hal_tx_set_dscp_tid_map(sc, i);
+		ath11k_hal_tx_set_dscp_tid_map(ab, i);
 
 	/* Init any SOC level resource for DP */
 
 	return 0;
 
 fail_cmn_srng_cleanup:
-	ath11k_dp_srng_common_cleanup(sc);
+	ath11k_dp_srng_common_cleanup(ab);
 
 fail_link_desc_cleanup:
-	ath11k_dp_link_desc_cleanup(sc, dp->link_desc_banks,
+	ath11k_dp_link_desc_cleanup(ab, dp->link_desc_banks,
 				    HAL_WBM_IDLE_LINK, &dp->wbm_idle_ring);
 
 	return ret;
-- 
2.21.0


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
