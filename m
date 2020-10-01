Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from m42-4.mailgun.net ([69.72.42.4])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNuzN-00069i-FA
 for ath11k@lists.infradead.org; Thu, 01 Oct 2020 09:35:02 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: [PATCH 4/8] ath11k: start a timer to update TCL HP
Date: Thu,  1 Oct 2020 12:34:46 +0300
Message-Id: <1601544890-13450-5-git-send-email-kvalo@codeaurora.org>
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

The timer is to check if TCL HP isn't updated to target.
The timer will postpone itself if there are TX operations
during the interval, otherwise the timer handler updates
the HP again so the index value in HP register will be
forwarded to target register, and the timer stops afterwards.

Tested-on: QCA6390 hw2.0 PCI WLAN.HST.1.0.1-01740-QCAHSTSWPLZ_V2_TO_X86-1

Signed-off-by: Carl Huang <cjhuang@codeaurora.org>
Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/dp.c    | 91 +++++++++++++++++++++++++++++++++
 drivers/net/wireless/ath/ath11k/dp.h    | 22 ++++++++
 drivers/net/wireless/ath/ath11k/dp_tx.c |  2 +
 drivers/net/wireless/ath/ath11k/hal.c   | 13 +++++
 drivers/net/wireless/ath/ath11k/hal.h   |  2 +
 5 files changed, 130 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/dp.c b/drivers/net/wireless/ath/ath11k/dp.c
index 0802f5b05fe8..868bfa00c8b1 100644
--- a/drivers/net/wireless/ath/ath11k/dp.c
+++ b/drivers/net/wireless/ath/ath11k/dp.c
@@ -304,11 +304,23 @@ int ath11k_dp_srng_setup(struct ath11k_base *ab, struct dp_srng *ring,
 	return 0;
 }
 
+static void ath11k_dp_stop_shadow_timers(struct ath11k_base *ab)
+{
+	int i;
+
+	if (!ab->hw_params.supports_shadow_regs)
+		return;
+
+	for (i = 0; i < DP_TCL_NUM_RING_MAX; i++)
+		ath11k_dp_shadow_stop_timer(ab, &ab->dp.tx_ring_timer[i]);
+}
+
 static void ath11k_dp_srng_common_cleanup(struct ath11k_base *ab)
 {
 	struct ath11k_dp *dp = &ab->dp;
 	int i;
 
+	ath11k_dp_stop_shadow_timers(ab);
 	ath11k_dp_srng_cleanup(ab, &dp->wbm_desc_rel_ring);
 	ath11k_dp_srng_cleanup(ab, &dp->tcl_cmd_ring);
 	ath11k_dp_srng_cleanup(ab, &dp->tcl_status_ring);
@@ -374,6 +386,10 @@ static int ath11k_dp_srng_common_setup(struct ath11k_base *ab)
 
 		srng = &ab->hal.srng_list[dp->tx_ring[i].tcl_data_ring.ring_id];
 		ath11k_hal_tx_init_data_ring(ab, srng);
+
+		ath11k_dp_shadow_init_timer(ab, &dp->tx_ring_timer[i],
+					    ATH11K_SHADOW_DP_TIMER_INTERVAL,
+					    dp->tx_ring[i].tcl_data_ring.ring_id);
 	}
 
 	ret = ath11k_dp_srng_setup(ab, &dp->reo_reinject_ring, HAL_REO_REINJECT,
@@ -1066,3 +1082,78 @@ int ath11k_dp_alloc(struct ath11k_base *ab)
 
 	return ret;
 }
