Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from nbd.name ([2a01:4f8:221:3d45::2])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hnzI7-0001bt-1P
 for ath11k@lists.infradead.org; Thu, 18 Jul 2019 05:49:20 +0000
From: John Crispin <john@phrozen.org>
Subject: [PATCH 2/2] ath11k: convert message from info to dbg
Date: Thu, 18 Jul 2019 07:49:10 +0200
Message-Id: <20190718054910.362-2-john@phrozen.org>
In-Reply-To: <20190718054910.362-1-john@phrozen.org>
References: <20190718054910.362-1-john@phrozen.org>
MIME-Version: 1.0
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+kvalo=adurom.com@lists.infradead.org
To: Kalle Valo <kvalo@codeaurora.org>
Cc: Shashidhar Lakkavalli <slakkavalli@datto.com>, ath11k@lists.infradead.org, John Crispin <john@phrozen.org>

We can regularly see the following message.
- "ath11k c000000.wifi1: failed to find the peer with peer_id 4"
This happens when the FW starts sending stats for the peer whilst the
peer is not fully associated. Convert this info message to a debug one.

Signed-off-by: Shashidhar Lakkavalli <slakkavalli@datto.com>
Signed-off-by: John Crispin <john@phrozen.org>
---
 drivers/net/wireless/ath/ath11k/dp_rx.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index dcbc46b52493..e43fb38d5b6c 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -2632,7 +2632,8 @@ int ath11k_dp_rx_process_mon_status(struct ath11k_base *ab, int mac_id,
 		peer = ath11k_peer_find_by_id(ab, ppdu_info.peer_id);
 
 		if (!peer || !peer->sta) {
-			ath11k_warn(ab, "failed to find the peer with peer_id %d\n",
+			ath11k_dbg(ab, ATH11K_DBG_DATA,
+				    "failed to find the peer with peer_id %d\n",
 				    ppdu_info.peer_id);
 			spin_unlock_bh(&ab->base_lock);
 			rcu_read_unlock();
-- 
2.20.1


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
