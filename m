Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from nbd.name ([2a01:4f8:221:3d45::2])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ihDhM-0002Db-6U
 for ath11k@lists.infradead.org; Tue, 17 Dec 2019 14:19:43 +0000
From: John Crispin <john@phrozen.org>
Subject: [PATCH V3 3/4] ath11k: add WMI calls required for handling BSS color
Date: Tue, 17 Dec 2019 15:19:20 +0100
Message-Id: <20191217141921.8114-3-john@phrozen.org>
In-Reply-To: <20191217141921.8114-1-john@phrozen.org>
References: <20191217141921.8114-1-john@phrozen.org>
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
To: Johannes Berg <johannes@sipsolutions.net>, Kalle Valo <kvalo@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org, John Crispin <john@phrozen.org>

If the he_operation field of the beacon sets a BSS color, we need to inform
the FW of the settings. This patch adds the WMI command handlers required
to do so.

Signed-off-by: John Crispin <john@phrozen.org>
---
Changes in V2
* add WMI debug log

 drivers/net/wireless/ath/ath11k/wmi.c | 77 +++++++++++++++++++++++++++
 drivers/net/wireless/ath/ath11k/wmi.h | 31 +++++++++++
 2 files changed, 108 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index 5b3dc9e4c6c1..ba2cc6fac809 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -2790,6 +2790,83 @@ ath11k_wmi_send_obss_spr_cmd(struct ath11k *ar, u32 vdev_id,
 	return ret;
 }
 
+int
+ath11k_wmi_send_obss_color_collision_cfg_cmd(struct ath11k *ar, u32 vdev_id,
+					     u8 bss_color, u32 period,
+					     bool enable)
+{
+	struct ath11k_pdev_wmi *wmi = ar->wmi;
+	struct ath11k_base *ab = wmi->wmi_ab->ab;
+	struct wmi_obss_color_collision_cfg_params_cmd *cmd;
+	struct sk_buff *skb;
+	int ret, len;
+
+	len = sizeof(*cmd);
+
+	skb = ath11k_wmi_alloc_skb(wmi->wmi_ab, len);
+	if (!skb)
+		return -ENOMEM;
+
+	cmd = (struct wmi_obss_color_collision_cfg_params_cmd *)skb->data;
+	cmd->tlv_header = FIELD_PREP(WMI_TLV_TAG, WMI_TAG_OBSS_COLOR_COLLISION_DET_CONFIG) |
+			  FIELD_PREP(WMI_TLV_LEN, len - TLV_HDR_SIZE);
+	cmd->vdev_id = vdev_id;
+	cmd->evt_type = enable ? ATH11K_OBSS_COLOR_COLLISION_DETECTION :
+				 ATH11K_OBSS_COLOR_COLLISION_DETECTION_DISABLE;
+	cmd->current_bss_color = bss_color;
+	cmd->detection_period_ms = period;
+	cmd->scan_period_ms = ATH11K_BSS_COLOR_COLLISION_SCAN_PERIOD_MS;
+	cmd->free_slot_expiry_time_ms = 0;
+	cmd->flags = 0;
+
+	ath11k_dbg(ar->ab, ATH11K_DBG_WMI,
+		   "wmi_send_obss_color_collision_cfg id %d type %d "
+		   "bss_color %d detect_period %d scan_period %d\n",
+		   cmd->vdev_id, cmd->evt_type, cmd->current_bss_color,
+		   cmd->detection_period_ms, cmd->scan_period_ms);
+
+	ret = ath11k_wmi_cmd_send(wmi, skb,
+				  WMI_OBSS_COLOR_COLLISION_DET_CONFIG_CMDID);
+	if (ret) {
+		ath11k_warn(ab, "Failed to send WMI_OBSS_COLOR_COLLISION_DET_CONFIG_CMDID");
+		dev_kfree_skb(skb);
+	}
+	return ret;
+}
+
+int ath11k_wmi_send_bss_color_change_enable_cmd(struct ath11k *ar, u32 vdev_id, bool enable)
+{
+	struct ath11k_pdev_wmi *wmi = ar->wmi;
+	struct ath11k_base *ab = wmi->wmi_ab->ab;
+	struct wmi_bss_color_change_enable_params_cmd *cmd;
+	struct sk_buff *skb;
+	int ret, len;
+
+	len = sizeof(*cmd);
+
+	skb = ath11k_wmi_alloc_skb(wmi->wmi_ab, len);
+	if (!skb)
+		return -ENOMEM;
+
+	cmd = (struct wmi_bss_color_change_enable_params_cmd *)skb->data;
+	cmd->tlv_header = FIELD_PREP(WMI_TLV_TAG, WMI_TAG_BSS_COLOR_CHANGE_ENABLE) |
+			  FIELD_PREP(WMI_TLV_LEN, len - TLV_HDR_SIZE);
+	cmd->vdev_id = vdev_id;
+	cmd->enable = enable ? 1 : 0;
+
+	ath11k_dbg(ar->ab, ATH11K_DBG_WMI,
+		   "wmi_send_bss_color_change_enable id %d enable %d\n",
+		   cmd->vdev_id, cmd->enable);
+
+	ret = ath11k_wmi_cmd_send(wmi, skb,
+				  WMI_BSS_COLOR_CHANGE_ENABLE_CMDID);
+	if (ret) {
+		ath11k_warn(ab, "Failed to send WMI_TWT_DIeABLE_CMDID");
+		dev_kfree_skb(skb);
+	}
+	return ret;
+}
+
 static void
 ath11k_fill_band_to_mac_param(struct ath11k_base  *soc,
 			      struct wmi_host_pdev_band_to_mac *band_to_mac)
