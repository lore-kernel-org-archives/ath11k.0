Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hvi4i-00088v-TP
 for ath11k@lists.infradead.org; Thu, 08 Aug 2019 13:03:26 +0000
From: Maharaja Kennadyrajan <mkenna@codeaurora.org>
Subject: [PATCH 09/15] ath11k: Rename ath11k_base struct from 'sc' to 'ab in
 dp.h
Date: Thu,  8 Aug 2019 18:33:06 +0530
Message-Id: <1565269392-2838-10-git-send-email-mkenna@codeaurora.org>
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
ath11k_base struct from 'sc' to 'ab' in dp.h file.

Signed-off-by: Maharaja Kennadyrajan <mkenna@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/dp.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/dp.h b/drivers/net/wireless/ath/ath11k/dp.h
index bda5ac27f20d..c968d5a6217e 100644
--- a/drivers/net/wireless/ath/ath11k/dp.h
+++ b/drivers/net/wireless/ath/ath11k/dp.h
@@ -193,7 +193,7 @@ struct ath11k_pdev_dp {
 #define DP_TX_DESC_ID_POOL_ID GENMASK(20, 19)
 
 struct ath11k_dp {
-	struct ath11k_base *sc;
+	struct ath11k_base *ab;
 	enum ath11k_htc_ep_id eid;
 	struct completion htt_tgt_version_received;
 	u8 htt_tgt_ver_major;
@@ -1498,13 +1498,13 @@ static inline void ath11k_dp_get_mac_addr(u32 addr_l32, u16 addr_h16, u8 *addr)
 	memcpy(addr + 4, &addr_h16, ETH_ALEN - 4);
 }
 
-int ath11k_dp_service_srng(struct ath11k_base *sc,
+int ath11k_dp_service_srng(struct ath11k_base *ab,
 			   struct ath11k_ext_irq_grp *irq_grp,
 			   int budget);
 int ath11k_dp_htt_connect(struct ath11k_dp *dp);
 void ath11k_dp_vdev_tx_attach(struct ath11k *ar, struct ath11k_vif *arvif);
-void ath11k_dp_free(struct ath11k_base *sc);
-int ath11k_dp_alloc(struct ath11k_base *sc);
+void ath11k_dp_free(struct ath11k_base *ab);
+int ath11k_dp_alloc(struct ath11k_base *ab);
 int ath11k_dp_pdev_alloc(struct ath11k_base *ab);
 void ath11k_dp_pdev_free(struct ath11k_base *ab);
 int ath11k_dp_tx_htt_srng_setup(struct ath11k_base *ab, u32 ring_id,
-- 
2.21.0


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
