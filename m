Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from so254-54.mailgun.net ([198.61.254.54])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kJE5q-00084e-Ns
 for ath11k@lists.infradead.org; Fri, 18 Sep 2020 10:58:20 +0000
MIME-Version: 1.0
Date: Fri, 18 Sep 2020 18:58:13 +0800
From: Wen Gong <wgong@codeaurora.org>
Subject: Re: [PATCH V2] ath11k: add tx hw 802.11 encapusaltion offloading
 support
In-Reply-To: <20200430152814.18481-1-john@phrozen.org>
References: <20200430152814.18481-1-john@phrozen.org>
Message-ID: <0b4abf6c2b7408664cacff5392902720@codeaurora.org>
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
Cc: linux-wireless-owner@vger.kernel.org, linux-wireless@vger.kernel.org, ath11k@lists.infradead.org, Kalle Valo <kvalo@codeaurora.org>, Shashidhar Lakkavalli <slakkavalli@datto.com>

On 2020-04-30 23:28, John Crispin wrote:
> This patch adds support for ethernet rxtx mode to the driver. The 
> feature
> is enabled via a new module parameter. If enabled to driver will enable
> the feature on a per vif basis if all other requirements were met.
> 
[...]
> @@ -4339,7 +4352,22 @@ static int ath11k_mac_op_add_interface(struct
> ieee80211_hw *hw,
>  	spin_unlock_bh(&ar->data_lock);
> 
>  	param_id = WMI_VDEV_PARAM_TX_ENCAP_TYPE;
> -	param_value = ATH11K_HW_TXRX_NATIVE_WIFI;
> +	if (ath11k_ath11k_frame_mode == ATH11K_HW_TXRX_ETHERNET)
> +		switch (vif->type) {
> +		case NL80211_IFTYPE_STATION:
> +		case NL80211_IFTYPE_AP_VLAN:
> +		case NL80211_IFTYPE_AP:
> +			hw_encap = 1;
> +			break;
> +		default:
> +			break;
> +		}
> +
> +	if (ieee80211_set_hw_80211_encap(vif, hw_encap))
I see ieee80211_set_hw_80211_encap have check like this:
if (key->conf.cipher == WLAN_CIPHER_SUITE_TKIP)
         enable = false;

so is it beeter to call it after associated/install key?
> +		param_value = ATH11K_HW_TXRX_ETHERNET;
> +	else
> +		param_value = ATH11K_HW_TXRX_NATIVE_WIFI;
> +
>  	ret = ath11k_wmi_vdev_set_param_cmd(ar, arvif->vdev_id,
>  					    param_id, param_value);
>  	if (ret) {

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
