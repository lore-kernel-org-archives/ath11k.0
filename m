Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hNu3g-000397-U6
 for ath11k@lists.infradead.org; Tue, 07 May 2019 06:58:38 +0000
Received: from localhost.localdomain (37-136-65-53.rev.dnainternet.fi
 [37.136.65.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: kvalo@smtp.codeaurora.org)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 4156A6016D
 for <ath11k@lists.infradead.org>; Tue,  7 May 2019 06:58:35 +0000 (UTC)
From: Kalle Valo <kvalo@codeaurora.org>
Subject: [PATCH 1/2] ath11k: fix assignment of struct
 hal_rx_mon_ppdu_info::ldpc
Date: Tue,  7 May 2019 09:58:31 +0300
Message-Id: <1557212312-11990-1-git-send-email-kvalo@codeaurora.org>
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

ath11k_dp_rx_update_peer_stats() assumes that struct hal_rx_mon_ppdu_info::ldpc
contains the value enum hal_rx_su_mu_coding but way it was assigned in
ath11k_hal_rx_parse_mon_status_tlv() was completely broken. Fix that using
FIELD_GET().

Fixes GCC warnings:

drivers/net/wireless/ath/ath11k/hal_rx.c:932:45: warning: bitwise comparison always evaluates to false [-Wtautological-compare]
drivers/net/wireless/ath/ath11k/hal_rx.c:985:50: warning: bitwise comparison always evaluates to false [-Wtautological-compare]
drivers/net/wireless/ath/ath11k/hal_rx.c:1026:46: warning: bitwise comparison always evaluates to false [-Wtautological-compare]
drivers/net/wireless/ath/ath11k/hal_rx.c:1110:51: warning: bitwise comparison always evaluates to false [-Wtautological-compare]
drivers/net/wireless/ath/ath11k/hal_rx.c:1131:51: warning: bitwise comparison always evaluates to false [-Wtautological-compare]

Only compile tested and I didn't check if the firmware interface definitions are correct.

Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/hal_rx.c | 24 ++++++++----------------
 1 file changed, 8 insertions(+), 16 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/hal_rx.c b/drivers/net/wireless/ath/ath11k/hal_rx.c
index 2bdb53287d8e..b8a3e8714fff 100644
--- a/drivers/net/wireless/ath/ath11k/hal_rx.c
+++ b/drivers/net/wireless/ath/ath11k/hal_rx.c
@@ -928,9 +928,7 @@ ath11k_hal_rx_parse_mon_status_tlv(struct ath11k_base *ab,
 		ppdu_info->bw = FIELD_GET(HAL_RX_HT_SIG_INFO_INFO0_BW, info0);
 		ppdu_info->is_stbc = FIELD_GET(HAL_RX_HT_SIG_INFO_INFO1_STBC,
 					       info1);
-		ppdu_info->ldpc = (info1 &
-				   HAL_RX_HT_SIG_INFO_INFO1_FEC_CODING) ==
-					HAL_RX_SU_MU_CODING_LDPC;
+		ppdu_info->ldpc = FIELD_GET(HAL_RX_HT_SIG_INFO_INFO1_FEC_CODING, info1);
 		ppdu_info->gi = info1 & HAL_RX_HT_SIG_INFO_INFO1_GI;
 
 		switch (ppdu_info->mcs) {
@@ -981,9 +979,8 @@ ath11k_hal_rx_parse_mon_status_tlv(struct ath11k_base *ab,
 		info0 = __le32_to_cpu(vht_sig->info0);
 		info1 = __le32_to_cpu(vht_sig->info1);
 
-		ppdu_info->ldpc = (info1 &
-				   HAL_RX_VHT_SIG_A_INFO_INFO1_SU_MU_CODING) ==
-					HAL_RX_SU_MU_CODING_LDPC;
+		ppdu_info->ldpc = FIELD_GET(HAL_RX_VHT_SIG_A_INFO_INFO1_SU_MU_CODING,
+					    info0);
 		ppdu_info->mcs = FIELD_GET(HAL_RX_VHT_SIG_A_INFO_INFO1_MCS,
 					   info1);
 		ppdu_info->gi =
@@ -1022,9 +1019,7 @@ ath11k_hal_rx_parse_mon_status_tlv(struct ath11k_base *ab,
 		ppdu_info->bw =
 			FIELD_GET(HAL_RX_HE_SIG_A_SU_INFO_INFO0_TRANSMIT_BW,
 				  info0);
-		ppdu_info->ldpc = (info1 &
-				   HAL_RX_HE_SIG_A_SU_INFO_INFO1_CODING) ==
-					HAL_RX_SU_MU_CODING_LDPC;
+		ppdu_info->ldpc = FIELD_GET(HAL_RX_HE_SIG_A_SU_INFO_INFO1_CODING, info0);
 		ppdu_info->is_stbc = info1 &
 				     HAL_RX_HE_SIG_A_SU_INFO_INFO1_STBC;
 		ppdu_info->beamformed = info1 &
@@ -1106,9 +1101,8 @@ ath11k_hal_rx_parse_mon_status_tlv(struct ath11k_base *ab,
 		ppdu_info->nss =
 			FIELD_GET(HAL_RX_HE_SIG_B2_MU_INFO_INFO0_STA_NSTS,
 				  info0) + 1;
-		ppdu_info->ldpc = (info0 &
-				   HAL_RX_HE_SIG_B2_MU_INFO_INFO0_STA_CODING) ==
-					HAL_RX_SU_MU_CODING_LDPC;
+		ppdu_info->ldpc = FIELD_GET(HAL_RX_HE_SIG_B2_MU_INFO_INFO0_STA_CODING,
+					    info0);
 		break;
 	}
 	case HAL_PHYRX_HE_SIG_B2_OFDMA: {
@@ -1126,10 +1120,8 @@ ath11k_hal_rx_parse_mon_status_tlv(struct ath11k_base *ab,
 		ppdu_info->beamformed =
 			info0 &
 			HAL_RX_HE_SIG_B2_OFDMA_INFO_INFO0_STA_TXBF;
-		ppdu_info->ldpc =
-			(info0 &
-			 HAL_RX_HE_SIG_B2_OFDMA_INFO_INFO0_STA_CODING) ==
-				HAL_RX_SU_MU_CODING_LDPC;
+		ppdu_info->ldpc = FIELD_GET(HAL_RX_HE_SIG_B2_OFDMA_INFO_INFO0_STA_CODING,
+					    info0);
 		ppdu_info->reception_type = HAL_RX_RECEPTION_TYPE_MU_OFDMA;
 		break;
 	}
-- 
2.7.4


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
