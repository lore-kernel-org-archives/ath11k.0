Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hJ5Qw-0007p8-3P
 for ath11k@lists.infradead.org; Wed, 24 Apr 2019 00:06:43 +0000
From: Miles Hu <milehu@codeaurora.org>
Subject: [PATCH v2 6/6] ath11k: merge msdu tlv process and status/destination
 ring process
Date: Tue, 23 Apr 2019 17:06:27 -0700
Message-Id: <1556064387-4668-7-git-send-email-milehu@codeaurora.org>
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

merge msdu list and process status.
deliver mpdu to upper layer.
process tlv in rx descriptor.
status/destination ring process function.

Signed-off-by: Miles Hu <milehu@codeaurora.org>
---
V2:
 - Move to ath11k-bringup branch

 drivers/net/wireless/ath/ath11k/dp_rx.c | 293 +++++++++++++++++++++++++++++++-
 1 file changed, 292 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index af59ca6..f14c873 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -3384,7 +3384,7 @@ static inline void ath11k_dp_mon_get_buf_len(struct hal_rx_msdu_desc_info *info,
 	}
 }
 
-u32
+static u32
 ath11k_dp_rx_mon_mpdu_pop(struct ath11k *ar,
 			  void *ring_entry, struct sk_buff **head_msdu,
 			  struct sk_buff **tail_msdu, u32 *npackets,
@@ -3568,6 +3568,297 @@ static inline void ath11k_dp_rx_msdus_set_payload(struct sk_buff *msdu)
 	skb_pull(msdu, rx_pkt_offset + l2_hdr_offset);
 }
 
