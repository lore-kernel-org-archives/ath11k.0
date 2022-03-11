Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57ACEC433F5
	for <ath11k@archiver.kernel.org>; Fri, 11 Mar 2022 11:03:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lVshp/Ns9jFGO4v2bmKMdJu3VF25gn55uFX3g587DUg=; b=2qQkTWZpY+IXUk
	BUvp8CBbX4el7lDTNSffGF5hkayf8wR3R2DHrdkVJa/VDRdFDfkU2SwCdr04e2JMNxi+pPnJcyGjH
	J2vy/gaXOk9yW+aA15q7VuJcH/2+9Mj7oRCvRIeq1ionFOlY97xkBYLkiarr+5C5W6Jp2ouk0upjS
	iLD96EUvnj//pc55RvJuXSWM8kDpgIlx+l4ebcccij49VkhymOpnW6JqQ3Ylzdeh+39A1zqkebVnk
	KB+JBq+xJasIZEZU0KxaREWSOWfCR6ymoyS6XurajhF+oHaLnKBpVjL65rHI2UD1e+qIT8m7qe6tT
	rdwm45Hk1Bts4gdZ1MHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nSd3Y-00G9Zs-Mn; Fri, 11 Mar 2022 11:03:36 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2]
 helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nSd3W-00G9ZK-CD
 for ath11k@lists.infradead.org; Fri, 11 Mar 2022 11:03:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sipsolutions.net; s=mail; h=Content-Transfer-Encoding:MIME-Version:
 Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
 Resent-Cc:Resent-Message-ID; bh=A0Vtf0oIcOhC5jNJ0AvM/ZmbPBrz6RKmGRE+jynQMCI=; 
 t=1646996611; x=1648206211; b=hUuW/U7JdJVWd79C6Ccz/Ec8WjuHFdvRXn6YjhtqGW0Uzr/
 6y3AJ7JZV1M8/fmo2jBx2PhVQMCBsqNma18/StAD7y0PymXVbVLtSQ0D/R2tNbAoM4UGezIv4wKTD
 yCDmLvrioPmtR4ca/ro0e44t/PUH+ckBl5UL/5M27CJhfR3UVTyAuKjXPvwgchCYQzwBRFktBypSa
 SxcYQJXzpMy0tNEq3q1CVC2EJRtMBm2cRNhFek8dtPi89RCKiL8JexvoqpgVp04oSFFBfLGBNNoD4
 Hc+jjyDKGqakMoZEQsyVRmpTQNP7uASQs/EG9ALkBa+58fWaWhI0vNBz2LJeMoWg==;
Received: by sipsolutions.net with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.95) (envelope-from <johannes@sipsolutions.net>)
 id 1nSd3M-00Bsc9-Uz; Fri, 11 Mar 2022 12:03:25 +0100
Message-ID: <a517835c51a5eaf00e87fdaaef47546f70ff0d42.camel@sipsolutions.net>
Subject: Re: [PATCH 1/2] mac80211: add support to configure 6GHz non-ht
 duplicate transmission
From: Johannes Berg <johannes@sipsolutions.net>
To: Rameshkumar Sundaram <quic_ramess@quicinc.com>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org
Date: Fri, 11 Mar 2022 12:03:24 +0100
In-Reply-To: <1644914581-21682-2-git-send-email-quic_ramess@quicinc.com>
References: <1644914581-21682-1-git-send-email-quic_ramess@quicinc.com>
 <1644914581-21682-2-git-send-email-quic_ramess@quicinc.com>
User-Agent: Evolution 3.42.4 (3.42.4-1.fc35) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220311_030334_447397_F66BF0E9 
X-CRM114-Status: UNSURE (   8.97  )
X-CRM114-Notice: Please train this message.
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

Hi,

Couple of notes below:

> @@ -704,6 +704,7 @@ struct ieee80211_bss_conf {
>  	struct cfg80211_he_bss_color he_bss_color;
>  	struct ieee80211_fils_discovery fils_discovery;
>  	u32 unsol_bcast_probe_resp_interval;
> +	bool he_6g_nonht_dup_beacon_set;

This is missing documentation.
 
> +	cap = cfg80211_find_ext_elem(WLAN_EID_EXT_HE_OPERATION,
> +				     params->tail, params->tail_len);
> +	if (cap && cap->datalen >= sizeof(*he_oper) + 1) {
> +		he_oper = (void *)(cap->data + 1);
> +		he_6ghz_oper = ieee80211_he_6ghz_oper(he_oper);
> +		if (he_6ghz_oper) {
> +			sdata->vif.bss_conf.he_6g_nonht_dup_beacon_set = false;
> +			if (u8_get_bits(he_6ghz_oper->control,
> +					IEEE80211_HE_6GHZ_OPER_CTRL_DUP_BEACON)) {
> +				sdata->vif.bss_conf.he_6g_nonht_dup_beacon_set = true;
> +			}

no braces needed there, and no u8_get_bits() either, you can just & ?

> +		}
> +	}

I am wondering though if this should even be detected from the HE
operation element itself, rather than from the beacon rate settings that
are separate in nl80211?

johannes

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
