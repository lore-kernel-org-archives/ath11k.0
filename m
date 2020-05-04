Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail27.static.mailgun.info ([104.130.122.27])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jVeYW-00029N-1e
 for ath11k@lists.infradead.org; Mon, 04 May 2020 17:07:02 +0000
From: Tamizh Chelvam <tamizhr@codeaurora.org>
Subject: [PATCH 1/2] mac80211: Add new AMPDU factor macro for HE peer caps
Date: Mon,  4 May 2020 22:34:59 +0530
Message-Id: <1588611900-21185-1-git-send-email-tamizhr@codeaurora.org>
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
To: ath11k@lists.infradead.org, johannes@sipsolutions.net
Cc: linux-wireless@vger.kernel.org, Tamizh Chelvam <tamizhr@codeaurora.org>

Add IEEE80211_HE_VHT_MAX_AMPDU_FACTOR and IEEE80211_HE_HT_MAX_AMPDU_FACTOR
as per spec to use for peer max ampdu factor.

Signed-off-by: Tamizh Chelvam <tamizhr@codeaurora.org>
---
 include/linux/ieee80211.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/linux/ieee80211.h b/include/linux/ieee80211.h
index a561db4..69e214c 100644
--- a/include/linux/ieee80211.h
+++ b/include/linux/ieee80211.h
@@ -1821,6 +1821,8 @@ int ieee80211_get_vht_max_nss(struct ieee80211_vht_cap *cap,
 #define IEEE80211_HE_MAC_CAP3_FLEX_TWT_SCHED			0x40
 #define IEEE80211_HE_MAC_CAP3_RX_CTRL_FRAME_TO_MULTIBSS		0x80
 
+#define IEEE80211_HE_MAC_CAP3_MAX_AMPDU_LEN_EXP_SHIFT		3
+
 #define IEEE80211_HE_MAC_CAP4_BSRP_BQRP_A_MPDU_AGG		0x01
 #define IEEE80211_HE_MAC_CAP4_QTP				0x02
 #define IEEE80211_HE_MAC_CAP4_BQR				0x04
@@ -1842,6 +1844,9 @@ int ieee80211_get_vht_max_nss(struct ieee80211_vht_cap *cap,
 #define IEEE80211_HE_MAC_CAP5_PUNCTURED_SOUNDING		0x40
 #define IEEE80211_HE_MAC_CAP5_HT_VHT_TRIG_FRAME_RX		0x80
 
+#define IEEE80211_HE_VHT_MAX_AMPDU_FACTOR	20
+#define IEEE80211_HE_HT_MAX_AMPDU_FACTOR	16
+
 /* 802.11ax HE PHY capabilities */
 #define IEEE80211_HE_PHY_CAP0_CHANNEL_WIDTH_SET_40MHZ_IN_2G		0x02
 #define IEEE80211_HE_PHY_CAP0_CHANNEL_WIDTH_SET_40MHZ_80MHZ_IN_5G	0x04
-- 
1.9.1

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
