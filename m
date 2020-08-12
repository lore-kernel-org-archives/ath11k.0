Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from nbd.name ([2a01:4f8:221:3d45::2])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k5sFT-0007tn-4E
 for ath11k@lists.infradead.org; Wed, 12 Aug 2020 15:01:07 +0000
From: John Crispin <john@phrozen.org>
Subject: [PATCH V3 9/9] ath11k: set the multiple bssid hw flags and
 capabilities
Date: Wed, 12 Aug 2020 17:00:50 +0200
Message-Id: <20200812150050.2683396-10-john@phrozen.org>
In-Reply-To: <20200812150050.2683396-1-john@phrozen.org>
References: <20200812150050.2683396-1-john@phrozen.org>
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

This wraps up the support for multiple bssid and actually makes
the feature available.

Signed-off-by: John Crispin <john@phrozen.org>
---
 drivers/net/wireless/ath/ath11k/mac.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 306f123c09a7..c4bd6b1a48c3 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -5999,19 +5999,23 @@ static int ath11k_mac_setup_channels_rates(struct ath11k *ar,
 
 static const u8 ath11k_if_types_ext_capa[] = {
 	[0] = WLAN_EXT_CAPA1_EXT_CHANNEL_SWITCHING,
+	[2] = WLAN_EXT_CAPA3_MULTI_BSSID_SUPPORT,
 	[7] = WLAN_EXT_CAPA8_OPMODE_NOTIF,
 };
 
 static const u8 ath11k_if_types_ext_capa_sta[] = {
 	[0] = WLAN_EXT_CAPA1_EXT_CHANNEL_SWITCHING,
+	[2] = WLAN_EXT_CAPA3_MULTI_BSSID_SUPPORT,
 	[7] = WLAN_EXT_CAPA8_OPMODE_NOTIF,
 	[9] = WLAN_EXT_CAPA10_TWT_REQUESTER_SUPPORT,
 };
 
 static const u8 ath11k_if_types_ext_capa_ap[] = {
 	[0] = WLAN_EXT_CAPA1_EXT_CHANNEL_SWITCHING,
+	[2] = WLAN_EXT_CAPA3_MULTI_BSSID_SUPPORT,
 	[7] = WLAN_EXT_CAPA8_OPMODE_NOTIF,
 	[9] = WLAN_EXT_CAPA10_TWT_RESPONDER_SUPPORT,
+	[11] = WLAN_EXT_CAPA11_EMA_SUPPORT,
 };
 
 static const struct wiphy_iftype_ext_capab ath11k_iftypes_ext_capa[] = {
@@ -6121,6 +6125,8 @@ static int __ath11k_mac_register(struct ath11k *ar)
 	ieee80211_hw_set(ar->hw, QUEUE_CONTROL);
 	ieee80211_hw_set(ar->hw, SUPPORTS_TX_FRAG);
 	ieee80211_hw_set(ar->hw, REPORTS_LOW_ACK);
+	ieee80211_hw_set(ar->hw, SUPPORTS_MULTI_BSSID);
+	ieee80211_hw_set(ar->hw, SUPPORTS_MULTI_BSSID_AP);
 	if (ht_cap & WMI_HT_CAP_ENABLED) {
 		ieee80211_hw_set(ar->hw, AMPDU_AGGREGATION);
 		ieee80211_hw_set(ar->hw, TX_AMPDU_SETUP_IN_HW);
-- 
2.25.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
