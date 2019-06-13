Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hbKLP-0007f6-9A
 for ath11k@lists.infradead.org; Thu, 13 Jun 2019 07:40:27 +0000
Subject: RE: [PATCH v2] ath11k: fix firmware assert due to phymode mismatch
From: Manikanta Pubbisetty <mpubbise@qti.qualcomm.com>
Date: Thu, 13 Jun 2019 07:40:12 +0000
Message-ID: <8303bc380c3f4c2ca862968f3c7950df@APSANEXR01F.ap.qualcomm.com>
References: <1560411097-9094-1-git-send-email-mpubbise@codeaurora.org>
In-Reply-To: <1560411097-9094-1-git-send-email-mpubbise@codeaurora.org>
Content-Language: en-US
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
To: Manikanta Pubbisetty <mpubbise@codeaurora.org>, "ath11k@lists.infradead.org" <ath11k@lists.infradead.org>

Kalle,

Please ignore this patch, sent it to wrong mailing list; I'll make sure not to repeat this.

Thanks,
Manikanta

>-----Original Message-----
>From: ath11k <ath11k-bounces@lists.infradead.org> On Behalf Of Manikanta
>Pubbisetty
>Sent: Thursday, June 13, 2019 1:02 PM
>To: ath11k@lists.infradead.org
>Cc: Manikanta Pubbisetty <mpubbise@codeaurora.org>
>Subject: [EXT] [PATCH v2] ath11k: fix firmware assert due to phymode
>mismatch
>
>IPQ8074 firmware has a logic wherein it would trigger an assert if the
>phymode configured for the connecting peer is greater than the phymode
>configured for the VDEV.
>
>For example, if VDEV phymode is configured to be 11A and if a HT STA is
>configured to operate in HT20 then there would be a firmware assert.
>
>Fix this by configuring the phy_mode of the connecting peer correctly based
>on the current capabilties of the VDEV (AP/MESH).
>
>Signed-off-by: Manikanta Pubbisetty <mpubbise@codeaurora.org>
>---
>v2:
>	- use correct IE while checking for vht capabilties
>
> drivers/net/wireless/ath/ath11k/core.h |  3 +++
>drivers/net/wireless/ath/ath11k/mac.c  | 34
>+++++++++++++++++++++++++---------
> 2 files changed, 28 insertions(+), 9 deletions(-)
>
>diff --git a/drivers/net/wireless/ath/ath11k/core.h
>b/drivers/net/wireless/ath/ath11k/core.h
>index 038f905..f853c3c 100644
>--- a/drivers/net/wireless/ath/ath11k/core.h
>+++ b/drivers/net/wireless/ath/ath11k/core.h
>@@ -211,6 +211,9 @@ struct ath11k_vif {
> 	int num_legacy_stations;
> 	int rtscts_prot_mode;
> 	int txpower;
>+	bool ht_enabled;
>+	bool vht_enabled;
>+	bool he_enabled;
> };
>
> struct ath11k_vif_iter {
>diff --git a/drivers/net/wireless/ath/ath11k/mac.c
>b/drivers/net/wireless/ath/ath11k/mac.c
>index 8c47e09..7ca6958 100644
>--- a/drivers/net/wireless/ath/ath11k/mac.c
>+++ b/drivers/net/wireless/ath/ath11k/mac.c
>@@ -790,6 +790,7 @@ static int ath11k_mac_setup_bcn_tmpl(struct
>ath11k_vif *arvif)
> 	struct ieee80211_vif *vif = arvif->vif;
> 	struct ieee80211_mutable_offsets offs = {};
> 	struct sk_buff *bcn;
>+	u8 *ies;
> 	int ret;
>
> 	if (arvif->vdev_type != WMI_VDEV_TYPE_AP) @@ -809,6 +810,20 @@
>static int ath11k_mac_setup_bcn_tmpl(struct ath11k_vif *arvif)
> 		ath11k_warn(ab, "failed to submit beacon template
>command: %d\n",
> 			    ret);
>
>+	ies = bcn->data + ieee80211_get_hdrlen_from_skb(bcn);
>+	ies += 12; /* fixed parameters */
>+
>+	/* ht, vht and he capabilities are required to correctly configure
>+	 * the bandwidth (phy_mode) of the connecting peer during peer
>assoc,
>+	 * get these capabilities from beacon since mac80211 doesn't provide
>+	 * this info to the driver.
>+	 */
>+	arvif->ht_enabled = !!cfg80211_find_ie(WLAN_EID_HT_CAPABILITY,
>ies,
>+					       (u8 *)skb_tail_pointer(bcn) - ies);
>+	arvif->vht_enabled =
>!!cfg80211_find_ie(WLAN_EID_VHT_CAPABILITY, ies,
>+					       (u8 *)skb_tail_pointer(bcn) - ies);
>+	arvif->he_enabled =
>!!cfg80211_find_ie(WLAN_EID_EXT_HE_CAPABILITY, ies,
>+					       (u8 *)skb_tail_pointer(bcn) - ies);
> 	return ret;
> }
>
>@@ -1018,7 +1033,7 @@ static void ath11k_peer_assoc_h_ht(struct ath11k
>*ar,
> 	if (WARN_ON(ath11k_mac_vif_chan(vif, &def)))
> 		return;
>
>-	if (!ht_cap->ht_supported)
>+	if (!ht_cap->ht_supported || !arvif->ht_enabled)
> 		return;
>
> 	band = def.chan->band;
>@@ -1177,7 +1192,7 @@ static void ath11k_peer_assoc_h_vht(struct ath11k
>*ar,
> 	if (WARN_ON(ath11k_mac_vif_chan(vif, &def)))
> 		return;
>
>-	if (!vht_cap->vht_supported)
>+	if (!vht_cap->vht_supported || !arvif->vht_enabled)
> 		return;
>
> 	band = def.chan->band;
>@@ -1255,8 +1270,9 @@ static void ath11k_peer_assoc_h_he(struct ath11k
>*ar,
> 				   struct peer_assoc_params *arg)
> {
> 	const struct ieee80211_sta_he_cap *he_cap = &sta->he_cap;
>+	struct ath11k_vif *arvif = (void *)vif->drv_priv;
>
>-	if (!he_cap->has_he)
>+	if (!he_cap->has_he || !arvif->he_enabled)
> 		return;
>
> 	arg->he_flag = true;
>@@ -1537,20 +1553,20 @@ static void ath11k_peer_assoc_h_phymode(struct
>ath11k *ar,
>
> 	switch (band) {
> 	case NL80211_BAND_2GHZ:
>-		if (sta->he_cap.has_he) {
>+		if (sta->he_cap.has_he && arvif->he_enabled) {
> 			if (sta->bandwidth == IEEE80211_STA_RX_BW_80)
> 				phymode = MODE_11AX_HE80_2G;
> 			else if (sta->bandwidth ==
>IEEE80211_STA_RX_BW_40)
> 				phymode = MODE_11AX_HE40_2G;
> 			else
> 				phymode = MODE_11AX_HE20_2G;
>-		} else if (sta->vht_cap.vht_supported &&
>+		} else if (sta->vht_cap.vht_supported && arvif->vht_enabled
>&&
> 		    !ath11k_peer_assoc_h_vht_masked(vht_mcs_mask)) {
> 			if (sta->bandwidth == IEEE80211_STA_RX_BW_40)
> 				phymode = MODE_11AC_VHT40;
> 			else
> 				phymode = MODE_11AC_VHT20;
>-		} else if (sta->ht_cap.ht_supported &&
>+		} else if (sta->ht_cap.ht_supported && arvif->ht_enabled &&
> 			   !ath11k_peer_assoc_h_ht_masked(ht_mcs_mask))
>{
> 			if (sta->bandwidth == IEEE80211_STA_RX_BW_40)
> 				phymode = MODE_11NG_HT40;
>@@ -1564,12 +1580,12 @@ static void ath11k_peer_assoc_h_phymode(struct
>ath11k *ar,
> 		break;
> 	case NL80211_BAND_5GHZ:
> 		/* Check HE first */
>-		if (sta->he_cap.has_he) {
>+		if (sta->he_cap.has_he && arvif->he_enabled) {
> 			phymode = ath11k_mac_get_phymode_he(ar, sta);
>-		} else if (sta->vht_cap.vht_supported &&
>+		} else if (sta->vht_cap.vht_supported && arvif->vht_enabled
>&&
> 		    !ath11k_peer_assoc_h_vht_masked(vht_mcs_mask)) {
> 			phymode = ath11k_mac_get_phymode_vht(ar, sta);
>-		} else if (sta->ht_cap.ht_supported &&
>+		} else if (sta->ht_cap.ht_supported && arvif->ht_enabled &&
> 			   !ath11k_peer_assoc_h_ht_masked(ht_mcs_mask))
>{
> 			if (sta->bandwidth >= IEEE80211_STA_RX_BW_40)
> 				phymode = MODE_11NA_HT40;
>--
>2.7.4
>
>
>_______________________________________________
>ath11k mailing list
>ath11k@lists.infradead.org
>http://lists.infradead.org/mailman/listinfo/ath11k

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
