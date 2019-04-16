Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hGRaT-0003fy-Fc
 for ath11k@lists.infradead.org; Tue, 16 Apr 2019 17:09:40 +0000
MIME-Version: 1.0
Date: Tue, 16 Apr 2019 22:39:31 +0530
From: Vasanthakumar Thiagarajan <vthiagar@codeaurora.org>
Subject: Re: [PATCH V2] ath11k: add HE support
In-Reply-To: <00b059e27def4295ae1169cc332adb73@codeaurora.org>
References: <20190416142758.23437-1-john@phrozen.org>
 <00b059e27def4295ae1169cc332adb73@codeaurora.org>
Message-ID: <1ede238a96b75df00ae61457235a91d0@codeaurora.org>
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
Cc: ath11k@lists.infradead.org, Kalle Valo <kvalo@codeaurora.org>, Shashidhar Lakkavalli <slakkavalli@datto.com>

On 2019-04-16 22:37, Vasanthakumar Thiagarajan wrote:
> On 2019-04-16 19:57, John Crispin wrote:
>> Add basic HE support to the driver. Things still missing are
>> * fixed HE mcs/nss rates
>> * reading the caps from the FW
>> * 80P80 support
>> * verify if the mac_caps are correct
>> * he_operations is not yet propagated to the FW yet
>> 
>> For HE to work the following hostapd patches need to be used
>> --> http://lists.infradead.org/pipermail/hostap/2019-April/039962.html
>> 
>> Signed-off-by: Shashidhar Lakkavalli <slakkavalli@datto.com>
>> Signed-off-by: John Crispin <john@phrozen.org>
>> ---
>> Changes in V2
>> * fix copy paste error twt_responder vs twt_requester
>> 
>>  drivers/net/wireless/ath/ath11k/core.h        |   3 +
>>  drivers/net/wireless/ath/ath11k/debugfs_sta.c |  24 +-
>>  drivers/net/wireless/ath/ath11k/dp_rx.c       |   3 +-
>>  drivers/net/wireless/ath/ath11k/mac.c         | 405 
>> ++++++++++++++++++++++----
>>  drivers/net/wireless/ath/ath11k/wmi.c         |   1 +
>>  drivers/net/wireless/ath/ath11k/wmi.h         |   5 +-
>>  6 files changed, 382 insertions(+), 59 deletions(-)
>> 
>> diff --git a/drivers/net/wireless/ath/ath11k/core.h
>> b/drivers/net/wireless/ath/ath11k/core.h
>> index d51eddcd78a0..296c0a5bde7e 100644
>> --- a/drivers/net/wireless/ath/ath11k/core.h
>> +++ b/drivers/net/wireless/ath/ath11k/core.h
>> @@ -251,6 +251,7 @@ struct ath11k_peer {
>>  	struct dp_rx_tid rx_tid[IEEE80211_NUM_TIDS + 1];
>>  };
>> 
>> +#define ATH11K_HE_MCS_NUM       12
>>  #define ATH11K_VHT_MCS_NUM      10
>>  #define ATH11K_BW_NUM           4
>>  #define ATH11K_NSS_NUM          4
>> @@ -304,6 +305,7 @@ struct ath11k_htt_data_stats {
>>  	u64 legacy[ATH11K_COUNTER_TYPE_MAX][ATH11K_LEGACY_NUM];
>>  	u64 ht[ATH11K_COUNTER_TYPE_MAX][ATH11K_HT_MCS_NUM];
>>  	u64 vht[ATH11K_COUNTER_TYPE_MAX][ATH11K_VHT_MCS_NUM];
>> +	u64 he[ATH11K_COUNTER_TYPE_MAX][ATH11K_HE_MCS_NUM];
>>  	u64 bw[ATH11K_COUNTER_TYPE_MAX][ATH11K_BW_NUM];
>>  	u64 nss[ATH11K_COUNTER_TYPE_MAX][ATH11K_NSS_NUM];
>>  	u64 gi[ATH11K_COUNTER_TYPE_MAX][ATH11K_GI_NUM];
>> @@ -520,6 +522,7 @@ struct ath11k_pdev_cap {
>>  	u32 ampdu_density;
>>  	u32 vht_cap;
>>  	u32 vht_mcs;
>> +	u32 he_mcs;
>>  	u32 tx_chain_mask;
>>  	u32 rx_chain_mask;
>>  	u32 tx_chain_mask_shift;
>> diff --git a/drivers/net/wireless/ath/ath11k/debugfs_sta.c
>> b/drivers/net/wireless/ath/ath11k/debugfs_sta.c
>> index 41b2221e0479..d05efe6c0498 100644
>> --- a/drivers/net/wireless/ath/ath11k/debugfs_sta.c
>> +++ b/drivers/net/wireless/ath/ath11k/debugfs_sta.c
>> @@ -45,7 +45,14 @@ ath11k_accumulate_per_peer_tx_stats(struct 
>> ath11k_sta *arsta,
>> 
>>  #define STATS_OP_FMT(name) tx_stats->stats[ATH11K_STATS_TYPE_##name]
>> 
>> -	if (txrate->flags & RATE_INFO_FLAGS_VHT_MCS) {
>> +	if (txrate->flags & RATE_INFO_FLAGS_HE_MCS) {
>> +		STATS_OP_FMT(SUCC).he[0][mcs] += peer_stats->succ_bytes;
>> +		STATS_OP_FMT(SUCC).he[1][mcs] += peer_stats->succ_pkts;
>> +		STATS_OP_FMT(FAIL).he[0][mcs] += peer_stats->failed_bytes;
>> +		STATS_OP_FMT(FAIL).he[1][mcs] += peer_stats->failed_pkts;
>> +		STATS_OP_FMT(RETRY).he[0][mcs] += peer_stats->retry_bytes;
>> +		STATS_OP_FMT(RETRY).he[1][mcs] += peer_stats->retry_pkts;
>> +	} else if (txrate->flags & RATE_INFO_FLAGS_VHT_MCS) {
>>  		STATS_OP_FMT(SUCC).vht[0][mcs] += peer_stats->succ_bytes;
>>  		STATS_OP_FMT(SUCC).vht[1][mcs] += peer_stats->succ_pkts;
>>  		STATS_OP_FMT(FAIL).vht[0][mcs] += peer_stats->failed_bytes;
>> @@ -73,7 +80,12 @@ ath11k_accumulate_per_peer_tx_stats(struct 
>> ath11k_sta *arsta,
>>  	if (peer_stats->is_ampdu) {
>>  		tx_stats->ba_fails += peer_stats->ba_fails;
>> 
>> -		if (txrate->flags & RATE_INFO_FLAGS_MCS) {
>> +		if (txrate->flags & RATE_INFO_FLAGS_HE_MCS) {
>> +			STATS_OP_FMT(AMPDU).he[0][mcs] +=
>> +			peer_stats->succ_bytes + peer_stats->retry_bytes;
>> +			STATS_OP_FMT(AMPDU).he[1][mcs] +=
>> +			peer_stats->succ_pkts + peer_stats->retry_pkts;
>> +		} else if (txrate->flags & RATE_INFO_FLAGS_MCS) {
>>  			STATS_OP_FMT(AMPDU).ht[0][mcs] +=
>>  			peer_stats->succ_bytes + peer_stats->retry_bytes;
>>  			STATS_OP_FMT(AMPDU).ht[1][mcs] +=
>> @@ -230,6 +242,14 @@ static ssize_t
>> ath11k_dbg_sta_dump_tx_stats(struct file *file,
>>  					 str_name[k],
>>  					 str[j]);
>>  			len += scnprintf(buf + len, size - len,
>> +					 " HE MCS %s\n",
>> +					 str[j]);
>> +			for (i = 0; i < ATH11K_HE_MCS_NUM; i++)
>> +				len += scnprintf(buf + len, size - len,
>> +						 "  %llu ",
>> +						 stats->he[j][i]);
>> +			len += scnprintf(buf + len, size - len, "\n");
>> +			len += scnprintf(buf + len, size - len,
>>  					 " VHT MCS %s\n",
>>  					 str[j]);
>>  			for (i = 0; i < ATH11K_VHT_MCS_NUM; i++)
>> diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c
>> b/drivers/net/wireless/ath/ath11k/dp_rx.c
>> index 06b3c2e494f8..e980fcb9b320 100644
>> --- a/drivers/net/wireless/ath/ath11k/dp_rx.c
>> +++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
>> @@ -1739,7 +1739,7 @@ static void ath11k_dp_rx_deliver_msdu(struct
>> ath11k *ar, struct napi_struct *nap
>>  	status = IEEE80211_SKB_RXCB(msdu);
>> 
>>  	ath11k_dbg(ar->ab, ATH11K_DBG_DATA,
>> -		   "rx skb %pK len %u peer %pM %s %s sn %u %s%s%s%s%s%s %srate_idx
>> %u vht_nss %u freq %u band %u flag 0x%x fcs-err %i mic-err %i
>> amsdu-more %i\n",
>> +		   "rx skb %pK len %u peer %pM %s %s sn %u %s%s%s%s%s%s%s
>> %srate_idx %u vht_nss %u freq %u band %u flag 0x%x fcs-err %i mic-err
>> %i amsdu-more %i\n",
>>  		   msdu,
>>  		   msdu->len,
>>  		   ieee80211_get_SA(hdr),
>> @@ -1750,6 +1750,7 @@ static void ath11k_dp_rx_deliver_msdu(struct
>> ath11k *ar, struct napi_struct *nap
>>  		   (status->encoding == RX_ENC_LEGACY) ? "legacy" : "",
>>  		   (status->encoding == RX_ENC_HT) ? "ht" : "",
>>  		   (status->encoding == RX_ENC_VHT) ? "vht" : "",
>> +		   (status->encoding == RX_ENC_HE) ? "he" : "",
>>  		   (status->bw == RATE_INFO_BW_40) ? "40" : "",
>>  		   (status->bw == RATE_INFO_BW_80) ? "80" : "",
>>  		   (status->bw == RATE_INFO_BW_160) ? "160" : "",
>> diff --git a/drivers/net/wireless/ath/ath11k/mac.c
>> b/drivers/net/wireless/ath/ath11k/mac.c
>> index 19d7cd4817f1..aa7603d5aa7f 100644
>> --- a/drivers/net/wireless/ath/ath11k/mac.c
>> +++ b/drivers/net/wireless/ath/ath11k/mac.c
>> @@ -152,59 +152,151 @@ static int get_num_chains(u32 mask)
>>  }
>> 
>>  static inline enum wmi_phy_mode
>> -chan_to_phymode(const struct cfg80211_chan_def *chandef)
>> +chan_to_phymode_2ghz(const struct cfg80211_chan_def *chandef)
>> +{
>> +	enum wmi_phy_mode phymode = MODE_UNKNOWN;
>> +
>> +	switch (chandef->width) {
>> +	case NL80211_CHAN_WIDTH_20_NOHT:
>> +		if (chandef->chan->flags & IEEE80211_CHAN_NO_OFDM)
>> +			phymode = MODE_11B;
>> +		else
>> +			phymode = MODE_11G;
>> +		break;
>> +	case NL80211_CHAN_WIDTH_20:
>> +		phymode = MODE_11NG_HT20;
>> +		break;
>> +	case NL80211_CHAN_WIDTH_40:
>> +		phymode = MODE_11NG_HT40;
>> +		break;
>> +	case NL80211_CHAN_WIDTH_5:
>> +	case NL80211_CHAN_WIDTH_10:
>> +	case NL80211_CHAN_WIDTH_80:
>> +	case NL80211_CHAN_WIDTH_80P80:
>> +	case NL80211_CHAN_WIDTH_160:
>> +		phymode = MODE_UNKNOWN;
>> +		break;
>> +	}
>> +
>> +	return phymode;
>> +}
>> +
>> +static inline enum wmi_phy_mode
>> +chan_to_phymode_5ghz(const struct cfg80211_chan_def *chandef)
>> +{
>> +	enum wmi_phy_mode phymode = MODE_UNKNOWN;
>> +
>> +	switch (chandef->width) {
>> +	case NL80211_CHAN_WIDTH_20_NOHT:
>> +		phymode = MODE_11A;
>> +		break;
>> +	case NL80211_CHAN_WIDTH_20:
>> +		phymode = MODE_11NA_HT20;
>> +		break;
>> +	case NL80211_CHAN_WIDTH_40:
>> +		phymode = MODE_11NA_HT40;
>> +		break;
>> +	case NL80211_CHAN_WIDTH_80:
>> +		phymode = MODE_11AC_VHT80;
>> +		break;
>> +	case NL80211_CHAN_WIDTH_160:
>> +		phymode = MODE_11AC_VHT160;
>> +		break;
>> +	case NL80211_CHAN_WIDTH_80P80:
>> +		phymode = MODE_11AC_VHT80_80;
>> +		break;
>> +	case NL80211_CHAN_WIDTH_5:
>> +	case NL80211_CHAN_WIDTH_10:
>> +		phymode = MODE_UNKNOWN;
>> +		break;
>> +	}
>> +
>> +	return phymode;
>> +}
>> +
>> +static inline enum wmi_phy_mode
>> +chan_to_phymode_2ghz_he(const struct cfg80211_chan_def *chandef)
>> +{
>> +	enum wmi_phy_mode phymode = MODE_UNKNOWN;
>> +
>> +	switch (chandef->width) {
>> +	case NL80211_CHAN_WIDTH_20_NOHT:
>> +		if (chandef->chan->flags & IEEE80211_CHAN_NO_OFDM)
>> +			phymode = MODE_11B;
>> +		else
>> +			phymode = MODE_11G;
>> +		break;
>> +	case NL80211_CHAN_WIDTH_20:
>> +		phymode = MODE_11AX_HE20_2G;
>> +		break;
>> +	case NL80211_CHAN_WIDTH_40:
>> +		phymode = MODE_11AX_HE40_2G;
>> +		break;
>> +	case NL80211_CHAN_WIDTH_80:
>> +		phymode = MODE_11AX_HE80_2G;
>> +		break;
>> +	case NL80211_CHAN_WIDTH_5:
>> +	case NL80211_CHAN_WIDTH_10:
>> +	case NL80211_CHAN_WIDTH_80P80:
>> +	case NL80211_CHAN_WIDTH_160:
>> +		phymode = MODE_UNKNOWN;
>> +		break;
>> +	}
>> +
>> +	return phymode;
>> +}
>> +
>> +static inline enum wmi_phy_mode
>> +chan_to_phymode_5ghz_he(const struct cfg80211_chan_def *chandef)
>> +{
>> +	enum wmi_phy_mode phymode = MODE_UNKNOWN;
>> +
>> +	switch (chandef->width) {
>> +	case NL80211_CHAN_WIDTH_20_NOHT:
>> +		phymode = MODE_11A;
>> +		break;
>> +	case NL80211_CHAN_WIDTH_20:
>> +		phymode = MODE_11AX_HE20;
>> +		break;
>> +	case NL80211_CHAN_WIDTH_40:
>> +		phymode = MODE_11AX_HE40;
>> +		break;
>> +	case NL80211_CHAN_WIDTH_80:
>> +		phymode = MODE_11AX_HE80;
>> +		break;
>> +	case NL80211_CHAN_WIDTH_160:
>> +		phymode = MODE_11AX_HE160;
>> +		break;
>> +	case NL80211_CHAN_WIDTH_80P80:
>> +		phymode = MODE_11AX_HE80_80;
>> +		break;
>> +	case NL80211_CHAN_WIDTH_5:
>> +	case NL80211_CHAN_WIDTH_10:
>> +		phymode = MODE_UNKNOWN;
>> +		break;
>> +	}
>> +
>> +	return phymode;
>> +}
>> +
>> +static inline enum wmi_phy_mode
>> +chan_to_phymode(const struct cfg80211_chan_def *chandef, int 
>> he_support)
>>  {
>>  	enum wmi_phy_mode phymode = MODE_UNKNOWN;
>> 
>>  	switch (chandef->chan->band) {
>>  	case NL80211_BAND_2GHZ:
>> -		switch (chandef->width) {
>> -		case NL80211_CHAN_WIDTH_20_NOHT:
>> -			if (chandef->chan->flags & IEEE80211_CHAN_NO_OFDM)
>> -				phymode = MODE_11B;
>> -			else
>> -				phymode = MODE_11G;
>> -			break;
>> -		case NL80211_CHAN_WIDTH_20:
>> -			phymode = MODE_11NG_HT20;
>> -			break;
>> -		case NL80211_CHAN_WIDTH_40:
>> -			phymode = MODE_11NG_HT40;
>> -			break;
>> -		case NL80211_CHAN_WIDTH_5:
>> -		case NL80211_CHAN_WIDTH_10:
>> -		case NL80211_CHAN_WIDTH_80:
>> -		case NL80211_CHAN_WIDTH_80P80:
>> -		case NL80211_CHAN_WIDTH_160:
>> -			phymode = MODE_UNKNOWN;
>> -			break;
>> -		}
>> +		if (he_support)
>> +			phymode = chan_to_phymode_2ghz_he(chandef);
>> +		else
>> +			phymode = chan_to_phymode_2ghz(chandef);
>>  		break;
>>  	case NL80211_BAND_5GHZ:
>> -		switch (chandef->width) {
>> -		case NL80211_CHAN_WIDTH_20_NOHT:
>> -			phymode = MODE_11A;
>> -			break;
>> -		case NL80211_CHAN_WIDTH_20:
>> -			phymode = MODE_11AC_VHT20;
>> -			break;
>> -		case NL80211_CHAN_WIDTH_40:
>> -			phymode = MODE_11AC_VHT40;
>> -			break;
> 
> This seems to revert the below commit which fixes target assert.
> 
> commit e95894e0e5a7b575b681ed7ca550656b7fc72649
> Author: Sriram R <srirrama@codeaurora.org>
> Date:   Fri Mar 29 14:53:05 2019 +0530
> 
>     ath11k: Fix fw assert in VHT20/VHT40 modes during peer assoc
> 
>     Whenever the AP vdev is brought up, the driver indicates the 
> phymode
>     as HT20/HT40 to the firmware since there are no means currently to
>     identify if mode corresponding to the 20/40 channel bandwidth is 
> 'ht' or
>     'vht'. This results in a fw assert during peer association where we 
> indicate
>     the firmware that a VHT STA is associated (This info is derrived 
> from the
>     STA caps). Since the firmware identifies that the sta has an 
> incompatible
>     phymode with the AP vdev, an assert is issued as below.
> 
>     "wlan_peer.c:2482 Assertion vdev->bss->ni_chan.phy_mode >=
> peer_ratectrl_params.phymode"
> 
>     Avoid this scenario by indicating the phymodes as VHT during AP 
> vdev
>     start for 5G 20/40/80/160 bw.
>     This would not affect the rates since the firmware builds the rate
>     table corresponding to the peer associated.
> 
>     Verified the change with  ATH11k AP DUT in VHT20, VHT 40, HT 20, HT 
> 40 and
>     11ac STA associated to it.
>     and ATH11K STA DUT associated to reference AP in VHT 40, HT40, VHT
> 20, HT 20.
> 
>     This change would be applicable until the vht support info is
> properly indicated
>     to the driver from mac80211.
> 
>     Signed-off-by: Sriram R <srirrama@codeaurora.org>
>     Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
> 

Never mind, I misread the change.

Vasanth


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
