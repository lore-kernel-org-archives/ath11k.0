Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jjElN-0003Ue-0S
 for ath11k@lists.infradead.org; Thu, 11 Jun 2020 04:24:26 +0000
MIME-Version: 1.0
Date: Wed, 10 Jun 2020 21:24:00 -0700
From: Rajkumar Manoharan <rmanohar@codeaurora.org>
Subject: Re: [PATCH 02/12] nl80211: add attributes for multiple bssid related
 settings
In-Reply-To: <20200604070952.15481-3-john@phrozen.org>
References: <20200604070952.15481-1-john@phrozen.org>
 <20200604070952.15481-3-john@phrozen.org>
Message-ID: <8cc57539ad26d2cf49ef347cd65471ea@codeaurora.org>
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
Cc: Johannes Berg <johannes@sipsolutions.net>, linux-wireless@vger.kernel.org, ath11k@lists.infradead.org

On 2020-06-04 00:09, John Crispin wrote:
> When we start a multiple bssid AP we need to pass the index and number 
> of
> peers aswell to the kernel. This info needs to be propagated to the
> driver.
> 
> Signed-off-by: John Crispin <john@phrozen.org>
> ---
>  include/net/cfg80211.h       | 12 ++++++++++++
>  include/uapi/linux/nl80211.h |  7 +++++++
>  net/wireless/nl80211.c       | 15 +++++++++++++++
>  3 files changed, 34 insertions(+)
> 
[...]
> diff --git a/net/wireless/nl80211.c b/net/wireless/nl80211.c
> index 3b502514944c..58ce67bc31da 100644
> --- a/net/wireless/nl80211.c
> +++ b/net/wireless/nl80211.c
> @@ -667,6 +667,8 @@ const struct nla_policy 
> nl80211_policy[NUM_NL80211_ATTR] = {
>  					NL80211_MULTIPLE_BSSID_LEGACY,
>  					NL80211_MULTIPLE_BSSID_NON_TRANSMITTED),
>  	[NL80211_ATTR_MULTI_BSSID_PARENT] = { .type = NLA_U32 },
> +	[NL80211_ATTR_MULTI_BSSID_INDEX] = { .type = NLA_U32 },
> +	[NL80211_ATTR_MULTI_BSSID_COUNT] = { .type = NLA_U32 },
>  };
> 
>  /* policy for the key attributes */
> @@ -4996,6 +4998,11 @@ static int nl80211_start_ap(struct sk_buff
> *skb, struct genl_info *info)
>  	    !info->attrs[NL80211_ATTR_BEACON_HEAD])
>  		return -EINVAL;
> 
> +	if (wdev->multi_bssid_mode == NL80211_MULTIPLE_BSSID_NON_TRANSMITTED 
> &&
> +	    (!info->attrs[NL80211_ATTR_MULTI_BSSID_INDEX] ||
> +	     !info->attrs[NL80211_ATTR_MULTI_BSSID_COUNT]))
> +		return -EINVAL;
> +
>  	err = nl80211_parse_beacon(rdev, info->attrs, &params.beacon);
>  	if (err)
>  		return err;
> @@ -5150,6 +5157,14 @@ static int nl80211_start_ap(struct sk_buff
> *skb, struct genl_info *info)
>  			return err;
>  	}
> 
> +	if (info->attrs[NL80211_ATTR_MULTI_BSSID_INDEX])
> +		params.multi_bssid.index = nla_get_u32(
> +				info->attrs[NL80211_ATTR_MULTI_BSSID_INDEX]);
> +
> +	if (info->attrs[NL80211_ATTR_MULTI_BSSID_COUNT])
> +		params.multi_bssid.count = nla_get_u32(
> +				info->attrs[NL80211_ATTR_MULTI_BSSID_COUNT]);
> +
John,

Does the count include transmitting and non-transmitting APs? Or just 
child-node counts.
Are you expecting start_ap() for all non-trasmitting AP as well? Hope 
this count can be
set only for parent AP?

-Rajkumar

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
