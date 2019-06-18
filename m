Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hd5wG-0007Bx-MY
 for ath11k@lists.infradead.org; Tue, 18 Jun 2019 04:41:47 +0000
Received: from vasanth-lnx.qca.qualcomm.com
 (blr-c-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.19.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: vthiagar@smtp.codeaurora.org)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id D0995606DC
 for <ath11k@lists.infradead.org>; Tue, 18 Jun 2019 04:41:42 +0000 (UTC)
From: Vasanthakumar Thiagarajan <vthiagar@codeaurora.org>
Subject: [PATCH 5/5] ath11k/dp_rx: Clean up void *rx_desc in struct
 ath11k_skb_rxcb
Date: Tue, 18 Jun 2019 10:11:29 +0530
Message-Id: <1560832889-14129-5-git-send-email-vthiagar@codeaurora.org>
In-Reply-To: <1560832889-14129-1-git-send-email-vthiagar@codeaurora.org>
References: <1560832889-14129-1-git-send-email-vthiagar@codeaurora.org>
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

Use the actual struct hal_rx_desc * instead of void *.

Signed-off-by: Vasanthakumar Thiagarajan <vthiagar@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/core.h  |   2 +-
 drivers/net/wireless/ath/ath11k/dp_rx.c | 205 +++++++++++++-------------------
 2 files changed, 84 insertions(+), 123 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/core.h b/drivers/net/wireless/ath/ath11k/core.h
index d15ae78..7591ffb 100644
--- a/drivers/net/wireless/ath/ath11k/core.h
+++ b/drivers/net/wireless/ath/ath11k/core.h
@@ -65,7 +65,7 @@ struct ath11k_skb_rxcb {
 	bool is_first_msdu;
 	bool is_last_msdu;
 	bool is_continuation;
-	void *rx_desc;
+	struct hal_rx_desc *rx_desc;
 	u8 err_rel_src;
 	u8 err_code;
 	u8 mac_id;
diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index 5c47cfc..1c4f81c 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -13,78 +13,61 @@
 #include "dp_tx.h"
 #include "peer.h"
 
-static u8 *ath11k_dp_rx_h_80211_hdr(u8 *desc)
+static u8 *ath11k_dp_rx_h_80211_hdr(struct hal_rx_desc *desc)
 {
-	struct hal_rx_desc *rxd = (struct hal_rx_desc *)desc;
-
-	return rxd->hdr_status;
+	return desc->hdr_status;
 }
 
-static enum hal_encrypt_type ath11k_dp_rx_h_mpdu_start_enctype(u8 *desc)
+static enum hal_encrypt_type ath11k_dp_rx_h_mpdu_start_enctype(struct hal_rx_desc *desc)
 {
-	struct hal_rx_desc *rxd = (struct hal_rx_desc *)desc;
-
-	if (!(__le32_to_cpu(rxd->mpdu_start.info1) &
+	if (!(__le32_to_cpu(desc->mpdu_start.info1) &
 	    RX_MPDU_START_INFO1_ENCRYPT_INFO_VALID))
 		return HAL_ENCRYPT_TYPE_OPEN;
 
 	return FIELD_GET(RX_MPDU_START_INFO2_ENC_TYPE,
-			 __le32_to_cpu(rxd->mpdu_start.info2));
+			 __le32_to_cpu(desc->mpdu_start.info2));
 }
 
-static u8 ath11k_dp_rx_h_mpdu_start_decap_type(u8 *desc)
+static u8 ath11k_dp_rx_h_mpdu_start_decap_type(struct hal_rx_desc *desc)
 {
-	struct hal_rx_desc *rxd = (struct hal_rx_desc *)desc;
-
 	return FIELD_GET(RX_MPDU_START_INFO5_DECAP_TYPE,
-			 __le32_to_cpu(rxd->mpdu_start.info5));
+			 __le32_to_cpu(desc->mpdu_start.info5));
 }
 
-static bool ath11k_dp_rx_h_attn_msdu_done(u8 *desc)
+static bool ath11k_dp_rx_h_attn_msdu_done(struct hal_rx_desc *desc)
 {
-	struct hal_rx_desc *rxd = (struct hal_rx_desc *)desc;
-
 	return !!FIELD_GET(RX_ATTENTION_INFO2_MSDU_DONE,
-			   __le32_to_cpu(rxd->attention.info2));
+			   __le32_to_cpu(desc->attention.info2));
 }
 
