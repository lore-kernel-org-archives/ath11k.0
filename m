Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from alexa-out-blr-01.qualcomm.com ([103.229.18.197])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iU1eD-0005fI-AL
 for ath11k@lists.infradead.org; Mon, 11 Nov 2019 04:49:55 +0000
From: Venkateswara Naralasetty <vnaralas@codeaurora.org>
Subject: [PATCH] ath11k: change failed to find peer id log level
Date: Mon, 11 Nov 2019 10:19:47 +0530
Message-Id: <1573447787-30517-1-git-send-email-vnaralas@codeaurora.org>
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
Cc: Venkateswara Naralasetty <vnaralas@codeaurora.org>

Peer deletion and NAPI processing are from two different paths,
failed to find peer id is expected when NAPI scheduled
for mon stats processing after peer deletion.

This patch change the log level from warn to debug.

Signed-off-by: Venkateswara Naralasetty <vnaralas@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/dp_rx.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index 8c0298d..d68a37e 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -2618,7 +2618,8 @@ int ath11k_dp_rx_process_mon_status(struct ath11k_base *ab, int mac_id,
 		peer = ath11k_peer_find_by_id(ab, ppdu_info.peer_id);
 
 		if (!peer || !peer->sta) {
-			ath11k_warn(ab, "failed to find the peer with peer_id %d\n",
+			ath11k_dbg(ab, ATH11K_DBG_DATA,
+				   "failed to find the peer with peer_id %d to update peer stats\n",
 				    ppdu_info.peer_id);
 			spin_unlock_bh(&ab->base_lock);
 			rcu_read_unlock();
-- 
2.7.4


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
