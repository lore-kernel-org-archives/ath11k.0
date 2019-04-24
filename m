Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hJ5Qu-0007oP-Ak
 for ath11k@lists.infradead.org; Wed, 24 Apr 2019 00:06:42 +0000
From: Miles Hu <milehu@codeaurora.org>
Subject: [PATCH v2 5/6] ath11k: enable/disable monitor mode and destination
 ring entry process
Date: Tue, 23 Apr 2019 17:06:26 -0700
Message-Id: <1556064387-4668-6-git-send-email-milehu@codeaurora.org>
In-Reply-To: <1556064387-4668-1-git-send-email-milehu@codeaurora.org>
References: <1556064387-4668-1-git-send-email-milehu@codeaurora.org>
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

enable/disable monitor mode in mac.c.
fix bug in ring_peek function.
add destination ring entry process function.

Signed-off-by: Miles Hu <milehu@codeaurora.org>
---
V2:
 - Move to ath11k-bringup branch

 drivers/net/wireless/ath/ath11k/dp_rx.c  | 184 +++++++++++++++++++++++++++++++
 drivers/net/wireless/ath/ath11k/hal.c    |   2 +-
 drivers/net/wireless/ath/ath11k/hal_rx.c |  28 +++++
 drivers/net/wireless/ath/ath11k/mac.c    |  40 ++++++-
 4 files changed, 252 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index 216bccc..af59ca6 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -3384,6 +3384,190 @@ static inline void ath11k_dp_mon_get_buf_len(struct hal_rx_msdu_desc_info *info,
 	}
 }
 
