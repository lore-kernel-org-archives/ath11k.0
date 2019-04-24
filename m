Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hJ9qe-0007zH-CW
 for ath11k@lists.infradead.org; Wed, 24 Apr 2019 04:49:33 +0000
From: Karthikeyan Periyasamy <periyasa@codeaurora.org>
Subject: [PATCH] ath11k: update the encoding before validation check
Date: Wed, 24 Apr 2019 10:18:52 +0530
Message-Id: <1556081332-12586-1-git-send-email-periyasa@codeaurora.org>
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
Cc: Karthikeyan Periyasamy <periyasa@codeaurora.org>

In the rate handler, when invalid rate occurs encoding is not
updated. so the ieee80211_rx_status hold the default encoding
(RX_ENC_LEGACY). Update the correct encoding before validation
check, so that ieee80211_rx_status hold the correct encoding.

Signed-off-by: Karthikeyan Periyasamy <periyasa@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/dp_rx.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index b57cd30..0aeb67e 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -1643,23 +1643,23 @@ static void ath11k_dp_rx_h_rate(struct ath11k *ar, void *rx_desc,
 								is_cck);
 		break;
 	case RX_MSDU_START_PKT_TYPE_11N:
+		rx_status->encoding = RX_ENC_HT;
 		if (rate_mcs > 7) {
 			ath11k_warn(ar->ab, "Received with invalid mcs in HT mode %d\n", rate_mcs);
 			break;
 		}
 		rx_status->rate_idx = rate_mcs + (8 * (nss - 1));
-		rx_status->encoding = RX_ENC_HT;
 		if (sgi)
 			rx_status->enc_flags |= RX_ENC_FLAG_SHORT_GI;
 		rx_status->bw = ath11k_bw_to_mac80211_bw(bw);
 		break;
 	case RX_MSDU_START_PKT_TYPE_11AC:
+		rx_status->encoding = RX_ENC_VHT;
 		rx_status->rate_idx = rate_mcs;
 		if (rate_mcs > 9) {
 			ath11k_warn(ar->ab, "Received with invalid mcs in VHT mode %d\n", rate_mcs);
 			break;
 		}
-		rx_status->encoding = RX_ENC_VHT;
 		rx_status->nss = nss;
 		if (sgi)
 			rx_status->enc_flags |= RX_ENC_FLAG_SHORT_GI;
-- 
1.9.1


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
