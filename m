Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hb0nW-0000If-G8
 for ath11k@lists.infradead.org; Wed, 12 Jun 2019 10:48:07 +0000
From: Maharaja Kennadyrajan <mkenna@codeaurora.org>
Subject: [PATCH] ath11k: Avoid unnecessary WARN_ON() in
 ath11k_dp_tx_complete_msdu()
Date: Wed, 12 Jun 2019 16:19:13 +0530
Message-Id: <1560336554-14420-6-git-send-email-mkenna@codeaurora.org>
In-Reply-To: <1560336554-14420-1-git-send-email-mkenna@codeaurora.org>
References: <1560336554-14420-1-git-send-email-mkenna@codeaurora.org>
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
Cc: Maharaja Kennadyrajan <mkenna@codeaurora.org>

In order to avoid unnecessary WARN_ON in the function
ath11k_dp_tx_complete_msdu, changed that WARN_ON to WARN_ON_ONCE.

Signed-off-by: Maharaja Kennadyrajan <mkenna@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/dp_tx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/dp_tx.c b/drivers/net/wireless/ath/ath11k/dp_tx.c
index 5670796da05b..45db589f8141 100644
--- a/drivers/net/wireless/ath/ath11k/dp_tx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_tx.c
@@ -358,7 +358,7 @@ static void ath11k_dp_tx_complete_msdu(struct ath11k *ar,
 	struct ieee80211_tx_info *info;
 	struct ath11k_skb_cb *skb_cb;
 
-	if (WARN_ON(ts->buf_rel_source != HAL_WBM_REL_SRC_MODULE_TQM)) {
+	if (WARN_ON_ONCE(ts->buf_rel_source != HAL_WBM_REL_SRC_MODULE_TQM)) {
 		/* Must not happen */
 		return;
 	}
-- 
2.21.0


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