+u32
+ath11k_dp_rx_mon_mpdu_pop(struct ath11k *ar,
+			  void *ring_entry, struct sk_buff **head_msdu,
+			  struct sk_buff **tail_msdu, u32 *npackets,
+			  u32 *ppdu_id)
+{
+	struct ath11k_pdev_dp *dp = &ar->dp;
+	struct ath11k_mon_data *pmon = (struct ath11k_mon_data *)&dp->mon_data;
+	struct dp_rxdma_ring *rx_ring = &dp->rxdma_mon_buf_ring;
+	struct sk_buff *msdu, *last;
+	struct hal_rx_msdu_list msdu_list;
+	void *p_buf_addr_info, *p_last_buf_addr_info;
+	void *rx_desc;
+	void *rx_msdu_link_desc;
+	dma_addr_t paddr;
+	u16 num_msdus = 0;
+	u32 rx_buf_size, rx_pkt_offset, sw_cookie;
+	u32 rx_bufs_used = 0, i = 0;
+	u32 msdu_ppdu_id = 0, msdu_cnt = 0;
+	u32 total_len = 0, frag_len = 0;
+	u8 *data = NULL;
+	bool is_frag, is_first_msdu;
+	bool drop_mpdu = false;
+	struct ath11k_skb_rxcb *rxcb;
+	struct hal_reo_entrance_ring *ent_desc =
+			(struct hal_reo_entrance_ring *)ring_entry;
+	int buf_id;
+
+	msdu = 0;
+	last = NULL;
+
+	ath11k_hal_rx_reo_ent_buf_paddr_get(ring_entry, &paddr,
+					    &sw_cookie, &p_last_buf_addr_info,
+					    &msdu_cnt);
+
+	if (FIELD_GET(HAL_REO_ENTR_RING_INFO1_RXDMA_PUSH_REASON,
+		      ent_desc->info1) ==
+		      HAL_REO_DEST_RING_PUSH_REASON_ERR_DETECTED) {
+		u8 rxdma_err =
+			FIELD_GET(HAL_REO_ENTR_RING_INFO1_RXDMA_ERROR_CODE,
+				  ent_desc->info1);
+		if (rxdma_err == HAL_REO_ENTR_RING_RXDMA_ECODE_FLUSH_REQUEST_ERR ||
+		    rxdma_err == HAL_REO_ENTR_RING_RXDMA_ECODE_MPDU_LEN_ERR ||
+		    rxdma_err == HAL_REO_ENTR_RING_RXDMA_ECODE_OVERFLOW_ERR) {
+			drop_mpdu = true;
+			pmon->rx_mon_stats.dest_mpdu_drop++;
+		}
+	}
+
+	is_frag = false;
+	is_first_msdu = true;
+
+	do {
+		if (pmon->mon_last_linkdesc_paddr == paddr) {
+			pmon->rx_mon_stats.dup_mon_linkdesc_cnt++;
+			return rx_bufs_used;
+		}
+
+		rx_msdu_link_desc =
+			(void *)pmon->link_desc_banks[sw_cookie].vaddr +
+			(paddr - pmon->link_desc_banks[sw_cookie].paddr);
+
+		ath11k_hal_rx_msdu_list_get(ar, rx_msdu_link_desc, &msdu_list,
+					    &num_msdus);
+
+		for (i = 0; i < num_msdus; i++) {
+			u32 l2_hdr_offset;
+
+			if (pmon->mon_last_buf_cookie == msdu_list.sw_cookie[i]) {
+				ath11k_dbg(ar->ab, ATH11K_DBG_DATA,
+					   "i %d last_cookie %d is same\n",
+					   i, pmon->mon_last_buf_cookie);
+				drop_mpdu = true;
+				pmon->rx_mon_stats.dup_mon_buf_cnt++;
+				continue;
+			}
+			buf_id = FIELD_GET(DP_RXDMA_BUF_COOKIE_BUF_ID,
+					   msdu_list.sw_cookie[i]);
+
+			spin_lock_bh(&rx_ring->idr_lock);
+			msdu = idr_find(&rx_ring->bufs_idr, buf_id);
+			spin_unlock_bh(&rx_ring->idr_lock);
+			if (!msdu) {
+				ath11k_dbg(ar->ab, ATH11K_DBG_DATA,
+					   "msdu_pop: invalid buf_id %d\n", buf_id);
+				break;
+			}
+			rxcb = ATH11K_SKB_RXCB(msdu);
+			if (!rxcb->unmapped) {
+				dma_unmap_single(ar->ab->dev, rxcb->paddr,
+						 msdu->len +
+						 skb_tailroom(msdu),
+						 DMA_FROM_DEVICE);
+				rxcb->unmapped = 1;
+			}
+			if (drop_mpdu) {
+				ath11k_dbg(ar->ab, ATH11K_DBG_DATA,
+					   "i %d drop msdu %p *ppdu_id %x\n",
+					   i, msdu, *ppdu_id);
+				dev_kfree_skb_any(msdu);
+				msdu = NULL;
+				goto next_msdu;
+			}
+			data = msdu->data;
+			rx_desc = msdu->data;
+
+			rx_pkt_offset = sizeof(struct hal_rx_desc);
+			l2_hdr_offset =
+				ath11k_dp_rx_h_msdu_end_l3pad(msdu->data);
+
+			if (is_first_msdu) {
+				if (!ath11k_dp_rxdesc_mpdu_valid(rx_desc)) {
+					drop_mpdu = true;
+					dev_kfree_skb_any(msdu);
+					msdu = NULL;
+					pmon->mon_last_linkdesc_paddr = paddr;
+					goto next_msdu;
+				}
+
+				msdu_ppdu_id =
+					ath11k_dp_rxdesc_get_ppduid(rx_desc);
+
+				if (ath11k_dp_rx_mon_comp_ppduid(msdu_ppdu_id,
+								 ppdu_id,
+								 &rx_bufs_used))
+					return rx_bufs_used;
+				pmon->mon_last_linkdesc_paddr = paddr;
+				is_first_msdu = false;
+			}
+			ath11k_dp_mon_get_buf_len(&msdu_list.msdu_info[i],
+						  &is_frag, &total_len,
+						  &frag_len, &msdu_cnt);
+			rx_buf_size = rx_pkt_offset + l2_hdr_offset + frag_len;
+
+			ath11k_dp_pkt_set_pktlen(msdu, rx_buf_size);
+
+			if (!(*head_msdu))
+				*head_msdu = msdu;
+			else if (last)
+				last->next = msdu;
+
+			last = msdu;
+next_msdu:
+			pmon->mon_last_buf_cookie = msdu_list.sw_cookie[i];
+			rx_bufs_used++;
+			spin_lock_bh(&rx_ring->idr_lock);
+			idr_remove(&rx_ring->bufs_idr, buf_id);
+			spin_unlock_bh(&rx_ring->idr_lock);
+		}
+
+		ath11k_dp_rx_mon_next_link_desc_get(rx_msdu_link_desc, &paddr,
+						    &sw_cookie,
+						    &p_buf_addr_info);
+
+		if (ath11k_dp_rx_monitor_link_desc_return(ar,
+							  p_last_buf_addr_info,
+							  dp->mac_id))
+			ath11k_dbg(ar->ab, ATH11K_DBG_DATA,
+				   "dp_rx_monitor_link_desc_return failed");
+
+		p_last_buf_addr_info = p_buf_addr_info;
+
+	} while (paddr && msdu_cnt);
+
+	if (last)
+		last->next = NULL;
+
+	*tail_msdu = msdu;
+
+	if (msdu_cnt == 0)
+		*npackets = 1;
+
+	return rx_bufs_used;
+}
+
+static inline void ath11k_dp_rx_msdus_set_payload(struct sk_buff *msdu)
+{
+	u32 rx_pkt_offset, l2_hdr_offset;
+
+	rx_pkt_offset = sizeof(struct hal_rx_desc);
+	l2_hdr_offset = ath11k_dp_rx_h_msdu_end_l3pad(msdu->data);
+	skb_pull(msdu, rx_pkt_offset + l2_hdr_offset);
+}
+
 int ath11k_dp_rx_pdev_mon_status_attach(struct ath11k *ar)
 {
 	struct ath11k_pdev_dp *dp = &ar->dp;
diff --git a/drivers/net/wireless/ath/ath11k/hal.c b/drivers/net/wireless/ath/ath11k/hal.c
index 6888349f..3fe8f81 100644
--- a/drivers/net/wireless/ath/ath11k/hal.c
+++ b/drivers/net/wireless/ath/ath11k/hal.c
@@ -706,7 +706,7 @@ u32 *ath11k_hal_srng_dst_peek(struct ath11k_base *ab, struct hal_srng *srng)
 	lockdep_assert_held(&srng->lock);
 
 	if (srng->u.dst_ring.tp != srng->u.dst_ring.cached_hp)
-		return ((void *)srng->ring_base_vaddr + srng->u.dst_ring.tp);
+		return (srng->ring_base_vaddr + srng->u.dst_ring.tp);
 
 	return NULL;
 }
