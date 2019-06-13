Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from durin.narfation.org ([79.140.41.39])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hbLBb-0005Sf-DO
 for ath11k@lists.infradead.org; Thu, 13 Jun 2019 08:34:21 +0000
From: Sven Eckelmann <sven@narfation.org>
Subject: Re: [PATCH v2] ath11k: fix firmware assert due to phymode mismatch
Date: Thu, 13 Jun 2019 10:34:14 +0200
Message-ID: <22617229.yAUoFtrAxf@bentobox>
In-Reply-To: <1560411097-9094-1-git-send-email-mpubbise@codeaurora.org>
References: <1560411097-9094-1-git-send-email-mpubbise@codeaurora.org>
MIME-Version: 1.0
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============1648075543466144121=="
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+kvalo=adurom.com@lists.infradead.org
To: ath11k@lists.infradead.org
Cc: Manikanta Pubbisetty <mpubbise@codeaurora.org>

--===============1648075543466144121==
Content-Type: multipart/signed; boundary="nextPart2238072.0elIQFGmMR"; micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart2238072.0elIQFGmMR
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday, 13 June 2019 09:31:37 CEST Manikanta Pubbisetty wrote:
[...]
> diff --git a/drivers/net/wireless/ath/ath11k/core.h b/drivers/net/wireless/ath/ath11k/core.h
> index 038f905..f853c3c 100644
> --- a/drivers/net/wireless/ath/ath11k/core.h
> +++ b/drivers/net/wireless/ath/ath11k/core.h
> @@ -211,6 +211,9 @@ struct ath11k_vif {
>  	int num_legacy_stations;
>  	int rtscts_prot_mode;
>  	int txpower;
> +	bool ht_enabled;
> +	bool vht_enabled;
> +	bool he_enabled;
>  };

Don't use bool's in structs. Something like

    u8 ht_enabled:1;

is preferred in the kernel [1].

> diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
> index 8c47e09..7ca6958 100644
> --- a/drivers/net/wireless/ath/ath11k/mac.c
> +++ b/drivers/net/wireless/ath/ath11k/mac.c
> @@ -790,6 +790,7 @@ static int ath11k_mac_setup_bcn_tmpl(struct ath11k_vif *arvif)
>  	struct ieee80211_vif *vif = arvif->vif;
>  	struct ieee80211_mutable_offsets offs = {};
>  	struct sk_buff *bcn;
> +	u8 *ies;
>  	int ret;
>  
>  	if (arvif->vdev_type != WMI_VDEV_TYPE_AP)
> @@ -809,6 +810,20 @@ static int ath11k_mac_setup_bcn_tmpl(struct ath11k_vif *arvif)
>  		ath11k_warn(ab, "failed to submit beacon template command: %d\n",
>  			    ret);
>  
> +	ies = bcn->data + ieee80211_get_hdrlen_from_skb(bcn);
> +	ies += 12; /* fixed parameters */
> +
> +	/* ht, vht and he capabilities are required to correctly configure
> +	 * the bandwidth (phy_mode) of the connecting peer during peer assoc,
> +	 * get these capabilities from beacon since mac80211 doesn't provide
> +	 * this info to the driver.
> +	 */
> +	arvif->ht_enabled = !!cfg80211_find_ie(WLAN_EID_HT_CAPABILITY, ies,
> +					       (u8 *)skb_tail_pointer(bcn) - ies);
> +	arvif->vht_enabled = !!cfg80211_find_ie(WLAN_EID_VHT_CAPABILITY, ies,
> +					       (u8 *)skb_tail_pointer(bcn) - ies);
> +	arvif->he_enabled = !!cfg80211_find_ie(WLAN_EID_EXT_HE_CAPABILITY, ies,
> +					       (u8 *)skb_tail_pointer(bcn) - ies);
>  	return ret;
>  }

Not sure whether this is a good idea when you have beaconless vifs. I would also
call this whole approach "interesting"

