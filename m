Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1heAa0-0001kr-5j
 for ath11k@lists.infradead.org; Fri, 21 Jun 2019 03:51:13 +0000
Received: from vasanth-lnx.qca.qualcomm.com
 (blr-c-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.19.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: vthiagar@smtp.codeaurora.org)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 981C6602F2
 for <ath11k@lists.infradead.org>; Fri, 21 Jun 2019 03:51:10 +0000 (UTC)
From: Vasanthakumar Thiagarajan <vthiagar@codeaurora.org>
Subject: [PATCH] ath11k/dp: Cleanup type casting in WBM link descriptor setup
Date: Fri, 21 Jun 2019 09:20:55 +0530
Message-Id: <1561089055-7355-1-git-send-email-vthiagar@codeaurora.org>
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

Change the type of virtual address of struct hal_wbm_idle_scatter_list
from u32 * to struct hal_wbm_link_desc *. This also makes the pointer
arithmetic simpler. This also fixes a bug in pointer arithmetic
on scatter buffer address. Scatter buffer address was incremented
by HAL_LINK_DESC_SIZE instead of sizeof(hal_wbm_link_desc).

Signed-off-by: Vasanthakumar Thiagarajan <vthiagar@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/dp.c  | 21 +++++++++------------
 drivers/net/wireless/ath/ath11k/hal.c | 17 ++++++++---------
 drivers/net/wireless/ath/ath11k/hal.h |  5 +++--
 3 files changed, 20 insertions(+), 23 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/dp.c b/drivers/net/wireless/ath/ath11k/dp.c
