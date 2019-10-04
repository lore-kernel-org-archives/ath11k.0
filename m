Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from nbd.name ([2a01:4f8:221:3d45::2])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iGKPZ-0002Fj-Qj
 for ath11k@lists.infradead.org; Fri, 04 Oct 2019 10:02:12 +0000
From: John Crispin <john@phrozen.org>
Subject: [PATCH] ath11k: optimize RX path latency
Date: Fri,  4 Oct 2019 12:01:56 +0200
Message-Id: <20191004100156.24354-1-john@phrozen.org>
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

This patch drops ath11k_hal_rx_parse_dst_ring_desc(). This function was
creating a huge amount of load, which lead to a signifcant latency delay
when processing data in the RX path.

Pegging the processing on a specific core and running perf --top we get
the following output when running HE80 at a fixed bandwisth of 1gbit.

with patch
    19.19%  [ath11k]       [k] ath11k_dp_process_rx
     5.02%  [ath11k]       [k] ath11k_dp_rx_tid_del_func
     4.39%  [kernel]       [k] v7_dma_inv_range
     4.15%  [kernel]       [k] __slab_alloc.constprop.1
     4.03%  [kernel]       [k] dev_gro_receive
     3.86%  [kernel]       [k] tcp_gro_receive
     3.07%  [ip_tables]    [k] ipt_do_table
     2.96%  [kernel]       [k] dma_cache_maint_page

without patch
    21.64%  [ath11k]       [k] ath11k_hal_rx_parse_dst_ring_desc
    10.80%  [ath11k]       [k] ath11k_dp_process_rx
     3.77%  [kernel]       [k] v7_dma_inv_range
     3.48%  [kernel]       [k] dev_gro_receive
     3.32%  [ath11k]       [k] ath11k_dp_rx_tid_del_func
     3.17%  [mac80211]     [k] ieee80211_rx_napi
     2.70%  [kernel]       [k] dma_cache_maint_page
     2.65%  [mac80211]     [k] ieee80211_sta_ps_transition

When removing the the bandwidth limit and rerunning the test we see an
overall troughout improvement of 3-400mbit when running 4x4 HE80.

