Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hnxy2-0006LX-Vf
 for ath11k@lists.infradead.org; Thu, 18 Jul 2019 04:24:32 +0000
Received: from vasanth-lnx.qca.qualcomm.com
 (blr-c-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.19.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: vthiagar@smtp.codeaurora.org)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 79C3A609CD
 for <ath11k@lists.infradead.org>; Thu, 18 Jul 2019 04:24:28 +0000 (UTC)
From: Vasanthakumar Thiagarajan <vthiagar@codeaurora.org>
Subject: [PATCH 1/2] ath11k/hal: Fix few bugs in ath11k_hal_srng_dst_num_free()
Date: Thu, 18 Jul 2019 09:54:14 +0530
Message-Id: <1563423855-32397-1-git-send-email-vthiagar@codeaurora.org>
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

The logic to compute the number of available buffers in destination
ring is wrong. It should be just the different between head and
tail pointers in terms of the entry size. This functions currently
unused, this is fixed to make use of this function in follow-up
patches. Also make destination ring head pointer volatile because
it is independently updated by HW.

Signed-off-by: Vasanthakumar Thiagarajan <vthiagar@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/hal.c | 7 +++----
 drivers/net/wireless/ath/ath11k/hal.h | 2 +-
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/hal.c b/drivers/net/wireless/ath/ath11k/hal.c
index 7da42a1..9eac311 100644
--- a/drivers/net/wireless/ath/ath11k/hal.c
+++ b/drivers/net/wireless/ath/ath11k/hal.c
@@ -745,9 +745,9 @@ int ath11k_hal_srng_dst_num_free(struct ath11k_base *ab, struct hal_srng *srng,
 	}
 
 	if (hp >= tp)
-		return ((hp - tp) / srng->entry_size) - 1;
+		return (hp - tp) / srng->entry_size;
 	else
-		return ((srng->ring_size - tp + hp) / srng->entry_size) - 1;
+		return (srng->ring_size - tp + hp) / srng->entry_size;
 }
 
 /* Returns number of available entries in src ring */
@@ -862,8 +862,7 @@ void ath11k_hal_srng_access_begin(struct ath11k_base *ab, struct hal_srng *srng)
 		srng->u.src_ring.cached_tp =
 			*(volatile u32 *)srng->u.src_ring.tp_addr;
 	else
-		srng->u.dst_ring.cached_hp =
-			*(volatile u32 *)srng->u.dst_ring.hp_addr;
+		srng->u.dst_ring.cached_hp = *srng->u.dst_ring.hp_addr;
 }
 
 /* Update cached ring head/tail pointers to HW. ath11k_hal_srng_access_begin()
diff --git a/drivers/net/wireless/ath/ath11k/hal.h b/drivers/net/wireless/ath/ath11k/hal.h
index a1e917e..d580acf 100644
--- a/drivers/net/wireless/ath/ath11k/hal.h
+++ b/drivers/net/wireless/ath/ath11k/hal.h
@@ -538,7 +538,7 @@ struct hal_srng {
 			u32 tp;
 
 			/* Shadow head pointer location to be updated by HW */
-			u32 *hp_addr;
+			volatile u32 *hp_addr;
 
 			/* Cached head pointer */
 			u32 cached_hp;
-- 
1.9.1


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
