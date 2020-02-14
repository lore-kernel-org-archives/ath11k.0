Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2]
 helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j2Wsy-0006Fw-1f
 for ath11k@lists.infradead.org; Fri, 14 Feb 2020 09:03:45 +0000
Message-ID: <d6fdf3419a323bdf5008bcd51c36b92977f5b872.camel@sipsolutions.net>
Subject: Re: [PATCH V2 1/3] nl80211: add support for setting fixed HE
 rate/gi/ltf
From: Johannes Berg <johannes@sipsolutions.net>
Date: Fri, 14 Feb 2020 10:03:38 +0100
In-Reply-To: <20200204103514.18111-1-john@phrozen.org>
References: <20200204103514.18111-1-john@phrozen.org>
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
To: John Crispin <john@phrozen.org>, Kalle Valo <kvalo@codeaurora.org>
Cc: Miles Hu <milehu@codeaurora.org>, linux-wireless@vger.kernel.org, ath11k@lists.infradead.org

On Tue, 2020-02-04 at 11:35 +0100, John Crispin wrote:
> 
> +	[NL80211_TXRATE_HE] = {
> +		.type = NLA_EXACT_LEN,
> +		.len = sizeof(struct nl80211_txrate_he),
> +	},
> +	[NL80211_TXRATE_HE_GI] =  NLA_POLICY_RANGE(NLA_U8,
> +						   NL80211_RATE_INFO_HE_GI_0_8,
> +						   NL80211_RATE_INFO_HE_GI_3_2),
> +	[NL80211_TXRATE_HE_LTF] = NLA_POLICY_RANGE(NLA_U8,
> +						   NL80211_RATE_INFO_HE_1XLTF,
> +						   NL80211_RATE_INFO_HE_4XLTF),
>  };

Thanks for this :-)

> +		if (tb[NL80211_TXRATE_HE]) {
> +			if (!he_set_mcs_mask(info, sband, nla_data(tb[NL80211_TXRATE_HE]),
> +					     mask->control[band].he_mcs))
> +				return -EINVAL;

Maybe unify these into a single condition?

if (tb[...] &&
    he_set_...
	return -EINVAL;

Seems nicer to me. Especially with the lines already being so long.

> +		}
> +		if (tb[NL80211_TXRATE_HE_GI]) {
> +			mask->control[band].he_gi =
> +				nla_get_u8(tb[NL80211_TXRATE_HE_GI]);
> +			if (mask->control[band].he_gi > NL80211_RATE_INFO_HE_GI_3_2)
> +				return -EINVAL;

This is not needed with the policy, is it?

> +		}
> +		if (tb[NL80211_TXRATE_HE_LTF]) {
> +			mask->control[band].he_ltf =
> +				nla_get_u8(tb[NL80211_TXRATE_HE_LTF]);
> +			if (mask->control[band].he_ltf > NL80211_RATE_INFO_HE_4XLTF)
> +				return -EINVAL;

Same here.

>  			if (!(rdev->wiphy.bands[band]->ht_cap.ht_supported ||
> -			      rdev->wiphy.bands[band]->vht_cap.vht_supported))
> +			      rdev->wiphy.bands[band]->vht_cap.vht_supported ||
> +			      (rdev->wiphy.bands[band]->iftype_data &&
> +			       rdev->wiphy.bands[band]->iftype_data->he_cap.has_he)))
>  				return -EINVAL;

And now we get to why I replied at all and didn't just fix it up ;-)

That can't be right, iftype_data is an array of pointers, you're
basically always taking the first one?

johannes


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
