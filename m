Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from nbd.name ([2a01:4f8:221:3d45::2])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hT6IL-00008u-6y
 for ath11k@lists.infradead.org; Tue, 21 May 2019 15:03:14 +0000
From: John Crispin <john@phrozen.org>
Subject: [PATCH 1/2] mac80211: add ieee80211_get_he_iftype_cap() helper
Date: Tue, 21 May 2019 17:02:58 +0200
Message-Id: <20190521150259.2414-1-john@phrozen.org>
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
Cc: Shashidhar Lakkavalli <slakkavalli@datto.com>, linux-wireless@vger.kernel.org, ath11k@lists.infradead.org, John Crispin <john@phrozen.org>

This function is similar to ieee80211_get_he_sta_cap() but allows passing
the iftype. Also make ieee80211_get_he_sta_cap() use the new helper
rather than duplicating the code.

Signed-off-by: Shashidhar Lakkavalli <slakkavalli@datto.com>
Signed-off-by: John Crispin <john@phrozen.org>
---
 include/net/cfg80211.h | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/include/net/cfg80211.h b/include/net/cfg80211.h
index 3f67f01b5f7a..379202ff3d14 100644
--- a/include/net/cfg80211.h
+++ b/include/net/cfg80211.h
@@ -395,16 +395,18 @@ ieee80211_get_sband_iftype_data(const struct ieee80211_supported_band *sband,
 }
 
 /**
- * ieee80211_get_he_sta_cap - return HE capabilities for an sband's STA
- * @sband: the sband to search for the STA on
+ * ieee80211_get_he_iftype_cap - return HE capabilities for an sband's iftype
+ * @sband: the sband to search for the iftype on
+ * @iftype: enum nl80211_iftype
  *
  * Return: pointer to the struct ieee80211_sta_he_cap, or NULL is none found
  */
 static inline const struct ieee80211_sta_he_cap *
-ieee80211_get_he_sta_cap(const struct ieee80211_supported_band *sband)
+ieee80211_get_he_iftype_cap(const struct ieee80211_supported_band *sband,
+			    u8 iftype)
 {
 	const struct ieee80211_sband_iftype_data *data =
-		ieee80211_get_sband_iftype_data(sband, NL80211_IFTYPE_STATION);
+		ieee80211_get_sband_iftype_data(sband, iftype);
 
 	if (data && data->he_cap.has_he)
 		return &data->he_cap;
@@ -412,6 +414,18 @@ ieee80211_get_he_sta_cap(const struct ieee80211_supported_band *sband)
 	return NULL;
 }
 
+/**
+ * ieee80211_get_he_sta_cap - return HE capabilities for an sband's STA
+ * @sband: the sband to search for the STA on
+ *
+ * Return: pointer to the struct ieee80211_sta_he_cap, or NULL is none found
+ */
+static inline const struct ieee80211_sta_he_cap *
+ieee80211_get_he_sta_cap(const struct ieee80211_supported_band *sband)
+{
+	return ieee80211_get_he_iftype_cap(sband, NL80211_IFTYPE_STATION);
+}
+
 /**
  * wiphy_read_of_freq_limits - read frequency limits from device tree
  *
-- 
2.20.1


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
