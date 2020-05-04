Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from gateway34.websitewelcome.com ([192.185.147.201])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jVhNf-00007g-F1
 for ath11k@lists.infradead.org; Mon, 04 May 2020 20:08:01 +0000
Received: from cm12.websitewelcome.com (cm12.websitewelcome.com [100.42.49.8])
 by gateway34.websitewelcome.com (Postfix) with ESMTP id 51DB011888A5
 for <ath11k@lists.infradead.org>;
 Mon,  4 May 2020 15:07:58 -0500 (CDT)
Date: Mon, 4 May 2020 15:12:24 -0500
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: [PATCH] ath11k: Replace zero-length array with flexible-array
Message-ID: <20200504201224.GA32282@embeddedor>
MIME-Version: 1.0
Content-Disposition: inline
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
To: Kalle Valo <kvalo@codeaurora.org>, "David S. Miller" <davem@davemloft.net>
Cc: netdev@vger.kernel.org, "Gustavo A. R. Silva" <gustavo@embeddedor.com>, linux-wireless@vger.kernel.org, ath11k@lists.infradead.org, linux-kernel@vger.kernel.org

The current codebase makes use of the zero-length array language
extension to the C90 standard, but the preferred mechanism to declare
variable-length types such as these ones is a flexible array member[1][2],
introduced in C99:

struct foo {
        int stuff;
        struct boo array[];
};

By making use of the mechanism above, we will get a compiler warning
in case the flexible array does not occur last in the structure, which
will help us prevent some kind of undefined behavior bugs from being
inadvertently introduced[3] to the codebase from now on.

Also, notice that, dynamic memory allocations won't be affected by
this change:

"Flexible array members have incomplete type, and so the sizeof operator
may not be applied. As a quirk of the original implementation of
zero-length arrays, sizeof evaluates to zero."[1]

sizeof(flexible-array-member) triggers a warning because flexible array
members have incomplete type[1]. There are some instances of code in
which the sizeof operator is being incorrectly/erroneously applied to
zero-length arrays and the result is zero. Such instances may be hiding
some bugs. So, this work (flexible-array member conversions) will also
help to get completely rid of those sorts of issues.

This issue was found with the help of Coccinelle.

[1] https://gcc.gnu.org/onlinedocs/gcc/Zero-Length.html
[2] https://github.com/KSPP/linux/issues/21
[3] commit 76497732932f ("cxgb3/l2t: Fix undefined behaviour")

Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
---
 drivers/net/wireless/ath/ath11k/debug.h           | 4 ++--
 drivers/net/wireless/ath/ath11k/debug_htt_stats.h | 8 ++++----
 drivers/net/wireless/ath/ath11k/hal_desc.h        | 4 ++--
 drivers/net/wireless/ath/ath11k/hal_rx.h          | 2 +-
 drivers/net/wireless/ath/ath11k/hw.h              | 2 +-
 drivers/net/wireless/ath/ath11k/wmi.h             | 2 +-
 6 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/debug.h b/drivers/net/wireless/ath/ath11k/debug.h
