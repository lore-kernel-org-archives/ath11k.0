Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hayli-0007bf-SJ
 for ath11k@lists.infradead.org; Wed, 12 Jun 2019 08:38:08 +0000
Received: from potku.adurom.net (88-114-240-156.elisa-laajakaista.fi
 [88.114.240.156])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: kvalo@smtp.codeaurora.org)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 865CE6038E
 for <ath11k@lists.infradead.org>; Wed, 12 Jun 2019 08:38:05 +0000 (UTC)
From: Kalle Valo <kvalo@codeaurora.org>
Subject: [PATCH] ath11k: fix sparse warnings in mac.c
Date: Wed, 12 Jun 2019 11:38:02 +0300
Message-Id: <1560328682-23694-1-git-send-email-kvalo@codeaurora.org>
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

drivers/net/wireless/ath/ath11k/mac.c:1306:83: warning: incorrect type in assignment (different base types)
drivers/net/wireless/ath/ath11k/mac.c:1306:83:    expected unsigned int
drivers/net/wireless/ath/ath11k/mac.c:1306:83:    got restricted __le16 const [usertype] rx_mcs_80p80
drivers/net/wireless/ath/ath11k/mac.c:1308:83: warning: incorrect type in assignment (different base types)
drivers/net/wireless/ath/ath11k/mac.c:1308:83:    expected unsigned int
drivers/net/wireless/ath/ath11k/mac.c:1308:83:    got restricted __le16 const [usertype] tx_mcs_80p80
drivers/net/wireless/ath/ath11k/mac.c:1312:73: warning: incorrect type in assignment (different base types)
drivers/net/wireless/ath/ath11k/mac.c:1312:73:    expected unsigned int
drivers/net/wireless/ath/ath11k/mac.c:1312:73:    got restricted __le16 const [usertype] rx_mcs_160
drivers/net/wireless/ath/ath11k/mac.c:1314:73: warning: incorrect type in assignment (different base types)
drivers/net/wireless/ath/ath11k/mac.c:1314:73:    expected unsigned int
drivers/net/wireless/ath/ath11k/mac.c:1314:73:    got restricted __le16 const [usertype] tx_mcs_160
drivers/net/wireless/ath/ath11k/mac.c:1320:72: warning: incorrect type in assignment (different base types)
drivers/net/wireless/ath/ath11k/mac.c:1320:72:    expected unsigned int
drivers/net/wireless/ath/ath11k/mac.c:1320:72:    got restricted __le16 const [usertype] rx_mcs_80
drivers/net/wireless/ath/ath11k/mac.c:1322:72: warning: incorrect type in assignment (different base types)
drivers/net/wireless/ath/ath11k/mac.c:1322:72:    expected unsigned int
drivers/net/wireless/ath/ath11k/mac.c:1322:72:    got restricted __le16 const [usertype] tx_mcs_80

Fixes: 17aca2d9a969 ("ath11k: add HE support")
Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/mac.c | 30 ++++++++++++++++++------------
 1 file changed, 18 insertions(+), 12 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index ee1f69524c4c..46d63841e1d1 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -1255,6 +1255,7 @@ static void ath11k_peer_assoc_h_he(struct ath11k *ar,
 				   struct peer_assoc_params *arg)
 {
 	const struct ieee80211_sta_he_cap *he_cap = &sta->he_cap;
+	u16 v;
 
 	if (!he_cap->has_he)
 		return;
@@ -1303,24 +1304,29 @@ static void ath11k_peer_assoc_h_he(struct ath11k *ar,
 	case IEEE80211_STA_RX_BW_160:
 		if (he_cap->he_cap_elem.phy_cap_info[0] &
 		    IEEE80211_HE_PHY_CAP0_CHANNEL_WIDTH_SET_80PLUS80_MHZ_IN_5G) {
-			arg->peer_he_rx_mcs_set[WMI_HECAP_TXRX_MCS_NSS_IDX_80_80] =
-				he_cap->he_mcs_nss_supp.rx_mcs_80p80;
-			arg->peer_he_tx_mcs_set[WMI_HECAP_TXRX_MCS_NSS_IDX_80_80] =
-				he_cap->he_mcs_nss_supp.tx_mcs_80p80;
+			v = le16_to_cpu(he_cap->he_mcs_nss_supp.rx_mcs_80p80);
+			arg->peer_he_rx_mcs_set[WMI_HECAP_TXRX_MCS_NSS_IDX_80_80] = v;
+
+			v = le16_to_cpu(he_cap->he_mcs_nss_supp.tx_mcs_80p80);
+			arg->peer_he_tx_mcs_set[WMI_HECAP_TXRX_MCS_NSS_IDX_80_80] = v;
+
 			arg->peer_he_mcs_count++;
 		}
-		arg->peer_he_rx_mcs_set[WMI_HECAP_TXRX_MCS_NSS_IDX_160] =
-			he_cap->he_mcs_nss_supp.rx_mcs_160;
-		arg->peer_he_tx_mcs_set[WMI_HECAP_TXRX_MCS_NSS_IDX_160] =
-			he_cap->he_mcs_nss_supp.tx_mcs_160;
+
+		v = le16_to_cpu(he_cap->he_mcs_nss_supp.rx_mcs_160);
+		arg->peer_he_rx_mcs_set[WMI_HECAP_TXRX_MCS_NSS_IDX_160] = v;
+
+		v = le16_to_cpu(he_cap->he_mcs_nss_supp.tx_mcs_160);
+		arg->peer_he_tx_mcs_set[WMI_HECAP_TXRX_MCS_NSS_IDX_160] = v;
+
 		arg->peer_he_mcs_count++;
 		/* drop through */
 
 	default:
-		arg->peer_he_rx_mcs_set[WMI_HECAP_TXRX_MCS_NSS_IDX_80] =
-			he_cap->he_mcs_nss_supp.rx_mcs_80;
-		arg->peer_he_tx_mcs_set[WMI_HECAP_TXRX_MCS_NSS_IDX_80] =
-			he_cap->he_mcs_nss_supp.tx_mcs_80;
+		v = le16_to_cpu(he_cap->he_mcs_nss_supp.rx_mcs_80);
+		arg->peer_he_rx_mcs_set[WMI_HECAP_TXRX_MCS_NSS_IDX_80] = v;
+		v = le16_to_cpu(he_cap->he_mcs_nss_supp.tx_mcs_80);
+		arg->peer_he_tx_mcs_set[WMI_HECAP_TXRX_MCS_NSS_IDX_80] = v;
 		arg->peer_he_mcs_count++;
 		break;
 	}
-- 
2.7.4


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
