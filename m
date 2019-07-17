Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hnctH-00047v-6m
 for ath11k@lists.infradead.org; Wed, 17 Jul 2019 05:54:12 +0000
From: Sathishkumar Muruganandam <murugana@codeaurora.org>
Subject: [PATCH] ath11k: Fix wrong phy_mode in mgmt_rx_event_params
Date: Wed, 17 Jul 2019 11:24:00 +0530
Message-Id: <1563342840-5278-1-git-send-email-murugana@codeaurora.org>
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
Cc: Sathishkumar Muruganandam <murugana@codeaurora.org>

Changed the wrong phy_mode parsing in mgmt_rx_event_params and removed
unused wlan_phymode enum.

Signed-off-by: Sathishkumar Muruganandam <murugana@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/wmi.c |  3 +--
 drivers/net/wireless/ath/ath11k/wmi.h | 24 +-----------------------
 2 files changed, 2 insertions(+), 25 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index 1d6a36a2323f..6069750f6a81 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -4757,8 +4757,7 @@ static void ath11k_mgmt_rx_event(struct ath11k_base *ab, struct sk_buff *skb)
 		goto exit;
 	}
 
-	if (rx_ev.phy_mode == WLAN_PHYMODE_11B &&
-	    status->band == NL80211_BAND_5GHZ)
+	if (rx_ev.phy_mode == MODE_11B && status->band == NL80211_BAND_5GHZ)
 		ath11k_dbg(ab, ATH11K_DBG_WMI,
 			   "wmi mgmt rx 11b (CCK) on 5GHz\n");
 
diff --git a/drivers/net/wireless/ath/ath11k/wmi.h b/drivers/net/wireless/ath/ath11k/wmi.h
index e7799c2ad1db..933cf3c080b6 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.h
+++ b/drivers/net/wireless/ath/ath11k/wmi.h
@@ -4089,28 +4089,6 @@ struct wmi_pdev_radar_ev {
 	s32 sidx;
 } __packed;
 
-enum wlan_phymode {
-	WLAN_PHYMODE_AUTO             = 0,
-	WLAN_PHYMODE_11A              = 1,
-	WLAN_PHYMODE_11B              = 2,
-	WLAN_PHYMODE_11G              = 3,
-	WLAN_PHYMODE_11NA_HT20        = 4,
-	WLAN_PHYMODE_11NG_HT20        = 5,
-	WLAN_PHYMODE_11NA_HT40PLUS    = 6,
-	WLAN_PHYMODE_11NA_HT40MINUS   = 7,
-	WLAN_PHYMODE_11NG_HT40PLUS    = 8,
-	WLAN_PHYMODE_11NG_HT40MINUS   = 9,
-	WLAN_PHYMODE_11NG_HT40        = 10,
-	WLAN_PHYMODE_11NA_HT40        = 11,
-	WLAN_PHYMODE_11AC_VHT20       = 12,
-	WLAN_PHYMODE_11AC_VHT40PLUS   = 13,
-	WLAN_PHYMODE_11AC_VHT40MINUS  = 14,
-	WLAN_PHYMODE_11AC_VHT40       = 15,
-	WLAN_PHYMODE_11AC_VHT80       = 16,
-	WLAN_PHYMODE_11AC_VHT160      = 17,
-	WLAN_PHYMODE_11AC_VHT80_80    = 18,
-};
-
 #define WMI_RX_STATUS_OK			0x00
 #define WMI_RX_STATUS_ERR_CRC			0x01
 #define WMI_RX_STATUS_ERR_DECRYPT		0x08
@@ -4124,7 +4102,7 @@ struct mgmt_rx_event_params {
 	u32 snr;
 	u8 rssi_ctl[WLAN_MGMT_TXRX_HOST_MAX_ANTENNA];
 	u32 rate;
-	enum wlan_phymode phy_mode;
+	enum wmi_phy_mode phy_mode;
 	u32 buf_len;
 	int status;
 	u32 flags;
-- 
2.7.4


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
