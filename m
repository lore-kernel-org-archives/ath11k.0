Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from szxga04-in.huawei.com ([45.249.212.190] helo=huawei.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jVZMg-00034M-2o
 for ath11k@lists.infradead.org; Mon, 04 May 2020 11:34:27 +0000
From: Jason Yan <yanaijie@huawei.com>
Subject: [PATCH] ath11k: use true,false for bool variables
Date: Mon, 4 May 2020 19:33:36 +0800
Message-ID: <20200504113336.41249-1-yanaijie@huawei.com>
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
To: kvalo@codeaurora.org, davem@davemloft.net, srirrama@codeaurora.org, ath11k@lists.infradead.org, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Jason Yan <yanaijie@huawei.com>

Fix the following coccicheck warning:

drivers/net/wireless/ath/ath11k/dp_rx.c:2964:1-39: WARNING: Assignment
of 0/1 to bool variable
drivers/net/wireless/ath/ath11k/dp_rx.c:2965:1-38: WARNING: Assignment
of 0/1 to bool variable

Signed-off-by: Jason Yan <yanaijie@huawei.com>
---
 drivers/net/wireless/ath/ath11k/dp_rx.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index bbd7da48518f..8d3ab3b5213d 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -2961,8 +2961,8 @@ static int ath11k_dp_rx_h_verify_tkip_mic(struct ath11k *ar, struct ath11k_peer
 	return 0;
 
 mic_fail:
-	(ATH11K_SKB_RXCB(msdu))->is_first_msdu = 1;
-	(ATH11K_SKB_RXCB(msdu))->is_last_msdu = 1;
+	(ATH11K_SKB_RXCB(msdu))->is_first_msdu = true;
+	(ATH11K_SKB_RXCB(msdu))->is_last_msdu = true;
 
 	rxs->flag |= RX_FLAG_MMIC_ERROR | RX_FLAG_MMIC_STRIPPED |
 		    RX_FLAG_IV_STRIPPED | RX_FLAG_DECRYPTED;
-- 
2.21.1


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
