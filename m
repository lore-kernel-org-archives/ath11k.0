Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hQPrk-00057R-5x
 for ath11k@lists.infradead.org; Tue, 14 May 2019 05:20:41 +0000
Received: from x230.adurom.net (88-114-240-156.elisa-laajakaista.fi
 [88.114.240.156])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: kvalo@smtp.codeaurora.org)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 6491F6087A
 for <ath11k@lists.infradead.org>; Tue, 14 May 2019 05:20:38 +0000 (UTC)
From: Kalle Valo <kvalo@codeaurora.org>
Subject: [PATCH 2/3] ath11k: remove unused functions
Date: Tue, 14 May 2019 08:20:33 +0300
Message-Id: <1557811234-5439-2-git-send-email-kvalo@codeaurora.org>
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

GCC warns:

drivers/net/wireless/ath/ath11k/wmi.c:2559:12: warning: 'ath11k_send_bcn_buf_ll_cmd' defined but not used [-Wunused-function]
drivers/net/wireless/ath/ath11k/wmi.c:2453:12: warning: 'ath11k_send_set_smps_params_cmd' defined but not used [-Wunused-function]
drivers/net/wireless/ath/ath11k/wmi.c:2396:12: warning: 'ath11k_send_set_mimops_cmd' defined but not used [-Wunused-function]
drivers/net/wireless/ath/ath11k/wmi.c:2362:12: warning: 'ath11k_send_set_sta_ps_mode_cmd' defined but not used [-Wunused-function]
drivers/net/wireless/ath/ath11k/wmi.c:1042:12: warning: 'ath11k_send_vdev_set_fwtest_param_cmd' defined but not used [-Wunused-function]
drivers/net/wireless/ath/ath11k/wmi.c:1012:12: warning: 'ath11k_send_gpio_output_cmd' defined but not used [-Wunused-function]
drivers/net/wireless/ath/ath11k/wmi.c:974:12: warning: 'ath11k_send_gpio_config_cmd' defined but not used [-Wunused-function]
drivers/net/wireless/ath/ath11k/wmi.c:943:12: warning: 'ath11k_send_green_ap_ps_enable_cmd' defined but not used [-Wunused-function]

So remove those. They can be can easily added back if they are ever needed.

Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/wmi.c | 292 ----------------------------------
 1 file changed, 292 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index a8ef1be6e7de..7ca0a64befb4 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -940,136 +940,6 @@ int ath11k_wmi_send_peer_delete_cmd(struct ath11k *ar,
 	return ret;
 }
 
