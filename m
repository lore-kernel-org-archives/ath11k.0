Return-Path: <SRS0=748x=PQ=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F4CFC433F5
	for <ath11k@archiver.kernel.org>; Thu, 28 Oct 2021 05:23:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9C8946103B
	for <ath11k@archiver.kernel.org>; Thu, 28 Oct 2021 05:23:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9C8946103B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=073M7xqu6Z6n3zElJtn/eO52De1qhL1ZP192gDRb6hs=; b=SNxrFhB6pZxx5Q226Wdeh+KLx+
	kg3Vjbl9orQ3RH7ptXYp8Wm8Zu+uOS3SYO0DsIoRIgoQSabvWF6IYvWDhiSK7kYQLC9Qd2RFKQc53
	vvRy62PwU0mFYjeeJ5/n2p4CEc2lDxsiteok2TPtGMMbXLnoeb8N+X9z5ITmqAGmOSurS3DzdpFn8
	3g4xJEZY1uYvtoZRzXE6gfF73dqo8rJRxiE3GeTS9/Hv5P0EF1Xv/u4EUgV/KryhAdMGYnYNH3kns
	8iVDAjUO1CbFP7OKQjFy8lTzY51upoNvA0o7D48SuKtA8IsvxygH4yLdoLIbzQsHpIb61tHqTlT5f
	9nIfjKxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mfxtF-006tPl-UO; Thu, 28 Oct 2021 05:23:49 +0000
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mfxtA-006tOk-Fh
 for ath11k@lists.infradead.org; Thu, 28 Oct 2021 05:23:48 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1635398626; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=EVBTlUK38PAZK5v/OskJjcVaupQIXbPn9UjTbHxWtHQ=;
 b=XUH/fMGQW0g4jfemcvLwKEPFJrMXg9jP0EbtF9l2oY2MJrEMz7Xtqt/jnHBfRQwUVH1/YhPv
 BFSRy9UIRsIJm7myauJuIMMny6cO6iSAQjJVCFoTgv31Pqv583ZNuXJLQzAilRigP8QBrWjj
 IWf4g0avOFtck3MqYfItUYfIsls=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 617a33d8900d71ea1e48568e (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 28 Oct 2021 05:23:36
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 0646CC4360D; Thu, 28 Oct 2021 05:23:36 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: mpubbise)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id C5A2AC4338F;
 Thu, 28 Oct 2021 05:23:34 +0000 (UTC)
MIME-Version: 1.0
Date: Thu, 28 Oct 2021 10:53:34 +0530
From: mpubbise@codeaurora.org
To: Carl Huang <cjhuang@codeaurora.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 cjhuang=codeaurora.org@codeaurora.org
Subject: Re: [PATCH] ath11k: enable power save in station mode
In-Reply-To: <20211011190625.4463-1-cjhuang@codeaurora.org>
References: <20211011190625.4463-1-cjhuang@codeaurora.org>
Message-ID: <f4457c0027a70d996eb5930a334a9832@codeaurora.org>
X-Sender: mpubbise@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211027_222346_543457_3C9941B3 
X-CRM114-Status: GOOD (  28.73  )
X-BeenThere: ath11k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
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
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

