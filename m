Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61161C433EF
	for <ath11k@archiver.kernel.org>; Fri, 18 Feb 2022 15:25:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kfhvK++MAIblrvo+f21/teJ7C7SmP+wMEEm9Cq8qbXQ=; b=KXfypyQ/vUpRiBgMlXpQH3meKP
	oyy+25/CHhFK4dEzDOe4Q7QU+tf9UouBx4PtZ2OzrX6BoFVB9Oda5RSSGukihp8TmgphiWr3WWfi8
	IvhX5WnXwKs+eq5F3Vp3Fl69Psa8nYSb87RNQzLYlpOcxljmoxqu7tKGzkwBDhWYVS8fpW9nWm/bl
	V6EZjJRiUrQ/i3cbyOtb781Nufuwv93SDo2MntcmJLwFuLAaoh3aCKBFsKVuy6hwHTO7BTEqZIfk/
	fglajjvE3RaCxc+cIejii0D2P1n2BphUeP8bDYSxCOde9vOa6q4dV2RcMX1Ttz9HyuKbpU154wTR4
	3skDomTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nL58b-00F5tb-GD; Fri, 18 Feb 2022 15:25:37 +0000
Received: from dvalin.narfation.org ([213.160.73.56])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nL4kh-00Ev19-82
 for ath11k@lists.infradead.org; Fri, 18 Feb 2022 15:00:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=narfation.org;
 s=20121; t=1645196451;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Vg8BVEugctsdqPwI+1xt+x/A1mHe6ZYp91WeLa54JYU=;
 b=eXFR0DSRaJbYjUOhzvEXlTL3CrZ2Fo3/Lv/bnaYmDnOKbq+uLpgAmaPpBfAZLyKXJcV9Ni
 A18Z00d7vI8XvLu2juOV0cIcqdNEeasvvS5W85Xjj/HZyzPwzd5TlP03MO+j+wbLRyDeFN
 EM3tgRm+H0wdyOAGCcg13NE+y2c7Gt4=
From: Sven Eckelmann <sven@narfation.org>
To: "linux-firmware@kernel.org" <linux-firmware@kernel.org>,
 ath11k@lists.infradead.org, Kalle Valo <kvalo@qca.qualcomm.com>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>
Subject: Re: [PULL] ath11k firmware 20211223
Date: Fri, 18 Feb 2022 16:00:47 +0100
Message-ID: <4785910.v3KmxWAaZY@ripper>
In-Reply-To: <BYAPR02MB4567669033A210A78AC397E9927E9@BYAPR02MB4567.namprd02.prod.outlook.com>
References: <BYAPR02MB4567669033A210A78AC397E9927E9@BYAPR02MB4567.namprd02.prod.outlook.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220218_070055_479446_F77F1443 
X-CRM114-Status: UNSURE (   6.73  )
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
Content-Type: multipart/mixed; boundary="===============2448944944575575210=="
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

--===============2448944944575575210==
Content-Type: multipart/signed; boundary="nextPart1841571.kgKKsBDBsr"; micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart1841571.kgKKsBDBsr
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"; protected-headers="v1"
From: Sven Eckelmann <sven@narfation.org>
To: "linux-firmware@kernel.org" <linux-firmware@kernel.org>, ath11k@lists.infradead.org, Kalle Valo <kvalo@qca.qualcomm.com>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>
Subject: Re: [PULL] ath11k firmware 20211223
Date: Fri, 18 Feb 2022 16:00:47 +0100
Message-ID: <4785910.v3KmxWAaZY@ripper>
In-Reply-To: <BYAPR02MB4567669033A210A78AC397E9927E9@BYAPR02MB4567.namprd02.prod.outlook.com>
References: <BYAPR02MB4567669033A210A78AC397E9927E9@BYAPR02MB4567.namprd02.prod.outlook.com>

On Thursday, 23 December 2021 15:03:04 CET Kalle Valo wrote:
>  ath11k/QCN9074/hw1.0/Notice.txt  |  802 ++++++++++++++++++++
>  ath11k/QCN9074/hw1.0/amss.bin    |  Bin 0 -> 11897676 bytes
>  ath11k/QCN9074/hw1.0/m3.bin      |  Bin 0 -> 340108 bytes

This pull adds the firmware for QCN9074 but not the board-2.bin. As result, 
the initialization of the ath11k PHY will fail.

Kind regards,
	Sven
--nextPart1841571.kgKKsBDBsr
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEF10rh2Elc9zjMuACXYcKB8Eme0YFAmIPtJ8ACgkQXYcKB8Em
e0Yz3A/9H7Gix3bMBn50gieAjVOm8JW0B2vM5dhPl2Ngaz0FT6ZiL2hLXlVaAZ8A
HDcsAgv7R2bTyhElm4sp8nd22kxI7HwspU7B4KcKRFgYqBFrCcVQAezU539d3src
Cto4gDAeOA16BgkgLP6ha2mLOttKg6hWsH0j5ye7G3NPVMl9RX95a4OfS9CXQqG5
oS5iYamhuMThcEE6oYsITf3Ayd+baTPUcbEWZJI1aPVQg1vIYOAEJP8hSsuPxLJL
2tM/4dxU1F2doCWmpBbA3H2yAjgyJwY7UNxABsyvo3kZ133QU2FBxUyQ3uooGOGK
+uSZ+UxoxGOn0BNcUQ5pxRlqva/bfcb5n57GLA4EkpkA4H8yftdFu5MMYVsACmFC
L71qk37kBSoqOAJwZtUj4/dvdmqzXRvmaUR+i9eF7oPyIx7NCU5r8duIhIbaQbX7
Pi/PULX3kRh1vV+laJ0E2fmJfFzApTczOGtJQs0i8nRCD87+XjI4bXV+/ueOD9ON
S96B8RQU6SGFGwwAmFESJ4fTHTUrhQPVLXzy9OMRrIGJU71Wbo9BefWxr+sjk55P
yQcOhcZreU7SGWSWcpvr6k6ZsqMZt4nG8YgxV0TUXGPL7KwGTFRBw3KRJvjvH7dt
QNCNMWh82LD9PD2FZGovpxH7jr+LuuYrxfUUeXjRVyc3vRHMQPI=
=VQAG
-----END PGP SIGNATURE-----

--nextPart1841571.kgKKsBDBsr--





--===============2448944944575575210==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k

--===============2448944944575575210==--




