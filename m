Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D337C54E64
	for <ath11k@archiver.kernel.org>; Mon, 25 Mar 2024 15:43:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Sy4fjWaAdBKAu/EG3F3ubpkpdvObIYk8CjnS0nfnncU=; b=4ymgiZN6Bo1h+Dgy0iiAjj/xkk
	vXYe0pXya3vGoOMflDU3RvfRsCb1rJoO7Rhp7KtTUrt6rU7I7Ci2bgVCpQf3H8vnTUkResnToN96j
	oopnp5nohH1l8CJ0ji2gLamump4ZlqanBgDdbiimrtJHZaqfOXEKC2QEGXBozx6EB/sYdK1HnK5hQ
	voihlf+jK+mswAepBb779z1m6om+UbimnpA//sOVG+PWZrQe7yI0du9CXKvl3+JFmwIQNQOIlzxx3
	mdCXgsJwk/hyoxW+HQkRhwByRoVzpj7cb8eWrRzd36n6wYiz3csipjuPV2+Lcv6uG3U8wiUZS4q/H
	OlN3+82A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1romUH-00000000Z1D-0QB0;
	Mon, 25 Mar 2024 15:43:49 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1romUC-00000000Yyt-3bQn
	for ath11k@lists.infradead.org;
	Mon, 25 Mar 2024 15:43:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=Sy4fjWaAdBKAu/EG3F3ubpkpdvObIYk8CjnS0nfnncU=;
	t=1711381423; x=1712591023; b=UKAPQrXF8UFFB0qqu1I1uVYXF3oPCENDQOcumVDpZXpxtff
	yAAxi51PZXAi9Sjkyzvijl9ZlkL10FWG2u3mpApaZiRgyKz6SacMQs+k4UY8keuktabhiylqq+KST
	NiPq3SScYvfd1qehES2yE1dNOAWhu5rwxLydEmSfBHPcOTk0COq+Gw08O6Lu848Is7mUSrtmdOm/9
	oG/KHOCfZppu00cpdMj4alsoVIq8Q3vp/0kB3SzyYj80IYPizDJZNIgvXk5mua8vDm6lGEcnjMdzp
	eYAAGySou0MSNgzM0Sf6isjchoBdGGJfX5+DoxJBmvDnROTC4tU3iqRih/6YyUsA==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.97)
	(envelope-from <johannes@sipsolutions.net>)
	id 1romU8-0000000Dv5M-1Ce1;
	Mon, 25 Mar 2024 16:43:40 +0100
Message-ID: <d364e872eb29f03236630bab49a3243e2118ab22.camel@sipsolutions.net>
Subject: Re: [PATCH v2 1/2] wifi: cfg80211/mac80211: Add support to rx retry
 stats
From: Johannes Berg <johannes@sipsolutions.net>
To: Hari Chandrakanthan <quic_haric@quicinc.com>, ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Date: Mon, 25 Mar 2024 16:43:39 +0100
In-Reply-To: <20240319134522.4021062-2-quic_haric@quicinc.com>
References: <20240319134522.4021062-1-quic_haric@quicinc.com>
	 <20240319134522.4021062-2-quic_haric@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240325_084345_183416_F68FF4E9 
X-CRM114-Status: UNSURE (   9.98  )
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
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

On Tue, 2024-03-19 at 19:15 +0530, Hari Chandrakanthan wrote:
> Add support to count station level rx retries.

Should the subject say "for ... stats"?

> +++ b/net/mac80211/sta_info.c
> @@ -2653,6 +2653,11 @@ void sta_set_sinfo(struct sta_info *sta, struct st=
ation_info *sinfo,
>  		sinfo->filled |=3D BIT_ULL(NL80211_STA_INFO_TX_RETRIES);
>  	}
> =20
> +	if (!(sinfo->filled & BIT_ULL(NL80211_STA_INFO_RX_RETRIES))) {
> +		sinfo->rx_retries =3D sta->deflink.rx_stats.rx_retries;
> +		sinfo->filled |=3D BIT_ULL(NL80211_STA_INFO_RX_RETRIES);
> +	}

The use of deflink here seems ... questionable?

I know we've not really done any stats properly here for link STA
(patches welcome), but I guess this could be a first one that at least
sums up all the links like all of these should, and then find a way to
expose per-link as well?

Although possibly we should just expose per-link to cfg80211, and then
have cfg80211 sum up for the MLD representation...


Either way, seems odd to add something now that absolutely cannot work
for MLO?


johannes

