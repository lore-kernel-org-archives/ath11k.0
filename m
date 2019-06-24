Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hfYOo-0000Gq-8W
 for ath11k@lists.infradead.org; Mon, 24 Jun 2019 23:29:23 +0000
From: Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>
Subject: [PATCH] ath11k: set HE phymodes at vdev start by default
Date: Tue, 25 Jun 2019 04:59:15 +0530
Message-Id: <1561418955-9119-1-git-send-email-pradeepc@codeaurora.org>
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
Cc: Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>

phymode cannot be classified at vdev_start as driver wont be aware of
operating mode (11n/11ac/11ax) at this point. So setting HE phymodes
by default corresponding to bandwidth at vdev start will prevent FW
assert when phymode configured for the connecting peer is greater
than the phymode configured for the VDEV. phymode for each peer is
configured appropriately at the time of peer association.

Tested on IPQ8074.

Suggested-by: Rajkumar Manoharan <rmanohar@codeaurora.org>
Signed-off-by: Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/mac.c | 34 ++++------------------------------
 1 file changed, 4 insertions(+), 30 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 7a6c92760535..dccf4597d1ef 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -107,48 +107,26 @@
 };
 
 static const int
-ath11k_phymodes[NUM_NL80211_BANDS][2][ATH11K_CHAN_WIDTH_NUM] = {
+ath11k_phymodes[NUM_NL80211_BANDS][ATH11K_CHAN_WIDTH_NUM] = {
 	[NL80211_BAND_2GHZ] = {
-		{
 			[NL80211_CHAN_WIDTH_5] = MODE_UNKNOWN,
 			[NL80211_CHAN_WIDTH_10] = MODE_UNKNOWN,
-			[NL80211_CHAN_WIDTH_20_NOHT] = MODE_11G,
-			[NL80211_CHAN_WIDTH_20] = MODE_11NG_HT20,
-			[NL80211_CHAN_WIDTH_40] = MODE_11NG_HT40,
-			[NL80211_CHAN_WIDTH_80] = MODE_UNKNOWN,
-			[NL80211_CHAN_WIDTH_80P80] = MODE_UNKNOWN,
-			[NL80211_CHAN_WIDTH_160] = MODE_UNKNOWN,
-		}, {
-			[NL80211_CHAN_WIDTH_5] = MODE_UNKNOWN,
-			[NL80211_CHAN_WIDTH_10] = MODE_UNKNOWN,
-			[NL80211_CHAN_WIDTH_20_NOHT] = MODE_11G,
+			[NL80211_CHAN_WIDTH_20_NOHT] = MODE_11AX_HE20_2G,
 			[NL80211_CHAN_WIDTH_20] = MODE_11AX_HE20_2G,
 			[NL80211_CHAN_WIDTH_40] = MODE_11AX_HE40_2G,
 			[NL80211_CHAN_WIDTH_80] = MODE_11AX_HE80_2G,
 			[NL80211_CHAN_WIDTH_80P80] = MODE_UNKNOWN,
 			[NL80211_CHAN_WIDTH_160] = MODE_UNKNOWN,
-		},
 	},
 	[NL80211_BAND_5GHZ] = {
-		{
-			[NL80211_CHAN_WIDTH_5] = MODE_UNKNOWN,
-			[NL80211_CHAN_WIDTH_10] = MODE_UNKNOWN,
-			[NL80211_CHAN_WIDTH_20_NOHT] = MODE_11A,
-			[NL80211_CHAN_WIDTH_20] = MODE_11AC_VHT20,
-			[NL80211_CHAN_WIDTH_40] = MODE_11AC_VHT40,
-			[NL80211_CHAN_WIDTH_80] = MODE_11AC_VHT80,
-			[NL80211_CHAN_WIDTH_160] = MODE_11AC_VHT160,
-			[NL80211_CHAN_WIDTH_80P80] = MODE_11AC_VHT80_80,
-		}, {
 			[NL80211_CHAN_WIDTH_5] = MODE_UNKNOWN,
 			[NL80211_CHAN_WIDTH_10] = MODE_UNKNOWN,
-			[NL80211_CHAN_WIDTH_20_NOHT] = MODE_11A,
+			[NL80211_CHAN_WIDTH_20_NOHT] = MODE_11AX_HE20,
 			[NL80211_CHAN_WIDTH_20] = MODE_11AX_HE20,
 			[NL80211_CHAN_WIDTH_40] = MODE_11AX_HE40,
 			[NL80211_CHAN_WIDTH_80] = MODE_11AX_HE80,
 			[NL80211_CHAN_WIDTH_160] = MODE_11AX_HE160,
 			[NL80211_CHAN_WIDTH_80P80] = MODE_11AX_HE80_80,
-		},
 	},
 };
 
@@ -4168,11 +4146,7 @@ static inline int ath11k_mac_vdev_setup_sync(struct ath11k *ar)
 	arg.channel.band_center_freq1 = chandef->center_freq1;
 	arg.channel.band_center_freq2 = chandef->center_freq2;
 	arg.channel.mode =
-		ath11k_phymodes[chandef->chan->band][he_support][chandef->width];
-	if (arg.channel.mode == MODE_11G &&
-	    chandef->chan->flags & IEEE80211_CHAN_NO_OFDM)
-		arg.channel.mode = MODE_11B;
-	WARN_ON(arg.channel.mode == MODE_UNKNOWN);
+		ath11k_phymodes[chandef->chan->band][chandef->width];
 
 	arg.channel.min_power = 0;
 	arg.channel.max_power = chandef->chan->max_power * 2;
-- 
1.9.1


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
