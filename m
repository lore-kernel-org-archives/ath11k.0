Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
From: Sven Eckelmann <sven@narfation.org>
Subject: Re: [PATCH 2/2] ath11k: use cumulative survey statistics
Date: Mon, 04 May 2020 18:36:29 +0200
Message-ID: <1858610.Ps4IJGbiz4@bentobox>
In-Reply-To: <20200504154122.91862-2-markus.theil@tu-ilmenau.de>
References: <20200504154122.91862-1-markus.theil@tu-ilmenau.de>
 <20200504154122.91862-2-markus.theil@tu-ilmenau.de>
MIME-Version: 1.0
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============8296513545005216962=="
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+kvalo=adurom.com@lists.infradead.org
To: ath10k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, Markus Theil <markus.theil@tu-ilmenau.de>, kvalo@codeaurora.org, ath11k@lists.infradead.org

--===============8296513545005216962==
Content-Type: multipart/signed; boundary="nextPart15277854.gjROg6epRP"; micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart15277854.gjROg6epRP
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday, 4 May 2020 17:41:22 CEST Markus Theil wrote:
[...]
> diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
> index c2a972377687..322ddfda5bfd 100644
> --- a/drivers/net/wireless/ath/ath11k/wmi.c
> +++ b/drivers/net/wireless/ath/ath11k/wmi.c
> @@ -5610,16 +5610,16 @@ ath11k_pdev_bss_chan_info_event(struct ath11k_base *ab, struct sk_buff *skb)
[...]

What about the survey modifying code in ath11k_chan_info_event?

Kind regards,
	Sven
--nextPart15277854.gjROg6epRP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEF10rh2Elc9zjMuACXYcKB8Eme0YFAl6wRI0ACgkQXYcKB8Em
e0ZpiBAAz3O/JbFM/rpEAk7dzxZUlbGxcQy7DzqQ+yPIj/aBYVnUl7qPuCAYExEZ
oKRpLovr+/EyZE6pFkIjB5eo8G6aCoWiAgn8MSf3PHgcPsa3Izk+//lBDTUGafMl
csEtDBdQxlW1OZGJfzS1FHMeLvmcqzE+vzpihO7ZaNJXX7QpNCcHGty2TcDQol4F
5JDJigbwL18wmV2Za0rR3PmCj2lp41xO0g7g+Z8y6Yk4wUuq/R7oXIcfuFAES4hH
iq1ZbQedFjZ6n+ORIEKlqktdIucWSmzRPMHAHTLc72h3oUVH3HW8/jPSN5WHoIgl
avfXQ6DgkARfshn1vHrKMp3QUAcWMl9qLrkX0yEHLxVPJuSR8mC4g8u3rG0ikG03
m40zmdESnJE1zM5xVuSnuLr1F6xhlZf7QIl2A521SopfaMZb1Ju13r10bJ9GXELb
2YzWBhN1oJWFM684v6cVn5vQhY+Pc2sKOK5bAjNs4bJeIOeiv4L0JUx+HTtSHVFx
SdNHcGz+2vHpxqW/vyQmFFwhaDWM05UyxVD9Vmzeywd+rF2+hK4c0Gdp4OsKqip8
qtS3vyNY1JGS2whPSXO4CSVyK4mFM7cF8tdV+n7blpMNKDDX/nvscQiqYfR0S/u1
x3jmFqOGUrotyiBB8OTCkxITI3FBc+ZNFTXJGDZ1I5HpaMDQgj0=
=ZsEU
-----END PGP SIGNATURE-----

--nextPart15277854.gjROg6epRP--





--===============8296513545005216962==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k

--===============8296513545005216962==--
