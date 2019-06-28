Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from nbd.name ([2a01:4f8:221:3d45::2])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hgnqy-0005Z4-UW
 for ath11k@lists.infradead.org; Fri, 28 Jun 2019 10:11:38 +0000
From: John Crispin <john@phrozen.org>
Subject: [RFC 2/2] ath11k: drop memset in tx status hotpath
Date: Fri, 28 Jun 2019 12:11:27 +0200
Message-Id: <20190628101127.6044-2-john@phrozen.org>
In-Reply-To: <20190628101127.6044-1-john@phrozen.org>
References: <20190628101127.6044-1-john@phrozen.org>
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
Cc: John Crispin <john@phrozen.org>, ath11k@lists.infradead.org, Rajkumar Manoharan <rmanohar@qti.qualcomm.com>

This in a small but measurable performance increase.

Signed-off-by: John Crispin <john@phrozen.org>
---
 drivers/net/wireless/ath/ath11k/dp_tx.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/dp_tx.c b/drivers/net/wireless/ath/ath11k/dp_tx.c
index b3d5995fc657..8c5db3c88a87 100644
--- a/drivers/net/wireless/ath/ath11k/dp_tx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_tx.c
@@ -448,7 +448,6 @@ void ath11k_dp_tx_completion_handler(struct ath11k_base *ab, int ring_id)
 	int hal_ring_id = dp->tx_ring[ring_id].tcl_comp_ring.ring_id;
 	struct hal_srng *status_ring = &ab->hal.srng_list[hal_ring_id];
 	struct sk_buff *msdu;
-	struct hal_tx_status ts;
 	struct dp_tx_ring *tx_ring = &dp->tx_ring[ring_id];
 	u32 msdu_id;
 	u32 *desc;
@@ -459,7 +458,8 @@ void ath11k_dp_tx_completion_handler(struct ath11k_base *ab, int ring_id)
 	ath11k_hal_srng_access_begin(ab, status_ring);
 
 	while ((desc = ath11k_hal_srng_dst_get_next_entry(ab, status_ring))) {
-		memset(&ts, 0, sizeof(ts));
+		struct hal_tx_status ts = { 0 };
+
 		ath11k_hal_tx_status_parse(ab,
 					   (struct hal_wbm_release_ring *)desc,
 					   &ts);
-- 
2.20.1


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
