Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from nbd.name ([2a01:4f8:221:3d45::2])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ifnKZ-0007E8-4r
 for ath11k@lists.infradead.org; Fri, 13 Dec 2019 15:58:18 +0000
From: John Crispin <john@phrozen.org>
Subject: [PATCH v2 2/7] nl80211: add handling for BSS color
Date: Fri, 13 Dec 2019 16:57:57 +0100
Message-Id: <20191213155802.25491-2-john@phrozen.org>
In-Reply-To: <20191213155802.25491-1-john@phrozen.org>
References: <20191213155802.25491-1-john@phrozen.org>
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
To: Johannes Berg <johannes@sipsolutions.net>, Kalle Valo <kvalo@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org, John Crispin <john@phrozen.org>

This patch adds the attributes, policy and parsing code to allow userland
to send the info about the BSS coloring settings to the kernel.

Signed-off-by: John Crispin <john@phrozen.org>

Changes in V2
* fix a copy paste error
---
 include/uapi/linux/nl80211.h | 27 ++++++++++++++++++++++++
 net/wireless/nl80211.c       | 40 ++++++++++++++++++++++++++++++++++++
 2 files changed, 67 insertions(+)

diff --git a/include/uapi/linux/nl80211.h b/include/uapi/linux/nl80211.h
index 822851d369ab..12a97d2c43b8 100644
--- a/include/uapi/linux/nl80211.h
+++ b/include/uapi/linux/nl80211.h
@@ -2361,6 +2361,8 @@ enum nl80211_commands {
  * @NL80211_ATTR_HE_OBSS_PD: nested attribute for OBSS Packet Detection
  *	functionality.
  *
+ * @NL80211_ATTR_HE_BSS_COLOR: nested attribute for BSS Color Settings.
+ *
  * @NUM_NL80211_ATTR: total number of nl80211_attrs available
  * @NL80211_ATTR_MAX: highest attribute number currently defined
  * @__NL80211_ATTR_AFTER_LAST: internal use
@@ -2820,6 +2822,8 @@ enum nl80211_attrs {
 
 	NL80211_ATTR_HE_OBSS_PD,
 
+	NL80211_ATTR_HE_BSS_COLOR,
+
 	/* add attributes here, update the policy in nl80211.c */
 
 	__NL80211_ATTR_AFTER_LAST,
@@ -6516,5 +6520,28 @@ enum nl80211_obss_pd_attributes {
 	NL80211_HE_OBSS_PD_ATTR_MAX = __NL80211_HE_OBSS_PD_ATTR_LAST - 1,
 };
 
+/**
+ * enum nl80211_bss_color_attributes - BSS Color attributes
+ * @__NL80211_HE_BSS_COLOR_ATTR_INVALID: Invalid
+ *
+ * @NL80211_HE_BSS_COLOR: the current BSS Color.
+ * @NL80211_HE_BSS_COLOR_DISABLED: is BSS coloring disabled.
+ * @NL80211_HE_BSS_COLOR_PARTIAL: the AID equation to be used..
+ *
+ * @__NL80211_HE_BSS_COLOR_ATTR_LAST: Internal
+ * @NL80211_HE_BSS_COLOR_ATTR_MAX: highest BSS Color attribute.
+ */
+enum nl80211_bss_color_attributes {
+	__NL80211_HE_BSS_COLOR_ATTR_INVALID,
+
+	NL80211_HE_BSS_COLOR,
+	NL80211_HE_BSS_COLOR_DISABLED,
+	NL80211_HE_BSS_COLOR_PARTIAL,
+
+	/* keep last */
+	__NL80211_HE_BSS_COLOR_ATTR_LAST,
+	NL80211_HE_BSS_COLOR_ATTR_MAX = __NL80211_HE_BSS_COLOR_ATTR_LAST - 1,
+};
+
 
 #endif /* __LINUX_NL80211_H */
diff --git a/net/wireless/nl80211.c b/net/wireless/nl80211.c
index 92e06482563c..46040083abe8 100644
--- a/net/wireless/nl80211.c
+++ b/net/wireless/nl80211.c
@@ -289,6 +289,13 @@ he_obss_pd_policy[NL80211_HE_OBSS_PD_ATTR_MAX + 1] = {
 		NLA_POLICY_RANGE(NLA_U8, 1, 20),
 };
 
+static const struct nla_policy
+he_bss_color_policy[NL80211_HE_BSS_COLOR_ATTR_MAX + 1] = {
+	[NL80211_HE_BSS_COLOR] = NLA_POLICY_RANGE(NLA_U8, 1, 63),
+	[NL80211_HE_BSS_COLOR_DISABLED] = { .type = NLA_FLAG },
+	[NL80211_HE_BSS_COLOR_PARTIAL] = { .type = NLA_FLAG },
+};
+
 const struct nla_policy nl80211_policy[NUM_NL80211_ATTR] = {
 	[0] = { .strict_start_type = NL80211_ATTR_HE_OBSS_PD },
 	[NL80211_ATTR_WIPHY] = { .type = NLA_U32 },
@@ -584,6 +591,7 @@ const struct nla_policy nl80211_policy[NUM_NL80211_ATTR] = {
 					.len = SAE_PASSWORD_MAX_LEN },
 	[NL80211_ATTR_TWT_RESPONDER] = { .type = NLA_FLAG },
 	[NL80211_ATTR_HE_OBSS_PD] = NLA_POLICY_NESTED(he_obss_pd_policy),
+	[NL80211_ATTR_HE_BSS_COLOR] = NLA_POLICY_NESTED(he_bss_color_policy),
 };
 
 /* policy for the key attributes */
@@ -4441,6 +4449,30 @@ static int nl80211_parse_he_obss_pd(struct nlattr *attrs,
 	return 0;
 }
 
+static int nl80211_parse_he_bss_color(struct nlattr *attrs,
+				      struct ieee80211_he_bss_color *he_bss_color)
+{
+	struct nlattr *tb[NL80211_HE_BSS_COLOR_ATTR_MAX + 1];
+	int err;
+
+	err = nla_parse_nested(tb, NL80211_HE_BSS_COLOR_ATTR_MAX, attrs,
+			       he_bss_color_policy, NULL);
+	if (err)
+		return err;
+
+	if (!tb[NL80211_HE_BSS_COLOR])
+		return -EINVAL;
+
+	he_bss_color->color =
+		nla_get_u8(tb[NL80211_HE_BSS_COLOR]);
+	he_bss_color->disabled =
+		nla_get_flag(tb[NL80211_HE_BSS_COLOR_DISABLED]);
+	he_bss_color->partial =
+		nla_get_flag(tb[NL80211_HE_BSS_COLOR_PARTIAL]);
+
+	return 0;
+}
+
 static void nl80211_check_ap_rate_selectors(struct cfg80211_ap_settings *params,
 					    const u8 *rates)
 {
@@ -4733,6 +4765,14 @@ static int nl80211_start_ap(struct sk_buff *skb, struct genl_info *info)
 			return err;
 	}
 
+	if (info->attrs[NL80211_ATTR_HE_BSS_COLOR]) {
+		err = nl80211_parse_he_bss_color(
+					info->attrs[NL80211_ATTR_HE_BSS_COLOR],
+					&params.he_bss_color);
+		if (err)
+			return err;
+	}
+
 	nl80211_calculate_ap_params(&params);
 
 	if (info->attrs[NL80211_ATTR_EXTERNAL_AUTH_SUPPORT])
-- 
2.20.1


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