>  	switch (band) {
>  	case NL80211_BAND_2GHZ:
> -		if (sta->he_cap.has_he) {
> +		if (sta->he_cap.has_he && arvif->he_enabled) {
>  			if (sta->bandwidth == IEEE80211_STA_RX_BW_80)
>  				phymode = MODE_11AX_HE80_2G;
>  			else if (sta->bandwidth == IEEE80211_STA_RX_BW_40)
>  				phymode = MODE_11AX_HE40_2G;
>  			else
>  				phymode = MODE_11AX_HE20_2G;
> -		} else if (sta->vht_cap.vht_supported &&
> +		} else if (sta->vht_cap.vht_supported && arvif->vht_enabled &&
>  		    !ath11k_peer_assoc_h_vht_masked(vht_mcs_mask)) {
>  			if (sta->bandwidth == IEEE80211_STA_RX_BW_40)
>  				phymode = MODE_11AC_VHT40;
>  			else
>  				phymode = MODE_11AC_VHT20;
> -		} else if (sta->ht_cap.ht_supported &&
> +		} else if (sta->ht_cap.ht_supported && arvif->ht_enabled &&
>  			   !ath11k_peer_assoc_h_ht_masked(ht_mcs_mask)) {
>  			if (sta->bandwidth == IEEE80211_STA_RX_BW_40)
>  				phymode = MODE_11NG_HT40;
> @@ -1564,12 +1580,12 @@ static void ath11k_peer_assoc_h_phymode(struct ath11k *ar,
>  		break;
>  	case NL80211_BAND_5GHZ:
>  		/* Check HE first */
> -		if (sta->he_cap.has_he) {
> +		if (sta->he_cap.has_he && arvif->he_enabled) {
>  			phymode = ath11k_mac_get_phymode_he(ar, sta);
> -		} else if (sta->vht_cap.vht_supported &&
> +		} else if (sta->vht_cap.vht_supported && arvif->vht_enabled &&
>  		    !ath11k_peer_assoc_h_vht_masked(vht_mcs_mask)) {
>  			phymode = ath11k_mac_get_phymode_vht(ar, sta);
> -		} else if (sta->ht_cap.ht_supported &&
> +		} else if (sta->ht_cap.ht_supported && arvif->ht_enabled &&
>  			   !ath11k_peer_assoc_h_ht_masked(ht_mcs_mask)) {
>  			if (sta->bandwidth >= IEEE80211_STA_RX_BW_40)
>  				phymode = MODE_11NA_HT40;
> 

Hm, there is still the question why we don't enable HE PHY mode for the vdev
independent of the bss_conf.he_support - like we do for VHT in ath11k.

Kind regards,
	Sven

[1] https://patchwork.kernel.org/patch/10333583/

--nextPart2238072.0elIQFGmMR
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEF10rh2Elc9zjMuACXYcKB8Eme0YFAl0CCoYACgkQXYcKB8Em
e0a8lRAApuBZ19ztl9qFVyzEblaxsfRlYLXyseZha3COmaacKzWLDbqLcXG9x8pC
qhZ4CL0+gjmY8FUnS9sy11fRubBYiHdNpuFKpScIhDqNwI0kFl0C7eAqgiEPbP4o
UAi2vqsTtp6K80vZonBPaniZ9am6KvzR2vimq2civeebxJf4mLLzhYtxSaUvXIab
EufDlmmQai1f4rxRORtHc2eA8XGJQWIRFCyz19Cb50gn7ggvs6EAijzG6h6uQ7A8
4tfjFIbMNDwUbr+C3fMevZRa1RGksNaMjTQ0rLkyxrVnrw9IWqlLoY4b6jbYBdn7
zr4WE+4vKqImApXwEVR8u1ZWm1vHB3EPs4ZZ2s0U9m3S36tC+W5CMaqKbYGHkuxZ
l+2UokWcYMUk0f4x7RKzs0VCBhfiLhgvY9TyM2emzg3UtgaN8gnNSaFKQJIJEnqo
fA9EPv2uiQIe9NeAgNlEmyNAu7H8d+cKVFd2zctW95CgN/icwXyul1QSJ7Pnslh8
76wL8fmtS3xlAu1gVPUeLUM6yLxZWTVaBb4Vv4xsI0UmM1kX0Zc3EyFidzmwHR0X
QPf9sIcLUjwyUdyLHCrjAvGX+FMsIIDNyGe2bo1Cmo6lS76qh7XyJXyWwE2tQuW3
2azb4aOFoc7J98XQl8FxY4tsK0K4BDcmgk5BjH8y/3HB7N3GCcQ=
=OZ0r
-----END PGP SIGNATURE-----

--nextPart2238072.0elIQFGmMR--





--===============1648075543466144121==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k

--===============1648075543466144121==--
