Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from narfation.org ([2001:4d88:2000:7::2] helo=v3-1039.vlinux.de)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hVdGU-0008Vu-6B
 for ath11k@lists.infradead.org; Tue, 28 May 2019 14:39:47 +0000
From: Sven Eckelmann <sven@narfation.org>
Subject: Re: [PATCH v2 0/3] ath11k: Add Mesh mode support
Date: Tue, 28 May 2019 16:39:39 +0200
Message-ID: <3594678.I98WQv5yxB@bentobox>
In-Reply-To: <1931905.PyyBc1jC1X@bentobox>
References: <1555697498-27472-1-git-send-email-rmanohar@codeaurora.org>
 <1931905.PyyBc1jC1X@bentobox>
MIME-Version: 1.0
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============1535823912164154335=="
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+kvalo=adurom.com@lists.infradead.org
To: ath11k@lists.infradead.org
Cc: Rajkumar Manoharan <rmanohar@codeaurora.org>

--===============1535823912164154335==
Content-Type: multipart/signed; boundary="nextPart10829153.VCfYJ5ufOz"; micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart10829153.VCfYJ5ufOz
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday, 28 May 2019 15:48:25 CEST Sven Eckelmann wrote:
[...]
> What else is required to get this working? I used ath11k-bringup (which 
> included these patches) and wanted to implement the HE registration part for 
> it. But it turns out that it doesn't event work here with VHT. This is what 
I 
> did on two HK01 rev B:
[...]

Just talked to John. It seems that mesh at the moment only "works" when using 
legacy (non-HT) mode (this is what he used previously - so mesh join without 
freq and bandwidth):

    iw phy phy2 interface add mesh2 type mp
    ip link set up dev mesh2
    iw dev mesh2 mesh join testmesh

But the HT/VHT stuff is just crashing the firmware as shown in the last mail.

    iw dev mesh2 mesh join testmesh freq 5180 80MHz

Also tested ph1 with "freq 2412 HT20" and it crashed the same way.

Kind regards,
	Sven
--nextPart10829153.VCfYJ5ufOz
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEF10rh2Elc9zjMuACXYcKB8Eme0YFAlztSCsACgkQXYcKB8Em
e0bc2RAAvJnTvQvcsZoZtZC5+tM5N265lca7Fw9lP0uKVTEJzYGwlpKFgsjylNj1
kHUUocmcQPA8SaiOz3VphRmiW1ECCAIlN0uTL91Je9gGL01m25AL6ZYdLWtqKx4H
G4kWGkE+19q+eVwiZ4bb8Hh1PgX8d7czabeLuswuoGYQVKYaxYSy0RHor0GBQK+N
aIBv/neaG89s/JyvkWtflYpOdnCoSETLRpu4zPyiMXN4rI6gHVJYqsN6I92plTqy
yiV0RzSfcK9IB919JPhfMDEGVw1FZyy8N+aHcY9X+DqxvTMlNR/4+VNNtF3iFE2c
rNnIFqhOyfbsVU1idvIlutwYm1SBnN0b3Z9ZWhRdMB40t/wu8aLbcA55hhXROFwY
nbJ2VXPpbDKaO0CjfU1TDrBXO8NkT3yqxC+KcvotxYlyj2eYt9o5Bf//Y/2j/Ode
nl+dPxfHmaOfHiMi6hKWYW3CFolfidZQLmBvyUmZ50W/RUetIRwCVF+OppsY6RWd
Sr7Jj2zjx4HoxZPKwE4OipUwnbvxfKNF/JfKRQ5gURyjtDX0+IMWHah2lgkLtGf+
g8lTltixeVZURdiyL61njOJ7xsWkpzhxnfhQguHgvwdbCywDhMTrGS8T6MxIp/uE
MsYS0Bhnrb5YHdbggKI+94hnPtPxDiN/OsB/WXPzVFtvA2AuOWs=
=VBgJ
-----END PGP SIGNATURE-----

--nextPart10829153.VCfYJ5ufOz--





--===============1535823912164154335==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k

--===============1535823912164154335==--
