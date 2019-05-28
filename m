Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hVUyJ-0007AX-2d
 for ath11k@lists.infradead.org; Tue, 28 May 2019 05:48:28 +0000
Received: from vasanth-lnx.qca.qualcomm.com
 (blr-c-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.19.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: vthiagar@smtp.codeaurora.org)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 7CF1260795
 for <ath11k@lists.infradead.org>; Tue, 28 May 2019 05:48:24 +0000 (UTC)
From: Vasanthakumar Thiagarajan <vthiagar@codeaurora.org>
Subject: [PATCH 1/4] ath11k: Fix endianness related sparse warnings
Date: Tue, 28 May 2019 11:18:03 +0530
Message-Id: <1559022486-7073-1-git-send-email-vthiagar@codeaurora.org>
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

drivers/net/wireless/ath/ath11k/hal_rx.c:1142:27: warning: cast to restricted __le32
drivers/net/wireless/ath/ath11k/hal_rx.c:1142:27: warning: cast to restricted __le32

drivers/net/wireless/ath/ath11k/dp_rx.c:3433:16: warning: Using plain integer as NULL pointer
drivers/net/wireless/ath/ath11k/dp_rx.h:335:19: warning: cast to restricted __le32
drivers/net/wireless/ath/ath11k/dp_rx.h:335:19: warning: restricted __le32 degrades to integer
drivers/net/wireless/ath/ath11k/dp_rx.h:335:19: warning: restricted __le32 degrades to integer
drivers/net/wireless/ath/ath11k/dp_rx.h:344:35: warning: incorrect type in return expression (different base types)
drivers/net/wireless/ath/ath11k/dp_rx.h:344:35:    expected unsigned int
drivers/net/wireless/ath/ath11k/dp_rx.h:344:35:    got restricted __le16 [usertype] phy_ppdu_id
drivers/net/wireless/ath/ath11k/dp_rx.h:306:16: warning: cast to restricted __le32
drivers/net/wireless/ath/ath11k/dp_rx.h:306:16: warning: restricted __le32 degrades to integer
drivers/net/wireless/ath/ath11k/dp_rx.h:306:16: warning: restricted __le32 degrades to integer
drivers/net/wireless/ath/ath11k/dp_rx.h:316:16: warning: cast to restricted __le32
drivers/net/wireless/ath/ath11k/dp_rx.h:316:16: warning: restricted __le32 degrades to integer
drivers/net/wireless/ath/ath11k/dp_rx.h:316:16: warning: restricted __le32 degrades to integer

Signed-off-by: Vasanthakumar Thiagarajan <vthiagar@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/dp_rx.h  | 10 ++++++----
 drivers/net/wireless/ath/ath11k/hal_rx.h |  6 +++---
 2 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.h b/drivers/net/wireless/ath/ath11k/dp_rx.h
index 5fe6e6d..75d9150 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.h
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.h
@@ -303,7 +303,8 @@ static inline u32 ath11k_dp_rxdesc_get_mpdulen_err(void *hw_desc_addr)
 
 	rx_attn = &rx_desc->attention;
 
-	return FIELD_GET(RX_ATTENTION_INFO1_MPDU_LEN_ERR, rx_attn->info1);
+	return FIELD_GET(RX_ATTENTION_INFO1_MPDU_LEN_ERR,
+			 __le32_to_cpu(rx_attn->info1));
 }
 
 static inline u32 ath11k_dp_rxdesc_get_decap_format(void *hw_desc_addr)
@@ -314,7 +315,7 @@ static inline u32 ath11k_dp_rxdesc_get_decap_format(void *hw_desc_addr)
 	rx_msdu_start = &rx_desc->msdu_start;
 
 	return FIELD_GET(RX_MSDU_START_INFO2_DECAP_FORMAT,
-			rx_msdu_start->info2);
+			__le32_to_cpu(rx_msdu_start->info2));
 }
 
 static inline u8 *ath11k_dp_rxdesc_get_80211hdr(void *hw_desc_addr)
@@ -332,7 +333,8 @@ static inline bool ath11k_dp_rxdesc_mpdu_valid(void *hw_desc_addr)
 	struct hal_rx_desc *rx_desc = (struct hal_rx_desc *)hw_desc_addr;
 	u32 tlv_tag;
 
-	tlv_tag = FIELD_GET(HAL_TLV_HDR_TAG, rx_desc->mpdu_start_tag);
+	tlv_tag = FIELD_GET(HAL_TLV_HDR_TAG,
+			    __le32_to_cpu(rx_desc->mpdu_start_tag));
 
 	return tlv_tag == HAL_RX_MPDU_START ? true : false;
 }
@@ -341,7 +343,7 @@ static inline u32 ath11k_dp_rxdesc_get_ppduid(void *hw_desc_addr)
 {
 	struct hal_rx_desc *rx_desc = (struct hal_rx_desc *)hw_desc_addr;
 
-	return rx_desc->mpdu_start.phy_ppdu_id;
+	return __le16_to_cpu(rx_desc->mpdu_start.phy_ppdu_id);
 }
 
 int ath11k_dp_rx_ampdu_start(struct ath11k *ar,
diff --git a/drivers/net/wireless/ath/ath11k/hal_rx.h b/drivers/net/wireless/ath/ath11k/hal_rx.h
index 439a36f..650ebe5 100644
--- a/drivers/net/wireless/ath/ath11k/hal_rx.h
+++ b/drivers/net/wireless/ath/ath11k/hal_rx.h
@@ -270,9 +270,9 @@ struct hal_rx_phyrx_rssi_legacy_info {
 
 #define HAL_RX_MPDU_INFO_INFO0_PEERID	GENMASK(31, 16)
 struct hal_rx_mpdu_info {
-	u32 rsvd0;
-	u32 info0;
-	u32 rsvd1[21];
+	__le32 rsvd0;
+	__le32 info0;
+	__le32 rsvd1[21];
 } __packed;
 
 struct hal_rx_rxpcu_classification_overview {
-- 
1.9.1


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
