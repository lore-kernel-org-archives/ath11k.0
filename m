Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hgtMT-0007HI-NA
 for ath11k@lists.infradead.org; Fri, 28 Jun 2019 16:04:31 +0000
From: Muna Sinada <msinada@codeaurora.org>
Subject: [PATCH v2 3/4] ath11k: comments added to explain purpose
Date: Fri, 28 Jun 2019 09:04:13 -0700
Message-Id: <1561737854-19003-3-git-send-email-msinada@codeaurora.org>
In-Reply-To: <1561737854-19003-1-git-send-email-msinada@codeaurora.org>
References: <1561737854-19003-1-git-send-email-msinada@codeaurora.org>
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

Added comments for ath11k_hal_tx_desc_sync() and
ath11k_hal_tx_status_desc_sync() to explain their purpose.

Signed-off-by: Muna Sinada <msinada@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/hal_tx.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/hal_tx.c b/drivers/net/wireless/ath/ath11k/hal_tx.c
index 3c04ebe23c22..2b1789a260d2 100644
--- a/drivers/net/wireless/ath/ath11k/hal_tx.c
+++ b/drivers/net/wireless/ath/ath11k/hal_tx.c
@@ -73,12 +73,14 @@ void ath11k_hal_tx_cmd_desc_setup(struct ath11k_base *ab, void *cmd,
 				    ti->bss_ast_hash);
 }
 
+/* Commit the descriptor to hardware */
 void ath11k_hal_tx_desc_sync(void *tx_desc_cached, void *hw_desc)
 {
 	memcpy(hw_desc + sizeof(struct hal_tlv_hdr), tx_desc_cached,
 	       sizeof(struct hal_tcl_data_cmd));
 }
 
+/* Get the descriptor status from hardware */
 void ath11k_hal_tx_status_desc_sync(void *hw_desc, void *local_desc)
 {
 	memcpy(local_desc, hw_desc, HAL_TX_STATUS_DESC_LEN);
-- 
2.7.4


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
