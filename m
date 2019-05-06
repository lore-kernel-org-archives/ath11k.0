Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hNf1E-0001tP-Mh
 for ath11k@lists.infradead.org; Mon, 06 May 2019 14:55:06 +0000
From: Miles Hu <milehu@codeaurora.org>
Subject: [PATCH v3 2/6] ath11k: monitor filter set function
Date: Mon,  6 May 2019 07:54:52 -0700
Message-Id: <1557154496-12059-3-git-send-email-milehu@codeaurora.org>
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

create monitor mode filter.
implement htt filter set function.
create common function to get htt ring id and type.

Signed-off-by: Miles Hu <milehu@codeaurora.org>
---
V2:
 - Move to ath11k-bringup branch

 drivers/net/wireless/ath/ath11k/dp_tx.c | 179 +++++++++++++++++++-------------
 1 file changed, 107 insertions(+), 72 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/dp_tx.c b/drivers/net/wireless/ath/ath11k/dp_tx.c
index 86e9d01..ffef794 100644
--- a/drivers/net/wireless/ath/ath11k/dp_tx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_tx.c
@@ -553,30 +553,15 @@ int ath11k_dp_send_reo_cmd(struct ath11k_base *ab, struct dp_rx_tid *rx_tid,
 	return 0;
 }
 
-int ath11k_dp_htt_srng_setup(struct ath11k_base *ab, u32 ring_id,
-			     int mac_id, enum hal_ring_type ring_type)
+static int
+ath11k_dp_get_ring_id_type(struct ath11k_base *ab,
+			   int mac_id, u32 ring_id,
+			   enum hal_ring_type ring_type,
+			   enum htt_srng_ring_type *htt_ring_type,
+			   enum htt_srng_ring_id *htt_ring_id)
 {
-	struct htt_srng_setup_cmd *cmd;
-	struct hal_srng *srng = &ab->hal.srng_list[ring_id];
-	struct hal_srng_params params;
-	struct sk_buff *skb;
-	int ring_entry_sz;
-	int len = sizeof(*cmd);
-	dma_addr_t hp_addr, tp_addr;
-	int lmac_ring_id_offset;
-	enum htt_srng_ring_type htt_ring_type;
-	enum htt_srng_ring_id htt_ring_id;
-	int ret;
-
-	skb = ath11k_htc_alloc_skb(ab, len);
-	if (!skb)
-		return -ENOMEM;
-
-	memset(&params, 0, sizeof(params));
-	ath11k_hal_srng_get_params(ab, srng, &params);
-
-	hp_addr = ath11k_hal_srng_get_hp_addr(ab, srng);
-	tp_addr = ath11k_hal_srng_get_tp_addr(ab, srng);
+	int lmac_ring_id_offset = 0;
+	int ret = 0;
 
 	switch (ring_type) {
 	case HAL_RXDMA_BUF:
@@ -586,37 +571,66 @@ int ath11k_dp_htt_srng_setup(struct ath11k_base *ab, u32 ring_id,
 		    ring_id == (HAL_SRNG_RING_ID_WMAC1_SW2RXDMA1_BUF +
 				lmac_ring_id_offset))) {
 			ret = -EINVAL;
-			goto err_free;
 		}
-
-		htt_ring_id = HTT_RXDMA_HOST_BUF_RING;
-		htt_ring_type = HTT_SW_TO_HW_RING;
+		*htt_ring_id = HTT_RXDMA_HOST_BUF_RING;
+		*htt_ring_type = HTT_SW_TO_HW_RING;
 		break;
 	case HAL_RXDMA_DST:
-		htt_ring_id = HTT_RXDMA_NON_MONITOR_DEST_RING;
-		htt_ring_type = HTT_HW_TO_SW_RING;
+		*htt_ring_id = HTT_RXDMA_NON_MONITOR_DEST_RING;
+		*htt_ring_type = HTT_HW_TO_SW_RING;
 		break;
 	case HAL_RXDMA_MONITOR_BUF:
-		htt_ring_id = HTT_RXDMA_MONITOR_BUF_RING;
-		htt_ring_type = HTT_SW_TO_HW_RING;
+		*htt_ring_id = HTT_RXDMA_MONITOR_BUF_RING;
+		*htt_ring_type = HTT_SW_TO_HW_RING;
 		break;
 	case HAL_RXDMA_MONITOR_STATUS:
-		htt_ring_id = HTT_RXDMA_MONITOR_STATUS_RING;
-		htt_ring_type = HTT_SW_TO_HW_RING;
+		*htt_ring_id = HTT_RXDMA_MONITOR_STATUS_RING;
+		*htt_ring_type = HTT_SW_TO_HW_RING;
 		break;
 	case HAL_RXDMA_MONITOR_DST:
-		htt_ring_id = HTT_RXDMA_MONITOR_DEST_RING;
-		htt_ring_type = HTT_HW_TO_SW_RING;
+		*htt_ring_id = HTT_RXDMA_MONITOR_DEST_RING;
+		*htt_ring_type = HTT_HW_TO_SW_RING;
 		break;
 	case HAL_RXDMA_MONITOR_DESC:
-		htt_ring_id = HTT_RXDMA_MONITOR_DESC_RING;
-		htt_ring_type = HTT_SW_TO_HW_RING;
+		*htt_ring_id = HTT_RXDMA_MONITOR_DESC_RING;
+		*htt_ring_type = HTT_SW_TO_HW_RING;
 		break;
 	default:
 		ath11k_warn(ab, "Unsupported ring type in DP :%d\n", ring_type);
 		ret = -EINVAL;
-		goto err_free;
 	}
