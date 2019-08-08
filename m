Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hvi4o-0008Fy-JL
 for ath11k@lists.infradead.org; Thu, 08 Aug 2019 13:03:32 +0000
From: Maharaja Kennadyrajan <mkenna@codeaurora.org>
Subject: [PATCH 12/15] ath11k: Rename ath11k_base struct from 'sc' to 'ab in
 hal.h
Date: Thu,  8 Aug 2019 18:33:09 +0530
Message-Id: <1565269392-2838-13-git-send-email-mkenna@codeaurora.org>
In-Reply-To: <1565269392-2838-1-git-send-email-mkenna@codeaurora.org>
References: <1565269392-2838-1-git-send-email-mkenna@codeaurora.org>
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
Cc: Maharaja Kennadyrajan <mkenna@codeaurora.org>

To avoid confusion and better readability, renamed the
ath11k_base struct from 'sc' to 'ab' in hal.h file.

Signed-off-by: Maharaja Kennadyrajan <mkenna@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/hal.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/hal.h b/drivers/net/wireless/ath/ath11k/hal.h
index c57f683f8c84..c80b068f0baf 100644
--- a/drivers/net/wireless/ath/ath11k/hal.h
+++ b/drivers/net/wireless/ath/ath11k/hal.h
@@ -876,10 +876,10 @@ u32 *ath11k_hal_srng_dst_get_next_entry(struct ath11k_base *ab,
 u32 *ath11k_hal_srng_dst_peek(struct ath11k_base *ab, struct hal_srng *srng);
 int ath11k_hal_srng_dst_num_free(struct ath11k_base *ab, struct hal_srng *srng,
 				 bool sync_hw_ptr);
-u32 *ath11k_hal_srng_src_peek(struct ath11k_base *sc, struct hal_srng *srng);
-u32 *ath11k_hal_srng_src_get_next_reaped(struct ath11k_base *sc,
+u32 *ath11k_hal_srng_src_peek(struct ath11k_base *ab, struct hal_srng *srng);
+u32 *ath11k_hal_srng_src_get_next_reaped(struct ath11k_base *ab,
 					 struct hal_srng *srng);
-u32 *ath11k_hal_srng_src_reap_next(struct ath11k_base *sc,
+u32 *ath11k_hal_srng_src_reap_next(struct ath11k_base *ab,
 				   struct hal_srng *srng);
 u32 *ath11k_hal_srng_src_get_next_entry(struct ath11k_base *ab,
 					struct hal_srng *srng);
@@ -888,7 +888,7 @@ int ath11k_hal_srng_src_num_free(struct ath11k_base *ab, struct hal_srng *srng,
 void ath11k_hal_srng_access_begin(struct ath11k_base *ab,
 				  struct hal_srng *srng);
 void ath11k_hal_srng_access_end(struct ath11k_base *ab, struct hal_srng *srng);
-int ath11k_hal_srng_setup(struct ath11k_base *sc, enum hal_ring_type type,
+int ath11k_hal_srng_setup(struct ath11k_base *ab, enum hal_ring_type type,
 			  int ring_num, int mac_id,
 			  struct hal_srng_params *params);
 int ath11k_hal_srng_init(struct ath11k_base *ath11k);
-- 
2.21.0


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
