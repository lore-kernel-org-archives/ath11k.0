Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2B43CD4F43
	for <ath11k@archiver.kernel.org>; Fri, 22 Sep 2023 09:49:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7CftEKTuKM7cx8QQm2JrXRube82MBR9CjH5vbn5/pdk=; b=CQXbzxE9/utxEJ
	S/Tc7aY0s0IQQaggmI9iJsjAngKT0qagNnLHR9RMy2aDdHAQD/zTZw6+CzUbgXuKxDQDeArytArZA
	bBFqwFewbA5CoPjuKtv0l6hONJVvuq0Qo+zZkYM9BRtYZcYofYZss2FMhX9/NMFP2ElZwdrX+iqa+
	BwBTkpV6oXAqvm8RPKsaLrDxv9mrEatt0Aa8tbq5vxMGa152HzAU1T9e1yfprJQ0vT0F7d96Oaf27
	ZhVFU56q6Z4gM8Pg5mnEj92CotPWvAzCbk0Cd2JFgciUcH8TJsc/7ZjjO69mhOUPYK3XsFVgkJsJg
	ALvoOD2cRX3wv5JAL21g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjcmx-008dIg-0N;
	Fri, 22 Sep 2023 09:49:31 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjcmt-008dI1-21
	for ath11k@lists.infradead.org;
	Fri, 22 Sep 2023 09:49:29 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 5B0A7B81F3C
	for <ath11k@lists.infradead.org>; Fri, 22 Sep 2023 09:49:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83D33C433CA;
	Fri, 22 Sep 2023 09:49:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695376162;
	bh=2PkDm1MBm9PwOayUT8B1AXo/8GTs8ZUrZ1gkVupKLIA=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=ERvDa4x+FiQk+KW9/bcKyjBekstgDIhGC9arW4HDX2iFt41YsW420PUWBTtuz1zV0
	 gP6yBt615lK7gBy//cYNsdDRPMEZa5SDuJzWeh2m6T3XNaboGKNYZxI4Sd45LUKvms
	 B0W9UkbKMPwB/5XNJ2BybnNUbAtTbt1K61STrDovmnBMJPsn1tiHPBNGeGlM80lmNS
	 wkrJAT0o6dEoRnUdhbBHsrTORUnbDoeN40SK2FnpCQKBya4zPrCFTExKfFy/ulHHxW
	 vzYrScQ+uRsBN4YNSnAuljw/Sw/q+MDH4Ux9Y2AbDBEaxobr1XqDpkn7KMn2zv/xH/
	 dVAKf7LVG6G9A==
From: Kalle Valo <kvalo@kernel.org>
To: ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Subject: Re: [PATCH] wifi: ath11k: mac: fix struct
 ieee80211_sband_iftype_data handling
References: <20230921075440.1539515-1-kvalo@kernel.org>
Date: Fri, 22 Sep 2023 12:49:19 +0300
In-Reply-To: <20230921075440.1539515-1-kvalo@kernel.org> (Kalle Valo's message
	of "Thu, 21 Sep 2023 10:54:40 +0300")
Message-ID: <87ediqa674.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230922_024927_834292_47E8E32E 
X-CRM114-Status: GOOD (  14.59  )
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

Kalle Valo <kvalo@kernel.org> writes:

> From: Kalle Valo <quic_kvalo@quicinc.com>
>
> Commit e8c1841278a7 ("wifi: cfg80211: annotate iftype_data pointer with
> sparse") added sparse checks for struct ieee80211_sband_iftype_data handling
> which immediately found an issue in ath11k:
>
> drivers/net/wireless/ath/ath11k/mac.c:7952:22: warning: incorrect type
> in argument 1 (different address spaces)
> drivers/net/wireless/ath/ath11k/mac.c:7952:22: expected struct
> ieee80211_sta_he_cap const *he_cap
> drivers/net/wireless/ath/ath11k/mac.c:7952:22: got struct
> ieee80211_sta_he_cap const [noderef] __iftype_data *
>
> The problem here is that we are accessing sband->iftype_data directly even
> though we should use for_each_sband_iftype_data(). Now we iterate over each
> item in the array and use the correct vif type which this vif is using.
>
> Tested-on: WCN6855 hw2.0 PCI
> WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.23
>
> Reported-by: Johannes Berg <johannes@sipsolutions.net>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

[...]

> @@ -7949,7 +7951,17 @@ ath11k_mac_bitrate_mask_get_single_nss(struct ath11k *ar,
>  			return false;
>  	}
>  
> -	he_mcs_map = le16_to_cpu(ath11k_mac_get_tx_mcs_map(&sband->iftype_data->he_cap));
> +	for_each_sband_iftype_data(sband, i, iftd) {
> +		if (iftd->types_mask & BIT(arvif->vif->type)) {
> +			iftype_data = iftd;
> +			break;
> +		}
> +	}
> +
> +	if (iftype_data == NULL)
> +		return false;
> +
> +	he_mcs_map = le16_to_cpu(ath11k_mac_get_tx_mcs_map(&iftype_data->he_cap));

Johannes pointed out that I should use ieee80211_get_he_iftype_cap_vif()
instead. I'll submit v2.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
