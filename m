Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F77FC64EC4
	for <ath11k@archiver.kernel.org>; Tue,  7 Mar 2023 02:36:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gP8YzNOLubJmGtNATM237jhpO6UKTanQgZ7buvc55yM=; b=X5ek1DJggO2ZuXxNCLO2EZOPyh
	cvd2b4u2KAxpg7ihW88dRbkAF9PUeSTi0bvAIT9ywIuX+VtF/3i1oEFRNB6AD9zuaWXmUkZIt8bjJ
	0in1WL845U1svqzmoZI83CevXWrukwuCSiUaDljD6p2oQRtxJlLq1sNzHt500icbpfcmt32byJ4XC
	90zGZmS/fJXyfCWA4ksiNgavMUQVhUpt4GiB2TCAJCLEZRVjO32NtUgYEYkBMHiade/+sm/0rZHpP
	GLgL+2McEPgzRLqJ45L0y+8GoPMWNwY/qDKyU3j69dhqgffpz62RcMA6IrOWunca4pXIeu9JEU14v
	Rb16F0Dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZNBy-00FtGb-Kp; Tue, 07 Mar 2023 02:36:42 +0000
Received: from stravinsky.debian.org ([2001:41b8:202:deb::311:108])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZNBX-00Ft5r-P3
	for ath11k@lists.infradead.org; Tue, 07 Mar 2023 02:36:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=c+uKi3uKQIn7P5Qi2hP7gbUIY92VwWVqjxDVLjoSzuE=; b=uZ0bwoUzBIFLAch0SfwSUb8rPf
	OM0pbHspCWdnexCiFYsSBgAZzD5VrVihUZ6AfBwp+0llxOTUb/vExt5r8dxLDw3oHPAFW8YQJP1Xh
	2gQOZAB9BOzU19doGM1uXVeU+GDKgXW+7i8MJvu7j7RR7Ej8XWA2FJhMLOv6hkmmTyChMYn+vkht2
	t6H28R3PEC9baIGvIkCv+CYMFcPsCdm74k1S2H72bEBtLIyALnLNYJvSRTtr7bugf/MfkYWdzFVZR
	Z5xzgpvZqXZXH/c9TPnflKty/FRvmJ6oauFM8C3ZI35pR2u8yj0lofxI3Ka+sE3LaP6nDGeFVGGbd
	hnyiZ7fQ==;
Received: from authenticated user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.94.2)
	(envelope-from <kibi@debian.org>)
	id 1pZNB9-002Ki7-Gm; Tue, 07 Mar 2023 02:35:52 +0000
Date: Tue, 7 Mar 2023 03:35:49 +0100
From: Cyril Brulebois <kibi@debian.org>
To: Christoph Hellwig <hch@lst.de>
Cc: kvalo@kernel.org, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH] wifi: ath11k_pci: add a soft dependency on qrtr-mhi
Message-ID: <20230307023549.qoiru6roecng4rd6@mraw.org>
Organization: Debian
References: <20221202130600.883174-1-hch@lst.de>
MIME-Version: 1.0
In-Reply-To: <20221202130600.883174-1-hch@lst.de>
X-Debian-User: kibi
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230306_183616_299349_359F781A 
X-CRM114-Status: UNSURE (   9.44  )
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
Content-Type: multipart/mixed; boundary="===============0902559990539699276=="
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org


--===============0902559990539699276==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bhlnwtrwaoldqj6y"
Content-Disposition: inline


--bhlnwtrwaoldqj6y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hallo Christoph,

Christoph Hellwig <hch@lst.de> (2022-12-02):
> While ath11k_pci can load without qrtr-mhi, probing the actual hardware
> will fail when qrtr and qrtr-mhi aren't loaded with
>=20
>    failed to initialize qmi handle: -517
>=20
> Add a MODULE_SOFTDEP statement to bring the module in (and as a hint
> for kernel packaging) for those cases where it isn't autoloaded already
> for some reason.

That's indeed a very helpful hint, which helped us fix support for this
module in a Debian Installer context (where we don't ship each and every
module built in the linux-image package, but some limited selection).

  https://salsa.debian.org/kernel-team/linux/-/merge_requests/667


Cheers,
--=20
Cyril Brulebois (kibi@debian.org)            <https://debamax.com/>
D-I release manager -- Release team member -- Freelance Consultant

--bhlnwtrwaoldqj6y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEtg6/KYRFPHDXTPR4/5FK8MKzVSAFAmQGowUACgkQ/5FK8MKz
VSDQsRAAr1yV7/CFuJqS14vw+F/uJW5o4307UNu++7FuLl7W6GP9YQaNdMcasT+6
85/LJavcjS7njkVGFcxiWVK74KLq42guPPw9c7fjv7CfD2qgruGjQtaq4dDnrskO
qBXR2+TvhJdq2IlU630M5upAmqGk7Uxn+02Pc2pVv7Qu2kZNt7Vjx9Er9ULnKO5d
6z6yT4/rI/K0ltVRymb581+x1ZZEu18ja6khoyKFbHplBNIChULwDrh2uxKenNHX
G8n19Rki07ckWubXzR7Fnudss5B7shCY0UWd96X8TDHAV4yTfvoPYlxOAaCLugGq
8MBAK0B5/PDXSaoV+O8Oxg08muYXJOLGA1SmuByz+SdeiqISTnnnbUh0gLzVu45v
XlZzMhhgEfroRTEl1ASa8MkfxZLlR/7flFteKFe4hf/DLERJKV3xUICZg4y4XQM+
jWbiLL7COVHpmCYgIk+rgdfzUZV6ruXfapdRwyctQMsCsZl3oZSyIikISuEveCDl
pR67Yn9OoGRFqwXuTR7/Ol0LRejiMzdhZjlJLQmtQBD3kWOAIZVmb55xLbjN0pUJ
LQNekbwOvmeZPDFuPHIgW+Tq79xT7kwk/Qk9msrsQn55rIZprAIxW4x/19DqVuyy
GkhqZb4Nwrp7ESbvia3uj9KWRLNdGTzQR/mSJZzoX1VFuMNzNHE=
=vdrE
-----END PGP SIGNATURE-----

--bhlnwtrwaoldqj6y--


--===============0902559990539699276==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k

--===============0902559990539699276==--

