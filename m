Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hdtCG-0000su-7K
 for ath11k@lists.infradead.org; Thu, 20 Jun 2019 09:17:33 +0000
Received: from vasanth-lnx.qca.qualcomm.com
 (blr-c-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.19.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: vthiagar@smtp.codeaurora.org)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 2346260A24
 for <ath11k@lists.infradead.org>; Thu, 20 Jun 2019 09:17:30 +0000 (UTC)
From: Vasanthakumar Thiagarajan <vthiagar@codeaurora.org>
Subject: [PATCH V2 3/4] ath11k{dp, hal}: Endian macro related clean ups
Date: Thu, 20 Jun 2019 14:47:08 +0530
Message-Id: <1561022229-854-3-git-send-email-vthiagar@codeaurora.org>
In-Reply-To: <1561022229-854-1-git-send-email-vthiagar@codeaurora.org>
References: <1561022229-854-1-git-send-email-vthiagar@codeaurora.org>
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

Replace ifdef __BIG_ENDIAN with IS_ENABLED(CONFIG_CPU_BIG_ENDIAN).
Replace swapXX() with swabXX(). Also does a renaming of
dp_peer_map_get_mac_addr.

Signed-off-by: Vasanthakumar Thiagarajan <vthiagar@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/dp.h    | 11 +++++------
 drivers/net/wireless/ath/ath11k/dp_rx.c |  4 ++--
 drivers/net/wireless/ath/ath11k/hal.c   |  8 +++-----
 3 files changed, 10 insertions(+), 13 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/dp.h b/drivers/net/wireless/ath/ath11k/dp.h
index 037fcbd..f7acd65 100644
--- a/drivers/net/wireless/ath/ath11k/dp.h
+++ b/drivers/net/wireless/ath/ath11k/dp.h
@@ -1483,13 +1483,12 @@ struct htt_mac_addr {
 	u32 mac_addr_h16;
 };
 
-static inline void dp_peer_map_get_mac_addr(u32 addr_l32, u16 addr_h16,
-					    u8 *addr)
+static inline void ath11k_dp_get_mac_addr(u32 addr_l32, u16 addr_h16, u8 *addr)
 {
-#ifdef __BIG_ENDIAN
-	addr_l32 = swap32(addr_l32);
-	addr_h16 = swap16(addr_h16);
-#endif
+	if (IS_ENABLED(CONFIG_CPU_BIG_ENDIAN)) {
+		addr_l32 = swab32(addr_l32);
+		addr_h16 = swab16(addr_h16);
+	}
 	memcpy(addr, &addr_l32, 4);
 	memcpy(addr + 4, &addr_h16, ETH_ALEN - 4);
 }
diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index 9f47bf4..57a1c27 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -1385,8 +1385,8 @@ void ath11k_dp_htt_htc_t2h_msg_handler(struct ath11k_base *ab,
 				    resp->peer_map_ev.info);
 		peer_mac_h16 = FIELD_GET(HTT_T2H_PEER_MAP_INFO1_MAC_ADDR_H16,
 					 resp->peer_map_ev.info1);
-		dp_peer_map_get_mac_addr(resp->peer_map_ev.mac_addr_l32,
-					 peer_mac_h16, mac_addr);
+		ath11k_dp_get_mac_addr(resp->peer_map_ev.mac_addr_l32,
+				       peer_mac_h16, mac_addr);
 		ast_hash = FIELD_GET(HTT_T2H_PEER_MAP_INFO2_AST_HASH_VAL,
 				     resp->peer_map_ev.info1);
 		ath11k_peer_map_event(ab, vdev_id, peer_id, mac_addr, ast_hash);
diff --git a/drivers/net/wireless/ath/ath11k/hal.c b/drivers/net/wireless/ath/ath11k/hal.c
index 3fe8f81..b7b9b9c 100644
--- a/drivers/net/wireless/ath/ath11k/hal.c
+++ b/drivers/net/wireless/ath/ath11k/hal.c
@@ -1032,11 +1032,9 @@ int ath11k_hal_srng_setup(struct ath11k_base *sc, enum hal_ring_type type,
 	       (srng->entry_size * srng->num_entries) << 2);
 
 	/* TODO: Add comments on these swap configurations */
-#ifdef __BIG_ENDIAN
-	srng->flags |= HAL_SRNG_FLAGS_MSI_SWAP |
-		       HAL_SRNG_FLAGS_DATA_TLV_SWAP |
-		       HAL_SRNG_FLAGS_RING_PTR_SWAP;
-#endif
+	if (IS_ENABLED(CONFIG_CPU_BIG_ENDIAN))
+		srng->flags |= HAL_SRNG_FLAGS_MSI_SWAP | HAL_SRNG_FLAGS_DATA_TLV_SWAP |
+			       HAL_SRNG_FLAGS_RING_PTR_SWAP;
 
 	reg_base = srng->hwreg_base[HAL_SRNG_REG_GRP_R2];
 
-- 
1.9.1


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
