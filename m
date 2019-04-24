Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hJ5Qt-0007nm-8I
 for ath11k@lists.infradead.org; Wed, 24 Apr 2019 00:06:40 +0000
From: Miles Hu <milehu@codeaurora.org>
Subject: [PATCH v2 4/6] ath11k: monitor mode attach/detach
Date: Tue, 23 Apr 2019 17:06:25 -0700
Message-Id: <1556064387-4668-5-git-send-email-milehu@codeaurora.org>
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

create monitor mode attach/detach function.
call attach/detach functions in pdev alloc/free.
add monitor napi function.

Signed-off-by: Miles Hu <milehu@codeaurora.org>
---
V2:
 - Move to ath11k-bringup branch

 drivers/net/wireless/ath/ath11k/dp.c    |  22 +++++
 drivers/net/wireless/ath/ath11k/dp_rx.c | 153 ++++++++++++++++++++++++++++++++
 2 files changed, 175 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/dp.c b/drivers/net/wireless/ath/ath11k/dp.c
index 5fa01c1..15bb27c 100644
--- a/drivers/net/wireless/ath/ath11k/dp.c
+++ b/drivers/net/wireless/ath/ath11k/dp.c
@@ -648,6 +648,21 @@ int ath11k_dp_service_srng(struct ath11k_base *ab,
 		}
 	}
 
+	if (rx_mon_status_ring_mask[grp_id]) {
+		for (i = 0; i <  ab->num_radios; i++) {
+			if (rx_mon_status_ring_mask[grp_id] & BIT(i)) {
+				work_done =
+				ath11k_dp_rx_process_mon_rings(ab,
+							       i, napi,
+							       budget);
+				budget -= work_done;
+				tot_work_done += work_done;
+			}
+			if (budget <= 0)
+				goto done;
+		}
+	}
+
 	if (ath11k_reo_status_ring_mask[grp_id])
 		ath11k_dp_process_reo_status(ab);
 
@@ -685,6 +700,7 @@ void ath11k_dp_pdev_free(struct ath11k_base *ab)
 		ar = ab->pdevs[i].ar;
 		ath11k_dp_rx_pdev_free(ab, i);
 		ath11k_debug_unregister(ar);
+		ath11k_dp_rx_pdev_mon_detach(ar);
 	}
 }
 
@@ -718,6 +734,12 @@ int ath11k_dp_pdev_alloc(struct ath11k_base *ab)
 				    i);
 			goto err;
 		}
+		ret = ath11k_dp_rx_pdev_mon_attach(ar);
+		if (ret) {
+			ath11k_warn(ab, "failed to initialize mon pdev %d\n",
+				    i);
+			goto err;
+		}
 	}
 
 	return 0;
diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index eab5fa0..216bccc 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -3295,3 +3295,156 @@ static inline int ath11k_dp_pkt_set_pktlen(struct sk_buff *skb, u32 len)
 	}
 	return 0;
 }
