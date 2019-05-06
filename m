Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hNf1H-0002La-Qt
 for ath11k@lists.infradead.org; Mon, 06 May 2019 14:55:10 +0000
From: Miles Hu <milehu@codeaurora.org>
Subject: [PATCH v3 3/6] ath11k: htt setup monitor rings
Date: Mon,  6 May 2019 07:54:53 -0700
Message-Id: <1557154496-12059-4-git-send-email-milehu@codeaurora.org>
In-Reply-To: <1557154496-12059-1-git-send-email-milehu@codeaurora.org>
References: <1557154496-12059-1-git-send-email-milehu@codeaurora.org>
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
Cc: Miles Hu <milehu@codeaurora.org>

add setup functions for monitor rings.
some inline rxdesc decode and packet length functions.

Signed-off-by: Miles Hu <milehu@codeaurora.org>
---
V2:
 - Move to ath11k-bringup branch

 drivers/net/wireless/ath/ath11k/dp_rx.c | 236 ++++++++++++++++++++++++++++----
 drivers/net/wireless/ath/ath11k/dp_rx.h |  61 ++++++++-
 2 files changed, 265 insertions(+), 32 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index 257dd97..c9cb35a 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -3,6 +3,7 @@
  * Copyright (c) 2018-2019 The Linux Foundation. All rights reserved.
  */
 
+#include <linux/ieee80211.h>
 #include "core.h"
 #include "debug.h"
 #include "hal_desc.h"
@@ -105,15 +106,13 @@ int ath11k_dp_rxbufs_replenish(struct ath11k_base *ab, int mac_id,
 	return req_entries - num_remain;
 }
 
