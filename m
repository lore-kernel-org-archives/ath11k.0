Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23B3EC00A5A
	for <ath11k@archiver.kernel.org>; Thu, 19 Jan 2023 13:52:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vfy5wdf07PIDYqZXNJfaMh2ON4kvXlmLEzYhtkLEfvs=; b=rxibS1Ktwdd4t8
	um0IoTIybi6OHl+2XE5Q4JKFTf7VE/g4pDWy/4aAfKwhFzcKZSxJ8c638V+UIFdrz3oz0AomNx1Vs
	gBKYFqxuBdWMzpdz9Ea42ydpP0+7dhNImpYGT+DBfXvUqh0qnzxafdnNv7F1YFGZyfC6ycB9xT4xM
	EovIS5MlPqj+v2LFVApljLhdsucKVm0HsILeVcL7ZBiEruKiqkn1/qV7E6UwmufYsVcJtc123XSdT
	QLQqpJlFkOD5s2+R7KZ2Z6q1d69e8zNKXZF58WtzxAfTwcNsgGXNrXK5VZ6tD/0Rr3Oj7Gf5wbYk6
	Iu620dTZDHBiI9mC9hHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIVLC-005BQY-Dd; Thu, 19 Jan 2023 13:52:30 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIVL9-005BPs-3w
	for ath11k@lists.infradead.org; Thu, 19 Jan 2023 13:52:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=OYaztwbDjJ1zliWadywF2Ok5tW1vKI1JRqnRQkYB+Tg=;
	t=1674136340; x=1675345940; b=Tt2k8XmG2gFOkNHaaEK6ghXBBVyg6WmVDh7+MVm+MQEpQZU
	24sqUsxD1rntgvFeXxS6Cd6RdTn5WfvVVVhzfuIaxq3G2VxL7PVNg/GbKsK12Orz6Tkx+LBq3sj0B
	sVpQ+1NkvSKX8bbZmzs7rADakt5egD72FYc+J5Em3Vo4RBV0A8WdOYxT2jwsomkdIInLjFHynGKqk
	hYxEvXMHRD1C9hiBEzj87PEzWSaoAFGWbQ200uKsaGF9DxR8wJAuARxiEzaNJuoFOQYBXyccC+IFu
	E8LsnVLz1sYX3AAFQU+z2rXCs9a/xOFVcuu0Ym0gbAXIcTSfCywWKeHGTe68DsXw==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <johannes@sipsolutions.net>)
	id 1pIVKx-006WwJ-2P;
	Thu, 19 Jan 2023 14:52:15 +0100
Message-ID: <0881ee1d0ae43ae18ab4b71ec8b5fd62263bbb69.camel@sipsolutions.net>
Subject: Re: [PATCH] wifi: cfg80211: call reg_notifier for self managed
 wiphy from driver hint
From: Johannes Berg <johannes@sipsolutions.net>
To: Wen Gong <quic_wgong@quicinc.com>, ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Date: Thu, 19 Jan 2023 14:52:14 +0100
In-Reply-To: <20221214093937.14987-1-quic_wgong@quicinc.com>
References: <20221214093937.14987-1-quic_wgong@quicinc.com>
User-Agent: Evolution 3.46.3 (3.46.3-1.fc37) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230119_055227_199106_6FB251B1 
X-CRM114-Status: GOOD (  13.66  )
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

On Wed, 2022-12-14 at 04:39 -0500, Wen Gong wrote:
> Currently the regulatory driver does not call the regulatory callback
> reg_notifier for self managed wiphys. Sometimes driver needs cfg80211
> to calculate the info of ieee80211_channel such as flags and power,
> and driver needs to get the info of ieee80211_channel after hint of
> driver, but driver does not know when calculation of the info of
> ieee80211_channel become finished, so add notify to driver after
> reg_process_self_managed_hint() from cfg80211 is a good way, then
> driver could get the correct info in callback of reg_notifier.

Seems reasonable - but maybe unexpected to some drivers, perhaps it
should be opt-in?

Though I guess not many drivers actually use this infrastructure in the
first place?

> @@ -3095,6 +3107,13 @@ static void notify_self_managed_wiphys(struct regulatory_request *request)
>  		if (wiphy->regulatory_flags & REGULATORY_WIPHY_SELF_MANAGED &&
>  		    request->initiator == NL80211_REGDOM_SET_BY_USER)
>  			reg_call_notifier(wiphy, request);
> +
> +		if (wiphy->regulatory_flags & REGULATORY_WIPHY_SELF_MANAGED &&
> +		    request->initiator == NL80211_REGDOM_SET_BY_DRIVER &&
> +		    request->wiphy_idx == get_wiphy_idx(wiphy)) {
> +			reg_call_notifier(wiphy, request);
> +			request->wiphy_idx = WIPHY_IDX_INVALID;
> +		}

Why set the request->wiphy_idx here? Should this even go through
reg_process_pending_hints() at all?

> +	driver_request = kzalloc(sizeof(struct regulatory_request), GFP_KERNEL);
> +	if (!driver_request)
> +		return;
> +
> +	memcpy(driver_request, &request, sizeof(*driver_request));

kmemdup()?

> +	queue_regulatory_request(driver_request);

But again not sure you should do this, rather than calling the notifier
directly?

I mean, you could just do reg_call_notifier() here, it's already async?

johannes


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
