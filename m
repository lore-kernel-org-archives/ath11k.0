Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hd5wE-0007B7-TJ
 for ath11k@lists.infradead.org; Tue, 18 Jun 2019 04:41:44 +0000
Received: from vasanth-lnx.qca.qualcomm.com
 (blr-c-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.19.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: vthiagar@smtp.codeaurora.org)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id C558A602FE
 for <ath11k@lists.infradead.org>; Tue, 18 Jun 2019 04:41:41 +0000 (UTC)
From: Vasanthakumar Thiagarajan <vthiagar@codeaurora.org>
Subject: [PATCH 4/5] ath11k: Clean up link_desc_addr buffer typecast
Date: Tue, 18 Jun 2019 10:11:28 +0530
Message-Id: <1560832889-14129-4-git-send-email-vthiagar@codeaurora.org>
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

It is not necessary to typecast scatter_buf while calling
ath11k_hal_set_link_desc_addr(). Few more trivial clean ups
related to scatter_buf typecast.

Signed-off-by: Vasanthakumar Thiagarajan <vthiagar@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/dp.c  | 11 +++--------
 drivers/net/wireless/ath/ath11k/hal.c |  2 +-
 drivers/net/wireless/ath/ath11k/hal.h |  2 +-
 3 files changed, 5 insertions(+), 10 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/dp.c b/drivers/net/wireless/ath/ath11k/dp.c
index 815a343..e565638 100644
--- a/drivers/net/wireless/ath/ath11k/dp.c
+++ b/drivers/net/wireless/ath/ath11k/dp.c
@@ -372,9 +372,7 @@ static int ath11k_dp_scatter_idle_link_desc_setup(struct ath11k_base *ab,
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
@@ -391,8 +389,7 @@ static int ath11k_dp_scatter_idle_link_desc_setup(struct ath11k_base *ab,
 	}
 
 	ath11k_hal_setup_link_idle_list(ab, slist, num_scatter_buf,
-					n_link_desc,
-					(u8 *)scatter_buf -
+					n_link_desc, (u8 *)scatter_buf -
 					(u8 *)slist[scatter_idx].vaddr);
 
 	return 0;
@@ -576,9 +573,7 @@ int ath11k_dp_link_desc_setup(struct ath11k_base *ab,
 		paddr = link_desc_banks[i].paddr;
 		while (n_entries &&
 		       (desc = ath11k_hal_srng_src_get_next_entry(ab, srng))) {
-			ath11k_hal_set_link_desc_addr(
-					(struct buffer_addr *)desc, i,
-					paddr);
+			ath11k_hal_set_link_desc_addr(desc, i, paddr);
 			n_entries--;
 			paddr += HAL_LINK_DESC_SIZE;
 		}
diff --git a/drivers/net/wireless/ath/ath11k/hal.c b/drivers/net/wireless/ath/ath11k/hal.c
index b7b9b9c..6c8e37f 100644
--- a/drivers/net/wireless/ath/ath11k/hal.c
+++ b/drivers/net/wireless/ath/ath11k/hal.c
@@ -689,7 +689,7 @@ u32 ath11k_hal_ce_dst_status_get_length(void *buf)
 	return len;
 }
 
-void ath11k_hal_set_link_desc_addr(void *buf, u32 cookie, dma_addr_t paddr)
+void ath11k_hal_set_link_desc_addr(u32 *buf, u32 cookie, dma_addr_t paddr)
 {
 	struct buffer_addr *desc = (struct buffer_addr *)buf;
 
diff --git a/drivers/net/wireless/ath/ath11k/hal.h b/drivers/net/wireless/ath/ath11k/hal.h
index 6649dd2..f1b4157 100644
--- a/drivers/net/wireless/ath/ath11k/hal.h
+++ b/drivers/net/wireless/ath/ath11k/hal.h
@@ -875,7 +875,7 @@ dma_addr_t ath11k_hal_srng_get_tp_addr(struct ath11k_base *ab,
 				       struct hal_srng *srng);
 dma_addr_t ath11k_hal_srng_get_hp_addr(struct ath11k_base *ab,
 				       struct hal_srng *srng);
-void ath11k_hal_set_link_desc_addr(void *buf, u32 cookie, dma_addr_t paddr);
+void ath11k_hal_set_link_desc_addr(u32 *buf, u32 cookie, dma_addr_t paddr);
 u32 ath11k_hal_ce_get_desc_size(enum hal_ce_desc type);
 void ath11k_hal_ce_src_set_desc(void *buf, dma_addr_t paddr, u32 len, u32 id,
 				u8 byte_swap_data);
-- 
1.9.1


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
