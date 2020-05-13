Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail26.static.mailgun.info ([104.130.122.26])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jYxJy-0000MP-O8
 for ath11k@lists.infradead.org; Wed, 13 May 2020 19:45:42 +0000
From: Rajkumar Manoharan <rmanohar@codeaurora.org>
Subject: [PATCH v3 10/11] mac80211: determine chantype from HE operation in 6
 GHz
Date: Wed, 13 May 2020 12:45:04 -0700
Message-Id: <1589399105-25472-10-git-send-email-rmanohar@codeaurora.org>
In-Reply-To: <1589399105-25472-1-git-send-email-rmanohar@codeaurora.org>
References: <1589399105-25472-1-git-send-email-rmanohar@codeaurora.org>
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
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org, Rajkumar Manoharan <rmanohar@codeaurora.org>

In 6 GHz band, determine chandef from 6 GHz operation information
of HE operation element.

Reported-by: kernel test robot <rong.a.chen@intel.com>
Signed-off-by: Rajkumar Manoharan <rmanohar@codeaurora.org>
---
 net/mac80211/ieee80211_i.h |  3 ++
 net/mac80211/mesh.c        |  1 +
 net/mac80211/mlme.c        | 12 ++++++
 net/mac80211/util.c        | 96 ++++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 112 insertions(+)

diff --git a/net/mac80211/ieee80211_i.h b/net/mac80211/ieee80211_i.h
index 0bb442feb1db..42a7782c973a 100644
--- a/net/mac80211/ieee80211_i.h
+++ b/net/mac80211/ieee80211_i.h
@@ -2194,6 +2194,9 @@ bool ieee80211_chandef_vht_oper(struct ieee80211_hw *hw,
 				const struct ieee80211_vht_operation *oper,
 				const struct ieee80211_ht_operation *htop,
 				struct cfg80211_chan_def *chandef);
+bool ieee80211_chandef_he_oper(struct ieee80211_sub_if_data *sdata,
+			       const struct ieee80211_he_operation *heop,
+			       struct cfg80211_chan_def *chandef);
 u32 ieee80211_chandef_downgrade(struct cfg80211_chan_def *c);
 
 int __must_check