+
+static inline void
+ath11k_hal_rx_msdu_list_get(struct ath11k *ar,
+			    void *msdu_link_desc,
+			    struct hal_rx_msdu_list *msdu_list,
+			    u16 *num_msdus)
+{
+	struct hal_rx_msdu_details *msdu_details = NULL;
+	struct rx_msdu_desc *msdu_desc_info = NULL;
+	struct hal_rx_msdu_link *msdu_link = NULL;
+	int i;
+	u32 last = FIELD_PREP(RX_MSDU_DESC_INFO0_LAST_MSDU_IN_MPDU, 1);
+	u32 first = FIELD_PREP(RX_MSDU_DESC_INFO0_FIRST_MSDU_IN_MPDU, 1);
+	u8  tmp  = 0;
+
+	msdu_link = (struct hal_rx_msdu_link *)msdu_link_desc;
+	msdu_details = &msdu_link->msdu_link[0];
+
+	for (i = 0; i < HAL_RX_NUM_MSDU_DESC; i++) {
+		if (FIELD_GET(BUFFER_ADDR_INFO0_ADDR,
+			      msdu_details[i].buf_addr_info.info0) == 0) {
+			msdu_desc_info = &msdu_details[i - 1].rx_msdu_info;
+			msdu_desc_info->info0 |= last;
+			;
+			break;
+		}
+		msdu_desc_info = &msdu_details[i].rx_msdu_info;
+
+		if (!i)
+			msdu_desc_info->info0 |= first;
+		else if (i == (HAL_RX_NUM_MSDU_DESC - 1))
+			msdu_desc_info->info0 |= last;
+		msdu_list->msdu_info[i].msdu_flags = msdu_desc_info->info0;
+		msdu_list->msdu_info[i].msdu_len =
+			 HAL_RX_MSDU_PKT_LENGTH_GET(msdu_desc_info->info0);
+		msdu_list->sw_cookie[i] =
+			FIELD_GET(BUFFER_ADDR_INFO1_SW_COOKIE,
+				  msdu_details[i].buf_addr_info.info1);
+		tmp = FIELD_GET(BUFFER_ADDR_INFO1_RET_BUF_MGR,
+				msdu_details[i].buf_addr_info.info1);
+		msdu_list->rbm[i] = tmp;
+	}
+	*num_msdus = i;
+}
+
+static inline u32 ath11k_dp_rx_mon_comp_ppduid(u32 msdu_ppdu_id, u32 *ppdu_id,
+					       u32 *rx_bufs_used)
+{
+	u32 ret = 0;
+
+	if ((*ppdu_id < msdu_ppdu_id) &&
+	    ((msdu_ppdu_id - *ppdu_id) < DP_NOT_PPDU_ID_WRAP_AROUND)) {
+		*ppdu_id = msdu_ppdu_id;
+		ret = msdu_ppdu_id;
+	} else if ((*ppdu_id > msdu_ppdu_id) &&
+		((*ppdu_id - msdu_ppdu_id) > DP_NOT_PPDU_ID_WRAP_AROUND)) {
+		/* mon_dst is behind than mon_status
+		 * skip dst_ring and free it
+		 */
+		*rx_bufs_used += 1;
+		*ppdu_id = msdu_ppdu_id;
+		ret = msdu_ppdu_id;
+	}
+	return ret;
+}
+
+static inline void ath11k_dp_mon_get_buf_len(struct hal_rx_msdu_desc_info *info,
+					     bool *is_frag, u32 *total_len,
+					     u32 *frag_len, u32 *msdu_cnt)
+{
+	if (info->msdu_flags & RX_MSDU_DESC_INFO0_MSDU_CONTINUATION) {
+		if (!*is_frag) {
+			*total_len = info->msdu_len;
+			*is_frag = true;
+		}
+		ath11k_dp_mon_set_frag_len(total_len,
+					   frag_len);
+	} else {
+		if (*is_frag) {
+			ath11k_dp_mon_set_frag_len(total_len,
+						   frag_len);
+		} else {
+			*frag_len = info->msdu_len;
+		}
+		*is_frag = false;
+		*msdu_cnt -= 1;
+	}
+}
+
+int ath11k_dp_rx_pdev_mon_status_attach(struct ath11k *ar)
+{
+	struct ath11k_pdev_dp *dp = &ar->dp;
+	struct ath11k_mon_data *pmon = (struct ath11k_mon_data *)&dp->mon_data;
+
+	skb_queue_head_init(&pmon->rx_status_q);
+
+	pmon->mon_ppdu_status = DP_PPDU_STATUS_START;
+
+	memset(&pmon->rx_mon_stats, 0,
+	       sizeof(pmon->rx_mon_stats));
+	return 0;
+}
+
+int ath11k_dp_rx_pdev_mon_attach(struct ath11k *ar)
+{
+	struct ath11k_pdev_dp *dp = &ar->dp;
+	struct ath11k_mon_data *pmon = &dp->mon_data;
+	struct hal_srng *mon_desc_srng = NULL;
+	struct dp_srng *dp_srng;
+	int ret = 0;
+	u32 n_link_desc = 0;
+
+	ret = ath11k_dp_rx_pdev_mon_status_attach(ar);
+	if (ret) {
+		ath11k_warn(ar->ab, "pdev_mon_status_attach() failed");
+		return ret;
+	}
+
+	dp_srng = &dp->rxdma_mon_desc_ring;
+	n_link_desc = dp_srng->size /
+		ath11k_hal_srng_get_entrysize(HAL_RXDMA_MONITOR_DESC);
+	mon_desc_srng =
+		&ar->ab->hal.srng_list[dp->rxdma_mon_desc_ring.ring_id];
+
+	ret = ath11k_dp_link_desc_setup(ar->ab, pmon->link_desc_banks,
+					HAL_RXDMA_MONITOR_DESC, mon_desc_srng,
+					n_link_desc);
+	if (ret) {
+		ath11k_warn(ar->ab, "mon_link_desc_pool_setup() failed");
+		return ret;
+	}
+	pmon->mon_last_linkdesc_paddr = 0;
+	pmon->mon_last_buf_cookie = DP_RX_DESC_COOKIE_MAX + 1;
+	spin_lock_init(&pmon->mon_lock);
+	return 0;
+}
+
+int ath11k_dp_mon_link_free(struct ath11k *ar)
+{
+	struct ath11k_pdev_dp *dp = &ar->dp;
+	struct ath11k_mon_data *pmon = &dp->mon_data;
+
+	ath11k_dp_link_desc_cleanup(ar->ab, pmon->link_desc_banks,
+				    HAL_RXDMA_MONITOR_DESC,
+				    &dp->rxdma_mon_desc_ring);
+	return 0;
+}
+
+int ath11k_dp_rx_pdev_mon_detach(struct ath11k *ar)
+{
+	ath11k_dp_mon_link_free(ar);
+	return 0;
+}
-- 
2.7.4


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
