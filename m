Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from us-smtp-delivery-195.mimecast.com ([216.205.24.195])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hC3GR-0006Bg-Te
 for ath11k@lists.infradead.org; Thu, 04 Apr 2019 14:22:49 +0000
Received: by mail-pf1-f197.google.com with SMTP id l74so1833682pfb.23
 for <ath11k@lists.infradead.org>; Thu, 04 Apr 2019 07:22:44 -0700 (PDT)
Received: from bentobox.localnet ([2001:16b8:55d5:6efa::e4d])
 by smtp.gmail.com with ESMTPSA id j28sm43641604pgb.46.2019.04.04.07.22.41
 for <ath11k@lists.infradead.org>
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 04 Apr 2019 07:22:41 -0700 (PDT)
From: Sven Eckelmann <seckelmann@datto.com>
Subject: Re: ath11k: Firmware WLAN.HK.2.1.0.1-00113-QCAHKSWPL_SILICONZ-1 BDF
 mapping
Date: Thu, 04 Apr 2019 16:22:38 +0200
Message-ID: <2864629.zNy9jvXOX6@bentobox>
In-Reply-To: <1775657.NEkFaWULJY@bentobox>
References: <1775657.NEkFaWULJY@bentobox>
MIME-Version: 1.0
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============5978089066418082047=="
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+kvalo=adurom.com@lists.infradead.org
To: ath11k@lists.infradead.org

--===============5978089066418082047==
Content-Type: multipart/signed; boundary="nextPart2269872.OXnGdlAqal"; micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart2269872.OXnGdlAqal
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday, 4 April 2019 16:17:31 CEST Sven Eckelmann wrote:
[...]
> Or do we need some u-boot adjustments to use a different qcom,bdf-address or
> qcom,tgt-mem-mode? Both bdf-addresses point to 0x4be00000 and tgt-mem-mode
> is 0 at the moment.

Just checked the source DTS again and it looks like these addresses are 
already defined in their and not injected during boot. So forget my remark 
about the potential u-boot update.

Kind regards,
	Sven
--nextPart2269872.OXnGdlAqal
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEF10rh2Elc9zjMuACXYcKB8Eme0YFAlymEy4ACgkQXYcKB8Em
e0bAcQ//dTEL8KWBtj6Yr9klUJzKGUJMuwNvl1ul1G3BLJfBM34NSCDOgVGUGZ+k
Y2cuPUIvRzcZNQQszY9G0IEj6dCtg/5fLnb0Me84YjO0akzQzwaMIzvE17SS8T9M
tQ3ypCZd8TEW274ov6PEln/HxpW9JqO6dHcDipn7uh0G5tO5oT5dvgyE70bAGgjS
/OZMpL/lc5LaTrwd3TrlgGoxtg+KnaNxCFFb+mvS4ZTvLjHwnqFe8IEd8oRfmgnC
yoJhkvipstvE9R19siNzb+TlPFdcFcXh3uwD978giWyljBnHFkA1S6fuU4+s0IzP
liYmT3xUbYKN3rHGkYpzW/QWrm6eDvH9rvqWjZHh8pwf2lgrcN9Hs1AjAWYq9Mqn
BdY3hTMucDN5e5taNcjVvSDOseDe6mBs5Cc9aXvY5m3s94Eb81n/XQSmzPSJTOBS
8RUOgpeZ5v0c+lqcqjO5i5V8LswnrfQStP7mbk69ILzWPnyuN2uXBB4nyluBGpWT
dxDY1m+UYSgEJXqiiC7s41n4e3VMDOym3h7uZjN3r7gPr3Rtsh9W5m2ZhSqIu6Ox
S5/NyGlQ/jKoK+dgVKViKEWFobuvubFvyGTiHs8Xr+UO6EjBokUvbouuSJU52WFB
tfMFnOCvXJv5ubdAkqT2KWP/egqWwgaoSBvHRng+aU3Y6wB319E=
=JaWy
-----END PGP SIGNATURE-----

--nextPart2269872.OXnGdlAqal--





--===============5978089066418082047==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k

--===============5978089066418082047==--
