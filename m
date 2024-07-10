Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A020C3DA42
	for <ath11k@archiver.kernel.org>; Wed, 10 Jul 2024 11:16:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7rDLfdZIW4szr4ve1qX7Pygti+jIVBH+W47FrJHTUlU=; b=UQh+dLPWiBOTjXs81GQ0qkGjFe
	6VHsNMbnNefa0fWoxdQrkCDSvx0fpXGHuF2tu6lgRD7auhSlgpunkk3+FcAOAKuOXaukBQqmSx7EA
	QVufABiJmM/L9b+1auROZg/i/8W9wDiYIhYWSsHI6F52PgC3kUPtxAOxiS9HjpWvF0Hw3TFPgISMl
	2IXTfrfXEKZ8V/vTF23mHa6QM4Pi2vRPH4tcY9bvoU0wiP9m2dLkGk3zKk9YBKfgqNByF72low/Yj
	6/0EtnKIhk2KOPMWDzDN/j1nm6Bp1Bs7c4V7PmxsCcnNRgJ6ZMH4MJgCWN5SAUdquNRbstSro9SRH
	imRbzjsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRVJX-0000000AL4Y-3lQj;
	Wed, 10 Jul 2024 11:16:47 +0000
Received: from mout.kundenserver.de ([212.227.126.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRVJU-0000000AL1v-2BSc
	for ath11k@lists.infradead.org;
	Wed, 10 Jul 2024 11:16:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=azg-tech.com;
	s=s1-ionos; t=1720610200; x=1721215000;
	i=stefan.zegenhagen@azg-tech.com;
	bh=7rDLfdZIW4szr4ve1qX7Pygti+jIVBH+W47FrJHTUlU=;
	h=X-UI-Sender-Class:Message-ID:Subject:From:To:Cc:Date:In-Reply-To:
	 References:Content-Type:Content-Transfer-Encoding:MIME-Version:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=na9dwjitmaWJwuvtFCz7YS86ijcq1QKgjxlO4SOoJ9+Ghe1jTvtv28PxDm9AOODy
	 p2NuYQepnuxfT+pvkxXR2JiSFbk1kAyJ1RfIE+yt4ewifpoxXZMgLWUhz/ietiYWU
	 idvjxUDGLgqp4VHaITb+t/Zur8Nz9/3LGxt5yvPofT6cpzPlE8olUN2beKAkw+QdN
	 jZ0r/mmKpwFjPZBm4kM8T6t7R1TKJcr3iW4se3JEtH7L0pqHi1snT/VnAZscQzE8S
	 w7+3YShjQge2LMABPrh/mK1nUzMiO9ccPHczbpWsbXRh+LvfBPFrAPYkn3xb/A0JV
	 1h0EZLF6r7OmgLMIIQ==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from [10.10.4.93] ([217.91.114.181]) by mrelayeu.kundenserver.de
 (mreue012 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1N3Gok-1sIBuE0Y1S-012RNX; Wed, 10 Jul 2024 13:16:40 +0200
Message-ID: <210aa4455308a531fc118a6c60d7b5b2ab300257.camel@azg-tech.com>
Subject: Re: ath11k: IPQ6018: support for 802.11s MESH
From: Stefan Zegenhagen <stefan.zegenhagen@azg-tech.com>
To: Kalle Valo <kvalo@kernel.org>
Cc: ath11k@lists.infradead.org
Date: Wed, 10 Jul 2024 13:16:39 +0200
In-Reply-To: <87cynlbk8p.fsf@kernel.org>
References: <3581dfd05dd3468d97b3fd06072d206732da9482.camel@azg-tech.com>
	 <87frsjdhzn.fsf@kernel.org>
	 <196d7fb9f411cbfad0c8cf690efcf55da01469c0.camel@azg-tech.com>
	 <87cynlbk8p.fsf@kernel.org>
Organization: AZG-Tech GmbH
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu2 
MIME-Version: 1.0
X-Provags-ID: V03:K1:scfo8zws8gcSrF0wc6A7fPLR5tHVRIhHeecpkXdJ1NuaGbCmm7o
 NtPw7aU/XuyEyfEWUeXMXGq9ihFsvSK+woFYC8g1cx8o3IVW/qH/2YASIkEmjnkvwTlYM13
 48PRrG5J2kXpj/SU272x8kD580ZVGva5MO0Oq5HKCX82jS1i+nNz5jQ5mFS968UVagx6eKb
 9R7UTpdM9u4SRXhnEjAaw==
UI-OutboundReport: notjunk:1;M01:P0:4rEOnPJdbe0=;MlB9X0iJWdshjEFg8+S5JT+Mnpn
 Cbbq9+u/+9zcty9ZVrVcu+zga6+7cj744YJXtrtxwqZRAih3JXDVIEUW/Z/kLYp2ojyAkNLsg
 JdYuhXr3VPprz35vLnzwiGuQvIKFMnEV3F0yssmTkGKAGhlW/HD+aWlTIm+Mo87W2Dn/VyPKd
 ODaZSiaqNzJVYT85RMyoqmaQDFah/UsMik97l/gosnJuZJvclXWOkCWGj27nQ9gjNP2C0YYUM
 JlSgzhThVkgOboCrjfDsgvVwJskZE6SwuAHyJN5LMKgF8mJ43Cth1zfG5kxKQfMX5lzij0pp1
 Gxom8FKl/7PCiTua+/0Q2yvLu7rRl3TJgMGzAqybOKN5wvSo9rJ1EezxFUsxpUQkQJiyyxi9J
 86cUOVmhqLcuM1MxQaetlzxc3ISpgr0oDS2iOj4Ce1875DUaKQjCEeBGADka9z3Vg8XxXUBPI
 vwJjGNnytw9lYxp6gOsyHOGGUZ4VxgwWo8ecfNBHxo1Sp7ZSYc30WOpZ//nV/+2LIzEA0P6RG
 n0xSsQ+iQFTn3dFeLmB+rNZHNivGRjU0tM/KR7Plajob/ibBnt/mG+CFUoA/3G9Cd2PPXeIo/
 pAnI2DjGvgY0hNeDHAe8hC+BQjx9Qpzu4yeBv8OCDbSWfr7ARzE0KamFIeHYZaPwyi42QksDC
 AkK9Rzc9IUWcxQIZMtABp/BqRDlO2CwnAduRH8jFTPtQqR9M8LCu2Qebz4baxFQCKKUQwdY79
 z46Ks5hkfYEtfWXV53LzPRDd0IVCajnNJSz3DJPscwc0qUDjauEO44=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240710_041645_023329_00218FB8 
X-CRM114-Status: GOOD (  17.41  )
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

Dear Kalle,

>=20
> > Could you please at least answer the question whether mesh is
> > supposed
> > to be working on IPQ6018 with vanilla kernel, which firmware
> > version is
> > required and whether it is required to enable raw mode data path?
> > Is
> > there some knowledge around? With ath10k, there was at least a WMI
> > services file in debugfs and a feature list in the 'bin' file. Both
> > are
> > no longer available and I can no longer see anything about firmware
> > capabilities.
>=20
> I have not tested mesh mode myself with IPQ6018 but I did saw a
> report
> claiming that at least this firmware has working mesh mode:
>=20
> https://git.codelinaro.org/clo/ath-firmware/ath11k-firmware/-/tree/main/I=
PQ6018/hw1.0/2.6.0.1/WLAN.HK.2.6.0.1-01291-QCAHKSWPL_SILICONZ-1?ref_type=3D=
heads
>=20
> Though that's not the most reliable source so I'm taking the report
> as a
> grain of salt.
>=20

Thanks very much for the answer. I'll use that as a starting point
(just yesterday I found the relatively new firmware version) for
further investigations.

Kind regards,
Stefan

