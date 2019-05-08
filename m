Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hOAWR-0006ob-HW
 for ath11k@lists.infradead.org; Wed, 08 May 2019 00:33:24 +0000
From: Rajkumar Manoharan <rmanohar@codeaurora.org>
Subject: [PATCH] ath11k: support HE max rx aggregation subframes
Date: Tue,  7 May 2019 17:33:13 -0700
Message-Id: <1557275593-2994-1-git-send-email-rmanohar@codeaurora.org>
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
Cc: Rajkumar Manoharan <rmanohar@codeaurora.org>

HE supports upto 256 subframes in an A-MPDU. Hence update
max_rx_aggregation_subframes to 256 at device registration.
Since tx A-MPDU aggregation is offloaded to HW, no need to
update tx aggregation subframes size.

Signed-off-by: Rajkumar Manoharan <rmanohar@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/mac.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 2ee0650fe9c1..6b5a466e27ef 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -4961,6 +4961,7 @@ static int ath11k_mac_register(struct ath11k *ar)
 
 	ar->hw->queues = ATH11K_HW_MAX_QUEUES;
 	ar->hw->offchannel_tx_hw_queue = ATH11K_HW_MAX_QUEUES - 1;
+	ar->hw->max_rx_aggregation_subframes = IEEE80211_MAX_AMPDU_BUF;
 
 	ar->hw->vif_data_size = sizeof(struct ath11k_vif);
 	ar->hw->sta_data_size = sizeof(struct ath11k_sta);
-- 
1.9.1


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
