Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail27.static.mailgun.info ([104.130.122.27])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jgH65-00021A-A7
 for ath11k@lists.infradead.org; Wed, 03 Jun 2020 00:17:34 +0000
From: Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>
Subject: [PATCH v5 1/8] ath11k: add 6G frequency list supported by driver
Date: Tue,  2 Jun 2020 17:17:17 -0700
Message-Id: <20200603001724.12161-2-pradeepc@codeaurora.org>
In-Reply-To: <20200603001724.12161-1-pradeepc@codeaurora.org>
References: <20200603001724.12161-1-pradeepc@codeaurora.org>
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
Cc: Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>, linux-wireless@vger.kernel.org

This patch adds support for 6GHz frequency listing.

Signed-off-by: Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>
---
v5:
 - no change
v4:
 - no change
v3:
 - update channel starting frequency from 5945 to 5950 as per
   IEEE P802.11ax/D6.1

 drivers/net/wireless/ath/ath11k/mac.c | 71 +++++++++++++++++++++++++++
 1 file changed, 71 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 1729e96113ef..45ffe9543c63 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -33,6 +33,15 @@
 	.max_power              = 30, \
 }
 
+#define CHAN6G(_channel, _freq, _flags) { \
+	.band                   = NL80211_BAND_6GHZ, \
+	.hw_value               = (_channel), \
+	.center_freq            = (_freq), \
+	.flags                  = (_flags), \
+	.max_antenna_gain       = 0, \
+	.max_power              = 30, \
+}
+
 /* frame mode values are mapped as per enum ath11k_hw_txrx_mode */
 static unsigned int ath11k_frame_mode = ATH11K_HW_TXRX_NATIVE_WIFI;
 module_param_named(frame_mode, ath11k_frame_mode, uint, 0644);
@@ -86,6 +95,68 @@ static const struct ieee80211_channel ath11k_5ghz_channels[] = {
 	CHAN5G(173, 5865, 0),
 };
 
+static const struct ieee80211_channel ath11k_6ghz_channels[] = {
+	CHAN6G(1, 5955, 0),
+	CHAN6G(5, 5975, 0),
+	CHAN6G(9, 5995, 0),
+	CHAN6G(13, 6015, 0),
+	CHAN6G(17, 6035, 0),
+	CHAN6G(21, 6055, 0),
+	CHAN6G(25, 6075, 0),
+	CHAN6G(29, 6095, 0),
+	CHAN6G(33, 6115, 0),
+	CHAN6G(37, 6135, 0),
+	CHAN6G(41, 6155, 0),
+	CHAN6G(45, 6175, 0),
+	CHAN6G(49, 6195, 0),
+	CHAN6G(53, 6215, 0),
+	CHAN6G(57, 6235, 0),
+	CHAN6G(61, 6255, 0),
+	CHAN6G(65, 6275, 0),
+	CHAN6G(69, 6295, 0),
+	CHAN6G(73, 6315, 0),
+	CHAN6G(77, 6335, 0),
+	CHAN6G(81, 6355, 0),
+	CHAN6G(85, 6375, 0),
+	CHAN6G(89, 6395, 0),
+	CHAN6G(93, 6415, 0),
+	CHAN6G(97, 6435, 0),
+	CHAN6G(101, 6455, 0),
+	CHAN6G(105, 6475, 0),
+	CHAN6G(109, 6495, 0),
+	CHAN6G(113, 6515, 0),
+	CHAN6G(117, 6535, 0),
+	CHAN6G(121, 6555, 0),
+	CHAN6G(125, 6575, 0),
+	CHAN6G(129, 6595, 0),
+	CHAN6G(133, 6615, 0),
+	CHAN6G(137, 6635, 0),
+	CHAN6G(141, 6655, 0),
+	CHAN6G(145, 6675, 0),
+	CHAN6G(149, 6695, 0),
+	CHAN6G(153, 6715, 0),
+	CHAN6G(157, 6735, 0),
+	CHAN6G(161, 6755, 0),
+	CHAN6G(165, 6775, 0),
+	CHAN6G(169, 6795, 0),
+	CHAN6G(173, 6815, 0),
+	CHAN6G(177, 6835, 0),
+	CHAN6G(181, 6855, 0),
+	CHAN6G(185, 6875, 0),
+	CHAN6G(189, 6895, 0),
+	CHAN6G(193, 6915, 0),
+	CHAN6G(197, 6935, 0),
+	CHAN6G(201, 6955, 0),
+	CHAN6G(205, 6975, 0),
+	CHAN6G(209, 6995, 0),
+	CHAN6G(213, 7015, 0),
+	CHAN6G(217, 7035, 0),
+	CHAN6G(221, 7055, 0),
+	CHAN6G(225, 7075, 0),
+	CHAN6G(229, 7095, 0),
+	CHAN6G(233, 7115, 0),
+};
+
 static struct ieee80211_rate ath11k_legacy_rates[] = {
 	{ .bitrate = 10,
 	  .hw_value = ATH11K_HW_RATE_CCK_LP_1M },
-- 
2.17.1


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
