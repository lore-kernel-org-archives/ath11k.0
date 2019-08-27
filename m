Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from dvalin.narfation.org ([2a00:17d8:100::8b1])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i2Z2x-0005Fo-TV
 for ath11k@lists.infradead.org; Tue, 27 Aug 2019 10:49:57 +0000
From: Sven Eckelmann <sven@narfation.org>
Subject: Re: [PATCH 10/49] ath11k: add debug.c
Date: Tue, 27 Aug 2019 12:49:48 +0200
Message-ID: <1739552.6LiyvA3Ra0@bentobox>
In-Reply-To: <f93b9c98fcfb9a910c3efc04d11d5aa0@codeaurora.org>
References: <1566316095-27507-1-git-send-email-kvalo@codeaurora.org>
 <18655975.RomJW5s5WE@bentobox>
 <f93b9c98fcfb9a910c3efc04d11d5aa0@codeaurora.org>
MIME-Version: 1.0
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0768506015537663960=="
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+kvalo=adurom.com@lists.infradead.org
To: Anilkumar Kolli <akolli@codeaurora.org>
Cc: devicetree@vger.kernel.org, linux-wireless@vger.kernel.org, ath11k@lists.infradead.org, Kalle Valo <kvalo@codeaurora.org>

--===============0768506015537663960==
Content-Type: multipart/signed; boundary="nextPart41236698.1DgVcCGkzx"; micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart41236698.1DgVcCGkzx
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday, 27 August 2019 12:04:27 CEST Anilkumar Kolli wrote:
> Could you plz try removing below patch?
> https://source.codeaurora.org/quic/qsdk/oss/system/feeds/wlan-open/tree/mac80211/patches/072-ath11k-print-stats-on-crash.patch?h=win_ap.1.0

It is not applied. At least I can't find any ath11k_core_dump_bp_stats

Kind regards,
	Sven
--nextPart41236698.1DgVcCGkzx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEF10rh2Elc9zjMuACXYcKB8Eme0YFAl1lCswACgkQXYcKB8Em
e0Yu8Q//UsAcD8O2MzZ8xpv84cQJY2NkB1JsFRc3Ww2QoYBKt2IP/wz5BiMwN1E6
bol+r3264SViCt3znDKhCy5MTiPYY5eOR0hk7BCa+d6Dsv1aklmTb8sgXEcdEGWD
O4v18ZAAWaTuUJlR1x1mNekYmqPR21qEB7+J/6RcAU0jPfeHOPS6X93ZWnyghcmI
YSq/GN+1coZ5xfDTH/4aIZ2fL8LnOwxFKzpmj81drqlrrw/iljN3RA4OrPa9HtNN
7uDBJPmk0H2+4rht/koJDg0EbUdF+pYHRcU/d2ktM6ho210kOcvNEDjK2T3PL6HZ
HH5/BVblq9gNLquQZSe/7qTweLzeIbOpARhnflRu1Xct2A8l0ibBwkn+ybxPNC2v
WJTp/6iOwrwAXs1pRfFnrYdvBDP/9Fw7fk4DnjEvolvmjNdjFIExqFxroYPI58IK
JMEwnIDGDtXJJ3B0mU9aSmPRDMraxgOR30rEzqvgB6TVfCUAVnmwl623nGfZ+fvW
nSpT/+q/SPt1YIsS413OanQbbhXkmIip+bzVByEMbObXCH2uK918oUGstalccqN2
ZjV63AEYOj7q+N7AD3s17KrUcrhu82fjnVxBi36eQlvTojZtk/tuNW3HK29CKVLJ
iZiZ0nyzAIk/s/qvU74KFVXmIAdqrECntuKOPtJtILoN5kxqDMc=
=9HJ7
-----END PGP SIGNATURE-----

--nextPart41236698.1DgVcCGkzx--





--===============0768506015537663960==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k

--===============0768506015537663960==--
