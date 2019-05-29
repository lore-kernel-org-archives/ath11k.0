Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from narfation.org ([2001:4d88:2000:7::2] helo=v3-1039.vlinux.de)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hVtD5-0005AI-LA
 for ath11k@lists.infradead.org; Wed, 29 May 2019 07:41:21 +0000
From: Sven Eckelmann <sven@narfation.org>
Subject: Re: [PATCH v2 0/3] ath11k: Add Mesh mode support
Date: Wed, 29 May 2019 09:41:13 +0200
Message-ID: <1778145.5V7WxVhUSl@bentobox>
In-Reply-To: <09bc6205f3f65f60c12613555fdba695@codeaurora.org>
References: <1555697498-27472-1-git-send-email-rmanohar@codeaurora.org>
 <3594678.I98WQv5yxB@bentobox>
 <09bc6205f3f65f60c12613555fdba695@codeaurora.org>
MIME-Version: 1.0
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============4908239572301318747=="
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+kvalo=adurom.com@lists.infradead.org
To: ath11k@lists.infradead.org
Cc: Rajkumar Manoharan <rmanohar@codeaurora.org>, Pradeep Chitrapu <pradeepc@qti.qualcomm.com>

--===============4908239572301318747==
Content-Type: multipart/signed; boundary="nextPart62367013.IdmHKuHRzy"; micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart62367013.IdmHKuHRzy
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday, 29 May 2019 06:26:16 CEST Rajkumar Manoharan wrote:
> FW assert occurs, if a mesh node of different phymode/bw tries to join
> existing mesh network. We noticed this issue when 11n device peering 
> with ath11k mesh
> node. IMHO this shouldn't be HT/VHT specific. It is problem of mixed 
> mode.

Happens for me when both HK01 boards are set up the same way (see the examples 
which I provided) in an earlier mail.

Will check it again when I was informed that the new firmware is available for 
us.

Kind regards,
	Sven
--nextPart62367013.IdmHKuHRzy
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEF10rh2Elc9zjMuACXYcKB8Eme0YFAlzuN5kACgkQXYcKB8Em
e0bYFA//UGuOhg5FtCZTIz/s8jLLaHWNexec6aBqmVA4KTdT20PYz31xRtLNC9rU
jBQ0HW+B+qSvs3pzoUet7pOWHjvsxuklxFtaixTsN72hZQdXZySpe3HxRLEpm0fk
h7xhL62uQbtTFeTo4ATVZoIYDP8RjoGPBgSgXNckfjMrA0V1upA4h5yaiLKAWlqS
T3c7K+0JM2ZSArTs7kkaqUBP8Qb1X4H65Rc4aMl6WaCbb+nJFqWAcQT6eXrXkoWO
GlI6r+PmJauCcIL6ed3ufQRjezXoQaoxAkVid7/zIEPLq8YVNXEmkSTgaZnI3i13
AqHDvve6RDnljCz9ZuYzTcewyWsgRikK31BBwDfB2dt5TSEVpnLy4T/tlrU0LdGV
MWn95q1GqF6VaFpiVG8QyjVHAINozfF8YGJAXHloFT1cln5YWZ0MFlbfT3TfRQ/W
9JleBIEv/i/W2HWyzvBU5JI7bejNfMzUkSAB0+o0Yc3R+XDI697jU7Hn9fWvnHyv
vTkp3fvdEKdFfZQCmOonsD/aCgQUSe3RiKSZuH7WjvaLilUlaFATMyjUR8SW84i+
UsijmZBlBdrdUqzJFkEzkOWzIIegs7t7pA9plh+1ve4KexP4NEgsfeUQUy+sv9NS
OMwBLR67ccNYfBupmj2UC+/Fijfy0XC34psrclGkeOAvAmnhui8=
=4FJf
-----END PGP SIGNATURE-----

--nextPart62367013.IdmHKuHRzy--





--===============4908239572301318747==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k

--===============4908239572301318747==--