-static bool ath11k_dp_rx_h_attn_first_mpdu(u8 *desc)
+static bool ath11k_dp_rx_h_attn_first_mpdu(struct hal_rx_desc *desc)
 {
-	struct hal_rx_desc *rxd = (struct hal_rx_desc *)desc;
-
 	return !!FIELD_GET(RX_ATTENTION_INFO1_FIRST_MPDU,
-			   __le32_to_cpu(rxd->attention.info1));
+			   __le32_to_cpu(desc->attention.info1));
 }
 
-static bool ath11k_dp_rx_h_attn_l4_cksum_fail(u8 *desc)
+static bool ath11k_dp_rx_h_attn_l4_cksum_fail(struct hal_rx_desc *desc)
 {
-	struct hal_rx_desc *rxd = (struct hal_rx_desc *)desc;
-
 	return !!FIELD_GET(RX_ATTENTION_INFO1_TCP_UDP_CKSUM_FAIL,
-			   __le32_to_cpu(rxd->attention.info1));
+			   __le32_to_cpu(desc->attention.info1));
 }
 
-static bool ath11k_dp_rx_h_attn_ip_cksum_fail(u8 *desc)
+static bool ath11k_dp_rx_h_attn_ip_cksum_fail(struct hal_rx_desc *desc)
 {
-	struct hal_rx_desc *rxd = (struct hal_rx_desc *)desc;
-
 	return !!FIELD_GET(RX_ATTENTION_INFO1_IP_CKSUM_FAIL,
-			   __le32_to_cpu(rxd->attention.info1));
+			   __le32_to_cpu(desc->attention.info1));
 }
 
-static bool ath11k_dp_rx_h_attn_is_decrypted(u8 *desc)
+static bool ath11k_dp_rx_h_attn_is_decrypted(struct hal_rx_desc *desc)
 {
-	struct hal_rx_desc *rxd = (struct hal_rx_desc *)desc;
-
 	return (FIELD_GET(RX_ATTENTION_INFO2_DCRYPT_STATUS_CODE,
-			  __le32_to_cpu(rxd->attention.info2)) ==
+			  __le32_to_cpu(desc->attention.info2)) ==
 		RX_DESC_DECRYPT_STATUS_CODE_OK);
 }
 
-static u32 ath11k_dp_rx_h_attn_mpdu_err(u8 *desc)
+static u32 ath11k_dp_rx_h_attn_mpdu_err(struct hal_rx_desc *desc)
 {
-	struct hal_rx_desc *rxd = (struct hal_rx_desc *)desc;
-	u32 info = __le32_to_cpu(rxd->attention.info1);
+	u32 info = __le32_to_cpu(desc->attention.info1);
 	u32 errmap = 0;
 
 	if (info & RX_ATTENTION_INFO1_FCS_ERR)
@@ -111,99 +94,76 @@ static u32 ath11k_dp_rx_h_attn_mpdu_err(u8 *desc)
 	return errmap;
 }
 
-static u16 ath11k_dp_rx_h_msdu_start_msdu_len(u8 *desc)
+static u16 ath11k_dp_rx_h_msdu_start_msdu_len(struct hal_rx_desc *desc)
 {
-	struct hal_rx_desc *rxd = (struct hal_rx_desc *)desc;
-
 	return FIELD_GET(RX_MSDU_START_INFO1_MSDU_LENGTH,
-			 __le32_to_cpu(rxd->msdu_start.info1));
+			 __le32_to_cpu(desc->msdu_start.info1));
 }
 
-static u8 ath11k_dp_rx_h_msdu_start_sgi(u8 *desc)
+static u8 ath11k_dp_rx_h_msdu_start_sgi(struct hal_rx_desc *desc)
 {
-	struct hal_rx_desc *rxd = (struct hal_rx_desc *)desc;
-
 	return FIELD_GET(RX_MSDU_START_INFO3_SGI,
-			 __le32_to_cpu(rxd->msdu_start.info3));
+			 __le32_to_cpu(desc->msdu_start.info3));
 }
 
-static u8 ath11k_dp_rx_h_msdu_start_rate_mcs(u8 *desc)
+static u8 ath11k_dp_rx_h_msdu_start_rate_mcs(struct hal_rx_desc *desc)
 {
-	struct hal_rx_desc *rxd = (struct hal_rx_desc *)desc;
-
 	return FIELD_GET(RX_MSDU_START_INFO3_RATE_MCS,
-			 __le32_to_cpu(rxd->msdu_start.info3));
+			 __le32_to_cpu(desc->msdu_start.info3));
 }
 
