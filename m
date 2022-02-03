Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97503C433EF
	for <ath11k@archiver.kernel.org>; Thu,  3 Feb 2022 18:34:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q/1BJvIDer6SaJz/DVZa590oYjmX6BtIX+9aKoFteaM=; b=uo0kItXHFiYiIuQKqngLFkQyzS
	FnAtSDSCn4qdad5O5+rIpGG2LDM68Sf1EwajokLWqvzVKEbYwhynEYNU6sJDw8TS24x4JZmgk29Zg
	BY4oSGUGKcgvkUp7G4zMU+zuZjp/UESkRB60J/FViNIXsZv6uzPowpGQPR78+uVlmfDLjcFCDzK8g
	e70ohH2frFiS6B/md5g/91FVFghQn28tIExqbLV/KCHQAOlq/EKZKSSdCq8mpH7jfowYdNH2lMiQn
	0cKH380SGZIs5iRzGANIQmhvgFTyv6tqoCIX7RsHboptnnkr2oCtDs0uKiNOAc+GzotxiqaONv06X
	VyAjMrKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nFgwW-002W8g-3D; Thu, 03 Feb 2022 18:34:52 +0000
Received: from dvalin.narfation.org ([2a00:17d8:100::8b1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nFgwR-002W6a-Us
 for ath11k@lists.infradead.org; Thu, 03 Feb 2022 18:34:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=narfation.org;
 s=20121; t=1643913283;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=j77umDJX80VOM+5UhWmXnApILfYFzhTjgNR+PRemqQE=;
 b=wnqDy7r9qtSpF9wlFmwMi3J8q9iEgegapUIXIWv9FjxoXqfaWUUCiZ47zZ+p0OmUE/PWkJ
 8mytJFmgRoaB7IBCVJz7ta6h4knxl16ke8wyPdVItugUojr3mo/9OW8BBaYrZJPqmipKTd
 UMOrLgo4PyuAbdZSjl0gx+qNSmrcyLE=
From: Sven Eckelmann <sven@narfation.org>
To: ath11k@lists.infradead.org
Cc: =?ISO-8859-1?Q?=CD=F1igo?= Huguet <ihuguet@redhat.com>
Subject: Re: failed to fetch board data
Date: Thu, 03 Feb 2022 19:34:40 +0100
Message-ID: <1926320.a6RdWSqejM@sven-l14>
In-Reply-To: <CACT4oud4hmkjrAPkOr0sG1DNNgcgQaKT2JNJzcivZey9b5Hpiw@mail.gmail.com>
References: <CACT4oud4hmkjrAPkOr0sG1DNNgcgQaKT2JNJzcivZey9b5Hpiw@mail.gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220203_103448_309373_1B1813B6 
X-CRM114-Status: UNSURE (   8.59  )
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
Content-Type: multipart/mixed; boundary="===============2419421374083723692=="
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

--===============2419421374083723692==
Content-Type: multipart/signed; boundary="nextPart16953420.ZRgoJ8aGqf"; micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart16953420.ZRgoJ8aGqf
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; protected-headers="v1"
From: Sven Eckelmann <sven@narfation.org>
To: ath11k@lists.infradead.org
Cc: =?ISO-8859-1?Q?=CD=F1igo?= Huguet <ihuguet@redhat.com>
Subject: Re: failed to fetch board data
Date: Thu, 03 Feb 2022 19:34:40 +0100
Message-ID: <1926320.a6RdWSqejM@sven-l14>
In-Reply-To: <CACT4oud4hmkjrAPkOr0sG1DNNgcgQaKT2JNJzcivZey9b5Hpiw@mail.gmail.com>
References: <CACT4oud4hmkjrAPkOr0sG1DNNgcgQaKT2JNJzcivZey9b5Hpiw@mail.gmail.com>

On Thursday, 3 February 2022 15:56:29 CET =CD=F1igo Huguet wrote:
> Since it seems that there might be many variants that need to be known
> in the board-2.bin file, is it possible to know which ones are
> supported and which ones are not?

    git clone https://github.com/kvalo/ath11k-firmware
    git clone https://github.com/qca/qca-swiss-army-knife
   =20
    ./qca-swiss-army-knife/tools/scripts/ath11k/ath11k-bdencoder -i ath11k-=
firmware/WCN6855/hw2.0/board-2.bin|grep BoardName

Which returns following list:

    BoardNames[0]: 'bus=3Dpci,vendor=3D17cb,device=3D1103,subsystem-vendor=
=3D17cb,subsystem-device=3D3374,qmi-chip-id=3D2,qmi-board-id=3D262'
    BoardNames[1]: 'bus=3Dpci,vendor=3D17cb,device=3D1103,subsystem-vendor=
=3D17cb,subsystem-device=3D3374,qmi-chip-id=3D2,qmi-board-id=3D266'
    BoardNames[2]: 'bus=3Dpci,vendor=3D17cb,device=3D1103,subsystem-vendor=
=3D17cb,subsystem-device=3D3374,qmi-chip-id=3D18,qmi-board-id=3D266'
    BoardNames[3]: 'bus=3Dpci,vendor=3D17cb,device=3D1103,subsystem-vendor=
=3D14cd,subsystem-device=3D9409,qmi-chip-id=3D18,qmi-board-id=3D255'
    BoardNames[4]: 'bus=3Dpci,vendor=3D17cb,device=3D1103,subsystem-vendor=
=3D14cd,subsystem-device=3D9409,qmi-chip-id=3D2,qmi-board-id=3D255'
    BoardNames[5]: 'bus=3Dpci,vendor=3D17cb,device=3D1103,subsystem-vendor=
=3D17cb,subsystem-device=3D0108,qmi-chip-id=3D18,qmi-board-id=3D255'
    BoardNames[6]: 'bus=3Dpci,vendor=3D17cb,device=3D1103,subsystem-vendor=
=3D17cb,subsystem-device=3D0108,qmi-chip-id=3D2,qmi-board-id=3D255'
    BoardNames[7]: 'bus=3Dpci,vendor=3D17cb,device=3D1103,subsystem-vendor=
=3D105b,subsystem-device=3De0ce,qmi-chip-id=3D2,qmi-board-id=3D255'
    BoardNames[8]: 'bus=3Dpci,vendor=3D17cb,device=3D1103,subsystem-vendor=
=3D105b,subsystem-device=3De0ce,qmi-chip-id=3D18,qmi-board-id=3D255'
    BoardNames[9]: 'bus=3Dpci,vendor=3D17cb,device=3D1103,subsystem-vendor=
=3D14cd,subsystem-device=3D9308,qmi-chip-id=3D2,qmi-board-id=3D255'
    BoardNames[10]: 'bus=3Dpci,vendor=3D17cb,device=3D1103,subsystem-vendor=
=3D17aa,subsystem-device=3D9308,qmi-chip-id=3D2,qmi-board-id=3D255'
    BoardNames[11]: 'bus=3Dpci,vendor=3D17cb,device=3D1103,subsystem-vendor=
=3D17aa,subsystem-device=3D9309,qmi-chip-id=3D2,qmi-board-id=3D255'
    BoardNames[12]: 'bus=3Dpci,vendor=3D17cb,device=3D1103,subsystem-vendor=
=3D17aa,subsystem-device=3D9309,qmi-chip-id=3D18,qmi-board-id=3D255'
    BoardNames[13]: 'bus=3Dpci,vendor=3D17cb,device=3D1103,subsystem-vendor=
=3D17aa,subsystem-device=3De0be,qmi-chip-id=3D2,qmi-board-id=3D255'
    BoardNames[14]: 'bus=3Dpci,vendor=3D17cb,device=3D1103,subsystem-vendor=
=3D105b,subsystem-device=3De0bb,qmi-chip-id=3D2,qmi-board-id=3D255'
    BoardNames[15]: 'bus=3Dpci,vendor=3D17cb,device=3D1103,subsystem-vendor=
=3D105b,subsystem-device=3De0c4,qmi-chip-id=3D2,qmi-board-id=3D255'
    BoardNames[16]: 'bus=3Dpci,vendor=3D17cb,device=3D1103,subsystem-vendor=
=3D105b,subsystem-device=3De0c4,qmi-chip-id=3D18,qmi-board-id=3D255'
    BoardNames[17]: 'bus=3Dpci,vendor=3D17cb,device=3D1103,subsystem-vendor=
=3D17cb,subsystem-device=3D3374,qmi-chip-id=3D2,qmi-board-id=3D771'
    BoardNames[18]: 'bus=3Dpci,vendor=3D17cb,device=3D1103,subsystem-vendor=
=3D17cb,subsystem-device=3D3374,qmi-chip-id=3D18,qmi-board-id=3D771'

Keep in mind, that there can also be multiple supported values per line (ak=
a=20
"per BDF"/board.bin).  This doesn't seem to be the case because there is no=
=20
extra entry (see placeholder "foobar") like in following example :


    BoardNames[XXXX]: 'bus=3Dpci,vendor=3D17cb,device=3D1103,subsystem-vend=
or=3D14cd,subsystem-device=3D9409,qmi-chip-id=3D18,qmi-board-id=3D255','foo=
bar'

Kind regards,
	Sven
--nextPart16953420.ZRgoJ8aGqf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEF10rh2Elc9zjMuACXYcKB8Eme0YFAmH8IEAACgkQXYcKB8Em
e0bgLxAAnq4cy2bbNsVMGACRHjhCX0UKMxg+k5guQE0NNe+/xnnqybewgie0Qa+V
MD/qBKrOrVKaMFJPsdIEaUncRMAie8DKvuDFuBrWPHgSe4vvbKD2aSHK2NhlcyBO
Z+0f551tIi7J5PCHhrDaURPSM/Do4RblYI3cS/jf6kABdyNgp5L5BWQLcfPTnNHk
C54ZH+CpRRDmh309e3nzOzWqOmNLkSMPa/jVMsR/1EG7GrD71LQB0wiKJOy3+MJt
6WQVALN0SsYnxy3ECtlRldJ9VarlhqcpKFTLKXLPZ/IngQHDJC3bmOeY96xY3BBD
muuvvZMRsJqg4sGvGyfykHsIF0C71ovsFZw3xR4CBj+42bnm+nj/heklWQuM6akR
ZKlBg+oQHmdJTNgHhAP6swLKibIAqPPXx7vmx4gN2pTOcCN8biMhoLSEWi31O+Gv
0rSJNrZ3ePTHACfr/MGKvdYNbhdHdMeW2fd20XAmzIWd35JDPS6uf4hb0L4ubPeW
s+R9j7MPkGh17u9lD9oqDAGOvX67k3xK4ZHy0Tfmu1VgDrlPXkF7YHSoFe9At0NK
rL0oRcPIDUseqBiPha3hDdYP7GnXfSGQ0gGzxjRPm51+HIG1xMdY/LASlqxyQE86
r+ER0Q16mwfaP9f3L7AHA4UgsJInkS/FL+RzQDLuJTt6DpzMN1I=
=6KHU
-----END PGP SIGNATURE-----

--nextPart16953420.ZRgoJ8aGqf--





--===============2419421374083723692==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k

--===============2419421374083723692==--




