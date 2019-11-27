Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from a27-56.smtp-out.us-west-2.amazonses.com ([54.240.27.56])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iZy03-0002Sy-Qp
 for ath11k@lists.infradead.org; Wed, 27 Nov 2019 14:09:01 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: [PATCH 07/10] ath11k: update bawindow size in delba process
Date: Wed, 27 Nov 2019 14:08:57 +0000
Message-ID: <0101016ead3192f6-edd583a4-d52c-459c-b142-fc66c078097d-000000@us-west-2.amazonses.com>
In-Reply-To: <1574863720-25728-1-git-send-email-kvalo@codeaurora.org>
References: <1574863720-25728-1-git-send-email-kvalo@codeaurora.org>
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
To: linux-wireless@vger.kernel.org
Cc: ath11k@lists.infradead.org

From: Venkateswara Naralasetty <vnaralas@codeaurora.org>

Currenly in delba process calling ath11k_peer_rx_tid_delete() updates
reo with desc invalid and add tid queue to the flush list. If station
send data traffic without addba req and before tid flush, hw gives
those packets as invalid desc reo error. Since we are dropping these
invalid desc packets results in traffic stall.

This patch fix this issue by updating the reo queue with bawindow size 1
instead of tid removal in delba process.

Signed-off-by: Venkateswara Naralasetty <vnaralas@codeaurora.org>
Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/dp_rx.c | 28 +++++++++++++++++++---------
 1 file changed, 19 insertions(+), 9 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index f87bd327b082..8c21925a522a 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -641,7 +641,8 @@ void ath11k_peer_rx_tid_cleanup(struct ath11k *ar, struct ath11k_peer *peer)
 static int ath11k_peer_rx_tid_reo_update(struct ath11k *ar,
 					 struct ath11k_peer *peer,
 					 struct dp_rx_tid *rx_tid,
-					 u32 ba_win_sz, u16 ssn)
+					 u32 ba_win_sz, u16 ssn,
+					 bool update_ssn)
 {
 	struct ath11k_hal_reo_cmd cmd = {0};
 	int ret;
@@ -649,10 +650,13 @@ static int ath11k_peer_rx_tid_reo_update(struct ath11k *ar,
 	cmd.addr_lo = lower_32_bits(rx_tid->paddr);
 	cmd.addr_hi = upper_32_bits(rx_tid->paddr);
 	cmd.flag = HAL_REO_CMD_FLG_NEED_STATUS;
-	cmd.upd0 = HAL_REO_CMD_UPD0_BA_WINDOW_SIZE |
-		   HAL_REO_CMD_UPD0_SSN;
+	cmd.upd0 = HAL_REO_CMD_UPD0_BA_WINDOW_SIZE;
 	cmd.ba_window_size = ba_win_sz;
-	cmd.upd2 = FIELD_PREP(HAL_REO_CMD_UPD2_SSN, ssn);
+
+	if (update_ssn) {
+		cmd.upd0 |= HAL_REO_CMD_UPD0_SSN;
+		cmd.upd2 = FIELD_PREP(HAL_REO_CMD_UPD2_SSN, ssn);
+	}
 
 	ret = ath11k_dp_tx_send_reo_cmd(ar->ab, rx_tid,
 					HAL_REO_CMD_UPDATE_RX_QUEUE, &cmd,
@@ -722,7 +726,7 @@ int ath11k_peer_rx_tid_setup(struct ath11k *ar, const u8 *peer_mac, int vdev_id,
 	if (rx_tid->active) {
 		paddr = rx_tid->paddr;
 		ret = ath11k_peer_rx_tid_reo_update(ar, peer, rx_tid,
-						    ba_win_sz, ssn);
+						    ba_win_sz, ssn, true);
 		spin_unlock_bh(&ab->base_lock);
 		if (ret) {
 			ath11k_warn(ab, "failed to update reo for rx tid %d\n", tid);
@@ -832,12 +836,18 @@ int ath11k_dp_rx_ampdu_stop(struct ath11k *ar,
 	paddr = peer->rx_tid[params->tid].paddr;
 	active = peer->rx_tid[params->tid].active;
 
-	ath11k_peer_rx_tid_delete(ar, peer, params->tid);
+	if (!active) {
+		spin_unlock_bh(&ab->base_lock);
+		return 0;
+	}
 
+	ret = ath11k_peer_rx_tid_reo_update(ar, peer, peer->rx_tid, 1, 0, false);
 	spin_unlock_bh(&ab->base_lock);
-
-	if (!active)
-		return 0;
+	if (ret) {
+		ath11k_warn(ab, "failed to update reo for rx tid %d: %d\n",
+			    params->tid, ret);
+		return ret;
+	}
 
 	ret = ath11k_wmi_peer_rx_reorder_queue_setup(ar, vdev_id,
 						     params->sta->addr, paddr,
-- 
2.7.4


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
