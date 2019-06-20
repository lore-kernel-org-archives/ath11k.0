Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1he2XE-0001rf-2k
 for ath11k@lists.infradead.org; Thu, 20 Jun 2019 19:15:49 +0000
From: Muna Sinada <msinada@codeaurora.org>
Subject: [PATCH 1/4] ath11k: change struct name from buffer_addr to
 ath11k_buffer_addr
Date: Thu, 20 Jun 2019 12:15:26 -0700
Message-Id: <1561058129-25625-1-git-send-email-msinada@codeaurora.org>
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
Cc: Muna Sinada <msinada@codeaurora.org>

Changed definition and all mentions of buffer_addr to ath11k_buffer_addr

Signed-off-by: Muna Sinada <msinada@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/dp.c       |  4 ++--
 drivers/net/wireless/ath/ath11k/dp_rx.c    | 10 +++++-----
 drivers/net/wireless/ath/ath11k/hal.c      |  4 ++--
 drivers/net/wireless/ath/ath11k/hal_desc.h | 22 +++++++++++-----------
 drivers/net/wireless/ath/ath11k/hal_rx.c   | 10 +++++-----
 5 files changed, 25 insertions(+), 25 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/dp.c b/drivers/net/wireless/ath/ath11k/dp.c
index 0aec840fc360..1a5bf2d4eba7 100644
--- a/drivers/net/wireless/ath/ath11k/dp.c
+++ b/drivers/net/wireless/ath/ath11k/dp.c
@@ -372,7 +372,7 @@ static int ath11k_dp_scatter_idle_link_desc_setup(struct ath11k_base *ab,
 		paddr = link_desc_banks[i].paddr;
 		while (n_entries) {
 			ath11k_hal_set_link_desc_addr(
-					(struct buffer_addr *)scatter_buf, i,
+					(struct ath11k_buffer_addr *)scatter_buf, i,
 					paddr);
 			n_entries--;
 			paddr += HAL_LINK_DESC_SIZE;
@@ -576,7 +576,7 @@ int ath11k_dp_link_desc_setup(struct ath11k_base *ab,
 		while (n_entries &&
 		       (desc = ath11k_hal_srng_src_get_next_entry(ab, srng))) {
 			ath11k_hal_set_link_desc_addr(
-					(struct buffer_addr *)desc, i,
+					(struct ath11k_buffer_addr *)desc, i,
 					paddr);
 			n_entries--;
 			paddr += HAL_LINK_DESC_SIZE;
diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index 59d2605c0ce2..41f6d4115e06 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -3292,10 +3292,10 @@ int ath11k_dp_rx_monitor_link_desc_return(struct ath11k *ar,
 	src_srng_desc = ath11k_hal_srng_src_get_next_entry(ar->ab, hal_srng);
 
 	if (src_srng_desc) {
-		struct buffer_addr *src_desc =
-				(struct buffer_addr *)src_srng_desc;
+		struct ath11k_buffer_addr *src_desc =
+				(struct ath11k_buffer_addr *)src_srng_desc;
 
-		*src_desc = *((struct buffer_addr *)p_last_buf_addr_info);
+		*src_desc = *((struct ath11k_buffer_addr *)p_last_buf_addr_info);
 	} else {
 		ath11k_dbg(ar->ab, ATH11K_DBG_DATA,
 			   "Monitor Link Desc Ring %d Full", mac_id);
@@ -3313,10 +3313,10 @@ void ath11k_dp_rx_mon_next_link_desc_get(void *rx_msdu_link_desc,
 {
 	struct hal_rx_msdu_link *msdu_link =
 			(struct hal_rx_msdu_link *)rx_msdu_link_desc;
-	struct buffer_addr *buf_addr_info;
+	struct ath11k_buffer_addr *buf_addr_info;
 	u8 rbm = 0;
 
-	buf_addr_info = (struct buffer_addr *)&msdu_link->buf_addr_info;
+	buf_addr_info = (struct ath11k_buffer_addr *)&msdu_link->buf_addr_info;
 
 	ath11k_hal_rx_buf_addr_info_get(buf_addr_info, paddr, sw_cookie, &rbm);
 
diff --git a/drivers/net/wireless/ath/ath11k/hal.c b/drivers/net/wireless/ath/ath11k/hal.c
index 655398e3cad4..b3ef72325dc7 100644
--- a/drivers/net/wireless/ath/ath11k/hal.c
+++ b/drivers/net/wireless/ath/ath11k/hal.c
@@ -691,7 +691,7 @@ u32 ath11k_hal_ce_dst_status_get_length(void *buf)
 
 void ath11k_hal_set_link_desc_addr(void *buf, u32 cookie, dma_addr_t paddr)
 {
-	struct buffer_addr *desc = (struct buffer_addr *)buf;
+	struct ath11k_buffer_addr *desc = (struct ath11k_buffer_addr *)buf;
 
 	desc->info0 = FIELD_PREP(BUFFER_ADDR_INFO0_ADDR,
 				 (paddr & HAL_ADDR_LSB_REG_MASK));
@@ -903,7 +903,7 @@ void ath11k_hal_setup_link_idle_list(struct ath11k_base *ab,
 				     u32 nsbufs, u32 tot_link_desc,
 				     u32 end_offset)
 {
-	struct buffer_addr *link_addr;
+	struct ath11k_buffer_addr *link_addr;
 	int i;
 	u32 reg_scatter_buf_sz = HAL_WBM_IDLE_SCATTER_BUF_SIZE / 64;
 
diff --git a/drivers/net/wireless/ath/ath11k/hal_desc.h b/drivers/net/wireless/ath/ath11k/hal_desc.h
index 99ab6f6845cc..32b8ccbd06f0 100644
--- a/drivers/net/wireless/ath/ath11k/hal_desc.h
+++ b/drivers/net/wireless/ath/ath11k/hal_desc.h
@@ -11,12 +11,12 @@
 #define BUFFER_ADDR_INFO1_RET_BUF_MGR  GENMASK(10, 8)
 #define BUFFER_ADDR_INFO1_SW_COOKIE    GENMASK(31, 11)
 
-struct buffer_addr {
+struct ath11k_buffer_addr {
 	u32 info0;
 	u32 info1;
 } __packed;
 
-/* buffer_addr
+/* ath11k_buffer_addr
  *
  * info0
  *		Address (lower 32 bits) of the msdu buffer or msdu extension
@@ -684,7 +684,7 @@ enum hal_reo_dest_ring_error_code {
 #define HAL_REO_DEST_RING_INFO2_LOOPING_COUNT		GENMASK(31, 28)
 
 struct hal_reo_dest_ring {
-	struct buffer_addr buf_addr_info;
+	struct ath11k_buffer_addr buf_addr_info;
 	struct rx_mpdu_desc rx_mpdu_info;
 	struct rx_msdu_desc rx_msdu_info;
 	u32 queue_addr_lo;
@@ -787,7 +787,7 @@ enum hal_reo_entr_rxdma_ecode {
 #define HAL_REO_ENTR_RING_INFO1_RXDMA_ERROR_CODE	GENMASK(6, 2)
 
 struct hal_reo_entrance_ring {
-	struct buffer_addr buf_addr_info;
+	struct ath11k_buffer_addr buf_addr_info;
 	struct rx_mpdu_desc rx_mpdu_info;
 	u32 queue_addr_lo;
 	u32 info0; /* %HAL_REO_ENTR_RING_INFO0_ */
@@ -999,7 +999,7 @@ enum hal_wbm_htt_tx_comp_status {
 };
 
 struct hal_tcl_data_cmd {
-	struct buffer_addr buf_addr_info;
+	struct ath11k_buffer_addr buf_addr_info;
 	u32 info0;
 	u32 info1;
 	u32 info2;
@@ -1540,7 +1540,7 @@ struct hal_tx_rate_stats {
 } __packed;
 
 struct hal_wbm_link_desc {
-	struct buffer_addr buf_addr_info;
+	struct ath11k_buffer_addr buf_addr_info;
 } __packed;
 
 /* hal_wbm_link_desc
@@ -1643,7 +1643,7 @@ enum hal_wbm_rel_bm_act {
 #define HAL_WBM_REL_HTT_TX_COMP_INFO0_EXP_FRAME		BIT(17)
 
 struct hal_wbm_release_ring {
-	struct buffer_addr buf_addr_info;
+	struct ath11k_buffer_addr buf_addr_info;
 	u32 info0;
 	u32 info1;
 	u32 info2;
@@ -1833,7 +1833,7 @@ enum hal_wbm_tqm_rel_reason {
 };
 
 struct hal_wbm_buffer_ring {
-	struct buffer_addr buf_addr_info;
+	struct ath11k_buffer_addr buf_addr_info;
 };
 
 enum hal_desc_owner {
@@ -1874,11 +1874,11 @@ struct hal_desc_header {
 } __packed;
 
 struct hal_rx_mpdu_link_ptr {
-	struct buffer_addr addr_info;
+	struct ath11k_buffer_addr addr_info;
 } __packed;
 
 struct hal_rx_msdu_details {
-	struct buffer_addr buf_addr_info;
+	struct ath11k_buffer_addr buf_addr_info;
 	struct rx_msdu_desc rx_msdu_info;
 } __packed;
 
@@ -1887,7 +1887,7 @@ struct hal_rx_msdu_details {
 
 struct hal_rx_msdu_link {
 	struct hal_desc_header desc_hdr;
-	struct buffer_addr buf_addr_info;
+	struct ath11k_buffer_addr buf_addr_info;
 	u32 info0;
 	u32 pn[4];
 	struct hal_rx_msdu_details msdu_link[6];
diff --git a/drivers/net/wireless/ath/ath11k/hal_rx.c b/drivers/net/wireless/ath/ath11k/hal_rx.c
index c37340fc0cad..329ecc6566f8 100644
--- a/drivers/net/wireless/ath/ath11k/hal_rx.c
+++ b/drivers/net/wireless/ath/ath11k/hal_rx.c
@@ -269,7 +269,7 @@ int ath11k_hal_reo_cmd_send(struct ath11k_base *ab, struct hal_srng *srng,
 void ath11k_hal_rx_buf_addr_info_set(void *desc, dma_addr_t paddr,
 				     u32 cookie, u8 manager)
 {
-	struct buffer_addr *binfo = (struct buffer_addr *)desc;
+	struct ath11k_buffer_addr *binfo = (struct ath11k_buffer_addr *)desc;
 	u32 paddr_lo, paddr_hi;
 
 	paddr_lo = lower_32_bits(paddr);
@@ -283,7 +283,7 @@ void ath11k_hal_rx_buf_addr_info_set(void *desc, dma_addr_t paddr,
 void ath11k_hal_rx_buf_addr_info_get(void *desc, dma_addr_t *paddr,
 				     u32 *cookie, u8 *rbm)
 {
-	struct buffer_addr *binfo = (struct buffer_addr *)desc;
+	struct ath11k_buffer_addr *binfo = (struct ath11k_buffer_addr *)desc;
 
 	*paddr =
 		(((u64)FIELD_GET(BUFFER_ADDR_INFO1_ADDR, binfo->info1)) << 32) |
@@ -453,7 +453,7 @@ int ath11k_hal_wbm_desc_parse_err(struct ath11k_base *ab, void *desc,
 void ath11k_hal_rx_reo_ent_paddr_get(struct ath11k_base *ab, void *desc,
 				     dma_addr_t *paddr, u32 *desc_bank)
 {
-	struct buffer_addr *buff_addr = desc;
+	struct ath11k_buffer_addr *buff_addr = desc;
 
 	*paddr = ((u64)(FIELD_GET(BUFFER_ADDR_INFO1_ADDR, buff_addr->info1)) << 32) |
 		  FIELD_GET(BUFFER_ADDR_INFO0_ADDR, buff_addr->info0);
@@ -1200,7 +1200,7 @@ void ath11k_hal_rx_reo_ent_buf_paddr_get(void *rx_desc, dma_addr_t *paddr,
 {
 	struct hal_reo_entrance_ring *reo_ent_ring =
 		(struct hal_reo_entrance_ring *)rx_desc;
-	struct buffer_addr *buf_addr_info;
+	struct ath11k_buffer_addr *buf_addr_info;
 	struct rx_mpdu_desc *rx_mpdu_desc_info_details;
 
 	rx_mpdu_desc_info_details =
@@ -1209,7 +1209,7 @@ void ath11k_hal_rx_reo_ent_buf_paddr_get(void *rx_desc, dma_addr_t *paddr,
 	*msdu_cnt = FIELD_GET(RX_MPDU_DESC_INFO0_MSDU_COUNT,
 			      rx_mpdu_desc_info_details->info0);
 
-	buf_addr_info = (struct buffer_addr *)&reo_ent_ring->buf_addr_info;
+	buf_addr_info = (struct ath11k_buffer_addr *)&reo_ent_ring->buf_addr_info;
 
 	*paddr = (((u64)FIELD_GET(BUFFER_ADDR_INFO1_ADDR,
 				  buf_addr_info->info1)) << 32) |
-- 
2.7.4


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
