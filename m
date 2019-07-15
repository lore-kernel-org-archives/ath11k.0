Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hn2zx-00065a-5l
 for ath11k@lists.infradead.org; Mon, 15 Jul 2019 15:34:42 +0000
From: Miles Hu <milehu@codeaurora.org>
Subject: [PATCH] ath11k: fix duplicate rx packets in co-exist monitor mode
Date: Mon, 15 Jul 2019 08:34:36 -0700
Message-Id: <1563204876-10746-1-git-send-email-milehu@codeaurora.org>
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

Add SKIP_MONITOR flag to rx data packets so mac80211 can skip them. Monitor ring already push same packets up.

Signed-off-by: Miles Hu <milehu@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/dp_rx.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index b9c0eca..04ad2db 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -2093,6 +2093,7 @@ static void ath11k_dp_rx_pre_deliver_amsdu(struct ath11k *ar,
 		} else {
 			rxs->flag |= RX_FLAG_ALLOW_SAME_PN;
 		}
+		rxs->flag |= RX_FLAG_SKIP_MONITOR;
 
 		status = IEEE80211_SKB_RXCB(msdu);
 		*status = *rxs;
-- 
2.7.4


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
