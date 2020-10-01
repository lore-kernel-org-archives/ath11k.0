Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from m42-4.mailgun.net ([69.72.42.4])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNuzP-00069i-UO
 for ath11k@lists.infradead.org; Thu, 01 Oct 2020 09:35:05 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: [PATCH 6/8] ath11k: start a timer to update HP for CE pipe 4
Date: Thu,  1 Oct 2020 12:34:48 +0300
Message-Id: <1601544890-13450-7-git-send-email-kvalo@codeaurora.org>
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

For QCA6390, Start a timer to update CE pipe 4 ring HP when shadow
register is enabled. Its' to avoid that HP isn't updated to target
register.

Tested-on: QCA6390 hw2.0 PCI WLAN.HST.1.0.1-01740-QCAHSTSWPLZ_V2_TO_X86-1

Signed-off-by: Carl Huang <cjhuang@codeaurora.org>
Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/ce.c | 34 ++++++++++++++++++++++++++++++++++
 drivers/net/wireless/ath/ath11k/ce.h |  1 +
 2 files changed, 35 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/ce.c b/drivers/net/wireless/ath/ath11k/ce.c
index caa356dde880..9d730f8ac816 100644
--- a/drivers/net/wireless/ath/ath11k/ce.c
+++ b/drivers/net/wireless/ath/ath11k/ce.c
@@ -187,6 +187,26 @@ const struct ce_attr ath11k_host_ce_config_qca6390[] = {
 
 };
 
+static bool ath11k_ce_need_shadow_fix(int ce_id)
+{
+	/* only ce4 needs shadow workaroud*/
+	if (ce_id == 4)
+		return true;
+	return false;
+}
+
+static void ath11k_ce_stop_shadow_timers(struct ath11k_base *ab)
+{
+	int i;
+
+	if (!ab->hw_params.supports_shadow_regs)
+		return;
+
+	for (i = 0; i < ab->hw_params.ce_count; i++)
+		if (ath11k_ce_need_shadow_fix(i))
+			ath11k_dp_shadow_stop_timer(ab, &ab->ce.hp_timer[i]);
+}
+
 static int ath11k_ce_rx_buf_enqueue_pipe(struct ath11k_ce_pipe *pipe,
 					 struct sk_buff *skb, dma_addr_t paddr)
 {
@@ -505,6 +525,12 @@ static int ath11k_ce_init_ring(struct ath11k_base *ab,
 
 	ce_ring->hal_ring_id = ret;
 
+	if (ab->hw_params.supports_shadow_regs &&
+	    ath11k_ce_need_shadow_fix(ce_id))
+		ath11k_dp_shadow_init_timer(ab, &ab->ce.hp_timer[ce_id],
+					    ATH11K_SHADOW_CTRL_TIMER_INTERVAL,
+					    ce_ring->hal_ring_id);
+
 	return 0;
 }
 
@@ -677,6 +703,9 @@ int ath11k_ce_send(struct ath11k_base *ab, struct sk_buff *skb, u8 pipe_id,
 
 	ath11k_hal_srng_access_end(ab, srng);
 
+	if (ath11k_ce_need_shadow_fix(pipe_id))
+		ath11k_dp_shadow_start_timer(ab, srng, &ab->ce.hp_timer[pipe_id]);
+
 	spin_unlock_bh(&srng->lock);
 
 	spin_unlock_bh(&ab->ce.ce_lock);
@@ -761,6 +790,8 @@ void ath11k_ce_cleanup_pipes(struct ath11k_base *ab)
 	struct ath11k_ce_pipe *pipe;
 	int pipe_num;
 
+	ath11k_ce_stop_shadow_timers(ab);
+
 	for (pipe_num = 0; pipe_num < ab->hw_params.ce_count; pipe_num++) {
 		pipe = &ab->ce.ce_pipe[pipe_num];
 		ath11k_ce_rx_pipe_cleanup(pipe);
@@ -874,6 +905,9 @@ void ath11k_ce_free_pipes(struct ath11k_base *ab)
 	for (i = 0; i < ab->hw_params.ce_count; i++) {
 		pipe = &ab->ce.ce_pipe[i];
 
+		if (ath11k_ce_need_shadow_fix(i))
+			ath11k_dp_shadow_stop_timer(ab, &ab->ce.hp_timer[i]);
+
 		if (pipe->src_ring) {
 			desc_sz = ath11k_hal_ce_get_desc_size(HAL_CE_DESC_SRC);
 			dma_free_coherent(ab->dev,
diff --git a/drivers/net/wireless/ath/ath11k/ce.h b/drivers/net/wireless/ath/ath11k/ce.h
index 26ef65e2528e..269b599ac0b0 100644
--- a/drivers/net/wireless/ath/ath11k/ce.h
+++ b/drivers/net/wireless/ath/ath11k/ce.h
@@ -168,6 +168,7 @@ struct ath11k_ce {
 	struct ath11k_ce_pipe ce_pipe[CE_COUNT_MAX];
 	/* Protects rings of all ce pipes */
 	spinlock_t ce_lock;
+	struct ath11k_hp_update_timer hp_timer[CE_COUNT_MAX];
 };
 
 extern const struct ce_attr ath11k_host_ce_config_ipq8074[];
-- 
2.7.4


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
