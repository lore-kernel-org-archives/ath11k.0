Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iPPuZ-0000Vx-Ok
 for ath11k@lists.infradead.org; Tue, 29 Oct 2019 11:43:45 +0000
From: Sathishkumar Muruganandam <murugana@codeaurora.org>
Subject: [PATCH 1/2] nl80211: add Wide Band Scan support
Date: Tue, 29 Oct 2019 17:13:24 +0530
Message-Id: <1572349405-4653-2-git-send-email-murugana@codeaurora.org>
In-Reply-To: <1572349405-4653-1-git-send-email-murugana@codeaurora.org>
References: <1572349405-4653-1-git-send-email-murugana@codeaurora.org>
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
Cc: Sathishkumar Muruganandam <murugana@codeaurora.org>

New nl80211 ext_feature and scan_flag added to support wide band scan which
allows driver to scan on requested channel with corresponding
phy mode/bandwidth (40Mhz, 80Mhz).

To handle center frequency of 80Mhz channel, struct cfg80211_chan_def is
included in cfg80211_scan_request.

Signed-off-by: Sathishkumar Muruganandam <murugana@codeaurora.org>
---
 include/net/cfg80211.h       |  2 ++
 include/uapi/linux/nl80211.h |  7 +++++
 net/mac80211/scan.c          |  2 ++
 net/wireless/nl80211.c       | 68 ++++++++++++++++++++++++++++----------------
 4 files changed, 55 insertions(+), 24 deletions(-)