diff --git a/drivers/net/wireless/ath/ath11k/hal_rx.c b/drivers/net/wireless/ath/ath11k/hal_rx.c
index 2bdb532..98e8bee 100644
--- a/drivers/net/wireless/ath/ath11k/hal_rx.c
+++ b/drivers/net/wireless/ath/ath11k/hal_rx.c
@@ -1201,3 +1201,31 @@ ath11k_hal_rx_parse_mon_status(struct ath11k_base *ab,
 
 	return hal_status;
 }
+
+void ath11k_hal_rx_reo_ent_buf_paddr_get(void *rx_desc, dma_addr_t *paddr,
+					 u32 *sw_cookie, void **pp_buf_addr,
+					 u32  *msdu_cnt)
+{
+	struct hal_reo_entrance_ring *reo_ent_ring =
+		(struct hal_reo_entrance_ring *)rx_desc;
+	struct buffer_addr *buf_addr_info;
+	struct rx_mpdu_desc *rx_mpdu_desc_info_details;
+
+	rx_mpdu_desc_info_details =
+			(struct rx_mpdu_desc *)&reo_ent_ring->rx_mpdu_info;
+
+	*msdu_cnt = FIELD_GET(RX_MPDU_DESC_INFO0_MSDU_COUNT,
+			      rx_mpdu_desc_info_details->info0);
+
+	buf_addr_info = (struct buffer_addr *)&reo_ent_ring->buf_addr_info;
+
+	*paddr = (((u64)FIELD_GET(BUFFER_ADDR_INFO1_ADDR,
+				  buf_addr_info->info1)) << 32) |
+			FIELD_GET(BUFFER_ADDR_INFO0_ADDR,
+				  buf_addr_info->info0);
+
+	*sw_cookie = FIELD_GET(BUFFER_ADDR_INFO1_SW_COOKIE,
+			       buf_addr_info->info1);
+
+	*pp_buf_addr = (void *)buf_addr_info;
+}
diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index ddb8beb..2561f1c 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -769,6 +769,21 @@ static void ath11k_peer_cleanup(struct ath11k *ar, u32 vdev_id)
 	spin_unlock_bh(&ab->data_lock);
 }
 
