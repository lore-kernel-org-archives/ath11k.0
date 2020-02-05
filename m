Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail25.static.mailgun.info ([104.130.122.25])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1izEvB-0002kz-3j
 for ath11k@lists.infradead.org; Wed, 05 Feb 2020 07:16:28 +0000
From: Anilkumar Kolli <akolli@codeaurora.org>
Subject: [PATCH] ath11k: fix parsing PPDU_CTRL type in pktlog
Date: Wed,  5 Feb 2020 12:45:59 +0530
Message-Id: <1580886959-8436-1-git-send-email-akolli@codeaurora.org>
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
Cc: linux-wireless@vger.kernel.org

PPDU_CTRL type is missing in current pktlog dumps.
PPDU_CTRL is sent on CE5 with len 2560 bytes, current
driver ignores the payload len greter than 2048.
PPDU_CTRL of 2560 bytes is sent in two fragments of len 2028
and 532 bytes, but firmware reports pkt header has length as 2560
for both of the fragments.

Signed-off-by: Anilkumar Kolli <akolli@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/debug.h | 13 ++++++++++---
 drivers/net/wireless/ath/ath11k/dp_rx.c | 12 ++----------
 2 files changed, 12 insertions(+), 13 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/debug.h b/drivers/net/wireless/ath/ath11k/debug.h
index aef33f83c9b1..12332eeabc10 100644
--- a/drivers/net/wireless/ath/ath11k/debug.h
+++ b/drivers/net/wireless/ath/ath11k/debug.h
@@ -65,12 +65,19 @@ struct debug_htt_stats_req {
 	u8 buf[0];
 };
 
-#define ATH11K_HTT_STATS_BUF_SIZE (1024 * 512)
+struct ath_pktlog_hdr {
+	u16 flags;
+	u16 missed_cnt;
+	u16 log_type;
+	u16 size;
+	u32 timestamp;
+	u32 type_specific_data;
+	u8 payload[0];
+};
 
+#define ATH11K_HTT_STATS_BUF_SIZE (1024 * 512)
 #define ATH11K_FW_STATS_BUF_SIZE (1024 * 1024)
 
-#define ATH11K_HTT_PKTLOG_MAX_SIZE 2048
-
 enum ath11k_pktlog_filter {
 	ATH11K_PKTLOG_RX		= 0x000000001,
 	ATH11K_PKTLOG_TX		= 0x000000002,
diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index ae4bfa5fe3b8..4e4bffd57b3f 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -1282,18 +1282,10 @@ static int ath11k_htt_pull_ppdu_stats(struct ath11k_base *ab,
 static void ath11k_htt_pktlog(struct ath11k_base *ab, struct sk_buff *skb)
 {
 	struct htt_pktlog_msg *data = (struct htt_pktlog_msg *)skb->data;
+	struct ath_pktlog_hdr *hdr = (struct ath_pktlog_hdr *)data;
 	struct ath11k *ar;
-	u32 len;
 	u8 pdev_id;
 
-	len = FIELD_GET(HTT_T2H_PPDU_STATS_INFO_PAYLOAD_SIZE, data->hdr);
-	if (len > ATH11K_HTT_PKTLOG_MAX_SIZE) {
-		ath11k_warn(ab, "htt pktlog buffer size %d, expected < %d\n",
-			    len,
-			    ATH11K_HTT_PKTLOG_MAX_SIZE);
-		return;
-	}
-
 	pdev_id = FIELD_GET(HTT_T2H_PPDU_STATS_INFO_PDEV_ID, data->hdr);
 	ar = ath11k_mac_get_ar_by_pdev_id(ab, pdev_id);
 	if (!ar) {
@@ -1301,7 +1293,7 @@ static void ath11k_htt_pktlog(struct ath11k_base *ab, struct sk_buff *skb)
 		return;
 	}
 
-	trace_ath11k_htt_pktlog(ar, data->payload, len);
+	trace_ath11k_htt_pktlog(ar, data->payload, hdr->size);
 }
 
 void ath11k_dp_htt_htc_t2h_msg_handler(struct ath11k_base *ab,
-- 
1.9.1

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
