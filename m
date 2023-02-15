Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B2DFC636CC
	for <ath11k@archiver.kernel.org>; Wed, 15 Feb 2023 17:35:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Uc6R+uRVenlDl3voTJSPg5PFpH6YeIFdEnri0/HWRsw=; b=ZIxTcOkxFozO2t
	Rlz4gC9pha0Bt3SLOQS/nTQ+BSjD3NUroK8R5M1r1zS5gKpusVBE+vpSj8fHN/wBqbcrJJxNVjFII
	/QoNoMKDN90yCZL3ryUSV60+7KfF3PuYaRfPDB3Gi1JSUBT7a3wujaDJAVnvritcxzoBivAd6052O
	iUlg3pxdQHZ56UZonei+S3gvCAtmqNM/Lv7+E7AHvhaBUz6kuzEXwsyoLuLMuVz+x7fArVEEz3y9E
	JYtK07W5+1e+oRNQQy+PRBOrSt4JFiM6xOM8MfiNxdLcNkwoqbDxBMBXpSfOGM1X6cFmXxhNN4T0n
	9wTNLdLhry2Eq1hQ3YIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSLgR-006i8M-PV; Wed, 15 Feb 2023 17:35:07 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSLgP-006i5m-2A
	for ath11k@lists.infradead.org; Wed, 15 Feb 2023 17:35:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=9AXJuCaXJEyUZLD5x7msrVhjTKmunuVp3q/Olzo3bto=;
	t=1676482502; x=1677692102; b=oS0ap/rv3kD6TK4X9JFBWVdVV7xorc03KwSSII98Wouex79
	U9Gzwavm8nBlIdwR8+zhJE8HxFJrMLcIRpAVKyJctUASFY9rkzx4cIHlRg/m2NN4YhjPC5rkNICIC
	5YN7EBP0GHkbDJbsXirTBQKQp0Q3N8zyKSgEKJer4IcvchW8zsJH3htIT4zRszSI2IiyYTKalFIx/
	ZxwVgUY4ZqyTfzyvsyK6neYLv0Z904RrHrkhwWp2Gm+K80G6igdOjbNgB/ysbiM0u0J+UbKRnd5ug
	f8bYXz9J2535LKAlPktOCS061ubaM4gzIYVkK9iELnAko+sUS8r0S+mNnzgyUdpg==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <johannes@sipsolutions.net>)
	id 1pSLgJ-00D9Id-0K;
	Wed, 15 Feb 2023 18:34:59 +0100
Message-ID: <65670cf42abc593502e9f7bafc56c1d0360d5631.camel@sipsolutions.net>
Subject: Re: [PATCH v3 1/3] wifi: cfg80211: add support to enable/disable
 bss color collision detection
From: Johannes Berg <johannes@sipsolutions.net>
To: Rameshkumar Sundaram <quic_ramess@quicinc.com>, 
	ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, Jouni Malinen <j@w1.fi>
Date: Wed, 15 Feb 2023 18:34:58 +0100
In-Reply-To: <20230201065638.25990-2-quic_ramess@quicinc.com>
References: <20230201065638.25990-1-quic_ramess@quicinc.com>
	 <20230201065638.25990-2-quic_ramess@quicinc.com>
User-Agent: Evolution 3.46.3 (3.46.3-1.fc37) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230215_093505_120614_9D5E367E 
X-CRM114-Status: GOOD (  11.25  )
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

On Wed, 2023-02-01 at 12:26 +0530, Rameshkumar Sundaram wrote:
> As per 802.11ax-2021, STAs shall process BSS Color Change Announcement
> (BCCA) from AP and switch to new color, but some STAs aren't processing
> BCCA from AP and not doing color switch, causing them to drop data
> frames from AP post color change.

Hmm. We had this bug in EHT. Should we really allow this? It's a station
bug, why bother?

> Provide an option to disable color collision detection and therefore
> not to do BCCA to mitigate the same from AP. If it's required in case
> where STA supports BCCA handling, then it can enabled in AP using this
> option.

This could be rewritten a bit, not entirely clear to me. "enabled" is
more like "disabled"? Or no? Confusing.

> + * @NL80211_HE_BSS_COLOR_ATTR_COLLISION_DETECTION_DISABLED: is BSS
> + * color collision detection disabled.

please use a tab to indent the second line like elsewhere

> +	he_bss_color->collision_detection_enabled =
> +		!nla_get_flag(tb[NL80211_HE_BSS_COLOR_ATTR_COLLISION_DETECTION_DISABLED]);

Is it really worth to have one side say "enabled" and the other
"disabled"?

johannes

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
