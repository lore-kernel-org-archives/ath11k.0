Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hfNTv-000520-VG
 for ath11k@lists.infradead.org; Mon, 24 Jun 2019 11:49:57 +0000
From: Manikanta Pubbisetty <mpubbise@codeaurora.org>
Subject: [PATCH 3/8] ath11k: move ath11k_smps_map[] to the beginning of the
 file
Date: Mon, 24 Jun 2019 17:19:24 +0530
Message-Id: <1561376969-3999-3-git-send-email-mpubbise@codeaurora.org>
In-Reply-To: <1561376969-3999-1-git-send-email-mpubbise@codeaurora.org>
References: <1561376969-3999-1-git-send-email-mpubbise@codeaurora.org>
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
Cc: Manikanta Pubbisetty <mpubbise@codeaurora.org>

move ath11k_smps_map[] to the beginning of the file in mac.c .

Signed-off-by: Manikanta Pubbisetty <mpubbise@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/mac.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index e3bca88..6c1b331 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -167,6 +167,13 @@ const struct htt_rx_ring_tlv_filter ath11k_mac_mon_status_filter_default = {
 #define ath11k_a_rates (ath11k_legacy_rates + 4)
 #define ath11k_a_rates_size (ARRAY_SIZE(ath11k_legacy_rates) - 4)
 
+static const u32 ath11k_smps_map[] = {
+	[WLAN_HT_CAP_SM_PS_STATIC] = WMI_PEER_SMPS_STATIC,
+	[WLAN_HT_CAP_SM_PS_DYNAMIC] = WMI_PEER_SMPS_DYNAMIC,
+	[WLAN_HT_CAP_SM_PS_INVALID] = WMI_PEER_SMPS_PS_NONE,
+	[WLAN_HT_CAP_SM_PS_DISABLED] = WMI_PEER_SMPS_PS_NONE,
+};
+
 int ath11k_mac_hw_ratecode_to_legacy_rate(u8 hw_rc, u8 preamble, u8 *rateidx,
 					  u16 *rate)
 {
@@ -1503,13 +1510,6 @@ static void ath11k_peer_assoc_prepare(struct ath11k *ar,
 	/* TODO: amsdu_disable req? */
 }
 
-static const u32 ath11k_smps_map[] = {
-	[WLAN_HT_CAP_SM_PS_STATIC] = WMI_PEER_SMPS_STATIC,
-	[WLAN_HT_CAP_SM_PS_DYNAMIC] = WMI_PEER_SMPS_DYNAMIC,
-	[WLAN_HT_CAP_SM_PS_INVALID] = WMI_PEER_SMPS_PS_NONE,
-	[WLAN_HT_CAP_SM_PS_DISABLED] = WMI_PEER_SMPS_PS_NONE,
-};
-
 static int ath11k_setup_peer_smps(struct ath11k *ar, struct ath11k_vif *arvif,
 				  const u8 *addr,
 				  const struct ieee80211_sta_ht_cap *ht_cap)
-- 
2.7.4


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
