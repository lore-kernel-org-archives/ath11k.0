Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from a27-185.smtp-out.us-west-2.amazonses.com ([54.240.27.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iZHLc-0006pp-99
 for ath11k@lists.infradead.org; Mon, 25 Nov 2019 16:36:26 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: [PATCH 4/8] ath11k: fix missed bw conversion in tx completion
Date: Mon, 25 Nov 2019 16:36:22 +0000
Message-ID: <0101016ea36bd186-58d91e19-0aaa-484f-aa0c-959488bb5812-000000@us-west-2.amazonses.com>
In-Reply-To: <1574699772-17938-1-git-send-email-kvalo@codeaurora.org>
References: <1574699772-17938-1-git-send-email-kvalo@codeaurora.org>
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
To: linux-wireless@vger.kernel.org
Cc: ath11k@lists.infradead.org

From: Tamizh chelvam <tamizhr@codeaurora.org>

TX rate stats for the retried packets for a station comes through
tx completion events. Assigning hw reported bandwidth information
directly to station's txrate bandwidth will cause below warning.
Fix this warning by converting the hw reported bandwidth to
mac80211 base bandwidth.

[ 134.758190] PC is at cfg80211_calculate_bitrate+0x1bc/0x214 [cfg80211]
[ 134.765730] LR is at cfg80211_calculate_bitrate+0x1bc/0x214 [cfg80211]
[ 134.875014] [<ffffffbffca8d708>] cfg80211_calculate_bitrate+0x1bc/0x214 [cfg80211]
[ 134.877192] [<ffffffbffcaa9704>] nl80211_put_sta_rate+0x54/0xf24 [cfg80211]
[ 134.884829] [<ffffffbffcaa9d48>] nl80211_put_sta_rate+0x698/0xf24 [cfg80211]
[ 134.891687] [<ffffffbffcaaa490>] nl80211_put_sta_rate+0xde0/0xf24 [cfg80211]
[ 134.898975] [<ffffffc0004de748>] genl_lock_dumpit+0x30/0x4c
[ 134.905998] [<ffffffc0004dc264>] netlink_dump+0xf4/0x248
[ 134.911291] [<ffffffc0004dc910>] __netlink_dump_start+0xe0/0x174
[ 134.916850] [<ffffffc0004df114>] genl_family_rcv_msg+0x130/0x2c0

Signed-off-by: Tamizh chelvam <tamizhr@codeaurora.org>
Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/debugfs_sta.c |  2 +-
 drivers/net/wireless/ath/ath11k/dp_rx.c       | 30 ++++-----------------------
 drivers/net/wireless/ath/ath11k/mac.c         | 22 ++++++++++++++++++++
 drivers/net/wireless/ath/ath11k/mac.h         |  1 +
 4 files changed, 28 insertions(+), 27 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/debugfs_sta.c b/drivers/net/wireless/ath/ath11k/debugfs_sta.c
index b392117eff3c..3c5f931e22a9 100644
--- a/drivers/net/wireless/ath/ath11k/debugfs_sta.c
+++ b/drivers/net/wireless/ath/ath11k/debugfs_sta.c
@@ -192,7 +192,7 @@ void ath11k_update_per_peer_stats_from_txcompl(struct ath11k *ar,
 	}
 
 	arsta->txrate.nss = arsta->last_txrate.nss;
-	arsta->txrate.bw = ts->bw;
+	arsta->txrate.bw = ath11k_mac_bw_to_mac80211_bw(ts->bw);
 
 	ath11k_accumulate_per_peer_tx_stats(arsta, peer_stats, rate_idx);
 	spin_unlock_bh(&ab->base_lock);
diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index d5963509419b..0ff0ff81adeb 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -987,28 +987,6 @@ int ath11k_dp_htt_tlv_iter(struct ath11k_base *ab, const void *ptr, size_t len,
 	return 0;
 }
 
-static u8 ath11k_bw_to_mac80211_bw(u8 bw)
-{
-	u8 ret = 0;
-
-	switch (bw) {
-	case ATH11K_BW_20:
-		ret = RATE_INFO_BW_20;
-		break;
-	case ATH11K_BW_40:
-		ret = RATE_INFO_BW_40;
-		break;
-	case ATH11K_BW_80:
-		ret = RATE_INFO_BW_80;
-		break;
-	case ATH11K_BW_160:
-		ret = RATE_INFO_BW_160;
-		break;
-	}
-
-	return ret;
-}
-
 static u32 ath11k_bw_to_mac80211_bwflags(u8 bw)
 {
 	u32 bwflags = 0;
@@ -1157,7 +1135,7 @@ ath11k_update_per_peer_tx_stats(struct ath11k *ar,
 	}
 
 	arsta->txrate.nss = nss;
-	arsta->txrate.bw = ath11k_bw_to_mac80211_bw(bw);
+	arsta->txrate.bw = ath11k_mac_bw_to_mac80211_bw(bw);
 	arsta->tx_info.status.rates[0].flags |= ath11k_bw_to_mac80211_bwflags(bw);
 
 	memcpy(&arsta->last_txrate, &arsta->txrate, sizeof(struct rate_info));
@@ -1934,7 +1912,7 @@ static void ath11k_dp_rx_h_rate(struct ath11k *ar, struct hal_rx_desc *rx_desc,
 		rx_status->rate_idx = rate_mcs + (8 * (nss - 1));
 		if (sgi)
 			rx_status->enc_flags |= RX_ENC_FLAG_SHORT_GI;
-		rx_status->bw = ath11k_bw_to_mac80211_bw(bw);
+		rx_status->bw = ath11k_mac_bw_to_mac80211_bw(bw);
 		break;
 	case RX_MSDU_START_PKT_TYPE_11AC:
 		rx_status->encoding = RX_ENC_VHT;
@@ -1948,7 +1926,7 @@ static void ath11k_dp_rx_h_rate(struct ath11k *ar, struct hal_rx_desc *rx_desc,
 		rx_status->nss = nss;
 		if (sgi)
 			rx_status->enc_flags |= RX_ENC_FLAG_SHORT_GI;
-		rx_status->bw = ath11k_bw_to_mac80211_bw(bw);
+		rx_status->bw = ath11k_mac_bw_to_mac80211_bw(bw);
 		break;
 	case RX_MSDU_START_PKT_TYPE_11AX:
 		rx_status->rate_idx = rate_mcs;
@@ -1960,7 +1938,7 @@ static void ath11k_dp_rx_h_rate(struct ath11k *ar, struct hal_rx_desc *rx_desc,
 		}
 		rx_status->encoding = RX_ENC_HE;
 		rx_status->nss = nss;
-		rx_status->bw = ath11k_bw_to_mac80211_bw(bw);
+		rx_status->bw = ath11k_mac_bw_to_mac80211_bw(bw);
 		break;
 	}
 }
diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index cb025a4a5785..939f5880bce6 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -156,6 +156,28 @@ static const u32 ath11k_smps_map[] = {
 	[WLAN_HT_CAP_SM_PS_DISABLED] = WMI_PEER_SMPS_PS_NONE,
 };
 
+u8 ath11k_mac_bw_to_mac80211_bw(u8 bw)
+{
+	u8 ret = 0;
+
+	switch (bw) {
+	case ATH11K_BW_20:
+		ret = RATE_INFO_BW_20;
+		break;
+	case ATH11K_BW_40:
+		ret = RATE_INFO_BW_40;
+		break;
+	case ATH11K_BW_80:
+		ret = RATE_INFO_BW_80;
+		break;
+	case ATH11K_BW_160:
+		ret = RATE_INFO_BW_160;
+		break;
+	}
+
+	return ret;
+}
+
 int ath11k_mac_hw_ratecode_to_legacy_rate(u8 hw_rc, u8 preamble, u8 *rateidx,
 					  u16 *rate)
 {
diff --git a/drivers/net/wireless/ath/ath11k/mac.h b/drivers/net/wireless/ath/ath11k/mac.h
index f84af1fc4952..8c37573ae5dc 100644
--- a/drivers/net/wireless/ath/ath11k/mac.h
+++ b/drivers/net/wireless/ath/ath11k/mac.h
@@ -142,4 +142,5 @@ struct ath11k *ath11k_mac_get_ar_vdev_stop_status(struct ath11k_base *ab,
 void ath11k_mac_drain_tx(struct ath11k *ar);
 void ath11k_mac_peer_cleanup_all(struct ath11k *ar);
 int ath11k_mac_tx_mgmt_pending_free(int buf_id, void *skb, void *ctx);
+u8 ath11k_mac_bw_to_mac80211_bw(u8 bw);
 #endif
-- 
2.7.4


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