diff --git a/drivers/net/wireless/ath/ath11k/wmi.h b/drivers/net/wireless/ath/ath11k/wmi.h
index 4dbcb9dc0f8d..f62f796305aa 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.h
+++ b/drivers/net/wireless/ath/ath11k/wmi.h
@@ -483,6 +483,7 @@ enum wmi_tlv_cmd_id {
 	WMI_SAR_LIMITS_CMDID,
 	WMI_OBSS_SCAN_ENABLE_CMDID = WMI_TLV_CMD(WMI_GRP_OBSS_OFL),
 	WMI_OBSS_SCAN_DISABLE_CMDID,
+	WMI_OBSS_COLOR_COLLISION_DET_CONFIG_CMDID,
 	WMI_LPI_MGMT_SNOOPING_CONFIG_CMDID = WMI_TLV_CMD(WMI_GRP_LPI),
 	WMI_LPI_START_SCAN_CMDID,
 	WMI_LPI_STOP_SCAN_CMDID,
@@ -4694,6 +4695,30 @@ struct wmi_peer_oper_mode_change_event {
 	u32 new_disablemu;
 } __packed;
 
+#define ATH11K_BSS_COLOR_COLLISION_SCAN_PERIOD_MS		200
+#define ATH11K_OBSS_COLOR_COLLISION_DETECTION_DISABLE		0
+#define ATH11K_OBSS_COLOR_COLLISION_DETECTION			1
+
+#define ATH11K_BSS_COLOR_COLLISION_DETECTION_STA_PERIOD_MS	10000
+#define ATH11K_BSS_COLOR_COLLISION_DETECTION_AP_PERIOD_MS	5000
+
+struct wmi_obss_color_collision_cfg_params_cmd {
+	u32 tlv_header;
+	u32 vdev_id;
+	u32 flags;
+	u32 evt_type;
+	u32 current_bss_color;
+	u32 detection_period_ms;
+	u32 scan_period_ms;
+	u32 free_slot_expiry_time_ms;
+} __packed;
+
+struct wmi_bss_color_change_enable_params_cmd {
+	u32 tlv_header;
+	u32 vdev_id;
+	u32 enable;
+} __packed;
+
 struct target_resource_config {
 	u32 num_vdevs;
 	u32 num_peers;
@@ -4892,4 +4917,10 @@ int ath11k_wmi_send_twt_resume_dialog_cmd(struct ath11k *ar,
 					  struct wmi_twt_resume_dialog_params *params);
 int ath11k_wmi_send_obss_spr_cmd(struct ath11k *ar, u32 vdev_id,
 				 struct ieee80211_he_obss_pd *he_obss_pd);
+int ath11k_wmi_send_obss_color_collision_cfg_cmd(struct ath11k *ar, u32 vdev_id,
+						 u8 bss_color, u32 period,
+						 bool enable);
+int ath11k_wmi_send_bss_color_change_enable_cmd(struct ath11k *ar, u32 vdev_id,
+						bool enable);
+
 #endif
-- 
2.20.1


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
