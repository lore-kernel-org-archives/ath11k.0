Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from dvalin.narfation.org ([2a00:17d8:100::8b1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kaLgE-0004SY-SD
 for ath11k@lists.infradead.org; Wed, 04 Nov 2020 16:30:39 +0000
From: Sven Eckelmann <sven@narfation.org>
Subject: Re: ath11k: Country code setting ignored on bootup
Date: Wed, 04 Nov 2020 17:30:34 +0100
Message-ID: <1657154.X513TT2pbd@ripper>
In-Reply-To: <43403436f6d704fa510cb290872b794a@codeaurora.org>
References: <1829665.1PRlr7bOQj@ripper>
 <BYAPR02MB41208890EFBE3E186114FBC1F7EF0@BYAPR02MB4120.namprd02.prod.outlook.com>
 <43403436f6d704fa510cb290872b794a@codeaurora.org>
MIME-Version: 1.0
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============1132138162086728924=="
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+kvalo=adurom.com@lists.infradead.org
To: ath11k@lists.infradead.org, Sriram R <srirrama@codeaurora.org>
Cc: sw@simonwunderlich.de

--===============1132138162086728924==
Content-Type: multipart/signed; boundary="nextPart2064428.C4sosBPzcN"; micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart2064428.C4sosBPzcN
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"; protected-headers="v1"
From: Sven Eckelmann <sven@narfation.org>
To: ath11k@lists.infradead.org, Sriram R <srirrama@codeaurora.org>
Cc: sw@simonwunderlich.de
Subject: Re: ath11k: Country code setting ignored on bootup
Date: Wed, 04 Nov 2020 17:30:34 +0100
Message-ID: <1657154.X513TT2pbd@ripper>
In-Reply-To: <43403436f6d704fa510cb290872b794a@codeaurora.org>
References: <1829665.1PRlr7bOQj@ripper> <BYAPR02MB41208890EFBE3E186114FBC1F7EF0@BYAPR02MB4120.namprd02.prod.outlook.com> <43403436f6d704fa510cb290872b794a@codeaurora.org>

On Wednesday, 4 November 2020 17:25:53 CET Sriram R wrote:
> btw, i dont see any possible issues in current usage of 
> ATH11k_FLAG_REGISTERED in
>   ath11k_debug_pdev_create, ath11k_mac_register and ath11k_mac_allocate
> since they sequenced and fall within the same context. Do you face any 
> issues?

A firmware crash before ATH11K_QMI_EVENT_FW_READY was processed/received. So 
we might want to recreate the mac/debugfs/... even when it was already created 
- at least this is the stuff mentioned in the commit(s) which introduce the 
ATH11k_FLAG_REGISTERED in these positions.

Kind regards,
	Sven
--nextPart2064428.C4sosBPzcN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEF10rh2Elc9zjMuACXYcKB8Eme0YFAl+i1yoACgkQXYcKB8Em
e0ZhIw//anD35DI1LVGZJQOEHBMgrBSwtFQIFZvrLcU938ZNjZDWnfiJ/FtmgIkn
km3dp+bkoTRYPgItlaOAglm/YqHsOjw4caZ4nO5PlppG+I1wkiodf/Xs8txECCpW
zItRML/4SSwubdJwwmQFc87bNAwR/7lp7XcZDiStV+PEhHolDCMZvM2wnpF4xasv
7JXJLuiGdYI1bwX67ZwNTbnzTVUbNZKCI9CF7FYPrzNieiCd8HVoLQXEUWBda1LM
oeBD2+RgZ1ouQKO8rd5NBhv+i3LEyPoS5cqqBK4iXg9bj/fO6lQlkzGhwj/wWlj1
2d6IcXRukNVwm7MBN0DlMkQewfe4JeRQN5PUt2Fhk2ioL/LOJX58VpyWaa9yTz2x
eOA6ykTra/xe4AB75NNgcWQe0R7wEry6tFOtreOosABL0FCzKpoNu80uPWW1TfIK
UliCTNDqF90D7crAG9n5QH3Ozg+3+vPHsnIVvLMfESr9InHlubtrbvKKI9OcClr2
ZtRZfdrfEHgWZvxshhb23EmZCo8h6zFnrnhfezA4rF6J+uClB1t6T0l6NIXCBIZl
36ZVCp3MS6YzMYI3F5e5bconyER3RcbcG5xI5+sTgDge80Z1cjivyO5zsVMooeDM
Wkr+BUVjNI2LarNQiBcaoL96GfgfpLTP+Oz+5k550AWhrIBiW80=
=/n2s
-----END PGP SIGNATURE-----

--nextPart2064428.C4sosBPzcN--





--===============1132138162086728924==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k

--===============1132138162086728924==--
