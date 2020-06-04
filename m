Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from nbd.name ([2a01:4f8:221:3d45::2])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jgk0p-0000GN-FI
 for ath11k@lists.infradead.org; Thu, 04 Jun 2020 07:10:05 +0000
From: John Crispin <john@phrozen.org>
Subject: [PATCH 03/12] nl80211: add attributes to set beacon transmit mode
Date: Thu,  4 Jun 2020 09:09:43 +0200
Message-Id: <20200604070952.15481-4-john@phrozen.org>
In-Reply-To: <20200604070952.15481-1-john@phrozen.org>
References: <20200604070952.15481-1-john@phrozen.org>
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

Beacons on a radio can be sent out in burst (back to back) or staggered
(equally spread out over time) mode. This patch adds the required nl80211
attributes allowing us to configure this from userland.

Signed-off-by: John Crispin <john@phrozen.org>
---
 include/net/cfg80211.h       |  3 +++
 include/uapi/linux/nl80211.h | 17 +++++++++++++++++
 net/wireless/nl80211.c       |  7 +++++++
 3 files changed, 27 insertions(+)

diff --git a/include/net/cfg80211.h b/include/net/cfg80211.h
index 77cd2f780c6a..157d37f74efb 100644
--- a/include/net/cfg80211.h
+++ b/include/net/cfg80211.h
@@ -1094,6 +1094,8 @@ enum cfg80211_ap_settings_flags {
  * @he_obss_pd: OBSS Packet Detection settings
  * @he_bss_color: BSS Color settings
  * @he_oper: HE operation IE (or %NULL if HE isn't enabled)
+ * @beacon_tx_mode: can be set to tell the driver to sent the beacons in staggered
+ *	or burst mode.
  */
 struct cfg80211_ap_settings {
 	struct cfg80211_chan_def chandef;
@@ -1125,6 +1127,7 @@ struct cfg80211_ap_settings {
 	struct ieee80211_he_obss_pd he_obss_pd;
 	struct cfg80211_he_bss_color he_bss_color;
 	struct ieee80211_multi_bssid multi_bssid;
+	enum nl80211_beacon_tx_mode beacon_tx_mode;
 };
 
 /**
diff --git a/include/uapi/linux/nl80211.h b/include/uapi/linux/nl80211.h
index f18f681796ed..2c4950aeb474 100644
--- a/include/uapi/linux/nl80211.h
+++ b/include/uapi/linux/nl80211.h
@@ -2481,6 +2481,8 @@ enum nl80211_commands {
  *
  * @NL80211_ATTR_MULTI_BSSID_COUNT: The number of BSSs inside the multi bssid IE.
  *
+ * @NL80211_ATTR_BEACON_TX_MODE: Set the beacon tx mode to staggered or burst.
+ *
  * @NUM_NL80211_ATTR: total number of nl80211_attrs available
  * @NL80211_ATTR_MAX: highest attribute number currently defined
  * @__NL80211_ATTR_AFTER_LAST: internal use
@@ -2961,6 +2963,8 @@ enum nl80211_attrs {
 	NL80211_ATTR_MULTI_BSSID_INDEX,
 	NL80211_ATTR_MULTI_BSSID_COUNT,
 
+	NL80211_ATTR_BEACON_TX_MODE,
+
 	/* add attributes here, update the policy in nl80211.c */
 
 	__NL80211_ATTR_AFTER_LAST,
@@ -6732,6 +6736,19 @@ enum nl80211_multi_bssid_mode {
 	NL80211_MULTIPLE_BSSID_NON_TRANSMITTED,
 };
 
+/**
+ * enum nl80211_beacon_tx_mode - Beacon tx mode settings
+ *
+ * @BEACON_TX_MODE_DEFAULT: The beacons shall be sent out in its default mode
+ * @BEACON_TX_MODE_STAGGERED: The beacons shall be sent out in staggered mode
+ * @BEACON_TX_MODE_BURST: The beacons shall be sent out in burst mode
+ *                                    beacon
+ */
+enum nl80211_beacon_tx_mode {
+	NL80211_BEACON_TX_MODE_STAGGERED = 0,
+	NL80211_BEACON_TX_MODE_BURST,
+};
+
 /**
  * enum nl80211_peer_measurement_ftm_resp - FTM response attributes
  * @__NL80211_PMSR_FTM_RESP_ATTR_INVALID: invalid
diff --git a/net/wireless/nl80211.c b/net/wireless/nl80211.c
index 58ce67bc31da..1f6f8ecbfb57 100644
--- a/net/wireless/nl80211.c
+++ b/net/wireless/nl80211.c
@@ -669,6 +669,9 @@ const struct nla_policy nl80211_policy[NUM_NL80211_ATTR] = {
 	[NL80211_ATTR_MULTI_BSSID_PARENT] = { .type = NLA_U32 },
 	[NL80211_ATTR_MULTI_BSSID_INDEX] = { .type = NLA_U32 },
 	[NL80211_ATTR_MULTI_BSSID_COUNT] = { .type = NLA_U32 },
+	[NL80211_ATTR_BEACON_TX_MODE] = NLA_POLICY_RANGE(NLA_U8,
+					NL80211_BEACON_TX_MODE_STAGGERED,
+					NL80211_BEACON_TX_MODE_BURST),
 };
 
 /* policy for the key attributes */
@@ -5165,6 +5168,10 @@ static int nl80211_start_ap(struct sk_buff *skb, struct genl_info *info)
 		params.multi_bssid.count = nla_get_u32(
 				info->attrs[NL80211_ATTR_MULTI_BSSID_COUNT]);
 
+	if (info->attrs[NL80211_ATTR_BEACON_TX_MODE])
+		params.beacon_tx_mode =
+			nla_get_u8(info->attrs[NL80211_ATTR_BEACON_TX_MODE]);
+
 	nl80211_calculate_ap_params(&params);
 
 	if (info->attrs[NL80211_ATTR_EXTERNAL_AUTH_SUPPORT])
-- 
2.20.1


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
