Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hOmRi-0000wm-47
 for ath11k@lists.infradead.org; Thu, 09 May 2019 17:03:03 +0000
From: Miles Hu <milehu@codeaurora.org>
Subject: [PATCH] ath11k: fix compile warning in dp_tx.c
Date: Thu,  9 May 2019 10:02:49 -0700
Message-Id: <1557421369-6676-1-git-send-email-milehu@codeaurora.org>
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
Cc: Miles Hu <milehu@codeaurora.org>

Remove lmac_ring_id_offset variable declaration to eliminate warning
below:

drivers/net/wireless/ath/ath11k/dp_tx.c: In function
'ath11k_dp_htt_srng_setup':
drivers/net/wireless/ath/ath11k/dp_tx.c:615:6: warning: unused variable
'lmac_ring_id_offset' [-Wunused-variable]

Signed-off-by: Miles Hu <milehu@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/dp_tx.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/dp_tx.c b/drivers/net/wireless/ath/ath11k/dp_tx.c
index 624e4e9..55a19a0 100644
--- a/drivers/net/wireless/ath/ath11k/dp_tx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_tx.c
@@ -612,7 +612,6 @@ int ath11k_dp_htt_srng_setup(struct ath11k_base *ab, u32 ring_id,
 	u32 ring_entry_sz;
 	int len = sizeof(*cmd);
 	dma_addr_t hp_addr, tp_addr;
-	int lmac_ring_id_offset;
 	enum htt_srng_ring_type htt_ring_type;
 	enum htt_srng_ring_id htt_ring_id;
 	int ret = 0;
-- 
2.7.4


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
