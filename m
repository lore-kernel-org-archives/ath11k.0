Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hfSSx-0005Nz-Vt
 for ath11k@lists.infradead.org; Mon, 24 Jun 2019 17:09:17 +0000
From: Muna Sinada <msinada@codeaurora.org>
Subject: [PATCH 1/5] ath11k: removed duplicated functionality
Date: Mon, 24 Jun 2019 10:08:57 -0700
Message-Id: <1561396141-23382-1-git-send-email-msinada@codeaurora.org>
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

Removed duplicated functionality in ath11k_hal_desc_reo_parse_err() and
replaced with function call to ath11k_hal_rx_reo_entl_paddr_get().

Signed-off-by: Muna Sinada <msinada@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/hal_rx.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/hal_rx.c b/drivers/net/wireless/ath/ath11k/hal_rx.c
index 76b93f6c33cd..2d2d5cd5ea5f 100644
--- a/drivers/net/wireless/ath/ath11k/hal_rx.c
+++ b/drivers/net/wireless/ath/ath11k/hal_rx.c
@@ -351,12 +351,7 @@ int ath11k_hal_desc_reo_parse_err(struct ath11k_base *ab, u32 *rx_desc,
 		return -EINVAL;
 	}
 
-	*paddr = (((u64)FIELD_GET(BUFFER_ADDR_INFO1_ADDR,
-				  desc->buf_addr_info.info1)) << 32) |
-		FIELD_GET(BUFFER_ADDR_INFO0_ADDR,
-			  desc->buf_addr_info.info0);
-	*desc_bank = FIELD_GET(BUFFER_ADDR_INFO1_SW_COOKIE,
-			       desc->buf_addr_info.info1);
+	ath11k_hal_rx_reo_ent_paddr_get(ab, rx_desc, paddr, desc_bank);
 
 	return 0;
 }
-- 
2.7.4


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
