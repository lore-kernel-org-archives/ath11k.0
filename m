Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hNu41-0003Ct-QC
 for ath11k@lists.infradead.org; Tue, 07 May 2019 06:58:58 +0000
From: Maharaja Kennadyrajan <mkenna@codeaurora.org>
Subject: [PATCH] ath11k: Removed unused comment in the function
 ath11k_peer_assoc_h_vht_limit()
Date: Tue,  7 May 2019 12:29:26 +0530
Message-Id: <1557212366-911-1-git-send-email-mkenna@codeaurora.org>
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

Removed unused comment in the function ath11k_peer_assoc_h_vht_limit().

Signed-off-by: Maharaja Kennadyrajan <mkenna@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/mac.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index ddb8beba3ab7..0c021f48a5cd 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -1166,7 +1166,6 @@ ath11k_peer_assoc_h_vht_limit(u16 tx_mcs_set,
 		case 5: /* fall through */
 		case 6: /* fall through */
 		default:
-			/* see ath10k_mac_can_set_bitrate_mask() */
 			WARN_ON(1);
 			/* fall through */
 		case -1:
-- 
2.21.0


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