diff --git a/include/net/cfg80211.h b/include/net/cfg80211.h
index 8140c4837122..fab7186dcd87 100644
--- a/include/net/cfg80211.h
+++ b/include/net/cfg80211.h
@@ -1822,6 +1822,7 @@ struct cfg80211_scan_info {
  * @channels: channels to scan on.
  * @n_channels: total number of channels to scan
  * @scan_width: channel width for scanning
+ * @chandef: defines the channel to do wide band scan
  * @ie: optional information element(s) to add into Probe Request or %NULL
  * @ie_len: length of ie in octets
  * @duration: how long to listen on each channel, in TUs. If
@@ -1848,6 +1849,7 @@ struct cfg80211_scan_request {
 	int n_ssids;
 	u32 n_channels;
 	enum nl80211_bss_scan_width scan_width;
+	struct cfg80211_chan_def *chandef;
 	const u8 *ie;
 	size_t ie_len;
 	u16 duration;
diff --git a/include/uapi/linux/nl80211.h b/include/uapi/linux/nl80211.h
index 822851d369ab..26580f533138 100644
--- a/include/uapi/linux/nl80211.h
+++ b/include/uapi/linux/nl80211.h
@@ -5452,6 +5452,9 @@ enum nl80211_feature_flags {
  * @NL80211_EXT_FEATURE_SAE_OFFLOAD: Device wants to do SAE authentication in
  *	station mode (SAE password is passed as part of the connect command).
  *
+ * @NL80211_EXT_FEATURE_WIDE_BAND_SCAN: Driver/device supports wide band scan
+ *	on a frequency along with its corresponding phymode (40Mhz, 80Mhz)
+ *
  * @NUM_NL80211_EXT_FEATURES: number of extended features.
  * @MAX_NL80211_EXT_FEATURES: highest extended feature index.
  */
@@ -5497,6 +5500,7 @@ enum nl80211_ext_feature_index {
 	NL80211_EXT_FEATURE_EXT_KEY_ID,
 	NL80211_EXT_FEATURE_STA_TX_PWR,
 	NL80211_EXT_FEATURE_SAE_OFFLOAD,
+	NL80211_EXT_FEATURE_WIDE_BAND_SCAN,
 
 	/* add new features before the definition below */
 	NUM_NL80211_EXT_FEATURES,
@@ -5608,6 +5612,8 @@ enum nl80211_timeout_reason {
  * @NL80211_SCAN_FLAG_MIN_PREQ_CONTENT: minimize probe request content to
  *	only have supported rates and no additional capabilities (unless
  *	added by userspace explicitly.)
+ * @NL80211_SCAN_FLAG_WIDE_BAND_SCAN: This flag intends the driver to perform
+ *	wide band scan only if the driver supports it.
  */
 enum nl80211_scan_flags {
 	NL80211_SCAN_FLAG_LOW_PRIORITY				= 1<<0,
@@ -5623,6 +5629,7 @@ enum nl80211_scan_flags {
 	NL80211_SCAN_FLAG_HIGH_ACCURACY				= 1<<10,
 	NL80211_SCAN_FLAG_RANDOM_SN				= 1<<11,
 	NL80211_SCAN_FLAG_MIN_PREQ_CONTENT			= 1<<12,
+	NL80211_SCAN_FLAG_WIDE_BAND_SCAN			= 1<<13,
 };
 
 /**
diff --git a/net/mac80211/scan.c b/net/mac80211/scan.c
index adf94ba1ed77..00ee715aa012 100644
--- a/net/mac80211/scan.c
+++ b/net/mac80211/scan.c
@@ -662,11 +662,13 @@ static int __ieee80211_start_scan(struct ieee80211_sub_if_data *sdata,
 
 		local->hw_scan_req = kmalloc(
 				sizeof(*local->hw_scan_req) +
+				sizeof(*req->chandef) +
 				req->n_channels * sizeof(req->channels[0]) +
 				local->hw_scan_ies_bufsize, GFP_KERNEL);
 		if (!local->hw_scan_req)
 			return -ENOMEM;
 
+		local->hw_scan_req->req.chandef = req->chandef;
 		local->hw_scan_req->req.ssids = req->ssids;
 		local->hw_scan_req->req.n_ssids = req->n_ssids;
 		ies = (u8 *)local->hw_scan_req +
diff --git a/net/wireless/nl80211.c b/net/wireless/nl80211.c
index 92e06482563c..429505b5d627 100644
--- a/net/wireless/nl80211.c
+++ b/net/wireless/nl80211.c
@@ -7407,7 +7407,10 @@ nl80211_check_scan_flags(struct wiphy *wiphy, struct wireless_dev *wdev,
 				     NL80211_EXT_FEATURE_SCAN_RANDOM_SN) ||
 	    !nl80211_check_scan_feat(wiphy, *flags,
 				     NL80211_SCAN_FLAG_MIN_PREQ_CONTENT,
-				     NL80211_EXT_FEATURE_SCAN_MIN_PREQ_CONTENT))
+				     NL80211_EXT_FEATURE_SCAN_MIN_PREQ_CONTENT) ||
+	    !nl80211_check_scan_feat(wiphy, *flags,
+				     NL80211_SCAN_FLAG_WIDE_BAND_SCAN,
+				     NL80211_EXT_FEATURE_WIDE_BAND_SCAN))
 		return -EOPNOTSUPP;
 
 	if (*flags & NL80211_SCAN_FLAG_RANDOM_ADDR) {
@@ -7430,10 +7433,12 @@ static int nl80211_trigger_scan(struct sk_buff *skb, struct genl_info *info)
 	struct cfg80211_registered_device *rdev = info->user_ptr[0];
 	struct wireless_dev *wdev = info->user_ptr[1];
 	struct cfg80211_scan_request *request;
+	struct cfg80211_chan_def chandef;
 	struct nlattr *attr;
 	struct wiphy *wiphy;
-	int err, tmp, n_ssids = 0, n_channels, i;
+	int err, tmp, n_ssids = 0, n_channels = 0, i;
 	size_t ie_len;
+	bool chandef_found = false;
 
 	wiphy = &rdev->wiphy;
 
@@ -7448,7 +7453,14 @@ static int nl80211_trigger_scan(struct sk_buff *skb, struct genl_info *info)
 		goto unlock;
 	}
 
-	if (info->attrs[NL80211_ATTR_SCAN_FREQUENCIES]) {
+	if (info->attrs[NL80211_ATTR_WIPHY_FREQ]) {
+		n_channels = 1;
+		if (nl80211_parse_chandef(rdev, info, &chandef)) {
+			err = -EINVAL;
+			goto unlock;
+		}
+		chandef_found = true;
+	} else if (info->attrs[NL80211_ATTR_SCAN_FREQUENCIES]) {
 		n_channels = validate_scan_freqs(
 				info->attrs[NL80211_ATTR_SCAN_FREQUENCIES]);
 		if (!n_channels) {
@@ -7479,6 +7491,7 @@ static int nl80211_trigger_scan(struct sk_buff *skb, struct genl_info *info)
 	}
 
 	request = kzalloc(sizeof(*request)
+			+ sizeof(*request->chandef)
 			+ sizeof(*request->ssids) * n_ssids
 			+ sizeof(*request->channels) * n_channels
 			+ ie_len, GFP_KERNEL);
@@ -7487,6 +7500,12 @@ static int nl80211_trigger_scan(struct sk_buff *skb, struct genl_info *info)
 		goto unlock;
 	}
 
+	if (chandef_found) {
+		request->chandef = &chandef;
+		request->channels[0] = chandef.chan;
+		request->n_channels = n_channels;
+	}
+
 	if (n_ssids)
 		request->ssids = (void *)&request->channels[n_channels];
 	request->n_ssids = n_ssids;
@@ -7517,7 +7536,7 @@ static int nl80211_trigger_scan(struct sk_buff *skb, struct genl_info *info)
 			request->channels[i] = chan;
 			i++;
 		}
-	} else {
+	} else if (!chandef_found) {
 		enum nl80211_band band;
 
 		/* all channels */
@@ -7540,31 +7559,32 @@ static int nl80211_trigger_scan(struct sk_buff *skb, struct genl_info *info)
 		}
 	}
 
-	if (!i) {
-		err = -EINVAL;
-		goto out_free;
-	}
-
-	request->n_channels = i;
-
-	wdev_lock(wdev);
-	if (!cfg80211_off_channel_oper_allowed(wdev)) {
-		struct ieee80211_channel *chan;
-
-		if (request->n_channels != 1) {
-			wdev_unlock(wdev);
-			err = -EBUSY;
+	if (!chandef_found) {
+		if (!i) {
+			err = -EINVAL;
 			goto out_free;
 		}
+		request->n_channels = i;
 
-		chan = request->channels[0];
-		if (chan->center_freq != wdev->chandef.chan->center_freq) {
-			wdev_unlock(wdev);
-			err = -EBUSY;
-			goto out_free;
+		wdev_lock(wdev);
+		if (!cfg80211_off_channel_oper_allowed(wdev)) {
+			struct ieee80211_channel *chan;
+
+			if (request->n_channels != 1) {
+				wdev_unlock(wdev);
+				err = -EBUSY;
+				goto out_free;
+			}
+
+			chan = request->channels[0];
+			if (chan->center_freq != wdev->chandef.chan->center_freq) {
+				wdev_unlock(wdev);
+				err = -EBUSY;
+				goto out_free;
+			}
 		}
+		wdev_unlock(wdev);
 	}
-	wdev_unlock(wdev);
 
 	i = 0;
 	if (n_ssids) {
-- 
2.7.4


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
