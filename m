Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from nbd.name ([2a01:4f8:221:3d45::2])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hdYsd-0004rj-SY
 for ath11k@lists.infradead.org; Wed, 19 Jun 2019 11:35:57 +0000
From: John Crispin <john@phrozen.org>
Subject: [PATCH] ath11k: fix whitespace error
Date: Wed, 19 Jun 2019 13:35:48 +0200
Message-Id: <20190619113548.19312-1-john@phrozen.org>
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
Cc: ath11k@lists.infradead.org, John Crispin <john@phrozen.org>

Signed-off-by: John Crispin <john@phrozen.org>
---
 drivers/net/wireless/ath/ath11k/dp_tx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/dp_tx.c b/drivers/net/wireless/ath/ath11k/dp_tx.c
index 1e92c02c37b9..027c887b1fb8 100644
--- a/drivers/net/wireless/ath/ath11k/dp_tx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_tx.c
@@ -387,7 +387,7 @@ static void ath11k_dp_tx_complete_msdu(struct ath11k *ar,
 	memset(&info->status, 0, sizeof(info->status));
 
 	/* skip tx rate update from ieee80211_status*/
-	 info->status.rates[0].idx = -1;
+	info->status.rates[0].idx = -1;
 
 	if (ts->status == HAL_WBM_TQM_REL_REASON_FRAME_ACKED &&
 	    !(info->flags & IEEE80211_TX_CTL_NO_ACK)) {
-- 
2.20.1


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
