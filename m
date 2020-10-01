Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from m42-4.mailgun.net ([69.72.42.4])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNuzP-00069H-0C
 for ath11k@lists.infradead.org; Thu, 01 Oct 2020 09:35:04 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: [PATCH 5/8] ath11k: start a timer to update REO cmd ring
Date: Thu,  1 Oct 2020 12:34:47 +0300
Message-Id: <1601544890-13450-6-git-send-email-kvalo@codeaurora.org>
In-Reply-To: <1601544890-13450-1-git-send-email-kvalo@codeaurora.org>
References: <1601544890-13450-1-git-send-email-kvalo@codeaurora.org>
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
Cc: linux-wireless@vger.kernel.org

From: Carl Huang <cjhuang@codeaurora.org>

Start a timer to update REO HP if HP isn't updated to target.

Tested-on: QCA6390 hw2.0 PCI WLAN.HST.1.0.1-01740-QCAHSTSWPLZ_V2_TO_X86-1

Signed-off-by: Carl Huang <cjhuang@codeaurora.org>
Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/dp.c     | 6 ++++++
 drivers/net/wireless/ath/ath11k/dp.h     | 2 ++
 drivers/net/wireless/ath/ath11k/hal_rx.c | 2 ++
 3 files changed, 10 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/dp.c b/drivers/net/wireless/ath/ath11k/dp.c
index 868bfa00c8b1..59dd185a0cfc 100644
--- a/drivers/net/wireless/ath/ath11k/dp.c
+++ b/drivers/net/wireless/ath/ath11k/dp.c
@@ -313,6 +313,8 @@ static void ath11k_dp_stop_shadow_timers(struct ath11k_base *ab)
 
 	for (i = 0; i < DP_TCL_NUM_RING_MAX; i++)
 		ath11k_dp_shadow_stop_timer(ab, &ab->dp.tx_ring_timer[i]);
+
+	ath11k_dp_shadow_stop_timer(ab, &ab->dp.reo_cmd_timer);
 }
 
 static void ath11k_dp_srng_common_cleanup(struct ath11k_base *ab)
@@ -425,6 +427,10 @@ static int ath11k_dp_srng_common_setup(struct ath11k_base *ab)
 	srng = &ab->hal.srng_list[dp->reo_cmd_ring.ring_id];
 	ath11k_hal_reo_init_cmd_ring(ab, srng);
 
+	ath11k_dp_shadow_init_timer(ab, &dp->reo_cmd_timer,
+				    ATH11K_SHADOW_CTRL_TIMER_INTERVAL,
+				    dp->reo_cmd_ring.ring_id);
+
 	ret = ath11k_dp_srng_setup(ab, &dp->reo_status_ring, HAL_REO_STATUS,
 				   0, 0, DP_REO_STATUS_RING_SIZE);
 	if (ret) {
diff --git a/drivers/net/wireless/ath/ath11k/dp.h b/drivers/net/wireless/ath/ath11k/dp.h
index 43fa229ccccd..ee8db812589b 100644
--- a/drivers/net/wireless/ath/ath11k/dp.h
+++ b/drivers/net/wireless/ath/ath11k/dp.h
@@ -207,6 +207,7 @@ struct ath11k_pdev_dp {
 #define DP_TX_DESC_ID_POOL_ID GENMASK(20, 19)
 
 #define ATH11K_SHADOW_DP_TIMER_INTERVAL 20
+#define ATH11K_SHADOW_CTRL_TIMER_INTERVAL 10
 
 struct ath11k_hp_update_timer {
 	struct timer_list timer;
@@ -248,6 +249,7 @@ struct ath11k_dp {
 	 * - reo_cmd_cache_flush_count
 	 */
 	spinlock_t reo_cmd_lock;
+	struct ath11k_hp_update_timer reo_cmd_timer;
 	struct ath11k_hp_update_timer tx_ring_timer[DP_TCL_NUM_RING_MAX];
 };
 
diff --git a/drivers/net/wireless/ath/ath11k/hal_rx.c b/drivers/net/wireless/ath/ath11k/hal_rx.c
index b0d6ece145be..fac2396edf32 100644
--- a/drivers/net/wireless/ath/ath11k/hal_rx.c
+++ b/drivers/net/wireless/ath/ath11k/hal_rx.c
@@ -256,6 +256,8 @@ int ath11k_hal_reo_cmd_send(struct ath11k_base *ab, struct hal_srng *srng,
 		break;
 	}
 
+	ath11k_dp_shadow_start_timer(ab, srng, &ab->dp.reo_cmd_timer);
+
 out:
 	ath11k_hal_srng_access_end(ab, srng);
 	spin_unlock_bh(&srng->lock);
-- 
2.7.4


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
