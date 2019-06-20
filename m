Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1he2XL-0001tA-Bb
 for ath11k@lists.infradead.org; Thu, 20 Jun 2019 19:15:56 +0000
From: Muna Sinada <msinada@codeaurora.org>
Subject: [PATCH 3/4] ath11k: cast reo_desc directly to struct hal_tlv_hdr
Date: Thu, 20 Jun 2019 12:15:28 -0700
Message-Id: <1561058129-25625-3-git-send-email-msinada@codeaurora.org>
In-Reply-To: <1561058129-25625-1-git-send-email-msinada@codeaurora.org>
References: <1561058129-25625-1-git-send-email-msinada@codeaurora.org>
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

To avoid opaque pointers, reo_desc directly casted to 'struct hal_tlv_hdr *'
in ath11k_hal_reo_cmd_send(). Due to this, removed unnecessary typecasting
in functions that received reo_desc as an argument.

Signed-off-by: Muna Sinada <msinada@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/hal_rx.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/hal_rx.c b/drivers/net/wireless/ath/ath11k/hal_rx.c
index 622f4dfa5535..376b519595c1 100644
--- a/drivers/net/wireless/ath/ath11k/hal_rx.c
+++ b/drivers/net/wireless/ath/ath11k/hal_rx.c
@@ -20,10 +20,9 @@ static void ath11k_hal_reo_set_desc_hdr(struct hal_desc_header *hdr,
 	hdr->info0 |= FIELD_PREP(HAL_DESC_HDR_INFO0_DBG_RESERVED, magic);
 }
 
-static int ath11k_hal_reo_cmd_queue_stats(u32 *reo_desc,
+static int ath11k_hal_reo_cmd_queue_stats(struct hal_tlv_hdr *tlv,
 					  struct ath11k_hal_reo_cmd *cmd)
 {
-	struct hal_tlv_hdr *tlv = (struct hal_tlv_hdr *)reo_desc;
 	struct hal_reo_get_queue_stats *desc;
 
 	tlv->tl = FIELD_PREP(HAL_TLV_HDR_TAG, HAL_REO_GET_QUEUE_STATS) |
@@ -46,10 +45,9 @@ static int ath11k_hal_reo_cmd_queue_stats(u32 *reo_desc,
 	return FIELD_GET(HAL_REO_CMD_HDR_INFO0_CMD_NUMBER, desc->cmd.info0);
 }
 
-static int ath11k_hal_reo_cmd_flush_cache(struct ath11k_hal *hal, u32 *reo_desc,
+static int ath11k_hal_reo_cmd_flush_cache(struct ath11k_hal *hal, struct hal_tlv_hdr *tlv,
 					  struct ath11k_hal_reo_cmd *cmd)
 {
-	struct hal_tlv_hdr *tlv = (struct hal_tlv_hdr *)reo_desc;
 	struct hal_reo_flush_cache *desc;
 	u8 avail_slot = ffz(hal->avail_blk_resource);
 
@@ -94,10 +92,9 @@ static int ath11k_hal_reo_cmd_flush_cache(struct ath11k_hal *hal, u32 *reo_desc,
 	return FIELD_GET(HAL_REO_CMD_HDR_INFO0_CMD_NUMBER, desc->cmd.info0);
 }
 
-static int ath11k_hal_reo_cmd_update_rx_queue(u32 *reo_desc,
+static int ath11k_hal_reo_cmd_update_rx_queue(struct hal_tlv_hdr *tlv,
 					      struct ath11k_hal_reo_cmd *cmd)
 {
-	struct hal_tlv_hdr *tlv = (struct hal_tlv_hdr *)reo_desc;
 	struct hal_reo_update_rx_queue *desc;
 
 	tlv->tl = FIELD_PREP(HAL_TLV_HDR_TAG, HAL_REO_UPDATE_RX_REO_QUEUE) |
@@ -225,13 +222,13 @@ int ath11k_hal_reo_cmd_send(struct ath11k_base *ab, struct hal_srng *srng,
 			    enum hal_reo_cmd_type type,
 			    struct ath11k_hal_reo_cmd *cmd)
 {
-	u32 *reo_desc;
+	struct hal_tlv_hdr *reo_desc;
 	int ret;
 
 	spin_lock_bh(&srng->lock);
 
 	ath11k_hal_srng_access_begin(ab, srng);
-	reo_desc = ath11k_hal_srng_src_get_next_entry(ab, srng);
+	reo_desc = (struct hal_tlv_hdr *)ath11k_hal_srng_src_get_next_entry(ab, srng);
 	if (!reo_desc) {
 		ret = -ENOBUFS;
 		goto out;
-- 
2.7.4


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
