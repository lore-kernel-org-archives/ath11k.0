Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hQPrk-00057p-Vd
 for ath11k@lists.infradead.org; Tue, 14 May 2019 05:20:43 +0000
Received: from x230.adurom.net (88-114-240-156.elisa-laajakaista.fi
 [88.114.240.156])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: kvalo@smtp.codeaurora.org)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id B054960364
 for <ath11k@lists.infradead.org>; Tue, 14 May 2019 05:20:39 +0000 (UTC)
From: Kalle Valo <kvalo@codeaurora.org>
Subject: [PATCH 3/3] ath11k: workaround GCC unitialised warnings
Date: Tue, 14 May 2019 08:20:34 +0300
Message-Id: <1557811234-5439-3-git-send-email-kvalo@codeaurora.org>
In-Reply-To: <1557811234-5439-1-git-send-email-kvalo@codeaurora.org>
References: <1557811234-5439-1-git-send-email-kvalo@codeaurora.org>
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

After making some WMI functions static GCC started to warn quite a lot about
uninitalised variables:

ath11k/wmi.c:5303:3: warning: 'install_key_compl.status' may be used uninitialized in this function [-Wmaybe-uninitialized]

From a quick look they look like false warnings but let's initialise the
variables anyway to make the warning go away.

Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/wmi.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index 7ca0a64befb4..9a0b904a16ff 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -4805,7 +4805,7 @@ static void ath11k_bcn_tx_status_event(struct ath11k_base *ab, u8 *evt_buf, u32
 static void ath11k_vdev_stopped_event(struct ath11k_base *ab, u8 *evt_buf, u32 len)
 {
 	struct ath11k *ar;
-	u32 vdev_id;
+	u32 vdev_id = 0;
 
 	if (ath11k_pull_vdev_stopped_param_tlv(ab, evt_buf, len,
 					       &vdev_id) != 0) {
@@ -4831,7 +4831,7 @@ static void ath11k_vdev_stopped_event(struct ath11k_base *ab, u8 *evt_buf, u32 l
 
 static void ath11k_mgmt_rx_event(struct ath11k_base *ab, struct sk_buff *skb)
 {
-	struct mgmt_rx_event_params rx_ev;
+	struct mgmt_rx_event_params rx_ev = {0};
 	struct ath11k *ar;
 	struct ieee80211_rx_status *status = IEEE80211_SKB_RXCB(skb);
 	struct ieee80211_hdr *hdr;
@@ -4940,7 +4940,7 @@ static void ath11k_mgmt_rx_event(struct ath11k_base *ab, struct sk_buff *skb)
 
 static void ath11k_mgmt_tx_compl_event(struct ath11k_base *ab, struct sk_buff *skb)
 {
-	struct wmi_mgmt_tx_compl_event tx_compl_param;
+	struct wmi_mgmt_tx_compl_event tx_compl_param = {0};
 	struct ath11k *ar;
 
 	if (ath11k_pull_mgmt_tx_compl_param_tlv(ab, skb->data, skb->len,
@@ -4972,7 +4972,7 @@ static void ath11k_mgmt_tx_compl_event(struct ath11k_base *ab, struct sk_buff *s
 static void ath11k_scan_event(struct ath11k_base *ab, u8 *evt_buf, u32 len)
 {
 	struct ath11k *ar;
-	struct wmi_scan_event scan_ev;
+	struct wmi_scan_event scan_ev = {0};
 
 	if (ath11k_pull_scan_ev(ab, evt_buf, len,
 				&scan_ev) != 0) {
@@ -5079,7 +5079,7 @@ static void ath11k_peer_sta_kickout_event(struct ath11k_base *ab, u8 *evt_buf, u
 
 static void ath11k_roam_event(struct ath11k_base *ab, u8 *evt_buf, u32 len)
 {
-	struct wmi_roam_event roam_ev;
+	struct wmi_roam_event roam_ev = {};
 	struct ath11k *ar;
 
 	if (ath11k_pull_roam_ev(ab, evt_buf, len, &roam_ev) != 0) {
@@ -5125,7 +5125,7 @@ static void ath11k_roam_event(struct ath11k_base *ab, u8 *evt_buf, u32 len)
 
 static void ath11k_chan_info_event(struct ath11k_base *ab, u8 *evt_buf, u32 len)
 {
-	struct wmi_chan_info_event ch_info_ev;
+	struct wmi_chan_info_event ch_info_ev = {0};
 	struct ath11k *ar;
 	struct survey_info *survey;
 	int idx;
@@ -5199,7 +5199,7 @@ static void ath11k_chan_info_event(struct ath11k_base *ab, u8 *evt_buf, u32 len)
 static void ath11k_pdev_bss_chan_info_event(struct ath11k_base *ab, u8 *evt_buf,
 				     u32 len)
 {
-	struct wmi_pdev_bss_chan_info_event bss_ch_info_ev;
+	struct wmi_pdev_bss_chan_info_event bss_ch_info_ev = {};
 	struct survey_info *survey;
 	struct ath11k *ar;
 	u32 cc_freq_hz = ab->cc_freq_hz;
@@ -5273,7 +5273,7 @@ static void ath11k_pdev_bss_chan_info_event(struct ath11k_base *ab, u8 *evt_buf,
 static void ath11k_vdev_install_key_compl_event(struct ath11k_base *ab, u8 *evt_buf,
 						u32 len)
 {
-	struct wmi_vdev_install_key_complete_arg install_key_compl;
+	struct wmi_vdev_install_key_complete_arg install_key_compl = {0};
 	struct ath11k *ar;
 
 	if (ath11k_pull_vdev_install_key_compl_ev(ab, evt_buf, len,
@@ -5347,7 +5347,7 @@ static void ath11k_service_available_event(struct ath11k_base *ab, u8 *evt_buf,
 
 static void ath11k_peer_assoc_conf_event(struct ath11k_base *ab, u8 *evt_buf, u32 len)
 {
-	struct wmi_peer_assoc_conf_arg peer_assoc_conf;
+	struct wmi_peer_assoc_conf_arg peer_assoc_conf = {0};
 	struct ath11k *ar;
 
 	if (ath11k_pull_peer_assoc_conf_ev(ab, evt_buf, len,
-- 
2.7.4


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