-static int ath11k_send_green_ap_ps_enable_cmd(struct ath11k_pdev_wmi *wmi_handle,
-					      u32 value, u8 mac_id)
-{
-	struct ath11k_base *ab = wmi_handle->wmi_sc->sc;
-	struct wmi_pdev_green_ap_ps_enable_cmd_param *cmd;
-	struct sk_buff *skb;
-	int ret, len;
-
-	len = sizeof(*cmd);
-	skb = ath11k_wmi_alloc_skb(wmi_handle->wmi_sc, len);
-	if (!skb)
-		return -ENOMEM;
-
-	cmd = (void *)skb->data;
-	cmd->tlv_header = FIELD_PREP(WMI_TLV_TAG,
-				     WMI_TAG_PDEV_GREEN_AP_PS_ENABLE_CMD) |
-			  FIELD_PREP(WMI_TLV_LEN, len - TLV_HDR_SIZE);
-
-	cmd->pdev_id = mac_id;
-	cmd->enable = value;
-
-	ret = ath11k_wmi_cmd_send(wmi_handle, skb,
-				  WMI_PDEV_GREEN_AP_PS_ENABLE_CMDID);
-
-	if (ret) {
-		ath11k_warn(ab, "Failed to send WMI_PDEV_GREEN_AP_PS_ENABLE_CMDID");
-		dev_kfree_skb(skb);
-	}
-	return ret;
-}
-
-static int ath11k_send_gpio_config_cmd(struct ath11k_pdev_wmi *wmi_handle,
-				       struct gpio_config_params *param)
-{
-	struct ath11k_base *ab = wmi_handle->wmi_sc->sc;
-	struct wmi_gpio_config_cmd_param *cmd;
-	struct sk_buff *skb;
-	int ret, len;
-
-	len = sizeof(*cmd);
-
-	/* Sanity Checks */
-	if (param->pull_type > WMI_GPIO_PULL_DOWN ||
-	    param->intr_mode > WMI_GPIO_INTTYPE_LEVEL_HIGH) {
-		return -EINVAL;
-	}
-	skb = ath11k_wmi_alloc_skb(wmi_handle->wmi_sc, len);
-	if (!skb)
-		return -ENOMEM;
-
-	cmd = (void *)skb->data;
-	cmd->tlv_header = FIELD_PREP(WMI_TLV_TAG, WMI_TAG_GPIO_CONFIG_CMD) |
-			  FIELD_PREP(WMI_TLV_LEN, len - TLV_HDR_SIZE);
-
-	cmd->gpio_num = param->gpio_num;
-	cmd->input = param->input;
-	cmd->pull_type = param->pull_type;
-	cmd->intr_mode = param->intr_mode;
-
-	ret = ath11k_wmi_cmd_send(wmi_handle, skb,
-				  WMI_GPIO_CONFIG_CMDID);
-
-	if (ret) {
-		ath11k_warn(ab, "Failed to send WMI_GPIO_CONFIG_CMDID");
-		dev_kfree_skb(skb);
-	}
-	return ret;
-}
-
-static int ath11k_send_gpio_output_cmd(struct ath11k_pdev_wmi *wmi_handle,
-				       struct gpio_output_params *param)
-{
-	struct ath11k_base *ab = wmi_handle->wmi_sc->sc;
-	struct wmi_gpio_output_cmd_param *cmd;
-	struct sk_buff *skb;
-	int ret, len;
-
-	len = sizeof(*cmd);
-	skb = ath11k_wmi_alloc_skb(wmi_handle->wmi_sc, len);
-	if (!skb)
-		return -ENOMEM;
-
-	cmd = (void *)skb->data;
-	cmd->tlv_header = FIELD_PREP(WMI_TLV_TAG, WMI_TAG_GPIO_OUTPUT_CMD) |
-			  FIELD_PREP(WMI_TLV_LEN, len - TLV_HDR_SIZE);
-
-	cmd->gpio_num = param->gpio_num;
-	cmd->set = param->set;
-
-	ret = ath11k_wmi_cmd_send(wmi_handle, skb,
-				  WMI_GPIO_OUTPUT_CMDID);
-
-	if (ret) {
-		ath11k_warn(ab, "Failed to send WMI_GPIO_OUTPUT_CMDID");
-		dev_kfree_skb(skb);
-	}
-	return ret;
-}
-
-static int ath11k_send_vdev_set_fwtest_param_cmd(struct ath11k_pdev_wmi *wmi_handle,
-						 struct set_fwtest_params *param)
-{
-	struct ath11k_base *ab = wmi_handle->wmi_sc->sc;
-	struct wmi_fwtest_set_param_cmd_param *cmd;
-	struct sk_buff *skb;
-	int ret, len;
-
-	len = sizeof(*cmd);
-	skb = ath11k_wmi_alloc_skb(wmi_handle->wmi_sc, len);
-	if (!skb)
-		return -ENOMEM;
-
-	cmd = (void *)skb->data;
-	cmd->tlv_header = FIELD_PREP(WMI_TLV_TAG,
-				     WMI_TAG_FWTEST_SET_PARAM_CMD) |
-			  FIELD_PREP(WMI_TLV_LEN, len - TLV_HDR_SIZE);
-
-	cmd->param_id = param->arg;
-	cmd->param_value = param->value;
-
-	ret = ath11k_wmi_cmd_send(wmi_handle, skb,
-				  WMI_FWTEST_CMDID);
-
-	if (ret) {
-		ath11k_warn(ab, "Failed to send WMI_FWTEST_CMDID");
-		dev_kfree_skb(skb);
-	}
-	return ret;
-}
-
 int ath11k_wmi_send_pdev_set_regdomain(struct ath11k *ar,
 				       struct pdev_set_regdomain_params *param)
 {
@@ -2359,134 +2229,6 @@ int ath11k_wmi_send_scan_chan_list_cmd(struct ath11k *ar,
 	return ret;
 }
 
-static int ath11k_send_set_sta_ps_mode_cmd(struct ath11k_pdev_wmi *wmi_handle,
-					   u32 vdev_id, u8 val)
-{
-	struct ath11k_base *ab = wmi_handle->wmi_sc->sc;
-	struct wmi_sta_powersave_mode_cmd *cmd;
-	struct sk_buff *skb;
-	int ret, len;
-
-	len = sizeof(*cmd);
-
-	skb = ath11k_wmi_alloc_skb(wmi_handle->wmi_sc, len);
-	if (!skb)
-		return -ENOMEM;
-
-	cmd = (void *)skb->data;
-	cmd->tlv_header = FIELD_PREP(WMI_TLV_TAG,
-				     WMI_TAG_STA_POWERSAVE_MODE_CMD) |
-			  FIELD_PREP(WMI_TLV_LEN, len - TLV_HDR_SIZE);
-	cmd->vdev_id =  vdev_id;
-	if (val)
-		cmd->sta_ps_mode =  WMI_STA_PS_MODE_ENABLED;
-	else
-		cmd->sta_ps_mode =  WMI_STA_PS_MODE_DISABLED;
-
-	ret = ath11k_wmi_cmd_send(wmi_handle, skb,
-				  WMI_STA_POWERSAVE_MODE_CMDID);
-
-	if (ret) {
-		ath11k_warn(ab, "Failed to send WMI_STA_POWERSAVE_MODE_CMDID");
-		dev_kfree_skb(skb);
-	}
-	return ret;
-}
-
-static int ath11k_send_set_mimops_cmd(struct ath11k_pdev_wmi *wmi_handle,
-				      u8 vdev_id, int value)
-{
-	struct ath11k_base *ab = wmi_handle->wmi_sc->sc;
-	struct wmi_sta_smps_force_mode_cmd *cmd;
-	struct sk_buff *skb;
-	int ret, len;
-
-	len = sizeof(*cmd);
-
-	skb = ath11k_wmi_alloc_skb(wmi_handle->wmi_sc, len);
-	if (!skb)
-		return -ENOMEM;
-
-	cmd = (void *)skb->data;
-	cmd->tlv_header = FIELD_PREP(WMI_TLV_TAG,
-				     WMI_TAG_STA_SMPS_FORCE_MODE_CMD) |
-			  FIELD_PREP(WMI_TLV_LEN, len - TLV_HDR_SIZE);
-
-	cmd->vdev_id = vdev_id;
-
-	/* WMI_SMPS_FORCED_MODE values do not directly map
-	 * to SM power save values defined in the specification.
-	 * Make sure to send the right mapping.
-	 */
-	switch (value) {
-	case 0:
-		cmd->forced_mode =  WMI_SMPS_FORCED_MODE_NONE;
-		break;
-	case 1:
-		cmd->forced_mode =  WMI_SMPS_FORCED_MODE_DISABLED;
-		break;
-	case 2:
-		cmd->forced_mode =  WMI_SMPS_FORCED_MODE_STATIC;
-		break;
-	case 3:
-		cmd->forced_mode =  (WMI_SMPS_FORCED_MODE_DYNAMIC);
-		break;
-	default:
-		ath11k_warn(ab, "INVALID Mimo PS CONFIG %d", value);
-		return -EINVAL;
-	}
-
-	ath11k_dbg(ab, ATH11K_DBG_WMI,
-		   "Setting SMPS Force Mode. vdev %d, mode %d\n",
-		   cmd->vdev_id, cmd->forced_mode);
-
-	ret = ath11k_wmi_cmd_send(wmi_handle, skb,
-				  WMI_STA_SMPS_FORCE_MODE_CMDID);
-
-	if (ret) {
-		ath11k_warn(ab, "Failed to send WMI_STA_SMPS_FORCE_MODE_CMDID");
-		dev_kfree_skb(skb);
-	}
-	return ret;
-}
-
-static int ath11k_send_set_smps_params_cmd(struct ath11k_pdev_wmi *wmi_handle,
-					   u8 vdev_id, int value)
-{
-	struct ath11k_base *ab = wmi_handle->wmi_sc->sc;
-	struct wmi_sta_smps_param_cmd *cmd;
-	struct sk_buff *skb;
-	int ret, len;
-
-	len = sizeof(*cmd);
-
-	skb = ath11k_wmi_alloc_skb(wmi_handle->wmi_sc, len);
-	if (!skb)
-		return -ENOMEM;
-
-	cmd = (void *)skb->data;
-	cmd->tlv_header = FIELD_PREP(WMI_TLV_TAG, WMI_TAG_STA_SMPS_PARAM_CMD) |
-			  FIELD_PREP(WMI_TLV_LEN, len - TLV_HDR_SIZE);
-
-	cmd->vdev_id = vdev_id;
-	cmd->value = value & WMI_SMPS_MASK_LOWER_16BITS;
-	cmd->param = (value >> WMI_SMPS_PARAM_VALUE_SHIFT) &
-		     WMI_SMPS_MASK_UPPER_3BITS;
-
-	ath11k_dbg(ab, ATH11K_DBG_WMI,
-		   "Setting SMPS Param. vdev %d, param %d, value %d\n",
-		   cmd->vdev_id, cmd->param, cmd->value);
-
-	ret = ath11k_wmi_cmd_send(wmi_handle, skb,
-				  WMI_STA_SMPS_PARAM_CMDID);
-
-	if (ret) {
-		ath11k_warn(ab, "Failed to send WMI_STA_SMPS_PARAM_CMDID");
-		dev_kfree_skb(skb);
-	}
-	return ret;
-}
-
 int ath11k_wmi_send_wmm_update_cmd_tlv(struct ath11k *ar, u32 vdev_id,
 				       struct wmi_wmm_params_all_arg *param)
 {
@@ -2556,40 +2298,6 @@ int ath11k_wmi_send_wmm_update_cmd_tlv(struct ath11k *ar, u32 vdev_id,
 	return ret;
 }
 
-static int ath11k_send_bcn_buf_ll_cmd(struct ath11k_pdev_wmi *wmi_handle,
-				      struct wmi_bcn_send_from_host_cmd *param)
-{
-	struct ath11k_base *ab = wmi_handle->wmi_sc->sc;
-	struct wmi_bcn_send_from_host_cmd *cmd;
-	struct sk_buff *skb;
-	int ret, len;
-
-	len = sizeof(*cmd);
-
-	skb = ath11k_wmi_alloc_skb(wmi_handle->wmi_sc, len);
-	if (!skb)
-		return -ENOMEM;
-
-	cmd = (void *)skb->data;
-	cmd->tlv_header = FIELD_PREP(WMI_TLV_TAG,
-				     WMI_TAG_BCN_SEND_FROM_HOST_CMD) |
-			  FIELD_PREP(WMI_TLV_LEN, len - TLV_HDR_SIZE);
-
-	cmd->vdev_id = param->vdev_id;
-	cmd->data_len = param->data_len;
-	cmd->frame_ctrl = param->frame_ctrl;
-	cmd->frag_ptr = param->frag_ptr;
-	cmd->dtim_flag = param->dtim_flag;
-
-	ret = ath11k_wmi_cmd_send(wmi_handle, skb,
-				  WMI_PDEV_SEND_BCN_CMDID);
-	if (ret) {
-		ath11k_warn(ab, "Failed to send WMI_PDEV_SEND_BCN_CMDID");
-		dev_kfree_skb(skb);
-	}
-	return ret;
-}
-
 int ath11k_wmi_send_dfs_phyerr_offload_enable_cmd(struct ath11k *ar,
 						  u32 pdev_id)
 {
-- 
2.7.4


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
