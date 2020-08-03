Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from nbd.name ([2a01:4f8:221:3d45::2])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k2WBv-0002zg-5E
 for ath11k@lists.infradead.org; Mon, 03 Aug 2020 08:51:32 +0000
From: John Crispin <john@phrozen.org>
Subject: [PATCH V5 2/3] mac80211: add support for setting fixed HE rate/gi/ltf
Date: Mon,  3 Aug 2020 10:51:26 +0200
Message-Id: <20200803085127.180550-2-john@phrozen.org>
In-Reply-To: <20200803085127.180550-1-john@phrozen.org>
References: <20200803085127.180550-1-john@phrozen.org>
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
Cc: Miles Hu <milehu@codeaurora.org>, linux-wireless@vger.kernel.org, ath11k@lists.infradead.org, John Crispin <john@phrozen.org>

From: Miles Hu <milehu@codeaurora.org>

With nl80211 now able to receive fixed HE rate/gi/ltf settings we want to
propagate these further down the stack into the mac80211 drivers. This
patch copies the values into the sdata struct.

Signed-off-by: Miles Hu <milehu@codeaurora.org>
Signed-off-by: John Crispin <john@phrozen.org>
---
 net/mac80211/cfg.c         | 11 +++++++++++
 net/mac80211/ieee80211_i.h |  3 +++
 2 files changed, 14 insertions(+)

diff --git a/net/mac80211/cfg.c b/net/mac80211/cfg.c
index 24e9e00decb8..efee1a4e0600 100644
--- a/net/mac80211/cfg.c
+++ b/net/mac80211/cfg.c
@@ -2863,9 +2863,13 @@ static int ieee80211_set_bitrate_mask(struct wiphy *wiphy,
 		memcpy(sdata->rc_rateidx_vht_mcs_mask[i],
 		       mask->control[i].vht_mcs,
 		       sizeof(mask->control[i].vht_mcs));
+		memcpy(sdata->rc_rateidx_he_mcs_mask[i],
+		       mask->control[i].he_mcs,
+		       sizeof(mask->control[i].he_mcs));
 
 		sdata->rc_has_mcs_mask[i] = false;
 		sdata->rc_has_vht_mcs_mask[i] = false;
+		sdata->rc_has_he_mcs_mask[i] = false;
 		if (!sband)
 			continue;
 
@@ -2882,6 +2886,13 @@ static int ieee80211_set_bitrate_mask(struct wiphy *wiphy,
 				break;
 			}
 		}
+
+		for (j = 0; j < NL80211_HE_NSS_MAX; j++) {
+			if (~sdata->rc_rateidx_he_mcs_mask[i][j]) {
+				sdata->rc_has_he_mcs_mask[i] = true;
+				break;
+			}
+		}
 	}
 
 	return 0;
diff --git a/net/mac80211/ieee80211_i.h b/net/mac80211/ieee80211_i.h
index 0b1eaec6649f..19ff8a2ff7b6 100644
--- a/net/mac80211/ieee80211_i.h
+++ b/net/mac80211/ieee80211_i.h
@@ -967,6 +967,9 @@ struct ieee80211_sub_if_data {
 	u32 beacon_rateidx_mask[NUM_NL80211_BANDS];
 	bool beacon_rate_set;
 
+	bool rc_has_he_mcs_mask[NUM_NL80211_BANDS];
+	u16 rc_rateidx_he_mcs_mask[NUM_NL80211_BANDS][NL80211_HE_NSS_MAX];
+
 	union {
 		struct ieee80211_if_ap ap;
 		struct ieee80211_if_wds wds;
-- 
2.25.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
