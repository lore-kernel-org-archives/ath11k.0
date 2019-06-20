Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1he2Nd-0006xN-3c
 for ath11k@lists.infradead.org; Thu, 20 Jun 2019 19:05:54 +0000
From: Karthikeyan Periyasamy <periyasa@codeaurora.org>
Subject: [PATCH] ath11k: fix Block comments warnings
Date: Fri, 21 Jun 2019 00:35:33 +0530
Message-Id: <1561057533-601-1-git-send-email-periyasa@codeaurora.org>
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
Cc: Karthikeyan Periyasamy <periyasa@codeaurora.org>

drivers/net/wireless/ath/ath11k/hal_desc.h:1382: Block comments should align the * on each line
drivers/net/wireless/ath/ath11k/hal_desc.h:1440: Block comments should align the * on each line
drivers/net/wireless/ath/ath11k/mac.c:3233: Block comments use a trailing */ on a separate line

Signed-off-by: Karthikeyan Periyasamy <periyasa@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/hal_desc.h | 208 ++++++++++++++---------------
 drivers/net/wireless/ath/ath11k/mac.c      |   3 +-
 2 files changed, 105 insertions(+), 106 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/hal_desc.h b/drivers/net/wireless/ath/ath11k/hal_desc.h
index 99ab6f6..2b2f19a 100644
--- a/drivers/net/wireless/ath/ath11k/hal_desc.h
+++ b/drivers/net/wireless/ath/ath11k/hal_desc.h
@@ -1378,46 +1378,45 @@ struct hal_ce_srng_dest_desc {
 	u32 buffer_addr_info; /* %HAL_CE_DEST_DESC_ADDR_INFO_ */
 } __packed;
 
-/*
-* hal_ce_srng_dest_desc
-*
-* dst_buffer_low
-*		LSB 32 bits of the 40 Bit Pointer to the Destination
-*		buffer
-*
-* dst_buffer_high
-*		MSB 8 bits of the 40 Bit Pointer to the Destination
-*		buffer
-*
-* ce_res_4
-*		Reserved
-*
-* ring_id
-*		The buffer pointer ring ID.
-*		0 refers to the IDLE ring
-*		1 - N refers to other rings
-*		Helps with debugging when dumping ring contents.
-*
-* looping_count
-*		A count value that indicates the number of times the
-*		producer of entries into the Ring has looped around the
-*		ring.
-*
-*		At initialization time, this value is set to 0. On the
-*		first loop, this value is set to 1. After the max value is
-*		reached allowed by the number of bits for this field, the
-*		count value continues with 0 again.
-*
-*		In case SW is the consumer of the ring entries, it can
-*		use this field to figure out up to where the producer of
-*		entries has created new entries. This eliminates the need to
-*		check where the head pointer' of the ring is located once
-*		the SW starts processing an interrupt indicating that new
-*		entries have been put into this ring...
-*
-*		Also note that SW if it wants only needs to look at the
-*		LSB bit of this count value.
-*/
+/* hal_ce_srng_dest_desc
+ *
+ * dst_buffer_low
+ *		LSB 32 bits of the 40 Bit Pointer to the Destination
+ *		buffer
+ *
+ * dst_buffer_high
+ *		MSB 8 bits of the 40 Bit Pointer to the Destination
+ *		buffer
+ *
+ * ce_res_4
+ *		Reserved
+ *
+ * ring_id
+ *		The buffer pointer ring ID.
+ *		0 refers to the IDLE ring
+ *		1 - N refers to other rings
+ *		Helps with debugging when dumping ring contents.
+ *
+ * looping_count
+ *		A count value that indicates the number of times the
+ *		producer of entries into the Ring has looped around the
+ *		ring.
+ *
+ *		At initialization time, this value is set to 0. On the
+ *		first loop, this value is set to 1. After the max value is
+ *		reached allowed by the number of bits for this field, the
+ *		count value continues with 0 again.
+ *
+ *		In case SW is the consumer of the ring entries, it can
+ *		use this field to figure out up to where the producer of
+ *		entries has created new entries. This eliminates the need to
+ *		check where the head pointer' of the ring is located once
+ *		the SW starts processing an interrupt indicating that new
+ *		entries have been put into this ring...
+ *
+ *		Also note that SW if it wants only needs to look at the
+ *		LSB bit of this count value.
+ */
 
 #define HAL_CE_DST_STATUS_DESC_FLAGS_HASH_EN		BIT(8)
 #define HAL_CE_DST_STATUS_DESC_FLAGS_BYTE_SWAP		BIT(9)
@@ -1436,71 +1435,70 @@ struct hal_ce_srng_dst_status_desc {
 	u32 meta_info; /* HAL_CE_DST_STATUS_DESC_META_INFO_ */
 } __packed;
 
