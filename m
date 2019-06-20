Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1he2XM-0001tn-Ox
 for ath11k@lists.infradead.org; Thu, 20 Jun 2019 19:15:57 +0000
From: Muna Sinada <msinada@codeaurora.org>
Subject: [PATCH 4/4] ath11k: removing unnecessary parentheses
Date: Thu, 20 Jun 2019 12:15:29 -0700
Message-Id: <1561058129-25625-4-git-send-email-msinada@codeaurora.org>
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

Removed unnecessary parentheses because of operator precedence

Signed-off-by: Muna Sinada <msinada@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/hal_rx.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/hal_rx.c b/drivers/net/wireless/ath/ath11k/hal_rx.c
index 376b519595c1..76b93f6c33cd 100644
--- a/drivers/net/wireless/ath/ath11k/hal_rx.c
+++ b/drivers/net/wireless/ath/ath11k/hal_rx.c
@@ -338,8 +338,8 @@ int ath11k_hal_desc_reo_parse_err(struct ath11k_base *ab, u32 *rx_desc,
 			     desc->info0);
 	ab->soc_stats.reo_error[err_code]++;
 
-	if ((push_reason != HAL_REO_DEST_RING_PUSH_REASON_ERR_DETECTED)	&&
-	    (push_reason != HAL_REO_DEST_RING_PUSH_REASON_ROUTING_INSTRUCTION)) {
+	if (push_reason != HAL_REO_DEST_RING_PUSH_REASON_ERR_DETECTED &&
+	    push_reason != HAL_REO_DEST_RING_PUSH_REASON_ROUTING_INSTRUCTION) {
 		ath11k_warn(ab, "expected error push reason code, received %d\n",
 			    push_reason);
 		return -EINVAL;
-- 
2.7.4


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
