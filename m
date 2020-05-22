Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail27.static.mailgun.info ([104.130.122.27])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jc2F5-0005B0-0z
 for ath11k@lists.infradead.org; Fri, 22 May 2020 07:37:20 +0000
From: Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>
Subject: [PATCH v2 2/9] ath11k: add 6G frequency list supported by driver
Date: Fri, 22 May 2020 00:24:24 -0700
Message-Id: <20200522072431.27601-3-pradeepc@codeaurora.org>
In-Reply-To: <20200522072431.27601-1-pradeepc@codeaurora.org>
References: <20200522072431.27601-1-pradeepc@codeaurora.org>
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
To: Johannes Berg <johannes@sipsolutions.net>, ath11k@lists.infradead.org
Cc: Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>, linux-wireless@vger.kernel.org

This patch adds support for 6GHz frequency listing.

Signed-off-by: Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/mac.c | 71 +++++++++++++++++++++++++++
 1 file changed, 71 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 36882562b976..f699e882949b 100644
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
+	CHAN6G(1, 5945, 0),
+	CHAN6G(5, 5965, 0),
+	CHAN6G(9, 5985, 0),
+	CHAN6G(13, 6005, 0),
+	CHAN6G(17, 6025, 0),
+	CHAN6G(21, 6045, 0),
+	CHAN6G(25, 6065, 0),
+	CHAN6G(29, 6085, 0),
+	CHAN6G(33, 6105, 0),
+	CHAN6G(37, 6125, 0),
+	CHAN6G(41, 6145, 0),
+	CHAN6G(45, 6165, 0),
+	CHAN6G(49, 6185, 0),
+	CHAN6G(53, 6205, 0),
+	CHAN6G(57, 6225, 0),
+	CHAN6G(61, 6245, 0),
+	CHAN6G(65, 6265, 0),
+	CHAN6G(69, 6285, 0),
+	CHAN6G(73, 6305, 0),
+	CHAN6G(77, 6325, 0),
+	CHAN6G(81, 6345, 0),
+	CHAN6G(85, 6365, 0),
+	CHAN6G(89, 6385, 0),
+	CHAN6G(93, 6405, 0),
+	CHAN6G(97, 6425, 0),
+	CHAN6G(101, 6445, 0),
+	CHAN6G(105, 6465, 0),
+	CHAN6G(109, 6485, 0),
+	CHAN6G(113, 6505, 0),
+	CHAN6G(117, 6525, 0),
+	CHAN6G(121, 6545, 0),
+	CHAN6G(125, 6565, 0),
+	CHAN6G(129, 6585, 0),
+	CHAN6G(133, 6605, 0),
+	CHAN6G(137, 6625, 0),
+	CHAN6G(141, 6645, 0),
+	CHAN6G(145, 6665, 0),
+	CHAN6G(149, 6685, 0),
+	CHAN6G(153, 6705, 0),
+	CHAN6G(157, 6725, 0),
+	CHAN6G(161, 6745, 0),
+	CHAN6G(165, 6765, 0),
+	CHAN6G(169, 6785, 0),
+	CHAN6G(173, 6805, 0),
+	CHAN6G(177, 6825, 0),
+	CHAN6G(181, 6845, 0),
+	CHAN6G(185, 6865, 0),
+	CHAN6G(189, 6885, 0),
+	CHAN6G(193, 6905, 0),
+	CHAN6G(197, 6925, 0),
+	CHAN6G(201, 6945, 0),
+	CHAN6G(205, 6965, 0),
+	CHAN6G(209, 6985, 0),
+	CHAN6G(213, 7005, 0),
+	CHAN6G(217, 7025, 0),
+	CHAN6G(221, 7045, 0),
+	CHAN6G(225, 7065, 0),
+	CHAN6G(229, 7085, 0),
+	CHAN6G(233, 7105, 0),
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
