Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from a27-188.smtp-out.us-west-2.amazonses.com ([54.240.27.188])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iZHLi-0006pJ-Si
 for ath11k@lists.infradead.org; Mon, 25 Nov 2019 16:36:32 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: [PATCH 8/8] ath11k: add spatial reuse support
Date: Mon, 25 Nov 2019 16:36:29 +0000
Message-ID: <0101016ea36bedda-bd9dfad8-f75c-4c71-9939-116a3dfd10aa-000000@us-west-2.amazonses.com>
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

From: John Crispin <john@phrozen.org>

Trigger the WMI call en/disabling OBSS PD when the bss config changes or we
assoc to an AP that broadcasts the IE.

Signed-off-by: John Crispin <john@phrozen.org>
Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/mac.c | 10 ++++++++++
 drivers/net/wireless/ath/ath11k/wmi.c | 35 +++++++++++++++++++++++++++++++++++
 drivers/net/wireless/ath/ath11k/wmi.h | 16 ++++++++++++++++
 3 files changed, 61 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 70945d121fba..c25817c51d87 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -1612,6 +1612,12 @@ static void ath11k_bss_assoc(struct ieee80211_hw *hw,
 					1);
 	if (ret)
 		ath11k_warn(ar->ab, "Unable to authorize BSS peer: %d\n", ret);
+
+	ret = ath11k_wmi_send_obss_spr_cmd(ar, arvif->vdev_id,
+					   &bss_conf->he_obss_pd);
+	if (ret)
+		ath11k_warn(ar->ab, "failed to set vdev %i OBSS PD parameters: %d\n",
+			    arvif->vdev_id, ret);
 }
 
 static void ath11k_bss_disassoc(struct ieee80211_hw *hw,
@@ -1916,6 +1922,10 @@ static void ath11k_mac_op_bss_info_changed(struct ieee80211_hw *hw,
 			ath11k_wmi_send_twt_disable_cmd(ar, ar->pdev_idx);
 	}
 
+	if (changed & BSS_CHANGED_HE_OBSS_PD)
+		ath11k_wmi_send_obss_spr_cmd(ar, arvif->vdev_id,
+					     &info->he_obss_pd);
+
 	mutex_unlock(&ar->conf_mutex);
 }
 
diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index 7aa66e8eecb6..2c3c973f5f7c 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -2541,6 +2541,41 @@ ath11k_wmi_send_twt_disable_cmd(struct ath11k *ar, u32 pdev_id)
 	return ret;
 }
 
+int
+ath11k_wmi_send_obss_spr_cmd(struct ath11k *ar, u32 vdev_id,
+			     struct ieee80211_he_obss_pd *he_obss_pd)
+{
+	struct ath11k_pdev_wmi *wmi = ar->wmi;
+	struct ath11k_base *ab = wmi->wmi_sc->ab;
+	struct wmi_obss_spatial_reuse_params_cmd *cmd;
+	struct sk_buff *skb;
+	int ret, len;
+
+	len = sizeof(*cmd);
+
+	skb = ath11k_wmi_alloc_skb(wmi->wmi_sc, len);
+	if (!skb)
+		return -ENOMEM;
+
+	cmd = (void *)skb->data;
+	cmd->tlv_header = FIELD_PREP(WMI_TLV_TAG,
+				     WMI_TAG_OBSS_SPATIAL_REUSE_SET_CMD) |
+			  FIELD_PREP(WMI_TLV_LEN, len - TLV_HDR_SIZE);
+	cmd->vdev_id = vdev_id;
+	cmd->enable = he_obss_pd->enable;
+	cmd->obss_min = he_obss_pd->min_offset;
+	cmd->obss_max = he_obss_pd->max_offset;
+
+	ret = ath11k_wmi_cmd_send(wmi, skb,
+				  WMI_PDEV_OBSS_PD_SPATIAL_REUSE_CMDID);
+	if (ret) {
+		ath11k_warn(ab,
+			    "Failed to send WMI_PDEV_OBSS_PD_SPATIAL_REUSE_CMDID");
+		dev_kfree_skb(skb);
+	}
+	return ret;
+}
+
 static void
 ath11k_fill_band_to_mac_param(struct ath11k_base  *soc,
 			      struct wmi_host_pdev_band_to_mac *band_to_mac)
diff --git a/drivers/net/wireless/ath/ath11k/wmi.h b/drivers/net/wireless/ath/ath11k/wmi.h
index b5c53f2ac5cc..7d5690c65279 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.h
+++ b/drivers/net/wireless/ath/ath11k/wmi.h
@@ -172,6 +172,8 @@ enum wmi_cmd_group {
 	WMI_GRP_WLM            = 0x3c,
 	WMI_GRP_11K_OFFLOAD    = 0x3d,
 	WMI_GRP_TWT            = 0x3e,
+	WMI_GRP_MOTION_DET     = 0x3f,
+	WMI_GRP_SPATIAL_REUSE  = 0x40,
 };
 
 #define WMI_CMD_GRP(grp_id) (((grp_id) << 12) | 0x1)
@@ -539,6 +541,9 @@ enum wmi_tlv_cmd_id {
 	WMI_TWT_DEL_DIALOG_CMDID,
 	WMI_TWT_PAUSE_DIALOG_CMDID,
 	WMI_TWT_RESUME_DIALOG_CMDID,
+	WMI_PDEV_OBSS_PD_SPATIAL_REUSE_CMDID =
+				WMI_TLV_CMD(WMI_GRP_SPATIAL_REUSE),
+	WMI_PDEV_OBSS_PD_SPATIAL_REUSE_SET_DEF_OBSS_THRESH_CMDID,
 };
 
 enum wmi_tlv_event_id {
@@ -4559,6 +4564,15 @@ struct wmi_twt_disable_params_cmd {
 	u32 pdev_id;
 };
 
+struct wmi_obss_spatial_reuse_params_cmd {
+	u32 tlv_header;
+	u32 pdev_id;
+	u32 enable;
+	s32 obss_min;
+	s32 obss_max;
+	u32 vdev_id;
+};
+
 struct target_resource_config {
 	u32 num_vdevs;
 	u32 num_peers;
@@ -4746,4 +4760,6 @@ void ath11k_wmi_fw_stats_fill(struct ath11k *ar,
 int ath11k_wmi_simulate_radar(struct ath11k *ar);
 int ath11k_wmi_send_twt_enable_cmd(struct ath11k *ar, u32 pdev_id);
 int ath11k_wmi_send_twt_disable_cmd(struct ath11k *ar, u32 pdev_id);
+int ath11k_wmi_send_obss_spr_cmd(struct ath11k *ar, u32 vdev_id,
+				 struct ieee80211_he_obss_pd *he_obss_pd);
 #endif
-- 
2.7.4


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
