Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D1C2C433EF
	for <ath11k@archiver.kernel.org>; Fri,  1 Jul 2022 08:59:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nbktl/vurU3AlxaeEvvNn4qZVB4rB+HjJSr1kePSOKg=; b=Gw56b78kg/QUQ6
	JrLnpXTP9Dqdchf2XoW9vJr/eAF5mX8jP/12Vxdo0jMy+vS6Al/UDkroVw3h6xYfC75QBYJKnOv+Y
	oUIgixqbbnI6VE+CH6G57Kmu/JtJNhBda/TTuHT1kQokrbcPKpaJrQncy0BwgDCWrEfhm0CZFXynh
	6nncmRqPkaIx3JaPeFP7O5qD8f2he4KZTxOfEoownTIDtjEJu73ardPDx7Go4jY/0/HUcBGSB81ob
	ivJ5z23wtnK47dJDTw40t+O9JzuiXyc0Gno8/WThYXX08Jt6+PsQuygaXuedvn3/PHEBnPrGatkIa
	YsVoRpKK5JmdDGPVMS5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o7CVI-003kFQ-SB; Fri, 01 Jul 2022 08:59:56 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o7CVF-003kDH-OV
	for ath11k@lists.infradead.org; Fri, 01 Jul 2022 08:59:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=LZtVh6oV5lQ8M0xdYOnbzEWyA02biSUYiwH2l9S4o4M=;
	t=1656665989; x=1657875589; b=aH8JeeoJ5Y3E/FQ7TkxY6qcMJBS8L3tACiqxfY2YADLkk8y
	imL0LeL3a/sAfjZ/FhluXV0P+r0qhQK5DQ/Zk7kpLFjOeH1qCPkueW/BuFlSw3HXmMKXzfRusJ8Vg
	hNNrkKjioHxo5bQ87sEYaf80UGDbxccySIREL327evCggsIdpggbKYF7r0MXtRhWiaVW8lov4w4mi
	ZlPMQ3OzZOsBnrlusL0UPVBeD2sOOaFKYcbASIzJxT7julhgtysGhYkRMJm71Q18Va0YFzWigrn7r
	u7mJNSTxf2BTKjlkqr2FiIBvNO5Ld/zTmVs5lwPMmOLZ8N17d09iQElo+IXSaHVg==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.95)
	(envelope-from <johannes@sipsolutions.net>)
	id 1o7CV6-003PZI-Ge;
	Fri, 01 Jul 2022 10:59:44 +0200
Message-ID: <3163fef05bde096540020e58a93003c6048d9a0b.camel@sipsolutions.net>
Subject: Re: [PATCH 1/9] mac80211: generate EMA beacons in AP mode
From: Johannes Berg <johannes@sipsolutions.net>
To: Aloka Dixit <quic_alokad@quicinc.com>, linux-wireless@vger.kernel.org, 
	ath11k@lists.infradead.org
Cc: John Crispin <john@phrozen.org>
Date: Fri, 01 Jul 2022 10:59:43 +0200
In-Reply-To: <20220523060108.23982-2-quic_alokad@quicinc.com>
References: <20220523060108.23982-1-quic_alokad@quicinc.com>
	 <20220523060108.23982-2-quic_alokad@quicinc.com>
User-Agent: Evolution 3.44.2 (3.44.2-1.fc36) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220701_015954_123984_2CEB71FF 
X-CRM114-Status: GOOD (  16.09  )
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

> 
> +++ b/include/net/mac80211.h
> @@ -5050,6 +5050,83 @@ ieee80211_beacon_get_template(struct ieee80211_hw *hw,
>  			      struct ieee80211_vif *vif,
>  			      struct ieee80211_mutable_offsets *offs);
>  
> +/**
> + * This macro should be used to get total length for all MBSSID elements
> + * in the beacon, and also to generate a single beacon template with
> + * all MBSSID elements.
> + */
> +#define IEEE80211_MBSSID_ELEMS_ALL -1

Not sure where the driver should use this? Why is it defined in the
driver API?

> + * @ema_index: index of the beacon in the EMA set, should be more than
> + *	IEEE80211_MBSSID_ELEMS_ALL otherwise the set/get functions include all
> + *	MBSSID elements in a single beacon template.

The parameter is a u8 so it cannot be negative anyway ...?

> +struct sk_buff *
> +ieee80211_beacon_get_template_ema_index(struct ieee80211_hw *hw,
> +					struct ieee80211_vif *vif,
> +					struct ieee80211_mutable_offsets *offs,
> +					u8 ema_index);

here ^^

>  static inline int
> -ieee80211_get_mbssid_beacon_len(struct cfg80211_mbssid_elems *elems)
> +ieee80211_get_mbssid_beacon_len(struct cfg80211_mbssid_elems *elems, int i)
>  {
> -	int i, len = 0;
> +	int len = 0;
>  
>  	if (!elems)
>  		return 0;
> +	else if (i < IEEE80211_MBSSID_ELEMS_ALL || i >= elems->cnt)
> +		return -1;

-1 is a strange return value (it means -EPERM but you didn't say it);
maybe use -EINVAL?

> @@ -5059,7 +5065,8 @@ ieee80211_beacon_get_ap(struct ieee80211_hw *hw,
>  			struct ieee80211_mutable_offsets *offs,
>  			bool is_template,
>  			struct beacon_data *beacon,
> -			struct ieee80211_chanctx_conf *chanctx_conf)
> +			struct ieee80211_chanctx_conf *chanctx_conf,
> +			int ema_index)

A lot of this stuff is now conflicting with MLO work, so also needs a
rebase.

> -	mbssid_len = ieee80211_get_mbssid_beacon_len(beacon->mbssid_ies);
> +	mbssid_len = ieee80211_get_mbssid_beacon_len(beacon->mbssid_ies,
> +						     ema_index);
> +	if (mbssid_len == -1)

< 0 then here

> +static void
> +ieee80211_beacon_get_ap_ema_list(struct ieee80211_hw *hw,
> +				 struct ieee80211_vif *vif,
> +				 struct ieee80211_mutable_offsets *offs,
> +				 bool is_template, struct beacon_data *beacon,
> +				 struct ieee80211_chanctx_conf *chanctx_conf,
> +				 struct ieee80211_ema_beacons **ema_beacons)

The API here is weird, why not *return* what goes into *ema_beacons?

> +struct ieee80211_ema_beacons *
> +ieee80211_beacon_get_template_ema_list(struct ieee80211_hw *hw,
> +				       struct ieee80211_vif *vif)
> +{
> +	struct ieee80211_ema_beacons *ema_beacons = NULL;
> +	(void)__ieee80211_beacon_get(hw, vif, NULL, false, 0, &ema_beacons);
> +	return ema_beacons;


couple of blank lines would be nice, and maybe check the return value
and WARN_ON() it not being NULL? It should be NULL in this case, I
think?

johannes

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