Signed-off-by: John Crispin <john@phrozen.org>
---
 drivers/net/wireless/ath/ath11k/dp_rx.c  | 47 +++++++++++++----------
 drivers/net/wireless/ath/ath11k/hal_rx.c | 49 ++----------------------
 drivers/net/wireless/ath/ath11k/hal_rx.h | 28 +-------------
 3 files changed, 31 insertions(+), 93 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index 06c493d6e075..6c750940b710 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -2124,7 +2124,6 @@ int ath11k_dp_process_rx(struct ath11k_base *ab, int mac_id,
 	struct ieee80211_rx_status *rx_status = &dp->rx_status;
 	struct dp_rxdma_ring *rx_ring = &dp->rx_refill_buf_ring;
 	struct hal_srng *srng;
-	struct hal_rx_meta_info meta_info;
 	struct sk_buff *msdu;
 	struct sk_buff_head msdu_list;
 	struct sk_buff_head amsdu_list;
@@ -2160,11 +2159,14 @@ int ath11k_dp_process_rx(struct ath11k_base *ab, int mac_id,
 
 try_again:
 	while ((rx_desc = ath11k_hal_srng_dst_get_next_entry(ab, srng))) {
-		memset(&meta_info, 0, sizeof(meta_info));
-		ath11k_hal_rx_parse_dst_ring_desc(ab, rx_desc, &meta_info);
+		struct hal_reo_dest_ring *desc = (struct hal_reo_dest_ring *)rx_desc;
+		enum hal_reo_dest_ring_push_reason push_reason;
+		u32 cookie;
 
+		cookie = FIELD_GET(BUFFER_ADDR_INFO1_SW_COOKIE,
+				   desc->buf_addr_info.info1);
 		buf_id = FIELD_GET(DP_RXDMA_BUF_COOKIE_BUF_ID,
-				   meta_info.msdu_meta.cookie);
+				   cookie);
 		spin_lock_bh(&rx_ring->idr_lock);
 		msdu = idr_find(&rx_ring->bufs_idr, buf_id);
 		if (!msdu) {
@@ -2184,7 +2186,9 @@ int ath11k_dp_process_rx(struct ath11k_base *ab, int mac_id,
 
 		num_buffs_reaped++;
 
-		if (meta_info.push_reason !=
+		push_reason = FIELD_GET(HAL_REO_DEST_RING_INFO0_PUSH_REASON,
+					desc->info0);
+		if (push_reason !=
 		    HAL_REO_DEST_RING_PUSH_REASON_ROUTING_INSTRUCTION) {
 			/* TODO: Check if the msdu can be sent up for processing */
 			dev_kfree_skb_any(msdu);
@@ -2192,9 +2196,12 @@ int ath11k_dp_process_rx(struct ath11k_base *ab, int mac_id,
 			continue;
 		}
 
-		rxcb->is_first_msdu = meta_info.msdu_meta.first;
-		rxcb->is_last_msdu = meta_info.msdu_meta.last;
-		rxcb->is_continuation = meta_info.msdu_meta.continuation;
+		rxcb->is_first_msdu =
+			!!(desc->rx_msdu_info.info0 & RX_MSDU_DESC_INFO0_FIRST_MSDU_IN_MPDU);
+		rxcb->is_last_msdu =
+			!!(desc->rx_msdu_info.info0 & RX_MSDU_DESC_INFO0_LAST_MSDU_IN_MPDU);
+		rxcb->is_continuation =
+			!!(desc->rx_msdu_info.info0 & RX_MSDU_DESC_INFO0_MSDU_CONTINUATION);
 		rxcb->mac_id = mac_id;
 		__skb_queue_tail(&msdu_list, msdu);
 
@@ -2770,12 +2777,11 @@ ath11k_dp_process_rx_err_buf(struct ath11k *ar, struct napi_struct *napi,
 int ath11k_dp_process_rx_err(struct ath11k_base *ab, struct napi_struct *napi,
 			     int budget)
 {
-	struct hal_rx_msdu_meta meta[HAL_NUM_RX_MSDUS_PER_LINK_DESC];
+	u32 msdu_cookies[HAL_NUM_RX_MSDUS_PER_LINK_DESC];
 	struct dp_link_desc_bank *link_desc_banks;
 	enum hal_rx_buf_return_buf_manager rbm;
 	int tot_n_bufs_reaped, quota, ret, i;
 	int n_bufs_reaped[MAX_RADIOS] = {0};
-	struct hal_rx_meta_info meta_info;
 	struct dp_rxdma_ring *rx_ring;
 	struct dp_srng *reo_except;
 	u32 desc_bank, num_msdus;
@@ -2803,6 +2809,8 @@ int ath11k_dp_process_rx_err(struct ath11k_base *ab, struct napi_struct *napi,
 
 	while (budget &&
 	       (desc = ath11k_hal_srng_dst_get_next_entry(ab, srng))) {
+		struct hal_reo_dest_ring *reo_desc = (struct hal_reo_dest_ring *)desc;
+
 		ab->soc_stats.err_ring_pkts++;
 		ret = ath11k_hal_desc_reo_parse_err(ab, desc, &paddr,
 						    &desc_bank);
@@ -2813,7 +2821,7 @@ int ath11k_dp_process_rx_err(struct ath11k_base *ab, struct napi_struct *napi,
 		}
 		link_desc_va = link_desc_banks[desc_bank].vaddr +
 			       (paddr - link_desc_banks[desc_bank].paddr);
-		ath11k_hal_rx_msdu_link_info_get(link_desc_va, &num_msdus, meta,
+		ath11k_hal_rx_msdu_link_info_get(link_desc_va, &num_msdus, msdu_cookies,
 						 &rbm);
 		if (rbm != HAL_RX_BUF_RBM_WBM_IDLE_DESC_LIST &&
 		    rbm != HAL_RX_BUF_RBM_SW3_BM) {
@@ -2824,10 +2832,7 @@ int ath11k_dp_process_rx_err(struct ath11k_base *ab, struct napi_struct *napi,
 			continue;
 		}
 
-		memset(&meta_info, 0, sizeof(meta_info));
-		ath11k_hal_rx_parse_dst_ring_desc(ab, desc, &meta_info);
-
-		is_frag = meta_info.mpdu_meta.frag;
+		is_frag = !!(reo_desc->rx_mpdu_info.info0 & RX_MPDU_DESC_INFO0_FRAG_FLAG);
 
 		/* Return the link desc back to wbm idle list */
 		ath11k_dp_rx_link_desc_return(ab, desc,
@@ -2835,10 +2840,10 @@ int ath11k_dp_process_rx_err(struct ath11k_base *ab, struct napi_struct *napi,
 
 		for (i = 0; i < num_msdus; i++) {
 			buf_id = FIELD_GET(DP_RXDMA_BUF_COOKIE_BUF_ID,
-					   meta[i].cookie);
+					   msdu_cookies[i]);
 
 			mac_id = FIELD_GET(DP_RXDMA_BUF_COOKIE_PDEV_ID,
-					   meta[i].cookie);
+					   msdu_cookies[i]);
 
 			ar = ab->pdevs[mac_id].ar;
 
@@ -3191,7 +3196,7 @@ int ath11k_dp_process_rxdma_err(struct ath11k_base *ab, int mac_id, int budget)
 	struct dp_rxdma_ring *rx_ring = &ar->dp.rx_refill_buf_ring;
 	struct dp_link_desc_bank *link_desc_banks = ab->dp.link_desc_banks;
 	struct hal_srng *srng;
-	struct hal_rx_msdu_meta meta[HAL_NUM_RX_MSDUS_PER_LINK_DESC];
+	u32 msdu_cookies[HAL_NUM_RX_MSDUS_PER_LINK_DESC];
 	enum hal_rx_buf_return_buf_manager rbm;
 	enum hal_reo_entr_rxdma_ecode rxdma_err_code;
 	struct ath11k_skb_rxcb *rxcb;
@@ -3225,12 +3230,12 @@ int ath11k_dp_process_rxdma_err(struct ath11k_base *ab, int mac_id, int budget)
 
 		link_desc_va = link_desc_banks[desc_bank].vaddr +
 			       (paddr - link_desc_banks[desc_bank].paddr);
-		ath11k_hal_rx_msdu_link_info_get(link_desc_va, &num_msdus, meta,
-						 &rbm);
+		ath11k_hal_rx_msdu_link_info_get(link_desc_va, &num_msdus,
+						 msdu_cookies, &rbm);
 
 		for (i = 0; i < num_msdus; i++) {
 			buf_id = FIELD_GET(DP_RXDMA_BUF_COOKIE_BUF_ID,
-					   meta[i].cookie);
+					   msdu_cookies[i]);
 
 			spin_lock_bh(&rx_ring->idr_lock);
 			skb = idr_find(&rx_ring->bufs_idr, buf_id);
diff --git a/drivers/net/wireless/ath/ath11k/hal_rx.c b/drivers/net/wireless/ath/ath11k/hal_rx.c
index 2de4b388db20..6168a4eb0c0b 100644
--- a/drivers/net/wireless/ath/ath11k/hal_rx.c
+++ b/drivers/net/wireless/ath/ath11k/hal_rx.c
@@ -290,7 +290,7 @@ void ath11k_hal_rx_buf_addr_info_get(void *desc, dma_addr_t *paddr,
 }
 
 void ath11k_hal_rx_msdu_link_info_get(void *link_desc, u32 *num_msdus,
-				      struct hal_rx_msdu_meta *meta,
+				      u32 *msdu_cookies,
 				      enum hal_rx_buf_return_buf_manager *rbm)
 {
 	struct hal_rx_msdu_link *link = (struct hal_rx_msdu_link *)link_desc;
@@ -311,17 +311,9 @@ void ath11k_hal_rx_msdu_link_info_get(void *link_desc, u32 *num_msdus,
 			*num_msdus = i;
 			break;
 		}
-		meta->msdu_len = FIELD_GET(RX_MSDU_DESC_INFO0_MSDU_LENGTH,
-					   msdu->rx_msdu_info.info0);
-		meta->first = !!(msdu->rx_msdu_info.info0 &
-				 RX_MSDU_DESC_INFO0_FIRST_MSDU_IN_MPDU);
-		meta->last = !!(msdu->rx_msdu_info.info0 &
-				RX_MSDU_DESC_INFO0_LAST_MSDU_IN_MPDU);
-		meta->continuation = !!(msdu->rx_msdu_info.info0 &
-					RX_MSDU_DESC_INFO0_MSDU_CONTINUATION);
-		meta->cookie = FIELD_GET(BUFFER_ADDR_INFO1_SW_COOKIE,
-					 msdu->buf_addr_info.info1);
-		meta++;
+		*msdu_cookies = FIELD_GET(BUFFER_ADDR_INFO1_SW_COOKIE,
+					  msdu->buf_addr_info.info1);
+		msdu_cookies++;
 	}
 }
 
@@ -356,39 +348,6 @@ int ath11k_hal_desc_reo_parse_err(struct ath11k_base *ab, u32 *rx_desc,
 	return 0;
 }
 
-void ath11k_hal_rx_parse_dst_ring_desc(struct ath11k_base *ab, u32 *rx_desc,
-				       struct hal_rx_meta_info *meta_info)
-{
-	struct hal_reo_dest_ring *desc = (struct hal_reo_dest_ring *)rx_desc;
-	struct rx_mpdu_desc *mpdu = &desc->rx_mpdu_info;
-	struct rx_msdu_desc *msdu = &desc->rx_msdu_info;
-	struct hal_rx_mpdu_meta *meta_mpdu = &meta_info->mpdu_meta;
-	struct hal_rx_msdu_meta *meta_msdu = &meta_info->msdu_meta;
-
-	meta_info->push_reason = FIELD_GET(HAL_REO_DEST_RING_INFO0_PUSH_REASON,
-					   desc->info0);
-
-	meta_mpdu->msdu_cnt = FIELD_GET(RX_MPDU_DESC_INFO0_MSDU_COUNT,
-					mpdu->info0);
-	meta_mpdu->seq_num = FIELD_GET(RX_MPDU_DESC_INFO0_SEQ_NUM, mpdu->info0);
-	meta_mpdu->frag = !!(mpdu->info0 & RX_MPDU_DESC_INFO0_FRAG_FLAG);
-	meta_mpdu->retry = !!(mpdu->info0 & RX_MPDU_DESC_INFO0_MPDU_RETRY);
-	meta_mpdu->ampdu = !!(mpdu->info0 & RX_MPDU_DESC_INFO0_AMPDU_FLAG);
-	meta_mpdu->raw = !!(mpdu->info0 & RX_MPDU_DESC_INFO0_RAW_MPDU);
-	meta_mpdu->peer_meta = mpdu->meta_data;
-
-	meta_msdu->cookie = FIELD_GET(BUFFER_ADDR_INFO1_SW_COOKIE,
-				      desc->buf_addr_info.info1);
-	meta_msdu->msdu_len = FIELD_GET(RX_MSDU_DESC_INFO0_MSDU_LENGTH,
-					msdu->info0);
-	meta_msdu->first =
-		!!(msdu->info0 & RX_MSDU_DESC_INFO0_FIRST_MSDU_IN_MPDU);
-	meta_msdu->last =
-		!!(msdu->info0 & RX_MSDU_DESC_INFO0_LAST_MSDU_IN_MPDU);
-	meta_msdu->continuation =
-		!!(msdu->info0 & RX_MSDU_DESC_INFO0_MSDU_CONTINUATION);
-}
-
 int ath11k_hal_wbm_desc_parse_err(struct ath11k_base *ab, void *desc,
 				  struct hal_rx_wbm_rel_info *rel_info)
 {
diff --git a/drivers/net/wireless/ath/ath11k/hal_rx.h b/drivers/net/wireless/ath/ath11k/hal_rx.h
index 96555e4f4ef3..2271bf56183b 100644
--- a/drivers/net/wireless/ath/ath11k/hal_rx.h
+++ b/drivers/net/wireless/ath/ath11k/hal_rx.h
@@ -6,30 +6,6 @@
 #ifndef ATH11K_HAL_RX_H
 #define ATH11K_HAL_RX_H
 
-struct hal_rx_mpdu_meta {
-	u32 peer_meta;
-	u16 msdu_cnt;
-	u16 seq_num;
-	bool frag;
-	bool retry;
-	bool ampdu;
-	bool raw;
-};
-
-struct hal_rx_msdu_meta {
-	u32 cookie;
-	u32 msdu_len;
-	bool first;
-	bool last;
-	bool continuation;
-};
-
-struct hal_rx_meta_info {
-	enum hal_reo_dest_ring_push_reason push_reason;
-	struct hal_rx_mpdu_meta mpdu_meta;
-	struct hal_rx_msdu_meta msdu_meta;
-};
-
 struct hal_rx_wbm_rel_info {
 	u32 cookie;
 	enum hal_wbm_rel_src_module err_rel_src;
@@ -320,7 +296,7 @@ void ath11k_hal_reo_update_rx_reo_queue_status(struct ath11k_base *ab,
 					       struct hal_reo_status *status);
 int ath11k_hal_reo_process_status(u8 *reo_desc, u8 *status);
 void ath11k_hal_rx_msdu_link_info_get(void *link_desc, u32 *num_msdus,
-				      struct hal_rx_msdu_meta *meta,
+				      u32 *msdu_cookies,
 				      enum hal_rx_buf_return_buf_manager *rbm);
 void ath11k_hal_rx_msdu_link_desc_set(struct ath11k_base *ab, void *desc,
 				      void *link_desc,
@@ -331,8 +307,6 @@ void ath11k_hal_rx_buf_addr_info_get(void *desc, dma_addr_t *paddr,
 				     u32 *cookie, u8 *rbm);
 int ath11k_hal_desc_reo_parse_err(struct ath11k_base *ab, u32 *rx_desc,
 				  dma_addr_t *paddr, u32 *desc_bank);
-void ath11k_hal_rx_parse_dst_ring_desc(struct ath11k_base *ab, u32 *rx_desc,
-				       struct hal_rx_meta_info *meta_info);
 int ath11k_hal_wbm_desc_parse_err(struct ath11k_base *ab, void *desc,
 				  struct hal_rx_wbm_rel_info *rel_info);
 void ath11k_hal_rx_reo_ent_paddr_get(struct ath11k_base *ab, void *desc,
-- 
2.20.1


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
