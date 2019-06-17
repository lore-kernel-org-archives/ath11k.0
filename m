Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hcuZA-0005pn-Av
 for ath11k@lists.infradead.org; Mon, 17 Jun 2019 16:33:09 +0000
Received: from potku.adurom.net (88-114-240-156.elisa-laajakaista.fi
 [88.114.240.156])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: kvalo@smtp.codeaurora.org)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id C15C960CF0
 for <ath11k@lists.infradead.org>; Mon, 17 Jun 2019 16:33:05 +0000 (UTC)
From: Kalle Valo <kvalo@codeaurora.org>
Subject: [PATCH 3/5] ath11k: variable set but not used
 [-Wunused-but-set-variable]
Date: Mon, 17 Jun 2019 19:32:57 +0300
Message-Id: <1560789179-3857-3-git-send-email-kvalo@codeaurora.org>
In-Reply-To: <1560789179-3857-1-git-send-email-kvalo@codeaurora.org>
References: <1560789179-3857-1-git-send-email-kvalo@codeaurora.org>
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

Fix GCC W=1 warnings:

drivers/net/wireless/ath/ath11k/htc.c:204:6: warning: variable 'orig_length' set but not used [-Wunused-but-set-variable]
drivers/net/wireless/ath/ath11k/htc.c:203:6: warning: variable 'orig_buffer' set but not used [-Wunused-but-set-variable]
drivers/net/wireless/ath/ath11k/htc.c:745:24: warning: variable 'ep' set but not used [-Wunused-but-set-variable]
drivers/net/wireless/ath/ath11k/wmi.c:4422:9: warning: variable 'num_vdevs' set but not used [-Wunused-but-set-variable]
drivers/net/wireless/ath/ath11k/dp_tx.c:448:5: warning: variable 'tcl_id' set but not used [-Wunused-but-set-variable]
drivers/net/wireless/ath/ath11k/dp_rx.c:3675:6: warning: variable 'data' set but not used [-Wunused-but-set-variable]
drivers/net/wireless/ath/ath11k/dp_rx.c:4070:6: warning: variable 'rx_tlv_start' set but not used [-Wunused-but-set-variable]

Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/dp_rx.c | 5 +----
 drivers/net/wireless/ath/ath11k/dp_tx.c | 4 ----
 drivers/net/wireless/ath/ath11k/htc.c   | 8 --------
 drivers/net/wireless/ath/ath11k/wmi.c   | 3 ---
 4 files changed, 1 insertion(+), 19 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index 748059542459..0823f6761426 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -3672,7 +3672,6 @@ ath11k_dp_rx_mon_mpdu_pop(struct ath11k *ar,
 	u32 rx_bufs_used = 0, i = 0;
 	u32 msdu_ppdu_id = 0, msdu_cnt = 0;
 	u32 total_len = 0, frag_len = 0;
-	u8 *data = NULL;
 	bool is_frag, is_first_msdu;
 	bool drop_mpdu = false;
 	struct ath11k_skb_rxcb *rxcb;
@@ -3752,7 +3751,7 @@ ath11k_dp_rx_mon_mpdu_pop(struct ath11k *ar,
 				msdu = NULL;
 				goto next_msdu;
 			}
-			data = msdu->data;
+
 			rx_desc = msdu->data;
 
 			rx_pkt_offset = sizeof(struct hal_rx_desc);
@@ -4067,7 +4066,6 @@ static void ath11k_dp_rx_mon_status_process_tlv(struct ath11k *ar,
 	struct hal_rx_mon_ppdu_info *ppdu_info;
 	struct sk_buff *status_skb;
 	u8 *rx_tlv;
-	u8 *rx_tlv_start;
 	u32 tlv_status = HAL_TLV_STATUS_BUF_DONE;
 	struct ath11k_pdev_mon_stats *rx_mon_stats;
 
@@ -4081,7 +4079,6 @@ static void ath11k_dp_rx_mon_status_process_tlv(struct ath11k *ar,
 		status_skb = skb_dequeue(&pmon->rx_status_q);
 
 		rx_tlv = status_skb->data;
-		rx_tlv_start = rx_tlv;
 
 		tlv_status = ath11k_hal_rx_parse_mon_status(ar->ab, ppdu_info,
 							    rx_tlv);
diff --git a/drivers/net/wireless/ath/ath11k/dp_tx.c b/drivers/net/wireless/ath/ath11k/dp_tx.c
index d9f1a953daec..75d5629c3979 100644
--- a/drivers/net/wireless/ath/ath11k/dp_tx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_tx.c
@@ -444,8 +444,6 @@ void ath11k_dp_tx_completion_handler(struct ath11k_base *ab, int ring_id)
 	struct dp_tx_ring *tx_ring = &dp->tx_ring[ring_id];
 	u32 *desc;
 	u32 msdu_id;
-	u8 pool_id;
-	u8 tcl_id;
 	u8 mac_id;
 
 	spin_lock_bh(&status_ring->lock);
@@ -477,9 +475,7 @@ void ath11k_dp_tx_completion_handler(struct ath11k_base *ab, int ring_id)
 		ath11k_hal_tx_status_parse(ab, &tx_status, &ts);
 
 		mac_id = FIELD_GET(DP_TX_DESC_ID_MAC_ID, ts.desc_id);
-		pool_id = FIELD_GET(DP_TX_DESC_ID_POOL_ID, ts.desc_id);
 		msdu_id = FIELD_GET(DP_TX_DESC_ID_MSDU_ID, ts.desc_id);
-		tcl_id = ath11k_txq_tcl_ring_map[pool_id];
 
 		if (ts.buf_rel_source == HAL_WBM_REL_SRC_MODULE_FW) {
 			ath11k_dp_tx_process_htt_tx_complete(ab,
diff --git a/drivers/net/wireless/ath/ath11k/htc.c b/drivers/net/wireless/ath/ath11k/htc.c
index b42d950b78e3..7b58276bac1e 100644
--- a/drivers/net/wireless/ath/ath11k/htc.c
+++ b/drivers/net/wireless/ath/ath11k/htc.c
@@ -200,13 +200,8 @@ static int ath11k_htc_process_trailer(struct ath11k_htc *htc,
 	struct ath11k_base *ab = htc->ab;
 	int status = 0;
 	struct ath11k_htc_record *record;
-	u8 *orig_buffer;
-	int orig_length;
 	size_t len;
 
-	orig_buffer = buffer;
-	orig_length = length;
-
 	while (length > 0) {
 		record = (struct ath11k_htc_record *)buffer;
 
@@ -742,7 +737,6 @@ int ath11k_htc_start(struct ath11k_htc *htc)
 
 int ath11k_htc_init(struct ath11k_base *ab)
 {
-	struct ath11k_htc_ep *ep = NULL;
 	struct ath11k_htc *htc = &ab->htc;
 	struct ath11k_htc_svc_conn_req conn_req;
 	struct ath11k_htc_svc_conn_resp conn_resp;
@@ -754,8 +748,6 @@ int ath11k_htc_init(struct ath11k_base *ab)
 
 	htc->ab = ab;
 
-	ep = &htc->endpoint[ATH11K_HTC_EP_0];
-
 	switch (ab->wmi_sc.preferred_hw_mode) {
 	case WMI_HOST_HW_MODE_SINGLE:
 		htc->wmi_ep_count = 1;
diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index 3473c69b7bea..1477247fd573 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -4419,7 +4419,6 @@ void ath11k_wmi_fw_stats_fill(struct ath11k *ar,
 	const struct ath11k_fw_stats_bcn *bcn;
 	size_t num_peers;
 	size_t num_peers_extd;
-	size_t num_vdevs;
 	size_t num_bcn;
 
 	spin_lock_bh(&ar->data_lock);
@@ -4438,8 +4437,6 @@ void ath11k_wmi_fw_stats_fill(struct ath11k *ar,
 	}
 
 	if (stats_id == WMI_REQUEST_VDEV_STAT) {
-		num_vdevs = ath11k_wmi_fw_stats_num_vdevs(&fw_stats->vdevs);
-
 		len += scnprintf(buf + len, buf_len - len, "\n");
 		len += scnprintf(buf + len, buf_len - len, "%30s\n",
 				 "ath11k VDEV stats");
-- 
2.7.4


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
