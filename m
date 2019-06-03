Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from nbd.name ([2a01:4f8:221:3d45::2])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hXsDe-0002st-DJ
 for ath11k@lists.infradead.org; Mon, 03 Jun 2019 19:02:08 +0000
From: John Crispin <john@phrozen.org>
Subject: [PATCH V7 3/8] ath11k: move phymode selection from function to array
 lookup
Date: Mon,  3 Jun 2019 21:01:52 +0200
Message-Id: <20190603190157.25165-4-john@phrozen.org>
In-Reply-To: <20190603190157.25165-1-john@phrozen.org>
References: <20190603190157.25165-1-john@phrozen.org>
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
To: Kalle Valo <kvalo@codeaurora.org>
Cc: Shashidhar Lakkavalli <slakkavalli@datto.com>, ath11k@lists.infradead.org, John Crispin <john@phrozen.org>

With HE support getting added, the approach of using functions will quickly
get convoluted. Change the code to use an array lookup function instead.

Signed-off-by: Shashidhar Lakkavalli <slakkavalli@datto.com>
Signed-off-by: John Crispin <john@phrozen.org>
---
 drivers/net/wireless/ath/ath11k/mac.c | 116 ++++++++++++--------------
 drivers/net/wireless/ath/ath11k/mac.h |   2 +
 2 files changed, 54 insertions(+), 64 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index cda1bc302925..15a9591c7a01 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -105,6 +105,52 @@ static struct ieee80211_rate ath11k_legacy_rates[] = {
 	{ .bitrate = 540, .hw_value = ATH11K_HW_RATE_OFDM_54M },
 };
 
+static const int
+ath11k_phymodes[NUM_NL80211_BANDS][2][ATH11K_CHAN_WIDTH_NUM] = {
+	[NL80211_BAND_2GHZ] = {
+		{
+			[NL80211_CHAN_WIDTH_5] = MODE_UNKNOWN,
+			[NL80211_CHAN_WIDTH_10] = MODE_UNKNOWN,
+			[NL80211_CHAN_WIDTH_20_NOHT] = MODE_11G,
+			[NL80211_CHAN_WIDTH_20] = MODE_11NG_HT20,
+			[NL80211_CHAN_WIDTH_40] = MODE_11NG_HT40,
+			[NL80211_CHAN_WIDTH_80] = MODE_UNKNOWN,
+			[NL80211_CHAN_WIDTH_80P80] = MODE_UNKNOWN,
+			[NL80211_CHAN_WIDTH_160] = MODE_UNKNOWN,
+		}, {
+			[NL80211_CHAN_WIDTH_5] = MODE_UNKNOWN,
+			[NL80211_CHAN_WIDTH_10] = MODE_UNKNOWN,
+			[NL80211_CHAN_WIDTH_20_NOHT] = MODE_11G,
+			[NL80211_CHAN_WIDTH_20] = MODE_11AX_HE20_2G,
+			[NL80211_CHAN_WIDTH_40] = MODE_11AX_HE40_2G,
+			[NL80211_CHAN_WIDTH_80] = MODE_11AX_HE80_2G,
+			[NL80211_CHAN_WIDTH_80P80] = MODE_UNKNOWN,
+			[NL80211_CHAN_WIDTH_160] = MODE_UNKNOWN,
+		},
+	},
+	[NL80211_BAND_5GHZ] = {
+		{
+			[NL80211_CHAN_WIDTH_5] = MODE_UNKNOWN,
+			[NL80211_CHAN_WIDTH_10] = MODE_UNKNOWN,
+			[NL80211_CHAN_WIDTH_20_NOHT] = MODE_11A,
+			[NL80211_CHAN_WIDTH_20] = MODE_11AC_VHT20,
+			[NL80211_CHAN_WIDTH_40] = MODE_11AC_VHT40,
+			[NL80211_CHAN_WIDTH_80] = MODE_11AC_VHT80,
+			[NL80211_CHAN_WIDTH_160] = MODE_11AC_VHT160,
+			[NL80211_CHAN_WIDTH_80P80] = MODE_11AC_VHT80_80,
+		}, {
+			[NL80211_CHAN_WIDTH_5] = MODE_UNKNOWN,
+			[NL80211_CHAN_WIDTH_10] = MODE_UNKNOWN,
+			[NL80211_CHAN_WIDTH_20_NOHT] = MODE_11A,
+			[NL80211_CHAN_WIDTH_20] = MODE_11AX_HE20,
+			[NL80211_CHAN_WIDTH_40] = MODE_11AX_HE40,
+			[NL80211_CHAN_WIDTH_80] = MODE_11AX_HE80,
+			[NL80211_CHAN_WIDTH_160] = MODE_11AX_HE160,
+			[NL80211_CHAN_WIDTH_80P80] = MODE_11AX_HE80_80,
+		},
+	},
+};
+
 #define ATH11K_MAC_FIRST_OFDM_RATE_IDX 4
 #define ath11k_g_rates ath11k_legacy_rates
 #define ath11k_g_rates_size (ARRAY_SIZE(ath11k_legacy_rates))
