Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2]
 helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jdwLU-0006zJ-0e
 for ath11k@lists.infradead.org; Wed, 27 May 2020 13:43:49 +0000
Message-ID: <7f2a2a382c42b7285b9ad1eeac4e8060bc8d897a.camel@sipsolutions.net>
Subject: Re: [PATCH v3 01/11] cfg80211: use only HE capability to set
 prohibited flags in 6 GHz
From: Johannes Berg <johannes@sipsolutions.net>
Date: Wed, 27 May 2020 15:43:41 +0200
In-Reply-To: <1589399105-25472-1-git-send-email-rmanohar@codeaurora.org>
References: <1589399105-25472-1-git-send-email-rmanohar@codeaurora.org>
MIME-Version: 1.0
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+kvalo=adurom.com@lists.infradead.org
To: Rajkumar Manoharan <rmanohar@codeaurora.org>, kvalo@codeaurora.org
Cc: Vamsi Krishna <vamsin@codeaurora.org>, linux-wireless@vger.kernel.org, ath11k@lists.infradead.org

Hi,

This is what we have in this area:
https://p.sipsolutions.net/d8e56772a261199a.txt

but I see it's also incomplete.

> +static bool cfg80211_is_6ghz_freq(u32 freq)
> +{
> +	return (freq > 5940 && freq < 7105);
> +}

That doesn't really make sense, I don't want to see those hardcoded
frequencies all over the place.

>  	case NL80211_CHAN_WIDTH_40:
>  		width = 40;
> +		if (cfg80211_is_6ghz_freq(chandef->center_freq1)) {

You can check chandef->chan->band instead. (In fact, we did)

> +			if (!he_cap)
> +				return false;
> +			if (!he_cap->has_he_6ghz)
> +				return false;

I'm not sure you should even _get_ here with a 6 GHz channel if you
don't have 6 GHz capability? I mean, why did you register the channel in
the first place then? This seems unnecessarily complex. If the channel
didn't exist, it was rejected long before here.

However, looking at D6.0, maybe we do need some checks of the HE
capability?

> +			if (!(he_cap->he_cap_elem.phy_cap_info[0] &
> +			      IEEE80211_HE_PHY_CAP0_CHANNEL_WIDTH_SET_40MHZ_80MHZ_IN_5G))
> +				return false;

Looks like even D6.0 still changed something in this area...

Evidently our patch just assumed that in 6 GHz all of this is supported,
but the spec doesn't support that theory :-)

Can you respin this with D6.0 taken into account?

johannes


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
