Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hw1AJ-0000dl-8n
 for ath11k@lists.infradead.org; Fri, 09 Aug 2019 09:26:28 +0000
Received: from [127.0.1.1] (88-114-240-156.elisa-laajakaista.fi
 [88.114.240.156])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: kvalo@smtp.codeaurora.org)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 0437F608FF
 for <ath11k@lists.infradead.org>; Fri,  9 Aug 2019 09:26:25 +0000 (UTC)
Subject: [PATCH 03/15] ath11k: cleanup and rename
 ath11k_send_crash_inject_cmd()
From: Kalle Valo <kvalo@codeaurora.org>
Date: Fri, 09 Aug 2019 12:26:23 +0300
Message-ID: <156534278378.30736.15842499109433409233.stgit@x230>
In-Reply-To: <156534276745.30736.11736417077894270794.stgit@x230>
References: <156534276745.30736.11736417077894270794.stgit@x230>
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
To: ath11k@lists.infradead.org

Instead use the common style used in WMI functions in general.

No functional changes, compile tested only.

Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/debug.c |    7 +++----
 drivers/net/wireless/ath/ath11k/wmi.c   |   16 +++++++---------
 drivers/net/wireless/ath/ath11k/wmi.h   |    8 +-------
 3 files changed, 11 insertions(+), 20 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/debug.c b/drivers/net/wireless/ath/ath11k/debug.c
index e62a409185f4..2e3798cd7e99 100644
--- a/drivers/net/wireless/ath/ath11k/debug.c
+++ b/drivers/net/wireless/ath/ath11k/debug.c
@@ -539,7 +539,6 @@ static ssize_t ath11k_write_simulate_fw_crash(struct file *file,
 	struct ath11k_base *ab = file->private_data;
 	struct ath11k_pdev *pdev;
 	struct ath11k *ar = ab->pdevs[0].ar;
-	struct crash_inject param;
 	char buf[32] = {0};
 	ssize_t rc;
 	int i, ret, radioup;
@@ -571,9 +570,9 @@ static ssize_t ath11k_write_simulate_fw_crash(struct file *file,
 
 	if (!strcmp(buf, "assert")) {
 		ath11k_info(ab, "simulating firmware assert crash\n");
-		param.type = ATH11K_WMI_FW_HANG_ASSERT_TYPE;
-		param.delay_time_ms = ATH11K_WMI_FW_HANG_DELAY;
-		ret = ath11k_send_crash_inject_cmd(&ab->wmi_sc.wmi[0], &param);
+		ret = ath11k_wmi_force_fw_hang_cmd(ar,
+						   ATH11K_WMI_FW_HANG_ASSERT_TYPE,
+						   ATH11K_WMI_FW_HANG_DELAY);
 	} else {
 		ret = -EINVAL;
 		goto exit;
diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index 464c57e59a54..24058ab1f5fd 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -1343,17 +1343,16 @@ int ath11k_wmi_set_sta_ps_param(struct ath11k *ar, u32 vdev_id,
 	return ret;
 }
 
-int ath11k_send_crash_inject_cmd(struct ath11k_pdev_wmi *wmi_handle,
-				 struct crash_inject *param)
+int ath11k_wmi_force_fw_hang_cmd(struct ath11k *ar, u32 type, u32 delay_time_ms)
 {
-	struct ath11k_base *ab = wmi_handle->wmi_sc->ab;
+	struct ath11k_pdev_wmi *wmi = ar->wmi;
 	struct wmi_force_fw_hang_cmd *cmd;
 	struct sk_buff *skb;
 	int ret, len;
 
 	len = sizeof(*cmd);
 
-	skb = ath11k_wmi_alloc_skb(wmi_handle->wmi_sc, len);
+	skb = ath11k_wmi_alloc_skb(wmi->wmi_sc, len);
 	if (!skb)
 		return -ENOMEM;
 
@@ -1361,14 +1360,13 @@ int ath11k_send_crash_inject_cmd(struct ath11k_pdev_wmi *wmi_handle,
 	cmd->tlv_header = FIELD_PREP(WMI_TLV_TAG, WMI_TAG_FORCE_FW_HANG_CMD) |
 			  FIELD_PREP(WMI_TLV_LEN, len - TLV_HDR_SIZE);
 
-	cmd->type = param->type;
-	cmd->delay_time_ms = param->delay_time_ms;
+	cmd->type = type;
+	cmd->delay_time_ms = delay_time_ms;
 
-	ret = ath11k_wmi_cmd_send(wmi_handle, skb,
-				  WMI_FORCE_FW_HANG_CMDID);
+	ret = ath11k_wmi_cmd_send(wmi, skb, WMI_FORCE_FW_HANG_CMDID);
 
 	if (ret) {
-		ath11k_warn(ab, "Failed to send WMI_FORCE_FW_HANG_CMDID");
+		ath11k_warn(ar->ab, "Failed to send WMI_FORCE_FW_HANG_CMDID");
 		dev_kfree_skb(skb);
 	}
 	return ret;
diff --git a/drivers/net/wireless/ath/ath11k/wmi.h b/drivers/net/wireless/ath/ath11k/wmi.h
index ff31aa7d8058..96be01972aef 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.h
+++ b/drivers/net/wireless/ath/ath11k/wmi.h
@@ -3521,11 +3521,6 @@ struct ap_ps_params {
 	u32 value;
 };
 
-struct crash_inject {
-	u32 type;
-	u32 delay_time_ms;
-};
-
 struct vdev_set_params {
 	u32 if_id;
 	u32 param_id;
@@ -4612,8 +4607,7 @@ int ath11k_wmi_vdev_set_param_cmd(struct ath11k *ar, u32 vdev_id,
 
 int ath11k_wmi_set_sta_ps_param(struct ath11k *ar, u32 vdev_id,
 				u32 param, u32 param_value);
-int ath11k_send_crash_inject_cmd(struct ath11k_pdev_wmi *wmi_handle,
-				 struct crash_inject *param);
+int ath11k_wmi_force_fw_hang_cmd(struct ath11k *ar, u32 type, u32 delay_time_ms);
 int ath11k_wmi_send_peer_delete_cmd(struct ath11k *ar,
 				    const u8 *peer_addr, u8 vdev_id);
 int ath11k_wmi_vdev_delete(struct ath11k *ar, u8 vdev_id);


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
