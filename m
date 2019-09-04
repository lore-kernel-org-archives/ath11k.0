Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from us-smtp-delivery-195.mimecast.com ([63.128.21.195])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i5RTa-00026m-FT
 for ath11k@lists.infradead.org; Wed, 04 Sep 2019 09:21:20 +0000
Received: by mail-wm1-f71.google.com with SMTP id r21so871089wme.5
 for <ath11k@lists.infradead.org>; Wed, 04 Sep 2019 02:21:14 -0700 (PDT)
From: Sven Eckelmann <seckelmann@datto.com>
Subject: Re: [PATCH] ath11k: Disable SU support in meshpoint mode
Date: Wed, 04 Sep 2019 11:21:11 +0200
Message-ID: <2594368.AAUbcJAluJ@bentobox>
In-Reply-To: <20190904091527.27260-1-john@phrozen.org>
References: <20190904091527.27260-1-john@phrozen.org>
MIME-Version: 1.0
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============7811340253705328974=="
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+kvalo=adurom.com@lists.infradead.org
To: ath11k@lists.infradead.org
Cc: Kalle Valo <kvalo@codeaurora.org>, John Crispin <john@phrozen.org>

--===============7811340253705328974==
Content-Type: multipart/signed; boundary="nextPart1602893.FYITydG9fS"; micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart1602893.FYITydG9fS
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday, 4 September 2019 11:15:27 CEST John Crispin wrote:
> From: Sven Eckelmann <seckelmann@datto.com>
> 
> The firmware WLAN.HK.2.1.0.1-00629-QCAHKSWPL_SILICONZ-1 often stops sending
> data on 5GHz when SU support is advertised. A simple throughput benchmark
> will end up at only a couple hundred kilobytes per second (when finishing
> at all).
> 
> Disabling SU related flags works around this problem and allowed a maximum
> throughput of ~450 MBit/s in a simple test setup with an HK01 over air.
> 
> Signed-off-by: Sven Eckelmann <seckelmann@datto.com>
> ---
>  drivers/net/wireless/ath/ath11k/mac.c | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)

This is the incorrect patch. The correct version can be found at 
https://patchwork.kernel.org/project/ath11k/list/?series=159083

> diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
> index 4d40c9635a4a..0869900d7e18 100644
> --- a/drivers/net/wireless/ath/ath11k/mac.c
> +++ b/drivers/net/wireless/ath/ath11k/mac.c
> @@ -3365,19 +3365,20 @@ static int ath11k_mac_copy_he_cap(struct ath11k *ar,
>  			he_cap_elem->phy_cap_info[3] &=
>  				~(IEEE80211_HE_PHY_CAP3_RX_HE_MU_PPDU_FROM_NON_AP_STA |
>  				  IEEE80211_HE_PHY_CAP3_DCM_MAX_CONST_TX_MASK |
> -				  IEEE80211_HE_PHY_CAP3_DCM_MAX_CONST_RX_MASK);
> -			he_cap_elem->phy_cap_info[4] &=
> -				~IEEE80211_HE_PHY_CAP4_MU_BEAMFORMER;
> -			he_cap_elem->phy_cap_info[5] &=
> -				~IEEE80211_HE_PHY_CAP5_NG16_MU_FEEDBACK;
> +				  IEEE80211_HE_PHY_CAP3_DCM_MAX_CONST_RX_MASK |
> +			          IEEE80211_HE_PHY_CAP3_SU_BEAMFORMER);
> +			he_cap_elem->phy_cap_info[4] = 0;
> +			he_cap_elem->phy_cap_info[5] = 0;
>  			he_cap_elem->phy_cap_info[6] &=
>  				~(IEEE80211_HE_PHY_CAP6_CODEBOOK_SIZE_75_MU |
> +				  IEEE80211_HE_PHY_CAP6_TRIG_SU_BEAMFORMER_FB |
>  				  IEEE80211_HE_PHY_CAP6_TRIG_MU_BEAMFORMER_FB |
>  				  IEEE80211_HE_PHY_CAP6_TRIG_CQI_FB |
>  				  IEEE80211_HE_PHY_CAP6_PARTIAL_BANDWIDTH_DL_MUMIMO);
>  			he_cap_elem->phy_cap_info[7] &=
>  				~(IEEE80211_HE_PHY_CAP7_SRP_BASED_SR |
>  				  IEEE80211_HE_PHY_CAP7_POWER_BOOST_FACTOR_AR |
> +				  IEEE80211_HE_PHY_CAP7_HE_SU_MU_PPDU_4XLTF_AND_08_US_GI |
>  				  IEEE80211_HE_PHY_CAP7_STBC_TX_ABOVE_80MHZ |
>  				  IEEE80211_HE_PHY_CAP7_STBC_RX_ABOVE_80MHZ);
>  			he_cap_elem->phy_cap_info[8] &=
> 


--nextPart1602893.FYITydG9fS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEF10rh2Elc9zjMuACXYcKB8Eme0YFAl1vggcACgkQXYcKB8Em
e0YtNQ//QInqg3jhcohDgoHTgw/PoWQzPMoAYqIKCZOIKxS4qiJd10B54oCCFdiu
51Mffp3fRVO23iSrk/DucXXsDLkmJcaZr+8C/K80Txx15ZFpW+fknypfsGSe/ORa
VaFf/csUwaugrzuQw9VujGN3BkZ2jhGONPAoajfI8F4A0OjZsMed5XLEt7vN0BT1
YDyp0G8dIBeTYrjG6z+DRf+LYJGvcn7r7amJ/B8aG6DYHaY3PzaFM34MgVc0Sbki
uHh6cPFa60MXuDJ1eaAwDaSJdr9MXbCK2GUmJ+2dns1SvHoXUZn3+XB/Tz7Ne8Ga
ShNY7kqsGI0m+sRZyZGjoIQ2RS8arzPOm+bORhzTSDEybEoAznSvuYgBxTJQ7cDB
1uUEaXXOLYp/1rhrz77HN0wXHJ5JJaDX9wUWBzYInaoAqrLDxDi0WkxzhE3upoV9
WK5mvnoX7vSsfsX5AsydfQ2dr5WLJ/Pqoq/CXivdRxEbA9FPygYTziDOan+Mq62c
jB4vgt/QhWcM3VxUJZGWEIBvNhKFfC4YrNNbazLRBcfoCt8bXPqXKnNJXVvG5FOT
r+J5VEcrTCPlusJfPhz7kv38kOJB8aJLLUC4TW7byhBEiW1Tgtj1tvz4uMhbOfRu
bBK3EUXVPmm46ZpmUGOB6fsnhY3SAaU4HldDfqZmMXLQBQScdoY=
=w0y2
-----END PGP SIGNATURE-----

--nextPart1602893.FYITydG9fS--





--===============7811340253705328974==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k

--===============7811340253705328974==--
