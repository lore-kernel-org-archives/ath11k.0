Return-Path: <SRS0=4E4+=LI=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A873C2B9F4
	for <ath11k@archiver.kernel.org>; Mon, 14 Jun 2021 14:58:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4E75061019
	for <ath11k@archiver.kernel.org>; Mon, 14 Jun 2021 14:58:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4E75061019
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=posteo.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:In-Reply-To:Date:To:From:Subject:Message-ID:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=NZbfhzKKKlpZy+e1zgQAIzIdjy+rBkm4w4o+cl+vvBc=; b=mLAnXmiWs90CsC
	D9IlD8OuJafcevM17Onsm8OgXua0kiqwU1emx1IjJACfnZ4pV8fwWKHjsG72Dc+oxxBNnN4fASqAC
	KlBdpCFVXFcNaolw6qBKTHJth83SMPHCI3kOmJFCjmEAX9e2YRxBxAWDmwnUanLA7HLWNMzEtRIgw
	mXIk/60KqXgb3S7Z+m9bpdiAIR4Fi9CvCMx1oyOrxH/rx7NgB3T6LxspeK2v2gX9tgKtd+lwEmsLW
	mA8P33KONHl105P8rjC9JH1JI6BKIw3rJRdAOnqtJEeQe+sqLFagZ6aoDV+UTo2ENcAJDLhD3rKun
	TznbawM7FnhsM7kS2SNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lso2Q-00EdgE-5H; Mon, 14 Jun 2021 14:58:06 +0000
Received: from mout02.posteo.de ([185.67.36.66])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lslCa-00DwcC-Dq
 for ath11k@lists.infradead.org; Mon, 14 Jun 2021 11:56:26 +0000
Received: from submission (posteo.de [89.146.220.130]) 
 by mout02.posteo.de (Postfix) with ESMTPS id A2EC82400FC
 for <ath11k@lists.infradead.org>; Mon, 14 Jun 2021 13:56:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.de; s=2017;
 t=1623671776; bh=++Mka3mlw0leBL4Sb44OQwEk9BI5/Txv/8yh+6jHiQg=;
 h=Subject:From:To:Date:From;
 b=FGLJlGcEOpC2YixeQivt8j9Dl7Ud0LXd5PU2e3/O8v5JleQC4Db6wqAAJOwzadZaP
 drrSphZ3Hon9OVfnaRcahUnRjzMfkyykOVgrzZZOuLIspkFYcZdaHnUeCTiHQ/tpJw
 eLcQ+I3Su6X7MItPD0EvP15RGlO5kSccF2sD+E0bbQAb73a6VMyWSe1drPQET8TAVz
 +vroqDFNPd5YUaA+y3hwUmKhpTVhdx5h8yCk/cn/MCJ/lrsmxukaGZ2hemDnAs+QfH
 nRSGr9IKj5otNe6He9b7AW2OMbnTwLG/7lbsL+23O9/Tf5vZ6RRxdNkEZ0autC8upt
 1OxXFlhiRXOzw==
Received: from customer (localhost [127.0.0.1])
 by submission (posteo.de) with ESMTPSA id 4G3VKD1Dvsz9rxb
 for <ath11k@lists.infradead.org>; Mon, 14 Jun 2021 13:56:15 +0200 (CEST)
Message-ID: <0dd5867b81e8ca6d97a71317aa1ec9806ec6b587.camel@posteo.de>
Subject: Re: Re: [PATCH v3] wireless: add check of field VHT Extended NSS BW
 Capable for 160/80+80 MHz setting
From: Dominik =?ISO-8859-1?Q?F=F6rderer?= <dominik.foerderer@posteo.de>
To: ath11k@lists.infradead.org
Date: Mon, 14 Jun 2021 11:56:15 +0000
In-Reply-To: <20210524033624.16993-1-wgong@codeaurora.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210614_045624_929851_6D9EA2BE 
X-CRM114-Status: UNSURE (   7.38  )
X-CRM114-Notice: Please train this message.
X-Mailman-Approved-At: Mon, 14 Jun 2021 07:58:05 -0700
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
Content-Type: multipart/mixed; boundary="===============7063946191322615611=="
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org


--===============7063946191322615611==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-mVwkfn+P7yzp9AIhCMfF"


--=-mVwkfn+P7yzp9AIhCMfF
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I've tested the patch on an xps13 9310 with a 160MHZ wlanrouter with linux
5.12.10 and linux 5.13 rc5. The connection is up, stable and usable at star=
t and
but after a random number of minutes (normally within the first 5 minutes) =
the
network connection crashes and it's not possible to connect to any wlan onc=
e
again. It's also not possible to reload the ath11k_pci module. Only a resta=
rt
will help, but sometimes the notebook freezes entirely.

How can i help to debug this Problem?   =20


=C3=96ffentlicher PGP-Schl=C3=BCssel:

-----BEGIN PGP PUBLIC KEY BLOCK-----

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3D
=3Dx/DB
-----END PGP PUBLIC KEY BLOCK-----

--=-mVwkfn+P7yzp9AIhCMfF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE/aqy/cgEwKGVC3ggzEcPcFfNeUsFAmDHQ98ACgkQzEcPcFfN
eUuHbA//WoYMBsyxnByBrxRlqZgX5FrqT4FQpW0gOxsz6vbiaei9jkrCtj7A9Du6
giOZ9Ln6PX9yT+WGvzS74hLZBANC/yDHWteacUyO5rcdXdSwIpn5DRxIshvpdC7C
7322W+YHoxnCw6pXrD4pE+pvA/+DGPrwXCm35iUlqO3sgJ5Mqn/uxFi3FTldTkqT
L2fD9D/84ek0rUBi5Y3xQrQKVNryuqdr/neJkiuByt50mBl82hQHekY2S4emnh5V
oy8vJAxzxJkPNcn/gryTpqGpVdMSwX7UXvcQpEwgs0FwuM5fhKOr27qgvlyKyVru
4sahHvb6YlSzf0/42i1gEMaXNHYn/X2zQ6F1S7Q4aZMXEzBfPu9h5qK7xJ6WfpWS
h1pCRkEui2t2Vt/7llBcaUN9tLTFbO8VGDADzQvBKJWYgU6ObtfPA0fM5lPqZK//
SAqaXAc5omooDULYrP6TDBVB48iss1IXWiY5rJcAvkg4SnEF+1FF8PT2LZy44WUS
6YdGUSyzCAY+aq4ujtNiBdOlBoh+Wj8P6knWsQIh7r3bB2wW+Jh1QQd2wMHwuINh
Is6qNz0XeGbLfQkE5Ap6uC0gB9q0Mqz2ChY4JlYfIT0EotfqUMegC80HP5UEQ4CW
DX7CDeKEFLJVEC8n57/ZK4Kx9TtoQxH1of8HtLQmQz4uGyyTE3Q=
=3+q8
-----END PGP SIGNATURE-----

--=-mVwkfn+P7yzp9AIhCMfF--



--===============7063946191322615611==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k

--===============7063946191322615611==--


