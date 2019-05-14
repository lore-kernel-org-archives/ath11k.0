Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hQPG7-0001BN-Af
 for ath11k@lists.infradead.org; Tue, 14 May 2019 04:41:48 +0000
From: Sriram R <srirrama@codeaurora.org>
Subject: [PATCH 1/3] ath11k: Process radar detected event
Date: Tue, 14 May 2019 10:11:17 +0530
Message-Id: <1557808879-26933-2-git-send-email-srirrama@codeaurora.org>
In-Reply-To: <1557808879-26933-1-git-send-email-srirrama@codeaurora.org>
References: <1557808879-26933-1-git-send-email-srirrama@codeaurora.org>
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
Cc: Sriram R <srirrama@codeaurora.org>

Add support for processing radar detected event
coming from the firmware. The detected radar
is indicated to mac80211 after checking the
validity of detection.

Signed-off-by: Sriram R <srirrama@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/wmi.c | 56 +++++++++++++++++++++++++++++++++++
 drivers/net/wireless/ath/ath11k/wmi.h | 13 ++++++++
 2 files changed, 69 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index 5712ac0..434508f 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -5770,6 +5770,59 @@ ath11k_wmi_pdev_csa_switch_count_status_event(struct ath11k_base *ab,
 	kfree(tb);
 }
 
+static void
+ath11k_wmi_pdev_dfs_radar_detected_event(struct ath11k_base *ab,
+					 u8 *evt_buf,
+					 u32 len)
+{
+	const void **tb;
+	const struct wmi_pdev_radar_ev *ev;
+	struct ath11k *ar;
+	int ret;
+
+	tb = ath11k_wmi_tlv_parse_alloc(ab, evt_buf, len, GFP_ATOMIC);
+	if (IS_ERR(tb)) {
+		ret = PTR_ERR(tb);
+		ath11k_warn(ab, "failed to parse tlv: %d\n", ret);
+		return;
+	}
+
+	ev = tb[WMI_TAG_PDEV_DFS_RADAR_DETECTION_EVENT];
+
+	if (!ev) {
+		ath11k_warn(ab, "failed to fetch pdev dfs radar detected ev");
+		kfree(tb);
+		return;
+	}
+
+	ath11k_dbg(ab, ATH11K_DBG_WMI,
+		   "pdev dfs radar detected on pdev %d, detection mode %d, chan freq %d, chan_width %d, detector id %d, seg id %d, timestamp %d, chirp %d, freq offset %d, sidx %d",
+		   ev->pdev_id, ev->detection_mode, ev->chan_freq, ev->chan_width,
+		   ev->detector_id, ev->segment_id, ev->timestamp, ev->is_chirp,
+		   ev->freq_offset, ev->sidx);
+
+	ar = ath11k_get_ar_by_pdev_id(ab, ev->pdev_id);
+
+	if (!ar) {
+		ath11k_warn(ab, "radar detected in invalid pdev %d\n",
+			    ev->pdev_id);
+		goto exit;
+	}
+
+	if (ar->rx_channel && ar->rx_channel->center_freq != (ev->chan_freq
+	    - ev->freq_offset)) {
+		ath11k_warn(ab, "Radar detected in non-operating channel");
+		goto exit;
+	}
+
+	ath11k_dbg(ar->ab, ATH11K_DBG_REG, "Radar Detected in pdev %d\n",
+		   ev->pdev_id);
+
+	ieee80211_radar_detected(ar->hw);
+
+exit:
+	kfree(tb);
+}
 static void ath11k_wmi_tlv_op_rx(struct ath11k_base *ab, struct sk_buff *skb)
 {
 	struct wmi_cmd_hdr *cmd_hdr;
@@ -5858,6 +5911,9 @@ static void ath11k_wmi_tlv_op_rx(struct ath11k_base *ab, struct sk_buff *skb)
 		ath11k_dbg(ab, ATH11K_DBG_WMI,
 			   "ignoring unsupported event 0x%x\n", id);
 		break;
+	case WMI_PDEV_DFS_RADAR_DETECTION_EVENTID:
+		ath11k_wmi_pdev_dfs_radar_detected_event(ab, data, len);
+		break;
 	/* TODO: Add remaining events */
 	default:
 		ath11k_warn(ab, "Unknown eventid: 0x%x\n", id);
diff --git a/drivers/net/wireless/ath/ath11k/wmi.h b/drivers/net/wireless/ath/ath11k/wmi.h
index 5d20f57..d640cdf 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.h
+++ b/drivers/net/wireless/ath/ath11k/wmi.h
@@ -4557,6 +4557,19 @@ struct wmi_pdev_csa_switch_ev {
 	u32 num_vdevs;
 } __packed;
 
+struct wmi_pdev_radar_ev {
+	u32 pdev_id;
+	u32 detection_mode;
+	u32 chan_freq;
+	u32 chan_width;
+	u32 detector_id;
+	u32 segment_id;
+	u32 timestamp;
+	u32 is_chirp;
+	s32 freq_offset;
+	s32 sidx;
+} __packed;
+
 enum wlan_phymode {
 	WLAN_PHYMODE_AUTO             = 0,
 	WLAN_PHYMODE_11A              = 1,
-- 
2.7.4


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
