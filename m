Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kUbmU-0004gR-BC
 for ath11k@lists.infradead.org; Mon, 19 Oct 2020 20:29:23 +0000
Received: by mail-pl1-x644.google.com with SMTP id 1so410258ple.2
 for <ath11k@lists.infradead.org>; Mon, 19 Oct 2020 13:29:20 -0700 (PDT)
Subject: Re: [PATCH 1/4] mac80211: save HE oper info in BSS config for mesh
References: <20201009021811.18584-1-pradeepc@codeaurora.org>
 <20201009021811.18584-2-pradeepc@codeaurora.org>
From: Peter Oh <peter.oh@eero.com>
Message-ID: <cc254230-5909-b77a-8c13-2c769a618660@eero.com>
Date: Mon, 19 Oct 2020 13:29:15 -0700
MIME-Version: 1.0
In-Reply-To: <20201009021811.18584-2-pradeepc@codeaurora.org>
Content-Language: en-US
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
To: Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>, Johannes Berg <johannes@sipsolutions.net>, ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org


> +static void
> +ieee80211_mesh_update_bss_params(struct ieee80211_sub_if_data *sdata,
> +				 u8 *ie, u8 ie_len)
> +{
> +	struct ieee80211_supported_band *sband;
> +	const u8 *cap;
> +	const struct ieee80211_he_operation *he_oper = NULL;
> +
> +	sband = ieee80211_get_sband(sdata);
> +	if (!sband)
> +		return;
> +
> +	if (ieee80211_get_he_iftype_cap(sband, NL80211_IFTYPE_MESH_POINT) &&
> +	    !(sdata->vif.bss_conf.chandef.width == NL80211_CHAN_WIDTH_20_NOHT ||
> +	    sdata->vif.bss_conf.chandef.width == NL80211_CHAN_WIDTH_5 ||
> +	    sdata->vif.bss_conf.chandef.width == NL80211_CHAN_WIDTH_10))
> +		return;

Are you update BSS only for sub-20Mhz?

Shouldn't you remove "!" for 20~160Mhz?


Thanks,

Peter


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
