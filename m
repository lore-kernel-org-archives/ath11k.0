Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iUH2p-0003JT-5s
 for ath11k@lists.infradead.org; Mon, 11 Nov 2019 21:16:20 +0000
From: Miles Hu <milehu@codeaurora.org>
Subject: [PATCH] ath11k: fix memory leak in monitor mode
Date: Mon, 11 Nov 2019 13:15:03 -0800
Message-Id: <1573506903-3593-1-git-send-email-milehu@codeaurora.org>
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
Cc: Miles Hu <milehu@codeaurora.org>

remove tail check to avoid last amsdu leak.
recycle skb in ppdu id wrap around case

Signed-off-by: Miles Hu <milehu@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/dp_rx.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -3991,8 +3991,15 @@ ath11k_dp_rx_mon_mpdu_pop(struct ath11k
 
 				if (ath11k_dp_rx_mon_comp_ppduid(msdu_ppdu_id,
 								 ppdu_id,
-								 &rx_bufs_used))
+								 &rx_bufs_used)) {
+					if (rx_bufs_used) {
+						drop_mpdu = true;
+						dev_kfree_skb_any(msdu);
+						msdu = NULL;
+						goto next_msdu;
+					}
 					return rx_bufs_used;
+				}
 				pmon->mon_last_linkdesc_paddr = paddr;
 				is_first_msdu = false;
 			}
@@ -4194,7 +4201,7 @@ static int ath11k_dp_rx_mon_deliver(stru
 
 		ath11k_dp_rx_deliver_msdu(ar, napi, mon_skb);
 		mon_skb = skb_next;
-	} while (mon_skb && (mon_skb != tail_msdu));
+	} while (mon_skb);
 	rxs->flag = 0;
 
 	return 0;

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
