Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
From: Sven Eckelmann <sven@narfation.org>
Subject: Re: [PATCH 1/2] ath10k: use cumulative survey statistics
Date: Mon, 04 May 2020 18:29:26 +0200
Message-ID: <1760068.xeLkAeoAig@bentobox>
In-Reply-To: <20200504154122.91862-1-markus.theil@tu-ilmenau.de>
References: <20200504154122.91862-1-markus.theil@tu-ilmenau.de>
MIME-Version: 1.0
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============4186261836461906005=="
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+kvalo=adurom.com@lists.infradead.org
To: ath11k@lists.infradead.org
Cc: kvalo@codeaurora.org, linux-wireless@vger.kernel.org, Markus Theil <markus.theil@tu-ilmenau.de>, ath10k@lists.infradead.org

--===============4186261836461906005==
Content-Type: multipart/signed; boundary="nextPart3821530.ePlWPIuScu"; micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart3821530.ePlWPIuScu
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday, 4 May 2020 17:41:21 CEST Markus Theil wrote:
> ath10k currently reports survey results for the last interval between each
> invocation of NL80211_CMD_GET_SURVEY. For concurrent invocations, this
> can lead to unexpectedly small results, e.g. when hostapd uses survey
> data and iw survey dump is invoked in parallel. Fix this by returning
> cumulative results, that don't depend on the last invocation. Other
> drivers, e.g. ath9k or mt76 also use this behavior.

It is (unfortunately) not that trivial:

See code and comments from other people:

* https://patchwork.kernel.org/cover/11150285/
* https://patchwork.kernel.org/patch/11150287/
* https://patchwork.kernel.org/patch/11150289/

Kind regards,
	Sven

--nextPart3821530.ePlWPIuScu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEF10rh2Elc9zjMuACXYcKB8Eme0YFAl6wQuYACgkQXYcKB8Em
e0YCdhAAygPurJUmKQJVE5BgEzHYMvKcjs753EZjE4y4jiapgn1eygKetd86eG0y
v9/H370oOke8oR7OZD+LH/8KtQDuhAENiasfB9gpDwZJoEtfA5YjBQmUJLz/+K30
GJcqjCr2s2dCqIDIqXvKz+nJFgpDUkY1qowIi0/eQN9N10gIuUzh66eTLMTUUuSt
e5E1POqjvVHD8Fh5sa+e3vTofx2aeKJHI5Bkze59xm0gIh/l44f7YyHzeZnAJ5cZ
LlCAjpENR5aQvCkr3Vt6IMjJWtDk9/zydkzIkJAL99LyScdMYAgg3qnSekvIJ3N5
gDF28qSi+PwzpqGm1YSVtwv/BK7NjP5b7t0P6CZtWPmzypEEc8fUAYeIAGTwgVib
bsbuX/HQbxglLYQkoD6UQPjRkFOrNfM8SFR+rIjxc5DfVGG8dPPwfBqok0PbsRoE
JK/KP0Enjt2XsSswER5yCbqEZkIytWsAE/Eh3OfuFLGejOw9OhmfEnZQXyVbk4RP
5+4N6KkD+WS+AdctlXuS5+aR5tb5yMutQ7COn97kZGc2cR5OU89Sc3sFm+ydZGRK
EuXrsyW2V3p6Yh82Mi8aXR1pHwAGxS5+nyMT0Tg+c9hVEQx+2gfJhrNztEOFWXjD
m9jTk3xJtsGNoKqNijhFRCDQuykk5DGWUy96v/mVknpJcZqxh48=
=sviW
-----END PGP SIGNATURE-----

--nextPart3821530.ePlWPIuScu--





--===============4186261836461906005==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k

--===============4186261836461906005==--
