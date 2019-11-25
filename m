Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from a27-185.smtp-out.us-west-2.amazonses.com ([54.240.27.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iZHLc-0006pX-87
 for ath11k@lists.infradead.org; Mon, 25 Nov 2019 16:36:26 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: [PATCH 3/8] ath11k: convert message from info to dbg
Date: Mon, 25 Nov 2019 16:36:21 +0000
Message-ID: <0101016ea36bcc01-7c9e0d7e-f06b-41e6-9e7d-9ea831389740-000000@us-west-2.amazonses.com>
In-Reply-To: <1574699772-17938-1-git-send-email-kvalo@codeaurora.org>
References: <1574699772-17938-1-git-send-email-kvalo@codeaurora.org>
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

From: John Crispin <john@phrozen.org>

We can regularly see the following message.
- "ath11k c000000.wifi1: failed to find the peer with peer_id 4"
This happens when the FW starts sending stats for the peer whilst the
peer is not fully associated. Convert this info message to a debug one.

Signed-off-by: Shashidhar Lakkavalli <slakkavalli@datto.com>
Signed-off-by: John Crispin <john@phrozen.org>
Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/dp_rx.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index c498c4920e11..d5963509419b 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -2621,8 +2621,9 @@ int ath11k_dp_rx_process_mon_status(struct ath11k_base *ab, int mac_id,
 		peer = ath11k_peer_find_by_id(ab, ppdu_info.peer_id);
 
 		if (!peer || !peer->sta) {
-			ath11k_warn(ab, "failed to find the peer with peer_id %d\n",
-				    ppdu_info.peer_id);
+			ath11k_dbg(ab, ATH11K_DBG_DATA,
+				   "failed to find the peer with peer_id %d\n",
+				   ppdu_info.peer_id);
 			spin_unlock_bh(&ab->base_lock);
 			rcu_read_unlock();
 			dev_kfree_skb_any(skb);
-- 
2.7.4


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