+	return ret;
+}
+
+int ath11k_dp_htt_srng_setup(struct ath11k_base *ab, u32 ring_id,
+			     int mac_id, enum hal_ring_type ring_type)
+{
+	struct htt_srng_setup_cmd *cmd;
+	struct hal_srng *srng = &ab->hal.srng_list[ring_id];
+	struct hal_srng_params params;
+	struct sk_buff *skb;
+	u32 ring_entry_sz;
+	int len = sizeof(*cmd);
+	dma_addr_t hp_addr, tp_addr;
+	int lmac_ring_id_offset;
+	enum htt_srng_ring_type htt_ring_type;
+	enum htt_srng_ring_id htt_ring_id;
+	int ret = 0;
+
+	skb = ath11k_htc_alloc_skb(ab, len);
+	if (!skb)
+		return -ENOMEM;
+
+	memset(&params, 0, sizeof(params));
+	ath11k_hal_srng_get_params(ab, srng, &params);
+
+	hp_addr = ath11k_hal_srng_get_hp_addr(ab, srng);
+	tp_addr = ath11k_hal_srng_get_tp_addr(ab, srng);
+
+	if (ath11k_dp_get_ring_id_type(ab, mac_id, ring_id,
+				       ring_type, &htt_ring_type,
+				       &htt_ring_id))
+		goto err_free;
 
 	skb_put(skb, len);
 	cmd = (struct htt_srng_setup_cmd *)skb->data;
@@ -784,7 +798,7 @@ int ath11k_dp_htt_rx_filter_setup(struct ath11k_base *ab, u32 ring_id,
 	int len = sizeof(*cmd);
 	enum htt_srng_ring_type htt_ring_type;
 	enum htt_srng_ring_id htt_ring_id;
-	int ret;
+	int ret = 0;
 
 	skb = ath11k_htc_alloc_skb(ab, len);
 	if (!skb)
@@ -793,36 +807,10 @@ int ath11k_dp_htt_rx_filter_setup(struct ath11k_base *ab, u32 ring_id,
 	memset(&params, 0, sizeof(params));
 	ath11k_hal_srng_get_params(ab, srng, &params);
 
-	switch (ring_type) {
-	case HAL_RXDMA_BUF:
-		htt_ring_id = HTT_RXDMA_HOST_BUF_RING;
-		htt_ring_type = HTT_SW_TO_HW_RING;
-		break;
-	case HAL_RXDMA_DST:
-		htt_ring_id = HTT_RXDMA_NON_MONITOR_DEST_RING;
-		htt_ring_type = HTT_HW_TO_SW_RING;
-		break;
-	case HAL_RXDMA_MONITOR_BUF:
-		htt_ring_id = HTT_RXDMA_MONITOR_BUF_RING;
-		htt_ring_type = HTT_SW_TO_HW_RING;
-		break;
-	case HAL_RXDMA_MONITOR_STATUS:
-		htt_ring_id = HTT_RXDMA_MONITOR_STATUS_RING;
-		htt_ring_type = HTT_SW_TO_HW_RING;
-		break;
-	case HAL_RXDMA_MONITOR_DST:
-		htt_ring_id = HTT_RXDMA_MONITOR_DEST_RING;
-		htt_ring_type = HTT_HW_TO_SW_RING;
-		break;
-	case HAL_RXDMA_MONITOR_DESC:
-		htt_ring_id = HTT_RXDMA_MONITOR_DESC_RING;
-		htt_ring_type = HTT_SW_TO_HW_RING;
-		break;
-	default:
-		ath11k_warn(ab, "Unsupported ring type in DP :%d\n", ring_type);
-		ret = -EINVAL;
+	if (ath11k_dp_get_ring_id_type(ab, mac_id, ring_id,
+				       ring_type, &htt_ring_type,
+				       &htt_ring_id))
 		goto err_free;
-	}
 
 	skb_put(skb, len);
 	cmd = (struct htt_rx_ring_selection_cfg_cmd *)skb->data;
@@ -830,11 +818,13 @@ int ath11k_dp_htt_rx_filter_setup(struct ath11k_base *ab, u32 ring_id,
 				HTT_H2T_MSG_TYPE_RX_RING_SELECTION_CFG);
 	if (htt_ring_type == HTT_SW_TO_HW_RING ||
 	    htt_ring_type == HTT_HW_TO_SW_RING)
-		cmd->info0 |= FIELD_PREP(HTT_RX_RING_SELECTION_CFG_CMD_INFO0_PDEV_ID,
-					 DP_SW2HW_MACID(mac_id));
+		cmd->info0 |=
+			FIELD_PREP(HTT_RX_RING_SELECTION_CFG_CMD_INFO0_PDEV_ID,
+				   DP_SW2HW_MACID(mac_id));
 	else
-		cmd->info0 |= FIELD_PREP(HTT_RX_RING_SELECTION_CFG_CMD_INFO0_PDEV_ID,
-					 mac_id);
+		cmd->info0 |=
+			FIELD_PREP(HTT_RX_RING_SELECTION_CFG_CMD_INFO0_PDEV_ID,
+				   mac_id);
 	cmd->info0 |= FIELD_PREP(HTT_RX_RING_SELECTION_CFG_CMD_INFO0_RING_ID,
 				 htt_ring_id);
 	cmd->info0 |= FIELD_PREP(HTT_RX_RING_SELECTION_CFG_CMD_INFO0_SS,
@@ -903,3 +893,48 @@ int ath11k_dp_htt_h2t_ext_stats_req(struct ath11k *ar, u8 type,
 
 	return 0;
 }
+
+int ath11k_dp_htt_monitor_mode_ring_config(struct ath11k *ar, bool reset)
+{
+	struct ath11k_pdev_dp *dp = &ar->dp;
+	struct htt_rx_ring_tlv_filter tlv_filter = {0};
+	int ret = 0, ring_id = 0;
+
+	ring_id = dp->rxdma_mon_buf_ring.refill_buf_ring.ring_id;
+
+	if (!reset) {
+		tlv_filter.rx_filter = HTT_RX_MON_FILTER_TLV_FLAGS_MON_BUF_RING;
+		tlv_filter.pkt_filter_flags0 =
+					HTT_RX_MON_FP_MGMT_FILTER_FLAGS0 |
+					HTT_RX_MON_MO_MGMT_FILTER_FLAGS0;
+		tlv_filter.pkt_filter_flags1 =
+					HTT_RX_MON_FP_MGMT_FILTER_FLAGS1 |
+					HTT_RX_MON_MO_MGMT_FILTER_FLAGS1;
+		tlv_filter.pkt_filter_flags2 =
+					HTT_RX_MON_FP_CTRL_FILTER_FLASG2 |
+					HTT_RX_MON_MO_CTRL_FILTER_FLASG2;
+		tlv_filter.pkt_filter_flags3 =
+					HTT_RX_MON_FP_CTRL_FILTER_FLASG3 |
+					HTT_RX_MON_MO_CTRL_FILTER_FLASG3 |
+					HTT_RX_MON_FP_DATA_FILTER_FLASG3 |
+					HTT_RX_MON_MO_DATA_FILTER_FLASG3;
+	}
+
+	ret = ath11k_dp_htt_rx_filter_setup(ar->ab, ring_id, dp->mac_id,
+					    HAL_RXDMA_MONITOR_BUF,
+					    DP_RXDMA_REFILL_RING_SIZE,
+					    &tlv_filter);
+	if (ret)
+		return ret;
+
+	ring_id = dp->rx_mon_status_refill_ring.refill_buf_ring.ring_id;
+	if (!reset)
+		tlv_filter.rx_filter =
+				HTT_RX_MON_FILTER_TLV_FLAGS_MON_STATUS_RING;
+
+	ret = ath11k_dp_htt_rx_filter_setup(ar->ab, ring_id, dp->mac_id,
+					    HAL_RXDMA_MONITOR_STATUS,
+					    DP_RXDMA_REFILL_RING_SIZE,
+					    &tlv_filter);
+	return ret;
+}
-- 
2.7.4


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
