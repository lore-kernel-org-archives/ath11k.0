Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from dvalin.narfation.org ([213.160.73.56])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hqKHR-0008Eo-2q
 for ath11k@lists.infradead.org; Wed, 24 Jul 2019 16:38:18 +0000
From: Sven Eckelmann <sven@narfation.org>
Subject: Re: [PATCH v5 0/4] mac80211/ath11k: HE mesh support
Date: Wed, 24 Jul 2019 18:38:13 +0200
Message-ID: <4232659.0svU1X7Big@bentobox>
In-Reply-To: <20190724163359.3507-1-sven@narfation.org>
References: <20190724163359.3507-1-sven@narfation.org>
MIME-Version: 1.0
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============2421104189440229427=="
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+kvalo=adurom.com@lists.infradead.org
To: ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org

--===============2421104189440229427==
Content-Type: multipart/signed; boundary="nextPart2088208.6srCk4DusC"; micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart2088208.6srCk4DusC
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday, 24 July 2019 18:33:55 CEST Sven Eckelmann wrote:
> Hi,
> 
> Some features of 802.11ax without central organizing (AP) STA can also be
> used in mesh mode. The main goal is to get HE mesh working with ath11k.
> For persons without ath11k compatible hw, hwsim can be used in the as basis
> for further development of these features.
> 
> * v5

Sorry forgot to change the version to v5 for the first two patches. They have 
to generated from two different trees (one with the ath11k sources and one 
with the mac80211 stuff). And this is the reason why the ath11k ones have the 
correct version number included.

Kind regards,
	Sven

--nextPart2088208.6srCk4DusC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEF10rh2Elc9zjMuACXYcKB8Eme0YFAl04iXUACgkQXYcKB8Em
e0YnsRAAlUdOZollmJx5aXK8//P6My4H4wWCd4J6vTt5656HEFXblwZY+Y6MaNaV
ZuJqksxO6VHrAjopVbMO9MOO8dRVm72XU9s/1slu1Z+nVvau5cKNTW1r21OV+2r2
aj5q9ESj8QoZKYskGJujKeJM5iFnqoDhq7OUV69mmGwHBGDuK0VAh+4Dopk/Q3dx
L++yw/UeFZrQLImbPy+dV5SEOaN+u0GrsSjPwCN159/JUWRXjZxrssLIABmWZGgL
O3y0BjgXikrT/hLf1bk6H/8S5nweEi4hEjOxbkyqiJSkWa8BF9ygI/ryXw5rTsVu
kU6T6V4mU6L9FxZfbWoKEYji3RvjwBn/t+vFWsBkIUcvXfCa8fkzd9z8fX+Uimrr
MgkCj8DFhRggPV8KMJQuNaUkjSMO2KbDX3hSPrr82KnLX0tG3JyWVXanYfM3HGKJ
KOEI3TWUqxbtpRy8JNNACJ++TYof6+vk5taRIeRWGrAutyGEyzBcbQO2+qri7xEL
0wj/cPWdQNcBVtRhtIx/OQG0M+q0CwuX8X+KU4SZma/SbY3a4EmMHOU+Wv9QTP1M
0MpfY+KCB/dOVfjojxP3p+qGGnMq7xxkCtJh/lUEFD2zd58qj9NIjufOzMHxGsPR
zDHORNi8FRqWFbm3rDqLO47dpo/EwDOHRuFxJJ4INu23/YMlKtQ=
=fHBH
-----END PGP SIGNATURE-----

--nextPart2088208.6srCk4DusC--





--===============2421104189440229427==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k

--===============2421104189440229427==--
