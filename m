Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iUpeG-0008FI-MX
 for ath11k@lists.infradead.org; Wed, 13 Nov 2019 10:13:18 +0000
From: Manikanta Pubbisetty <mpubbise@codeaurora.org>
Subject: [PATCH] ath11k: fix vht guard interval mapping
Date: Wed, 13 Nov 2019 15:43:04 +0530
Message-Id: <1573639984-31249-1-git-send-email-mpubbise@codeaurora.org>
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
Cc: Manikanta Pubbisetty <mpubbise@codeaurora.org>

Guard interval value which comes from VHT_SIG_A TLV has a mapping
where value 0 corresponds to LGI, 1 and 3 corresponds to SGI.

Value 3 which is SGI(0.4us) in VHT was incorrectly mapped to a GI
of 3.2us(only applicable in HE) resulting in incorrect rx GI stats.
Fixing the mapping.

Signed-off-by: Manikanta Pubbisetty <mpubbise@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/hal_rx.c | 16 +++++++++++++---
 drivers/net/wireless/ath/ath11k/hal_rx.h |  6 ++++++
 2 files changed, 19 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/hal_rx.c b/drivers/net/wireless/ath/ath11k/hal_rx.c
index 2de4b38..70e693e 100644
--- a/drivers/net/wireless/ath/ath11k/hal_rx.c
+++ b/drivers/net/wireless/ath/ath11k/hal_rx.c
@@ -961,6 +961,7 @@ ath11k_hal_rx_parse_mon_status_tlv(struct ath11k_base *ab,
 			(struct hal_rx_vht_sig_a_info *)tlv_data;
 		u32 nsts;
 		u32 group_id;
+		u8 gi_setting;
 
 		info0 = __le32_to_cpu(vht_sig->info0);
 		info1 = __le32_to_cpu(vht_sig->info1);
@@ -969,9 +970,18 @@ ath11k_hal_rx_parse_mon_status_tlv(struct ath11k_base *ab,
 					    info0);
 		ppdu_info->mcs = FIELD_GET(HAL_RX_VHT_SIG_A_INFO_INFO1_MCS,
 					   info1);
-		ppdu_info->gi =
-			FIELD_GET(HAL_RX_VHT_SIG_A_INFO_INFO1_GI_SETTING,
-				  info1);
+		gi_setting = FIELD_GET(HAL_RX_VHT_SIG_A_INFO_INFO1_GI_SETTING,
+				       info1);
+		switch (gi_setting) {
+		case HAL_RX_VHT_SIG_A_NORMAL_GI:
+			ppdu_info->gi = HAL_RX_GI_0_8_US;
+			break;
+		case HAL_RX_VHT_SIG_A_SHORT_GI:
+		case HAL_RX_VHT_SIG_A_SHORT_GI_AMBIGUITY:
+			ppdu_info->gi = HAL_RX_GI_0_4_US;
+			break;
+		}
+
 		ppdu_info->is_stbc = info0 & HAL_RX_VHT_SIG_A_INFO_INFO0_STBC;
 		nsts = FIELD_GET(HAL_RX_VHT_SIG_A_INFO_INFO0_NSTS, info0);
 		if (ppdu_info->is_stbc && nsts > 0)
diff --git a/drivers/net/wireless/ath/ath11k/hal_rx.h b/drivers/net/wireless/ath/ath11k/hal_rx.h
index 96555e4..a6eb3de 100644
--- a/drivers/net/wireless/ath/ath11k/hal_rx.h
+++ b/drivers/net/wireless/ath/ath11k/hal_rx.h
@@ -213,6 +213,12 @@ struct hal_rx_vht_sig_a_info {
 	__le32 info1;
 } __packed;
 
+enum hal_rx_vht_sig_a_gi_setting {
+	HAL_RX_VHT_SIG_A_NORMAL_GI = 0,
+	HAL_RX_VHT_SIG_A_SHORT_GI = 1,
+	HAL_RX_VHT_SIG_A_SHORT_GI_AMBIGUITY = 3,
+};
+
 #define HAL_RX_HE_SIG_A_SU_INFO_INFO0_TRANSMIT_MCS	GENMASK(6, 3)
 #define HAL_RX_HE_SIG_A_SU_INFO_INFO0_DCM		BIT(7)
 #define HAL_RX_HE_SIG_A_SU_INFO_INFO0_TRANSMIT_BW	GENMASK(20, 19)
-- 
2.7.4


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