index 97e7306c506d..c7edf946ff5c 100644
--- a/drivers/net/wireless/ath/ath11k/debug.h
+++ b/drivers/net/wireless/ath/ath11k/debug.h
@@ -67,7 +67,7 @@ struct debug_htt_stats_req {
 	u8 peer_addr[ETH_ALEN];
 	struct completion cmpln;
 	u32 buf_len;
-	u8 buf[0];
+	u8 buf[];
 };
 
 struct ath_pktlog_hdr {
@@ -77,7 +77,7 @@ struct ath_pktlog_hdr {
 	u16 size;
 	u32 timestamp;
 	u32 type_specific_data;
-	u8 payload[0];
+	u8 payload[];
 };
 
 #define ATH11K_HTT_STATS_BUF_SIZE (1024 * 512)
diff --git a/drivers/net/wireless/ath/ath11k/debug_htt_stats.h b/drivers/net/wireless/ath/ath11k/debug_htt_stats.h
index 23a6baa9e95a..682a6ff222bd 100644
--- a/drivers/net/wireless/ath/ath11k/debug_htt_stats.h
+++ b/drivers/net/wireless/ath/ath11k/debug_htt_stats.h
@@ -239,7 +239,7 @@ struct htt_tx_pdev_stats_tx_ppdu_stats_tlv_v {
  */
 struct htt_tx_pdev_stats_tried_mpdu_cnt_hist_tlv_v {
 	u32 hist_bin_size;
-	u32 tried_mpdu_cnt_hist[0]; /* HTT_TX_PDEV_TRIED_MPDU_CNT_HIST */
+	u32 tried_mpdu_cnt_hist[]; /* HTT_TX_PDEV_TRIED_MPDU_CNT_HIST */
 };
 
 /* == SOC ERROR STATS == */
@@ -550,7 +550,7 @@ struct htt_tx_hwq_stats_cmn_tlv {
 struct htt_tx_hwq_difs_latency_stats_tlv_v {
 	u32 hist_intvl;
 	/* histogram of ppdu post to hwsch - > cmd status received */
-	u32 difs_latency_hist[0]; /* HTT_TX_HWQ_MAX_DIFS_LATENCY_BINS */
+	u32 difs_latency_hist[]; /* HTT_TX_HWQ_MAX_DIFS_LATENCY_BINS */
 };
 
 /* NOTE: Variable length TLV, use length spec to infer array size */
@@ -586,7 +586,7 @@ struct htt_tx_hwq_fes_result_stats_tlv_v {
 struct htt_tx_hwq_tried_mpdu_cnt_hist_tlv_v {
 	u32 hist_bin_size;
 	/* Histogram of number of mpdus on tried mpdu */
-	u32 tried_mpdu_cnt_hist[0]; /* HTT_TX_HWQ_TRIED_MPDU_CNT_HIST */
+	u32 tried_mpdu_cnt_hist[]; /* HTT_TX_HWQ_TRIED_MPDU_CNT_HIST */
 };
 
 /* NOTE: Variable length TLV, use length spec to infer array size
@@ -1584,7 +1584,7 @@ struct htt_pdev_stats_twt_session_tlv {
 struct htt_pdev_stats_twt_sessions_tlv {
 	u32 pdev_id;
 	u32 num_sessions;
-	struct htt_pdev_stats_twt_session_tlv twt_session[0];
+	struct htt_pdev_stats_twt_session_tlv twt_session[];
 };
 
 enum htt_rx_reo_resource_sample_id_enum {
diff --git a/drivers/net/wireless/ath/ath11k/hal_desc.h b/drivers/net/wireless/ath/ath11k/hal_desc.h
index 5e200380cca4..a1f747c1c44d 100644
--- a/drivers/net/wireless/ath/ath11k/hal_desc.h
+++ b/drivers/net/wireless/ath/ath11k/hal_desc.h
@@ -477,7 +477,7 @@ enum hal_tlv_tag {
 
 struct hal_tlv_hdr {
 	u32 tl;
-	u8 value[0];
+	u8 value[];
 } __packed;
 
 #define RX_MPDU_DESC_INFO0_MSDU_COUNT		GENMASK(7, 0)
@@ -1972,7 +1972,7 @@ struct hal_rx_reo_queue {
 	u32 processed_total_bytes;
 	u32 info5;
 	u32 rsvd[3];
-	struct hal_rx_reo_queue_ext ext_desc[0];
+	struct hal_rx_reo_queue_ext ext_desc[];
 } __packed;
 
 /* hal_rx_reo_queue
diff --git a/drivers/net/wireless/ath/ath11k/hal_rx.h b/drivers/net/wireless/ath/ath11k/hal_rx.h
index e863e4abfcc1..c436191ae1e8 100644
--- a/drivers/net/wireless/ath/ath11k/hal_rx.h
+++ b/drivers/net/wireless/ath/ath11k/hal_rx.h
@@ -23,7 +23,7 @@ struct hal_rx_wbm_rel_info {
 
 struct hal_rx_mon_status_tlv_hdr {
 	u32 hdr;
-	u8 value[0];
+	u8 value[];
 };
 
 enum hal_rx_su_mu_coding {
diff --git a/drivers/net/wireless/ath/ath11k/hw.h b/drivers/net/wireless/ath/ath11k/hw.h
index 9973477ae373..cdec95644758 100644
--- a/drivers/net/wireless/ath/ath11k/hw.h
+++ b/drivers/net/wireless/ath/ath11k/hw.h
@@ -111,7 +111,7 @@ struct ath11k_hw_params {
 struct ath11k_fw_ie {
 	__le32 id;
 	__le32 len;
-	u8 data[0];
+	u8 data[];
 };
 
 enum ath11k_bd_ie_board_type {
diff --git a/drivers/net/wireless/ath/ath11k/wmi.h b/drivers/net/wireless/ath/ath11k/wmi.h
index 510f9c6bc1d7..717e87db91cb 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.h
+++ b/drivers/net/wireless/ath/ath11k/wmi.h
@@ -39,7 +39,7 @@ struct wmi_cmd_hdr {
 
 struct wmi_tlv {
 	u32 header;
-	u8 value[0];
+	u8 value[];
 } __packed;
 
 #define WMI_TLV_LEN	GENMASK(15, 0)
-- 
2.26.2


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
