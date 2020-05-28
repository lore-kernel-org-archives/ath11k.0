Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail27.static.mailgun.info ([104.130.122.27])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jeEEY-0000g9-JX
 for ath11k@lists.infradead.org; Thu, 28 May 2020 08:49:54 +0000
From: Muna Sinada <msinada@codeaurora.org>
Subject: [PATCH] nl80211: Add HE UL MU fixed rate setting
Date: Thu, 28 May 2020 01:49:31 -0700
Message-Id: <1590655771-12984-1-git-send-email-msinada@codeaurora.org>
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
Cc: Muna Sinada <msinada@codeaurora.org>

This patch adds nl80211 definitions, policies and parsing code required
to pass HE UL MU fixed rate settings.

Signed-off-by: Muna Sinada <msinada@codeaurora.org>
---
 include/net/cfg80211.h       | 1 +
 include/uapi/linux/nl80211.h | 2 ++
 net/wireless/nl80211.c       | 9 +++++++++
 3 files changed, 12 insertions(+)

diff --git a/include/net/cfg80211.h b/include/net/cfg80211.h
index 96bf879c049b..a6cc2c8a8c92 100644
--- a/include/net/cfg80211.h
+++ b/include/net/cfg80211.h
@@ -1039,6 +1039,7 @@ struct cfg80211_bitrate_mask {
 		enum nl80211_txrate_gi gi;
 		enum nl80211_he_gi he_gi;
 		enum nl80211_he_ltf he_ltf;
+		u16 he_ul_mcs[NL80211_HE_NSS_MAX];
 	} control[NUM_NL80211_BANDS];
 };
 
diff --git a/include/uapi/linux/nl80211.h b/include/uapi/linux/nl80211.h
index 69e2cf22a329..e418c6be9494 100644
--- a/include/uapi/linux/nl80211.h
+++ b/include/uapi/linux/nl80211.h
@@ -4685,6 +4685,7 @@ enum nl80211_key_attributes {
  *	see &struct nl80211_txrate_he
  * @NL80211_TXRATE_HE_GI: configure HE GI, 0.8us, 1.6us and 3.2us.
  * @NL80211_TXRATE_HE_LTF: configure HE LTF, 1XLTF, 2XLTF and 4XLTF.
+ * @NL80211_TXRATE_HE_UL: HE MCS rates of connected HE STA for uplink traffic.
  * @__NL80211_TXRATE_AFTER_LAST: internal
  * @NL80211_TXRATE_MAX: highest TX rate attribute
  */
@@ -4697,6 +4698,7 @@ enum nl80211_tx_rate_attributes {
 	NL80211_TXRATE_HE,
 	NL80211_TXRATE_HE_GI,
 	NL80211_TXRATE_HE_LTF,
+	NL80211_TXRATE_HE_UL,
 
 	/* keep last */
 	__NL80211_TXRATE_AFTER_LAST,
diff --git a/net/wireless/nl80211.c b/net/wireless/nl80211.c
index 33f1ad127e8f..b057168941c9 100644
--- a/net/wireless/nl80211.c
+++ b/net/wireless/nl80211.c
@@ -4467,6 +4467,10 @@ static const struct nla_policy nl80211_txattr_policy[NL80211_TXRATE_MAX + 1] = {
 	[NL80211_TXRATE_HE_LTF] = NLA_POLICY_RANGE(NLA_U8,
 						   NL80211_RATE_INFO_HE_1XLTF,
 						   NL80211_RATE_INFO_HE_4XLTF),
+	[NL80211_TXRATE_HE_UL] = {
+		.type = NLA_EXACT_LEN,
+		.len = sizeof(struct nl80211_txrate_he),
+	},
 };
 
 static int nl80211_parse_tx_bitrate_mask(struct genl_info *info,
@@ -4575,6 +4579,11 @@ static int nl80211_parse_tx_bitrate_mask(struct genl_info *info,
 		if (tb[NL80211_TXRATE_HE_LTF])
 			mask->control[band].he_ltf =
 				nla_get_u8(tb[NL80211_TXRATE_HE_LTF]);
+		if (tb[NL80211_TXRATE_HE_UL] &&
+		    !he_set_mcs_mask(info, sband,
+				     nla_data(tb[NL80211_TXRATE_HE_UL]),
+				     mask->control[band].he_ul_mcs))
+			return -EINVAL;
 
 		if (mask->control[band].legacy == 0) {
 			/* don't allow empty legacy rates if HT or VHT
-- 
2.7.4


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