@@ -151,69 +197,6 @@ static int get_num_chains(u32 mask)
 	return num_chains;
 }
 
-static inline enum wmi_phy_mode
-chan_to_phymode(const struct cfg80211_chan_def *chandef)
-{
-	enum wmi_phy_mode phymode = MODE_UNKNOWN;
-
-	switch (chandef->chan->band) {
-	case NL80211_BAND_2GHZ:
-		switch (chandef->width) {
-		case NL80211_CHAN_WIDTH_20_NOHT:
-			if (chandef->chan->flags & IEEE80211_CHAN_NO_OFDM)
-				phymode = MODE_11B;
-			else
-				phymode = MODE_11G;
-			break;
-		case NL80211_CHAN_WIDTH_20:
-			phymode = MODE_11NG_HT20;
-			break;
-		case NL80211_CHAN_WIDTH_40:
-			phymode = MODE_11NG_HT40;
-			break;
-		case NL80211_CHAN_WIDTH_5:
-		case NL80211_CHAN_WIDTH_10:
-		case NL80211_CHAN_WIDTH_80:
-		case NL80211_CHAN_WIDTH_80P80:
-		case NL80211_CHAN_WIDTH_160:
-			phymode = MODE_UNKNOWN;
-			break;
-		}
-		break;
-	case NL80211_BAND_5GHZ:
-		switch (chandef->width) {
-		case NL80211_CHAN_WIDTH_20_NOHT:
-			phymode = MODE_11A;
-			break;
-		case NL80211_CHAN_WIDTH_20:
-			phymode = MODE_11AC_VHT20;
-			break;
-		case NL80211_CHAN_WIDTH_40:
-			phymode = MODE_11AC_VHT40;
-			break;
-		case NL80211_CHAN_WIDTH_80:
-			phymode = MODE_11AC_VHT80;
-			break;
-		case NL80211_CHAN_WIDTH_160:
-			phymode = MODE_11AC_VHT160;
-			break;
-		case NL80211_CHAN_WIDTH_80P80:
-			phymode = MODE_11AC_VHT80_80;
-			break;
-		case NL80211_CHAN_WIDTH_5:
-		case NL80211_CHAN_WIDTH_10:
-			phymode = MODE_UNKNOWN;
-			break;
-		}
-		break;
-	default:
-		break;
-	}
-
-	WARN_ON(phymode == MODE_UNKNOWN);
-	return phymode;
-}
-
 u8 ath11k_mac_bitrate_to_idx(const struct ieee80211_supported_band *sband,
 			     u32 bitrate)
 {
@@ -4062,7 +4045,12 @@ ath11k_mac_vdev_start_restart(struct ath11k_vif *arvif,
 	arg.channel.freq = chandef->chan->center_freq;
 	arg.channel.band_center_freq1 = chandef->center_freq1;
 	arg.channel.band_center_freq2 = chandef->center_freq2;
-	arg.channel.mode = chan_to_phymode(chandef);
+	arg.channel.mode =
+		ath11k_phymodes[chandef->chan->band][he_support][chandef->width];
+	if (arg.channel.mode == MODE_11G &&
+	    chandef->chan->flags & IEEE80211_CHAN_NO_OFDM)
+		arg.channel.mode = MODE_11B;
+	WARN_ON(arg.channel.mode == MODE_UNKNOWN);
 
 	arg.channel.min_power = 0;
 	arg.channel.max_power = chandef->chan->max_power * 2;
diff --git a/drivers/net/wireless/ath/ath11k/mac.h b/drivers/net/wireless/ath/ath11k/mac.h
index 6f09c56c4eb9..c85fcc015ab1 100644
--- a/drivers/net/wireless/ath/ath11k/mac.h
+++ b/drivers/net/wireless/ath/ath11k/mac.h
@@ -162,6 +162,8 @@ struct ath11k_generic_iter {
 
 #define WMI_MAX_SPATIAL_STREAM               3
 
+#define ATH11K_CHAN_WIDTH_NUM			8
+
 int ath11k_mac_create(struct ath11k_base *ab);
 void ath11k_mac_destroy(struct ath11k_base *ab);
 void ath11k_mac_unregister(struct ath11k_base *ab);
-- 
2.20.1


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
