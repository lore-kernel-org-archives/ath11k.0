Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hn2zf-00063I-I5
 for ath11k@lists.infradead.org; Mon, 15 Jul 2019 15:34:24 +0000
From: Miles Hu <milehu@codeaurora.org>
Subject: [PATCH] ath11k: fix no traffic problem in co-exist monitor mode
Date: Mon, 15 Jul 2019 08:33:59 -0700
Message-Id: <1563204839-10683-1-git-send-email-milehu@codeaurora.org>
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

Clear monitor flag in CB for regular data packet to avoid drop in mac80211.

Signed-off-by: Miles Hu <milehu@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/dp_rx.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index 9a1c247..b9c0eca 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -3915,6 +3915,7 @@ static int ath11k_dp_rx_mon_deliver(struct ath11k *ar, u32 mac_id,
 
 	header = mon_skb;
 
+	rxs->flag = 0;
 	do {
 		skb_next = mon_skb->next;
 		if (!skb_next)
@@ -3936,6 +3937,7 @@ static int ath11k_dp_rx_mon_deliver(struct ath11k *ar, u32 mac_id,
 		ath11k_dp_rx_deliver_msdu(ar, napi, mon_skb);
 		mon_skb = skb_next;
 	} while (mon_skb && (mon_skb != tail_msdu));
+	rxs->flag = 0;
 
 	return 0;
 
-- 
2.7.4


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
