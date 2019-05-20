Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from nbd.name ([2a01:4f8:221:3d45::2])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hSg3Z-0007IZ-Kh
 for ath11k@lists.infradead.org; Mon, 20 May 2019 11:02:16 +0000
From: John Crispin <john@phrozen.org>
Subject: [PATCH 1/7] mac80211: HE: dynamically enable the TWT requester
 support on STA interfaces
Date: Mon, 20 May 2019 13:01:58 +0200
Message-Id: <20190520110204.27588-2-john@phrozen.org>
In-Reply-To: <20190520110204.27588-1-john@phrozen.org>
References: <20190520110204.27588-1-john@phrozen.org>
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
Cc: Shashidhar Lakkavalli <slakkavalli@datto.com>, linux-wireless@vger.kernel.org, ath11k@lists.infradead.org, John Crispin <john@phrozen.org>

Turn TWT for STA interfaces when they associate and/or receive a
beacon where the twt_responder bit has changed.

Signed-off-by: Shashidhar Lakkavalli <slakkavalli@datto.com>
Signed-off-by: John Crispin <john@phrozen.org>
---
 include/net/mac80211.h |  2 ++
 net/mac80211/mlme.c    | 18 ++++++++++++++++--
 2 files changed, 18 insertions(+), 2 deletions(-)

diff --git a/include/net/mac80211.h b/include/net/mac80211.h
index ba4a16f87364..689dc597281c 100644
--- a/include/net/mac80211.h
+++ b/include/net/mac80211.h
@@ -317,6 +317,7 @@ struct ieee80211_vif_chanctx_switch {
  * @BSS_CHANGED_MCAST_RATE: Multicast Rate setting changed for this interface
  * @BSS_CHANGED_FTM_RESPONDER: fime timing reasurement request responder
  *	functionality changed for this BSS (AP mode).
+ * @BSS_CHANGED_TWT: TWT status changed
  *
  */
 enum ieee80211_bss_change {
@@ -347,6 +348,7 @@ enum ieee80211_bss_change {
 	BSS_CHANGED_KEEP_ALIVE		= 1<<24,
 	BSS_CHANGED_MCAST_RATE		= 1<<25,
 	BSS_CHANGED_FTM_RESPONDER	= 1<<26,
+	BSS_CHANGED_TWT			= 1<<27,
 
 	/* when adding here, make sure to change ieee80211_reconfig */
 };
diff --git a/net/mac80211/mlme.c b/net/mac80211/mlme.c
index 5d8a8a0feaf9..996439a288c0 100644
--- a/net/mac80211/mlme.c
+++ b/net/mac80211/mlme.c
@@ -3151,6 +3151,19 @@ static bool ieee80211_twt_req_supported(const struct sta_info *sta,
 		IEEE80211_HE_MAC_CAP0_TWT_RES;
 }
 
+static int ieee80211_recalc_twt_req(struct ieee80211_sub_if_data *sdata,
+				    struct sta_info *sta,
+				    struct ieee802_11_elems *elems)
+{
+	bool twt = ieee80211_twt_req_supported(sta, elems);
+
+	if (sdata->vif.bss_conf.twt_requester != twt) {
+		sdata->vif.bss_conf.twt_requester = twt;
+		return BSS_CHANGED_TWT;
+	}
+	return 0;
+}
+
 static bool ieee80211_assoc_success(struct ieee80211_sub_if_data *sdata,
 				    struct cfg80211_bss *cbss,
 				    struct ieee80211_mgmt *mgmt, size_t len)
@@ -3333,8 +3346,7 @@ static bool ieee80211_assoc_success(struct ieee80211_sub_if_data *sdata,
 						  sta);
 
 		bss_conf->he_support = sta->sta.he_cap.has_he;
-		bss_conf->twt_requester =
-			ieee80211_twt_req_supported(sta, &elems);
+		changed |= ieee80211_recalc_twt_req(sdata, sta, &elems);
 	} else {
 		bss_conf->he_support = false;
 		bss_conf->twt_requester = false;
@@ -3995,6 +4007,8 @@ static void ieee80211_rx_mgmt_beacon(struct ieee80211_sub_if_data *sdata,
 	mutex_lock(&local->sta_mtx);
 	sta = sta_info_get(sdata, bssid);
 
+	changed |= ieee80211_recalc_twt_req(sdata, sta, &elems);
+
 	if (ieee80211_config_bw(sdata, sta,
 				elems.ht_cap_elem, elems.ht_operation,
 				elems.vht_operation, elems.he_operation,
-- 
2.20.1


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
