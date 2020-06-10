Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail27.static.mailgun.info ([104.130.122.27])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jioZ7-0000rT-3Y
 for ath11k@lists.infradead.org; Wed, 10 Jun 2020 00:26:03 +0000
MIME-Version: 1.0
Date: Tue, 09 Jun 2020 17:25:54 -0700
From: Rajkumar Manoharan <rmanohar@codeaurora.org>
Subject: Re: [PATCH 01/12] nl80211: add basic multiple bssid support
In-Reply-To: <20200604070952.15481-2-john@phrozen.org>
References: <20200604070952.15481-1-john@phrozen.org>
 <20200604070952.15481-2-john@phrozen.org>
Message-ID: <95d452bacbeba285c9dad7f037f78078@codeaurora.org>
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
Cc: linux-wireless-owner@vger.kernel.org, Johannes Berg <johannes@sipsolutions.net>, linux-wireless@vger.kernel.org, ath11k@lists.infradead.org

On 2020-06-04 00:09, John Crispin wrote:
[...]
> --- a/net/wireless/nl80211.c
> +++ b/net/wireless/nl80211.c
> @@ -663,6 +663,10 @@ const struct nla_policy
> nl80211_policy[NUM_NL80211_ATTR] = {
>  	[NL80211_ATTR_CONTROL_PORT_NO_PREAUTH] = { .type = NLA_FLAG },
>  	[NL80211_ATTR_PMK_LIFETIME] = NLA_POLICY_MIN(NLA_U32, 1),
>  	[NL80211_ATTR_PMK_REAUTH_THRESHOLD] = NLA_POLICY_RANGE(NLA_U8, 1, 
> 100),
> +	[NL80211_ATTR_MULTI_BSSID_MODE] = NLA_POLICY_RANGE(NLA_U8,
> +					NL80211_MULTIPLE_BSSID_LEGACY,
> +					NL80211_MULTIPLE_BSSID_NON_TRANSMITTED),
> +	[NL80211_ATTR_MULTI_BSSID_PARENT] = { .type = NLA_U32 },
> 
If it is read as u8, better define as NLA_U8.

>  };
> 
>  /* policy for the key attributes */
> @@ -3756,6 +3760,16 @@ static int nl80211_new_interface(struct sk_buff
> *skb, struct genl_info *info)
>  	if (err < 0)
>  		return err;
> 
> +	if (info->attrs[NL80211_ATTR_MULTI_BSSID_MODE])
> +		params.multi_bssid_mode =
> +			nla_get_u8(info->attrs[NL80211_ATTR_MULTI_BSSID_MODE]);
> +	if (info->attrs[NL80211_ATTR_MULTI_BSSID_PARENT])
> +		params.multi_bssid_parent =
> +			nla_get_u8(info->attrs[NL80211_ATTR_MULTI_BSSID_PARENT]);
> +	if (params.multi_bssid_mode == NL80211_MULTIPLE_BSSID_NON_TRANSMITTED 
> &&
> +	    !params.multi_bssid_parent)
> +		return -EOPNOTSUPP;
> +
Are you expecting BSSID or ifindex in multi_bssid_parent? If it is 
ifindex, it can be 0. no

-Rajkumar

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