+
+static void ath11k_dp_shadow_timer_handler(struct timer_list *t)
+{
+	struct ath11k_hp_update_timer *update_timer = from_timer(update_timer,
+								 t, timer);
+	struct ath11k_base *ab = update_timer->ab;
+	struct hal_srng	*srng = &ab->hal.srng_list[update_timer->ring_id];
+
+	spin_lock_bh(&srng->lock);
+
+	/* when the timer is fired, the handler checks whether there
+	 * are new TX happened. The handler updates HP only when there
+	 * are no TX operations during the timeout interval, and stop
+	 * the timer. Timer will be started again when TX happens again.
+	 */
+	if (update_timer->timer_tx_num != update_timer->tx_num) {
+		update_timer->timer_tx_num = update_timer->tx_num;
+		mod_timer(&update_timer->timer, jiffies +
+		  msecs_to_jiffies(update_timer->interval));
+	} else {
+		update_timer->started = false;
+		ath11k_hal_srng_shadow_update_hp_tp(ab, srng);
+	}
+
+	spin_unlock_bh(&srng->lock);
+}
+
+void ath11k_dp_shadow_start_timer(struct ath11k_base *ab,
+				  struct hal_srng *srng,
+				  struct ath11k_hp_update_timer *update_timer)
+{
+	lockdep_assert_held(&srng->lock);
+
+	if (!ab->hw_params.supports_shadow_regs)
+		return;
+
+	update_timer->tx_num++;
+
+	if (update_timer->started)
+		return;
+
+	update_timer->started = true;
+	update_timer->timer_tx_num = update_timer->tx_num;
+	mod_timer(&update_timer->timer, jiffies +
+		  msecs_to_jiffies(update_timer->interval));
+}
+
+void ath11k_dp_shadow_stop_timer(struct ath11k_base *ab,
+				 struct ath11k_hp_update_timer *update_timer)
+{
+	if (!ab->hw_params.supports_shadow_regs)
+		return;
+
+	if (!update_timer->init)
+		return;
+
+	del_timer_sync(&update_timer->timer);
+}
+
+void ath11k_dp_shadow_init_timer(struct ath11k_base *ab,
+				 struct ath11k_hp_update_timer *update_timer,
+				 u32 interval, u32 ring_id)
+{
+	if (!ab->hw_params.supports_shadow_regs)
+		return;
+
+	update_timer->tx_num = 0;
+	update_timer->timer_tx_num = 0;
+	update_timer->ab = ab;
+	update_timer->ring_id = ring_id;
+	update_timer->interval = interval;
+	update_timer->init = true;
+	timer_setup(&update_timer->timer,
+		    ath11k_dp_shadow_timer_handler, 0);
+}
diff --git a/drivers/net/wireless/ath/ath11k/dp.h b/drivers/net/wireless/ath/ath11k/dp.h
index 5402d5ad2e5a..43fa229ccccd 100644
--- a/drivers/net/wireless/ath/ath11k/dp.h
+++ b/drivers/net/wireless/ath/ath11k/dp.h
@@ -206,6 +206,19 @@ struct ath11k_pdev_dp {
 #define DP_TX_DESC_ID_MSDU_ID GENMASK(18, 2)
 #define DP_TX_DESC_ID_POOL_ID GENMASK(20, 19)
 
+#define ATH11K_SHADOW_DP_TIMER_INTERVAL 20
+
+struct ath11k_hp_update_timer {
+	struct timer_list timer;
+	bool started;
+	bool init;
+	u32 tx_num;
+	u32 timer_tx_num;
+	u32 ring_id;
+	u32 interval;
+	struct ath11k_base *ab;
+};
+
 struct ath11k_dp {
 	struct ath11k_base *ab;
 	enum ath11k_htc_ep_id eid;
@@ -235,6 +248,7 @@ struct ath11k_dp {
 	 * - reo_cmd_cache_flush_count
 	 */
 	spinlock_t reo_cmd_lock;
+	struct ath11k_hp_update_timer tx_ring_timer[DP_TCL_NUM_RING_MAX];
 };
 
 /* HTT definitions */
@@ -1616,5 +1630,13 @@ int ath11k_dp_link_desc_setup(struct ath11k_base *ab,
 			      struct dp_link_desc_bank *link_desc_banks,
 			      u32 ring_type, struct hal_srng *srng,
 			      u32 n_link_desc);
+void ath11k_dp_shadow_start_timer(struct ath11k_base *ab,
+				  struct hal_srng	*srng,
+				  struct ath11k_hp_update_timer *update_timer);
+void ath11k_dp_shadow_stop_timer(struct ath11k_base *ab,
+				 struct ath11k_hp_update_timer *update_timer);
+void ath11k_dp_shadow_init_timer(struct ath11k_base *ab,
+				 struct ath11k_hp_update_timer *update_timer,
+				 u32 interval, u32 ring_id);
 
 #endif
diff --git a/drivers/net/wireless/ath/ath11k/dp_tx.c b/drivers/net/wireless/ath/ath11k/dp_tx.c
index d329ff75221b..eb5eddc5a7aa 100644
--- a/drivers/net/wireless/ath/ath11k/dp_tx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_tx.c
@@ -254,6 +254,8 @@ int ath11k_dp_tx(struct ath11k *ar, struct ath11k_vif *arvif,
 
 	ath11k_hal_srng_access_end(ab, tcl_ring);
 
+	ath11k_dp_shadow_start_timer(ab, tcl_ring, &dp->tx_ring_timer[ti.ring_id]);
+
 	spin_unlock_bh(&tcl_ring->lock);
 
 	ath11k_dbg_dump(ab, ATH11K_DBG_DP_TX, NULL, "dp tx msdu: ",
diff --git a/drivers/net/wireless/ath/ath11k/hal.c b/drivers/net/wireless/ath/ath11k/hal.c
index d58dfdfe7860..20f9cebc86d2 100644
--- a/drivers/net/wireless/ath/ath11k/hal.c
+++ b/drivers/net/wireless/ath/ath11k/hal.c
@@ -1174,6 +1174,19 @@ void ath11k_hal_srng_get_shadow_config(struct ath11k_base *ab,
 	*cfg = hal->shadow_reg_addr;
 }
 
+void ath11k_hal_srng_shadow_update_hp_tp(struct ath11k_base *ab,
+					 struct hal_srng *srng)
+{
+	lockdep_assert_held(&srng->lock);
+
+	/* check whether the ring is emptry. Update the shadow
+	 * HP only when then ring isn't' empty.
+	 */
+	if (srng->ring_dir == HAL_SRNG_DIR_SRC &&
+	    *srng->u.src_ring.tp_addr != srng->u.src_ring.hp)
+		ath11k_hal_srng_access_end(ab, srng);
+}
+
 static int ath11k_hal_srng_create_config(struct ath11k_base *ab)
 {
 	struct ath11k_hal *hal = &ab->hal;
diff --git a/drivers/net/wireless/ath/ath11k/hal.h b/drivers/net/wireless/ath/ath11k/hal.h
index fe2448b52a7d..1f1b29cd0aa3 100644
--- a/drivers/net/wireless/ath/ath11k/hal.h
+++ b/drivers/net/wireless/ath/ath11k/hal.h
@@ -945,4 +945,6 @@ int ath11k_hal_srng_update_shadow_config(struct ath11k_base *ab,
 					 enum hal_ring_type ring_type,
 					int ring_num);
 void ath11k_hal_srng_shadow_config(struct ath11k_base *ab);
+void ath11k_hal_srng_shadow_update_hp_tp(struct ath11k_base *ab,
+					 struct hal_srng *srng);
 #endif
-- 
2.7.4


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
