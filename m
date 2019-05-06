Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hNegf-0000CA-Ik
 for ath11k@lists.infradead.org; Mon, 06 May 2019 14:33:50 +0000
From: Karthikeyan Periyasamy <periyasa@codeaurora.org>
Subject: [PATCH] ath11k: Increase Tx idr size to avoid Tx fail
Date: Mon,  6 May 2019 20:02:42 +0530
Message-Id: <1557153162-15342-1-git-send-email-periyasa@codeaurora.org>
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
Cc: Karthikeyan Periyasamy <periyasa@codeaurora.org>

In data traffic, encounter below warn due to idr resource unavailable.
we found that idr alloc size is not good enough to pump the traffic.
so increased the idr size by double the TX completion ring size.

Warn:
ath11k c000000.wifi1: failed to transmit frame -28

Signed-off-by: Karthikeyan Periyasamy <periyasa@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/dp.h    | 1 +
 drivers/net/wireless/ath/ath11k/dp_tx.c | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/dp.h b/drivers/net/wireless/ath/ath11k/dp.h
index d4a68a8..3a69f66 100644
--- a/drivers/net/wireless/ath/ath11k/dp.h
+++ b/drivers/net/wireless/ath/ath11k/dp.h
@@ -114,6 +114,7 @@ struct dp_link_desc_bank {
 #define DP_WBM_RELEASE_RING_SIZE	64
 #define DP_TCL_DATA_RING_SIZE		512
 #define DP_TX_COMP_RING_SIZE		8192
+#define DP_TX_IDR_SIZE			(DP_TX_COMP_RING_SIZE << 1)
 #define DP_TCL_CMD_RING_SIZE		32
 #define DP_TCL_STATUS_RING_SIZE		32
 #define DP_REO_DST_RING_MAX		4
diff --git a/drivers/net/wireless/ath/ath11k/dp_tx.c b/drivers/net/wireless/ath/ath11k/dp_tx.c
index 86e9d01..123985e 100644
--- a/drivers/net/wireless/ath/ath11k/dp_tx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_tx.c
@@ -97,7 +97,7 @@ int ath11k_dp_tx(struct ath11k *ar, struct ath11k_vif *arvif,
 
 	spin_lock_bh(&tx_ring->tx_idr_lock);
 	ret = idr_alloc(&tx_ring->txbuf_idr, skb, 0,
-			DP_TX_COMP_RING_SIZE, GFP_ATOMIC);
+			DP_TX_IDR_SIZE - 1, GFP_ATOMIC);
 	spin_unlock_bh(&tx_ring->tx_idr_lock);
 
 	if (ret < 0)
-- 
1.9.1


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
