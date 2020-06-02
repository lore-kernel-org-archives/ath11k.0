Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail27.static.mailgun.info ([104.130.122.27])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jfuq9-0003h5-Ar
 for ath11k@lists.infradead.org; Tue, 02 Jun 2020 00:31:38 +0000
From: Rajkumar Manoharan <rmanohar@codeaurora.org>
Subject: [PATCH] ath11k: build HE 6 GHz capability
Date: Mon,  1 Jun 2020 17:31:28 -0700
Message-Id: <1591057888-2862-1-git-send-email-rmanohar@codeaurora.org>
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
Cc: linux-wireless@vger.kernel.org, Rajkumar Manoharan <rmanohar@codeaurora.org>

Build 6 GHz band capability from HT and VHT capabilities reported
by firmware.

Signed-off-by: Rajkumar Manoharan <rmanohar@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/core.h |  1 +
 drivers/net/wireless/ath/ath11k/mac.c  | 34 ++++++++++++++++++++++++++++++++++
 2 files changed, 35 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/core.h b/drivers/net/wireless/ath/ath11k/core.h
index e04f0e711779..f68e97c5695c 100644
--- a/drivers/net/wireless/ath/ath11k/core.h
+++ b/drivers/net/wireless/ath/ath11k/core.h
@@ -548,6 +548,7 @@ struct ath11k_band_cap {
 	u32 he_mcs;
 	u32 he_cap_phy_info[PSOC_HOST_MAX_PHY_SIZE];
 	struct ath11k_ppe_threshold he_ppet;
+	u16 he_6ghz_capa;
 };
 
 struct ath11k_pdev_cap {
diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 2836a0f197ab..3604e2e08d67 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -3532,6 +3532,35 @@ ath11k_mac_filter_he_cap_mesh(struct ieee80211_he_cap_elem *he_cap_elem)
 	he_cap_elem->phy_cap_info[9] &= ~m;
 }
 
+static __le16 ath11k_mac_setup_he_6ghz_cap(struct ath11k_pdev_cap *pcap,
+					   struct ath11k_band_cap *bcap)
+{
+	u8 val;
+
+	bcap->he_6ghz_capa = IEEE80211_HT_MPDU_DENSITY_NONE;
+	if (bcap->ht_cap_info & WMI_HT_CAP_DYNAMIC_SMPS)
+		bcap->he_6ghz_capa |=
+			FIELD_PREP(IEEE80211_HE_6GHZ_CAP_SM_PS,
+				   WLAN_HT_CAP_SM_PS_DYNAMIC);
+	else
+		bcap->he_6ghz_capa |=
+			FIELD_PREP(IEEE80211_HE_6GHZ_CAP_SM_PS,
+				   WLAN_HT_CAP_SM_PS_DISABLED);
+	val = FIELD_GET(IEEE80211_VHT_CAP_MAX_A_MPDU_LENGTH_EXPONENT_MASK,
+			pcap->vht_cap);
+	bcap->he_6ghz_capa |=
+		FIELD_PREP(IEEE80211_HE_6GHZ_CAP_MAX_AMPDU_LEN_EXP, val);
+	val = FIELD_GET(IEEE80211_VHT_CAP_MAX_MPDU_MASK, pcap->vht_cap);
+	bcap->he_6ghz_capa |=
+		FIELD_PREP(IEEE80211_HE_6GHZ_CAP_MAX_MPDU_LEN, val);
+	if (pcap->vht_cap & IEEE80211_VHT_CAP_RX_ANTENNA_PATTERN)
+		bcap->he_6ghz_capa |= IEEE80211_HE_6GHZ_CAP_RX_ANTPAT_CONS;
+	if (pcap->vht_cap & IEEE80211_VHT_CAP_TX_ANTENNA_PATTERN)
+		bcap->he_6ghz_capa |= IEEE80211_HE_6GHZ_CAP_TX_ANTPAT_CONS;
+
+	return cpu_to_le16(bcap->he_6ghz_capa);
+}
+
 static int ath11k_mac_copy_he_cap(struct ath11k *ar,
 				  struct ath11k_pdev_cap *cap,
 				  struct ieee80211_sband_iftype_data *data,
@@ -3614,6 +3643,11 @@ static int ath11k_mac_copy_he_cap(struct ath11k *ar,
 		    IEEE80211_HE_PHY_CAP6_PPE_THRESHOLD_PRESENT)
 			ath11k_gen_ppe_thresh(&band_cap->he_ppet,
 					      he_cap->ppe_thres);
+
+		if (band == NL80211_BAND_6GHZ) {
+			data[idx].he_6ghz_capa.capa =
+				ath11k_mac_setup_he_6ghz_cap(cap, band_cap);
+		}
 		idx++;
 	}
 
-- 
2.7.4


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