index c4770bb..0e09d07 100644
--- a/drivers/net/wireless/ath/ath11k/dp.c
+++ b/drivers/net/wireless/ath/ath11k/dp.c
@@ -338,12 +338,13 @@ static int ath11k_dp_scatter_idle_link_desc_setup(struct ath11k_base *ab,
 	struct hal_wbm_idle_scatter_list *slist = dp->scatter_list;
 	u32 n_entries_per_buf;
 	int num_scatter_buf, scatter_idx;
-	u32 *scatter_buf;
+	struct hal_wbm_link_desc *scatter_buf;
 	int align_bytes, n_entries;
 	dma_addr_t paddr;
 	int rem_entries;
 	int i;
 	int ret = 0;
+	u32 end_offset;
 
 	n_entries_per_buf = HAL_WBM_IDLE_SCATTER_BUF_SIZE /
 			    ath11k_hal_srng_get_entrysize(HAL_WBM_IDLE_LINK);
@@ -373,15 +374,12 @@ static int ath11k_dp_scatter_idle_link_desc_setup(struct ath11k_base *ab,
 			     HAL_LINK_DESC_SIZE;
 		paddr = link_desc_banks[i].paddr;
 		while (n_entries) {
-			ath11k_hal_set_link_desc_addr(
-					(struct buffer_addr *)scatter_buf, i,
-					paddr);
+			ath11k_hal_set_link_desc_addr(scatter_buf, i, paddr);
 			n_entries--;
 			paddr += HAL_LINK_DESC_SIZE;
 			if (rem_entries) {
 				rem_entries--;
-				scatter_buf = (u32 *)((u8 *)scatter_buf +
-						      HAL_LINK_DESC_SIZE);
+				scatter_buf++;
 				continue;
 			}
 
@@ -391,10 +389,10 @@ static int ath11k_dp_scatter_idle_link_desc_setup(struct ath11k_base *ab,
 		}
 	}
 
+	end_offset = (scatter_buf - slist[scatter_idx].vaddr) *
+		     sizeof(struct hal_wbm_link_desc);
 	ath11k_hal_setup_link_idle_list(ab, slist, num_scatter_buf,
-					n_link_desc,
-					(u8 *)scatter_buf -
-					(u8 *)slist[scatter_idx].vaddr);
+					n_link_desc, end_offset);
 
 	return 0;
 
@@ -577,9 +575,8 @@ int ath11k_dp_link_desc_setup(struct ath11k_base *ab,
 		paddr = link_desc_banks[i].paddr;
 		while (n_entries &&
 		       (desc = ath11k_hal_srng_src_get_next_entry(ab, srng))) {
-			ath11k_hal_set_link_desc_addr(
-					(struct buffer_addr *)desc, i,
-					paddr);
+			ath11k_hal_set_link_desc_addr((struct hal_wbm_link_desc *)desc, i,
+						      paddr);
 			n_entries--;
 			paddr += HAL_LINK_DESC_SIZE;
 		}
diff --git a/drivers/net/wireless/ath/ath11k/hal.c b/drivers/net/wireless/ath/ath11k/hal.c
index b7b9b9c..26a8eda 100644
--- a/drivers/net/wireless/ath/ath11k/hal.c
+++ b/drivers/net/wireless/ath/ath11k/hal.c
@@ -689,16 +689,15 @@ u32 ath11k_hal_ce_dst_status_get_length(void *buf)
 	return len;
 }
 
-void ath11k_hal_set_link_desc_addr(void *buf, u32 cookie, dma_addr_t paddr)
+void ath11k_hal_set_link_desc_addr(struct hal_wbm_link_desc *desc, u32 cookie,
+				   dma_addr_t paddr)
 {
-	struct buffer_addr *desc = (struct buffer_addr *)buf;
-
-	desc->info0 = FIELD_PREP(BUFFER_ADDR_INFO0_ADDR,
-				 (paddr & HAL_ADDR_LSB_REG_MASK));
-	desc->info1 = FIELD_PREP(BUFFER_ADDR_INFO1_ADDR,
-				 ((u64)paddr >> HAL_ADDR_MSB_REG_SHIFT)) |
-		      FIELD_PREP(BUFFER_ADDR_INFO1_RET_BUF_MGR, 1) |
-		      FIELD_PREP(BUFFER_ADDR_INFO1_SW_COOKIE, cookie);
+	desc->buf_addr_info.info0 = FIELD_PREP(BUFFER_ADDR_INFO0_ADDR,
+					       (paddr & HAL_ADDR_LSB_REG_MASK));
+	desc->buf_addr_info.info1 = FIELD_PREP(BUFFER_ADDR_INFO1_ADDR,
+					       ((u64)paddr >> HAL_ADDR_MSB_REG_SHIFT)) |
+				    FIELD_PREP(BUFFER_ADDR_INFO1_RET_BUF_MGR, 1) |
+				    FIELD_PREP(BUFFER_ADDR_INFO1_SW_COOKIE, cookie);
 }
 
 u32 *ath11k_hal_srng_dst_peek(struct ath11k_base *ab, struct hal_srng *srng)
diff --git a/drivers/net/wireless/ath/ath11k/hal.h b/drivers/net/wireless/ath/ath11k/hal.h
index 6649dd2..71d3884 100644
--- a/drivers/net/wireless/ath/ath11k/hal.h
+++ b/drivers/net/wireless/ath/ath11k/hal.h
@@ -445,7 +445,7 @@ enum hal_reo_cmd_status {
 
 struct hal_wbm_idle_scatter_list {
 	dma_addr_t paddr;
-	u32 *vaddr;
+	struct hal_wbm_link_desc *vaddr;
 };
 
 struct hal_srng_params {
@@ -875,7 +875,8 @@ dma_addr_t ath11k_hal_srng_get_tp_addr(struct ath11k_base *ab,
 				       struct hal_srng *srng);
 dma_addr_t ath11k_hal_srng_get_hp_addr(struct ath11k_base *ab,
 				       struct hal_srng *srng);
-void ath11k_hal_set_link_desc_addr(void *buf, u32 cookie, dma_addr_t paddr);
+void ath11k_hal_set_link_desc_addr(struct hal_wbm_link_desc *desc, u32 cookie,
+				   dma_addr_t paddr);
 u32 ath11k_hal_ce_get_desc_size(enum hal_ce_desc type);
 void ath11k_hal_ce_src_set_desc(void *buf, dma_addr_t paddr, u32 len, u32 id,
 				u8 byte_swap_data);
-- 
1.9.1


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
