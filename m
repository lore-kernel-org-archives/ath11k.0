Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from z5.mailgun.us ([104.130.96.5])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kdUrk-0006Tt-2J
 for ath11k@lists.infradead.org; Fri, 13 Nov 2020 08:55:33 +0000
MIME-Version: 1.0
Date: Fri, 13 Nov 2020 16:55:26 +0800
From: Wen Gong <wgong@codeaurora.org>
Subject: Re: [PATCHv3 1/2] nl80211: add support for mcs masks
In-Reply-To: <b7a64b13d38792a97708675dcd8e5f69@codeaurora.org>
References: <1327767935-16984-1-git-send-email-siwu@hrz.tu-chemnitz.de>
 <1327767935-16984-2-git-send-email-siwu@hrz.tu-chemnitz.de>
 (sfid-20120128_172604_145461_197131DD)
 <b7a64b13d38792a97708675dcd8e5f69@codeaurora.org>
Message-ID: <621967ef7bc9209efaa027b7e574c586@codeaurora.org>
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
To: Simon Wunderlich <simon.wunderlich@s2003.tu-chemnitz.de>, Johannes Berg <johannes@sipsolutions.net>
Cc: Mathias Kretschmer <mathias.kretschmer@fokus.fraunhofer.de>, linux-wireless@vger.kernel.org, linville@tuxdriver.com, ath10k@lists.infradead.org, linux-wireless-owner@vger.kernel.org, Simon Wunderlich <siwu@hrz.tu-chemnitz.de>, ath11k@lists.infradead.org

On 2020-11-12 18:38, Wen Gong wrote:
> On 2012-01-29 00:25, Simon Wunderlich wrote:
>> Allow to set mcs masks through nl80211. We also allow to set MCS
>> rates but no legacy rates (and vice versa).
>> 
>> Signed-off-by: Simon Wunderlich <siwu@hrz.tu-chemnitz.de>
>> Signed-off-by: Mathias Kretschmer 
>> <mathias.kretschmer@fokus.fraunhofer.de>
>> ---
>>  include/linux/nl80211.h |    4 +++
>>  include/net/cfg80211.h  |    3 +-
>>  net/wireless/nl80211.c  |   61 
>> ++++++++++++++++++++++++++++++++++++++++++++++-
>>  3 files changed, 65 insertions(+), 3 deletions(-)
>> 
> ...
>> @@ -5421,12 +5451,20 @@ static int nl80211_set_tx_bitrate_mask(struct
>> sk_buff *skb,
>>  		sband = rdev->wiphy.bands[i];
>>  		mask.control[i].legacy =
>>  			sband ? (1 << sband->n_bitrates) - 1 : 0;
>> +		if (sband)
>> +			memcpy(mask.control[i].mcs,
>> +			       sband->ht_cap.mcs.rx_mask,
>> +			       sizeof(mask.control[i].mcs));
> when use command: "iw wlan0 set bitrates legacy-5 6", I want to set it
> fixed in 6M rate.
> this copy mcs rate will add the mcs rate here and condition "if
> (tb[NL80211_TXRATE_MCS])"
> is false, then mcs rate will not clear and lead a mistake result.
>> +		else
>> +			memset(mask.control[i].mcs, 0,
>> +			       sizeof(mask.control[i].mcs));
>>  	}
>> 
>>  	/*
>>  	 * The nested attribute uses enum nl80211_band as the index. This 
>> maps
>>  	 * directly to the enum ieee80211_band values used in cfg80211.
>>  	 */
>> +	BUILD_BUG_ON(NL80211_MAX_SUPP_HT_RATES > IEEE80211_HT_MCS_MASK_LEN * 
>> 8);
>>  	nla_for_each_nested(tx_rates, info->attrs[NL80211_ATTR_TX_RATES], 
>> rem)
>>  	{
>>  		enum ieee80211_band band = nla_type(tx_rates);
>> @@ -5442,7 +5480,28 @@ static int nl80211_set_tx_bitrate_mask(struct
>> sk_buff *skb,
>>  				sband,
>>  				nla_data(tb[NL80211_TXRATE_LEGACY]),
>>  				nla_len(tb[NL80211_TXRATE_LEGACY]));
>> -			if (mask.control[band].legacy == 0)
>> +		}
>> +		if (tb[NL80211_TXRATE_MCS]) {
> 
> false for "iw wlan0 set bitrates legacy-5 6", so ht_rateset_to_mask
> will not enter and mcs rate will not clear.
If no tb[NL80211_TXRATE_HT]/tb[NL80211_TXRATE_VHT], it should clear the 
data like this:
memset(mcs, 0, IEEE80211_HT_MCS_MASK_LEN) which is in ht_rateset_to_mask 
and
memset(mcs, 0, sizeof(u16) * NL80211_VHT_NSS_MAX) which is in 
vht_set_mcs_mask.
> 
>> +			if (!ht_rateset_to_mask(
>> +					sband,
>> +					nla_data(tb[NL80211_TXRATE_MCS]),
>> +					nla_len(tb[NL80211_TXRATE_MCS]),
>> +					mask.control[band].mcs))
>> +				return -EINVAL;
>> +		}
>> +
>> +		if (mask.control[band].legacy == 0) {
>> +			/* don't allow empty legacy rates if HT
>> +			 * is not even supported. */
>> +			if (!rdev->wiphy.bands[band]->ht_cap.ht_supported)
>> +				return -EINVAL;
>> +
>> +			for (i = 0; i < IEEE80211_HT_MCS_MASK_LEN; i++)
>> +				if (mask.control[band].mcs[i])
>> +					break;
>> +
>> +			/* legacy and mcs rates may not be both empty */
>> +			if (i == IEEE80211_HT_MCS_MASK_LEN)
>>  				return -EINVAL;
>>  		}
>>  	}

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
