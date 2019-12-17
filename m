Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from nbd.name ([2a01:4f8:221:3d45::2])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ihFbW-0002Fj-0x
 for ath11k@lists.infradead.org; Tue, 17 Dec 2019 16:21:47 +0000
From: John Crispin <john@phrozen.org>
Subject: [PATCH] ath11k: enable HE tlvs in ppdu stats for pktlog lite
Date: Tue, 17 Dec 2019 17:21:40 +0100
Message-Id: <20191217162140.2102-1-john@phrozen.org>
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
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org, John Crispin <john@phrozen.org>

From: Anilkumar Kolli <akolli@codeaurora.org>

This patch enables HE tlvs in ppdu stats for pktlog lite mode.

Signed-off-by: John Crispin <john@phrozen.org>
Signed-off-by: Anilkumar Kolli <akolli@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/debug.c | 15 +++++++++++++++
 drivers/net/wireless/ath/ath11k/dp.h    |  8 ++++++++
 2 files changed, 23 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/debug.c b/drivers/net/wireless/ath/ath11k/debug.c
index 2311e08d0889..078486c32dca 100644
--- a/drivers/net/wireless/ath/ath11k/debug.c
+++ b/drivers/net/wireless/ath/ath11k/debug.c
@@ -1129,7 +1129,22 @@ static ssize_t ath11k_write_pktlog_filter(struct file *file,
 			    HTT_RX_FILTER_TLV_FLAGS_PACKET_HEADER |
 			    HTT_RX_FILTER_TLV_FLAGS_ATTENTION;
 	} else if (mode == ATH11K_PKTLOG_MODE_LITE) {
+		ret = ath11k_dp_tx_htt_h2t_ppdu_stats_req(ar,
+							  HTT_PPDU_STATS_TAG_PKTLOG);
+		if (ret) {
+			ath11k_err(ar->ab, "failed to enable pktlog lite: %d\n", ret);
+			goto out;
+		}
+
 		rx_filter = HTT_RX_FILTER_TLV_LITE_MODE;
+	} else {
+		ret = ath11k_dp_tx_htt_h2t_ppdu_stats_req(ar,
+							  HTT_PPDU_STATS_TAG_DEFAULT);
+		if (ret) {
+			ath11k_err(ar->ab, "failed to send htt ppdu stats req: %d\n",
+				   ret);
+			goto out;
+		}
 	}
 
 	tlv_filter.rx_filter = rx_filter;
diff --git a/drivers/net/wireless/ath/ath11k/dp.h b/drivers/net/wireless/ath/ath11k/dp.h
index 00ce7747d595..87114082b9b6 100644
--- a/drivers/net/wireless/ath/ath11k/dp.h
+++ b/drivers/net/wireless/ath/ath11k/dp.h
@@ -519,6 +519,14 @@ enum htt_ppdu_stats_tag_type {
 				   | BIT(HTT_PPDU_STATS_TAG_USR_COMPLTN_FLUSH) \
 				   | BIT(HTT_PPDU_STATS_TAG_USR_COMMON_ARRAY))
 
+#define HTT_PPDU_STATS_TAG_PKTLOG  (BIT(HTT_PPDU_STATS_TAG_USR_MPDU_ENQ_BITMAP_64) | \
+				    BIT(HTT_PPDU_STATS_TAG_USR_MPDU_ENQ_BITMAP_256) | \
+				    BIT(HTT_PPDU_STATS_TAG_USR_COMPLTN_BA_BITMAP_64) | \
+				    BIT(HTT_PPDU_STATS_TAG_USR_COMPLTN_BA_BITMAP_256) | \
+				    BIT(HTT_PPDU_STATS_TAG_INFO) | \
+				    BIT(HTT_PPDU_STATS_TAG_TX_MGMTCTRL_PAYLOAD) | \
+				    HTT_PPDU_STATS_TAG_DEFAULT)
+
 /* HTT_H2T_MSG_TYPE_RX_RING_SELECTION_CFG Message
  *
  * details:
-- 
2.20.1


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
