Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from nbd.name ([2a01:4f8:221:3d45::2])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hVVuD-0001t7-LW
 for ath11k@lists.infradead.org; Tue, 28 May 2019 06:48:20 +0000
From: John Crispin <john@phrozen.org>
Subject: [PATCH V6 09/11] ath11k: add sta_statistics callback
Date: Tue, 28 May 2019 08:48:01 +0200
Message-Id: <20190528064803.24419-10-john@phrozen.org>
In-Reply-To: <20190528064803.24419-1-john@phrozen.org>
References: <20190528064803.24419-1-john@phrozen.org>
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

Add the callback allowing us to pass the rates to userland for iw tool
to display.

Signed-off-by: Shashidhar Lakkavalli <slakkavalli@datto.com>
Signed-off-by: John Crispin <john@phrozen.org>
---
 drivers/net/wireless/ath/ath11k/mac.c | 28 +++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 68bfd46a9776..06fc62307f4e 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -5002,6 +5002,33 @@ static int ath11k_get_survey(struct ieee80211_hw *hw, int idx,
 	return ret;
 }
 
+static void ath11k_sta_statistics(struct ieee80211_hw *hw,
+				  struct ieee80211_vif *vif,
+				  struct ieee80211_sta *sta,
+				  struct station_info *sinfo)
+{
+	struct ath11k_sta *arsta = (struct ath11k_sta *)sta->drv_priv;
+
+	sinfo->rx_duration = arsta->rx_duration;
+	sinfo->filled |= BIT_ULL(NL80211_STA_INFO_RX_DURATION);
+
+	if (!arsta->txrate.legacy && !arsta->txrate.nss)
+		return;
+
+	if (arsta->txrate.legacy) {
+		sinfo->txrate.legacy = arsta->txrate.legacy;
+	} else {
+		sinfo->txrate.mcs = arsta->txrate.mcs;
+		sinfo->txrate.nss = arsta->txrate.nss;
+		sinfo->txrate.bw = arsta->txrate.bw;
+		sinfo->txrate.he_gi = arsta->txrate.he_gi;
+		sinfo->txrate.he_dcm = arsta->txrate.he_dcm;
+		sinfo->txrate.he_ru_alloc = arsta->txrate.he_ru_alloc;
+	}
+	sinfo->txrate.flags = arsta->txrate.flags;
+	sinfo->filled |= BIT_ULL(NL80211_STA_INFO_TX_BITRATE);
+}
+
 static const struct ieee80211_ops ath11k_ops = {
 	.tx				= ath11k_mac_op_tx,
 	.start                          = ath11k_start,
@@ -5032,6 +5059,7 @@ static const struct ieee80211_ops ath11k_ops = {
 	.set_bitrate_mask		= ath11k_mac_op_set_bitrate_mask,
 	.get_survey			= ath11k_get_survey,
 	.flush				= ath11k_flush,
+	.sta_statistics			= ath11k_sta_statistics,
 	CFG80211_TESTMODE_CMD(ath11k_tm_cmd)
 #ifdef CONFIG_MAC80211_DEBUGFS
 	.sta_add_debugfs		= ath11k_sta_add_debugfs,
-- 
2.20.1


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
