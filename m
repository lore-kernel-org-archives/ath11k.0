Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from nbd.name ([2a01:4f8:221:3d45::2])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iWetP-00039C-43
 for ath11k@lists.infradead.org; Mon, 18 Nov 2019 11:08:28 +0000
From: John Crispin <john@phrozen.org>
Subject: [PATCH 1/2] ath11k: add wmi helper for turning STA PS on/off
Date: Mon, 18 Nov 2019 12:08:14 +0100
Message-Id: <20191118110815.23768-1-john@phrozen.org>
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
Cc: ath11k@lists.infradead.org, John Crispin <john@phrozen.org>

Add a WMI call helper to set the powersave mode of a STA interface.

Signed-off-by: John Crispin <john@phrozen.org>
---
 drivers/net/wireless/ath/ath11k/wmi.c | 30 +++++++++++++++++++++++++++
 drivers/net/wireless/ath/ath11k/wmi.h |  7 +++++++
 2 files changed, 37 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index 6f1a990c2047..13bf6ff68073 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -1178,6 +1178,36 @@ int ath11k_wmi_pdev_set_param(struct ath11k *ar, u32 param_id,
 	return ret;
 }
 
+int ath11k_wmi_pdev_set_ps_mode(struct ath11k *ar, int vdev_id, u32 enable)
+{
+	struct ath11k_pdev_wmi *wmi = ar->wmi;
+	struct wmi_pdev_set_ps_mode_cmd *cmd;
+	struct sk_buff *skb;
+	int ret;
+
+	skb = ath11k_wmi_alloc_skb(wmi->wmi_sc, sizeof(*cmd));
+	if (!skb)
+		return -ENOMEM;
+
+	cmd = (struct wmi_pdev_set_ps_mode_cmd *)skb->data;
+	cmd->tlv_header = FIELD_PREP(WMI_TLV_TAG, WMI_TAG_STA_POWERSAVE_MODE_CMD) |
+			  FIELD_PREP(WMI_TLV_LEN, sizeof(*cmd) - TLV_HDR_SIZE);
+	cmd->vdev_id = vdev_id;
+	cmd->sta_ps_mode = enable;
+
+	ret = ath11k_wmi_cmd_send(wmi, skb, WMI_STA_POWERSAVE_MODE_CMDID);
+	if (ret) {
+		ath11k_warn(ar->ab, "failed to send WMI_PDEV_SET_PARAM cmd\n");
+		dev_kfree_skb(skb);
+	}
+
+	ath11k_dbg(ar->ab, ATH11K_DBG_WMI,
+		   "WMI vdev set psmode %d vdev id %d\n",
+		   enable, vdev_id);
+
+	return ret;
+}
+
 int ath11k_wmi_pdev_suspend(struct ath11k *ar, u32 suspend_opt,
 			    u32 pdev_id)
 {
diff --git a/drivers/net/wireless/ath/ath11k/wmi.h b/drivers/net/wireless/ath/ath11k/wmi.h
index 4a518d406bc5..9919d8bf297b 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.h
+++ b/drivers/net/wireless/ath/ath11k/wmi.h
@@ -2827,6 +2827,12 @@ struct wmi_pdev_set_param_cmd {
 	u32 param_value;
 } __packed;
 
+struct wmi_pdev_set_ps_mode_cmd {
+	u32 tlv_header;
+	u32 vdev_id;
+	u32 sta_ps_mode;
+} __packed;
+
 struct wmi_pdev_suspend_cmd {
 	u32 tlv_header;
 	u32 pdev_id;
@@ -4682,6 +4688,7 @@ int ath11k_wmi_set_peer_param(struct ath11k *ar, const u8 *peer_addr,
 			      u32 vdev_id, u32 param_id, u32 param_val);
 int ath11k_wmi_pdev_set_param(struct ath11k *ar, u32 param_id,
 			      u32 param_value, u8 pdev_id);
+int ath11k_wmi_pdev_set_ps_mode(struct ath11k *ar, int vdev_id, u32 enable);
 int ath11k_wmi_wait_for_unified_ready(struct ath11k_base *ab);
 int ath11k_wmi_cmd_init(struct ath11k_base *ab);
 int ath11k_wmi_wait_for_service_ready(struct ath11k_base *ab);
-- 
2.20.1


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