-static int ath11k_dp_rxdma_pdev_buf_free(struct ath11k *ar)
+static int ath11k_dp_rxdma_buf_ring_free(struct ath11k *ar,
+					 struct dp_rxdma_ring *rx_ring)
 {
 	struct ath11k_pdev_dp *dp = &ar->dp;
-	struct dp_rxdma_ring *rx_ring;
 	struct sk_buff *skb;
 	int buf_id;
 
-	rx_ring = &dp->rx_refill_buf_ring;
-
 	spin_lock_bh(&rx_ring->idr_lock);
 	idr_for_each_entry(&rx_ring->bufs_idr, skb, buf_id) {
 		idr_remove(&rx_ring->bufs_idr, buf_id);
@@ -146,29 +145,50 @@ static int ath11k_dp_rxdma_pdev_buf_free(struct ath11k *ar)
 	return 0;
 }
 
-static int ath11k_dp_rxdma_pdev_buf_setup(struct ath11k *ar)
+static int ath11k_dp_rxdma_pdev_buf_free(struct ath11k *ar)
+{
+	struct ath11k_pdev_dp *dp = &ar->dp;
+	struct dp_rxdma_ring *rx_ring = &dp->rx_refill_buf_ring;
+
+	ath11k_dp_rxdma_buf_ring_free(ar, rx_ring);
+
+	rx_ring = &dp->rxdma_mon_buf_ring;
+	ath11k_dp_rxdma_buf_ring_free(ar, rx_ring);
+
+	rx_ring = &dp->rx_mon_status_refill_ring;
+	ath11k_dp_rxdma_buf_ring_free(ar, rx_ring);
+	return 0;
+}
+
+static int ath11k_dp_rxdma_ring_buf_setup(struct ath11k *ar,
+					  struct dp_rxdma_ring *rx_ring,
+					  u32 ringtype)
 {
 	struct ath11k_pdev_dp *dp = &ar->dp;
-	struct dp_rxdma_ring *rx_ring;
 	int num_entries;
 
-	rx_ring = &dp->rx_refill_buf_ring;
 	num_entries = rx_ring->refill_buf_ring.size /
-		      ath11k_hal_srng_get_entrysize(HAL_RXDMA_BUF);
+		      ath11k_hal_srng_get_entrysize(ringtype);
 
 	rx_ring->bufs_max = num_entries;
 	ath11k_dp_rxbufs_replenish(ar->ab, dp->mac_id, rx_ring, num_entries,
 				   HAL_RX_BUF_RBM_SW3_BM, GFP_KERNEL);
+	return 0;
+}
+
+static int ath11k_dp_rxdma_pdev_buf_setup(struct ath11k *ar)
+{
+	struct ath11k_pdev_dp *dp = &ar->dp;
+	struct dp_rxdma_ring *rx_ring = &dp->rx_refill_buf_ring;
+
+	ath11k_dp_rxdma_ring_buf_setup(ar, rx_ring, HAL_RXDMA_BUF);
+
+	rx_ring = &dp->rxdma_mon_buf_ring;
+	ath11k_dp_rxdma_ring_buf_setup(ar, rx_ring, HAL_RXDMA_MONITOR_BUF);
 
 	rx_ring = &dp->rx_mon_status_refill_ring;
-	num_entries = rx_ring->refill_buf_ring.size /
-		      ath11k_hal_srng_get_entrysize(HAL_RXDMA_MONITOR_STATUS);
+	ath11k_dp_rxdma_ring_buf_setup(ar, rx_ring, HAL_RXDMA_MONITOR_STATUS);
 
-	rx_ring->bufs_max = num_entries;
-	ath11k_dp_rx_mon_status_bufs_replenish(ar->ab, dp->mac_id, rx_ring,
-					       num_entries,
-					       HAL_RX_BUF_RBM_SW3_BM,
-					       GFP_KERNEL);
 	return 0;
 }
 
@@ -180,11 +200,13 @@ static void ath11k_dp_rx_pdev_srng_free(struct ath11k *ar)
 	ath11k_dp_srng_cleanup(ar->ab, &dp->reo_dst_ring);
 	ath11k_dp_srng_cleanup(ar->ab, &dp->rxdma_err_dst_ring);
 	ath11k_dp_srng_cleanup(ar->ab, &dp->rx_mon_status_refill_ring.refill_buf_ring);
+	ath11k_dp_srng_cleanup(ar->ab, &dp->rxdma_mon_buf_ring.refill_buf_ring);
 }
 
 static int ath11k_dp_rx_pdev_srng_alloc(struct ath11k *ar)
 {
 	struct ath11k_pdev_dp *dp = &ar->dp;
+	struct dp_srng *srng = NULL;
 	int ret;
 
 	ret = ath11k_dp_srng_setup(ar->ab,
@@ -212,13 +234,44 @@ static int ath11k_dp_rx_pdev_srng_alloc(struct ath11k *ar)
 		return ret;
 	}
 
-	ret = ath11k_dp_srng_setup(ar->ab, &dp->rx_mon_status_refill_ring.refill_buf_ring,
+	srng = &dp->rx_mon_status_refill_ring.refill_buf_ring;
+	ret = ath11k_dp_srng_setup(ar->ab,
+				   srng,
 				   HAL_RXDMA_MONITOR_STATUS, 0, dp->mac_id,
 				   DP_RXDMA_MON_STATUS_RING_SIZE);
 	if (ret) {
-		ath11k_warn(ar->ab, "failed to setup rx_mon_status_refill_ring\n");
+		ath11k_warn(ar->ab,
+			    "failed to setup rx_mon_status_refill_ring\n");
+		return ret;
+	}
+	ret = ath11k_dp_srng_setup(ar->ab,
+				   &dp->rxdma_mon_buf_ring.refill_buf_ring,
+				   HAL_RXDMA_MONITOR_BUF, 0, dp->mac_id,
+				   DP_RXDMA_MONITOR_BUF_RING_SIZE);
+	if (ret) {
+		ath11k_warn(ar->ab,
+			    "failed to setup HAL_RXDMA_MONITOR_BUF\n");
 		return ret;
 	}
+
+	ret = ath11k_dp_srng_setup(ar->ab, &dp->rxdma_mon_dst_ring,
+				   HAL_RXDMA_MONITOR_DST, 0, dp->mac_id,
+				   DP_RXDMA_MONITOR_DST_RING_SIZE);
+	if (ret) {
+		ath11k_warn(ar->ab,
+			    "failed to setup HAL_RXDMA_MONITOR_DST\n");
+		return ret;
+	}
+
+	ret = ath11k_dp_srng_setup(ar->ab, &dp->rxdma_mon_desc_ring,
+				   HAL_RXDMA_MONITOR_DESC, 0, dp->mac_id,
+				   DP_RXDMA_MONITOR_DESC_RING_SIZE);
+	if (ret) {
+		ath11k_warn(ar->ab,
+			    "failed to setup HAL_RXDMA_MONITOR_DESC\n");
+		return ret;
+	}
+
 	return 0;
 }
 
@@ -2200,21 +2253,16 @@ int ath11k_dp_rx_mon_status_bufs_replenish(struct ath11k_base *ab, int mac_id,
 	return req_entries - num_remain;
 }
 
-int ath11k_dp_rx_process_mon_status(struct ath11k_base *ab, int mac_id,
-				    struct napi_struct *napi, int budget)
+int ath11k_dp_rx_reap_mon_status_ring(struct ath11k_base *ab, int mac_id,
+				      int *budget, struct sk_buff_head *skb_list)
 {
 	struct ath11k *ar = ab->pdevs[mac_id].ar;
 	struct ath11k_pdev_dp *dp = &ar->dp;
 	struct dp_rxdma_ring *rx_ring = &dp->rx_mon_status_refill_ring;
-	enum hal_rx_mon_status hal_status;
 	struct hal_srng *srng;
 	void *rx_mon_status_desc;
 	struct sk_buff *skb;
-	struct sk_buff_head skb_list;
 	struct ath11k_skb_rxcb *rxcb;
-	struct hal_rx_mon_ppdu_info ppdu_info;
-	struct ath11k_peer *peer;
-	struct ath11k_sta *arsta;
 	struct hal_tlv_hdr *tlv;
 	u32 cookie;
 	int buf_id;
@@ -2222,13 +2270,13 @@ int ath11k_dp_rx_process_mon_status(struct ath11k_base *ab, int mac_id,
 	u8 rbm;
 	int num_buffs_reaped = 0;
 
-	__skb_queue_head_init(&skb_list);
 	srng = &ab->hal.srng_list[rx_ring->refill_buf_ring.ring_id];
 
 	spin_lock_bh(&srng->lock);
 
 	ath11k_hal_srng_access_begin(ab, srng);
-	while (budget--) {
+	while (*budget) {
+		*budget -= 1;
 		rx_mon_status_desc =
 			ath11k_hal_srng_src_peek(ab, srng);
 		if (!rx_mon_status_desc)
@@ -2268,7 +2316,7 @@ int ath11k_dp_rx_process_mon_status(struct ath11k_base *ab, int mac_id,
 				continue;
 			}
 
-			__skb_queue_tail(&skb_list, skb);
+			__skb_queue_tail(skb_list, skb);
 		}
 
 		skb = ath11k_dp_rx_alloc_mon_status_buf(ab, rx_ring,
@@ -2293,6 +2341,25 @@ int ath11k_dp_rx_process_mon_status(struct ath11k_base *ab, int mac_id,
 	ath11k_hal_srng_access_end(ab, srng);
 	spin_unlock_bh(&srng->lock);
 
+	return num_buffs_reaped;
+}
+
+int ath11k_dp_rx_process_mon_status(struct ath11k_base *ab, int mac_id,
+				    struct napi_struct *napi, int budget)
+{
+	struct ath11k *ar = ab->pdevs[mac_id].ar;
+	enum hal_rx_mon_status hal_status;
+	struct sk_buff *skb;
+	struct sk_buff_head skb_list;
+	struct hal_rx_mon_ppdu_info ppdu_info;
+	struct ath11k_peer *peer;
+	struct ath11k_sta *arsta;
+	int num_buffs_reaped = 0;
+
+	__skb_queue_head_init(&skb_list);
+
+	num_buffs_reaped = ath11k_dp_rx_reap_mon_status_ring(ab, mac_id, &budget,
+							     &skb_list);
 	if (!num_buffs_reaped)
 		goto exit;
 
@@ -3103,14 +3170,127 @@ int ath11k_dp_rx_pdev_alloc(struct ath11k_base *ab, int mac_id)
 		return ret;
 	}
 
+	ring_id = dp->rxdma_mon_buf_ring.refill_buf_ring.ring_id;
+	ret = ath11k_dp_htt_srng_setup(ab, ring_id,
+				       mac_id, HAL_RXDMA_MONITOR_BUF);
+	if (ret) {
+		ath11k_warn(ab, "failed to configure rxdma_mon_buf_ring %d\n",
+			    ret);
+		return ret;
+	}
+	ret = ath11k_dp_htt_srng_setup(ab,
+				       dp->rxdma_mon_dst_ring.ring_id,
+				       mac_id, HAL_RXDMA_MONITOR_DST);
+	if (ret) {
+		ath11k_warn(ab, "failed to configure rxdma_mon_dst_ring %d\n",
+			    ret);
+		return ret;
+	}
+	ret = ath11k_dp_htt_srng_setup(ab,
+				       dp->rxdma_mon_desc_ring.ring_id,
+				       mac_id, HAL_RXDMA_MONITOR_DESC);
+	if (ret) {
+		ath11k_warn(ab, "failed to configure rxdma_mon_dst_ring %d\n",
+			    ret);
+		return ret;
+	}
 	ring_id = dp->rx_mon_status_refill_ring.refill_buf_ring.ring_id;
 	ret = ath11k_dp_htt_srng_setup(ab, ring_id, mac_id,
 				       HAL_RXDMA_MONITOR_STATUS);
 	if (ret) {
-		ath11k_warn(ab, "failed to configure rx_mon_status_refill_ring %d\n",
+		ath11k_warn(ab,
+			    "failed to configure mon_status_refill_ring %d\n",
 			    ret);
 		return ret;
 	}
+	return 0;
+}
+
+static inline bool ath11k_get_rx_status_done(u8 *rx_tlv)
+{
+	struct hal_tlv_hdr *thdr = (struct hal_tlv_hdr *)rx_tlv;
+	u32 tlv_tag;
+
+	tlv_tag = FIELD_GET(HAL_TLV_HDR_TAG, thdr->tl);
+
+	return (tlv_tag == HAL_RX_STATUS_BUFFER_DONE);
+}
+
+static inline void ath11k_dp_mon_set_frag_len(u32 *total_len, u32 *frag_len)
+{
+	if (*total_len >= (DP_RX_BUFFER_SIZE - sizeof(struct hal_rx_desc))) {
+		*frag_len = DP_RX_BUFFER_SIZE - sizeof(struct hal_rx_desc);
+		*total_len -= *frag_len;
+	} else {
+		*frag_len = *total_len;
+		*total_len = 0;
+	}
+}
+
+static inline
+int ath11k_dp_rx_monitor_link_desc_return(struct ath11k *ar,
+					  void *p_last_buf_addr_info,
+					  u8 mac_id)
+{
+	struct ath11k_pdev_dp *dp = &ar->dp;
+	struct dp_srng *dp_srng;
+	void *hal_srng;
+	void *src_srng_desc;
+	int ret = 0;
+
+	dp_srng = &dp->rxdma_mon_desc_ring;
+	hal_srng = &ar->ab->hal.srng_list[dp_srng->ring_id];
+
+	ath11k_hal_srng_access_begin(ar->ab, hal_srng);
+
+	src_srng_desc = ath11k_hal_srng_src_get_next_entry(ar->ab, hal_srng);
+
+	if (src_srng_desc) {
+		struct buffer_addr *src_desc =
+				(struct buffer_addr *)src_srng_desc;
+
+		*src_desc = *((struct buffer_addr *)p_last_buf_addr_info);
+	} else {
+		ath11k_dbg(ar->ab, ATH11K_DBG_DATA,
+			   "Monitor Link Desc Ring %d Full", mac_id);
+		ret = -ENOMEM;
+	}
 
+	ath11k_hal_srng_access_end(ar->ab, hal_srng);
+	return ret;
+}
+
+static inline
+void ath11k_dp_rx_mon_next_link_desc_get(void *rx_msdu_link_desc,
+					 dma_addr_t *paddr, u32 *sw_cookie,
+					 void **pp_buf_addr_info)
+{
+	struct hal_rx_msdu_link *msdu_link =
+			(struct hal_rx_msdu_link *)rx_msdu_link_desc;
+	struct buffer_addr *buf_addr_info;
+	u8 rbm = 0;
+
+	buf_addr_info = (struct buffer_addr *)&msdu_link->buf_addr_info;
+
+	ath11k_hal_rx_buf_addr_info_get(buf_addr_info, paddr, sw_cookie, &rbm);
+
+	*pp_buf_addr_info = (void *)buf_addr_info;
+}
+
+static inline int ath11k_dp_pkt_set_pktlen(struct sk_buff *skb, u32 len)
+{
+	if (skb->len > len) {
+		skb_trim(skb, len);
+	} else {
+		if (skb_tailroom(skb) < len - skb->len) {
+			if ((pskb_expand_head(skb, 0,
+					      len - skb->len - skb_tailroom(skb),
+					      GFP_ATOMIC))) {
+				dev_kfree_skb_any(skb);
+				return -ENOMEM;
+			}
+		}
+		skb_put(skb, (len - skb->len));
+	}
 	return 0;
 }
diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.h b/drivers/net/wireless/ath/ath11k/dp_rx.h
index a8fb57f..cc66bc9 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.h
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.h
@@ -296,6 +296,54 @@ static inline void ath11k_dp_rx_desc_end_tlv_copy(u8 *first, u8 *last)
 	       sizeof(struct rx_mpdu_end));
 }
 
+static inline u32 ath11k_dp_rxdesc_get_mpdulen_err(void *hw_desc_addr)
+{
+	struct hal_rx_desc *rx_desc = (struct hal_rx_desc *)hw_desc_addr;
+	struct rx_attention *rx_attn;
+
+	rx_attn = &rx_desc->attention;
+
+	return FIELD_GET(RX_ATTENTION_INFO1_MPDU_LEN_ERR, rx_attn->info1);
+}
+
+static inline u32 ath11k_dp_rxdesc_get_decap_format(void *hw_desc_addr)
+{
+	struct hal_rx_desc *rx_desc = (struct hal_rx_desc *)hw_desc_addr;
+	struct rx_msdu_start *rx_msdu_start;
+
+	rx_msdu_start = &rx_desc->msdu_start;
+
+	return FIELD_GET(RX_MSDU_START_INFO2_DECAP_FORMAT,
+			rx_msdu_start->info2);
+}
+
+static inline u8 *ath11k_dp_rxdesc_get_80211hdr(void *hw_desc_addr)
+{
+	struct hal_rx_desc *rx_desc = (struct hal_rx_desc *)hw_desc_addr;
+	u8 *rx_pkt_hdr;
+
+	rx_pkt_hdr = &rx_desc->msdu_payload[0];
+
+	return rx_pkt_hdr;
+}
+
+static inline bool ath11k_dp_rxdesc_mpdu_valid(void *hw_desc_addr)
+{
+	struct hal_rx_desc *rx_desc = (struct hal_rx_desc *)hw_desc_addr;
+	u32 tlv_tag;
+
+	tlv_tag = FIELD_GET(HAL_TLV_HDR_TAG, rx_desc->mpdu_start_tag);
+
+	return tlv_tag == HAL_RX_MPDU_START ? true : false;
+}
+
+static inline u32 ath11k_dp_rxdesc_get_ppduid(void *hw_desc_addr)
+{
+	struct hal_rx_desc *rx_desc = (struct hal_rx_desc *)hw_desc_addr;
+
+	return rx_desc->mpdu_start.phy_ppdu_id;
+}
+
 int ath11k_dp_rx_ampdu_start(struct ath11k *ar,
 			     struct ieee80211_ampdu_params *params);
 int ath11k_dp_rx_ampdu_stop(struct ath11k *ar,
@@ -330,11 +378,16 @@ int ath11k_dp_htt_rx_filter_setup(struct ath11k_base *ab, u32 ring_id,
 				  int mac_id, enum hal_ring_type ring_type,
 				  int rx_buf_size,
 				  struct htt_rx_ring_tlv_filter *tlv_filter);
+int ath11k_dp_rx_process_mon_rings(struct ath11k_base *ab, int mac_id,
+				   struct napi_struct *napi, int budget);
 int ath11k_dp_rx_process_mon_status(struct ath11k_base *ab, int mac_id,
 				    struct napi_struct *napi, int budget);
 int ath11k_dp_rx_mon_status_bufs_replenish(struct ath11k_base *ab, int mac_id,
-					   struct dp_rxdma_ring *rx_ring,
-					   int req_entries,
-					   enum hal_rx_buf_return_buf_manager mgr,
-					   gfp_t gfp);
+					struct dp_rxdma_ring *rx_ring,
+					int req_entries,
+					enum hal_rx_buf_return_buf_manager mgr,
+					gfp_t gfp);
+int ath11k_dp_rx_pdev_mon_detach(struct ath11k *ar);
+int ath11k_dp_rx_pdev_mon_attach(struct ath11k *ar);
+
 #endif /* ATH11K_DP_RX_H */
-- 
2.7.4


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
