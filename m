Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from nbd.name ([2a01:4f8:221:3d45::2])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jsPfk-00032p-Co
 for ath11k@lists.infradead.org; Mon, 06 Jul 2020 11:52:33 +0000
From: John Crispin <john@phrozen.org>
Subject: [PATCH V2 02/10] nl80211: add attributes for multiple bssid related
 settings
Date: Mon,  6 Jul 2020 13:52:11 +0200
Message-Id: <20200706115219.663650-2-john@phrozen.org>
In-Reply-To: <20200706115219.663650-1-john@phrozen.org>
References: <20200706115219.663650-1-john@phrozen.org>
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
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org, John Crispin <john@phrozen.org>

When we start a multiple bssid AP we need to pass the index and number of
peers to the kernel. This info needs to be propagated to the driver.

Signed-off-by: John Crispin <john@phrozen.org>
---
 include/net/cfg80211.h       | 12 ++++++++++++
 include/uapi/linux/nl80211.h |  7 +++++++
 net/wireless/nl80211.c       | 15 +++++++++++++++
 3 files changed, 34 insertions(+)

diff --git a/include/net/cfg80211.h b/include/net/cfg80211.h
index ba8f3c8df0ca..ba0d25f95cf9 100644
--- a/include/net/cfg80211.h
+++ b/include/net/cfg80211.h
@@ -453,6 +453,17 @@ struct ieee80211_supported_band {
 	const struct ieee80211_sband_iftype_data *iftype_data;
 };
 
+/**
+ * struct ieee80211_multi_bssid - AP settings for multi bssid
+ *
+ * @index: the index of this AP in the multi bssid group.
+ * @count: the total number of multi bssid peer APs.
+ */
+struct ieee80211_multi_bssid {
+	u32 index;
+	u32 count;
+};
+
 /**
  * ieee80211_get_sband_iftype_data - return sband data for a given iftype
  * @sband: the sband to search for the STA on
@@ -1126,6 +1137,7 @@ struct cfg80211_ap_settings {
 	u32 flags;
 	struct ieee80211_he_obss_pd he_obss_pd;
 	struct cfg80211_he_bss_color he_bss_color;
+	struct ieee80211_multi_bssid multi_bssid;
 };
 
 /**
diff --git a/include/uapi/linux/nl80211.h b/include/uapi/linux/nl80211.h
index b7a5d1de7aff..45b88f1221b0 100644
--- a/include/uapi/linux/nl80211.h
+++ b/include/uapi/linux/nl80211.h
@@ -2511,6 +2511,11 @@ enum nl80211_commands {
  * @NL80211_ATTR_MULTI_BSSID_PARENT: If this is a Non-Transmitted BSSID, define
  *	the parent interface.
  *
+ * @NL80211_ATTR_MULTI_BSSID_INDEX: The index of this BSS inside the multi bssid
+ *	IE.
+ *
+ * @NL80211_ATTR_MULTI_BSSID_COUNT: The number of BSSs inside the multi bssid IE.
+ *
  * @NUM_NL80211_ATTR: total number of nl80211_attrs available
  * @NL80211_ATTR_MAX: highest attribute number currently defined
  * @__NL80211_ATTR_AFTER_LAST: internal use
@@ -2995,6 +3000,8 @@ enum nl80211_attrs {
 
 	NL80211_ATTR_MULTI_BSSID_MODE,
 	NL80211_ATTR_MULTI_BSSID_PARENT,
+	NL80211_ATTR_MULTI_BSSID_INDEX,
+	NL80211_ATTR_MULTI_BSSID_COUNT,
 
 	/* add attributes here, update the policy in nl80211.c */
 
diff --git a/net/wireless/nl80211.c b/net/wireless/nl80211.c
index e29f834f8d12..e1696a4c965b 100644
--- a/net/wireless/nl80211.c
+++ b/net/wireless/nl80211.c
@@ -662,6 +662,8 @@ static const struct nla_policy nl80211_policy[NUM_NL80211_ATTR] = {
 					NL80211_MULTIPLE_BSSID_LEGACY,
 					NL80211_MULTIPLE_BSSID_NON_TRANSMITTED),
 	[NL80211_ATTR_MULTI_BSSID_PARENT] = { .type = NLA_U32 },
+	[NL80211_ATTR_MULTI_BSSID_INDEX] = { .type = NLA_U32 },
+	[NL80211_ATTR_MULTI_BSSID_COUNT] = { .type = NLA_U32 },
 };
 
 /* policy for the key attributes */
@@ -4885,6 +4887,11 @@ static int nl80211_start_ap(struct sk_buff *skb, struct genl_info *info)
 	    !info->attrs[NL80211_ATTR_BEACON_HEAD])
 		return -EINVAL;
 
+	if (wdev->multi_bssid_mode == NL80211_MULTIPLE_BSSID_NON_TRANSMITTED &&
+	    (!info->attrs[NL80211_ATTR_MULTI_BSSID_INDEX] ||
+	     !info->attrs[NL80211_ATTR_MULTI_BSSID_COUNT]))
+		return -EINVAL;
+
 	err = nl80211_parse_beacon(rdev, info->attrs, &params.beacon);
 	if (err)
 		return err;
@@ -5041,6 +5048,14 @@ static int nl80211_start_ap(struct sk_buff *skb, struct genl_info *info)
 			return err;
 	}
 
+	if (info->attrs[NL80211_ATTR_MULTI_BSSID_INDEX])
+		params.multi_bssid.index = nla_get_u32(
+				info->attrs[NL80211_ATTR_MULTI_BSSID_INDEX]);
+
+	if (info->attrs[NL80211_ATTR_MULTI_BSSID_COUNT])
+		params.multi_bssid.count = nla_get_u32(
+				info->attrs[NL80211_ATTR_MULTI_BSSID_COUNT]);
+
 	nl80211_calculate_ap_params(&params);
 
 	if (info->attrs[NL80211_ATTR_EXTERNAL_AUTH_SUPPORT])
-- 
2.25.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
