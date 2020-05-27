Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1je5XT-0008OL-BI
 for ath11k@lists.infradead.org; Wed, 27 May 2020 23:32:53 +0000
MIME-Version: 1.0
Date: Wed, 27 May 2020 16:32:32 -0700
From: Rajkumar Manoharan <rmanohar@codeaurora.org>
Subject: Re: [PATCH v3 01/11] cfg80211: use only HE capability to set
 prohibited flags in 6 GHz
In-Reply-To: <7f2a2a382c42b7285b9ad1eeac4e8060bc8d897a.camel@sipsolutions.net>
References: <1589399105-25472-1-git-send-email-rmanohar@codeaurora.org>
 <7f2a2a382c42b7285b9ad1eeac4e8060bc8d897a.camel@sipsolutions.net>
Message-ID: <0fa1c07811796add4a6a23c81cbafe41@codeaurora.org>
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
To: Johannes Berg <johannes@sipsolutions.net>
Cc: Vamsi Krishna <vamsin@codeaurora.org>, linux-wireless-owner@vger.kernel.org, linux-wireless@vger.kernel.org, ath11k@lists.infradead.org, kvalo@codeaurora.org

On 2020-05-27 06:43, Johannes Berg wrote:
> Hi,
> 
> This is what we have in this area:
> https://p.sipsolutions.net/d8e56772a261199a.txt
> 
> but I see it's also incomplete.
> 
>> +static bool cfg80211_is_6ghz_freq(u32 freq)
>> +{
>> +	return (freq > 5940 && freq < 7105);
>> +}
> 
> That doesn't really make sense, I don't want to see those hardcoded
> frequencies all over the place.
> 
>>  	case NL80211_CHAN_WIDTH_40:
>>  		width = 40;
>> +		if (cfg80211_is_6ghz_freq(chandef->center_freq1)) {
> 
> You can check chandef->chan->band instead. (In fact, we did)
> 
Got it..

>> +			if (!he_cap)
>> +				return false;
>> +			if (!he_cap->has_he_6ghz)
>> +				return false;
> 
> I'm not sure you should even _get_ here with a 6 GHz channel if you
> don't have 6 GHz capability? I mean, why did you register the channel 
> in
> the first place then? This seems unnecessarily complex. If the channel
> didn't exist, it was rejected long before here.
> 
Hmm... Agreed.

> However, looking at D6.0, maybe we do need some checks of the HE
> capability?
> 
>> +			if (!(he_cap->he_cap_elem.phy_cap_info[0] &
>> +			      IEEE80211_HE_PHY_CAP0_CHANNEL_WIDTH_SET_40MHZ_80MHZ_IN_5G))
>> +				return false;
> 
> Looks like even D6.0 still changed something in this area...
> 
> Evidently our patch just assumed that in 6 GHz all of this is 
> supported,
> but the spec doesn't support that theory :-)
> 
IIUC the same bits are applicable for both 5 GHz & 6 GHz. I understand 
the macro doesn't
capture both.

> Can you respin this with D6.0 taken into account?
> 
Let me check again and respin after your series. Does it sound good?

-Rajkumar

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