-static u8 ath11k_dp_rx_h_msdu_start_rx_bw(u8 *desc)
+static u8 ath11k_dp_rx_h_msdu_start_rx_bw(struct hal_rx_desc *desc)
 {
-	struct hal_rx_desc *rxd = (struct hal_rx_desc *)desc;
-
 	return FIELD_GET(RX_MSDU_START_INFO3_RECV_BW,
-			 __le32_to_cpu(rxd->msdu_start.info3));
+			 __le32_to_cpu(desc->msdu_start.info3));
 }
 
-static u8 ath11k_dp_rx_h_msdu_start_rssi(u8 *desc)
+static u8 ath11k_dp_rx_h_msdu_start_rssi(struct hal_rx_desc *desc)
 {
-	struct hal_rx_desc *rxd = (struct hal_rx_desc *)desc;
-
 	return FIELD_GET(RX_MSDU_START_INFO3_USER_RSSI,
-			 __le32_to_cpu(rxd->msdu_start.info3));
+			 __le32_to_cpu(desc->msdu_start.info3));
 }
 
-static u32 ath11k_dp_rx_h_msdu_start_freq(u8 *desc)
+static u32 ath11k_dp_rx_h_msdu_start_freq(struct hal_rx_desc *desc)
 {
-	struct hal_rx_desc *rxd = (struct hal_rx_desc *)desc;
-
-	return __le32_to_cpu(rxd->msdu_start.phy_meta_data);
+	return __le32_to_cpu(desc->msdu_start.phy_meta_data);
 }
 
-static u8 ath11k_dp_rx_h_msdu_start_pkt_type(u8 *desc)
+static u8 ath11k_dp_rx_h_msdu_start_pkt_type(struct hal_rx_desc *desc)
 {
-	struct hal_rx_desc *rxd = (struct hal_rx_desc *)desc;
-
 	return FIELD_GET(RX_MSDU_START_INFO3_PKT_TYPE,
-			 __le32_to_cpu(rxd->msdu_start.info3));
+			 __le32_to_cpu(desc->msdu_start.info3));
 }
 
-static u8 ath11k_dp_rx_h_msdu_start_nss(u8 *desc)
+static u8 ath11k_dp_rx_h_msdu_start_nss(struct hal_rx_desc *desc)
 {
-	struct hal_rx_desc *rxd = (struct hal_rx_desc *)desc;
 	u8 mimo_ss_bitmap = FIELD_GET(RX_MSDU_START_INFO3_MIMO_SS_BITMAP,
-				      __le32_to_cpu(rxd->msdu_start.info3));
+				      __le32_to_cpu(desc->msdu_start.info3));
 
 	return hweight8(mimo_ss_bitmap);
 }
 
-static u8 ath11k_dp_rx_h_msdu_end_l3pad(u8 *desc)
+static u8 ath11k_dp_rx_h_msdu_end_l3pad(struct hal_rx_desc *desc)
 {
-	struct hal_rx_desc *rxd = (struct hal_rx_desc *)desc;
-
 	return FIELD_GET(RX_MSDU_END_INFO2_L3_HDR_PADDING,
-			 __le32_to_cpu(rxd->msdu_end.info2));
+			 __le32_to_cpu(desc->msdu_end.info2));
 }
 
-static bool ath11k_dp_rx_h_msdu_end_first_msdu(u8 *desc)
+static bool ath11k_dp_rx_h_msdu_end_first_msdu(struct hal_rx_desc *desc)
 {
-	struct hal_rx_desc *rxd = (struct hal_rx_desc *)desc;
-
 	return !!FIELD_GET(RX_MSDU_END_INFO2_FIRST_MSDU,
-			   __le32_to_cpu(rxd->msdu_end.info2));
+			   __le32_to_cpu(desc->msdu_end.info2));
 }
 
-static bool ath11k_dp_rx_h_msdu_end_last_msdu(u8 *desc)
+static bool ath11k_dp_rx_h_msdu_end_last_msdu(struct hal_rx_desc *desc)
 {
-	struct hal_rx_desc *rxd = (struct hal_rx_desc *)desc;
-
 	return !!FIELD_GET(RX_MSDU_END_INFO2_LAST_MSDU,
-			   __le32_to_cpu(rxd->msdu_end.info2));
+			   __le32_to_cpu(desc->msdu_end.info2));
 }
 
