Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB871C433F5
	for <ath11k@archiver.kernel.org>; Fri, 25 Mar 2022 07:48:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QmKU1PVeXkTFqykxVZI2PTzXjrsihCaSrwekjaxx9S0=; b=EgRrdo8ZmBaCyZbFo9r4101McN
	cHELrSMzg4vQ8mTnhZwiHNdCH4dJZ3Q/xp6jIA/XZh58t9aNKGgNQc0RCIJznSkjLhmSXKRBmOFgH
	1/+wXAqMACbX+okL2W+HDr89xaTFz89ACdpI8Ckc0jZkRYzuAwmK+Jz36sA0NLc9sS9iQkIaGWXF0
	pwqvaK4JOJu65SyrKr0KvgQbroZTqpllgBeqBenTzjYfzME9MjAyGtuNc8jRD3SwJ3mO9qoNbXKSe
	1jeNKJk/qEl4PXgykq65JuhXK9EObclps6oPP7D5TWim16cFth0OjUcKqk/Vg95BnIyPvokpPq82t
	R8ege8mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nXego-001Nj8-CQ; Fri, 25 Mar 2022 07:48:54 +0000
Received: from dvalin.narfation.org ([213.160.73.56])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nXegl-001Nif-1v
 for ath11k@lists.infradead.org; Fri, 25 Mar 2022 07:48:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=narfation.org;
 s=20121; t=1648194529;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=i+P0KHJR5IxWQGQVnkvS35TIM3P98/PQ/lmJTKSZ9jo=;
 b=T2JIac/TgTqZJdCwgxlR4XNogDy6pp2IWqRCW9x+aSjY+/6lH849qZ7fz0++zpFDqV91L5
 Vl/6eqzaMqFafaln7HpPRtqCokugGTgLrKBNw3l6SHAaTzugN9kWKysnFv1ca1uQn5Y0+a
 0MdVFlMJZtiFuAYudDQ51sUYDQIbhPQ=
From: Sven Eckelmann <sven@narfation.org>
To: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org
Cc: Maharaja Kennadyrajan <quic_mkenna@quicinc.com>,
 Felix Fietkau <nbd@nbd.name>
Subject: Re: [PATCH v6 1/3] nl80211: Add support for beacon tx mode
Date: Fri, 25 Mar 2022 08:48:44 +0100
Message-ID: <4555984.c4UlCidsYr@ripper>
In-Reply-To: <20220325055949.3035053-2-quic_mkenna@quicinc.com>
References: <20220325055949.3035053-1-quic_mkenna@quicinc.com>
 <20220325055949.3035053-2-quic_mkenna@quicinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220325_004851_290006_F50D1CF2 
X-CRM114-Status: GOOD (  11.74  )
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
Content-Type: multipart/mixed; boundary="===============8685913482298862154=="
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

--===============8685913482298862154==
Content-Type: multipart/signed; boundary="nextPart6084859.M4ah1GsTNC"; micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart6084859.M4ah1GsTNC
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"; protected-headers="v1"
From: Sven Eckelmann <sven@narfation.org>
To: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org
Cc: Maharaja Kennadyrajan <quic_mkenna@quicinc.com>, Felix Fietkau <nbd@nbd.name>
Subject: Re: [PATCH v6 1/3] nl80211: Add support for beacon tx mode
Date: Fri, 25 Mar 2022 08:48:44 +0100
Message-ID: <4555984.c4UlCidsYr@ripper>
In-Reply-To: <20220325055949.3035053-2-quic_mkenna@quicinc.com>
References: <20220325055949.3035053-1-quic_mkenna@quicinc.com> <20220325055949.3035053-2-quic_mkenna@quicinc.com>

On Friday, 25 March 2022 06:59:47 CET Maharaja Kennadyrajan wrote:
> @@ -5555,6 +5558,10 @@ static int nl80211_start_ap(struct sk_buff *skb, struct genl_info *info)
>         params->dtim_period =
>                 nla_get_u32(info->attrs[NL80211_ATTR_DTIM_PERIOD]);
>  
> +       if (info->attrs[NL80211_ATTR_BEACON_TX_MODE])
> +               params->beacon_tx_mode =
> +                       nla_get_u32(info->attrs[NL80211_ATTR_BEACON_TX_MODE]);
> +
>         err = cfg80211_validate_beacon_int(rdev, dev->ieee80211_ptr->iftype,
>                                            params->beacon_interval);
>         if (err)

But why are you setting it by vif when it is actually a PHY setting? [1]


And there is also the open question from Felix [2]:

On Tuesday, 10 August 2021 16:33:41 CET Felix Fietkau wrote:
> It still seems to me like something that the driver should detect and
> handle internally without user configuration, based on number of VAPs
> and maybe multicast/beacon rate (since the packet duration issue will be
> worse with CCK rates).

Kind regards,
        Sven

[1] https://lore.kernel.org/all/2718995.X0rUDs3ZmB@ripper/
    https://lore.kernel.org/all/4581459.tLtf2NohVe@ripper/
    https://lore.kernel.org/all/6210385.n8AMQ0p90U@ripper/
    https://lore.kernel.org/all/4594028.WNQrFERZ9z@ripper/
[2] https://lore.kernel.org/all/92b48724-277c-fc48-a922-6b1d49cd6a71@nbd.name/
--nextPart6084859.M4ah1GsTNC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEF10rh2Elc9zjMuACXYcKB8Eme0YFAmI9c90ACgkQXYcKB8Em
e0Y7FRAAm3fE0tpWVdZo4Hz419mTkM4kURrTcS+8uYtS7GPSRcT9ZhdwCKV4OnV3
MIyFGSGznYUeVwTcEsNwtyac2BhmialPykapF6XHpbNK9+gaVIvCKG764mtvPOjS
TxsEPW72RnG5PjMNVvnDNAmqxNR5R5lNPG29v6HmyOCdW7FwHfXdWm6gIC+Lg88j
z5fMZixyQZr92EnNpfItH6VlTIwppjEt7bO2DX9Yqlrh7JESYF2c5BTiXxjXwKJ9
qdI6iVSfHkOwkb7iC1OlMIOmq7Vsn/+zmyrOmw87gw1wY4gIC8nn0McDjLc8lycg
7xmdOHC6afW44kJB60RUF5LCNhNxCec0Q/VVaedq59GGfj5UGrV6rDlo1Zwbr5WQ
8jnn8Y3pCJyFlsgvdF+ydfZwJpX3Go5jKYj6Ysg5iSJo1guyqrR3puU+Fb4YhH91
iT7E9JWBfYQtpLAH2bIWil0ibSKoVUEzxqIshFwvJEbfB41/DQ5aOnjIijpfPMtu
WRa977JutlN6p88lZTSQ5j36aMdU7CFLVPOFi5A8URz5HmcD8qCxofW7opiW6zBj
BYWiWCtkgrj+vUZhwcn5FfVB53EgXO//nrT7BOlP8xkDktmeEfV2c5esIgfFagQf
t4o2vzK6bOOu0omKk+eNW+DSl+0832yO2wyl0kGAScl+x8ZB820=
=kHAi
-----END PGP SIGNATURE-----

--nextPart6084859.M4ah1GsTNC--





--===============8685913482298862154==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k

--===============8685913482298862154==--




