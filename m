Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 853E8C46467
	for <ath11k@archiver.kernel.org>; Thu, 19 Jan 2023 18:36:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qPVs7WQsnLILRJlhVGMSRKxCnhhIydSCoGXLRE9semA=; b=MUvMqNHryt5ML3kKZUfW5hMFo8
	lg22F0oVuI75sQv7TWmuWqGZCWU1wriF8xADoMbcFF6N/PpRjM4MeZ9LELUPlJQP6T1X9X/nIvY+l
	UIP2CXT3akG9U2Azz8NdnU623vNuJ/TtpwXaRz/kSDCJMiLTfd8vuQbesWjv2YLObvlpDL1lHgUAf
	q0yg7q0QO7B0dNggYnXK4CumRqz71R4gZQB0nty1CwuOGSYWnjqM92dAUjHSp1w0WTt3sGQy3bSMd
	G1HoKmXg5mjf0jt7Ld9tOQTqDYEQLsBIMkfGQksRf1dhW4modRYo/ZwjauA+lZlftXGwMK2UpWpgs
	ydhPnQHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIZm0-006amM-Uc; Thu, 19 Jan 2023 18:36:28 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIZlu-006akx-MX
	for ath11k@lists.infradead.org; Thu, 19 Jan 2023 18:36:24 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 4F018B8229F;
	Thu, 19 Jan 2023 18:36:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C308C433D2;
	Thu, 19 Jan 2023 18:36:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674153379;
	bh=zd/EkAAlkdTq8J7TE4rPZJX0/BqiOxjrGk4JpUHzfQk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZviGmF8HOGozsdQ7L8Oyfy/gFcyT/irK2N7YuQGF2vJKOKLOleY1EIx/qxi4ZTAiU
	 LzH+8pokS3vsMf1ZXVs+GDSxoySrnlyxOkBsUG9YS2EpQdfaDcJQ19MLf4weDs1+ow
	 l/LnufHM14Jryy7GuMA7wj0KWw8El2deZseCTS5mLL8kxtEEz9MzdpO/pMfcmtuOkC
	 KTUk5aLv+xJPOcORWQzy0cPFgI/Bc6/BNlBfhjuS94olF3GVPp56f+DmhZFrHxrJLb
	 LhVZhp+XGrlR7FSB2SjKheeyI6BVXaZj40ewX8z72nX4TAhefOND6h1EvUYU5+Z71O
	 LItcsn7Z8UfnQ==
Date: Thu, 19 Jan 2023 19:36:15 +0100
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>,
	Rameshkumar Sundaram <quic_ramess@quicinc.com>,
	ath11k@lists.infradead.org, linux-wireless@vger.kernel.org
Subject: Re: [PATCH 1/2] nl80211: add support to enable/disable bss color
 collision detection
Message-ID: <Y8mNn18XeUcEjLWe@lore-desk>
References: <20221226083328.29051-1-quic_ramess@quicinc.com>
 <20221226083328.29051-2-quic_ramess@quicinc.com>
 <74c57dc34af10537f98f5bb9b6ce80e5676e09b0.camel@sipsolutions.net>
 <1609a645-3e23-7e37-9aa1-94f970e481e2@green-communications.fr>
 <2a2332211b2ca9daa968a3644006f5c9e0c88a00.camel@sipsolutions.net>
MIME-Version: 1.0
In-Reply-To: <2a2332211b2ca9daa968a3644006f5c9e0c88a00.camel@sipsolutions.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230119_103622_908362_F6C99ADC 
X-CRM114-Status: GOOD (  14.83  )
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
Content-Type: multipart/mixed; boundary="===============7432917141313220764=="
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org


--===============7432917141313220764==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="CjbjeWRTJw133AO1"
Content-Disposition: inline


--CjbjeWRTJw133AO1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> On Thu, 2023-01-19 at 15:52 +0100, Nicolas Cavallari wrote:
> >=20
> > This may not be related, but the software color collision detection=20
> > sends a netlink message for every colliding frame and it can hose up th=
e=20
> > system if the other network is very active.
> >=20
> > Also, cfg80211_bss_color_notify() complains that the wdev lock isn't he=
ld.
>=20
> Yay.
>=20
> Lorenzo can you take a look at that?

It seems fine to me, I am just wondering if we need to forward the info to =
the
hw (if it supports hw color collision detection) if we just flip
collision_detection_enabled field in ieee80211_change_beacon().
What do you think?

Regards,
Lorenzo

>=20
> johannes

--CjbjeWRTJw133AO1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCY8mNnwAKCRA6cBh0uS2t
rF1WAQDn0Cpq8dywuxhT9abbxS+UcqmUcLXe506jMOtSe0qEgQD+ISFZ0CY7xESa
GESufErqWNSQzx08Bf2a03IvzoCfIg8=
=9anP
-----END PGP SIGNATURE-----

--CjbjeWRTJw133AO1--


--===============7432917141313220764==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k

--===============7432917141313220764==--