+static inline struct sk_buff *
+ath11k_dp_rx_mon_merg_msdus(struct ath11k *ar,
+			    u32 mac_id, struct sk_buff *head_msdu,
+			    struct sk_buff *last_msdu,
+			    struct ieee80211_rx_status *rxs)
+{
+	struct sk_buff *msdu, *mpdu_buf, *prev_buf;
+	u32 decap_format, wifi_hdr_len;
+	void *rx_desc;
+	char *hdr_desc;
+	u8 *dest;
+	struct ieee80211_hdr_3addr *wh;
+
+	mpdu_buf = NULL;
+
+	if (!head_msdu)
+		goto err_merge_fail;
+
+	rx_desc = head_msdu->data;
+
+	if (ath11k_dp_rxdesc_get_mpdulen_err(rx_desc))
+		return NULL;
+
+	decap_format = ath11k_dp_rxdesc_get_decap_format(rx_desc);
+
+	ath11k_dp_rx_h_ppdu(ar, rx_desc, rxs);
+
+	if (decap_format == DP_RX_DECAP_TYPE_RAW) {
+		ath11k_dp_rx_msdus_set_payload(head_msdu);
+
+		prev_buf = head_msdu;
+		msdu = head_msdu->next;
+
+		while (msdu) {
+			ath11k_dp_rx_msdus_set_payload(msdu);
+
+			prev_buf = msdu;
+			msdu = msdu->next;
+		}
+
+		prev_buf->next = NULL;
+
+		skb_trim(prev_buf, prev_buf->len - HAL_RX_FCS_LEN);
+	}	else if (decap_format == DP_RX_DECAP_TYPE_NATIVE_WIFI) {
+		__le16 qos_field;
+		u8 qos_pkt = 0;
+
+		rx_desc = head_msdu->data;
+		hdr_desc = ath11k_dp_rxdesc_get_80211hdr(rx_desc);
+
+		/* Base size */
+		wifi_hdr_len = sizeof(struct ieee80211_hdr_3addr);
+		wh = (struct ieee80211_hdr_3addr *)hdr_desc;
+
+		if (ieee80211_is_data_qos(wh->frame_control)) {
+			struct ieee80211_qos_hdr *qwh =
+					(struct ieee80211_qos_hdr *)hdr_desc;
+
+			qos_field = qwh->qos_ctrl;
+			qos_pkt = 1;
+		}
+		msdu = head_msdu;
+
+		while (msdu) {
+			rx_desc = msdu->data;
+			hdr_desc = ath11k_dp_rxdesc_get_80211hdr(rx_desc);
+
+			if (qos_pkt) {
+				dest = skb_push(msdu, sizeof(__le16));
+				if (!dest)
+					goto err_merge_fail;
+				memcpy(dest, hdr_desc, wifi_hdr_len);
+				memcpy(dest + wifi_hdr_len,
+				       (u8 *)&qos_field, sizeof(__le16));
+			}
+			ath11k_dp_rx_msdus_set_payload(msdu);
+			prev_buf = msdu;
+			msdu = msdu->next;
+		}
+		dest = skb_put(prev_buf, HAL_RX_FCS_LEN);
+		if (!dest)
+			goto err_merge_fail;
+
+		ath11k_dbg(ar->ab, ATH11K_DBG_DATA,
+			   "mpdu_buf %pK mpdu_buf->len %u",
+			   prev_buf, prev_buf->len);
+	} else {
+		ath11k_dbg(ar->ab, ATH11K_DBG_DATA,
+			   "decap format %d is not supported!\n",
+			   decap_format);
+		goto err_merge_fail;
+	}
+
+	return head_msdu;
+
+err_merge_fail:
+	if (mpdu_buf && decap_format != DP_RX_DECAP_TYPE_RAW) {
+		ath11k_dbg(ar->ab, ATH11K_DBG_DATA,
+			   "err_merge_fail mpdu_buf %pK", mpdu_buf);
+		/* Free the head buffer */
+		dev_kfree_skb_any(mpdu_buf);
+	}
+	return NULL;
+}
+
+int ath11k_dp_rx_mon_deliver(struct ath11k *ar, u32 mac_id,
+			     struct sk_buff *head_msdu,
+			     struct sk_buff *tail_msdu,
+			     struct napi_struct *napi)
+{
+	struct ath11k_pdev_dp *dp = &ar->dp;
+	struct sk_buff *mon_skb, *skb_next, *header;
+	struct ieee80211_rx_status *rxs = &dp->rx_status, *status;
+
+	mon_skb = ath11k_dp_rx_mon_merg_msdus(ar, mac_id, head_msdu,
+					      tail_msdu, rxs);
+
+	if (!mon_skb)
+		goto mon_deliver_fail;
+
+	header = mon_skb;
+
+	do {
+		skb_next = mon_skb->next;
+		if (!skb_next)
+			rxs->flag &= ~RX_FLAG_AMSDU_MORE;
+		else
+			rxs->flag |= RX_FLAG_AMSDU_MORE;
+
+		if (mon_skb == header) {
+			header = NULL;
+			rxs->flag &= ~RX_FLAG_ALLOW_SAME_PN;
+		} else {
+			rxs->flag |= RX_FLAG_ALLOW_SAME_PN;
+		}
+		rxs->flag |= RX_FLAG_ONLY_MONITOR;
+
+		status = IEEE80211_SKB_RXCB(mon_skb);
+		*status = *rxs;
+
+		ath11k_dp_rx_deliver_msdu(ar, napi, mon_skb);
+		mon_skb = skb_next;
+	} while (mon_skb && (mon_skb != tail_msdu));
+
+	return 0;
+
+mon_deliver_fail:
+	mon_skb = head_msdu;
+	while (mon_skb) {
+		skb_next = mon_skb->next;
+		dev_kfree_skb_any(mon_skb);
+		mon_skb = skb_next;
+	}
+	return -EINVAL;
+}
+
+void ath11k_dp_rx_mon_dest_process(struct ath11k *ar, u32 quota,
+				   struct napi_struct *napi)
+{
+	struct ath11k_pdev_dp *dp = &ar->dp;
+	struct ath11k_mon_data *pmon = (struct ath11k_mon_data *)&dp->mon_data;
+	void *ring_entry;
+	void *mon_dst_srng;
+	u32 ppdu_id;
+	u32 rx_bufs_used;
+	struct ath11k_pdev_mon_stats *rx_mon_stats;
+	u32	 npackets = 0;
+
+	mon_dst_srng = &ar->ab->hal.srng_list[dp->rxdma_mon_dst_ring.ring_id];
+
+	if (!mon_dst_srng) {
+		ath11k_warn(ar->ab,
+			    "HAL Monitor Destination Ring Init Failed -- %pK",
+			    mon_dst_srng);
+		return;
+	}
+
+	spin_lock_bh(&pmon->mon_lock);
+
+	ath11k_hal_srng_access_begin(ar->ab, mon_dst_srng);
+
+	ppdu_id = pmon->mon_ppdu_info.ppdu_id;
+	rx_bufs_used = 0;
+	rx_mon_stats = &pmon->rx_mon_stats;
+
+	while ((ring_entry = ath11k_hal_srng_dst_peek(ar->ab, mon_dst_srng))) {
+		struct sk_buff *head_msdu, *tail_msdu;
+
+		head_msdu = NULL;
+		tail_msdu = NULL;
+
+		rx_bufs_used += ath11k_dp_rx_mon_mpdu_pop(ar, ring_entry,
+							  &head_msdu,
+							  &tail_msdu,
+							  &npackets, &ppdu_id);
+
+		if (ppdu_id != pmon->mon_ppdu_info.ppdu_id) {
+			pmon->mon_ppdu_status = DP_PPDU_STATUS_START;
+			ath11k_dbg(ar->ab, ATH11K_DBG_DATA,
+				   "dest_rx: new ppdu_id %x != status ppdu_id %x",
+				   ppdu_id, pmon->mon_ppdu_info.ppdu_id);
+			break;
+		}
+		if (head_msdu && tail_msdu) {
+			ath11k_dp_rx_mon_deliver(ar, dp->mac_id, head_msdu,
+						 tail_msdu, napi);
+			rx_mon_stats->dest_mpdu_done++;
+		}
+
+		ring_entry = ath11k_hal_srng_dst_get_next_entry(ar->ab,
+								mon_dst_srng);
+	}
+	ath11k_hal_srng_access_end(ar->ab, mon_dst_srng);
+
+	spin_unlock_bh(&pmon->mon_lock);
+
+	if (rx_bufs_used) {
+		rx_mon_stats->dest_ppdu_done++;
+		ath11k_dp_rxbufs_replenish(ar->ab, dp->mac_id,
+					   &dp->rxdma_mon_buf_ring,
+					   rx_bufs_used,
+					   HAL_RX_BUF_RBM_SW3_BM, GFP_ATOMIC);
+	}
+}
+
+static inline void ath11k_dp_rx_mon_status_process_tlv(struct ath11k *ar,
+						       u32 quota,
+						       struct napi_struct *napi)
+{
+	struct ath11k_pdev_dp *dp = &ar->dp;
+	struct ath11k_mon_data *pmon = (struct ath11k_mon_data *)&dp->mon_data;
+	struct hal_rx_mon_ppdu_info *ppdu_info;
+	struct sk_buff *status_skb;
+	u8 *rx_tlv;
+	u8 *rx_tlv_start;
+	u32 tlv_status = HAL_TLV_STATUS_BUF_DONE;
+	struct ath11k_pdev_mon_stats *rx_mon_stats;
+
+	ppdu_info = &pmon->mon_ppdu_info;
+	rx_mon_stats = &pmon->rx_mon_stats;
+
+	if (pmon->mon_ppdu_status != DP_PPDU_STATUS_START)
+		return;
+
+	while (!skb_queue_empty(&pmon->rx_status_q)) {
+		status_skb = skb_dequeue(&pmon->rx_status_q);
+
+		rx_tlv = status_skb->data;
+		rx_tlv_start = rx_tlv;
+
+		tlv_status = ath11k_hal_rx_parse_mon_status(ar->ab, ppdu_info,
+							    rx_tlv);
+		if (tlv_status == HAL_TLV_STATUS_PPDU_DONE) {
+			rx_mon_stats->status_ppdu_done++;
+			pmon->mon_ppdu_status = DP_PPDU_STATUS_DONE;
+			ath11k_dp_rx_mon_dest_process(ar, quota, napi);
+			pmon->mon_ppdu_status = DP_PPDU_STATUS_START;
+		}
+		dev_kfree_skb_any(status_skb);
+	}
+}
+
+int ath11k_dp_mon_process_rx(struct ath11k_base *ab, int mac_id,
+			     struct napi_struct *napi, int budget)
+{
+	struct ath11k *ar = ab->pdevs[mac_id].ar;
+	struct ath11k_pdev_dp *dp = &ar->dp;
+	struct ath11k_mon_data *pmon = (struct ath11k_mon_data *)&dp->mon_data;
+	int num_buffs_reaped = 0;
+
+	num_buffs_reaped = ath11k_dp_rx_reap_mon_status_ring(ar->ab, dp->mac_id, &budget,
+							     &pmon->rx_status_q);
+	if (num_buffs_reaped)
+		ath11k_dp_rx_mon_status_process_tlv(ar, budget, napi);
+
+	return num_buffs_reaped;
+}
+
+int ath11k_dp_rx_process_mon_rings(struct ath11k_base *ab, int mac_id,
+				   struct napi_struct *napi, int budget)
+{
+	struct ath11k *ar = ab->pdevs[mac_id].ar;
+	int ret = 0;
+
+	if (test_bit(ATH11K_FLAG_MONITOR_ENABLED, &ar->monitor_flags))
+		ret = ath11k_dp_mon_process_rx(ab, mac_id, napi, budget);
+	else
+		ret = ath11k_dp_rx_process_mon_status(ab, mac_id, napi, budget);
+	return ret;
+}
+
 int ath11k_dp_rx_pdev_mon_status_attach(struct ath11k *ar)
 {
 	struct ath11k_pdev_dp *dp = &ar->dp;
-- 
2.7.4


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
