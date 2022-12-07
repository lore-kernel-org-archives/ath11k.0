Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 035BEC4708E
	for <ath11k@archiver.kernel.org>; Wed,  7 Dec 2022 14:25:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6bLE3oogp6qRWYf0lrx8Yhtve5a8La7OZzZJgOQwwuQ=; b=ntO9UgcUcG0ZZTusjufSQjAmH3
	7H71l1nMuCc69XgdSztf6EWd3nlz6LpMKqRcC4CkvxN1Py82RANlnjHyWy2IBrIlEyv5cC83P8+/s
	sIKQ2ZtIhC7BkeeWhk0cDzRMZiWeUNPSjO2kLqlUbV9rjp7tuaeDuxigv7lq9hxj/CrgUUzl2Ma58
	G/6T4+4kpifITxdEdWte+lqmmDar725Gzt+EoRx2xdAb0KS1GlHyaNkxHRORkUlnjfbDBlJfJfOtm
	t1nN+fItEhA/xbWe0brqAJbT+WiYDO32eKQ3d0WQX3rhAmsDpMX8cw1eDyhAcoVBhLqWMCzozf+O6
	yCzhkhzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2vMK-004oT0-MQ; Wed, 07 Dec 2022 14:25:16 +0000
Received: from stravinsky.debian.org ([2001:41b8:202:deb::311:108])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2vMH-004oFF-6b
	for ath11k@lists.infradead.org; Wed, 07 Dec 2022 14:25:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Eov9yMg5vnGx30TB6qkIL9b8Z7I1iUBVN2gDoOFOPiU=; b=AgtPs+Wm0e+CLyozKzjrb3MJ+q
	CVWZ6eRfiqFktAbjMTiDSaxqWWPM1pugM57gTUD5yfUg41ugUxxvAgCQtNpKYQL2HXTn8tlUGjvem
	W7t1Ot8TocpXq0aiUDsin7sR3OljTdvtxIK7aMfqwWMeujBcZ04NXygworE3aT+URy/r0HfjWfh8G
	1x3c2/Iuyva+71LW57ODRtlhcHO9fBKSBhRHgEr9NThDxutH1y2y8J2HL/AfbHS1WLRM2bnVB3nXE
	y7ktq4cNKPq4MiUdV2OwuNf49RPT45V9a3HSY15s/8BMy3F+NaVNDQbWAMRxqa9xMntY2/bsSeSt6
	p4zRKwbw==;
Received: from authenticated user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.94.2)
	(envelope-from <kibi@debian.org>)
	id 1p2vM5-00E00a-Cc; Wed, 07 Dec 2022 14:25:02 +0000
Date: Wed, 7 Dec 2022 15:24:58 +0100
From: Cyril Brulebois <kibi@debian.org>
To: Christoph Hellwig <hch@lst.de>
Cc: Kalle Valo <kvalo@kernel.org>, ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org, debian-kernel@lists.debian.org,
	debian-boot@lists.debian.org
Subject: Re: failed to insert STA entry for the AP (error -2)
Message-ID: <20221207142458.mlulpx6jts3yt72b@mraw.org>
Organization: Debian
References: <20221130122807.GA31720@lst.de>
 <87o7so4nr2.fsf@kernel.org>
 <20221130125236.GA865@lst.de>
 <87k03c4mdb.fsf@kernel.org>
 <20221130133016.GC3055@lst.de>
 <87sfhx3ap6.fsf@kernel.org>
 <20221203155227.GA13254@lst.de>
 <87cz8v2xb2.fsf@kernel.org>
 <20221207134025.GA21691@lst.de>
MIME-Version: 1.0
In-Reply-To: <20221207134025.GA21691@lst.de>
X-Debian-User: kibi
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221207_062513_294939_E2E8581F 
X-CRM114-Status: UNSURE (   9.78  )
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
Content-Type: multipart/mixed; boundary="===============2827322739129788614=="
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org


--===============2827322739129788614==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pcmiubcz63uhxe3f"
Content-Disposition: inline


--pcmiubcz63uhxe3f
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hallo Christoph,

Christoph Hellwig <hch@lst.de> (2022-12-07):
> It turns out that while d-i comes with the ath11k and ath11k_pci
> drivers, but misses the qrtr, qrtr-mki and michael_mic modules that
> are needed for the driver to actually work and not just load.

Reminds me of: https://bugs.debian.org/761902 which meant my wireless
adapter was happy with WEP but not WPA.

> Yes.  I'm not quite sure how the packages for d-i select which modules
> to include where, but given that other wifi hardware seems to work in
> the installer they must have figured this out somehow.

What modules end up in what udebs is decided in src:linux, under
debian/installer/modules.

Commit fixing the bug mentioned above:
  https://salsa.debian.org/kernel-team/linux/-/commit/782d644da7ab74e04bfeb=
d30b66c264654028da3


Cheers,
--=20
Cyril Brulebois (kibi@debian.org)            <https://debamax.com/>
D-I release manager -- Release team member -- Freelance Consultant

--pcmiubcz63uhxe3f
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEtg6/KYRFPHDXTPR4/5FK8MKzVSAFAmOQojcACgkQ/5FK8MKz
VSDkFA/6A/nAxvhQJb+QA8y2Q+wT8r3MSJcucTOf/kp52oMgjjwM4wQsgjEvUFVG
nb5oM9rlvBgm6X5oRL8+Mb5DHyNMb2roh8HK4EXn1Xy3WcPOyRKP1sTPSLx1qe9C
0h5BBZgfFayBfiU4s2eFQSArJQPRYFm8E5stZY+pwJevgaJ0jC8mOOZ2MMnau34S
5PWvR/Z86tZ+z114LcdLthi+tGPSCOHxsitmACLFMQZ5WsxZKR3WDJoZMKhu9E1M
XNhyZJ/y5IYwa5/fEgj2RzYO4ExPUVYplefMQEeHrp+xcBB9nCfyb59BJbQ1t1+S
+9Iir7K7OMMGlBA0EDCMqvUgHgQswVSvCHHEsz5lEefme54pWebDoZQ4hysYJxhq
zcQK6/1oX8phSu8sY/ZeXU5slCUMZQJjgVd5rS0gKenbE0OEYAhJAqAFBpwJ/ZzY
Xn9c8Dii9XJqlWO9c8km8bhvjn9Y7PMSo7aUsp2Uq9XHh7gV/rPQri+sIB7q6Nro
Pahee/O4wX8NEEZk16UTQS0rvqVf1ZNOKi1PrvxkDwCrtxwTq3rbhZ9z/yJhl3DS
yiZo8GWo/0Us6k+pSFPZ12O8Id2pQojm6+UKBW3EsUVEwq2v9U6O21BUngdnRIY+
sfaXRYr2c7VqeWTBVXDcW+GOKgXKAbErJA/e3HUjVwEmJQC7j+Y=
=TgTW
-----END PGP SIGNATURE-----

--pcmiubcz63uhxe3f--


--===============2827322739129788614==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k

--===============2827322739129788614==--

