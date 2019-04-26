Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from nbd.name ([2a01:4f8:221:3d45::2])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hJxMo-0004rp-3T
 for ath11k@lists.infradead.org; Fri, 26 Apr 2019 09:42:04 +0000
From: John Crispin <john@phrozen.org>
Subject: [PATCH V2 2/3] mac80211: dynamically turn TWT requester support on
 and off
Date: Fri, 26 Apr 2019 11:41:49 +0200
Message-Id: <20190426094150.18078-3-john@phrozen.org>
In-Reply-To: <20190426094150.18078-1-john@phrozen.org>
References: <20190426094150.18078-1-john@phrozen.org>
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
To: Johannes Berg <johannes@sipsolutions.net>, Kalle Valo <kvalo@codeaurora.org>
Cc: John Crispin <john@phrozen.org>, linux-wireless@vger.kernel.org, Rajkumar Manoharan <rmanohar@qti.qualcomm.com>, Srini Kode <skode@qti.qualcomm.com>, Shashidhar Lakkavalli <slakkavalli@datto.com>, ath11k@lists.infradead.org

Turn TWT on/off for STA interfaces when they associate and/or receive a
beacon where the twt_responder bit has changed.

Signed-off-by: Shashidhar Lakkavalli <slakkavalli@datto.com>
Signed-off-by: John Crispin <john@phrozen.org>
---
 net/mac80211/mlme.c | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/net/mac80211/mlme.c b/net/mac80211/mlme.c
index 2dbcf5d5512e..f3563670ed58 100644
--- a/net/mac80211/mlme.c
+++ b/net/mac80211/mlme.c
@@ -3151,6 +3151,21 @@ static bool ieee80211_twt_req_supported(const struct sta_info *sta,
 		IEEE80211_HE_MAC_CAP0_TWT_RES;
 }
 
+static int ieee80211_recalc_twt_req(struct ieee80211_sub_if_data *sdata,
+				    struct sta_info *sta,
+				    struct ieee802_11_elems *elems)
+{
+	bool twt_req;
+
+	twt_req = ieee80211_twt_req_supported(sta, elems);
+
+	if (sdata->vif.bss_conf.twt_requester != twt_req) {
+		sdata->vif.bss_conf.twt_requester = twt_req;
+		return BSS_CHANGED_TWT;
+	}
+	return 0;
+}
+
 static bool ieee80211_assoc_success(struct ieee80211_sub_if_data *sdata,
 				    struct cfg80211_bss *cbss,
 				    struct ieee80211_mgmt *mgmt, size_t len)
@@ -3333,8 +3348,7 @@ static bool ieee80211_assoc_success(struct ieee80211_sub_if_data *sdata,
 						  sta);
 
 		bss_conf->he_support = sta->sta.he_cap.has_he;
-		bss_conf->twt_requester =
-			ieee80211_twt_req_supported(sta, &elems);
+		changed |= ieee80211_recalc_twt_req(sdata, sta, &elems);
 	} else {
 		bss_conf->he_support = false;
 		bss_conf->twt_requester = false;
@@ -3994,6 +4008,8 @@ static void ieee80211_rx_mgmt_beacon(struct ieee80211_sub_if_data *sdata,
 	mutex_lock(&local->sta_mtx);
 	sta = sta_info_get(sdata, bssid);
 
+	changed |= ieee80211_recalc_twt_req(sdata, sta, &elems);
+
 	if (ieee80211_config_bw(sdata, sta,
 				elems.ht_cap_elem, elems.ht_operation,
 				elems.vht_operation, elems.he_operation,
-- 
2.11.0


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
