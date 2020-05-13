Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail27.static.mailgun.info ([104.130.122.27])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jYxJs-0000M5-13
 for ath11k@lists.infradead.org; Wed, 13 May 2020 19:45:36 +0000
From: Rajkumar Manoharan <rmanohar@codeaurora.org>
Subject: [PATCH v3 01/11] cfg80211: use only HE capability to set prohibited
 flags in 6 GHz
Date: Wed, 13 May 2020 12:44:55 -0700
Message-Id: <1589399105-25472-1-git-send-email-rmanohar@codeaurora.org>
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
To: johannes@sipsolutions.net, kvalo@codeaurora.org
Cc: Vamsi Krishna <vamsin@codeaurora.org>, linux-wireless@vger.kernel.org, ath11k@lists.infradead.org, Rajkumar Manoharan <rmanohar@codeaurora.org>

The prohibited flags to determine whether configured bandwidth
is supported by driver are validated only against HT and VHT capability.
In 6 GHz band, Only HE capability should be validated to find out
given chandef is usable.

Co-developed-by: Vamsi Krishna <vamsin@codeaurora.org>
Signed-off-by: Vamsi Krishna <vamsin@codeaurora.org>
Signed-off-by: Rajkumar Manoharan <rmanohar@codeaurora.org>
---
 net/wireless/chan.c | 54 +++++++++++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 50 insertions(+), 4 deletions(-)

diff --git a/net/wireless/chan.c b/net/wireless/chan.c
index fcac5c6366e1..582b487576e1 100644
--- a/net/wireless/chan.c
+++ b/net/wireless/chan.c
@@ -19,6 +19,11 @@ static bool cfg80211_valid_60g_freq(u32 freq)
 	return freq >= 58320 && freq <= 70200;
 }
 
+static bool cfg80211_is_6ghz_freq(u32 freq)
+{
+	return (freq > 5940 && freq < 7105);
+}
+
 void cfg80211_chandef_create(struct cfg80211_chan_def *chandef,
 			     struct ieee80211_channel *chan,
 			     enum nl80211_channel_type chan_type)
@@ -882,6 +887,7 @@ bool cfg80211_chandef_usable(struct wiphy *wiphy,
 	struct ieee80211_sta_ht_cap *ht_cap;
 	struct ieee80211_sta_vht_cap *vht_cap;
 	struct ieee80211_edmg *edmg_cap;
+	const struct ieee80211_sta_he_cap *he_cap;
 	u32 width, control_freq, cap;
 
 	if (WARN_ON(!cfg80211_chandef_valid(chandef)))
@@ -890,6 +896,7 @@ bool cfg80211_chandef_usable(struct wiphy *wiphy,
 	ht_cap = &wiphy->bands[chandef->chan->band]->ht_cap;
 	vht_cap = &wiphy->bands[chandef->chan->band]->vht_cap;
 	edmg_cap = &wiphy->bands[chandef->chan->band]->edmg_cap;
+	he_cap = ieee80211_get_he_sta_cap(wiphy->bands[chandef->chan->band]);
 
 	if (edmg_cap->channels &&
 	    !cfg80211_edmg_usable(wiphy,
@@ -919,6 +926,16 @@ bool cfg80211_chandef_usable(struct wiphy *wiphy,
 		break;
 	case NL80211_CHAN_WIDTH_40:
 		width = 40;
+		if (cfg80211_is_6ghz_freq(chandef->center_freq1)) {
+			if (!he_cap)
+				return false;
+			if (!he_cap->has_he_6ghz)
+				return false;
+			if (!(he_cap->he_cap_elem.phy_cap_info[0] &
+			      IEEE80211_HE_PHY_CAP0_CHANNEL_WIDTH_SET_40MHZ_80MHZ_IN_5G))
+				return false;
+			break;
+		}
 		if (!ht_cap->ht_supported)
 			return false;
 		if (!(ht_cap->cap & IEEE80211_HT_CAP_SUP_WIDTH_20_40) ||
@@ -933,24 +950,53 @@ bool cfg80211_chandef_usable(struct wiphy *wiphy,
 		break;
 	case NL80211_CHAN_WIDTH_80P80:
 		cap = vht_cap->cap & IEEE80211_VHT_CAP_SUPP_CHAN_WIDTH_MASK;
-		if (cap != IEEE80211_VHT_CAP_SUPP_CHAN_WIDTH_160_80PLUS80MHZ)
+		if (!cfg80211_is_6ghz_freq(chandef->center_freq1) &&
+		    cap != IEEE80211_VHT_CAP_SUPP_CHAN_WIDTH_160_80PLUS80MHZ)
 			return false;
+		if (cfg80211_is_6ghz_freq(chandef->center_freq1)) {
+			if (!he_cap)
+				return false;
+			if (!he_cap->has_he_6ghz)
+				return false;
+			if (!(he_cap->he_cap_elem.phy_cap_info[0] &
+			      IEEE80211_HE_PHY_CAP0_CHANNEL_WIDTH_SET_80PLUS80_MHZ_IN_5G))
+				return false;
+		}
 		/* fall through */
 	case NL80211_CHAN_WIDTH_80:
-		if (!vht_cap->vht_supported)
+		if (cfg80211_is_6ghz_freq(chandef->center_freq1)) {
+			if (!he_cap)
+				return false;
+			if (!he_cap->has_he_6ghz)
+				return false;
+			if (!(he_cap->he_cap_elem.phy_cap_info[0] &
+			      IEEE80211_HE_PHY_CAP0_CHANNEL_WIDTH_SET_40MHZ_80MHZ_IN_5G))
+				return false;
+		} else if (!vht_cap->vht_supported) {
 			return false;
+		}
 		prohibited_flags |= IEEE80211_CHAN_NO_80MHZ;
 		width = 80;
 		break;
 	case NL80211_CHAN_WIDTH_160:
+		prohibited_flags |= IEEE80211_CHAN_NO_160MHZ;
+		width = 160;
+		if (cfg80211_is_6ghz_freq(chandef->center_freq1)) {
+			if (!he_cap)
+				return false;
+			if (!he_cap->has_he_6ghz)
+				return false;
+			if (!(he_cap->he_cap_elem.phy_cap_info[0] &
+			      IEEE80211_HE_PHY_CAP0_CHANNEL_WIDTH_SET_160MHZ_IN_5G))
+				return false;
+			break;
+		}
 		if (!vht_cap->vht_supported)
 			return false;
 		cap = vht_cap->cap & IEEE80211_VHT_CAP_SUPP_CHAN_WIDTH_MASK;
 		if (cap != IEEE80211_VHT_CAP_SUPP_CHAN_WIDTH_160MHZ &&
 		    cap != IEEE80211_VHT_CAP_SUPP_CHAN_WIDTH_160_80PLUS80MHZ)
 			return false;
-		prohibited_flags |= IEEE80211_CHAN_NO_160MHZ;
-		width = 160;
 		break;
 	default:
 		WARN_ON_ONCE(1);
-- 
2.7.4

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
