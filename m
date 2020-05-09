Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail26.static.mailgun.info ([104.130.122.26])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jXD7a-00071g-10
 for ath11k@lists.infradead.org; Sat, 09 May 2020 00:13:42 +0000
From: Rajkumar Manoharan <rmanohar@codeaurora.org>
Subject: [PATCH v3 07/11] mac80211: add HE 6 GHz Band Capability IE in Assoc.
 Request
Date: Fri,  8 May 2020 17:13:01 -0700
Message-Id: <1588983185-5741-7-git-send-email-rmanohar@codeaurora.org>
In-Reply-To: <1588983185-5741-1-git-send-email-rmanohar@codeaurora.org>
References: <1588983185-5741-1-git-send-email-rmanohar@codeaurora.org>
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

Construct HE 6 GHz band capability element element (IEEE 802.11ax/D6.0,
9.4.2.261) for association request and mesh beacon. The 6 GHz capability
information is passed by driver through iftypes caps.

Signed-off-by: Rajkumar Manoharan <rmanohar@codeaurora.org>
---
 net/mac80211/ieee80211_i.h |  1 +
 net/mac80211/mesh.c        | 34 ++++++++++++++++++++++++++++++++++
 net/mac80211/mesh.h        |  2 ++
 net/mac80211/mesh_plink.c  |  3 ++-
 net/mac80211/mlme.c        | 12 ++++++++++--
 net/mac80211/util.c        | 15 +++++++++++++++
 6 files changed, 64 insertions(+), 3 deletions(-)

diff --git a/net/mac80211/ieee80211_i.h b/net/mac80211/ieee80211_i.h
index 78a95a11458c..6517a56970b7 100644
--- a/net/mac80211/ieee80211_i.h
+++ b/net/mac80211/ieee80211_i.h
@@ -2174,6 +2174,7 @@ u8 ieee80211_ie_len_he_cap(struct ieee80211_sub_if_data *sdata, u8 iftype);
 u8 *ieee80211_ie_build_he_cap(u8 *pos,
 			      const struct ieee80211_sta_he_cap *he_cap,
 			      u8 *end);
+u8 *ieee80211_ie_build_he_6ghz_band_cap(u8 *pos, u16 he_6ghz_cap);
 u8 *ieee80211_ie_build_he_oper(u8 *pos);
 int ieee80211_parse_bitrates(struct cfg80211_chan_def *chandef,
 			     const struct ieee80211_supported_band *sband,
diff --git a/net/mac80211/mesh.c b/net/mac80211/mesh.c
index 36978a0e5000..2ca34869538d 100644
--- a/net/mac80211/mesh.c
+++ b/net/mac80211/mesh.c
@@ -587,6 +587,39 @@ int mesh_add_he_oper_ie(struct ieee80211_sub_if_data *sdata,
 	return 0;
 }
 
+int mesh_add_he_6ghz_cap_ie(struct ieee80211_sub_if_data *sdata,
+			    struct sk_buff *skb)
+{
+	const struct ieee80211_sta_he_cap *he_cap;
+	struct ieee80211_supported_band *sband;
+	u8 ie_len;
+	u8 *pos;
+
+	sband = ieee80211_get_sband(sdata);
+	if (!sband)
+		return -EINVAL;
+
+	he_cap = ieee80211_get_he_iftype_cap(sband, NL80211_IFTYPE_MESH_POINT);
+
+	if (!he_cap ||
+	    sdata->vif.bss_conf.chandef.width == NL80211_CHAN_WIDTH_20_NOHT ||
+	    sdata->vif.bss_conf.chandef.width == NL80211_CHAN_WIDTH_5 ||
+	    sdata->vif.bss_conf.chandef.width == NL80211_CHAN_WIDTH_10)
+		return 0;
+
+	if (!he_cap->has_he_6ghz)
+		return 0;
+
+	ie_len = 2 + 1 + sizeof(struct ieee80211_he_6ghz_band_cap);
+	if (skb_tailroom(skb) < ie_len)
+		return -ENOMEM;
+
+	pos = skb_put(skb, ie_len);
+	ieee80211_ie_build_he_6ghz_band_cap(pos, he_cap->he_6ghz.cap);
+
+	return 0;
+}
+
 static void ieee80211_mesh_path_timer(struct timer_list *t)
 {
 	struct ieee80211_sub_if_data *sdata =
@@ -885,6 +918,7 @@ ieee80211_mesh_build_beacon(struct ieee80211_if_mesh *ifmsh)
 	    mesh_add_vht_oper_ie(sdata, skb) ||
 	    mesh_add_he_cap_ie(sdata, skb, ie_len_he_cap) ||
 	    mesh_add_he_oper_ie(sdata, skb) ||
+	    mesh_add_he_6ghz_cap_ie(sdata, skb) ||
 	    mesh_add_vendor_ies(sdata, skb))
 		goto out_free;
 
diff --git a/net/mac80211/mesh.h b/net/mac80211/mesh.h
index 953f720754e8..40492d1bd8fd 100644
--- a/net/mac80211/mesh.h
+++ b/net/mac80211/mesh.h
@@ -222,6 +222,8 @@ int mesh_add_he_cap_ie(struct ieee80211_sub_if_data *sdata,
 		       struct sk_buff *skb, u8 ie_len);
 int mesh_add_he_oper_ie(struct ieee80211_sub_if_data *sdata,
 			struct sk_buff *skb);
+int mesh_add_he_6ghz_cap_ie(struct ieee80211_sub_if_data *sdata,
+			    struct sk_buff *skb);
 void mesh_rmc_free(struct ieee80211_sub_if_data *sdata);
 int mesh_rmc_init(struct ieee80211_sub_if_data *sdata);
 void ieee80211s_init(void);
diff --git a/net/mac80211/mesh_plink.c b/net/mac80211/mesh_plink.c
index e3e29b8d641d..dedb2341ebdd 100644
--- a/net/mac80211/mesh_plink.c
+++ b/net/mac80211/mesh_plink.c
@@ -328,7 +328,8 @@ static int mesh_plink_frame_tx(struct ieee80211_sub_if_data *sdata,
 		    mesh_add_vht_cap_ie(sdata, skb) ||
 		    mesh_add_vht_oper_ie(sdata, skb) ||
 		    mesh_add_he_cap_ie(sdata, skb, ie_len_he_cap) ||
-		    mesh_add_he_oper_ie(sdata, skb))
+		    mesh_add_he_oper_ie(sdata, skb) ||
+		    mesh_add_he_6ghz_cap_ie(sdata, skb))
 			goto free;
 	}
 
