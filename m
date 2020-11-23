Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from z5.mailgun.us ([104.130.96.5])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kh7Nv-0000Kk-6H
 for ath11k@lists.infradead.org; Mon, 23 Nov 2020 08:39:45 +0000
MIME-Version: 1.0
Date: Mon, 23 Nov 2020 16:39:32 +0800
From: Wen Gong <wgong@codeaurora.org>
Subject: Re: [PATCH v4 14/17] mac80211: support S1G association
In-Reply-To: <af51dd8e9dea2961546a502d9090d1a7@codeaurora.org>
References: <20200922022818.15855-1-thomas@adapt-ip.com>
 <20200922022818.15855-15-thomas@adapt-ip.com>
 <af51dd8e9dea2961546a502d9090d1a7@codeaurora.org>
Message-ID: <9d1e20d1124883bd1a2a64c1c62d7975@codeaurora.org>
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
To: Thomas Pedersen <thomas@adapt-ip.com>
Cc: Johannes Berg <johannes@sipsolutions.net>, linux-wireless <linux-wireless@vger.kernel.org>, ath11k@lists.infradead.org, ath10k@lists.infradead.org

add more to know it.
On 2020-11-23 16:38, Wen Gong wrote:
> On 2020-09-22 10:28, Thomas Pedersen wrote:
> ...
>> @@ -3446,6 +3453,42 @@ bool ieee80211_chandef_he_6ghz_oper(struct
>> ieee80211_sub_if_data *sdata,
>> 
>>  	*chandef = he_chandef;
>> 
>> +	return false;
>> +}
> This change the "return true" to "return false" by default of
> ieee80211_chandef_he_6ghz_oper.
> It should be typo mistake.
>> +
>> +bool ieee80211_chandef_s1g_oper(const struct ieee80211_s1g_oper_ie 
>> *oper,
>> +				struct cfg80211_chan_def *chandef)
>> +{
>> +	u32 oper_freq;
>> +
>> +	if (!oper)
>> +		return false;
>> +
>> +	switch (FIELD_GET(S1G_OPER_CH_WIDTH_OPER, oper->ch_width)) {
>> +	case IEEE80211_S1G_CHANWIDTH_1MHZ:
>> +		chandef->width = NL80211_CHAN_WIDTH_1;
>> +		break;
>> +	case IEEE80211_S1G_CHANWIDTH_2MHZ:
>> +		chandef->width = NL80211_CHAN_WIDTH_2;
>> +		break;
>> +	case IEEE80211_S1G_CHANWIDTH_4MHZ:
>> +		chandef->width = NL80211_CHAN_WIDTH_4;
>> +		break;
>> +	case IEEE80211_S1G_CHANWIDTH_8MHZ:
>> +		chandef->width = NL80211_CHAN_WIDTH_8;
>> +		break;
>> +	case IEEE80211_S1G_CHANWIDTH_16MHZ:
>> +		chandef->width = NL80211_CHAN_WIDTH_16;
>> +		break;
>> +	default:
>> +		return false;
>> +	}
>> +
>> +	oper_freq = ieee80211_channel_to_freq_khz(oper->oper_ch,
>> +						  NL80211_BAND_S1GHZ);
>> +	chandef->center_freq1 = KHZ_TO_MHZ(oper_freq);
>> +	chandef->freq1_offset = oper_freq % 1000;
>> +
>>  	return true;
>>  }
>> 
> ....

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
