Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail27.static.mailgun.info ([104.130.122.27])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jNxA0-0002i3-Rv
 for ath11k@lists.infradead.org; Mon, 13 Apr 2020 11:21:54 +0000
From: Govindaraj Saminathan <gsamin@codeaurora.org>
Subject: [PATCH] ath11k: cleanup reo command error code overwritten
Date: Mon, 13 Apr 2020 16:51:12 +0530
Message-Id: <1586776872-25766-1-git-send-email-gsamin@codeaurora.org>
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
Cc: Govindaraj Saminathan <gsamin@codeaurora.org>, linux-wireless@vger.kernel.org

should not overwrite the error code. No buffer available then return
invalid. For other failures return the error code of actual failure.

Signed-off-by: Govindaraj Saminathan <gsamin@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/dp_tx.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/dp_tx.c b/drivers/net/wireless/ath/ath11k/dp_tx.c
index 7aac4b0..6f40e72 100644
--- a/drivers/net/wireless/ath/ath11k/dp_tx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_tx.c
@@ -543,8 +543,12 @@ int ath11k_dp_tx_send_reo_cmd(struct ath11k_base *ab, struct dp_rx_tid *rx_tid,
 	cmd_ring = &ab->hal.srng_list[dp->reo_cmd_ring.ring_id];
 	cmd_num = ath11k_hal_reo_cmd_send(ab, cmd_ring, type, cmd);
 
+	/* cmd_num should start from 1, during failure return the error code */
+	if (cmd_num < 0)
+		return cmd_num;
+
 	/* reo cmd ring descriptors has cmd_num starting from 1 */
-	if (cmd_num <= 0)
+	if (cmd_num == 0)
 		return -EINVAL;
 
 	if (!cb)
-- 
1.9.1

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
