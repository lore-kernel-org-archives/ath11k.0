Return-Path: <SRS0=KY21=OL=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04E7FC433F5
	for <ath11k@archiver.kernel.org>; Tue, 21 Sep 2021 13:26:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BCCA860F48
	for <ath11k@archiver.kernel.org>; Tue, 21 Sep 2021 13:26:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BCCA860F48
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UVi0I7rEnZIXGF7wZn3Uw6MoajmC7aLuZAX9jRxLZqw=; b=hl4EKiuRUN5nSd
	AIGg3QKKQARv2cVTWvuzL57h3x+66REi2fFOHyElbvOyI1sN5jJH2TD8Z4bQgjUmsDczOPUKyb4dq
	icKzJnZkeSW42rHSyPAiyG6LcDoESmoAeNoLi4FF7skZs2HtMIUW1YKvBiFo+ZKxqGQzdWaJ/aV7z
	m+nNetXcfcYmGvXeGpgOGtfT9M0Wy3a/fhHlnfPuA2VU6v+pxFwf2nDFyiYcfVSAhL+XJa8ucsAHY
	yLpiVBwoEELesnGeJqaIuUwiX8G2j7LmzxOumkR0sG6p309NtklCQFvu0nwTryy4e6qwWQST6cnWK
	e2uf8FWAGPqKh8crginA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mSfn9-004ZAC-06; Tue, 21 Sep 2021 13:26:35 +0000
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mSfn2-004Z9M-DI
 for ath11k@lists.infradead.org; Tue, 21 Sep 2021 13:26:33 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1632230792; h=Content-Type: MIME-Version: Message-ID:
 In-Reply-To: Date: References: Subject: Cc: To: From: Sender;
 bh=385L80Lmh0Rp5H+Ept+ZlZ/D8Oz72wDC3tYKXYHAWSQ=;
 b=QapbTFaHB7M+zMTRadVDZZz1/g8EpUagZtz6PeJDnOMrcimGmKwHkaKJmc8e74z5oYR/vK2D
 QNDXYgb5WHVqyJpPZifTMb6RUagvzG/JObwo9di0TwPoe+c5+0m8UfIwEbM6sNhQfiYT+maR
 G17oQbAUCOyX3dbKOzYhNxYW3Ng=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 6149dd80ec62f57c9a569a3c (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 21 Sep 2021 13:26:24
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 4548AC4360D; Tue, 21 Sep 2021 13:26:23 +0000 (UTC)
Received: from tykki (tynnyri.adurom.net [51.15.11.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id F1B19C4338F;
 Tue, 21 Sep 2021 13:26:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org F1B19C4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
From: Kalle Valo <kvalo@codeaurora.org>
To: Jouni Malinen <jouni@codeaurora.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 Seevalamuthu Mariappan <seevalam@codeaurora.org>,
 Miles Hu <milehu@codeaurora.org>,
 Vasanthakumar Thiagarajan <vthiagar@codeaurora.org>
Subject: Re: [PATCH 2/3] ath11k: add separate APIs for monitor mode
References: <20210721162053.46290-1-jouni@codeaurora.org>
 <20210721162053.46290-3-jouni@codeaurora.org>
Date: Tue, 21 Sep 2021 16:26:17 +0300
In-Reply-To: <20210721162053.46290-3-jouni@codeaurora.org> (Jouni Malinen's
 message of "Wed, 21 Jul 2021 19:20:52 +0300")
Message-ID: <877dfaukjq.fsf@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210921_062632_189670_1591A795 
X-CRM114-Status: GOOD (  27.62  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Jouni Malinen <jouni@codeaurora.org> writes:

> From: Seevalamuthu Mariappan <seevalam@codeaurora.org>
>
> Add separate APIs for monitor_vdev_create/monitor_vdev_delete
> and monitor_vdev_start/monitor_vdev_stop.
>
> Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.4.0.1-01725-QCAHKSWPL_SILICONZ-1
>
> Co-developed-by: Miles Hu <milehu@codeaurora.org>
> Signed-off-by: Miles Hu <milehu@codeaurora.org>
> Co-developed-by: Vasanthakumar Thiagarajan <vthiagar@codeaurora.org>
> Signed-off-by: Vasanthakumar Thiagarajan <vthiagar@codeaurora.org>
> Signed-off-by: Seevalamuthu Mariappan <seevalam@codeaurora.org>
> Signed-off-by: Jouni Malinen <jouni@codeaurora.org>
> ---
>  drivers/net/wireless/ath/ath11k/core.h |   5 +-
>  drivers/net/wireless/ath/ath11k/mac.c  | 313 ++++++++++++++++++++++++-
>  2 files changed, 312 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/net/wireless/ath/ath11k/core.h b/drivers/net/wireless/ath/ath11k/core.h
> index 6a6cabdd3e30..3cddab695031 100644
> --- a/drivers/net/wireless/ath/ath11k/core.h
> +++ b/drivers/net/wireless/ath/ath11k/core.h
> @@ -488,7 +488,8 @@ struct ath11k {
>  	u32 chan_tx_pwr;
>  	u32 num_stations;
>  	u32 max_num_stations;
> -	bool monitor_present;
> +	bool monitor_conf_enabled;
> +	bool monitor_started;
>  	/* To synchronize concurrent synchronous mac80211 callback operations,
>  	 * concurrent debugfs configuration and concurrent FW statistics events.
>  	 */
> @@ -563,6 +564,7 @@ struct ath11k {
>  	struct ath11k_per_peer_tx_stats cached_stats;
>  	u32 last_ppdu_id;
>  	u32 cached_ppdu_id;
> +	int monitor_vdev_id;
>  #ifdef CONFIG_ATH11K_DEBUGFS
>  	struct ath11k_debug debug;
>  #endif
> @@ -571,6 +573,7 @@ struct ath11k {
>  #endif
>  	bool dfs_block_radar_events;
>  	struct ath11k_thermal thermal;
> +	bool monitor_vdev_created;
>  };
>  
>  struct ath11k_band_cap {
> diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
> index 3fd9a79801cb..e446817ac8b0 100644
> --- a/drivers/net/wireless/ath/ath11k/mac.c
> +++ b/drivers/net/wireless/ath/ath11k/mac.c
> @@ -745,14 +745,314 @@ static inline int ath11k_mac_vdev_setup_sync(struct ath11k *ar)
>  	return ar->last_wmi_vdev_start_status ? -EINVAL : 0;
>  }
>  
> -static int ath11k_mac_op_config(struct ieee80211_hw *hw, u32 changed)
> +static void
> +ath11k_mac_get_any_chandef_iter(struct ieee80211_hw *hw,
> +				struct ieee80211_chanctx_conf *conf,
> +				void *data)
>  {
> -	/* mac80211 requires this op to be present and that's why
> -	 * there's an empty function, this can be extended when
> -	 * required.
> -	 */
> +	struct cfg80211_chan_def **def = data;
> +
> +	*def = &conf->def;
> +}
> +
> +static int ath11k_mac_monitor_vdev_start(struct ath11k *ar, int vdev_id,
> +					 struct cfg80211_chan_def *chandef)
> +{
> +	struct ieee80211_channel *channel;
> +	struct wmi_vdev_start_req_arg arg = {};
> +	int ret;
> +
> +	lockdep_assert_held(&ar->conf_mutex);
> +
> +	channel = chandef->chan;
> +
> +	arg.vdev_id = vdev_id;
> +	arg.channel.freq = channel->center_freq;
> +	arg.channel.band_center_freq1 = chandef->center_freq1;
> +	arg.channel.band_center_freq2 = chandef->center_freq2;
> +
> +	arg.channel.mode = ath11k_phymodes[chandef->chan->band][chandef->width];
> +	arg.channel.chan_radar =
> +			!!(channel->flags & IEEE80211_CHAN_RADAR);
> +
> +	arg.channel.min_power = 0;
> +	arg.channel.max_power = channel->max_power * 2;
> +	arg.channel.max_reg_power = channel->max_reg_power * 2;
> +	arg.channel.max_antenna_gain = channel->max_antenna_gain * 2;
> +
> +	arg.pref_tx_streams = ar->num_tx_chains;
> +	arg.pref_rx_streams = ar->num_rx_chains;
> +
> +	arg.channel.passive = !!(chandef->chan->flags & IEEE80211_CHAN_NO_IR);
> +
> +	reinit_completion(&ar->vdev_setup_done);
> +	reinit_completion(&ar->vdev_delete_done);
>  
> +	ret = ath11k_wmi_vdev_start(ar, &arg, false);
> +	if (ret) {
> +		ath11k_warn(ar->ab, "failed to request monitor vdev %i start: %d\n",
> +			    vdev_id, ret);
> +		return ret;
> +	}
> +	ret = ath11k_mac_vdev_setup_sync(ar);
> +	if (ret) {
> +		ath11k_warn(ar->ab, "failed to synchronize setup for monitor vdev %i start: %d\n",
> +			    vdev_id, ret);
> +		return ret;
> +	}
> +	ret = ath11k_wmi_vdev_up(ar, vdev_id, 0, ar->mac_addr);
> +	if (ret) {
> +		ath11k_warn(ar->ab, "failed to put up monitor vdev %i: %d\n",
> +			    vdev_id, ret);
> +		goto vdev_stop;
> +	}
> +	ath11k_dbg(ar->ab, ATH11K_DBG_MAC, "mac monitor vdev %i started\n",
> +		   vdev_id);
>  	return 0;
> +
> +vdev_stop:
> +	reinit_completion(&ar->vdev_setup_done);
> +
> +	ret = ath11k_wmi_vdev_stop(ar, vdev_id);
> +	if (ret) {
> +		ath11k_warn(ar->ab, "failed to stop monitor vdev %i after start failure: %d\n",
> +			    vdev_id, ret);
> +		return ret;
> +	}
> +
> +	ret = ath11k_mac_vdev_setup_sync(ar);
> +	if (ret)
> +		ath11k_warn(ar->ab, "failed to synchronize setup for vdev %i stop: %d\n",
> +			    vdev_id, ret);

I added return ret here for consistency..

> +	return ret;

I don't thinks this is right, in an error path (vdev_stop label) we
return 0? I changed this to -EIO.

> +static int ath11k_mac_monitor_vdev_stop(struct ath11k *ar)
> +{
> +	int ret;
> +
> +	lockdep_assert_held(&ar->conf_mutex);
> +
> +	reinit_completion(&ar->vdev_setup_done);
> +
> +	ret = ath11k_wmi_vdev_stop(ar, ar->monitor_vdev_id);
> +	if (ret)
> +		ath11k_warn(ar->ab, "failed to request monitor vdev %i stop: %d\n",
> +			    ar->monitor_vdev_id, ret);
> +
> +	ret = ath11k_mac_vdev_setup_sync(ar);
> +	if (ret)
> +		ath11k_warn(ar->ab, "failed to synchronize monitor vdev %i stop: %d\n",
> +			    ar->monitor_vdev_id, ret);
> +
> +	ret = ath11k_wmi_vdev_down(ar, ar->monitor_vdev_id);
> +	if (ret)
> +		ath11k_warn(ar->ab, "failed to put down monitor vdev %i: %d\n",
> +			    ar->monitor_vdev_id, ret);
> +
> +	ath11k_dbg(ar->ab, ATH11K_DBG_MAC, "mac monitor vdev %i stopped\n",
> +		   ar->monitor_vdev_id);
> +	return ret;
> +}

I was not sure what's the idea of error path handling here, we print
warnings but still continue the normal execution. I changed this so that
we bail out in the first error and if everything goes well we return 0.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
