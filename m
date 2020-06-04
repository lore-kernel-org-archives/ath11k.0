Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from nbd.name ([2a01:4f8:221:3d45::2])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jgk0p-0000Hk-N5
 for ath11k@lists.infradead.org; Thu, 04 Jun 2020 07:10:07 +0000
From: John Crispin <john@phrozen.org>
Subject: [PATCH 07/12] mac80211: propagate beacon tx mode to the driver
Date: Thu,  4 Jun 2020 09:09:47 +0200
Message-Id: <20200604070952.15481-8-john@phrozen.org>
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

Now that we can set the beacon xmit mode via nl80211 we want to also
propagate that info to the device driver. This patch sets the field
inside bss_config.

Signed-off-by: John Crispin <john@phrozen.org>
---
 include/net/mac80211.h | 2 ++
 net/mac80211/cfg.c     | 1 +
 2 files changed, 3 insertions(+)

diff --git a/include/net/mac80211.h b/include/net/mac80211.h
index 3812adcef7d7..f99abd5e8bc6 100644
--- a/include/net/mac80211.h
+++ b/include/net/mac80211.h
@@ -607,6 +607,7 @@ struct ieee80211_ftm_responder_params {
  * @he_obss_pd: OBSS Packet Detection parameters.
  * @he_bss_color: BSS coloring settings, if BSS supports HE
  * @multi_bssid: the multi bssid settings of the AP.
+ * @beacon_tx_mode: the beacon tx mode. This can be staggered or burst.
  */
 struct ieee80211_bss_conf {
 	const u8 *bssid;
@@ -671,6 +672,7 @@ struct ieee80211_bss_conf {
 	struct ieee80211_he_obss_pd he_obss_pd;
 	struct cfg80211_he_bss_color he_bss_color;
 	struct ieee80211_multi_bssid multi_bssid;
+	enum nl80211_beacon_tx_mode beacon_tx_mode;
 };
 
 /**
diff --git a/net/mac80211/cfg.c b/net/mac80211/cfg.c
index f6f7323c66ab..1f3c93b8f265 100644
--- a/net/mac80211/cfg.c
+++ b/net/mac80211/cfg.c
@@ -1071,6 +1071,7 @@ static int ieee80211_start_ap(struct wiphy *wiphy, struct net_device *dev,
 
 	prev_beacon_int = sdata->vif.bss_conf.beacon_int;
 	sdata->vif.bss_conf.beacon_int = params->beacon_interval;
+	sdata->vif.bss_conf.beacon_tx_mode = params->beacon_tx_mode;
 
 	if (params->he_cap && params->he_oper) {
 		sdata->vif.bss_conf.he_support = true;
-- 
2.20.1


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
