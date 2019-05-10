Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hP2cr-0000Q2-Uj
 for ath11k@lists.infradead.org; Fri, 10 May 2019 10:19:39 +0000
From: Anilkumar Kolli <akolli@codeaurora.org>
Subject: [PATCH] ath11k: Add sanity check in htt pktlog
Date: Fri, 10 May 2019 15:49:19 +0530
Message-Id: <1557483559-15843-1-git-send-email-akolli@codeaurora.org>
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

Add sanity check before processing pktlog buffer.

Signed-off-by: Anilkumar Kolli <akolli@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/debug.h | 2 ++
 drivers/net/wireless/ath/ath11k/dp_rx.c | 9 +++++++++
 2 files changed, 11 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/debug.h b/drivers/net/wireless/ath/ath11k/debug.h
index e51235f62536..13973d972169 100644
--- a/drivers/net/wireless/ath/ath11k/debug.h
+++ b/drivers/net/wireless/ath/ath11k/debug.h
@@ -68,6 +68,8 @@ struct debug_htt_stats_req {
 
 #define ATH11K_FW_STATS_BUF_SIZE (1024 * 1024)
 
+#define ATH11K_HTT_PKTLOG_MAX_SIZE 2048
+
 enum ath11k_pktlog_filter {
 	ATH11K_PKTLOG_RX		= 0x000000001,
 	ATH11K_PKTLOG_TX		= 0x000000002,
diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index 0796f3ba8333..c7582ce08899 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -1072,6 +1072,15 @@ static void ath11k_htt_pktlog(struct ath11k_base *ab,
 	u8 pdev_id;
 
 	len = FIELD_GET(HTT_T2H_PPDU_STATS_PAYLOAD_SIZE_M, *data);
+
+	if (len > ATH11K_HTT_PKTLOG_MAX_SIZE)
+	{
+		ath11k_warn(ab, "htt pktlog buffer size %d, expected < %d\n",
+			    len,
+			    ATH11K_HTT_PKTLOG_MAX_SIZE);
+		return;
+	}
+
 	pdev_id = FIELD_GET(HTT_T2H_PPDU_STATS_PDEV_ID_M, *data);
 	pdev_id = DP_HW2SW_MACID(pdev_id);
 	ar = ab->pdevs[pdev_id].ar;
-- 
1.9.1


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
