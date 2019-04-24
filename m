Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hJ5Qn-0007lC-8F
 for ath11k@lists.infradead.org; Wed, 24 Apr 2019 00:06:35 +0000
From: Miles Hu <milehu@codeaurora.org>
Subject: [PATCH v2 1/6] ath11k: init/deinit monitor rings
Date: Tue, 23 Apr 2019 17:06:22 -0700
Message-Id: <1556064387-4668-2-git-send-email-milehu@codeaurora.org>
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

extend ring setup/cleanup to generic functions.
init/deinit monitor status/buffer/destination/link rings.
more htt filters for monitor mode.

Signed-off-by: Miles Hu <milehu@codeaurora.org>
---
V2:
 - Move to ath11k-bringup branch

 drivers/net/wireless/ath/ath11k/core.h     |   8 +-
 drivers/net/wireless/ath/ath11k/dp.c       | 110 +++++++++--------
 drivers/net/wireless/ath/ath11k/dp.h       | 189 ++++++++++++++++++++++++++---
 drivers/net/wireless/ath/ath11k/dp_tx.h    |   1 +
 drivers/net/wireless/ath/ath11k/hal_desc.h |   3 +
 drivers/net/wireless/ath/ath11k/hal_rx.h   |  17 +++
 drivers/net/wireless/ath/ath11k/rx_desc.h  |   1 +
 7 files changed, 261 insertions(+), 68 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/core.h b/drivers/net/wireless/ath/ath11k/core.h
