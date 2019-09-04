Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from us-smtp-delivery-195.mimecast.com ([216.205.24.195])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i5RTK-00024y-9d
 for ath11k@lists.infradead.org; Wed, 04 Sep 2019 09:21:04 +0000
Received: by mail-wr1-f70.google.com with SMTP id k15so11668985wrw.18
 for <ath11k@lists.infradead.org>; Wed, 04 Sep 2019 02:20:56 -0700 (PDT)
From: Sven Eckelmann <seckelmann@datto.com>
Subject: Re: [PATCH 4/4] ath11k: register HE mesh capabilities
Date: Wed, 04 Sep 2019 11:20:53 +0200
Message-ID: <3893111.i9o5eCVAVG@bentobox>
In-Reply-To: <20190904091211.26868-5-john@phrozen.org>
References: <20190904091211.26868-1-john@phrozen.org>
 <20190904091211.26868-5-john@phrozen.org>
MIME-Version: 1.0
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============1795280883470686589=="
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+kvalo=adurom.com@lists.infradead.org
To: ath11k@lists.infradead.org
Cc: Kalle Valo <kvalo@codeaurora.org>, John Crispin <john@phrozen.org>

--===============1795280883470686589==
Content-Type: multipart/signed; boundary="nextPart2822717.qiCDOn8M8D"; micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart2822717.qiCDOn8M8D
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday, 4 September 2019 11:12:11 CEST John Crispin wrote:
> From: Sven Eckelmann <seckelmann@datto.com>
> 
> The capabilities for the HE mesh are generated from the capabilities
> reported by the fw. But the firmware only reports the overall capabilities
> and not the one which are specific for mesh. Some of them (TWT, MU UL/DL,
> TB PPDU, ...) require an infrastructure setup with a main STA (AP)
> controlling the operations. This is not the case for mesh and thus these
> capabilities are removed from the list of capabilities.
> 
> Signed-off-by: Sven Eckelmann <seckelmann@datto.com>
> 
> Forwarded: https://patchwork.kernel.org/patch/11029297/
> ---
>  drivers/net/wireless/ath/ath11k/mac.c | 56 +++++++++++++++++++++++++++
>  1 file changed, 56 insertions(+)


This is the incorrect patch. The correct version can be found at 
https://patchwork.kernel.org/project/ath11k/list/?series=159083

> diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/
ath/ath11k/mac.c
> index b1964385b206..4d40c9635a4a 100644
> --- a/drivers/net/wireless/ath/ath11k/mac.c
> +++ b/drivers/net/wireless/ath/ath11k/mac.c
> @@ -3297,6 +3297,7 @@ static int ath11k_mac_copy_he_cap(struct ath11k *ar,
>  		switch (i) {
>  		case NL80211_IFTYPE_STATION:
>  		case NL80211_IFTYPE_AP:
> +		case NL80211_IFTYPE_MESH_POINT:
>  			break;
>  
>  		default:
> @@ -3337,6 +3338,61 @@ static int ath11k_mac_copy_he_cap(struct ath11k *ar,
>  			he_cap_elem->phy_cap_info[9] |=
>  				IEEE80211_HE_PHY_CAP9_TX_1024_QAM_LESS_THAN_242_TONE_RU;
>  			break;
> +		case NL80211_IFTYPE_MESH_POINT:
> +			he_cap_elem->mac_cap_info[0] &=
> +				~(IEEE80211_HE_MAC_CAP0_TWT_RES |
> +				  IEEE80211_HE_MAC_CAP0_TWT_REQ);
> +			he_cap_elem->mac_cap_info[2] &=
> +				~(IEEE80211_HE_MAC_CAP2_TRS |
> +				  IEEE80211_HE_MAC_CAP2_BCAST_TWT |
> +				  IEEE80211_HE_MAC_CAP2_MU_CASCADING);
> +			he_cap_elem->mac_cap_info[3] &=
> +				~(IEEE80211_HE_MAC_CAP3_FLEX_TWT_SCHED |
> +				  IEEE80211_HE_MAC_CAP2_BCAST_TWT |
> +				  IEEE80211_HE_MAC_CAP2_MU_CASCADING);
> +			he_cap_elem->mac_cap_info[4] &=
> +				~(IEEE80211_HE_MAC_CAP4_BSRP_BQRP_A_MPDU_AGG |
> +				  IEEE80211_HE_MAC_CAP4_BQR);
> +			he_cap_elem->mac_cap_info[5] &=
> +				~(IEEE80211_HE_MAC_CAP5_SUBCHAN_SELECVITE_TRANSMISSION |
> +				  IEEE80211_HE_MAC_CAP5_UL_2x996_TONE_RU |
> +				  IEEE80211_HE_MAC_CAP5_PUNCTURED_SOUNDING |
> +				  IEEE80211_HE_MAC_CAP5_HT_VHT_TRIG_FRAME_RX);
> +
> +			he_cap_elem->phy_cap_info[2] &=
> +				~(IEEE80211_HE_PHY_CAP2_UL_MU_FULL_MU_MIMO |
> +				  IEEE80211_HE_PHY_CAP2_UL_MU_PARTIAL_MU_MIMO);
> +			he_cap_elem->phy_cap_info[3] &=
> +				~(IEEE80211_HE_PHY_CAP3_RX_HE_MU_PPDU_FROM_NON_AP_STA |
> +				  IEEE80211_HE_PHY_CAP3_DCM_MAX_CONST_TX_MASK |
> +				  IEEE80211_HE_PHY_CAP3_DCM_MAX_CONST_RX_MASK);
> +			he_cap_elem->phy_cap_info[4] &=
> +				~IEEE80211_HE_PHY_CAP4_MU_BEAMFORMER;
> +			he_cap_elem->phy_cap_info[5] &=
> +				~IEEE80211_HE_PHY_CAP5_NG16_MU_FEEDBACK;
> +			he_cap_elem->phy_cap_info[6] &=
> +				~(IEEE80211_HE_PHY_CAP6_CODEBOOK_SIZE_75_MU |
> +				  IEEE80211_HE_PHY_CAP6_TRIG_MU_BEAMFORMER_FB |
> +				  IEEE80211_HE_PHY_CAP6_TRIG_CQI_FB |
> +				  IEEE80211_HE_PHY_CAP6_PARTIAL_BANDWIDTH_DL_MUMIMO);
> +			he_cap_elem->phy_cap_info[7] &=
> +				~(IEEE80211_HE_PHY_CAP7_SRP_BASED_SR |
> +				  IEEE80211_HE_PHY_CAP7_POWER_BOOST_FACTOR_AR |
> +				  IEEE80211_HE_PHY_CAP7_STBC_TX_ABOVE_80MHZ |
> +				  IEEE80211_HE_PHY_CAP7_STBC_RX_ABOVE_80MHZ);
> +			he_cap_elem->phy_cap_info[8] &=
> +				~(IEEE80211_HE_PHY_CAP8_HE_ER_SU_PPDU_4XLTF_AND_08_US_GI |
> +				  IEEE80211_HE_PHY_CAP8_20MHZ_IN_40MHZ_HE_PPDU_IN_2G |
> +				  IEEE80211_HE_PHY_CAP8_20MHZ_IN_160MHZ_HE_PPDU |
> +				  IEEE80211_HE_PHY_CAP8_80MHZ_IN_160MHZ_HE_PPDU);
> +			he_cap_elem->phy_cap_info[9] &=
> +				~(IEEE80211_HE_PHY_CAP9_LONGER_THAN_16_SIGB_OFDM_SYM |
> +				  IEEE80211_HE_PHY_CAP9_NON_TRIGGERED_CQI_FEEDBACK |
> +				  IEEE80211_HE_PHY_CAP9_RX_1024_QAM_LESS_THAN_242_TONE_RU |
> +				  IEEE80211_HE_PHY_CAP9_TX_1024_QAM_LESS_THAN_242_TONE_RU |
> +				  IEEE80211_HE_PHY_CAP9_RX_FULL_BW_SU_USING_MU_WITH_COMP_SIGB |
> +				  
IEEE80211_HE_PHY_CAP9_RX_FULL_BW_SU_USING_MU_WITH_NON_COMP_SIGB);
> +			break;
>  		}
>  
>  		he_cap->he_mcs_nss_supp.rx_mcs_80 =
> 


--nextPart2822717.qiCDOn8M8D
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEF10rh2Elc9zjMuACXYcKB8Eme0YFAl1vgfUACgkQXYcKB8Em
e0YgkA/9HEmGJuH5XNF/66Lro5JhyAYFivPSeyxvwIdVAOWpKrn5+5sK8Ni0QoLX
MiEHJ+2t49TJdoVbVbKEF6Qeg18RDchBX3HNsnFTY1AXLU7e9do1D8AtOCvYhka1
aldan48DZJ3s+/xSH2OCrWJ9t9Up+5x3MNBLwF7UJtUSwgvReIZYvRSbfY77Aehu
3mVXVd9Ryu1DWNDXLSOrwLkwhFic+pTmtWRlkQabYYVeZxRkAc48/CCwF+BloRk/
D5T1rgOVZh3E5w93NVmnYHG5QMfRl0ZKpBqT1Qfz+ydFqfqotvWoeMNFDGzjtaZb
PeLp/SgrWxN9COz65v0mTE82PSFKSfvZrzc3Tya+mTfCm4LMCU+HPOZLVIB/4+5g
5Gn6O8VLnGxL1/Qo6Ef+r7f1hdjz+UXsALEWoZvL55uo+PqmTyzxy2SZ2LJH6Y6P
WqCmd5Htx3U9Sxu8PjVIgaU0SM7OE/99VnT9xHnOv9ua/1JhS+Fvk11gvzMpIpdi
/7STYfm88PQjJVzB06lYpd2frdoCMSwYucCJ1uZxTgvwdYUDTN4j4t8QlrhNX6YM
HEcSEhKhf4HwlWx8EQhebpqLsvGBUSgChL6fRX5gvi348wIBJjeGDBwzEQRhOGe8
vp3nysusWKvl+HZUPnN/15/HreYjqv8on1/6k0A9fL3GATLNe0M=
=G6Ec
-----END PGP SIGNATURE-----

--nextPart2822717.qiCDOn8M8D--





--===============1795280883470686589==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k

--===============1795280883470686589==--
