Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64D9FC54735
	for <ath11k@archiver.kernel.org>; Tue, 27 Aug 2024 12:34:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kAyaWwbFeOURqMw2fGQogQW2EcyJo1EbAvp2V9em+Ow=; b=ynrChm3wHYpuS0zG6OQxHMCBSg
	04Dr+94/QHlwIYQVeeakfPvhAEr1gc3I79lmzVjI9XUzT2auEsphmwbs+InLDyjTHaddoU6MDXAXF
	bv9DNdQ0TPEERjKzzAQJjkfCapRUQyzr3wkVsTjk9rI5NTcmgPTbs3LSCXj1c1+Lp2c3FzNAp3n/m
	/pLvJ1/0QeJLLz41QwtX/5lk7JlTb7OnO+SWFPnJFR2LFNwhr0LoIMEiyHt+ciUiy1W0IDQK1kVuX
	tMN3p+H4Lgwkqo+xYQzzzY8OrHGhvt7C3JipjWuh63fCm5zEsq9GzTi9nHbAY8jYLcqHvhUUGnShj
	SEqhLn1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sivP8-0000000BG5D-1JfO;
	Tue, 27 Aug 2024 12:34:34 +0000
Received: from jabberwock.ucw.cz ([46.255.230.98])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sivIQ-0000000BDli-3PfU
	for ath11k@lists.infradead.org;
	Tue, 27 Aug 2024 12:27:40 +0000
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
	id 380821C009E; Tue, 27 Aug 2024 14:27:36 +0200 (CEST)
Date: Tue, 27 Aug 2024 14:27:35 +0200
From: Pavel Machek <pavel@denx.de>
To: Sasha Levin <sashal@kernel.org>
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org,
	Jeff Johnson <quic_jjohnson@quicinc.com>,
	Kalle Valo <quic_kvalo@quicinc.com>, kvalo@kernel.org,
	jjohnson@kernel.org, linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org
Subject: Re: [PATCH AUTOSEL 6.1 21/61] wifi: ath11k: initialize 'ret' in
 ath11k_qmi_load_file_target_mem()
Message-ID: <Zs3GN2FH4uzzMEFY@duo.ucw.cz>
References: <20240801002803.3935985-1-sashal@kernel.org>
 <20240801002803.3935985-21-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="HldkCQvBm5fG8i0J"
Content-Disposition: inline
In-Reply-To: <20240801002803.3935985-21-sashal@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240827_052739_022974_942CE43A 
X-CRM114-Status: GOOD (  14.67  )
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


--HldkCQvBm5fG8i0J
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> [ Upstream commit 199f149e97dc7be80e5eed4b232529c1d1aa8055 ]
>=20
> smatch flagged the following issue:
>=20
> drivers/net/wireless/ath/ath11k/qmi.c:2401 ath11k_qmi_load_file_target_me=
m() error: uninitialized symbol 'ret'.
>=20
> The reality is that 'ret' is initialized in every path through
> ath11k_qmi_load_file_target_mem() except one, the case where the input
> 'len' is 0, and hence the "while (remaining)" loop is never entered.
> But to make sure this case is also handled, add an initializer to the
> declaration of 'ret'.
>=20
> No functional changes, compile tested only.

Just a cleanup. Does not match -stable rules.

Best regards,
							Pavel
						=09
> +++ b/drivers/net/wireless/ath/ath11k/qmi.c
> @@ -2293,7 +2293,7 @@ static int ath11k_qmi_load_file_target_mem(struct a=
th11k_base *ab,
>  	struct qmi_txn txn;
>  	const u8 *temp =3D data;
>  	void __iomem *bdf_addr =3D NULL;
> -	int ret;
> +	int ret =3D 0;
>  	u32 remaining =3D len;
> =20
>  	req =3D kzalloc(sizeof(*req), GFP_KERNEL);

--=20
DENX Software Engineering GmbH,        Managing Director: Erika Unter
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany

--HldkCQvBm5fG8i0J
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCZs3GNwAKCRAw5/Bqldv6
8kiMAJ4gB7fc1FbbwRzBA4C9ElhfyH8CYwCeM0c4ux7PN2ixW6KMksB6oTRfXkw=
=T0fI
-----END PGP SIGNATURE-----

--HldkCQvBm5fG8i0J--