-static void ath11k_dp_rx_desc_end_tlv_copy(u8 *first, u8 *last)
+static void ath11k_dp_rx_desc_end_tlv_copy(struct hal_rx_desc *fdesc,
+					   struct hal_rx_desc *ldesc)
 {
-	struct hal_rx_desc *fdesc = (struct hal_rx_desc *)first;
-	struct hal_rx_desc *ldesc = (struct hal_rx_desc *)last;
-
 	memcpy((u8 *)&fdesc->msdu_end, (u8 *)&ldesc->msdu_end,
 	       sizeof(struct rx_msdu_end));
 	memcpy((u8 *)&fdesc->attention, (u8 *)&ldesc->attention,
@@ -212,9 +172,8 @@ static void ath11k_dp_rx_desc_end_tlv_copy(u8 *first, u8 *last)
 	       sizeof(struct rx_mpdu_end));
 }
 
-static u32 ath11k_dp_rxdesc_get_mpdulen_err(void *hw_desc_addr)
+static u32 ath11k_dp_rxdesc_get_mpdulen_err(struct hal_rx_desc *rx_desc)
 {
-	struct hal_rx_desc *rx_desc = (struct hal_rx_desc *)hw_desc_addr;
 	struct rx_attention *rx_attn;
 
 	rx_attn = &rx_desc->attention;
@@ -223,9 +182,8 @@ static u32 ath11k_dp_rxdesc_get_mpdulen_err(void *hw_desc_addr)
 			 __le32_to_cpu(rx_attn->info1));
 }
 
-static u32 ath11k_dp_rxdesc_get_decap_format(void *hw_desc_addr)
+static u32 ath11k_dp_rxdesc_get_decap_format(struct hal_rx_desc *rx_desc)
 {
-	struct hal_rx_desc *rx_desc = (struct hal_rx_desc *)hw_desc_addr;
 	struct rx_msdu_start *rx_msdu_start;
 
 	rx_msdu_start = &rx_desc->msdu_start;
@@ -234,9 +192,8 @@ static u32 ath11k_dp_rxdesc_get_decap_format(void *hw_desc_addr)
 			 __le32_to_cpu(rx_msdu_start->info2));
 }
 
-static u8 *ath11k_dp_rxdesc_get_80211hdr(void *hw_desc_addr)
+static u8 *ath11k_dp_rxdesc_get_80211hdr(struct hal_rx_desc *rx_desc)
 {
-	struct hal_rx_desc *rx_desc = (struct hal_rx_desc *)hw_desc_addr;
 	u8 *rx_pkt_hdr;
 
 	rx_pkt_hdr = &rx_desc->msdu_payload[0];
@@ -244,9 +201,8 @@ static u8 *ath11k_dp_rxdesc_get_80211hdr(void *hw_desc_addr)
 	return rx_pkt_hdr;
 }
 
