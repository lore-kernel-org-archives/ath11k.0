Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hb0nN-0000Dl-1X
 for ath11k@lists.infradead.org; Wed, 12 Jun 2019 10:47:58 +0000
From: Maharaja Kennadyrajan <mkenna@codeaurora.org>
Subject: [PATCH 1/2] ath11k: Added 'ath11k' as prefix to the struct
 dp_htt_wbm_tx_status
Date: Wed, 12 Jun 2019 16:19:11 +0530
Message-Id: <1560336554-14420-4-git-send-email-mkenna@codeaurora.org>
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

Renamed the struct dp_htt_wbm_tx_status by adding a prefix
'ath11k'.

Signed-off-by: Maharaja Kennadyrajan <mkenna@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/dp_tx.c | 4 ++--
 drivers/net/wireless/ath/ath11k/dp_tx.h | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/dp_tx.c b/drivers/net/wireless/ath/ath11k/dp_tx.c
index 5670796da05b..21f0dcfad09d 100644
--- a/drivers/net/wireless/ath/ath11k/dp_tx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_tx.c
@@ -248,7 +248,7 @@ static void ath11k_dp_free_txbuf(struct ath11k_base *ab, u8 mac_id,
 
 static void ath11k_dp_htt_tx_complete_buf(struct ath11k_base *ab,
 					  struct dp_tx_ring *tx_ring,
-					  struct dp_htt_wbm_tx_status *ts)
+					  struct ath11k_dp_htt_wbm_tx_status *ts)
 {
 	struct sk_buff *msdu;
 	struct ieee80211_tx_info *info;
@@ -300,7 +300,7 @@ ath11k_dp_process_htt_tx_complete(struct ath11k_base *ab,
 				  u32 msdu_id, struct dp_tx_ring *tx_ring)
 {
 	struct htt_tx_wbm_completion *status_desc;
-	struct dp_htt_wbm_tx_status ts = {0};
+	struct ath11k_dp_htt_wbm_tx_status ts = {0};
 	enum hal_wbm_htt_tx_comp_status wbm_status;
 
 	status_desc = desc + HTT_TX_WBM_COMP_STATUS_OFFSET;
diff --git a/drivers/net/wireless/ath/ath11k/dp_tx.h b/drivers/net/wireless/ath/ath11k/dp_tx.h
index 751a0cec4997..373e7ed75a05 100644
--- a/drivers/net/wireless/ath/ath11k/dp_tx.h
+++ b/drivers/net/wireless/ath/ath11k/dp_tx.h
@@ -9,7 +9,7 @@
 #include "core.h"
 #include "hal_tx.h"
 
-struct dp_htt_wbm_tx_status {
+struct ath11k_dp_htt_wbm_tx_status {
 	u32 msdu_id;
 	bool acked;
 	int ack_rssi;
-- 
2.21.0


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
