Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5EA0C433F5
	for <ath11k@archiver.kernel.org>; Wed, 13 Apr 2022 07:26:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jq5Im4Pgr8ZNgdbChJXIIuiLnj5zn8uxSaKl5FMcUqs=; b=Dz3sp0MxqvYw3MdWK5ztW+4nGg
	nMoNzR5HJw4z607gQMlVDnNANeCQ30OAKM5ccOlEwFd8xHrQh3kBiVdko0uKPHgP57wORx7El7Myh
	cIHYHgK+YND9a/6NUJ5vExwyeWA91EvV9V7ELAiqHZleROiqvxGd9p/57aYoNvmi8Z8XGUcTKPrk1
	KV4zduHcP+6ODJwgbe82aoNSjc3yd7PAbKf+Fhfn9T+4MFmqGK7VpfGu3e34Mky9tPxtmcPhkY3h0
	t9FU3QQi7E2Ggpyiirqe0ugda3XIve6UNhBf0n6v461PrecLdtvkHBZ7qM1DjdApnjMCC4/voLyRp
	5e/q2f3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1neXOY-00HOj8-Vz; Wed, 13 Apr 2022 07:26:31 +0000
Received: from dvalin.narfation.org ([213.160.73.56])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1neXOW-00HOiD-SW
 for ath11k@lists.infradead.org; Wed, 13 Apr 2022 07:26:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=narfation.org;
 s=20121; t=1649834786;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dDI/B3nU6AGXXnG7i4Ul7sfQGHooPKZXGJVe+BFJbPo=;
 b=aVC1QbPjFIrTyceWELiXlCHKvKsaDqOj4IKkEj4Fhq1+8xvwHCMTWSViIEiRlAtw4y5SOO
 GvQ9UzEHMgKPEKOjIrcOPzNcFXdeb7rgWy6VltxI8mNXLKybJ16l7cAo8gYh5bnd7GPXCF
 Izj1sLTvBAXZbC9Fi/6J1LI0sh7gXcQ=
From: Sven Eckelmann <sven@narfation.org>
To: Kalle Valo <kvalo@kernel.org>
Cc: ath11k@lists.infradead.org
Subject: Re: ath11k: QCN9074: Incompatible board-2.bin for 6GHz
Date: Wed, 13 Apr 2022 09:26:23 +0200
Message-ID: <3277532.u7iglclnok@ripper>
In-Reply-To: <87sfqhmpho.fsf@kernel.org>
References: <2091899.pNsEtq2SQc@ripper> <2947430.zJFXT1rtDI@sven-l14>
 <87sfqhmpho.fsf@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220413_002629_117425_CE4217EE 
X-CRM114-Status: UNSURE (   6.90  )
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
Content-Type: multipart/mixed; boundary="===============2656758451863433187=="
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

--===============2656758451863433187==
Content-Type: multipart/signed; boundary="nextPart3716227.a2c8BT5smP"; micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart3716227.a2c8BT5smP
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"; protected-headers="v1"
From: Sven Eckelmann <sven@narfation.org>
To: Kalle Valo <kvalo@kernel.org>
Cc: ath11k@lists.infradead.org
Subject: Re: ath11k: QCN9074: Incompatible board-2.bin for 6GHz
Date: Wed, 13 Apr 2022 09:26:23 +0200
Message-ID: <3277532.u7iglclnok@ripper>
In-Reply-To: <87sfqhmpho.fsf@kernel.org>
References: <2091899.pNsEtq2SQc@ripper> <2947430.zJFXT1rtDI@sven-l14> <87sfqhmpho.fsf@kernel.org>

On Wednesday, 13 April 2022 09:06:27 CEST Kalle Valo wrote:
[...]
> Ah, I forgot to mention that everything under "testing" directory is
> work-in-progress, and might break backwards compatibility. To keep
> things simple I now removed all backwards incompatible files from my
> ath11k-firmware. Also now there's a proper board-2.bin for QCN9074,
> hopefully that works better. Do let me know if you have any issues.

I have now used WLAN.HK.2.5.0.1-01208-QCAHKSWPL_SILICONZ-1 (+new board-2.bin) 
with the Pineapple6. And at least on first glance it seems to work.

Thanks,
	Sven
--nextPart3716227.a2c8BT5smP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEF10rh2Elc9zjMuACXYcKB8Eme0YFAmJWeyAACgkQXYcKB8Em
e0bn6BAAldiEOa5wLDZ6fGy4AvDRXtM+QoRigZaxtWdE6qcoy9N1riarMm/8ulzL
kLwJrW5slsJyL0pL5CGH9XSNw1WYohBt69CJ8onm+R+rLffenvzuhSX4wqhhAoiT
Im3FDbROOwrc2VIMSRyVF7BrWy+6ltuYc3PwKLKQ9/RN8i8l5zTF83ldyPRisS4i
1N2O0RlK0LEUjCBzskig6wCu2h/eS4Bo5LoLvkA1rGQoF9/oiWrQF2WPb/NDuP0o
lEJ/XloPwFKtRWIm/5RAWdL+WHasErND1UxnrqqSCghzXDzC/A4myTr0YVFeEKG3
plwceJbFVTZWE/kp9L1GrrlRE+IRiYnuJhuiAPi4vNfwMUTeph/8vT0yhImVKkvy
0ej9JR/FyXHkJx4VfIMS6YqeqpVtPpMJGQOp/EecTpvi6jyFkWbxKj3LPtDk1mEJ
gppEweqQ3dQEElL7fAYvobLkq7qQjxHSiUHtg02/l7ltTZ5pdUPZcqgKj/+NBZ67
BvBveQAahKCTbwQQsTRTt6LEcgN7xZN39M+uCcfCqmeYK/YLR7VaM1pNLaCD4ujq
sncknjpk3XUmRb5kIjQauEcYbqk9MAkaD/OdZA+38DWH3+q4ySUR1y4z3QI9MltK
puGC6gaBsi8CJ9VqaW8QZgnDVRW6+wi1YPVmuVB5iiduyl98cQs=
=aiNY
-----END PGP SIGNATURE-----

--nextPart3716227.a2c8BT5smP--





--===============2656758451863433187==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k

--===============2656758451863433187==--