-static bool ath11k_dp_rxdesc_mpdu_valid(void *hw_desc_addr)
+static bool ath11k_dp_rxdesc_mpdu_valid(struct hal_rx_desc *rx_desc)
 {
-	struct hal_rx_desc *rx_desc = (struct hal_rx_desc *)hw_desc_addr;
 	u32 tlv_tag;
 
 	tlv_tag = FIELD_GET(HAL_TLV_HDR_TAG,
@@ -255,10 +211,8 @@ static bool ath11k_dp_rxdesc_mpdu_valid(void *hw_desc_addr)
 	return tlv_tag == HAL_RX_MPDU_START ? true : false;
 }
 
-static u32 ath11k_dp_rxdesc_get_ppduid(void *hw_desc_addr)
+static u32 ath11k_dp_rxdesc_get_ppduid(struct hal_rx_desc *rx_desc)
 {
-	struct hal_rx_desc *rx_desc = (struct hal_rx_desc *)hw_desc_addr;
-
 	return __le16_to_cpu(rx_desc->mpdu_start.phy_ppdu_id);
 }
 
@@ -1421,6 +1375,7 @@ static int ath11k_dp_rx_msdu_coalesce(struct ath11k *ar,
 {
 	struct sk_buff *skb;
 	struct ath11k_skb_rxcb *rxcb = ATH11K_SKB_RXCB(first);
+	struct hal_rx_desc *ldesc;
 	int space_extra;
 	int rem_len;
 	int buf_len;
@@ -1438,8 +1393,9 @@ static int ath11k_dp_rx_msdu_coalesce(struct ath11k *ar,
 		return 0;
 	}
 
-	rxcb->is_first_msdu = ath11k_dp_rx_h_msdu_end_first_msdu(last->data);
-	rxcb->is_last_msdu = ath11k_dp_rx_h_msdu_end_last_msdu(last->data);
+	ldesc = (struct hal_rx_desc *)last->data;
+	rxcb->is_first_msdu = ath11k_dp_rx_h_msdu_end_first_msdu(ldesc);
+	rxcb->is_last_msdu = ath11k_dp_rx_h_msdu_end_last_msdu(ldesc);
 
 	/* MSDU spans over multiple buffers because the length of the MSDU
 	 * exceeds DP_RX_BUFFER_SIZE - HAL_RX_DESC_SIZE. So assume the data
@@ -1466,7 +1422,7 @@ static int ath11k_dp_rx_msdu_coalesce(struct ath11k *ar,
 	/* When an MSDU spread over multiple buffers attention, MSDU_END and
 	 * MPDU_END tlvs are valid only in the last buffer. Copy those tlvs.
 	 */
-	ath11k_dp_rx_desc_end_tlv_copy(rxcb->rx_desc, last->data);
+	ath11k_dp_rx_desc_end_tlv_copy(rxcb->rx_desc, ldesc);
 
 	rem_len = msdu_len -
 		  (DP_RX_BUFFER_SIZE - HAL_RX_DESC_SIZE - l3pad_bytes);
@@ -1523,6 +1479,7 @@ static int ath11k_dp_rx_retrieve_amsdu(struct ath11k *ar,
 	struct sk_buff *last_buf;
 	struct ath11k_skb_rxcb *rxcb;
 	struct ieee80211_hdr *hdr;
+	struct hal_rx_desc *rx_desc, *lrx_desc;
 	u16 msdu_len;
 	u8 l3_pad_bytes;
 	u8 *hdr_status;
@@ -1531,7 +1488,8 @@ static int ath11k_dp_rx_retrieve_amsdu(struct ath11k *ar,
 	if (!msdu)
 		return -ENOENT;
 
-	hdr_status = ath11k_dp_rx_h_80211_hdr(msdu->data);
+	rx_desc = (struct hal_rx_desc *)msdu->data;
+	hdr_status = ath11k_dp_rx_h_80211_hdr(rx_desc);
 	hdr = (struct ieee80211_hdr *)hdr_status;
 	/* Process only data frames */
 	if (!ieee80211_is_data(hdr->frame_control)) {
@@ -1550,16 +1508,19 @@ static int ath11k_dp_rx_retrieve_amsdu(struct ath11k *ar,
 			goto free_out;
 		}
 
-		if (!ath11k_dp_rx_h_attn_msdu_done(last_buf->data)) {
+		rx_desc = (struct hal_rx_desc *)msdu->data;
+		lrx_desc = (struct hal_rx_desc *)last_buf->data;
+
+		if (!ath11k_dp_rx_h_attn_msdu_done(lrx_desc)) {
 			ath11k_warn(ar->ab, "msdu_done bit in attention is not set\n");
 			ret = -EIO;
 			goto free_out;
 		}
 
 		rxcb = ATH11K_SKB_RXCB(msdu);
-		rxcb->rx_desc = msdu->data;
-		msdu_len = ath11k_dp_rx_h_msdu_start_msdu_len(msdu->data);
-		l3_pad_bytes = ath11k_dp_rx_h_msdu_end_l3pad(last_buf->data);
+		rxcb->rx_desc = rx_desc;
+		msdu_len = ath11k_dp_rx_h_msdu_start_msdu_len(rx_desc);
+		l3_pad_bytes = ath11k_dp_rx_h_msdu_end_l3pad(lrx_desc);
 
 		if (!rxcb->is_continuation) {
 			skb_put(msdu, HAL_RX_DESC_SIZE + l3_pad_bytes + msdu_len);
@@ -1856,7 +1817,8 @@ static void ath11k_dp_rx_h_undecap_eth(struct ath11k *ar,
 }
 
 static void ath11k_dp_rx_h_undecap(struct ath11k *ar, struct sk_buff *msdu,
-				   u8 *rx_desc, enum hal_encrypt_type enctype,
+				   struct hal_rx_desc *rx_desc,
+				   enum hal_encrypt_type enctype,
 				   struct ieee80211_rx_status *status,
 				   bool decrypted)
 {
@@ -1887,7 +1849,7 @@ static void ath11k_dp_rx_h_undecap(struct ath11k *ar, struct sk_buff *msdu,
 
 static void ath11k_dp_rx_h_mpdu(struct ath11k *ar,
 				struct sk_buff_head *amsdu_list,
-				u8 *rx_desc,
+				struct hal_rx_desc *rx_desc,
 				struct ieee80211_rx_status *rx_status)
 {
 	struct ieee80211_hdr *hdr;
@@ -1945,7 +1907,7 @@ static void ath11k_dp_rx_h_mpdu(struct ath11k *ar,
 	}
 }
 
-static void ath11k_dp_rx_h_rate(struct ath11k *ar, void *rx_desc,
+static void ath11k_dp_rx_h_rate(struct ath11k *ar, struct hal_rx_desc *rx_desc,
 				struct ieee80211_rx_status *rx_status)
 {
 	struct ieee80211_supported_band *sband;
@@ -2007,7 +1969,7 @@ static void ath11k_dp_rx_h_rate(struct ath11k *ar, void *rx_desc,
 	}
 }
 
-static void ath11k_dp_rx_h_ppdu(struct ath11k *ar, void *rx_desc,
+static void ath11k_dp_rx_h_ppdu(struct ath11k *ar, struct hal_rx_desc *rx_desc,
 				struct ieee80211_rx_status *rx_status)
 {
 	u8 channel_num;
@@ -2049,7 +2011,7 @@ static void ath11k_dp_rx_process_amsdu(struct ath11k *ar,
 {
 	struct sk_buff *first;
 	struct ath11k_skb_rxcb *rxcb;
-	void *rx_desc;
+	struct hal_rx_desc *rx_desc;
 	bool first_mpdu;
 
 	if (skb_queue_empty(amsdu_list))
@@ -2726,7 +2688,7 @@ static int ath11k_dp_rx_link_desc_return(struct ath11k_base *ab,
 
 static void ath11k_dp_rx_frag_h_mpdu(struct ath11k *ar,
 				     struct sk_buff *msdu,
-				     u8 *rx_desc,
+				     struct hal_rx_desc *rx_desc,
 				     struct ieee80211_rx_status *rx_status)
 {
 	u8 rx_channel;
@@ -2787,7 +2749,7 @@ static void ath11k_dp_rx_frag_h_mpdu(struct ath11k *ar,
 	struct sk_buff *msdu;
 	struct ath11k_skb_rxcb *rxcb;
 	struct ieee80211_rx_status *status;
-	void *rx_desc;
+	struct hal_rx_desc *rx_desc;
 	u16 msdu_len;
 
 	spin_lock_bh(&rx_ring->idr_lock);
@@ -2826,7 +2788,7 @@ static void ath11k_dp_rx_frag_h_mpdu(struct ath11k *ar,
 		goto exit;
 	}
 
-	rx_desc = msdu->data;
+	rx_desc = (struct hal_rx_desc *)msdu->data;
 	msdu_len = ath11k_dp_rx_h_msdu_start_msdu_len(rx_desc);
 	skb_put(msdu, HAL_RX_DESC_SIZE + msdu_len);
 	skb_pull(msdu, HAL_RX_DESC_SIZE);
@@ -2983,7 +2945,7 @@ static int ath11k_dp_rx_h_null_q_desc(struct ath11k *ar, struct sk_buff *msdu,
 {
 	struct sk_buff_head amsdu_list;
 	u16 msdu_len;
-	u8 *desc = msdu->data;
+	struct hal_rx_desc *desc = (struct hal_rx_desc *)msdu->data;
 	u8 l3pad_bytes;
 	struct ath11k_skb_rxcb *rxcb = ATH11K_SKB_RXCB(msdu);
 
@@ -3067,7 +3029,7 @@ static void ath11k_dp_rx_h_tkip_mic_err(struct ath11k *ar, struct sk_buff *msdu,
 					struct ieee80211_rx_status *status)
 {
 	u16 msdu_len;
-	u8 *desc = msdu->data;
+	struct hal_rx_desc *desc = (struct hal_rx_desc *)msdu->data;
 	u8 l3pad_bytes;
 	struct ath11k_skb_rxcb *rxcb = ATH11K_SKB_RXCB(msdu);
 
@@ -3215,7 +3177,7 @@ int ath11k_dp_rx_process_wbm_err(struct ath11k_base *ab,
 
 		rxcb->err_rel_src = err_info.err_rel_src;
 		rxcb->err_code = err_info.err_code;
-		rxcb->rx_desc = msdu->data;
+		rxcb->rx_desc = (struct hal_rx_desc *)msdu->data;
 		__skb_queue_tail(&msdu_list[mac_id], msdu);
 	}
 
@@ -3679,7 +3641,7 @@ static void ath11k_dp_mon_get_buf_len(struct hal_rx_msdu_desc_info *info,
 	struct sk_buff *msdu = NULL, *last = NULL;
 	struct hal_rx_msdu_list msdu_list;
 	void *p_buf_addr_info, *p_last_buf_addr_info;
-	void *rx_desc;
+	struct hal_rx_desc *rx_desc;
 	void *rx_msdu_link_desc;
 	dma_addr_t paddr;
 	u16 num_msdus = 0;
@@ -3768,11 +3730,10 @@ static void ath11k_dp_mon_get_buf_len(struct hal_rx_msdu_desc_info *info,
 				goto next_msdu;
 			}
 			data = msdu->data;
-			rx_desc = msdu->data;
+			rx_desc = (struct hal_rx_desc *)msdu->data;
 
 			rx_pkt_offset = sizeof(struct hal_rx_desc);
-			l2_hdr_offset =
-				ath11k_dp_rx_h_msdu_end_l3pad(msdu->data);
+			l2_hdr_offset = ath11k_dp_rx_h_msdu_end_l3pad(rx_desc);
 
 			if (is_first_msdu) {
 				if (!ath11k_dp_rxdesc_mpdu_valid(rx_desc)) {
@@ -3844,7 +3805,7 @@ static void ath11k_dp_rx_msdus_set_payload(struct sk_buff *msdu)
 	u32 rx_pkt_offset, l2_hdr_offset;
 
 	rx_pkt_offset = sizeof(struct hal_rx_desc);
-	l2_hdr_offset = ath11k_dp_rx_h_msdu_end_l3pad(msdu->data);
+	l2_hdr_offset = ath11k_dp_rx_h_msdu_end_l3pad((struct hal_rx_desc *)msdu->data);
 	skb_pull(msdu, rx_pkt_offset + l2_hdr_offset);
 }
 
@@ -3856,7 +3817,7 @@ static void ath11k_dp_rx_msdus_set_payload(struct sk_buff *msdu)
 {
 	struct sk_buff *msdu, *mpdu_buf, *prev_buf;
 	u32 decap_format, wifi_hdr_len;
-	void *rx_desc;
+	struct hal_rx_desc *rx_desc;
 	char *hdr_desc;
 	u8 *dest;
 	struct ieee80211_hdr_3addr *wh;
@@ -3866,7 +3827,7 @@ static void ath11k_dp_rx_msdus_set_payload(struct sk_buff *msdu)
 	if (!head_msdu)
 		goto err_merge_fail;
 
-	rx_desc = head_msdu->data;
+	rx_desc = (struct hal_rx_desc *)head_msdu->data;
 
 	if (ath11k_dp_rxdesc_get_mpdulen_err(rx_desc))
 		return NULL;
@@ -3895,7 +3856,7 @@ static void ath11k_dp_rx_msdus_set_payload(struct sk_buff *msdu)
 		__le16 qos_field;
 		u8 qos_pkt = 0;
 
-		rx_desc = head_msdu->data;
+		rx_desc = (struct hal_rx_desc *)head_msdu->data;
 		hdr_desc = ath11k_dp_rxdesc_get_80211hdr(rx_desc);
 
 		/* Base size */
@@ -3912,7 +3873,7 @@ static void ath11k_dp_rx_msdus_set_payload(struct sk_buff *msdu)
 		msdu = head_msdu;
 
 		while (msdu) {
-			rx_desc = msdu->data;
+			rx_desc = (struct hal_rx_desc *)msdu->data;
 			hdr_desc = ath11k_dp_rxdesc_get_80211hdr(rx_desc);
 
 			if (qos_pkt) {
-- 
1.9.1


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
