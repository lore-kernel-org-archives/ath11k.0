Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
From: Sven Eckelmann <sven@narfation.org>
Subject: Re: [PATCH 1/2] ath10k: use cumulative survey statistics
Date: Tue, 05 May 2020 09:49:46 +0200
Message-ID: <1845755.pTfhzBy2qg@bentobox>
In-Reply-To: <2335594.cnkAv9Vaq7@bentobox>
References: <20200504154122.91862-1-markus.theil@tu-ilmenau.de>
 <f772b7bf0eac31516a4e28719c1938f2@codeaurora.org>
 <2335594.cnkAv9Vaq7@bentobox>
MIME-Version: 1.0
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============1255509882856008525=="
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+kvalo=adurom.com@lists.infradead.org
To: ath11k@lists.infradead.org
Cc: Rajkumar Manoharan <rmanohar@codeaurora.org>, linux-wireless-owner@vger.kernel.org, linux-wireless@vger.kernel.org, Markus Theil <markus.theil@tu-ilmenau.de>, ath10k@lists.infradead.org, kvalo@codeaurora.org

--===============1255509882856008525==
Content-Type: multipart/signed; boundary="nextPart4024693.4Mujkspm9b"; micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart4024693.4Mujkspm9b
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday, 5 May 2020 09:01:34 CEST Sven Eckelmann wrote:
> On Tuesday, 5 May 2020 01:46:12 CEST Rajkumar Manoharan wrote:
> [...]
> > IIRC this was fixed a while ago by below patch. Somehow it never landed 
> > in ath.git.
> > Simple one line change is enough.
> > 
> > https://patchwork.kernel.org/patch/10550707/
> 
> Because it doesn't work for everything. Remember that 10.2.4.x overflows all 
> the time (14-30s) because it used only 31 bit for the counters.
> 
> But feel free to point me to the firmware version which fixed this.

See also https://patchwork.kernel.org/patch/9701459/

Kind regards,
	Sven
--nextPart4024693.4Mujkspm9b
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEF10rh2Elc9zjMuACXYcKB8Eme0YFAl6xGpoACgkQXYcKB8Em
e0ZzCRAAgqYCt2mvPP4dcDSuLObeeqnrlCg1zGaJJZTOYiTbGbBOFPKRKKWoX/PG
manCnusFGFRHSpoGC94W89wlOJ6EW9x2RMy7ylws0z15iOzziE6faiE9XNuczjQw
+NVHZthe6xgWq5iORv2+zGtVqPPjvzoVcObZyyTdWtYmnVEb/Vo5W0g713/ha42K
IHfFLbcwdW3OjVFEd88hEt6sOaMeM86ZmZql6cox23CNzYfG76BcNUvgta7l2Tr1
MvpLrattlWdTP+6uWabdIdJp2IDKFj9DeEQrvUUuIlQJO1lbiZSBK+/jMqv0buNS
dImQBdrJZElVL7LW0hqgYHesekgpigVOt4gWd/mZfJlH6dtzW8hp/btxonCzecfd
DUJchzFPJv4LfAswoWEr/Uw3MYwi7W0pdcbKCJQbzchHgMfO2mtWX6BvfdU5Pvl3
V5tmKzNbpJIZTFUKh0mFqsceBRXU/fYWU9S3IuAuFmPzTnew4YeBKQj/xhHmduhx
dXF6IQU69fM2hKUQWZV9NCxmCzHXhytChza4JeQpGhXKM8bQ4sH7yuMWrSlKJ7VU
D14XlUppGsOW8uKK6VNl76DfFpWqs76bZs95npCX0u188PwTTTAGpbqaizZjXZ5q
OWF98ErpHvU88aaLjKsYNmUOj6pXyRCfADeukZnuXHKUWSyf3jw=
=8mIN
-----END PGP SIGNATURE-----

--nextPart4024693.4Mujkspm9b--





--===============1255509882856008525==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k

--===============1255509882856008525==--
