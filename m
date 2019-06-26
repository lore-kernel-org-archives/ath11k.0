Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hg9gm-0006dh-Fb
 for ath11k@lists.infradead.org; Wed, 26 Jun 2019 15:18:25 +0000
Received: from potku.adurom.net (88-114-240-156.elisa-laajakaista.fi
 [88.114.240.156])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: kvalo@smtp.codeaurora.org)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 56A1060709
 for <ath11k@lists.infradead.org>; Wed, 26 Jun 2019 15:18:23 +0000 (UTC)
From: Kalle Valo <kvalo@codeaurora.org>
Subject: [PATCH 3/4] ath11k: line over 90 characters
Date: Wed, 26 Jun 2019 18:18:14 +0300
Message-Id: <1561562295-17402-3-git-send-email-kvalo@codeaurora.org>
In-Reply-To: <1561562295-17402-1-git-send-email-kvalo@codeaurora.org>
References: <1561562295-17402-1-git-send-email-kvalo@codeaurora.org>
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

Fix checkpatch warning:

drivers/net/wireless/ath/ath11k/dp_rx.c:2283: line over 90 characters

Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/dp_rx.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index 14a20f39ed10..9a1c24705a32 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -2280,7 +2280,9 @@ int ath11k_dp_process_rx(struct ath11k_base *ab, int mac_id,
 			if (ret == -EIO) {
 				ath11k_err(ab, "rx ring got corrupted %d\n", ret);
 				__skb_queue_purge(&msdu_list);
-				/* Should stop processing any more rx in future from this ring? */
+				/* Should stop processing any more rx in
+				 * future from this ring?
+				 */
 				goto rcu_unlock;
 			}
 
-- 
2.7.4


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
