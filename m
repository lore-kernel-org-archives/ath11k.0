Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from alexa-out-blr-01.qualcomm.com ([103.229.18.197])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hdBvX-000288-Rq
 for ath11k@lists.infradead.org; Tue, 18 Jun 2019 11:05:25 +0000
From: Venkateswara Naralasetty <vnaralas@codeaurora.org>
Subject: [PATCH] ath11k: clean up in htt ppdu stats
Date: Tue, 18 Jun 2019 16:35:18 +0530
Message-Id: <1560855918-31801-1-git-send-email-vnaralas@codeaurora.org>
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
Cc: Venkateswara Naralasetty <vnaralas@codeaurora.org>

Removed pointer arithmetic and the magic numbers

Signed-off-by: Venkateswara Naralasetty <vnaralas@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/dp.h    | 12 ++++++++++--
 drivers/net/wireless/ath/ath11k/dp_rx.c | 18 ++++++++----------
 2 files changed, 18 insertions(+), 12 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/dp.h b/drivers/net/wireless/ath/ath11k/dp.h
index 037fcbd..514acf1 100644
--- a/drivers/net/wireless/ath/ath11k/dp.h
+++ b/drivers/net/wireless/ath/ath11k/dp.h
@@ -1005,8 +1005,16 @@ struct htt_resp_msg {
  *    Value: payload_size in bytes
  */
 
-#define HTT_T2H_PPDU_STATS_PAYLOAD_SIZE_M GENMASK(31, 16)
-#define HTT_T2H_PPDU_STATS_PDEV_ID_M GENMASK(11, 10)
+#define HTT_T2H_PPDU_STATS_INFO_PDEV_ID GENMASK(11, 10)
+#define HTT_T2H_PPDU_STATS_INFO_PAYLOAD_SIZE GENMASK(31, 16)
+
+struct ath11k_htt_ppdu_stats_msg {
+	u32 info;
+	u32 ppdu_id;
+	u32 timestamp;
+	u32 rsvd;
+	u8 data[0];
+} __packed;
 
 struct htt_tlv {
 	u32 header;
diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index 0c660de..03390a8 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -1035,17 +1035,18 @@ struct htt_ppdu_stats_info *ath11k_dp_htt_get_ppdu_desc(struct ath11k *ar,
 
 static int ath11k_htt_pull_ppdu_stats(struct ath11k_base *ab,
 					 struct sk_buff *skb) {
-	u8 *data = (u8 *)skb->data;
+	struct ath11k_htt_ppdu_stats_msg *msg;
 	struct htt_ppdu_stats_info *ppdu_info;
 	struct ath11k *ar;
 	int ret;
 	u8 pdev_id;
 	u32 ppdu_id, len;
 
-	len = FIELD_GET(HTT_T2H_PPDU_STATS_PAYLOAD_SIZE_M, *(u32 *)data);
-	pdev_id = FIELD_GET(HTT_T2H_PPDU_STATS_PDEV_ID_M, *(u32 *)data);
+	msg = (struct ath11k_htt_ppdu_stats_msg *)skb->data;
+	len = FIELD_GET(HTT_T2H_PPDU_STATS_INFO_PAYLOAD_SIZE, msg->info);
+	pdev_id = FIELD_GET(HTT_T2H_PPDU_STATS_INFO_PDEV_ID, msg->info);
 	pdev_id = DP_HW2SW_MACID(pdev_id);
-	ppdu_id = *((u32 *)data + 1);
+	ppdu_id = msg->ppdu_id;
 
 	rcu_read_lock();
 	ar = ath11k_get_ar_by_pdev_id(ab, pdev_id);
@@ -1058,9 +1059,6 @@ static int ath11k_htt_pull_ppdu_stats(struct ath11k_base *ab,
 		trace_ath11k_htt_ppdu_stats(ar, skb->data, len);
 	}
 
-	/* TLV info starts after 16bytes of header */
-	data = (u8 *)data + 16;
-
 	ppdu_info = ath11k_dp_htt_get_ppdu_desc(ar, ppdu_id);
 	if (!ppdu_info) {
 		ret = -EINVAL;
@@ -1068,7 +1066,7 @@ static int ath11k_htt_pull_ppdu_stats(struct ath11k_base *ab,
 	}
 
 	ppdu_info->ppdu_id = ppdu_id;
-	ret = ath11k_dp_htt_tlv_iter(ab, data, len,
+	ret = ath11k_dp_htt_tlv_iter(ab, msg->data, len,
 				     ath11k_htt_tlv_ppdu_stats_parse,
 				     (void *)ppdu_info);
 	if (ret) {
@@ -1090,7 +1088,7 @@ static void ath11k_htt_pktlog(struct ath11k_base *ab,
 	u32 len;
 	u8 pdev_id;
 
-	len = FIELD_GET(HTT_T2H_PPDU_STATS_PAYLOAD_SIZE_M, data->hdr);
+	len = FIELD_GET(HTT_T2H_PPDU_STATS_INFO_PAYLOAD_SIZE, data->hdr);
 
 	if (len > ATH11K_HTT_PKTLOG_MAX_SIZE)
 	{
@@ -1100,7 +1098,7 @@ static void ath11k_htt_pktlog(struct ath11k_base *ab,
 		return;
 	}
 
-	pdev_id = FIELD_GET(HTT_T2H_PPDU_STATS_PDEV_ID_M, data->hdr);
+	pdev_id = FIELD_GET(HTT_T2H_PPDU_STATS_INFO_PDEV_ID, data->hdr);
 	pdev_id = DP_HW2SW_MACID(pdev_id);
 	ar = ab->pdevs[pdev_id].ar;
 
-- 
2.7.4


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