index b2a3cac..871d424 100644
--- a/drivers/net/wireless/ath/ath11k/core.h
+++ b/drivers/net/wireless/ath/ath11k/core.h
@@ -70,6 +70,7 @@ struct ath11k_skb_rxcb {
 	u8 err_rel_src;
 	u8 err_code;
 	u8 mac_id;
+	u8 unmapped;
 };
 
 enum ath11k_hw_rev {
@@ -165,6 +166,10 @@ enum ath11k_dev_flags {
 	ATH11K_FLAG_REGISTERED,
 };
 
+enum ath11k_monitor_flags {
+	ATH11K_FLAG_MONITOR_ENABLED,
+};
+
 struct ath11k_vif {
 	u32 vdev_id;
 	enum wmi_vdev_type vdev_type;
@@ -428,8 +433,8 @@ struct ath11k {
 	struct {
 		struct ieee80211_supported_band sbands[NUM_NL80211_BANDS];
 	} mac;
-	unsigned long dev_flags;
 	unsigned int filter_flags;
+	unsigned long monitor_flags;
 	u32 min_tx_power;
 	u32 max_tx_power;
 	u32 txpower_limit_2g;
@@ -438,7 +443,6 @@ struct ath11k {
 	u32 power_scale;
 	u32 chan_tx_pwr;
 	u32 max_num_stations;
-	bool monitor_enabled;
 	bool monitor_present;
 	struct mutex conf_mutex;
 	spinlock_t data_lock;
diff --git a/drivers/net/wireless/ath/ath11k/dp.c b/drivers/net/wireless/ath/ath11k/dp.c
index 127eb56..5fa01c1 100644
--- a/drivers/net/wireless/ath/ath11k/dp.c
+++ b/drivers/net/wireless/ath/ath11k/dp.c
@@ -405,10 +405,10 @@ static int ath11k_dp_scatter_idle_link_desc_setup(struct ath11k_base *ab,
 	return ret;
 }
 
-static void ath11k_dp_link_desc_bank_free(struct ath11k_base *ab)
+static void
+ath11k_dp_link_desc_bank_free(struct ath11k_base *ab,
+			      struct dp_link_desc_bank *link_desc_banks)
 {
-	struct ath11k_dp *dp = &ab->dp;
-	struct dp_link_desc_bank *link_desc_banks = dp->link_desc_banks;
 	int i;
 
 	for (i = 0; i < DP_LINK_DESC_BANKS_MAX; i++) {
@@ -427,6 +427,7 @@ static int ath11k_dp_link_desc_bank_alloc(struct ath11k_base *ab,
 					  int n_link_desc_bank,
 					  int last_bank_sz)
 {
+	struct ath11k_dp *dp = &ab->dp;
 	int i;
 	int ret = 0;
 	int desc_sz = DP_LINK_DESC_ALLOC_SIZE_THRESH;
@@ -455,34 +456,29 @@ static int ath11k_dp_link_desc_bank_alloc(struct ath11k_base *ab,
 	return 0;
 
 err:
-	ath11k_dp_link_desc_bank_free(ab);
+	ath11k_dp_link_desc_bank_free(ab, dp->link_desc_banks);
 
 	return ret;
 }
 
-static void ath11k_dp_link_desc_cleanup(struct ath11k_base *ab)
+void ath11k_dp_link_desc_cleanup(struct ath11k_base *ab,
+				 struct dp_link_desc_bank *desc_bank,
+				 u32 ring_type, struct dp_srng *ring)
 {
-	struct ath11k_dp *dp = &ab->dp;
-
-	ath11k_dp_srng_cleanup(ab, &dp->wbm_idle_ring);
-
-	ath11k_dp_link_desc_bank_free(ab);
+	ath11k_dp_link_desc_bank_free(ab, desc_bank);
 
-	ath11k_dp_scatter_idle_link_desc_cleanup(ab);
+	if (ring_type != HAL_RXDMA_MONITOR_DESC) {
+		ath11k_dp_srng_cleanup(ab, ring);
+		ath11k_dp_scatter_idle_link_desc_cleanup(ab);
+	}
 }
 
-static int ath11k_dp_link_desc_setup(struct ath11k_base *ab)
+static int ath11k_wbm_idle_ring_setup(struct ath11k_base *ab, u32 *n_link_desc)
 {
 	struct ath11k_dp *dp = &ab->dp;
-	struct hal_srng *srng;
-	struct dp_link_desc_bank *link_desc_banks = dp->link_desc_banks;
-	u32 n_mpdu_link_desc, n_mpdu_queue_desc, n_tx_msdu_link_desc;
-	u32 n_rx_msdu_link_desc, n_link_desc, tot_mem_sz;
-	u32 n_link_desc_bank, last_bank_sz;
-	u32 entry_sz, align_bytes, n_entries;
-	dma_addr_t paddr;
-	u32 *desc;
-	int i, ret;
+	u32 n_mpdu_link_desc, n_mpdu_queue_desc;
+	u32 n_tx_msdu_link_desc, n_rx_msdu_link_desc;
+	int ret = 0;
 
 	n_mpdu_link_desc = (DP_NUM_TIDS_MAX * DP_AVG_MPDUS_PER_TID_MAX) /
 			   HAL_NUM_MPDUS_PER_LINK_DESC;
@@ -498,9 +494,30 @@ static int ath11k_dp_link_desc_setup(struct ath11k_base *ab)
 			       DP_AVG_MSDUS_PER_MPDU) /
 			      HAL_NUM_RX_MSDUS_PER_LINK_DESC;
 
-	n_link_desc = n_mpdu_link_desc + n_mpdu_queue_desc +
+	*n_link_desc = n_mpdu_link_desc + n_mpdu_queue_desc +
 		      n_tx_msdu_link_desc + n_rx_msdu_link_desc;
 
+	ret = ath11k_dp_srng_setup(ab, &dp->wbm_idle_ring,
+				   HAL_WBM_IDLE_LINK, 0, 0, *n_link_desc);
+	if (ret) {
+		ath11k_warn(ab, "failed to setup wbm_idle_ring: %d\n", ret);
+		return ret;
+	}
+	return ret;
+}
+
+int ath11k_dp_link_desc_setup(struct ath11k_base *ab,
+			      struct dp_link_desc_bank *link_desc_banks,
+			      u32 ring_type, struct hal_srng *srng,
+			      u32 n_link_desc)
+{
+	u32 tot_mem_sz;
+	u32 n_link_desc_bank, last_bank_sz;
+	u32 entry_sz, align_bytes, n_entries;
+	u32 paddr;
+	u32 *desc;
+	int i, ret;
+
 	if (n_link_desc & (n_link_desc - 1))
 		n_link_desc = 1 << fls(n_link_desc);
 
@@ -531,11 +548,12 @@ static int ath11k_dp_link_desc_setup(struct ath11k_base *ab)
 		return ret;
 
 	/* Setup link desc idle list for HW internal usage */
-	entry_sz = ath11k_hal_srng_get_entrysize(HAL_WBM_IDLE_LINK);
+	entry_sz = ath11k_hal_srng_get_entrysize(ring_type);
 	tot_mem_sz = entry_sz * n_link_desc;
 
 	/* Setup scatter desc list when the total memory requirement is more */
-	if (tot_mem_sz > DP_LINK_DESC_ALLOC_SIZE_THRESH) {
+	if (tot_mem_sz > DP_LINK_DESC_ALLOC_SIZE_THRESH &&
+	    ring_type != HAL_RXDMA_MONITOR_DESC) {
 		ret = ath11k_dp_scatter_idle_link_desc_setup(ab, tot_mem_sz,
 							     n_link_desc_bank,
 							     n_link_desc,
@@ -549,13 +567,6 @@ static int ath11k_dp_link_desc_setup(struct ath11k_base *ab)
 		return 0;
 	}
 
-	ret = ath11k_dp_srng_setup(ab, &dp->wbm_idle_ring,
-				   HAL_WBM_IDLE_LINK, 0, 0, n_link_desc);
-	if (ret)
-		goto fail_desc_bank_free;
-
-	srng = &ab->hal.srng_list[dp->wbm_idle_ring.ring_id];
-
 	spin_lock_bh(&srng->lock);
 
 	ath11k_hal_srng_access_begin(ab, srng);
@@ -583,7 +594,7 @@ static int ath11k_dp_link_desc_setup(struct ath11k_base *ab)
 	return 0;
 
 fail_desc_bank_free:
-	ath11k_dp_link_desc_bank_free(ab);
+	ath11k_dp_link_desc_bank_free(ab, link_desc_banks);
 
 	return ret;
 }
@@ -637,19 +648,6 @@ int ath11k_dp_service_srng(struct ath11k_base *ab,
 		}
 	}
 
-	if (rx_mon_status_ring_mask[grp_id]) {
-		for (i = 0; i <  ab->num_radios; i++) {
-			if (rx_mon_status_ring_mask[grp_id] & BIT(i)) {
-				work_done = ath11k_dp_rx_process_mon_status(ab, i, napi,
-									    budget);
-				budget -= work_done;
-				tot_work_done += work_done;
-			}
-			if (budget <= 0)
-				goto done;
-		}
-	}
-
 	if (ath11k_reo_status_ring_mask[grp_id])
 		ath11k_dp_process_reo_status(ab);
 
@@ -707,6 +705,8 @@ int ath11k_dp_pdev_alloc(struct ath11k_base *ab)
 		init_waitqueue_head(&dp->tx_empty_waitq);
 		idr_init(&dp->rx_mon_status_refill_ring.bufs_idr);
 		spin_lock_init(&dp->rx_mon_status_refill_ring.idr_lock);
+		idr_init(&dp->rxdma_mon_buf_ring.bufs_idr);
+		spin_lock_init(&dp->rxdma_mon_buf_ring.idr_lock);
 	}
 
 	/* TODO:Per-pdev rx ring unlike tx ring which is mapped to different AC's */
@@ -808,7 +808,8 @@ void ath11k_dp_free(struct ath11k_base *sc)
 	struct ath11k_dp *dp = &sc->dp;
 	int i;
 
-	ath11k_dp_link_desc_cleanup(sc);
+	ath11k_dp_link_desc_cleanup(sc, dp->link_desc_banks,
+				    HAL_WBM_IDLE_LINK, &dp->wbm_idle_ring);
 
 	ath11k_dp_srng_common_cleanup(sc);
 
@@ -830,7 +831,8 @@ void ath11k_dp_free(struct ath11k_base *sc)
 int ath11k_dp_alloc(struct ath11k_base *sc)
 {
 	struct ath11k_dp *dp = &sc->dp;
-	size_t size;
+	struct hal_srng *srng = NULL;
+	size_t size = 0, n_link_desc = 0;
 	int ret;
 	int i;
 
@@ -840,7 +842,16 @@ int ath11k_dp_alloc(struct ath11k_base *sc)
 	INIT_LIST_HEAD(&dp->reo_cmd_cache_flush_list);
 	spin_lock_init(&dp->reo_cmd_lock);
 
-	ret = ath11k_dp_link_desc_setup(sc);
+	ret = ath11k_wbm_idle_ring_setup(sc, &n_link_desc);
+	if (ret) {
+		ath11k_warn(sc, "failed to setup wbm_idle_ring: %d\n", ret);
+		return ret;
+	}
+
+	srng = &sc->hal.srng_list[dp->wbm_idle_ring.ring_id];
+
+	ret = ath11k_dp_link_desc_setup(sc, dp->link_desc_banks,
+					HAL_WBM_IDLE_LINK, srng, n_link_desc);
 	if (ret) {
 		ath11k_warn(sc, "failed to setup link desc: %d\n", ret);
 		return ret;
@@ -875,7 +886,8 @@ int ath11k_dp_alloc(struct ath11k_base *sc)
 	ath11k_dp_srng_common_cleanup(sc);
 
 fail_link_desc_cleanup:
-	ath11k_dp_link_desc_cleanup(sc);
+	ath11k_dp_link_desc_cleanup(sc, dp->link_desc_banks,
+				    HAL_WBM_IDLE_LINK, &dp->wbm_idle_ring);
 
 	return ret;
 }
diff --git a/drivers/net/wireless/ath/ath11k/dp.h b/drivers/net/wireless/ath/ath11k/dp.h
index 5674053..f206543 100644
--- a/drivers/net/wireless/ath/ath11k/dp.h
+++ b/drivers/net/wireless/ath/ath11k/dp.h
@@ -7,6 +7,7 @@
 #define ATH11K_DP_H
 
 #include <linux/kfifo.h>
+#include "hal_rx.h"
 
 struct ath11k_base;
 struct ath11k_peer;
@@ -67,6 +68,59 @@ struct dp_tx_ring {
 	spinlock_t tx_idr_lock;
 };
 
+struct ath11k_pdev_mon_stats {
+	u32 status_ppdu_state;
+	u32 status_ppdu_start;
+	u32 status_ppdu_end;
+	u32 status_ppdu_compl;
+	u32 status_ppdu_start_mis;
+	u32 status_ppdu_end_mis;
+	u32 status_ppdu_done;
+	u32 dest_ppdu_done;
+	u32 dest_mpdu_done;
+	u32 dest_mpdu_drop;
+	u32 dup_mon_linkdesc_cnt;
+	u32 dup_mon_buf_cnt;
+};
+
+struct dp_link_desc_bank {
+	void *vaddr_unaligned;
+	void *vaddr;
+	dma_addr_t paddr_unaligned;
+	dma_addr_t paddr;
+	u32 size;
+};
+
+/* Size to enforce scatter idle list mode */
+#define DP_LINK_DESC_ALLOC_SIZE_THRESH 0x200000
+#define DP_LINK_DESC_BANKS_MAX 8
+
+#define DP_RX_DESC_COOKIE_INDEX_MAX		0x3ffff
+#define DP_RX_DESC_COOKIE_POOL_ID_MAX		0x1c0000
+#define DP_RX_DESC_COOKIE_MAX	\
+	(DP_RX_DESC_COOKIE_INDEX_MAX | DP_RX_DESC_COOKIE_POOL_ID_MAX)
+#define DP_NOT_PPDU_ID_WRAP_AROUND 20000
+
+enum ath11k_dp_ppdu_state {
+	DP_PPDU_STATUS_START,
+	DP_PPDU_STATUS_DONE,
+};
+
+struct ath11k_mon_data {
+	struct dp_link_desc_bank link_desc_banks[DP_LINK_DESC_BANKS_MAX];
+	struct hal_rx_mon_ppdu_info mon_ppdu_info;
+
+	u32 mon_ppdu_status;
+	u32 mon_last_buf_cookie;
+	u64 mon_last_linkdesc_paddr;
+	u16 chan_noise_floor;
+
+	struct ath11k_pdev_mon_stats rx_mon_stats;
+	/* lock for monitor data */
+	spinlock_t mon_lock;
+	struct sk_buff_head rx_status_q;
+};
+
 struct ath11k_pdev_dp {
 	u32 mac_id;
 	atomic_t num_tx_pending;
@@ -74,8 +128,13 @@ struct ath11k_pdev_dp {
 	struct dp_srng reo_dst_ring;
 	struct dp_rxdma_ring rx_refill_buf_ring;
 	struct dp_srng rxdma_err_dst_ring;
+	struct dp_srng rxdma_mon_dst_ring;
+	struct dp_srng rxdma_mon_desc_ring;
+
+	struct dp_rxdma_ring rxdma_mon_buf_ring;
 	struct dp_rxdma_ring rx_mon_status_refill_ring;
 	struct ieee80211_rx_status rx_status;
+	struct ath11k_mon_data mon_data;
 };
 
 #define DP_NUM_CLIENTS_MAX 64
@@ -90,18 +149,6 @@ struct ath11k_pdev_dp {
 
 #define DP_BA_WIN_SZ_MAX	256
 
-/* Size to enforce scatter idle list mode */
-#define DP_LINK_DESC_ALLOC_SIZE_THRESH 0x200000
-#define DP_LINK_DESC_BANKS_MAX 8
-
-struct dp_link_desc_bank {
-	void *vaddr_unaligned;
-	void *vaddr;
-	dma_addr_t paddr_unaligned;
-	dma_addr_t paddr;
-	u32 size;
-};
-
 #define DP_TCL_NUM_RING_MAX	3
 
 #define DP_IDLE_SCATTER_BUFS_MAX 16
@@ -122,6 +169,9 @@ struct dp_link_desc_bank {
 #define DP_RXDMA_REFILL_RING_SIZE	2048
 #define DP_RXDMA_ERR_DST_RING_SIZE	1024
 #define DP_RXDMA_MON_STATUS_RING_SIZE	1024
+#define DP_RXDMA_MONITOR_BUF_RING_SIZE	4096
+#define DP_RXDMA_MONITOR_DST_RING_SIZE	2048
+#define DP_RXDMA_MONITOR_DESC_RING_SIZE	4096
 
 #define DP_RX_BUFFER_SIZE	2048
 #define DP_RX_BUFFER_ALIGN_SIZE	128
@@ -574,6 +624,9 @@ enum htt_rx_mgmt_pkt_filter_tlv_flags0 {
 	HTT_RX_FP_MGMT_PKT_FILTER_TLV_FLAGS0_PROBE_TIMING_ADV	= BIT(18),
 	HTT_RX_MD_MGMT_PKT_FILTER_TLV_FLAGS0_PROBE_TIMING_ADV	= BIT(19),
 	HTT_RX_MO_MGMT_PKT_FILTER_TLV_FLAGS0_PROBE_TIMING_ADV	= BIT(20),
+	HTT_RX_FP_MGMT_PKT_FILTER_TLV_FLAGS0_RESERVED_7		= BIT(21),
+	HTT_RX_MD_MGMT_PKT_FILTER_TLV_FLAGS0_RESERVED_7		= BIT(22),
+	HTT_RX_MO_MGMT_PKT_FILTER_TLV_FLAGS0_RESERVED_7		= BIT(23),
 	HTT_RX_FP_MGMT_PKT_FILTER_TLV_FLAGS0_BEACON		= BIT(24),
 	HTT_RX_MD_MGMT_PKT_FILTER_TLV_FLAGS0_BEACON		= BIT(25),
 	HTT_RX_MO_MGMT_PKT_FILTER_TLV_FLAGS0_BEACON		= BIT(26),
@@ -598,9 +651,33 @@ enum htt_rx_mgmt_pkt_filter_tlv_flags1 {
 	HTT_RX_FP_MGMT_PKT_FILTER_TLV_FLAGS1_ACTION_NOACK	= BIT(12),
 	HTT_RX_MD_MGMT_PKT_FILTER_TLV_FLAGS1_ACTION_NOACK	= BIT(13),
 	HTT_RX_MO_MGMT_PKT_FILTER_TLV_FLAGS1_ACTION_NOACK	= BIT(14),
+	HTT_RX_FP_MGMT_PKT_FILTER_TLV_FLAGS1_RESERVED_15	= BIT(15),
+	HTT_RX_MD_MGMT_PKT_FILTER_TLV_FLAGS1_RESERVED_15	= BIT(16),
+	HTT_RX_MO_MGMT_PKT_FILTER_TLV_FLAGS1_RESERVED_15	= BIT(17),
 };
 
 enum htt_rx_ctrl_pkt_filter_tlv_flags2 {
+	HTT_RX_FP_CTRL_PKT_FILTER_TLV_FLAGS2_CTRL_RESERVED_1	= BIT(0),
+	HTT_RX_MD_CTRL_PKT_FILTER_TLV_FLAGS2_CTRL_RESERVED_1	= BIT(1),
+	HTT_RX_MO_CTRL_PKT_FILTER_TLV_FLAGS2_CTRL_RESERVED_1	= BIT(2),
+	HTT_RX_FP_CTRL_PKT_FILTER_TLV_FLAGS2_CTRL_RESERVED_2	= BIT(3),
+	HTT_RX_MD_CTRL_PKT_FILTER_TLV_FLAGS2_CTRL_RESERVED_2	= BIT(4),
+	HTT_RX_MO_CTRL_PKT_FILTER_TLV_FLAGS2_CTRL_RESERVED_2	= BIT(5),
+	HTT_RX_FP_CTRL_PKT_FILTER_TLV_FLAGS2_CTRL_TRIGGER	= BIT(6),
+	HTT_RX_MD_CTRL_PKT_FILTER_TLV_FLAGS2_CTRL_TRIGGER	= BIT(7),
+	HTT_RX_MO_CTRL_PKT_FILTER_TLV_FLAGS2_CTRL_TRIGGER	= BIT(8),
+	HTT_RX_FP_CTRL_PKT_FILTER_TLV_FLAGS2_CTRL_RESERVED_4	= BIT(9),
+	HTT_RX_MD_CTRL_PKT_FILTER_TLV_FLAGS2_CTRL_RESERVED_4	= BIT(10),
+	HTT_RX_MO_CTRL_PKT_FILTER_TLV_FLAGS2_CTRL_RESERVED_4	= BIT(11),
+	HTT_RX_FP_CTRL_PKT_FILTER_TLV_FLAGS2_CTRL_BF_REP_POLL	= BIT(12),
+	HTT_RX_MD_CTRL_PKT_FILTER_TLV_FLAGS2_CTRL_BF_REP_POLL	= BIT(13),
+	HTT_RX_MO_CTRL_PKT_FILTER_TLV_FLAGS2_CTRL_BF_REP_POLL	= BIT(14),
+	HTT_RX_FP_CTRL_PKT_FILTER_TLV_FLAGS2_CTRL_VHT_NDP	= BIT(15),
+	HTT_RX_MD_CTRL_PKT_FILTER_TLV_FLAGS2_CTRL_VHT_NDP	= BIT(16),
+	HTT_RX_MO_CTRL_PKT_FILTER_TLV_FLAGS2_CTRL_VHT_NDP	= BIT(17),
+	HTT_RX_FP_CTRL_PKT_FILTER_TLV_FLAGS2_CTRL_FRAME_EXT	= BIT(18),
+	HTT_RX_MD_CTRL_PKT_FILTER_TLV_FLAGS2_CTRL_FRAME_EXT	= BIT(19),
+	HTT_RX_MO_CTRL_PKT_FILTER_TLV_FLAGS2_CTRL_FRAME_EXT	= BIT(20),
 	HTT_RX_FP_CTRL_PKT_FILTER_TLV_FLAGS2_CTRL_WRAPPER	= BIT(21),
 	HTT_RX_MD_CTRL_PKT_FILTER_TLV_FLAGS2_CTRL_WRAPPER	= BIT(22),
 	HTT_RX_MO_CTRL_PKT_FILTER_TLV_FLAGS2_CTRL_WRAPPER	= BIT(23),
@@ -636,13 +713,13 @@ enum htt_rx_ctrl_pkt_filter_tlv_flags3 {
 enum htt_rx_data_pkt_filter_tlv_flasg3 {
 	HTT_RX_FP_DATA_PKT_FILTER_TLV_FLASG3_MCAST	= BIT(18),
 	HTT_RX_MD_DATA_PKT_FILTER_TLV_FLASG3_MCAST	= BIT(19),
-	HTT_RX_M0_DATA_PKT_FILTER_TLV_FLASG3_MCAST	= BIT(20),
+	HTT_RX_MO_DATA_PKT_FILTER_TLV_FLASG3_MCAST	= BIT(20),
 	HTT_RX_FP_DATA_PKT_FILTER_TLV_FLASG3_UCAST	= BIT(21),
 	HTT_RX_MD_DATA_PKT_FILTER_TLV_FLASG3_UCAST	= BIT(22),
-	HTT_RX_M0_DATA_PKT_FILTER_TLV_FLASG3_UCAST	= BIT(23),
-	HTT_RX_FP_DATA_PKT_FILTER_TLV_FLASG3_NULL_DATA	= BIT(21),
-	HTT_RX_MD_DATA_PKT_FILTER_TLV_FLASG3_NULL_DATA	= BIT(22),
-	HTT_RX_M0_DATA_PKT_FILTER_TLV_FLASG3_NULL_DATA	= BIT(23),
+	HTT_RX_MO_DATA_PKT_FILTER_TLV_FLASG3_UCAST	= BIT(23),
+	HTT_RX_FP_DATA_PKT_FILTER_TLV_FLASG3_NULL_DATA	= BIT(24),
+	HTT_RX_MD_DATA_PKT_FILTER_TLV_FLASG3_NULL_DATA	= BIT(25),
+	HTT_RX_MO_DATA_PKT_FILTER_TLV_FLASG3_NULL_DATA	= BIT(26),
 };
 
 #define HTT_RX_FP_MGMT_FILTER_FLAGS0 (HTT_RX_FP_MGMT_PKT_FILTER_TLV_FLAGS0_ASSOC_REQ \
@@ -738,6 +815,76 @@ enum htt_rx_data_pkt_filter_tlv_flasg3 {
 				     | HTT_RX_MO_DATA_PKT_FILTER_TLV_FLASG3_UCAST \
 				     | HTT_RX_MO_DATA_PKT_FILTER_TLV_FLASG3_NULL_DATA)
 
+#define HTT_RX_MON_FP_MGMT_FILTER_FLAGS0 \
+		(HTT_RX_FP_MGMT_FILTER_FLAGS0 | \
+		HTT_RX_FP_MGMT_PKT_FILTER_TLV_FLAGS0_RESERVED_7)
+
+#define HTT_RX_MON_MO_MGMT_FILTER_FLAGS0 \
+		(HTT_RX_MO_MGMT_FILTER_FLAGS0 | \
+		HTT_RX_MO_MGMT_PKT_FILTER_TLV_FLAGS0_RESERVED_7)
+
+#define HTT_RX_MON_FP_MGMT_FILTER_FLAGS1 \
+		(HTT_RX_FP_MGMT_FILTER_FLAGS1 | \
+		HTT_RX_FP_MGMT_PKT_FILTER_TLV_FLAGS1_RESERVED_15)
+
+#define HTT_RX_MON_MO_MGMT_FILTER_FLAGS1 \
+		(HTT_RX_MO_MGMT_FILTER_FLAGS1 | \
+		HTT_RX_MO_MGMT_PKT_FILTER_TLV_FLAGS1_RESERVED_15)
+
+#define HTT_RX_MON_FP_CTRL_FILTER_FLASG2 \
+		(HTT_RX_FP_CTRL_FILTER_FLASG2 | \
+		HTT_RX_FP_CTRL_PKT_FILTER_TLV_FLAGS2_CTRL_RESERVED_1 | \
+		HTT_RX_FP_CTRL_PKT_FILTER_TLV_FLAGS2_CTRL_RESERVED_2 | \
+		HTT_RX_FP_CTRL_PKT_FILTER_TLV_FLAGS2_CTRL_TRIGGER | \
+		HTT_RX_FP_CTRL_PKT_FILTER_TLV_FLAGS2_CTRL_RESERVED_4 | \
+		HTT_RX_FP_CTRL_PKT_FILTER_TLV_FLAGS2_CTRL_BF_REP_POLL | \
+		HTT_RX_FP_CTRL_PKT_FILTER_TLV_FLAGS2_CTRL_VHT_NDP | \
+		HTT_RX_FP_CTRL_PKT_FILTER_TLV_FLAGS2_CTRL_FRAME_EXT)
+
+#define HTT_RX_MON_MO_CTRL_FILTER_FLASG2 \
+		(HTT_RX_MO_CTRL_FILTER_FLASG2 | \
+		HTT_RX_MO_CTRL_PKT_FILTER_TLV_FLAGS2_CTRL_RESERVED_1 | \
+		HTT_RX_MO_CTRL_PKT_FILTER_TLV_FLAGS2_CTRL_RESERVED_2 | \
+		HTT_RX_MO_CTRL_PKT_FILTER_TLV_FLAGS2_CTRL_TRIGGER | \
+		HTT_RX_MO_CTRL_PKT_FILTER_TLV_FLAGS2_CTRL_RESERVED_4 | \
+		HTT_RX_MO_CTRL_PKT_FILTER_TLV_FLAGS2_CTRL_BF_REP_POLL | \
+		HTT_RX_MO_CTRL_PKT_FILTER_TLV_FLAGS2_CTRL_VHT_NDP | \
+		HTT_RX_MO_CTRL_PKT_FILTER_TLV_FLAGS2_CTRL_FRAME_EXT)
+
+#define HTT_RX_MON_FP_CTRL_FILTER_FLASG3 HTT_RX_FP_CTRL_FILTER_FLASG3
+
+#define HTT_RX_MON_MO_CTRL_FILTER_FLASG3 HTT_RX_MO_CTRL_FILTER_FLASG3
+
+#define HTT_RX_MON_FP_DATA_FILTER_FLASG3 HTT_RX_FP_DATA_FILTER_FLASG3
+
+#define HTT_RX_MON_MO_DATA_FILTER_FLASG3 HTT_RX_MO_DATA_FILTER_FLASG3
+
+#define HTT_RX_MON_FILTER_TLV_FLAGS \
+		(HTT_RX_FILTER_TLV_FLAGS_MPDU_START | \
+		HTT_RX_FILTER_TLV_FLAGS_PPDU_START | \
+		HTT_RX_FILTER_TLV_FLAGS_PPDU_END | \
+		HTT_RX_FILTER_TLV_FLAGS_PPDU_END_USER_STATS | \
+		HTT_RX_FILTER_TLV_FLAGS_PPDU_END_USER_STATS_EXT | \
+		HTT_RX_FILTER_TLV_FLAGS_PPDU_END_STATUS_DONE)
+
+#define HTT_RX_MON_FILTER_TLV_FLAGS_MON_STATUS_RING \
+		(HTT_RX_FILTER_TLV_FLAGS_MPDU_START | \
+		HTT_RX_FILTER_TLV_FLAGS_PPDU_START | \
+		HTT_RX_FILTER_TLV_FLAGS_PPDU_END | \
+		HTT_RX_FILTER_TLV_FLAGS_PPDU_END_USER_STATS | \
+		HTT_RX_FILTER_TLV_FLAGS_PPDU_END_USER_STATS_EXT | \
+		HTT_RX_FILTER_TLV_FLAGS_PPDU_END_STATUS_DONE)
+
+#define HTT_RX_MON_FILTER_TLV_FLAGS_MON_BUF_RING \
+		(HTT_RX_FILTER_TLV_FLAGS_MPDU_START | \
+		HTT_RX_FILTER_TLV_FLAGS_MSDU_START | \
+		HTT_RX_FILTER_TLV_FLAGS_RX_PACKET | \
+		HTT_RX_FILTER_TLV_FLAGS_MSDU_END | \
+		HTT_RX_FILTER_TLV_FLAGS_MPDU_END | \
+		HTT_RX_FILTER_TLV_FLAGS_PACKET_HEADER | \
+		HTT_RX_FILTER_TLV_FLAGS_PER_MSDU_HEADER | \
+		HTT_RX_FILTER_TLV_FLAGS_ATTENTION)
+
 struct htt_rx_ring_selection_cfg_cmd {
 	u32 info0;
 	u32 info1;
@@ -1283,4 +1430,12 @@ void ath11k_dp_srng_cleanup(struct ath11k_base *ab, struct dp_srng *ring);
 int ath11k_dp_srng_setup(struct ath11k_base *ab, struct dp_srng *ring,
 			 enum hal_ring_type type, int ring_num,
 			 int mac_id, int num_entries);
+void ath11k_dp_link_desc_cleanup(struct ath11k_base *ab,
+				 struct dp_link_desc_bank *desc_bank,
+				 u32 ring_type, struct dp_srng *ring);
+int ath11k_dp_link_desc_setup(struct ath11k_base *ab,
+			      struct dp_link_desc_bank *link_desc_banks,
+			      u32 ring_type, struct hal_srng *srng,
+			      u32 n_link_desc);
+
 #endif
diff --git a/drivers/net/wireless/ath/ath11k/dp_tx.h b/drivers/net/wireless/ath/ath11k/dp_tx.h
index a9d03da..e763ad4 100644
--- a/drivers/net/wireless/ath/ath11k/dp_tx.h
+++ b/drivers/net/wireless/ath/ath11k/dp_tx.h
@@ -27,4 +27,5 @@ int ath11k_dp_send_reo_cmd(struct ath11k_base *ab, struct dp_rx_tid *rx_tid,
 
 int ath11k_dp_htt_h2t_ppdu_stats_req(struct ath11k *ar, u32 mask);
 int ath11k_dp_htt_h2t_ext_stats_req(struct ath11k *ar, u8 mask, u64 cookie);
+int ath11k_dp_htt_monitor_mode_ring_config(struct ath11k *ar, bool reset);
 #endif
diff --git a/drivers/net/wireless/ath/ath11k/hal_desc.h b/drivers/net/wireless/ath/ath11k/hal_desc.h
index 8085f5f..99ab6f6 100644
--- a/drivers/net/wireless/ath/ath11k/hal_desc.h
+++ b/drivers/net/wireless/ath/ath11k/hal_desc.h
@@ -577,6 +577,9 @@ enum hal_rx_msdu_desc_reo_dest_ind {
 #define RX_MSDU_DESC_INFO0_DA_MCBC		BIT(26)
 #define RX_MSDU_DESC_INFO0_DA_IDX_TIMEOUT	BIT(27)
 
+#define HAL_RX_MSDU_PKT_LENGTH_GET(val)		\
+	(FIELD_GET(RX_MSDU_DESC_INFO0_MSDU_LENGTH, (val)))
+
 struct rx_msdu_desc {
 	u32 info0;
 	u32 rsvd0;
diff --git a/drivers/net/wireless/ath/ath11k/hal_rx.h b/drivers/net/wireless/ath/ath11k/hal_rx.h
index 2ccc800..439a36f 100644
--- a/drivers/net/wireless/ath/ath11k/hal_rx.h
+++ b/drivers/net/wireless/ath/ath11k/hal_rx.h
@@ -93,6 +93,7 @@ enum hal_rx_reception_type {
 #define HAL_TLV_STATUS_PPDU_DONE                1
 #define HAL_TLV_STATUS_BUF_DONE                 2
 #define HAL_TLV_STATUS_PPDU_NON_STD_DONE        3
+#define HAL_RX_FCS_LEN                          4
 
 enum hal_rx_mon_status {
 	HAL_RX_MON_STATUS_PPDU_NOT_DONE,
@@ -278,6 +279,18 @@ struct hal_rx_rxpcu_classification_overview {
 	u32 rsvd0;
 } __packed;
 
+struct hal_rx_msdu_desc_info {
+	u32 msdu_flags;
+	u16 msdu_len; /* 14 bits for length */
+};
+
+#define HAL_RX_NUM_MSDU_DESC 6
+struct hal_rx_msdu_list {
+	struct hal_rx_msdu_desc_info msdu_info[HAL_RX_NUM_MSDU_DESC];
+	u32 sw_cookie[HAL_RX_NUM_MSDU_DESC];
+	u8 rbm[HAL_RX_NUM_MSDU_DESC];
+};
+
 void ath11k_hal_reo_status_queue_stats(struct ath11k_base *ab, u32 *reo_desc,
 				       struct hal_reo_status *status);
 void ath11k_hal_reo_flush_queue_status(struct ath11k_base *ab, u32 *reo_desc,
@@ -316,6 +329,10 @@ int ath11k_hal_wbm_desc_parse_err(struct ath11k_base *ab, void *desc,
 				  struct hal_rx_wbm_rel_info *rel_info);
 void ath11k_hal_rx_reo_ent_paddr_get(struct ath11k_base *ab, void *desc,
 				     dma_addr_t *paddr, u32 *desc_bank);
+void ath11k_hal_rx_reo_ent_buf_paddr_get(void *rx_desc,
+					 dma_addr_t *paddr, u32 *sw_cookie,
+					 void **pp_buf_addr_info,
+					 u32 *msdu_cnt);
 enum hal_rx_mon_status
 ath11k_hal_rx_parse_mon_status(struct ath11k_base *ab,
 			       struct hal_rx_mon_ppdu_info *ppdu_info,
diff --git a/drivers/net/wireless/ath/ath11k/rx_desc.h b/drivers/net/wireless/ath/ath11k/rx_desc.h
index 11924c6..57518a0 100644
--- a/drivers/net/wireless/ath/ath11k/rx_desc.h
+++ b/drivers/net/wireless/ath/ath11k/rx_desc.h
@@ -662,6 +662,7 @@ enum rx_msdu_start_reception_type {
 #define RX_MSDU_START_INFO2_MESH_CTRL_PRESENT		BIT(22)
 #define RX_MSDU_START_INFO2_LDPC			BIT(23)
 #define RX_MSDU_START_INFO2_IP4_IP6_NXT_HDR		GENMASK(31, 24)
+#define RX_MSDU_START_INFO2_DECAP_FORMAT		GENMASK(9, 8)
 
 #define RX_MSDU_START_INFO3_USER_RSSI		GENMASK(7, 0)
 #define RX_MSDU_START_INFO3_PKT_TYPE		GENMASK(11, 8)
-- 
2.7.4


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
