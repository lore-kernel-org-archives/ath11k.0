Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from alexa-out-blr-02.qualcomm.com ([103.229.18.198]
 helo=alexa-out-blr.qualcomm.com)
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hdBZu-0006gq-Sg
 for ath11k@lists.infradead.org; Tue, 18 Jun 2019 10:43:04 +0000
From: Venkateswara Naralasetty <vnaralas@codeaurora.org>
Subject: [PATCH 1/2] ath11k: clean up in htt extd stats
Date: Tue, 18 Jun 2019 16:12:13 +0530
Message-Id: <1560854534-29013-1-git-send-email-vnaralas@codeaurora.org>
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
 drivers/net/wireless/ath/ath11k/debug_htt_stats.c | 29 +++++++++++++----------
 drivers/net/wireless/ath/ath11k/dp.h              | 19 ++++++---------
 2 files changed, 24 insertions(+), 24 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/debug_htt_stats.c b/drivers/net/wireless/ath/ath11k/debug_htt_stats.c
index e5147ae..57fdb8c 100644
--- a/drivers/net/wireless/ath/ath11k/debug_htt_stats.c
+++ b/drivers/net/wireless/ath/ath11k/debug_htt_stats.c
@@ -16,7 +16,7 @@
 #define HTT_MAX_STRING_LEN 256
 #define HTT_MAX_PRINT_CHAR_PER_ELEM 15
 
-#define HTT_TLV_HDR_LEN HTT_T2H_EXT_STATS_CONF_TLV_HDR_SIZE
+#define HTT_TLV_HDR_LEN 4
 
 #define ARRAY_TO_STRING(out, arr, len)							\
 	do {										\
@@ -4192,22 +4192,29 @@ static int ath11k_dbg_htt_ext_stats_parse(struct ath11k_base *ab,
 void ath11k_dbg_htt_ext_stats_handler(struct ath11k_base *ab,
 				      struct sk_buff *skb)
 {
-	u8 *data = (u8 *)skb->data;
-	u32 len;
-	u64 cookie;
+	struct ath11k_htt_extd_stats_msg *msg;
 	struct debug_htt_stats_req *stats_req;
 	struct ath11k *ar;
+	u32 len;
+	u64 cookie;
 	int ret;
 	u8 pdev_id;
 
-	data = data + 4;
-	cookie = *(u64 *)data;
+	msg = (struct ath11k_htt_extd_stats_msg *)skb->data;
+	cookie = msg->cookie;
 	stats_req = (struct debug_htt_stats_req *)(uintptr_t)cookie;
 	if (!stats_req)
 		return;
 
-	pdev_id = DP_HW2SW_MACID(stats_req->pdev_id);
-	ar = ab->pdevs[pdev_id].ar;
+	pdev_id = stats_req->pdev_id;
+	rcu_read_lock();
+	ar = ath11k_get_ar_by_pdev_id(ab, pdev_id);
+	rcu_read_unlock();
+	if (!ar) {
+		ath11k_warn(ab, "failed to get ar for pdev_id %d\n", pdev_id);
+		return;
+	}
+
 	spin_lock_bh(&ar->debug.htt_stats.lock);
 	if (stats_req->done) {
 		spin_unlock_bh(&ar->debug.htt_stats.lock);
@@ -4216,10 +4223,8 @@ void ath11k_dbg_htt_ext_stats_handler(struct ath11k_base *ab,
 	stats_req->done = true;
 	spin_unlock_bh(&ar->debug.htt_stats.lock);
 
-	data = data + 8;
-	len = FIELD_GET(HTT_T2H_EXT_STATS_CONF_TLV_LENGTH_M, *(u32 *)data);
-	data = data + 4;
-	ret = ath11k_dp_htt_tlv_iter(ab, data, len,
+	len = FIELD_GET(HTT_T2H_EXT_STATS_INFO1_LENGTH, msg->info1);
+	ret = ath11k_dp_htt_tlv_iter(ab, msg->data, len,
 				     ath11k_dbg_htt_ext_stats_parse,
 				     (void *)stats_req);
 	if (ret)
diff --git a/drivers/net/wireless/ath/ath11k/dp.h b/drivers/net/wireless/ath/ath11k/dp.h
index 037fcbd..d41886a 100644
--- a/drivers/net/wireless/ath/ath11k/dp.h
+++ b/drivers/net/wireless/ath/ath11k/dp.h
@@ -1463,20 +1463,15 @@ struct htt_ext_stats_cfg_params {
  *       4 bytes.
  */
 
-#define HTT_T2H_EXT_STATS_COOKIE_SIZE         8
+#define HTT_T2H_EXT_STATS_INFO1_LENGTH   GENMASK(31, 16)
 
-#define HTT_T2H_EXT_STATS_CONF_HDR_SIZE       4
-
-#define HTT_T2H_EXT_STATS_CONF_TLV_HDR_SIZE   4
+struct ath11k_htt_extd_stats_msg {
+	u32 info0;
+	u64 cookie;
+	u32 info1;
+	u8 data[0];
+} __packed;
 
-#define HTT_T2H_EXT_STATS_CONF_TLV_TYPE_M     0x000000ff
-#define HTT_T2H_EXT_STATS_CONF_TLV_TYPE_S     0
-#define HTT_T2H_EXT_STATS_CONF_TLV_STATUS_M   0x00000700
-#define HTT_T2H_EXT_STATS_CONF_TLV_STATUS_S   8
-#define HTT_T2H_EXT_STATS_CONF_TLV_DONE_M     0x00000800
-#define HTT_T2H_EXT_STATS_CONF_TLV_DONE_S     11
-#define HTT_T2H_EXT_STATS_CONF_TLV_LENGTH_M   GENMASK(31, 16)
-#define HTT_T2H_EXT_STATS_CONF_TLV_LENGTH_S   16
 
 struct htt_mac_addr {
 	u32 mac_addr_l32;
-- 
2.7.4


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
