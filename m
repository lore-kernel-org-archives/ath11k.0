Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from a27-21.smtp-out.us-west-2.amazonses.com ([54.240.27.21])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kFWvC-0000mj-78
 for ath11k@lists.infradead.org; Tue, 08 Sep 2020 06:16:03 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH V5 5/5] ath11k: add support for BSS coloring
References: <20200826055650.1101224-1-john@phrozen.org>
 <20200826055650.1101224-5-john@phrozen.org>
Date: Tue, 8 Sep 2020 06:15:59 +0000
In-Reply-To: <20200826055650.1101224-5-john@phrozen.org> (John Crispin's
 message of "Wed, 26 Aug 2020 07:56:50 +0200")
Message-ID: <010101746c5b565e-df2c005c-72cd-4931-9f27-841e928e3a59-000000@us-west-2.amazonses.com>
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
To: John Crispin <john@phrozen.org>
Cc: Johannes Berg <johannes@sipsolutions.net>, linux-wireless@vger.kernel.org, ath11k@lists.infradead.org

John Crispin <john@phrozen.org> writes:

> Whenever the MAC detects a color collision or any of its associated station
> detects one the FW will send out an event. Add the code to parse and handle
> this event. and pass the data up to mac80211.
>
> The FW does not provide an offload feature such as the one used for CSA. The
> color change process is hence triggered via the beacon offload tx completion events
> sent out by the FW.
>
> Signed-off-by: John Crispin <john@phrozen.org>

Tested-on tag missing.

I wonder if QCA6390 supports this and are there any regressions, do you
know?

> @@ -2076,6 +2092,24 @@ static void ath11k_mac_op_bss_info_changed(struct ieee80211_hw *hw,
>  			if (ret)
>  				ath11k_warn(ar->ab, "failed to set bss color collision on vdev %i: %d\n",
>  					    arvif->vdev_id,  ret);
> +
> +			param_id = WMI_VDEV_PARAM_BSS_COLOR;
> +			if (info->he_bss_color.enabled)
> +				param_value = info->he_bss_color.color <<
> +						IEEE80211_HE_OPERATION_BSS_COLOR_OFFSET;
> +			else
> +				param_value = IEEE80211_HE_OPERATION_BSS_COLOR_DISABLED;
> +
> +			ret = ath11k_wmi_vdev_set_param_cmd(ar, arvif->vdev_id,
> +							    param_id,
> +							    param_value);
> +			if (ret)
> +				ath11k_warn(ar->ab,
> +					    "failed to set bss color param on vdev %i: %d\n",
> +					    arvif->vdev_id,  ret);
> +
> +			ath11k_info(ar->ab, "bss color param 0x%x set on vdev %i\n",
> +				    param_value, arvif->vdev_id);

Shouldn't this be a debug message?

> @@ -6083,6 +6117,7 @@ static int __ath11k_mac_register(struct ath11k *ar)
>  
>  	wiphy_ext_feature_set(ar->hw->wiphy, NL80211_EXT_FEATURE_CQM_RSSI_LIST);
>  	wiphy_ext_feature_set(ar->hw->wiphy, NL80211_EXT_FEATURE_STA_TX_PWR);
> +	wiphy_ext_feature_set(ar->hw->wiphy, NL80211_EXT_FEATURE_BSS_COLOR);

So my QCA6390 question above is should we enable this for all hardware
or just for IPQ8074? If the latter, we should add a boolean to
hw_params. Or does the firmware advertise if it supports this feature?

-- 
https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
