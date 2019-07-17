Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hnbK9-0003Aa-Na
 for ath11k@lists.infradead.org; Wed, 17 Jul 2019 04:13:51 +0000
Received: from vasanth-lnx.qca.qualcomm.com
 (blr-c-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.19.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: vthiagar@smtp.codeaurora.org)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 9115960C8B
 for <ath11k@lists.infradead.org>; Wed, 17 Jul 2019 04:13:48 +0000 (UTC)
From: Vasanthakumar Thiagarajan <vthiagar@codeaurora.org>
Subject: [PATCH] ath11k/dp: Remove unnecessary REO remap configuration
Date: Wed, 17 Jul 2019 09:43:27 +0530
Message-Id: <1563336807-23646-2-git-send-email-vthiagar@codeaurora.org>
In-Reply-To: <1563336807-23646-1-git-send-email-vthiagar@codeaurora.org>
References: <1563336807-23646-1-git-send-email-vthiagar@codeaurora.org>
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

REO remap configuration only required when using all REO rings
for Rx with hashing. Since hashing based REO routing is currently
disabled with the driver design, remove unsed register configurations
with REO remap which are used for hash based REO routing.

Signed-off-by: Vasanthakumar Thiagarajan <vthiagar@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/dp.c     | 18 +-----------------
 drivers/net/wireless/ath/ath11k/hal.h    | 16 +---------------
 drivers/net/wireless/ath/ath11k/hal_rx.c | 10 +---------
 3 files changed, 3 insertions(+), 41 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/dp.c b/drivers/net/wireless/ath/ath11k/dp.c
index 3f5174a..ad572e7 100644
--- a/drivers/net/wireless/ath/ath11k/dp.c
+++ b/drivers/net/wireless/ath/ath11k/dp.c
@@ -198,7 +198,6 @@ static int ath11k_dp_srng_common_setup(struct ath11k_base *ab)
 	struct ath11k_dp *dp = &ab->dp;
 	struct hal_srng *srng;
 	int i, ret;
-	struct hal_reo_params reo_params = {0};
 
 	ret = ath11k_dp_srng_setup(ab, &dp->wbm_desc_rel_ring,
 				   HAL_SW2WBM_RELEASE, 0, 0,
@@ -286,22 +285,7 @@ static int ath11k_dp_srng_common_setup(struct ath11k_base *ab)
 		goto err;
 	}
 
-	/* When hash based routing of rx packet is enabled, 16 entries to map
-	 * the hash values to the ring will be configured. Each hash entry uses
-	 * three bits to map to a particular ring. The ring mapping will be
-	 * 0:TCL, 1:SW1, 2:SW2, 3:SW3, 4:SW4, 5:Release, 6:FW and 7:Not used.
-	 */
-	reo_params.ring_hash_map0_7 = HAL_HASH_ROUTING_RING_SW1 << 0 |
-				      HAL_HASH_ROUTING_RING_SW2 << 3 |
-				      HAL_HASH_ROUTING_RING_SW3 << 6 |
-				      HAL_HASH_ROUTING_RING_SW4 << 9 |
-				      HAL_HASH_ROUTING_RING_SW1 << 12 |
-				      HAL_HASH_ROUTING_RING_SW2 << 15 |
-				      HAL_HASH_ROUTING_RING_SW3 << 18 |
-				      HAL_HASH_ROUTING_RING_SW4 << 21;
-	reo_params.ring_hash_map8_15 = reo_params.ring_hash_map0_7;
-
-	ath11k_hal_reo_hw_setup(ab, &reo_params);
+	ath11k_hal_reo_hw_setup(ab);
 
 	return 0;
 
diff --git a/drivers/net/wireless/ath/ath11k/hal.h b/drivers/net/wireless/ath/ath11k/hal.h
index a1e917e..76ab802 100644
--- a/drivers/net/wireless/ath/ath11k/hal.h
+++ b/drivers/net/wireless/ath/ath11k/hal.h
@@ -717,19 +717,6 @@ enum hal_ce_desc {
 	HAL_CE_DESC_DST_STATUS,
 };
 
-#define HAL_HASH_ROUTING_RING_TCL 0
-#define HAL_HASH_ROUTING_RING_SW1 1
-#define HAL_HASH_ROUTING_RING_SW2 2
-#define HAL_HASH_ROUTING_RING_SW3 3
-#define HAL_HASH_ROUTING_RING_SW4 4
-#define HAL_HASH_ROUTING_RING_REL 5
-#define HAL_HASH_ROUTING_RING_FW  6
-
-struct hal_reo_params {
-	u32 ring_hash_map0_7;
-	u32 ring_hash_map8_15;
-};
-
 struct hal_reo_status_header {
 	u16 cmd_num;
 	enum hal_reo_cmd_status cmd_status;
@@ -863,8 +850,7 @@ void ath11k_hal_reo_qdesc_setup(void *vaddr, int tid, u32 ba_window_size,
 				u32 start_seqtype);
 void ath11k_hal_reo_init_cmd_ring(struct ath11k_base *ab,
 				  struct hal_srng *srng);
-void ath11k_hal_reo_hw_setup(struct ath11k_base *ab,
-			     struct hal_reo_params *params);
+void ath11k_hal_reo_hw_setup(struct ath11k_base *ab);
 void ath11k_hal_setup_link_idle_list(struct ath11k_base *ab,
 				     struct hal_wbm_idle_scatter_list *sbuf,
 				     u32 nsbufs, u32 tot_link_desc,
diff --git a/drivers/net/wireless/ath/ath11k/hal_rx.c b/drivers/net/wireless/ath/ath11k/hal_rx.c
index 1dcc0fc..f8abbb7 100644
--- a/drivers/net/wireless/ath/ath11k/hal_rx.c
+++ b/drivers/net/wireless/ath/ath11k/hal_rx.c
@@ -828,8 +828,7 @@ void ath11k_hal_reo_init_cmd_ring(struct ath11k_base *ab,
 	}
 }
 
-void ath11k_hal_reo_hw_setup(struct ath11k_base *ab,
-			     struct hal_reo_params *params)
+void ath11k_hal_reo_hw_setup(struct ath11k_base *ab)
 {
 	u32 reo_base = HAL_SEQ_WCSS_UMAC_REO_REG;
 	u32 val;
@@ -851,13 +850,6 @@ void ath11k_hal_reo_hw_setup(struct ath11k_base *ab,
 			   HAL_DEFAULT_REO_TIMEOUT_USEC);
 	ath11k_ahb_write32(ab, reo_base + HAL_REO1_AGING_THRESH_IX_3,
 			   HAL_DEFAULT_REO_TIMEOUT_USEC);
-
-	ath11k_ahb_write32(ab, reo_base + HAL_REO1_DEST_RING_CTRL_IX_2,
-			   FIELD_PREP(HAL_REO_DEST_RING_CTRL_HASH_RING_MAP,
-				      params->ring_hash_map0_7));
-	ath11k_ahb_write32(ab, reo_base + HAL_REO1_DEST_RING_CTRL_IX_3,
-			   FIELD_PREP(HAL_REO_DEST_RING_CTRL_HASH_RING_MAP,
-				      params->ring_hash_map8_15));
 }
 
 static enum hal_rx_mon_status
-- 
1.9.1


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
