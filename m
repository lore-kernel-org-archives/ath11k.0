Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from a27-11.smtp-out.us-west-2.amazonses.com ([54.240.27.11])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ieAjk-0002Q2-EU
 for ath11k@lists.infradead.org; Mon, 09 Dec 2019 04:33:35 +0000
MIME-Version: 1.0
Date: Mon, 9 Dec 2019 04:33:27 +0000
From: vthiagar@codeaurora.org
Subject: Re: [PATCH 6/7] ath11k: add WMI calls required for handling BSS color
In-Reply-To: <20191206143401.4080-6-john@phrozen.org>
References: <20191206143401.4080-1-john@phrozen.org>
 <20191206143401.4080-6-john@phrozen.org>
Message-ID: <0101016ee8ef0084-789ef1ab-92f9-42ea-9e6b-5bb736a7b218-000000@us-west-2.amazonses.com>
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+kvalo=adurom.com@lists.infradead.org
To: John Crispin <john@phrozen.org>
Cc: Johannes Berg <johannes@sipsolutions.net>, linux-wireless@vger.kernel.org, ath11k@lists.infradead.org, Kalle Valo <kvalo@codeaurora.org>

On 2019-12-06 20:04, John Crispin wrote:
> If the he_operation field of the beacon sets a BSS color, we need to 
> inform
> the FW of the settings. This patch adds the WMI command handlers 
> required
> to do so.
> 
> Signed-off-by: John Crispin <john@phrozen.org>
> ---
>  drivers/net/wireless/ath/ath11k/wmi.c | 67 +++++++++++++++++++++++++++
>  drivers/net/wireless/ath/ath11k/wmi.h | 31 +++++++++++++
>  2 files changed, 98 insertions(+)
> 
> diff --git a/drivers/net/wireless/ath/ath11k/wmi.c
> b/drivers/net/wireless/ath/ath11k/wmi.c
> index 8cf7220a95f9..5d9276db9a85 100644
> --- a/drivers/net/wireless/ath/ath11k/wmi.c
> +++ b/drivers/net/wireless/ath/ath11k/wmi.c
> @@ -2789,6 +2789,73 @@ ath11k_wmi_send_obss_spr_cmd(struct ath11k *ar,
> u32 vdev_id,
>  	return ret;
>  }
> 
> +int
> +ath11k_wmi_send_obss_color_collision_cfg_cmd(struct ath11k *ar, u32 
> vdev_id,
> +					     u8 bss_color, u32 period,
> +					     bool enable)
> +{
> +	struct ath11k_pdev_wmi *wmi = ar->wmi;
> +	struct ath11k_base *ab = wmi->wmi_ab->ab;
> +	struct wmi_obss_color_collision_cfg_params_cmd *cmd;
> +	struct sk_buff *skb;
> +	int ret, len;
> +
> +	len = sizeof(*cmd);
> +
> +	skb = ath11k_wmi_alloc_skb(wmi->wmi_ab, len);
> +	if (!skb)
> +		return -ENOMEM;
> +
> +	cmd = (struct wmi_obss_color_collision_cfg_params_cmd *)skb->data;
> +	cmd->tlv_header = FIELD_PREP(WMI_TLV_TAG,
> WMI_TAG_OBSS_COLOR_COLLISION_DET_CONFIG) |
> +			  FIELD_PREP(WMI_TLV_LEN, len - TLV_HDR_SIZE);
> +	cmd->vdev_id = vdev_id;
> +	cmd->evt_type = enable ? ATH11K_OBSS_COLOR_COLLISION_DETECTION :
> +				 ATH11K_OBSS_COLOR_COLLISION_DETECTION_DISABLE;
> +	cmd->current_bss_color = bss_color;
> +	cmd->detection_period_ms = period;
> +	cmd->scan_period_ms = ATH11K_BSS_COLOR_COLLISION_SCAN_PERIOD_MS;
> +	cmd->free_slot_expiry_time_ms = 0;
> +	cmd->flags = 0;
> +
> +	ret = ath11k_wmi_cmd_send(wmi, skb,
> +				  WMI_OBSS_COLOR_COLLISION_DET_CONFIG_CMDID);
> +	if (ret) {
> +		ath11k_warn(ab, "Failed to send 
> WMI_OBSS_COLOR_COLLISION_DET_CONFIG_CMDID");
> +		dev_kfree_skb(skb);
> +	}

WMI debug log please.

> +	return ret;
> +}
> +
> +int ath11k_wmi_send_bss_color_change_enable_cmd(struct ath11k *ar,
> u32 vdev_id, bool enable)
> +{
> +	struct ath11k_pdev_wmi *wmi = ar->wmi;
> +	struct ath11k_base *ab = wmi->wmi_ab->ab;
> +	struct wmi_bss_color_change_enable_params_cmd *cmd;
> +	struct sk_buff *skb;
> +	int ret, len;
> +
> +	len = sizeof(*cmd);
> +
> +	skb = ath11k_wmi_alloc_skb(wmi->wmi_ab, len);
> +	if (!skb)
> +		return -ENOMEM;
> +
> +	cmd = (struct wmi_bss_color_change_enable_params_cmd *)skb->data;
> +	cmd->tlv_header = FIELD_PREP(WMI_TLV_TAG, 
> WMI_TAG_BSS_COLOR_CHANGE_ENABLE) |
> +			  FIELD_PREP(WMI_TLV_LEN, len - TLV_HDR_SIZE);
> +	cmd->vdev_id = vdev_id;
> +	cmd->enable = enable ? 1 : 0;
> +
> +	ret = ath11k_wmi_cmd_send(wmi, skb,
> +				  WMI_BSS_COLOR_CHANGE_ENABLE_CMDID);
> +	if (ret) {
> +		ath11k_warn(ab, "Failed to send WMI_TWT_DIeABLE_CMDID");
> +		dev_kfree_skb(skb);
> +	}

Same here.


Vasanth

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