-/*
-* hal_ce_srng_dst_status_desc
-*
-* ce_res_5
-*		Reserved
-*
-* toeplitz_en
-*
-* src_swap
-*		Source memory buffer swapped
-*
-* dest_swap
-*		Destination  memory buffer swapped
-*
-* gather
-*		Gather of multiple copy engine source descriptors to one
-*		destination enabled
-*
-* ce_res_6
-*		Reserved
-*
-* length
-*		Sum of all the Lengths of the source descriptor in the
-*		gather chain
-*
-* toeplitz_hash_0
-*		32 LS bits of 64 bit Toeplitz LFSR hash result
-*
-* toeplitz_hash_1
-*		32 MS bits of 64 bit Toeplitz LFSR hash result
-*
-* fw_metadata
-*		Meta data used by FW
-*		In case of gather field in first source ring entry of
-*		the gather copy cycle in taken into account.
-*
-* ce_res_7
-*		Reserved
-*
-* ring_id
-*		The buffer pointer ring ID.
-*		0 refers to the IDLE ring
-*		1 - N refers to other rings
-*		Helps with debugging when dumping ring contents.
-*
-* looping_count
-*		A count value that indicates the number of times the
-*		producer of entries into the Ring has looped around the
-*		ring.
-*
-*		At initialization time, this value is set to 0. On the
-*		first loop, this value is set to 1. After the max value is
-*		reached allowed by the number of bits for this field, the
-*		count value continues with 0 again.
-*
-*		In case SW is the consumer of the ring entries, it can
-*		use this field to figure out up to where the producer of
-*		entries has created new entries. This eliminates the need to
-*		check where the head pointer' of the ring is located once
-*		the SW starts processing an interrupt indicating that new
-*		entries have been put into this ring...
-*
-*		Also note that SW if it wants only needs to look at the
-*			LSB bit of this count value.
-*/
+/* hal_ce_srng_dst_status_desc
+ *
+ * ce_res_5
+ *		Reserved
+ *
+ * toeplitz_en
+ *
+ * src_swap
+ *		Source memory buffer swapped
+ *
+ * dest_swap
+ *		Destination  memory buffer swapped
+ *
+ * gather
+ *		Gather of multiple copy engine source descriptors to one
+ *		destination enabled
+ *
+ * ce_res_6
+ *		Reserved
+ *
+ * length
+ *		Sum of all the Lengths of the source descriptor in the
+ *		gather chain
+ *
+ * toeplitz_hash_0
+ *		32 LS bits of 64 bit Toeplitz LFSR hash result
+ *
+ * toeplitz_hash_1
+ *		32 MS bits of 64 bit Toeplitz LFSR hash result
+ *
+ * fw_metadata
+ *		Meta data used by FW
+ *		In case of gather field in first source ring entry of
+ *		the gather copy cycle in taken into account.
+ *
+ * ce_res_7
+ *		Reserved
+ *
+ * ring_id
+ *		The buffer pointer ring ID.
+ *		0 refers to the IDLE ring
+ *		1 - N refers to other rings
+ *		Helps with debugging when dumping ring contents.
+ *
+ * looping_count
+ *		A count value that indicates the number of times the
+ *		producer of entries into the Ring has looped around the
+ *		ring.
+ *
+ *		At initialization time, this value is set to 0. On the
+ *		first loop, this value is set to 1. After the max value is
+ *		reached allowed by the number of bits for this field, the
+ *		count value continues with 0 again.
+ *
+ *		In case SW is the consumer of the ring entries, it can
+ *		use this field to figure out up to where the producer of
+ *		entries has created new entries. This eliminates the need to
+ *		check where the head pointer' of the ring is located once
+ *		the SW starts processing an interrupt indicating that new
+ *		entries have been put into this ring...
+ *
+ *		Also note that SW if it wants only needs to look at the
+ *			LSB bit of this count value.
+ */
 
 #define HAL_TX_RATE_STATS_INFO0_VALID		BIT(0)
 #define HAL_TX_RATE_STATS_INFO0_BW		GENMASK(2, 1)
diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 613590e..23974be 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -3106,7 +3106,8 @@ static void ath11k_mac_setup_ht_vht_cap(struct ath11k *ar,
 static int ath11k_check_chain_mask(struct ath11k *ar, u32 ant, bool is_tx_ant)
 {
 	/* TODO: Check the request chainmask against the supported
-	 * chainmask table which is advertised in extented_service_ready event */
+	 * chainmask table which is advertised in extented_service_ready event
+	 */
 
 	return 0;
 }
-- 
1.9.1


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