+static int ath11k_monitor_vdev_up(struct ath11k *ar, int vdev_id)
+{
+	int ret = 0;
+
+	ret = ath11k_wmi_vdev_up(ar, vdev_id, 0, ar->mac_addr);
+	if (ret) {
+		ath11k_warn(ar->ab, "failed to put up monitor vdev %i: %d\n",
+			    vdev_id, ret);
+		return ret;
+	}
+
+	ath11k_dbg(ar->ab, ATH11K_DBG_MAC, "mac monitor vdev %i started\n",
+		   vdev_id);
+	return 0;
+}
 static int ath11k_config(struct ieee80211_hw *hw, u32 changed)
 {
 	struct ath11k *ar = hw->priv;
@@ -3473,6 +3488,9 @@ static int ath11k_add_interface(struct ieee80211_hw *hw,
 	case NL80211_IFTYPE_AP:
 		arvif->vdev_type = WMI_VDEV_TYPE_AP;
 		break;
+	case NL80211_IFTYPE_MONITOR:
+		arvif->vdev_type = WMI_VDEV_TYPE_MONITOR;
+		break;
 	default:
 		WARN_ON(1);
 		break;
@@ -3678,6 +3696,7 @@ static void ath11k_remove_interface(struct ieee80211_hw *hw,
 
 	/* Recalc txpower for remaining vdev */
 	ath11k_mac_txpower_recalc(ar);
+	clear_bit(ATH11K_FLAG_MONITOR_ENABLED, &ar->monitor_flags);
 
 	/* TODO: recal traffic pause state based on the available vdevs */
 
@@ -3700,6 +3719,8 @@ static void ath11k_configure_filter(struct ieee80211_hw *hw,
 				    u64 multicast)
 {
 	struct ath11k *ar = hw->priv;
+	bool reset_flag = false;
+	int ret = 0;
 
 	mutex_lock(&ar->conf_mutex);
 
@@ -3707,8 +3728,19 @@ static void ath11k_configure_filter(struct ieee80211_hw *hw,
 	*total_flags &= SUPPORTED_FILTERS;
 	ar->filter_flags = *total_flags;
 
-	/* TODO: Send filter configuration to target as appropriate */
+	/* For monitor mode */
+	reset_flag = !(ar->filter_flags & FIF_BCN_PRBRESP_PROMISC);
 
+	ret = ath11k_dp_htt_monitor_mode_ring_config(ar, reset_flag);
+	if (!ret) {
+		if (!reset_flag)
+			set_bit(ATH11K_FLAG_MONITOR_ENABLED, &ar->monitor_flags);
+		else
+			clear_bit(ATH11K_FLAG_MONITOR_ENABLED, &ar->monitor_flags);
+	} else {
+		ath11k_warn(ar->ab,
+			    "fail to set monitor filter: %d\n", ret);
+	}
 	mutex_unlock(&ar->conf_mutex);
 }
 
@@ -4153,6 +4185,11 @@ ath11k_mac_op_assign_vif_chanctx(struct ieee80211_hw *hw,
 			    ctx->def.chan->center_freq, ret);
 		goto err;
 	}
+	if (arvif->vdev_type == WMI_VDEV_TYPE_MONITOR) {
+		ret = ath11k_monitor_vdev_up(ar, arvif->vdev_id);
+		if (ret)
+			goto err;
+	}
 
 	arvif->is_started = true;
 
@@ -5061,6 +5098,7 @@ int ath11k_mac_create(struct ath11k_base *ab)
 
 		INIT_WORK(&ar->wmi_mgmt_tx_work, ath11k_mgmt_over_wmi_tx_work);
 		skb_queue_head_init(&ar->wmi_mgmt_tx_queue);
+		clear_bit(ATH11K_FLAG_MONITOR_ENABLED, &ar->monitor_flags);
 
 		ret = ath11k_mac_register(ar);
 		if (ret) {
-- 
2.7.4


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