diff --git a/net/mac80211/mlme.c b/net/mac80211/mlme.c
index 58a082efc3b3..b4dfefd482a6 100644
--- a/net/mac80211/mlme.c
+++ b/net/mac80211/mlme.c
@@ -654,6 +654,12 @@ static void ieee80211_add_he_ie(struct ieee80211_sub_if_data *sdata,
 				      he_cap->he_cap_elem.phy_cap_info);
 	pos = skb_put(skb, he_cap_size);
 	ieee80211_ie_build_he_cap(pos, he_cap, pos + he_cap_size);
+
+	if (!he_cap->has_he_6ghz)
+		return;
+
+	pos = skb_put(skb, 5); /* 2 + 1 + sizeof(he_cap->he_6ghz.cap) */
+	ieee80211_ie_build_he_6ghz_band_cap(pos, he_cap->he_6ghz.cap);
 }
 
 static void ieee80211_send_assoc(struct ieee80211_sub_if_data *sdata)
@@ -4803,7 +4809,8 @@ static int ieee80211_prep_channel(struct ieee80211_sub_if_data *sdata,
 	if (!sband->ht_cap.ht_supported) {
 		ifmgd->flags |= IEEE80211_STA_DISABLE_HT;
 		ifmgd->flags |= IEEE80211_STA_DISABLE_VHT;
-		ifmgd->flags |= IEEE80211_STA_DISABLE_HE;
+		if (sband->band != NL80211_BAND_6GHZ)
+			ifmgd->flags |= IEEE80211_STA_DISABLE_HE;
 	}
 
 	if (!sband->vht_cap.vht_supported)
@@ -5493,7 +5500,8 @@ int ieee80211_mgd_assoc(struct ieee80211_sub_if_data *sdata,
 	if (req->flags & ASSOC_REQ_DISABLE_HT) {
 		ifmgd->flags |= IEEE80211_STA_DISABLE_HT;
 		ifmgd->flags |= IEEE80211_STA_DISABLE_VHT;
-		ifmgd->flags |= IEEE80211_STA_DISABLE_HE;
+		if (sband->band != NL80211_BAND_6GHZ)
+			ifmgd->flags |= IEEE80211_STA_DISABLE_HE;
 	}
 
 	if (req->flags & ASSOC_REQ_DISABLE_VHT)
diff --git a/net/mac80211/util.c b/net/mac80211/util.c
index 5a33755c22f4..2bcebe672c0d 100644
--- a/net/mac80211/util.c
+++ b/net/mac80211/util.c
@@ -2839,6 +2839,21 @@ u8 *ieee80211_ie_build_he_cap(u8 *pos,
 	return pos;
 }
 
+u8 *ieee80211_ie_build_he_6ghz_band_cap(u8 *pos, u16 he_6ghz_cap)
+{
+	__le16 cap = cpu_to_le16(he_6ghz_cap);
+
+	*pos++ = WLAN_EID_EXTENSION;
+	*pos++ = 3;
+	*pos++ = WLAN_EID_EXT_HE_6GHZ_BAND_CAP;
+
+	/* Fixed data */
+	memcpy(pos, &cap, sizeof(cap));
+	pos += sizeof(cap);
+
+	return pos;
+}
+
 u8 *ieee80211_ie_build_ht_oper(u8 *pos, struct ieee80211_sta_ht_cap *ht_cap,
 			       const struct cfg80211_chan_def *chandef,
 			       u16 prot_mode, bool rifs_mode)
-- 
2.7.4

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
