Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from nbd.name ([2a01:4f8:221:3d45::2])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hVVuC-0001sJ-II
 for ath11k@lists.infradead.org; Tue, 28 May 2019 06:48:20 +0000
From: John Crispin <john@phrozen.org>
Subject: [PATCH V6 07/11] ath11k: handle rx status for HE frames
Date: Tue, 28 May 2019 08:47:59 +0200
Message-Id: <20190528064803.24419-8-john@phrozen.org>
In-Reply-To: <20190528064803.24419-1-john@phrozen.org>
References: <20190528064803.24419-1-john@phrozen.org>
MIME-Version: 1.0
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+kvalo=adurom.com@lists.infradead.org
To: Kalle Valo <kvalo@codeaurora.org>
Cc: Shashidhar Lakkavalli <slakkavalli@datto.com>, ath11k@lists.infradead.org, John Crispin <john@phrozen.org>

The case clause handling HE frames was not handled yet in the code reading
the RX status. The new case is identical to VHT with the difference of the
higher maximum MCS rate.

Signed-off-by: Shashidhar Lakkavalli <slakkavalli@datto.com>
Signed-off-by: John Crispin <john@phrozen.org>
---
 drivers/net/wireless/ath/ath11k/dp_rx.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index e52a54cd2b79..71d385cf55d7 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -1727,7 +1727,16 @@ static void ath11k_dp_rx_h_rate(struct ath11k *ar, void *rx_desc,
 		rx_status->bw = ath11k_bw_to_mac80211_bw(bw);
 		break;
 	case RX_MSDU_START_PKT_TYPE_11AX:
-		ath11k_warn(ar->ab, "pkt_type %d not yet supported\n", pkt_type);
+		rx_status->rate_idx = rate_mcs;
+		if (rate_mcs > ATH11K_HE_MCS_MAX) {
+			ath11k_warn(ar->ab,
+				    "Received with invalid mcs in HE mode %d\n",
+				    rate_mcs);
+			break;
+		}
+		rx_status->encoding = RX_ENC_HE;
+		rx_status->nss = nss;
+		rx_status->bw = ath11k_bw_to_mac80211_bw(bw);
 		break;
 	}
 }
-- 
2.20.1


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
