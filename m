Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hGbrw-0002lM-W2
 for ath11k@lists.infradead.org; Wed, 17 Apr 2019 04:08:22 +0000
MIME-Version: 1.0
Date: Wed, 17 Apr 2019 09:38:19 +0530
From: Vasanthakumar Thiagarajan <vthiagar@codeaurora.org>
Subject: Re: [PATCH 2/2] ath11k: add TWT support
In-Reply-To: <20190416190840.20286-2-john@phrozen.org>
References: <20190416190840.20286-1-john@phrozen.org>
 <20190416190840.20286-2-john@phrozen.org>
Message-ID: <461b88b9d9d02c70a7b6af5198764f12@codeaurora.org>
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
Cc: ath11k@lists.infradead.org, Kalle Valo <kvalo@codeaurora.org>, Shashidhar Lakkavalli <slakkavalli@datto.com>

On 2019-04-17 00:38, John Crispin wrote:
> Add target wait time wmi calls to the driver. Enable the support inside
> the FW by default.
> 
> Signed-off-by: Shashidhar Lakkavalli <slakkavalli@datto.com>
> Signed-off-by: John Crispin <john@phrozen.org>
> ---
>  drivers/net/wireless/ath/ath11k/mac.c |  2 ++
>  drivers/net/wireless/ath/ath11k/wmi.c | 55 
> +++++++++++++++++++++++++++++++++++
>  drivers/net/wireless/ath/ath11k/wmi.h | 51 
> ++++++++++++++++++++++++++++++++
>  3 files changed, 108 insertions(+)
> 
> diff --git a/drivers/net/wireless/ath/ath11k/mac.c
> b/drivers/net/wireless/ath/ath11k/mac.c
> index 6e6e90492b18..aa7603d5aa7f 100644
> --- a/drivers/net/wireless/ath/ath11k/mac.c
> +++ b/drivers/net/wireless/ath/ath11k/mac.c
> @@ -3606,6 +3606,8 @@ static int ath11k_start(struct ieee80211_hw *hw)
> 
>  	__ath11k_set_antenna(ar, ar->cfg_tx_chainmask, ar->cfg_rx_chainmask);
> 
> +	ath11k_send_twt_enable_cmd(ar, ar->pdev_idx);
> +
>  	/* TODO: Do we need to enable ANI? */
> 
>  	ath11k_reg_update_chan_list(ar);
> diff --git a/drivers/net/wireless/ath/ath11k/wmi.c
> b/drivers/net/wireless/ath/ath11k/wmi.c
> index 5b5e6b0bb42a..9ba1166d5dac 100644
> --- a/drivers/net/wireless/ath/ath11k/wmi.c
> +++ b/drivers/net/wireless/ath/ath11k/wmi.c
> @@ -1795,6 +1795,10 @@ ath11k_wmi_copy_peer_flags(struct
> wmi_peer_assoc_complete_cmd *cmd,
>  			cmd->peer_flags |= WMI_PEER_VHT;
>  		if (param->he_flag)
>  			cmd->peer_flags |= WMI_PEER_HE;
> +		if (param->twt_requester)
> +			cmd->peer_flags |= WMI_PEER_TWT_REQ;
> +		if (param->twt_responder)
> +			cmd->peer_flags |= WMI_PEER_TWT_RESP;
>  	}
> 
>  	/* Suppress authorization for all AUTH modes that need 4-way 
> handshake
> @@ -2679,6 +2683,52 @@ ath11k_wmi_send_init_country_cmd(struct ath11k 
> *ar,
>  	return ret;
>  }
> 
> +int
> +ath11k_send_twt_enable_cmd(struct ath11k *ar, u32 pdev_id)

Please add ath11k_wmi prefix to the function names defined in wmi.c. It 
is possible this is not
being strictly followed all the places but at some point of time these 
cases will be fixed.

> +{
> +	struct ath11k_pdev_wmi *wmi = ar->wmi;
> +	struct ath11k_base *ab = wmi->wmi_sc->sc;
> +	struct wmi_twt_enable_params_cmd *cmd;
> +	struct sk_buff *skb;
> +	int ret, len;
> +
> +	len = sizeof(*cmd);
> +
> +	skb = ath11k_wmi_alloc_skb(wmi->wmi_sc, len);
> +	if (!skb)
> +		return -ENOMEM;
> +
> +	cmd = (void *)skb->data;
> +	cmd->tlv_header = FIELD_PREP(WMI_TLV_TAG, WMI_TAG_TWT_ENABLE_CMD) |
> +			  FIELD_PREP(WMI_TLV_LEN, len - TLV_HDR_SIZE);
> +	cmd->pdev_id = pdev_id;
> +	cmd->sta_cong_timer_ms = 5000;
> +	/* TODO add MBSSID support */
> +	cmd->mbss_support = 0;
> +	cmd->default_slot_size = 10;
> +	cmd->congestion_thresh_setup = 50;
> +	cmd->congestion_thresh_teardown = 20;
> +	cmd->congestion_thresh_critical = 100;
> +	cmd->interference_thresh_teardown = 80;
> +	cmd->interference_thresh_setup = 50;
> +	cmd->min_no_sta_setup = 10;
> +	cmd->min_no_sta_teardown = 2;
> +	cmd->no_of_bcast_mcast_slots = 2;
> +	cmd->min_no_twt_slots = 2;
> +	cmd->max_no_sta_twt = 500;
> +	cmd->mode_check_interval = 10000;
> +	cmd->add_sta_slot_interval = 1000;
> +	cmd->remove_sta_slot_interval = 5000;

At any point do we expect any of these parameters from mac80211? Or 
these will be
just fw/hw specific default values for ever? If the former is true, we 
can probably
let mac to pass these parameters rather than filling it within wmi. 
Defining macros
for all these parameter values will provide more clarity.

Vasanth

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
