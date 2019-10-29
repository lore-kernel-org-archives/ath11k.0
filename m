Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iPLV7-0001gH-I8
 for ath11k@lists.infradead.org; Tue, 29 Oct 2019 07:01:11 +0000
From: Anilkumar Kolli <akolli@codeaurora.org>
Subject: [PATCH] ath11k: mac: Remove WAR on max a-mpdu len in vht
Date: Tue, 29 Oct 2019 12:30:56 +0530
Message-Id: <1572332456-5419-1-git-send-email-akolli@codeaurora.org>
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

Revert commit a24b88b56074424a413a ("ath10k: Fix bug in max.
VHT A-MPDU size"), Moving this logic to mac80211.

Signed-off-by: Anilkumar Kolli <akolli@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/mac.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index d2a4bae6e057..2c9f57e741c3 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -1041,14 +1041,7 @@ static void ath11k_peer_assoc_h_vht(struct ath11k *ar,
 			IEEE80211_VHT_CAP_MAX_A_MPDU_LENGTH_EXPONENT_MASK) >>
 		       IEEE80211_VHT_CAP_MAX_A_MPDU_LENGTH_EXPONENT_SHIFT;
 
-	/* Workaround: Some Netgear/Linksys 11ac APs set Rx A-MPDU factor to
-	 * zero in VHT IE. Using it would result in degraded throughput.
-	 * arg->peer_max_mpdu at this point contains HT max_mpdu so keep
-	 * it if VHT max_mpdu is smaller.
-	 */
-	arg->peer_max_mpdu = max(arg->peer_max_mpdu,
-				 (1U << (IEEE80211_HT_MAX_AMPDU_FACTOR +
-					ampdu_factor)) - 1);
+	arg->peer_max_mpdu = BIT(IEEE80211_HT_MAX_AMPDU_FACTOR + ampdu_factor) - 1;
 
 	if (sta->bandwidth == IEEE80211_STA_RX_BW_80)
 		arg->bw_80 = true;
-- 
1.9.1


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
