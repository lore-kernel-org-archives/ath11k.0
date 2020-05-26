Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jdiHQ-0006IA-Ka
 for ath11k@lists.infradead.org; Tue, 26 May 2020 22:42:44 +0000
From: Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>
Subject: [PATCH v3 4/9] ath11k: Use freq instead of channel number in rx path
Date: Tue, 26 May 2020 15:42:12 -0700
Message-Id: <20200526224217.11119-5-pradeepc@codeaurora.org>
In-Reply-To: <20200526224217.11119-1-pradeepc@codeaurora.org>
References: <20200526224217.11119-1-pradeepc@codeaurora.org>
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

As 6GHz cahnnel numbers overlap with those of 5GHz and 2GHz bands,
it is necessary to use frequency when determining the band info
in rx path.

Signed-off-by: Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/dp_rx.c | 6 +++++-
 drivers/net/wireless/ath/ath11k/wmi.c   | 5 ++++-
 drivers/net/wireless/ath/ath11k/wmi.h   | 2 ++
 3 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index a54610d75c40..c8f1ea69ea9d 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -2162,6 +2162,7 @@ static void ath11k_dp_rx_h_ppdu(struct ath11k *ar, struct hal_rx_desc *rx_desc,
 				struct ieee80211_rx_status *rx_status)
 {
 	u8 channel_num;
+	u32 center_freq;
 
 	rx_status->freq = 0;
 	rx_status->rate_idx = 0;
@@ -2172,8 +2173,11 @@ static void ath11k_dp_rx_h_ppdu(struct ath11k *ar, struct hal_rx_desc *rx_desc,
 	rx_status->flag |= RX_FLAG_NO_SIGNAL_VAL;
 
 	channel_num = ath11k_dp_rx_h_msdu_start_freq(rx_desc);
+	center_freq = ath11k_dp_rx_h_msdu_start_freq(rx_desc) >> 16;
 
-	if (channel_num >= 1 && channel_num <= 14) {
+	if (center_freq >= 5945 && center_freq <= 7115)
+		rx_status->band = NL80211_BAND_6GHZ;
+	else if (channel_num >= 1 && channel_num <= 14) {
 		rx_status->band = NL80211_BAND_2GHZ;
 	} else if (channel_num >= 36 && channel_num <= 173) {
 		rx_status->band = NL80211_BAND_5GHZ;
diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index 291fb274134f..500108fa59d9 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -3833,6 +3833,7 @@ static int ath11k_pull_mgmt_rx_params_tlv(struct ath11k_base *ab,
 	}
 
 	hdr->pdev_id =  ev->pdev_id;
+	hdr->chan_freq = ev->chan_freq;
 	hdr->channel =  ev->channel;
 	hdr->snr =  ev->snr;
 	hdr->rate =  ev->rate;
@@ -5204,7 +5205,9 @@ static void ath11k_mgmt_rx_event(struct ath11k_base *ab, struct sk_buff *skb)
 	if (rx_ev.status & WMI_RX_STATUS_ERR_MIC)
 		status->flag |= RX_FLAG_MMIC_ERROR;
 
-	if (rx_ev.channel >= 1 && rx_ev.channel <= 14) {
+	if (rx_ev.chan_freq >= ATH11K_MIN_6G_FREQ) {
+		status->band = NL80211_BAND_6GHZ;
+	} else if (rx_ev.channel >= 1 && rx_ev.channel <= 14) {
 		status->band = NL80211_BAND_2GHZ;
 	} else if (rx_ev.channel >= 36 && rx_ev.channel <= ATH11K_MAX_5G_CHAN) {
 		status->band = NL80211_BAND_5GHZ;
diff --git a/drivers/net/wireless/ath/ath11k/wmi.h b/drivers/net/wireless/ath/ath11k/wmi.h
index b9f3e559ced7..afa3c4cf90e9 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.h
+++ b/drivers/net/wireless/ath/ath11k/wmi.h
@@ -4228,6 +4228,7 @@ struct wmi_pdev_temperature_event {
 #define WLAN_MGMT_TXRX_HOST_MAX_ANTENNA 4
 
 struct mgmt_rx_event_params {
+	u32 chan_freq;
 	u32 channel;
 	u32 snr;
 	u8 rssi_ctl[WLAN_MGMT_TXRX_HOST_MAX_ANTENNA];
@@ -4257,6 +4258,7 @@ struct wmi_mgmt_rx_hdr {
 	u32 rx_tsf_l32;
 	u32 rx_tsf_u32;
 	u32 pdev_id;
+	u32 chan_freq;
 } __packed;
 
 #define MAX_ANTENNA_EIGHT 8
-- 
2.17.1


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