diff --git a/net/mac80211/mesh.c b/net/mac80211/mesh.c
index 04d3da733bc8..0521b57939e1 100644
--- a/net/mac80211/mesh.c
+++ b/net/mac80211/mesh.c
@@ -99,6 +99,7 @@ bool mesh_matches_local(struct ieee80211_sub_if_data *sdata,
 	ieee80211_chandef_vht_oper(&sdata->local->hw,
 				   ie->vht_operation, ie->ht_operation,
 				   &sta_chan_def);
+	ieee80211_chandef_he_oper(sdata, ie->he_operation, &sta_chan_def);
 
 	if (!cfg80211_chandef_compatible(&sdata->vif.bss_conf.chandef,
 					 &sta_chan_def))
diff --git a/net/mac80211/mlme.c b/net/mac80211/mlme.c
index b4dfefd482a6..9115dc9c7d78 100644
--- a/net/mac80211/mlme.c
+++ b/net/mac80211/mlme.c
@@ -163,6 +163,9 @@ ieee80211_determine_chantype(struct ieee80211_sub_if_data *sdata,
 	chandef->width = NL80211_CHAN_WIDTH_20_NOHT;
 	chandef->center_freq1 = channel->center_freq;
 
+	if (channel->band == NL80211_BAND_6GHZ)
+		goto skip_ht_vht_oper;
+
 	if (!ht_oper || !sta_ht_cap.ht_supported) {
 		ret = IEEE80211_STA_DISABLE_HT |
 		      IEEE80211_STA_DISABLE_VHT |
@@ -263,6 +266,15 @@ ieee80211_determine_chantype(struct ieee80211_sub_if_data *sdata,
 
 	*chandef = vht_chandef;
 
+skip_ht_vht_oper:
+	if (!ieee80211_chandef_he_oper(sdata, he_oper, chandef)) {
+		if (!(ifmgd->flags & IEEE80211_STA_DISABLE_HE))
+			sdata_info(sdata,
+				   "AP HE information is invalid, disable HE\n");
+		ret = IEEE80211_STA_DISABLE_HE;
+		goto out;
+	}
+
 	ret = 0;
 
 out:
diff --git a/net/mac80211/util.c b/net/mac80211/util.c
index 90b8c42b1aa8..f6ab8835d69a 100644
--- a/net/mac80211/util.c
+++ b/net/mac80211/util.c
@@ -3170,6 +3170,102 @@ bool ieee80211_chandef_vht_oper(struct ieee80211_hw *hw,
 	return true;
 }
 
+bool ieee80211_chandef_he_oper(struct ieee80211_sub_if_data *sdata,
+			       const struct ieee80211_he_operation *heop,
+			       struct cfg80211_chan_def *chandef)
+{
+	struct ieee80211_he_oper_6ghz_op_info info;
+	const struct ieee80211_sta_he_cap *he_cap;
+	struct ieee80211_supported_band *sband;
+	struct cfg80211_chan_def new = *chandef;
+	int cf0, cf1;
+	int ccf0, ccf1;
+	bool support_80_80;
+	bool support_160;
+	u8 he_phy_cap;
+	u8 pos = 0;
+
+	/* Below HE Operation check is required only for 6 GHz band */
+	if (chandef->chan->band != NL80211_BAND_6GHZ)
+		return true;
+
+	if (!heop)
+		return false;
+
+	sband = sdata->local->hw.wiphy->bands[chandef->chan->band];
+	if (!sband)
+		return false;
+
+	he_cap = ieee80211_get_he_iftype_cap(sband, sdata->vif.type);
+	if (!he_cap)
+		return false;
+
+	if (!(le32_to_cpu(heop->he_oper_params) &
+				IEEE80211_HE_OPERATION_6GHZ_OP_INFO))
+		return false;
+
+	he_phy_cap = he_cap->he_cap_elem.phy_cap_info[0];
+	support_160 =
+		!!(he_phy_cap &
+		   IEEE80211_HE_PHY_CAP0_CHANNEL_WIDTH_SET_160MHZ_IN_5G);
+	support_80_80 =
+		!!(he_phy_cap &
+		   IEEE80211_HE_PHY_CAP0_CHANNEL_WIDTH_SET_80PLUS80_MHZ_IN_5G);
+
+	if (le32_to_cpu(heop->he_oper_params) &
+	    IEEE80211_HE_OPERATION_VHT_OPER_INFO)
+		pos += 3;
+	if (le32_to_cpu(heop->he_oper_params) &
+	    IEEE80211_HE_OPERATION_CO_HOSTED_BSS)
+		pos += 1;
+
+	memcpy(&info, &heop->optional[pos], sizeof(info));
+	ccf0 = info.center_freq_seg0_idx;
+	ccf1 = info.center_freq_seg1_idx;
+
+	cf0 = ieee80211_channel_to_frequency(ccf0, chandef->chan->band);
+	cf1 = ieee80211_channel_to_frequency(ccf1, chandef->chan->band);
+
+	switch (info.control & 0x3) {
+	case IEEE80211_HE_6GHZ_CHANWIDTH_20MHZ:
+		new.center_freq1 = cf0;
+		new.width = NL80211_CHAN_WIDTH_20;
+		break;
+	case IEEE80211_HE_6GHZ_CHANWIDTH_40MHZ:
+		new.center_freq1 = cf0;
+		new.width = NL80211_CHAN_WIDTH_40;
+		break;
+	case IEEE80211_HE_6GHZ_CHANWIDTH_80MHZ:
+		new.center_freq1 = cf0;
+		new.width = NL80211_CHAN_WIDTH_80;
+		break;
+	case IEEE80211_HE_6GHZ_CHANWIDTH_160MHZ_80P80MHZ:
+		new.center_freq1 = cf0;
+		new.width = NL80211_CHAN_WIDTH_80;
+		if (ccf1) {
+			unsigned int diff;
+
+			diff = abs(ccf1 - ccf0);
+			if (diff == 8 && support_160) {
+				new.width = NL80211_CHAN_WIDTH_160;
+				new.center_freq1 = cf1;
+			} else if ((diff > 8) && support_80_80) {
+				new.width = NL80211_CHAN_WIDTH_80P80;
+				new.center_freq2 = cf1;
+			}
+		}
+		break;
+	default:
+		return false;
+	}
+
+	if (!cfg80211_chandef_valid(&new))
+		return false;
+
+	*chandef = new;
+	return true;
+}
+
 int ieee80211_parse_bitrates(struct cfg80211_chan_def *chandef,
 			     const struct ieee80211_supported_band *sband,
 			     const u8 *srates, int srates_len, u32 *rates)
-- 
2.7.4

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
