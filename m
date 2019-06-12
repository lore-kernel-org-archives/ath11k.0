Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hb2xs-0004e3-Se
 for ath11k@lists.infradead.org; Wed, 12 Jun 2019 13:06:59 +0000
From: Karthikeyan Periyasamy <periyasa@codeaurora.org>
Subject: [PATCHv2] ath11k: cleanup in rx data path
Date: Wed, 12 Jun 2019 18:36:25 +0530
Message-Id: <1560344785-8162-1-git-send-email-periyasa@codeaurora.org>
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
Cc: Karthikeyan Periyasamy <periyasa@codeaurora.org>

Removed all unused function definition from dp_rx.
Moved all non exposed API inside the dp_rx.
Removed inline attribute and let the compiler handle
the optimization.

Signed-off-by: Karthikeyan Periyasamy <periyasa@codeaurora.org>
---
 v2:
  - Rebase the patch to the tip of the tree.

 drivers/net/wireless/ath/ath11k/dp_rx.c | 310 ++++++++++++++++++++++++++++----
 drivers/net/wireless/ath/ath11k/dp_rx.h | 307 -------------------------------
 2 files changed, 274 insertions(+), 343 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index 59d2605..7b17744 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -12,6 +12,255 @@
 #include "hal_rx.h"
 #include "dp_tx.h"
 
