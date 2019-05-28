Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from nbd.name ([2a01:4f8:221:3d45::2])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hVVuC-0001rg-2t
 for ath11k@lists.infradead.org; Tue, 28 May 2019 06:48:18 +0000
From: John Crispin <john@phrozen.org>
Subject: [PATCH V6 06/11] ath11k: add defines for max MCS rates per phymode
Date: Tue, 28 May 2019 08:47:58 +0200
Message-Id: <20190528064803.24419-7-john@phrozen.org>
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

Use defines rather than magic numbers.

Signed-off-by: Shashidhar Lakkavalli <slakkavalli@datto.com>
Signed-off-by: John Crispin <john@phrozen.org>
---
 drivers/net/wireless/ath/ath11k/core.h  | 4 ++++
 drivers/net/wireless/ath/ath11k/dp_rx.c | 4 ++--
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/core.h b/drivers/net/wireless/ath/ath11k/core.h
index 239bd98b3f8f..010ff8336376 100644
--- a/drivers/net/wireless/ath/ath11k/core.h
+++ b/drivers/net/wireless/ath/ath11k/core.h
@@ -49,6 +49,10 @@ enum wme_ac {
 	WME_NUM_AC
 };
 
+#define ATH11K_HT_MCS_MAX	7
+#define ATH11K_VHT_MCS_MAX	9
+#define ATH11K_HE_MCS_MAX	11
+
 static inline enum wme_ac ath11k_tid_to_ac(u32 tid)
 {
 	return (((tid == 0) || (tid == 3)) ? WME_AC_BE :
diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index 62820c20f7c1..e52a54cd2b79 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -1705,7 +1705,7 @@ static void ath11k_dp_rx_h_rate(struct ath11k *ar, void *rx_desc,
 		break;
 	case RX_MSDU_START_PKT_TYPE_11N:
 		rx_status->encoding = RX_ENC_HT;
-		if (rate_mcs > 7) {
+		if (rate_mcs > ATH11K_HT_MCS_MAX) {
 			ath11k_warn(ar->ab, "Received with invalid mcs in HT mode %d\n", rate_mcs);
 			break;
 		}
@@ -1717,7 +1717,7 @@ static void ath11k_dp_rx_h_rate(struct ath11k *ar, void *rx_desc,
 	case RX_MSDU_START_PKT_TYPE_11AC:
 		rx_status->encoding = RX_ENC_VHT;
 		rx_status->rate_idx = rate_mcs;
-		if (rate_mcs > 9) {
+		if (rate_mcs > ATH11K_VHT_MCS_MAX) {
 			ath11k_warn(ar->ab, "Received with invalid mcs in VHT mode %d\n", rate_mcs);
 			break;
 		}
-- 
2.20.1


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
