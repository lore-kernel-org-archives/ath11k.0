Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from durin.narfation.org ([2001:4d88:2000:7::2])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hazBl-0005Wn-8b
 for ath11k@lists.infradead.org; Wed, 12 Jun 2019 09:05:03 +0000
From: Sven Eckelmann <sven@narfation.org>
Subject: Re: [PATCH V7 3/8] ath11k: move phymode selection from function to
 array lookup
Date: Wed, 12 Jun 2019 11:04:42 +0200
Message-ID: <1644973.F42viomyVb@bentobox>
In-Reply-To: <20190603190157.25165-4-john@phrozen.org>
References: <20190603190157.25165-1-john@phrozen.org>
 <20190603190157.25165-4-john@phrozen.org>
MIME-Version: 1.0
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============4243165436369118684=="
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+kvalo=adurom.com@lists.infradead.org
To: ath11k@lists.infradead.org
Cc: Shashidhar Lakkavalli <slakkavalli@datto.com>, Kalle Valo <kvalo@codeaurora.org>, John Crispin <john@phrozen.org>

--===============4243165436369118684==
Content-Type: multipart/signed; boundary="nextPart5309766.hMNZ60ArAy"; micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart5309766.hMNZ60ArAy
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday, 3 June 2019 21:01:52 CEST John Crispin wrote:
> With HE support getting added, the approach of using functions will quickly
> get convoluted. Change the code to use an array lookup function instead.
> 
> Signed-off-by: Shashidhar Lakkavalli <slakkavalli@datto.com>
> Signed-off-by: John Crispin <john@phrozen.org>
> ---
[...]
>  u8 ath11k_mac_bitrate_to_idx(const struct ieee80211_supported_band *sband,
>  			     u32 bitrate)
>  {
> @@ -4062,7 +4045,12 @@ ath11k_mac_vdev_start_restart(struct ath11k_vif *arvif,
>  	arg.channel.freq = chandef->chan->center_freq;
>  	arg.channel.band_center_freq1 = chandef->center_freq1;
>  	arg.channel.band_center_freq2 = chandef->center_freq2;
> -	arg.channel.mode = chan_to_phymode(chandef);
> +	arg.channel.mode =
> +		ath11k_phymodes[chandef->chan->band][he_support][chandef->width];
> +	if (arg.channel.mode == MODE_11G &&
> +	    chandef->chan->flags & IEEE80211_CHAN_NO_OFDM)
> +		arg.channel.mode = MODE_11B;
> +	WARN_ON(arg.channel.mode == MODE_UNKNOWN);

What is the reason for splitting it up between HE and non-HE PHY modes? It is 
not like there is a split between VHT and HT PHY mode.

Kind regards,
	Sven
--nextPart5309766.hMNZ60ArAy
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEF10rh2Elc9zjMuACXYcKB8Eme0YFAl0AwCoACgkQXYcKB8Em
e0abgxAAuYHzsqbfp1scFlvYEJE3nNGQYEkfV/mZ944InNC6VKi22+xBgZrz0PW3
dnpeaY1MVRVVMNAehmGpCpTVVeguY3PVZwj9nWiVvHZa6l+uo+7QqGutY9V9kpvK
YYJV/ijPrHm9P7JPwf/usdd7Hf+ESCK2xjufrea5pEHBZLzWbFG2sU9Jx/uuj+F6
Hwys4b89GWnTspSm6QQqw8Up34xEKy1oikJSr896TNdYTMsIir2ZglerxEmfcAua
3Ul+hYTmyID++ly9rqxYydsjmBVJalpf13KmqTi9jukxjF801pO3aXuYrV6KmBbA
fGBn008P3w+8wdzDx9qopMdwogW9O+Swo2eAyHWvCTvvxDbyLfbKsUa2gxXZzSzL
VVaVV7VybXsAOzAjUtORuPWYUI7txuFRb+hKZSeWvHWXKw+FvclmiI6PxY854b4V
yAENoJnyk6KcbEcqNrkVOQSbLBLkdBZNhegsmmFX3VVBJ0oJS8RmNHfKIs/OVCbe
4eJyXPkNSAcZU4moK5dz8l1ERUuqRqtSh9pXq1lEyuObADeVkIHWdQXDZZPdWf4y
LuYdU+M+ERPHWXOfMYK9Cgh+jXSZ8MGylF6vSy+GQ0+piNV1Lsg82Y6VEO4eqSxB
NKSUTq+vLqDhkyCI6+i8x5xNPJ90D/2wSlfZX29s3X+vF+/34yg=
=SMlI
-----END PGP SIGNATURE-----

--nextPart5309766.hMNZ60ArAy--





--===============4243165436369118684==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k

--===============4243165436369118684==--
