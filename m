Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail27.static.mailgun.info ([104.130.122.27])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jVmND-0000Ba-Qd
 for ath11k@lists.infradead.org; Tue, 05 May 2020 01:27:53 +0000
From: Rajkumar Manoharan <rmanohar@codeaurora.org>
Subject: [PATCH] ath11k: remove stale monitor status descriptor
Date: Mon,  4 May 2020 18:27:43 -0700
Message-Id: <1588642063-6950-1-git-send-email-rmanohar@codeaurora.org>
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
Cc: Miles Hu <milehu@codeaurora.org>, linux-wireless@vger.kernel.org, Rajkumar Manoharan <rmanohar@codeaurora.org>

From: Miles Hu <milehu@codeaurora.org>

The driver is not handling monitor status descriptor whenever
the done bit of status descriptor is not set by hardware. This leave
a stale entry in monitor status ring and flooding warning message.
Fix that by removing the descriptor and move forward to next one
in monitor status ring.

Co-developed-by: Rajkumar Manoharan <rmanohar@codeaurora.org>
Signed-off-by: Rajkumar Manoharan <rmanohar@codeaurora.org>
Signed-off-by: Miles Hu <milehu@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/dp_rx.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index 47ad3bd9e1c6..27d17b8db662 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -2722,7 +2722,7 @@ static int ath11k_dp_rx_reap_mon_status_ring(struct ath11k_base *ab, int mac_id,
 				ath11k_warn(ab, "rx monitor status with invalid buf_id %d\n",
 					    buf_id);
 				spin_unlock_bh(&rx_ring->idr_lock);
-				continue;
+				goto move_next;
 			}
 
 			idr_remove(&rx_ring->bufs_idr, buf_id);
@@ -2741,13 +2741,16 @@ static int ath11k_dp_rx_reap_mon_status_ring(struct ath11k_base *ab, int mac_id,
 			tlv = (struct hal_tlv_hdr *)skb->data;
 			if (FIELD_GET(HAL_TLV_HDR_TAG, tlv->tl) !=
 					HAL_RX_STATUS_BUFFER_DONE) {
-				ath11k_hal_srng_src_get_next_entry(ab, srng);
-				continue;
+				ath11k_warn(ab, "mon status DONE not set %lx\n",
+					    FIELD_GET(HAL_TLV_HDR_TAG,
+						      tlv->tl));
+				dev_kfree_skb_any(skb);
+				goto move_next;
 			}
 
 			__skb_queue_tail(skb_list, skb);
 		}
-
+move_next:
 		skb = ath11k_dp_rx_alloc_mon_status_buf(ab, rx_ring,
 							&buf_id, GFP_ATOMIC);
 
-- 
2.7.4

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