+static u8 *ath11k_dp_rx_h_80211_hdr(u8 *desc)
+{
+	struct hal_rx_desc *rxd = (struct hal_rx_desc *)desc;
+
+	return rxd->hdr_status;
+}
+
+static enum hal_encrypt_type ath11k_dp_rx_h_mpdu_start_enctype(u8 *desc)
+{
+	struct hal_rx_desc *rxd = (struct hal_rx_desc *)desc;
+
+	if (!(__le32_to_cpu(rxd->mpdu_start.info1) &
+	    RX_MPDU_START_INFO1_ENCRYPT_INFO_VALID))
+		return HAL_ENCRYPT_TYPE_OPEN;
+
+	return FIELD_GET(RX_MPDU_START_INFO2_ENC_TYPE,
+			 __le32_to_cpu(rxd->mpdu_start.info2));
+}
+
+static u8 ath11k_dp_rx_h_mpdu_start_decap_type(u8 *desc)
+{
+	struct hal_rx_desc *rxd = (struct hal_rx_desc *)desc;
+
+	return FIELD_GET(RX_MPDU_START_INFO5_DECAP_TYPE,
+			 __le32_to_cpu(rxd->mpdu_start.info5));
+}
+
+static bool ath11k_dp_rx_h_attn_msdu_done(u8 *desc)
+{
+	struct hal_rx_desc *rxd = (struct hal_rx_desc *)desc;
+
+	return !!FIELD_GET(RX_ATTENTION_INFO2_MSDU_DONE,
+			   __le32_to_cpu(rxd->attention.info2));
+}
+
+static bool ath11k_dp_rx_h_attn_first_mpdu(u8 *desc)
+{
+	struct hal_rx_desc *rxd = (struct hal_rx_desc *)desc;
+
+	return !!FIELD_GET(RX_ATTENTION_INFO1_FIRST_MPDU,
+			   __le32_to_cpu(rxd->attention.info1));
+}
+
+static bool ath11k_dp_rx_h_attn_l4_cksum_fail(u8 *desc)
+{
+	struct hal_rx_desc *rxd = (struct hal_rx_desc *)desc;
+
+	return !!FIELD_GET(RX_ATTENTION_INFO1_TCP_UDP_CKSUM_FAIL,
+			   __le32_to_cpu(rxd->attention.info1));
+}
+
+static bool ath11k_dp_rx_h_attn_ip_cksum_fail(u8 *desc)
+{
+	struct hal_rx_desc *rxd = (struct hal_rx_desc *)desc;
+
+	return !!FIELD_GET(RX_ATTENTION_INFO1_IP_CKSUM_FAIL,
+			   __le32_to_cpu(rxd->attention.info1));
+}
+
+static bool ath11k_dp_rx_h_attn_is_decrypted(u8 *desc)
+{
+	struct hal_rx_desc *rxd = (struct hal_rx_desc *)desc;
+
+	return (FIELD_GET(RX_ATTENTION_INFO2_DCRYPT_STATUS_CODE,
+			  __le32_to_cpu(rxd->attention.info2)) ==
+		RX_DESC_DECRYPT_STATUS_CODE_OK);
+}
+
+static u32 ath11k_dp_rx_h_attn_mpdu_err(u8 *desc)
+{
+	struct hal_rx_desc *rxd = (struct hal_rx_desc *)desc;
+	u32 info = __le32_to_cpu(rxd->attention.info1);
+	u32 errmap = 0;
+
+	if (info & RX_ATTENTION_INFO1_FCS_ERR)
+		errmap |= DP_RX_MPDU_ERR_FCS;
+
+	if (info & RX_ATTENTION_INFO1_DECRYPT_ERR)
+		errmap |= DP_RX_MPDU_ERR_DECRYPT;
+
+	if (info & RX_ATTENTION_INFO1_TKIP_MIC_ERR)
+		errmap |= DP_RX_MPDU_ERR_TKIP_MIC;
+
+	if (info & RX_ATTENTION_INFO1_A_MSDU_ERROR)
+		errmap |= DP_RX_MPDU_ERR_AMSDU_ERR;
+
+	if (info & RX_ATTENTION_INFO1_OVERFLOW_ERR)
+		errmap |= DP_RX_MPDU_ERR_OVERFLOW;
+
+	if (info & RX_ATTENTION_INFO1_MSDU_LEN_ERR)
+		errmap |= DP_RX_MPDU_ERR_MSDU_LEN;
+
+	if (info & RX_ATTENTION_INFO1_MPDU_LEN_ERR)
+		errmap |= DP_RX_MPDU_ERR_MPDU_LEN;
+
+	return errmap;
+}
+
+static u16 ath11k_dp_rx_h_msdu_start_msdu_len(u8 *desc)
+{
+	struct hal_rx_desc *rxd = (struct hal_rx_desc *)desc;
+
+	return FIELD_GET(RX_MSDU_START_INFO1_MSDU_LENGTH,
+			 __le32_to_cpu(rxd->msdu_start.info1));
+}
+
+static u8 ath11k_dp_rx_h_msdu_start_sgi(u8 *desc)
+{
+	struct hal_rx_desc *rxd = (struct hal_rx_desc *)desc;
+
+	return FIELD_GET(RX_MSDU_START_INFO3_SGI,
+			 __le32_to_cpu(rxd->msdu_start.info3));
+}
+
+static u8 ath11k_dp_rx_h_msdu_start_rate_mcs(u8 *desc)
+{
+	struct hal_rx_desc *rxd = (struct hal_rx_desc *)desc;
+
+	return FIELD_GET(RX_MSDU_START_INFO3_RATE_MCS,
+			 __le32_to_cpu(rxd->msdu_start.info3));
+}
+
+static u8 ath11k_dp_rx_h_msdu_start_rx_bw(u8 *desc)
+{
+	struct hal_rx_desc *rxd = (struct hal_rx_desc *)desc;
+
+	return FIELD_GET(RX_MSDU_START_INFO3_RECV_BW,
+			 __le32_to_cpu(rxd->msdu_start.info3));
+}
+
+static u8 ath11k_dp_rx_h_msdu_start_rssi(u8 *desc)
+{
+	struct hal_rx_desc *rxd = (struct hal_rx_desc *)desc;
+
+	return FIELD_GET(RX_MSDU_START_INFO3_USER_RSSI,
+			 __le32_to_cpu(rxd->msdu_start.info3));
+}
+
+static u32 ath11k_dp_rx_h_msdu_start_freq(u8 *desc)
+{
+	struct hal_rx_desc *rxd = (struct hal_rx_desc *)desc;
+
+	return __le32_to_cpu(rxd->msdu_start.phy_meta_data);
+}
+
+static u8 ath11k_dp_rx_h_msdu_start_pkt_type(u8 *desc)
+{
+	struct hal_rx_desc *rxd = (struct hal_rx_desc *)desc;
+
+	return FIELD_GET(RX_MSDU_START_INFO3_PKT_TYPE,
+			 __le32_to_cpu(rxd->msdu_start.info3));
+}
+
+static u8 ath11k_dp_rx_h_msdu_start_nss(u8 *desc)
+{
+	struct hal_rx_desc *rxd = (struct hal_rx_desc *)desc;
+	u8 mimo_ss_bitmap = FIELD_GET(RX_MSDU_START_INFO3_MIMO_SS_BITMAP,
+				      __le32_to_cpu(rxd->msdu_start.info3));
+
+	return hweight8(mimo_ss_bitmap);
+}
+
+static u8 ath11k_dp_rx_h_msdu_end_l3pad(u8 *desc)
+{
+	struct hal_rx_desc *rxd = (struct hal_rx_desc *)desc;
+
+	return FIELD_GET(RX_MSDU_END_INFO2_L3_HDR_PADDING,
+			 __le32_to_cpu(rxd->msdu_end.info2));
+}
+
+static bool ath11k_dp_rx_h_msdu_end_first_msdu(u8 *desc)
+{
+	struct hal_rx_desc *rxd = (struct hal_rx_desc *)desc;
+
+	return !!FIELD_GET(RX_MSDU_END_INFO2_FIRST_MSDU,
+			   __le32_to_cpu(rxd->msdu_end.info2));
+}
+
+static bool ath11k_dp_rx_h_msdu_end_last_msdu(u8 *desc)
+{
+	struct hal_rx_desc *rxd = (struct hal_rx_desc *)desc;
+
+	return !!FIELD_GET(RX_MSDU_END_INFO2_LAST_MSDU,
+			   __le32_to_cpu(rxd->msdu_end.info2));
+}
+
+static void ath11k_dp_rx_desc_end_tlv_copy(u8 *first, u8 *last)
+{
+	struct hal_rx_desc *fdesc = (struct hal_rx_desc *)first;
+	struct hal_rx_desc *ldesc = (struct hal_rx_desc *)last;
+
+	memcpy((u8 *)&fdesc->msdu_end, (u8 *)&ldesc->msdu_end,
+	       sizeof(struct rx_msdu_end));
+	memcpy((u8 *)&fdesc->attention, (u8 *)&ldesc->attention,
+	       sizeof(struct rx_attention));
+	memcpy((u8 *)&fdesc->mpdu_end, (u8 *)&ldesc->mpdu_end,
+	       sizeof(struct rx_mpdu_end));
+}
+
+static u32 ath11k_dp_rxdesc_get_mpdulen_err(void *hw_desc_addr)
+{
+	struct hal_rx_desc *rx_desc = (struct hal_rx_desc *)hw_desc_addr;
+	struct rx_attention *rx_attn;
+
+	rx_attn = &rx_desc->attention;
+
+	return FIELD_GET(RX_ATTENTION_INFO1_MPDU_LEN_ERR,
+			 __le32_to_cpu(rx_attn->info1));
+}
+
+static u32 ath11k_dp_rxdesc_get_decap_format(void *hw_desc_addr)
+{
+	struct hal_rx_desc *rx_desc = (struct hal_rx_desc *)hw_desc_addr;
+	struct rx_msdu_start *rx_msdu_start;
+
+	rx_msdu_start = &rx_desc->msdu_start;
+
+	return FIELD_GET(RX_MSDU_START_INFO2_DECAP_FORMAT,
+			 __le32_to_cpu(rx_msdu_start->info2));
+}
+
+static u8 *ath11k_dp_rxdesc_get_80211hdr(void *hw_desc_addr)
+{
+	struct hal_rx_desc *rx_desc = (struct hal_rx_desc *)hw_desc_addr;
+	u8 *rx_pkt_hdr;
+
+	rx_pkt_hdr = &rx_desc->msdu_payload[0];
+
+	return rx_pkt_hdr;
+}
+
+static bool ath11k_dp_rxdesc_mpdu_valid(void *hw_desc_addr)
+{
+	struct hal_rx_desc *rx_desc = (struct hal_rx_desc *)hw_desc_addr;
+	u32 tlv_tag;
+
+	tlv_tag = FIELD_GET(HAL_TLV_HDR_TAG,
+			    __le32_to_cpu(rx_desc->mpdu_start_tag));
+
+	return tlv_tag == HAL_RX_MPDU_START ? true : false;
+}
+
+static u32 ath11k_dp_rxdesc_get_ppduid(void *hw_desc_addr)
+{
+	struct hal_rx_desc *rx_desc = (struct hal_rx_desc *)hw_desc_addr;
+
+	return __le16_to_cpu(rx_desc->mpdu_start.phy_ppdu_id);
+}
+
 /* Returns number of Rx buffers replenished */
 int ath11k_dp_rxbufs_replenish(struct ath11k_base *ab, int mac_id,
 			       struct dp_rxdma_ring *rx_ring,
@@ -652,8 +901,8 @@ int ath11k_dp_rx_ampdu_stop(struct ath11k *ar,
 	return ret;
 }
 
-static inline int ath11k_get_ppdu_user_index(struct htt_ppdu_stats *ppdu_stats,
-					      u16 peer_id)
+static int ath11k_get_ppdu_user_index(struct htt_ppdu_stats *ppdu_stats,
+				      u16 peer_id)
 {
 	int i;
 
@@ -790,7 +1039,7 @@ int ath11k_dp_htt_tlv_iter(struct ath11k_base *ab, const void *ptr, size_t len,
 	return 0;
 }
 
-static inline u8 ath11k_bw_to_mac80211_bw(u8 bw)
+static u8 ath11k_bw_to_mac80211_bw(u8 bw)
 {
 	u8 ret = 0;
 
@@ -812,7 +1061,7 @@ static inline u8 ath11k_bw_to_mac80211_bw(u8 bw)
 	return ret;
 }
 
-static inline u32 ath11k_bw_to_mac80211_bwflags(u8 bw)
+static u32 ath11k_bw_to_mac80211_bwflags(u8 bw)
 {
 	u32 bwflags = 0;
 
@@ -1033,7 +1282,8 @@ struct htt_ppdu_stats_info *ath11k_dp_htt_get_ppdu_desc(struct ath11k *ar,
 }
 
 static int ath11k_htt_pull_ppdu_stats(struct ath11k_base *ab,
-					 struct sk_buff *skb) {
+				      struct sk_buff *skb)
+{
 	u8 *data = (u8 *)skb->data;
 	struct htt_ppdu_stats_info *ppdu_info;
 	struct ath11k *ar;
@@ -1081,8 +1331,7 @@ static int ath11k_htt_pull_ppdu_stats(struct ath11k_base *ab,
 	return ret;
 }
 
-static void ath11k_htt_pktlog(struct ath11k_base *ab,
-				     struct sk_buff *skb)
+static void ath11k_htt_pktlog(struct ath11k_base *ab, struct sk_buff *skb)
 {
 	u32 *data = (u32 *)skb->data, len;
 	struct ath11k *ar;
@@ -3252,17 +3501,7 @@ int ath11k_dp_rx_pdev_alloc(struct ath11k_base *ab, int mac_id)
 	return 0;
 }
 
-static inline bool ath11k_get_rx_status_done(u8 *rx_tlv)
-{
-	struct hal_tlv_hdr *thdr = (struct hal_tlv_hdr *)rx_tlv;
-	u32 tlv_tag;
-
-	tlv_tag = FIELD_GET(HAL_TLV_HDR_TAG, thdr->tl);
-
-	return (tlv_tag == HAL_RX_STATUS_BUFFER_DONE);
-}
-
-static inline void ath11k_dp_mon_set_frag_len(u32 *total_len, u32 *frag_len)
+static void ath11k_dp_mon_set_frag_len(u32 *total_len, u32 *frag_len)
 {
 	if (*total_len >= (DP_RX_BUFFER_SIZE - sizeof(struct hal_rx_desc))) {
 		*frag_len = DP_RX_BUFFER_SIZE - sizeof(struct hal_rx_desc);
@@ -3273,7 +3512,7 @@ static inline void ath11k_dp_mon_set_frag_len(u32 *total_len, u32 *frag_len)
 	}
 }
 
-static inline
+static
 int ath11k_dp_rx_monitor_link_desc_return(struct ath11k *ar,
 					  void *p_last_buf_addr_info,
 					  u8 mac_id)
@@ -3306,7 +3545,7 @@ int ath11k_dp_rx_monitor_link_desc_return(struct ath11k *ar,
 	return ret;
 }
 
-static inline
+static
 void ath11k_dp_rx_mon_next_link_desc_get(void *rx_msdu_link_desc,
 					 dma_addr_t *paddr, u32 *sw_cookie,
 					 void **pp_buf_addr_info)
@@ -3323,7 +3562,7 @@ void ath11k_dp_rx_mon_next_link_desc_get(void *rx_msdu_link_desc,
 	*pp_buf_addr_info = (void *)buf_addr_info;
 }
 
-static inline int ath11k_dp_pkt_set_pktlen(struct sk_buff *skb, u32 len)
+static int ath11k_dp_pkt_set_pktlen(struct sk_buff *skb, u32 len)
 {
 	if (skb->len > len) {
 		skb_trim(skb, len);
@@ -3341,11 +3580,10 @@ static inline int ath11k_dp_pkt_set_pktlen(struct sk_buff *skb, u32 len)
 	return 0;
 }
 
-static inline void
-ath11k_hal_rx_msdu_list_get(struct ath11k *ar,
-			    void *msdu_link_desc,
-			    struct hal_rx_msdu_list *msdu_list,
-			    u16 *num_msdus)
+static void ath11k_hal_rx_msdu_list_get(struct ath11k *ar,
+					void *msdu_link_desc,
+					struct hal_rx_msdu_list *msdu_list,
+					u16 *num_msdus)
 {
 	struct hal_rx_msdu_details *msdu_details = NULL;
 	struct rx_msdu_desc *msdu_desc_info = NULL;
@@ -3385,8 +3623,8 @@ static inline int ath11k_dp_pkt_set_pktlen(struct sk_buff *skb, u32 len)
 	*num_msdus = i;
 }
 
-static inline u32 ath11k_dp_rx_mon_comp_ppduid(u32 msdu_ppdu_id, u32 *ppdu_id,
-					       u32 *rx_bufs_used)
+static u32 ath11k_dp_rx_mon_comp_ppduid(u32 msdu_ppdu_id, u32 *ppdu_id,
+					u32 *rx_bufs_used)
 {
 	u32 ret = 0;
 
@@ -3406,9 +3644,9 @@ static inline u32 ath11k_dp_rx_mon_comp_ppduid(u32 msdu_ppdu_id, u32 *ppdu_id,
 	return ret;
 }
 
-static inline void ath11k_dp_mon_get_buf_len(struct hal_rx_msdu_desc_info *info,
-					     bool *is_frag, u32 *total_len,
-					     u32 *frag_len, u32 *msdu_cnt)
+static void ath11k_dp_mon_get_buf_len(struct hal_rx_msdu_desc_info *info,
+				      bool *is_frag, u32 *total_len,
+				      u32 *frag_len, u32 *msdu_cnt)
 {
 	if (info->msdu_flags & RX_MSDU_DESC_INFO0_MSDU_CONTINUATION) {
 		if (!*is_frag) {
@@ -3601,7 +3839,7 @@ static inline void ath11k_dp_mon_get_buf_len(struct hal_rx_msdu_desc_info *info,
 	return rx_bufs_used;
 }
 
-static inline void ath11k_dp_rx_msdus_set_payload(struct sk_buff *msdu)
+static void ath11k_dp_rx_msdus_set_payload(struct sk_buff *msdu)
 {
 	u32 rx_pkt_offset, l2_hdr_offset;
 
@@ -3610,7 +3848,7 @@ static inline void ath11k_dp_rx_msdus_set_payload(struct sk_buff *msdu)
 	skb_pull(msdu, rx_pkt_offset + l2_hdr_offset);
 }
 
-static inline struct sk_buff *
+static struct sk_buff *
 ath11k_dp_rx_mon_merg_msdus(struct ath11k *ar,
 			    u32 mac_id, struct sk_buff *head_msdu,
 			    struct sk_buff *last_msdu,
@@ -3835,9 +4073,9 @@ static void ath11k_dp_rx_mon_dest_process(struct ath11k *ar, u32 quota,
 	}
 }
 
-static inline void ath11k_dp_rx_mon_status_process_tlv(struct ath11k *ar,
-						       u32 quota,
-						       struct napi_struct *napi)
+static void ath11k_dp_rx_mon_status_process_tlv(struct ath11k *ar,
+						u32 quota,
+						struct napi_struct *napi)
 {
 	struct ath11k_pdev_dp *dp = &ar->dp;
 	struct ath11k_mon_data *pmon = (struct ath11k_mon_data *)&dp->mon_data;
diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.h b/drivers/net/wireless/ath/ath11k/dp_rx.h
index 75d9150..1fae945 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.h
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.h
@@ -39,313 +39,6 @@ struct ath11k_dp_rfc1042_hdr {
 	__be16 snap_type;
 } __packed;
 
-static inline u8 *
-ath11k_dp_rx_h_80211_hdr(u8 *desc)
-{
-	struct hal_rx_desc *rxd = (struct hal_rx_desc *)desc;
-
-	return rxd->hdr_status;
-}
-
-static inline bool
-ath11k_dp_rx_h_mpdu_start_valid_encrypt(u8 *desc)
-{
-	struct hal_rx_desc *rxd = (struct hal_rx_desc *)desc;
-
-	return !!FIELD_GET(RX_MPDU_START_INFO1_ENCRYPT_INFO_VALID,
-			   __le32_to_cpu(rxd->mpdu_start.info1));
-}
-
-static inline void
-ath11k_dp_rx_h_mpdu_start_dump_pn(struct ath11k_base *ab, u8 *desc)
-{
-	struct hal_rx_desc *rxd = (struct hal_rx_desc *)desc;
-
-	ath11k_info(ab, "Dump PN number: %x %x %x %x\n",
-		    __le32_to_cpu(rxd->mpdu_start.pn[0]),
-		    __le32_to_cpu(rxd->mpdu_start.pn[1]),
-		    __le32_to_cpu(rxd->mpdu_start.pn[2]),
-		    __le32_to_cpu(rxd->mpdu_start.pn[3]));
-}
-
-static inline enum hal_encrypt_type
-ath11k_dp_rx_h_mpdu_start_enctype(u8 *desc)
-{
-	struct hal_rx_desc *rxd = (struct hal_rx_desc *)desc;
-
-	if (!(__le32_to_cpu(rxd->mpdu_start.info1) &
-	    RX_MPDU_START_INFO1_ENCRYPT_INFO_VALID))
-		return HAL_ENCRYPT_TYPE_OPEN;
-
-	return FIELD_GET(RX_MPDU_START_INFO2_ENC_TYPE,
-			 __le32_to_cpu(rxd->mpdu_start.info2));
-}
-
-static inline u8
-ath11k_dp_rx_h_mpdu_start_decap_type(u8 *desc)
-{
-	struct hal_rx_desc *rxd = (struct hal_rx_desc *)desc;
-
-	return FIELD_GET(RX_MPDU_START_INFO5_DECAP_TYPE,
-			 __le32_to_cpu(rxd->mpdu_start.info5));
-}
-
-static inline bool
-ath11k_dp_rx_h_attn_msdu_done(u8 *desc)
-{
-	struct hal_rx_desc *rxd = (struct hal_rx_desc *)desc;
-
-	return !!FIELD_GET(RX_ATTENTION_INFO2_MSDU_DONE,
-			   __le32_to_cpu(rxd->attention.info2));
-}
-
-static inline bool
-ath11k_dp_rx_h_attn_first_mpdu(u8 *desc)
-{
-	struct hal_rx_desc *rxd = (struct hal_rx_desc *)desc;
-
-	return !!FIELD_GET(RX_ATTENTION_INFO1_FIRST_MPDU,
-			   __le32_to_cpu(rxd->attention.info1));
-}
-
-static inline bool
-ath11k_dp_rx_h_attn_l4_cksum_fail(u8 *desc)
-{
-	struct hal_rx_desc *rxd = (struct hal_rx_desc *)desc;
-
-	return !!FIELD_GET(RX_ATTENTION_INFO1_TCP_UDP_CKSUM_FAIL,
-			   __le32_to_cpu(rxd->attention.info1));
-}
-
-static inline bool
-ath11k_dp_rx_h_attn_ip_cksum_fail(u8 *desc)
-{
-	struct hal_rx_desc *rxd = (struct hal_rx_desc *)desc;
-
-	return !!FIELD_GET(RX_ATTENTION_INFO1_IP_CKSUM_FAIL,
-			   __le32_to_cpu(rxd->attention.info1));
-}
-
-static inline bool
-ath11k_dp_rx_h_attn_is_decrypted(u8 *desc)
-{
-	struct hal_rx_desc *rxd = (struct hal_rx_desc *)desc;
-
-	return (FIELD_GET(RX_ATTENTION_INFO2_DCRYPT_STATUS_CODE,
-			  __le32_to_cpu(rxd->attention.info2)) ==
-		RX_DESC_DECRYPT_STATUS_CODE_OK);
-}
-
-static inline u32
-ath11k_dp_rx_h_attn_mpdu_err(u8 *desc)
-{
-	struct hal_rx_desc *rxd = (struct hal_rx_desc *)desc;
-	u32 info = __le32_to_cpu(rxd->attention.info1);
-	u32 errmap = 0;
-
-	if (info & RX_ATTENTION_INFO1_FCS_ERR)
-		errmap |= DP_RX_MPDU_ERR_FCS;
-
-	if (info & RX_ATTENTION_INFO1_DECRYPT_ERR)
-		errmap |= DP_RX_MPDU_ERR_DECRYPT;
-
-	if (info & RX_ATTENTION_INFO1_TKIP_MIC_ERR)
-		errmap |= DP_RX_MPDU_ERR_TKIP_MIC;
-
-	if (info & RX_ATTENTION_INFO1_A_MSDU_ERROR)
-		errmap |= DP_RX_MPDU_ERR_AMSDU_ERR;
-
-	if (info & RX_ATTENTION_INFO1_OVERFLOW_ERR)
-		errmap |= DP_RX_MPDU_ERR_OVERFLOW;
-
-	if (info & RX_ATTENTION_INFO1_MSDU_LEN_ERR)
-		errmap |= DP_RX_MPDU_ERR_MSDU_LEN;
-
-	if (info & RX_ATTENTION_INFO1_MPDU_LEN_ERR)
-		errmap |= DP_RX_MPDU_ERR_MPDU_LEN;
-
-	return errmap;
-}
-
-static inline u16
-ath11k_dp_rx_h_msdu_start_msdu_len(u8 *desc)
-{
-	struct hal_rx_desc *rxd = (struct hal_rx_desc *)desc;
-
-	return FIELD_GET(RX_MSDU_START_INFO1_MSDU_LENGTH,
-			 __le32_to_cpu(rxd->msdu_start.info1));
-}
-
-static inline u8
-ath11k_dp_rx_h_msdu_start_sgi(u8 *desc)
-{
-	struct hal_rx_desc *rxd = (struct hal_rx_desc *)desc;
-
-	return FIELD_GET(RX_MSDU_START_INFO3_SGI,
-			 __le32_to_cpu(rxd->msdu_start.info3));
-}
-
-static inline u8
-ath11k_dp_rx_h_msdu_start_rate_mcs(u8 *desc)
-{
-	struct hal_rx_desc *rxd = (struct hal_rx_desc *)desc;
-
-	return FIELD_GET(RX_MSDU_START_INFO3_RATE_MCS,
-			 __le32_to_cpu(rxd->msdu_start.info3));
-}
-
-static inline u8
-ath11k_dp_rx_h_msdu_start_rx_bw(u8 *desc)
-{
-	struct hal_rx_desc *rxd = (struct hal_rx_desc *)desc;
-
-	return FIELD_GET(RX_MSDU_START_INFO3_RECV_BW,
-			 __le32_to_cpu(rxd->msdu_start.info3));
-}
-
-static inline u8
-ath11k_dp_rx_h_msdu_start_recption_type(u8 *desc)
-{
-	struct hal_rx_desc *rxd = (struct hal_rx_desc *)desc;
-
-	return FIELD_GET(RX_MSDU_START_INFO3_RECEPTION_TYPE,
-			 __le32_to_cpu(rxd->msdu_start.info3));
-}
-
-static inline u32
-ath11k_dp_rx_h_msdu_start_flow_id(u8 *desc)
-{
-	struct hal_rx_desc *rxd = (struct hal_rx_desc *)desc;
-
-	return __le32_to_cpu(rxd->msdu_start.flow_id_toeplitz);
-}
-
-static inline u8
-ath11k_dp_rx_h_msdu_start_rssi(u8 *desc)
-{
-	struct hal_rx_desc *rxd = (struct hal_rx_desc *)desc;
-
-	return FIELD_GET(RX_MSDU_START_INFO3_USER_RSSI,
-			 __le32_to_cpu(rxd->msdu_start.info3));
-}
-
-static inline u32
-ath11k_dp_rx_h_msdu_start_freq(u8 *desc)
-{
-	struct hal_rx_desc *rxd = (struct hal_rx_desc *)desc;
-
-	return __le32_to_cpu(rxd->msdu_start.phy_meta_data);
-}
-
-static inline u8
-ath11k_dp_rx_h_msdu_start_pkt_type(u8 *desc)
-{
-	struct hal_rx_desc *rxd = (struct hal_rx_desc *)desc;
-
-	return FIELD_GET(RX_MSDU_START_INFO3_PKT_TYPE,
-			 __le32_to_cpu(rxd->msdu_start.info3));
-}
-
-static inline u8
-ath11k_dp_rx_h_msdu_start_nss(u8 *desc)
-{
-	struct hal_rx_desc *rxd = (struct hal_rx_desc *)desc;
-	u8 mimo_ss_bitmap = FIELD_GET(RX_MSDU_START_INFO3_MIMO_SS_BITMAP,
-				      __le32_to_cpu(rxd->msdu_start.info3));
-
-	return hweight8(mimo_ss_bitmap);
-}
-
-static inline u8
-ath11k_dp_rx_h_msdu_end_l3pad(u8 *desc)
-{
-	struct hal_rx_desc *rxd = (struct hal_rx_desc *)desc;
-
-	return FIELD_GET(RX_MSDU_END_INFO2_L3_HDR_PADDING,
-			 __le32_to_cpu(rxd->msdu_end.info2));
-}
-
-static inline bool
-ath11k_dp_rx_h_msdu_end_first_msdu(u8 *desc)
-{
-	struct hal_rx_desc *rxd = (struct hal_rx_desc *)desc;
-
-	return !!FIELD_GET(RX_MSDU_END_INFO2_FIRST_MSDU,
-			   __le32_to_cpu(rxd->msdu_end.info2));
-}
-
-static inline bool
-ath11k_dp_rx_h_msdu_end_last_msdu(u8 *desc)
-{
-	struct hal_rx_desc *rxd = (struct hal_rx_desc *)desc;
-
-	return !!FIELD_GET(RX_MSDU_END_INFO2_LAST_MSDU,
-			   __le32_to_cpu(rxd->msdu_end.info2));
-}
-
-static inline void ath11k_dp_rx_desc_end_tlv_copy(u8 *first, u8 *last)
-{
-	struct hal_rx_desc *fdesc = (struct hal_rx_desc *)first;
-	struct hal_rx_desc *ldesc = (struct hal_rx_desc *)last;
-
-	memcpy((u8 *)&fdesc->msdu_end, (u8 *)&ldesc->msdu_end,
-	       sizeof(struct rx_msdu_end));
-	memcpy((u8 *)&fdesc->attention, (u8 *)&ldesc->attention,
-	       sizeof(struct rx_attention));
-	memcpy((u8 *)&fdesc->mpdu_end, (u8 *)&ldesc->mpdu_end,
-	       sizeof(struct rx_mpdu_end));
-}
-
-static inline u32 ath11k_dp_rxdesc_get_mpdulen_err(void *hw_desc_addr)
-{
-	struct hal_rx_desc *rx_desc = (struct hal_rx_desc *)hw_desc_addr;
-	struct rx_attention *rx_attn;
-
-	rx_attn = &rx_desc->attention;
-
-	return FIELD_GET(RX_ATTENTION_INFO1_MPDU_LEN_ERR,
-			 __le32_to_cpu(rx_attn->info1));
-}
-
-static inline u32 ath11k_dp_rxdesc_get_decap_format(void *hw_desc_addr)
-{
-	struct hal_rx_desc *rx_desc = (struct hal_rx_desc *)hw_desc_addr;
-	struct rx_msdu_start *rx_msdu_start;
-
-	rx_msdu_start = &rx_desc->msdu_start;
-
-	return FIELD_GET(RX_MSDU_START_INFO2_DECAP_FORMAT,
-			__le32_to_cpu(rx_msdu_start->info2));
-}
-
-static inline u8 *ath11k_dp_rxdesc_get_80211hdr(void *hw_desc_addr)
-{
-	struct hal_rx_desc *rx_desc = (struct hal_rx_desc *)hw_desc_addr;
-	u8 *rx_pkt_hdr;
-
-	rx_pkt_hdr = &rx_desc->msdu_payload[0];
-
-	return rx_pkt_hdr;
-}
-
-static inline bool ath11k_dp_rxdesc_mpdu_valid(void *hw_desc_addr)
-{
-	struct hal_rx_desc *rx_desc = (struct hal_rx_desc *)hw_desc_addr;
-	u32 tlv_tag;
-
-	tlv_tag = FIELD_GET(HAL_TLV_HDR_TAG,
-			    __le32_to_cpu(rx_desc->mpdu_start_tag));
-
-	return tlv_tag == HAL_RX_MPDU_START ? true : false;
-}
-
-static inline u32 ath11k_dp_rxdesc_get_ppduid(void *hw_desc_addr)
-{
-	struct hal_rx_desc *rx_desc = (struct hal_rx_desc *)hw_desc_addr;
-
-	return __le16_to_cpu(rx_desc->mpdu_start.phy_ppdu_id);
-}
-
 int ath11k_dp_rx_ampdu_start(struct ath11k *ar,
 			     struct ieee80211_ampdu_params *params);
 int ath11k_dp_rx_ampdu_stop(struct ath11k *ar,
-- 
1.9.1


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
