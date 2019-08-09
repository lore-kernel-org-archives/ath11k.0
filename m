Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hw1AS-0000ez-2Q
 for ath11k@lists.infradead.org; Fri, 09 Aug 2019 09:26:37 +0000
Received: from [127.0.1.1] (88-114-240-156.elisa-laajakaista.fi
 [88.114.240.156])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: kvalo@smtp.codeaurora.org)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 307626083E
 for <ath11k@lists.infradead.org>; Fri,  9 Aug 2019 09:26:33 +0000 (UTC)
Subject: [PATCH 04/15] ath11k: remove unused IEEE80211_VHTCAP defines
From: Kalle Valo <kvalo@codeaurora.org>
Date: Fri, 09 Aug 2019 12:26:32 +0300
Message-ID: <156534279182.30736.14499654679081848241.stgit@x230>
In-Reply-To: <156534276745.30736.11736417077894270794.stgit@x230>
References: <156534276745.30736.11736417077894270794.stgit@x230>
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
To: ath11k@lists.infradead.org

I think these should be in ieee80211.h. Also add a fixme comment for the two
VHT MCS defines which are used.

Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/mac.h |   50 +--------------------------------
 1 file changed, 1 insertion(+), 49 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/mac.h b/drivers/net/wireless/ath/ath11k/mac.h
index 7ced4bc17c2e..29b42b145fc3 100644
--- a/drivers/net/wireless/ath/ath11k/mac.h
+++ b/drivers/net/wireless/ath/ath11k/mac.h
@@ -108,55 +108,7 @@ struct ath11k_generic_iter {
 				 WMI_VHT_CAP_RX_FIXED_ANT   |       \
 				 WMI_VHT_CAP_TX_FIXED_ANT)
 
-/* VHT capability flags */
-/* B0-B1 Maximum MPDU Length */
-#define IEEE80211_VHTCAP_MAX_MPDU_LEN_3839	0x00000000
-#define IEEE80211_VHTCAP_MAX_MPDU_LEN_7935	0x00000001
-#define IEEE80211_VHTCAP_MAX_MPDU_LEN_11454	0x00000002
-
-/* B2-B3 Supported Channel Width */
-#define IEEE80211_VHTCAP_SUP_CHAN_WIDTH_80	0x00000000
-#define IEEE80211_VHTCAP_SUP_CHAN_WIDTH_160	0x00000004
-#define IEEE80211_VHTCAP_SUP_CHAN_WIDTH_80_160	0x00000008
-#define IEEE80211_VHTCAP_SUP_CHAN_WIDTH_S	2
-
-#define IEEE80211_VHTCAP_RX_LDPC		0x00000010
-#define IEEE80211_VHTCAP_SHORTGI_80		0x00000020
-#define IEEE80211_VHTCAP_SHORTGI_160		0x00000040
-#define IEEE80211_VHTCAP_TX_STBC		0x00000080
-#define IEEE80211_VHTCAP_TX_STBC_S		7
-
-#define IEEE80211_VHTCAP_RX_STBC		0x00000700
-#define IEEE80211_VHTCAP_RX_STBC_S		8
-
-#define IEEE80211_VHTCAP_SU_BFORMER		0x00000800
-#define IEEE80211_VHTCAP_SU_BFORMER_S		11
-#define IEEE80211_VHTCAP_SU_BFORMEE		0x00001000
-#define IEEE80211_VHTCAP_SU_BFORMEE_S		12
-
-#define IEEE80211_VHTCAP_BF_MAX_ANT		0x0000E000
-#define IEEE80211_VHTCAP_BF_MAX_ANT_S		13
-
-#define IEEE80211_VHTCAP_STS_CAP_S		13
-#define IEEE80211_VHTCAP_STS_CAP_M		0x7
-
-#define IEEE80211_VHTCAP_SOUND_DIM		0x00070000
-#define IEEE80211_VHTCAP_SOUND_DIM_S		16
-
-#define IEEE80211_VHTCAP_MU_BFORMER		0x00080000
-#define IEEE80211_VHTCAP_MU_BFORMER_S		19
-#define IEEE80211_VHTCAP_MU_BFORMEE		0x00100000
-#define IEEE80211_VHTCAP_MU_BFORMEE_S		20
-#define IEEE80211_VHTCAP_TXOP_PS		0x00200000
-#define IEEE80211_VHTCAP_PLUS_HTC_VHT		0x00400000
-
-#define IEEE80211_VHTCAP_MAX_AMPDU_LEN_FACTOR	13
-#define IEEE80211_VHTCAP_MAX_AMPDU_LEN_EXP	0x03800000
-#define IEEE80211_VHTCAP_MAX_AMPDU_LEN_EXP_S	23
-
-#define IEEE80211_VHTCAP_LINK_ADAPT		0x0C000000
-#define IEEE80211_VHTCAP_RESERVED		0xF0000000
-
+/* FIXME: should these be in ieee80211.h? */
 #define IEEE80211_VHT_MCS_SUPPORT_0_11_MASK	GENMASK(23, 16)
 #define IEEE80211_DISABLE_VHT_MCS_SUPPORT_0_11	BIT(24)
 


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
