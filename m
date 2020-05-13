Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail27.static.mailgun.info ([104.130.122.27])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jYxJo-0000KN-6T
 for ath11k@lists.infradead.org; Wed, 13 May 2020 19:45:34 +0000
From: Rajkumar Manoharan <rmanohar@codeaurora.org>
Subject: [PATCH v3 02/11] cfg80211: handle 6 GHz capability of new station
Date: Wed, 13 May 2020 12:44:56 -0700
Message-Id: <1589399105-25472-2-git-send-email-rmanohar@codeaurora.org>
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

Handle 6 GHz HE capability while adding new station. It will be used
later in mac80211 station processing.

Signed-off-by: Rajkumar Manoharan <rmanohar@codeaurora.org>
---
 include/net/cfg80211.h       |  2 ++
 include/uapi/linux/nl80211.h |  6 ++++++
 net/wireless/nl80211.c       | 12 ++++++++++++
 3 files changed, 20 insertions(+)

diff --git a/include/net/cfg80211.h b/include/net/cfg80211.h
index 70e48f66dac8..0797a296c083 100644
--- a/include/net/cfg80211.h
+++ b/include/net/cfg80211.h
@@ -1225,6 +1225,7 @@ struct sta_txpwr {
  * @he_capa_len: the length of the HE capabilities
  * @airtime_weight: airtime scheduler weight for this station
  * @txpwr: transmit power for an associated station
+ * @he_6ghz_capa: HE 6 GHz Band capabilities of station
  */
 struct station_parameters {
 	const u8 *supported_rates;
@@ -1257,6 +1258,7 @@ struct station_parameters {
 	u8 he_capa_len;
 	u16 airtime_weight;
 	struct sta_txpwr txpwr;
+	const struct ieee80211_he_6ghz_band_cap *he_6ghz_capa;
 };
 
 /**
diff --git a/include/uapi/linux/nl80211.h b/include/uapi/linux/nl80211.h
index 2b691161830f..9c0a912f1684 100644
--- a/include/uapi/linux/nl80211.h
+++ b/include/uapi/linux/nl80211.h
@@ -2470,6 +2470,9 @@ enum nl80211_commands {
  *	no roaming occurs between the reauth threshold and PMK expiration,
  *	disassociation is still forced.
  *
+ * @NL80211_ATTR_HE_6GHZ_CAPABILITY: HE 6 GHz Band Capability element (from
+ *	association request when used with NL80211_CMD_NEW_STATION).
+ *
  * @NUM_NL80211_ATTR: total number of nl80211_attrs available
  * @NL80211_ATTR_MAX: highest attribute number currently defined
  * @__NL80211_ATTR_AFTER_LAST: internal use
@@ -2945,6 +2948,8 @@ enum nl80211_attrs {
 	NL80211_ATTR_PMK_LIFETIME,
 	NL80211_ATTR_PMK_REAUTH_THRESHOLD,
 
+	NL80211_ATTR_HE_6GHZ_CAPABILITY,
+
 	/* add attributes here, update the policy in nl80211.c */
 
 	__NL80211_ATTR_AFTER_LAST,
@@ -2998,6 +3003,7 @@ enum nl80211_attrs {
 #define NL80211_HE_MAX_CAPABILITY_LEN           54
 #define NL80211_MAX_NR_CIPHER_SUITES		5
 #define NL80211_MAX_NR_AKM_SUITES		2
+#define NL80211_HE_6GHZ_CAPABILITY_LEN		2
 
 #define NL80211_MIN_REMAIN_ON_CHANNEL_TIME	10
 
diff --git a/net/wireless/nl80211.c b/net/wireless/nl80211.c
index 692bcd35f809..bcd7a452e8b1 100644
--- a/net/wireless/nl80211.c
+++ b/net/wireless/nl80211.c
@@ -661,6 +661,10 @@ const struct nla_policy nl80211_policy[NUM_NL80211_ATTR] = {
 	[NL80211_ATTR_CONTROL_PORT_NO_PREAUTH] = { .type = NLA_FLAG },
 	[NL80211_ATTR_PMK_LIFETIME] = NLA_POLICY_MIN(NLA_U32, 1),
 	[NL80211_ATTR_PMK_REAUTH_THRESHOLD] = NLA_POLICY_RANGE(NLA_U8, 1, 100),
+	[NL80211_ATTR_HE_6GHZ_CAPABILITY] = {
+		.type = NLA_EXACT_LEN,
+		.len = NL80211_HE_6GHZ_CAPABILITY_LEN,
+	},
 };
 
 /* policy for the key attributes */
@@ -6129,6 +6133,10 @@ static int nl80211_new_station(struct sk_buff *skb, struct genl_info *info)
 			return -EINVAL;
 	}
 
+	if (info->attrs[NL80211_ATTR_HE_6GHZ_CAPABILITY])
+		params.he_6ghz_capa =
+			nla_data(info->attrs[NL80211_ATTR_HE_6GHZ_CAPABILITY]);
+
 	if (info->attrs[NL80211_ATTR_OPMODE_NOTIF]) {
 		params.opmode_notif_used = true;
 		params.opmode_notif =
@@ -6177,6 +6185,10 @@ static int nl80211_new_station(struct sk_buff *skb, struct genl_info *info)
 			return -EINVAL;
 	}
 
+	/* Ensure that HT/VHT capabilities are not set for 6 GHz HE STA */
+	if (params.he_6ghz_capa && (params.ht_capa || params.vht_capa))
+		return -EINVAL;
+
 	/* When you run into this, adjust the code below for the new flag */
 	BUILD_BUG_ON(NL80211_STA_FLAG_MAX != 7);
 
-- 
2.7.4

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
