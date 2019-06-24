Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hfST9-0005ur-26
 for ath11k@lists.infradead.org; Mon, 24 Jun 2019 17:09:28 +0000
From: Muna Sinada <msinada@codeaurora.org>
Subject: [PATCH 4/5] ath11k: added RMB to return_buffer_manager description
Date: Mon, 24 Jun 2019 10:09:00 -0700
Message-Id: <1561396141-23382-4-git-send-email-msinada@codeaurora.org>
In-Reply-To: <1561396141-23382-1-git-send-email-msinada@codeaurora.org>
References: <1561396141-23382-1-git-send-email-msinada@codeaurora.org>
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

Added "(RBM)" to return_buffer_manager description to clarify what it
stands for when utilized.

Signed-off-by: Muna Sinada <msinada@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/hal_desc.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/hal_desc.h b/drivers/net/wireless/ath/ath11k/hal_desc.h
index 32b8ccbd06f0..62741bf792c6 100644
--- a/drivers/net/wireless/ath/ath11k/hal_desc.h
+++ b/drivers/net/wireless/ath/ath11k/hal_desc.h
@@ -26,7 +26,7 @@ struct ath11k_buffer_addr {
  *		Address (upper 8 bits) of the msdu buffer or msdu extension
  *		descriptor or Link descriptor
  *
- * return_buffer_manager
+ * return_buffer_manager (RBM)
  *		Consumer: WBM
  *		Producer: SW/FW
  *		Indicates to which buffer manager the buffer or MSDU_EXTENSION
-- 
2.7.4


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
