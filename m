Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from nbd.name ([2a01:4f8:221:3d45::2])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k9Vbq-0002VX-14
 for ath11k@lists.infradead.org; Sat, 22 Aug 2020 15:39:11 +0000
From: John Crispin <john@phrozen.org>
Subject: [PATCH] mac80211: notify non-transmitting BSS of color changes
Date: Sat, 22 Aug 2020 17:39:02 +0200
Message-Id: <20200822153902.4091442-1-john@phrozen.org>
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

When a transmitting multiple bssid BSS changes its bss color, we need to
also notify the non transmitting BSSs of the new bss color.

This patch depends on the multiple bssid and bss coloring series.

Signed-off-by: John Crispin <john@phrozen.org>
---
 net/mac80211/cfg.c | 42 ++++++++++++++++++++++++++++++------------
 1 file changed, 30 insertions(+), 12 deletions(-)

diff --git a/net/mac80211/cfg.c b/net/mac80211/cfg.c
index 60bcf936d9c6..82b0ea4fcf0a 100644
--- a/net/mac80211/cfg.c
+++ b/net/mac80211/cfg.c
@@ -4182,6 +4182,32 @@ static int ieee80211_set_color_change_beacon(struct ieee80211_sub_if_data *sdata
 	return 0;
 }
 
+static void ieee80211_color_change_bss_config_notify(struct ieee80211_sub_if_data *sdata,
+						     u8 color, int enable, u32 changed)
+{
+	sdata->vif.bss_conf.he_bss_color.color = color;
+	sdata->vif.bss_conf.he_bss_color.enabled = enable;
+	changed |= BSS_CHANGED_HE_BSS_COLOR;
+
+	ieee80211_bss_info_change_notify(sdata, changed);
+
+	if (ieee80211_hw_check(&sdata->local->hw, SUPPORTS_MULTI_BSSID_AP) &&
+	    !sdata->vif.multiple_bssid.non_transmitted) {
+		struct ieee80211_vif *child;
+
+		list_for_each_entry(child, &sdata->vif.multiple_bssid.list,
+				    multiple_bssid.list) {
+			struct ieee80211_sub_if_data *child_sdata = vif_to_sdata(child);
+
+			sdata_lock(child_sdata);
+			child->bss_conf.he_bss_color.color = color;
+			child->bss_conf.he_bss_color.enabled = enable;
+			ieee80211_bss_info_change_notify(child_sdata, BSS_CHANGED_HE_BSS_COLOR);
+			sdata_unlock(child_sdata);
+		}
+	}
+}
+
 static int ieee80211_color_change_finalize(struct ieee80211_sub_if_data *sdata)
 {
 	struct ieee80211_local *local = sdata->local;
@@ -4199,12 +4225,7 @@ static int ieee80211_color_change_finalize(struct ieee80211_sub_if_data *sdata)
 		return err;
 	}
 
-	sdata->vif.bss_conf.he_bss_color.color = sdata->vif.color_change_color;
-	sdata->vif.bss_conf.he_bss_color.enabled = 1;
-	changed |= BSS_CHANGED_HE_BSS_COLOR;
-
-	ieee80211_bss_info_change_notify(sdata, changed);
-
+	ieee80211_color_change_bss_config_notify(sdata, sdata->vif.color_change_color, 1, 0);
 	cfg80211_color_change_notify(sdata->dev);
 
 	return 0;
@@ -4283,14 +4304,11 @@ __ieee80211_color_change(struct wiphy *wiphy, struct net_device *dev,
 
 	cfg80211_color_change_started_notify(sdata->dev, params->count);
 
-	if (changed) {
-		sdata->vif.bss_conf.he_bss_color.enabled = 0;
-		changed |= BSS_CHANGED_HE_BSS_COLOR;
-		ieee80211_bss_info_change_notify(sdata, changed);
-	} else {
+	if (changed)
+		ieee80211_color_change_bss_config_notify(sdata, 0, 0, changed);
+	else
 		/* if the beacon didn't change, we can finalize immediately */
 		ieee80211_color_change_finalize(sdata);
-	}
 
 	return 0;
 }
-- 
2.25.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
