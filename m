Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
From: Sven Eckelmann <sven@narfation.org>
Subject: Re: [PATCH 1/2] ath10k: use cumulative survey statistics
Date: Tue, 05 May 2020 09:01:34 +0200
Message-ID: <2335594.cnkAv9Vaq7@bentobox>
In-Reply-To: <f772b7bf0eac31516a4e28719c1938f2@codeaurora.org>
References: <20200504154122.91862-1-markus.theil@tu-ilmenau.de>
 <f772b7bf0eac31516a4e28719c1938f2@codeaurora.org>
MIME-Version: 1.0
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============2104430274756850094=="
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+kvalo=adurom.com@lists.infradead.org
To: ath11k@lists.infradead.org
Cc: Rajkumar Manoharan <rmanohar@codeaurora.org>, linux-wireless-owner@vger.kernel.org, linux-wireless@vger.kernel.org, Markus Theil <markus.theil@tu-ilmenau.de>, ath10k@lists.infradead.org, kvalo@codeaurora.org

--===============2104430274756850094==
Content-Type: multipart/signed; boundary="nextPart2406179.bnRGkfsQJl"; micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart2406179.bnRGkfsQJl
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday, 5 May 2020 01:46:12 CEST Rajkumar Manoharan wrote:
[...]
> IIRC this was fixed a while ago by below patch. Somehow it never landed 
> in ath.git.
> Simple one line change is enough.
> 
> https://patchwork.kernel.org/patch/10550707/

Because it doesn't work for everything. Remember that 10.2.4.x overflows all 
the time (14-30s) because it used only 31 bit for the counters.

But feel free to point me to the firmware version which fixed this.

Kind regards,
	Sven
--nextPart2406179.bnRGkfsQJl
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEF10rh2Elc9zjMuACXYcKB8Eme0YFAl6xD04ACgkQXYcKB8Em
e0YEVw//TH/fq0NNa8BsCXeGXzxlVMEexjFoX4Kd4gu+kbKZaN6e6kHdfp4jVfFL
nWvkEuCkVytqr+7pBRVvPHOdKoLTJXwkbIdfbtz2GR+qpVDqxC90qn+pPJr33V4D
Tinws56w4EhXK3YLaptPZRYGmRUjXIsMd6+KCdUyNupG1ztIlwrSUfTYdk6imWkS
XXUin/LTR5YsVGkBKoj3NNyBcjAvr//g+PLTiWR/PBmIDBYzl1QhvBrxMURuN8wx
sUeco+4LlP1nunB6OE2JwikoOK0AAFc8SyjHgZeBXm45cDmbnMeYhcLYYnakl+gs
BifsmGgeeNPl2smGYgkUC0VtisX3p4/mFU0B87Fp9RD4ouO2bFTCldbmDROTX/gY
m55yIZIWhH908xPVjf4SLQpaC3IBSTHmfEZ1ie/5guO8E0q19pZCoDLRiYdYpUtv
USM/9+8M68yXrvgdg/Xxi/gcOHDeKeZIXb3gxYK1+xoIfahGdM/t/IFE9qIN5O+n
hCYEBnbA26niZop3JDQxDHesjGA8uuPkBT+xtaUqWzDgBANG4DWn94uyZGffTapk
dCYwFM0jdzTdQQuPYDphwMisi+P42x9jgk0QkmCgAh6CfWxdTe9D44UgCs/8+lZd
wTzFvz5lcyJv8BsOjpzHA/6mI9CiJ7178pwOYU9SR43zF4pr8kw=
=nZKo
-----END PGP SIGNATURE-----

--nextPart2406179.bnRGkfsQJl--





--===============2104430274756850094==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k

--===============2104430274756850094==--