On 2021-10-12 00:36, Carl Huang wrote:
> Enable power save in station mode.
> 
> Run "iw dev wls1 set power_save off",  check there is no NULL Data 
> frame
> from sniffer. Run "iw dev wls1 set power_save on", check there is NULL
> Data frame from sniffer.
> 
> Tested-on: QCA6390 hw2.0 PCI 
> WLAN.HST.1.0.1-01740-QCAHSTSWPLZ_V2_TO_X86-1
> 
> Signed-off-by: Carl Huang <cjhuang@codeaurora.org>
> ---
>  drivers/net/wireless/ath/ath11k/core.c |  5 ++
>  drivers/net/wireless/ath/ath11k/core.h |  1 +
>  drivers/net/wireless/ath/ath11k/hw.h   |  1 +
>  drivers/net/wireless/ath/ath11k/mac.c  | 99 
> ++++++++++++++++++++++++++++++++--
>  drivers/net/wireless/ath/ath11k/wmi.c  | 33 ++++++++++++
>  drivers/net/wireless/ath/ath11k/wmi.h  |  3 +-
>  6 files changed, 137 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath11k/core.c
> b/drivers/net/wireless/ath/ath11k/core.c
> index 6120382..7e4b5b3 100644
> --- a/drivers/net/wireless/ath/ath11k/core.c
> +++ b/drivers/net/wireless/ath/ath11k/core.c
> @@ -67,6 +67,7 @@ static const struct ath11k_hw_params 
> ath11k_hw_params[] = {
>  		.supports_monitor = true,
>  		.supports_shadow_regs = false,
>  		.idle_ps = false,
> +		.protocol_ps = false,
>  		.cold_boot_calib = true,
>  		.supports_suspend = false,
>  		.hal_desc_sz = sizeof(struct hal_rx_desc_ipq8074),
> @@ -108,6 +109,7 @@ static const struct ath11k_hw_params 
> ath11k_hw_params[] = {
>  		.supports_monitor = true,
>  		.supports_shadow_regs = false,
>  		.idle_ps = false,
> +		.protocol_ps = false,
>  		.cold_boot_calib = true,
>  		.supports_suspend = false,
>  		.hal_desc_sz = sizeof(struct hal_rx_desc_ipq8074),
> @@ -149,6 +151,7 @@ static const struct ath11k_hw_params 
> ath11k_hw_params[] = {
>  		.supports_monitor = false,
>  		.supports_shadow_regs = true,
>  		.idle_ps = true,
> +		.protocol_ps = true,
>  		.cold_boot_calib = false,
>  		.supports_suspend = true,
>  		.hal_desc_sz = sizeof(struct hal_rx_desc_ipq8074),
> @@ -187,6 +190,7 @@ static const struct ath11k_hw_params 
> ath11k_hw_params[] = {
>  		.supports_monitor = true,
>  		.supports_shadow_regs = false,
>  		.idle_ps = false,
> +		.protocol_ps = false,
>  		.cold_boot_calib = false,
>  		.supports_suspend = false,
>  		.hal_desc_sz = sizeof(struct hal_rx_desc_qcn9074),
> @@ -227,6 +231,7 @@ static const struct ath11k_hw_params 
> ath11k_hw_params[] = {
>  		.supports_monitor = false,
>  		.supports_shadow_regs = true,
>  		.idle_ps = true,
> +		.protocol_ps = true,
>  		.cold_boot_calib = false,
>  		.supports_suspend = true,
>  		.hal_desc_sz = sizeof(struct hal_rx_desc_wcn6855),
> diff --git a/drivers/net/wireless/ath/ath11k/core.h
> b/drivers/net/wireless/ath/ath11k/core.h
> index f0a4b90..61e9684 100644
> --- a/drivers/net/wireless/ath/ath11k/core.h
> +++ b/drivers/net/wireless/ath/ath11k/core.h
> @@ -276,6 +276,7 @@ struct ath11k_vif {
>  	bool is_started;
>  	bool is_up;
>  	bool spectral_enabled;
> +	bool ps;
>  	u32 aid;
>  	u8 bssid[ETH_ALEN];
>  	struct cfg80211_bitrate_mask bitrate_mask;
> diff --git a/drivers/net/wireless/ath/ath11k/hw.h
> b/drivers/net/wireless/ath/ath11k/hw.h
> index 7a5101d..d4ad6f2 100644
> --- a/drivers/net/wireless/ath/ath11k/hw.h
> +++ b/drivers/net/wireless/ath/ath11k/hw.h
> @@ -167,6 +167,7 @@ struct ath11k_hw_params {
>  	bool supports_monitor;
>  	bool supports_shadow_regs;
>  	bool idle_ps;
> +	bool protocol_ps;
>  	bool cold_boot_calib;
>  	bool supports_suspend;
>  	u32 hal_desc_sz;
> diff --git a/drivers/net/wireless/ath/ath11k/mac.c
> b/drivers/net/wireless/ath/ath11k/mac.c
> index d02823f..a254ef3 100644
> --- a/drivers/net/wireless/ath/ath11k/mac.c
> +++ b/drivers/net/wireless/ath/ath11k/mac.c
> @@ -883,12 +883,93 @@ static int ath11k_monitor_vdev_up(struct ath11k
> *ar, int vdev_id)
>  	return 0;
>  }
> 
> +static int ath11k_mac_vif_setup_ps(struct ath11k_vif *arvif)
> +{
> +	struct ath11k *ar = arvif->ar;
> +	struct ieee80211_vif *vif = arvif->vif;
> +	struct ieee80211_conf *conf = &ar->hw->conf;
> +	enum wmi_sta_powersave_param param;
> +	enum wmi_sta_ps_mode psmode;
> +	int ret;
> +	int ps_timeout;
> +	bool enable_ps;
> +
> +	lockdep_assert_held(&arvif->ar->conf_mutex);
> +
> +	if (arvif->vif->type != NL80211_IFTYPE_STATION)
> +		return 0;
> +
> +	enable_ps = arvif->ps;
> +
> +	/* need to check if multiple vdev ps setting is supported */
> +
> +	if (!arvif->is_started) {
> +		/* mac80211 can update vif powersave state while disconnected.
> +		 * Firmware doesn't behave nicely and consumes more power than
> +		 * necessary if PS is disabled on a non-started vdev. Hence
> +		 * force-enable PS for non-running vdevs.
> +		 */
> +		psmode = WMI_STA_PS_MODE_ENABLED;
> +	} else if (enable_ps) {
> +		psmode = WMI_STA_PS_MODE_ENABLED;
> +		param = WMI_STA_PS_PARAM_INACTIVITY_TIME;
> +
> +		ps_timeout = conf->dynamic_ps_timeout;
> +		if (ps_timeout == 0) {
> +			/* Firmware doesn't like 0 */
> +			ps_timeout = ieee80211_tu_to_usec(
> +				vif->bss_conf.beacon_int) / 1000;
> +		}
> +
> +		ret = ath11k_wmi_set_sta_ps_param(ar, arvif->vdev_id, param,
> +						  ps_timeout);
> +		if (ret) {
> +			ath11k_warn(ar->ab, "failed to set inactivity time for vdev %d: 
> %i\n",
> +				    arvif->vdev_id, ret);
> +			return ret;
> +		}
> +	} else {
> +		psmode = WMI_STA_PS_MODE_DISABLED;
> +	}
> +
> +	ath11k_dbg(ar->ab, ATH11K_DBG_MAC, "mac vdev %d psmode %s\n",
> +		   arvif->vdev_id, psmode ? "enable" : "disable");
> +	ret = ath11k_wmi_set_psmode(ar, arvif->vdev_id, psmode);
> +	if (ret) {
> +		ath11k_warn(ar->ab, "failed to set PS Mode %d for vdev %d: %d\n",
> +			    psmode, arvif->vdev_id, ret);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static int ath11k_config_ps(struct ath11k *ar)
> +{
> +	struct ath11k_vif *arvif;
> +	int ret = 0;
> +
> +	lockdep_assert_held(&ar->conf_mutex);
> +
> +	list_for_each_entry(arvif, &ar->arvifs, list) {
> +		ret = ath11k_mac_vif_setup_ps(arvif);
> +		if (ret) {
> +			ath11k_warn(ar->ab, "failed to setup powersave: %d\n", ret);
> +			break;
> +		}
> +	}
> +
> +	return ret;
> +}
> +
>  static int ath11k_mac_op_config(struct ieee80211_hw *hw, u32 changed)
>  {
> -	/* mac80211 requires this op to be present and that's why
> -	 * there's an empty function, this can be extended when
> -	 * required.
> -	 */
> +	struct ath11k *ar = hw->priv;
> +
> +	mutex_lock(&ar->conf_mutex);
> +	if (changed & IEEE80211_CONF_CHANGE_PS)
> +		ath11k_config_ps(ar);
> +	mutex_unlock(&ar->conf_mutex);
> 
>  	return 0;
>  }
> @@ -2610,6 +2691,16 @@ static void
> ath11k_mac_op_bss_info_changed(struct ieee80211_hw *hw,
>  		}
>  	}
> 
> +	if (changed & BSS_CHANGED_PS &&
> +	    ar->ab->hw_params.protocol_ps) {
> +		arvif->ps = vif->bss_conf.ps;
> +
> +		ret = ath11k_config_ps(ar);
> +		if (ret)
> +			ath11k_warn(ar->ab, "failed to setup ps on vdev %i: %d\n",
> +				    arvif->vdev_id, ret);
> +	}
> +
>  	if (changed & BSS_CHANGED_MCAST_RATE &&
>  	    !ath11k_mac_vif_chan(arvif->vif, &def)) {
>  		band = def.chan->band;
> diff --git a/drivers/net/wireless/ath/ath11k/wmi.c
> b/drivers/net/wireless/ath/ath11k/wmi.c
> index 27ae944..8f46864 100644
> --- a/drivers/net/wireless/ath/ath11k/wmi.c
> +++ b/drivers/net/wireless/ath/ath11k/wmi.c
> @@ -1419,6 +1419,39 @@ int ath11k_wmi_send_set_ap_ps_param_cmd(struct
> ath11k *ar, u8 *peer_addr,
>  	return ret;
>  }
> 
> +int ath11k_wmi_set_psmode(struct ath11k *ar, u32 vdev_id,
> +			  enum wmi_sta_ps_mode psmode)
> +{
> +	struct ath11k_pdev_wmi *wmi = ar->wmi;
> +	struct wmi_sta_powersave_mode_cmd *cmd;
> +	struct sk_buff *skb;
> +	int ret;
> +
> +	skb = ath11k_wmi_alloc_skb(wmi->wmi_ab, sizeof(*cmd));
> +	if (!skb)
> +		return -ENOMEM;
> +
> +	cmd = (struct wmi_sta_powersave_mode_cmd *)skb->data;
> +	cmd->tlv_header = FIELD_PREP(WMI_TLV_TAG,
> +				     WMI_TAG_STA_POWERSAVE_MODE_CMD) |
> +			  FIELD_PREP(WMI_TLV_LEN, sizeof(*cmd) - TLV_HDR_SIZE);
> +
> +	cmd->vdev_id = vdev_id;
> +	cmd->sta_ps_mode = psmode;
> +
> +	ath11k_dbg(ar->ab, ATH11K_DBG_WMI,
> +		   "WMI set sta ps vdev_id %d ps %d\n",
> +		   vdev_id, psmode);
> +
> +	ret = ath11k_wmi_cmd_send(wmi, skb, WMI_STA_POWERSAVE_MODE_CMDID);
> +	if (ret) {
> +		ath11k_warn(ar->ab, "failed to send WMI_STA_POWERSAVE_PARAM_CMDID");
> +		dev_kfree_skb(skb);
> +	}
> +
> +	return ret;
> +}

An API which does this is already present in ATH11K, you may have to 
take a look at ath11k_wmi_pdev_set_ps_mode() ?

Manikanta

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
