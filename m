Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from nbd.name ([2a01:4f8:221:3d45::2])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hJiwP-0008PP-Nx
 for ath11k@lists.infradead.org; Thu, 25 Apr 2019 18:17:52 +0000
From: John Crispin <john@phrozen.org>
Subject: [PATCH V2 3/4] ath11k: handle rx status for HE frames
Date: Thu, 25 Apr 2019 20:17:39 +0200
Message-Id: <20190425181740.1994-4-john@phrozen.org>
In-Reply-To: <20190425181740.1994-1-john@phrozen.org>
References: <20190425181740.1994-1-john@phrozen.org>
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
To: Kalle Valo <kvalo@codeaurora.org>, ath11k@lists.infradead.org
Cc: Shashidhar Lakkavalli <slakkavalli@datto.com>, Srini Kode <skode@qti.qualcomm.com>, Rajkumar Manoharan <rmanohar@qti.qualcomm.com>, John Crispin <john@phrozen.org>

The case clause handling HE frames was not handled yet in the code reading
the RX status. The new case is identical to VHT with the difference of the
higher maximum MCS rate.

Signed-off-by: Shashidhar Lakkavalli <slakkavalli@datto.com>
Signed-off-by: John Crispin <john@phrozen.org>
---
 drivers/net/wireless/ath/ath11k/dp_rx.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index f95c2837bc40..adc34aa56c09 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -1666,7 +1666,16 @@ static void ath11k_dp_rx_h_rate(struct ath11k *ar, void *rx_desc,
 		rx_status->bw = ath11k_bw_to_mac80211_bw(bw);
 		break;
 	case RX_MSDU_START_PKT_TYPE_11AX:
-		ath11k_warn(ar->ab, "pkt_type %d not yet supported\n", pkt_type);
+		rx_status->rate_idx = rate_mcs;
+		if (rate_mcs > 11) {
+			ath11k_warn(ar->ab, "Received with invalid mcs in HE mode %d\n", rate_mcs);
+			break;
+		}
+		rx_status->encoding = RX_ENC_HE;
+		rx_status->nss = nss;
+		if (sgi)
+			rx_status->enc_flags |= RX_ENC_FLAG_SHORT_GI;
+		rx_status->bw = ath11k_bw_to_mac80211_bw(bw);
 		break;
 	}
 }
-- 
2.11.0


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
