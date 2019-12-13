Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from userp2120.oracle.com ([156.151.31.85])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ifib9-0000G2-OO
 for ath11k@lists.infradead.org; Fri, 13 Dec 2019 10:55:05 +0000
Date: Fri, 13 Dec 2019 13:54:48 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: [PATCH] ath11k: fix up some error paths
Message-ID: <20191213105448.b7lic5ddih6c3sqy@kili.mountain>
MIME-Version: 1.0
Content-Disposition: inline
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
Cc: Bhagavathi Perumal S <bperumal@codeaurora.org>, kernel-janitors@vger.kernel.org, Vasanthakumar Thiagarajan <vthiagar@codeaurora.org>, linux-wireless@vger.kernel.org, John Crispin <john@phrozen.org>, ath11k@lists.infradead.org

There are two error paths where "ret" wasn't set.  Ideally the compiler
would have warned about these bugs, but we initialized "ret" to zero so
it silenced the warning.  I have removed that.  Also if
ath11k_hal_srng_get_entrysize() fails then we need to free some
resources before returning.

Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/net/wireless/ath/ath11k/dp_tx.c | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/dp_tx.c b/drivers/net/wireless/ath/ath11k/dp_tx.c
index a8b9557c2346..ea7564245c58 100644
--- a/drivers/net/wireless/ath/ath11k/dp_tx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_tx.c
@@ -606,7 +606,7 @@ int ath11k_dp_tx_htt_srng_setup(struct ath11k_base *ab, u32 ring_id,
 	dma_addr_t hp_addr, tp_addr;
 	enum htt_srng_ring_type htt_ring_type;
 	enum htt_srng_ring_id htt_ring_id;
-	int ret = 0;
+	int ret;
 
 	skb = ath11k_htc_alloc_skb(ab, len);
 	if (!skb)
@@ -618,9 +618,10 @@ int ath11k_dp_tx_htt_srng_setup(struct ath11k_base *ab, u32 ring_id,
 	hp_addr = ath11k_hal_srng_get_hp_addr(ab, srng);
 	tp_addr = ath11k_hal_srng_get_tp_addr(ab, srng);
 
-	if (ath11k_dp_tx_get_ring_id_type(ab, mac_id, ring_id,
-					  ring_type, &htt_ring_type,
-					  &htt_ring_id))
+	ret = ath11k_dp_tx_get_ring_id_type(ab, mac_id, ring_id,
+					    ring_type, &htt_ring_type,
+					    &htt_ring_id);
+	if (ret)
 		goto err_free;
 
 	skb_put(skb, len);
@@ -646,7 +647,7 @@ int ath11k_dp_tx_htt_srng_setup(struct ath11k_base *ab, u32 ring_id,
 
 	ret = ath11k_hal_srng_get_entrysize(ring_type);
 	if (ret < 0)
-		return -EINVAL;
+		goto err_free;
 
 	ring_entry_sz = ret;
 
@@ -791,7 +792,7 @@ int ath11k_dp_tx_htt_rx_filter_setup(struct ath11k_base *ab, u32 ring_id,
 	int len = sizeof(*cmd);
 	enum htt_srng_ring_type htt_ring_type;
 	enum htt_srng_ring_id htt_ring_id;
-	int ret = 0;
+	int ret;
 
 	skb = ath11k_htc_alloc_skb(ab, len);
 	if (!skb)
@@ -800,9 +801,10 @@ int ath11k_dp_tx_htt_rx_filter_setup(struct ath11k_base *ab, u32 ring_id,
 	memset(&params, 0, sizeof(params));
 	ath11k_hal_srng_get_params(ab, srng, &params);
 
-	if (ath11k_dp_tx_get_ring_id_type(ab, mac_id, ring_id,
-					  ring_type, &htt_ring_type,
-					  &htt_ring_id))
+	ret = ath11k_dp_tx_get_ring_id_type(ab, mac_id, ring_id,
+					    ring_type, &htt_ring_type,
+					    &htt_ring_id);
+	if (ret)
 		goto err_free;
 
 	skb_put(skb, len);
-- 
2.11.0


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
