Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hLLWL-0008Nz-Cc
 for ath11k@lists.infradead.org; Tue, 30 Apr 2019 05:41:38 +0000
MIME-Version: 1.0
Date: Mon, 29 Apr 2019 22:41:35 -0700
From: Rajkumar Manoharan <rmanohar@codeaurora.org>
Subject: Re: [PATCH V2 4/4] ath11k: add HE support
In-Reply-To: <20190425181740.1994-5-john@phrozen.org>
References: <20190425181740.1994-1-john@phrozen.org>
 <20190425181740.1994-5-john@phrozen.org>
Message-ID: <e6083123cf28cb4c48814b45d27d43cc@codeaurora.org>
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+kvalo=adurom.com@lists.infradead.org
To: John Crispin <john@phrozen.org>
Cc: Rajkumar Manoharan <rmanohar@qti.qualcomm.com>, Srini Kode <skode@qti.qualcomm.com>, ath11k@lists.infradead.org, Kalle Valo <kvalo@codeaurora.org>, Shashidhar Lakkavalli <slakkavalli@datto.com>

On 2019-04-25 11:17, John Crispin wrote:
> Add basic HE support to the driver. The sband_iftype data is generated 
> from
> the capabilities read from the FW.
> 
Nice.. :) Sorry for the late response.
> 
>  static inline enum wmi_phy_mode
> -chan_to_phymode(const struct cfg80211_chan_def *chandef)
> +chan_to_phymode_2ghz(const struct cfg80211_chan_def *chandef)
> +{
> +	enum wmi_phy_mode phymode = MODE_UNKNOWN;
> +
> +	switch (chandef->width) {
> +	case NL80211_CHAN_WIDTH_20_NOHT:
> +		if (chandef->chan->flags & IEEE80211_CHAN_NO_OFDM)
> +			phymode = MODE_11B;
> +		else
> +			phymode = MODE_11G;
> +		break;
> +	case NL80211_CHAN_WIDTH_20:
> +		phymode = MODE_11NG_HT20;
> +		break;
> +	case NL80211_CHAN_WIDTH_40:
> +		phymode = MODE_11NG_HT40;
> +		break;
> +	case NL80211_CHAN_WIDTH_5:
> +	case NL80211_CHAN_WIDTH_10:
> +	case NL80211_CHAN_WIDTH_80:
> +	case NL80211_CHAN_WIDTH_80P80:
> +	case NL80211_CHAN_WIDTH_160:
> +		phymode = MODE_UNKNOWN;
> +		break;
> +	}
> +
> +	return phymode;
> +}
> +
> +static inline enum wmi_phy_mode
> +chan_to_phymode_5ghz(const struct cfg80211_chan_def *chandef)
> +{
> +	enum wmi_phy_mode phymode = MODE_UNKNOWN;
> +
> +	switch (chandef->width) {
> +	case NL80211_CHAN_WIDTH_20_NOHT:
> +		phymode = MODE_11A;
> +		break;
> +	case NL80211_CHAN_WIDTH_20:
> +		phymode = MODE_11AC_VHT20;
> +		break;
> +	case NL80211_CHAN_WIDTH_40:
> +		phymode = MODE_11AC_VHT40;
> +		break;
> +	case NL80211_CHAN_WIDTH_80:
> +		phymode = MODE_11AC_VHT80;
> +		break;
> +	case NL80211_CHAN_WIDTH_160:
> +		phymode = MODE_11AC_VHT160;
> +		break;
> +	case NL80211_CHAN_WIDTH_80P80:
> +		phymode = MODE_11AC_VHT80_80;
> +		break;
> +	case NL80211_CHAN_WIDTH_5:
> +	case NL80211_CHAN_WIDTH_10:
> +		phymode = MODE_UNKNOWN;
> +		break;
> +	}
> +
> +	return phymode;
> +}
> +
> +static inline enum wmi_phy_mode
> +chan_to_phymode_2ghz_he(const struct cfg80211_chan_def *chandef)
> +{
> +	enum wmi_phy_mode phymode = MODE_UNKNOWN;
> +
> +	switch (chandef->width) {
> +	case NL80211_CHAN_WIDTH_20_NOHT:
> +		if (chandef->chan->flags & IEEE80211_CHAN_NO_OFDM)
> +			phymode = MODE_11B;
> +		else
> +			phymode = MODE_11G;
> +		break;
> +	case NL80211_CHAN_WIDTH_20:
> +		phymode = MODE_11AX_HE20_2G;
> +		break;
> +	case NL80211_CHAN_WIDTH_40:
> +		phymode = MODE_11AX_HE40_2G;
> +		break;
> +	case NL80211_CHAN_WIDTH_80:
> +		phymode = MODE_11AX_HE80_2G;
> +		break;
> +	case NL80211_CHAN_WIDTH_5:
> +	case NL80211_CHAN_WIDTH_10:
> +	case NL80211_CHAN_WIDTH_80P80:
> +	case NL80211_CHAN_WIDTH_160:
> +		phymode = MODE_UNKNOWN;
> +		break;
> +	}
> +
> +	return phymode;
> +}
> +
> +static inline enum wmi_phy_mode
> +chan_to_phymode_5ghz_he(const struct cfg80211_chan_def *chandef)
> +{
> +	enum wmi_phy_mode phymode = MODE_UNKNOWN;
> +
> +	switch (chandef->width) {
> +	case NL80211_CHAN_WIDTH_20_NOHT:
> +		phymode = MODE_11A;
> +		break;
> +	case NL80211_CHAN_WIDTH_20:
> +		phymode = MODE_11AX_HE20;
> +		break;
> +	case NL80211_CHAN_WIDTH_40:
> +		phymode = MODE_11AX_HE40;
> +		break;
> +	case NL80211_CHAN_WIDTH_80:
> +		phymode = MODE_11AX_HE80;
> +		break;
> +	case NL80211_CHAN_WIDTH_160:
> +		phymode = MODE_11AX_HE160;
> +		break;
> +	case NL80211_CHAN_WIDTH_80P80:
> +		phymode = MODE_11AX_HE80_80;
> +		break;
> +	case NL80211_CHAN_WIDTH_5:
> +	case NL80211_CHAN_WIDTH_10:
> +		phymode = MODE_UNKNOWN;
> +		break;
> +	}
> +
> +	return phymode;
> +}
> +
> +static inline enum wmi_phy_mode
> +chan_to_phymode(const struct cfg80211_chan_def *chandef, int 
> he_support)
>  {
>  	enum wmi_phy_mode phymode = MODE_UNKNOWN;
> 
>  	switch (chandef->chan->band) {
>  	case NL80211_BAND_2GHZ:
> -		switch (chandef->width) {
> -		case NL80211_CHAN_WIDTH_20_NOHT:
> -			if (chandef->chan->flags & IEEE80211_CHAN_NO_OFDM)
> -				phymode = MODE_11B;
> -			else
> -				phymode = MODE_11G;
> -			break;
> -		case NL80211_CHAN_WIDTH_20:
> -			phymode = MODE_11NG_HT20;
> -			break;
> -		case NL80211_CHAN_WIDTH_40:
> -			phymode = MODE_11NG_HT40;
> -			break;
> -		case NL80211_CHAN_WIDTH_5:
> -		case NL80211_CHAN_WIDTH_10:
> -		case NL80211_CHAN_WIDTH_80:
> -		case NL80211_CHAN_WIDTH_80P80:
> -		case NL80211_CHAN_WIDTH_160:
> -			phymode = MODE_UNKNOWN;
> -			break;
> -		}
> +		if (he_support)
> +			phymode = chan_to_phymode_2ghz_he(chandef);
> +		else
> +			phymode = chan_to_phymode_2ghz(chandef);
>  		break;
>  	case NL80211_BAND_5GHZ:
> -		switch (chandef->width) {
> -		case NL80211_CHAN_WIDTH_20_NOHT:
> -			phymode = MODE_11A;
> -			break;
> -		case NL80211_CHAN_WIDTH_20:
> -			phymode = MODE_11AC_VHT20;
> -			break;
> -		case NL80211_CHAN_WIDTH_40:
> -			phymode = MODE_11AC_VHT40;
> -			break;
> -		case NL80211_CHAN_WIDTH_80:
> -			phymode = MODE_11AC_VHT80;
> -			break;
> -		case NL80211_CHAN_WIDTH_160:
> -			phymode = MODE_11AC_VHT160;
> -			break;
> -		case NL80211_CHAN_WIDTH_80P80:
> -			phymode = MODE_11AC_VHT80_80;
> -			break;
> -		case NL80211_CHAN_WIDTH_5:
> -		case NL80211_CHAN_WIDTH_10:
> -			phymode = MODE_UNKNOWN;
> -			break;
> -		}
> +		if (he_support)
> +			phymode = chan_to_phymode_5ghz_he(chandef);
> +		else
> +			phymode = chan_to_phymode_5ghz(chandef);
> +
>  		break;
> 
The above repeated switch case routines can be simplified by simple 
array of modes. no?

               WIDTH_20_NOHT |   WIDTH_20    | WIDTH_40     | WIDTH_80    
   | WIDTH_160        | WIDTH_80P80

MODE_11G            11G       11NG_HT20       11NG_HT40       NA         
          NA            NA
MODE_11G_HE         11G       11AX_HE20_2G    11AX_HE40_2G   
11AX_HE80_2G         NA            NA
MODE_11A            11A       11NA_HT20       11NA_HT40      NA          
          NA            NA
MODE_11A_VHT        11A       11AC_VHT20      11AC_VHT40     11AC_VHT80  
          11AC_VHT160   11AC_VHT80_80
MODE_11A_HE         11A       11AX_HE20       11AX_HE40      11AX_HE80   
          11AX_HE160    11AX_HE80_80

[...]

> +static enum wmi_phy_mode ath11k_mac_get_phymode_he(struct ath11k *ar,
> +						   struct ieee80211_sta *sta)
> +{
> +	if (sta->bandwidth == IEEE80211_STA_RX_BW_160) {
> +		if (sta->he_cap.he_cap_elem.phy_cap_info[0] &
> +		     IEEE80211_HE_PHY_CAP0_CHANNEL_WIDTH_SET_160MHZ_IN_5G)
> +			return MODE_11AX_HE160;
> +		else if (sta->he_cap.he_cap_elem.phy_cap_info[0] &
> +		     IEEE80211_HE_PHY_CAP0_CHANNEL_WIDTH_SET_80PLUS80_MHZ_IN_5G)
> +			return MODE_11AX_HE80_80;
> +		/* not sure if this is a valid case? */
> +		return MODE_11AX_HE160;
> +	}
> +
> +	if (sta->bandwidth == IEEE80211_STA_RX_BW_80)
> +		return MODE_11AX_HE80;
> +
> +	if (sta->bandwidth == IEEE80211_STA_RX_BW_40)
> +		return MODE_11AX_HE40;
> +
> +	if (sta->bandwidth == IEEE80211_STA_RX_BW_20)
> +		return MODE_11AX_HE20;
> +
> +	return MODE_UNKNOWN;
> +}
> +

I think this function also be removed if we have MODE table as mentioned 
above.

[...]

> +static void ath11k_mac_copy_he_cap(struct ath11k_pdev_cap *cap,
> +				   struct ieee80211_sband_iftype_data *data,
> +				   int band)
> +{
> +	int i;
> +
> +	for (i = 0; i < 2; i++) {
> +		struct ieee80211_sta_he_cap *he_cap = &data[i].he_cap;
> +		struct ath11k_band_cap *band_cap = &cap->band[band];
> +		struct ieee80211_he_cap_elem *he_cap_elem =
> +				&he_cap->he_cap_elem;
> +
> +		he_cap->has_he = true;
> +		memcpy(he_cap_elem->mac_cap_info, band_cap->he_cap_info,
> +		       sizeof(he_cap_elem->mac_cap_info));
> +		memcpy(he_cap_elem->phy_cap_info, band_cap->he_cap_phy_info,
> +		       sizeof(he_cap_elem->phy_cap_info));
> +
> +		if (i) {
> +			data[i].types_mask = BIT(NL80211_IFTYPE_STATION);
> +			he_cap_elem->mac_cap_info[0] &=
> +				~IEEE80211_HE_MAC_CAP0_TWT_RES;
> +			he_cap_elem->mac_cap_info[0] |=
> +				IEEE80211_HE_MAC_CAP0_TWT_REQ;
> +			/* TODO - add further differences between AP and STA */
> +		} else {
> +			data[i].types_mask = BIT(NL80211_IFTYPE_AP);
> +		}
> 
Hmmm.. If you are running loop to extract he_cap, he_cap_extn, how will 
you extend HE support
for other interface types (Mesh)?

-Rajkumar

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
