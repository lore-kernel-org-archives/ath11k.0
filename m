Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2]
 helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hJwXv-0000Ff-Iu
 for ath11k@lists.infradead.org; Fri, 26 Apr 2019 08:49:29 +0000
Message-ID: <b35bf3e3778858cf95d4e8b743a884e4cc424798.camel@sipsolutions.net>
Subject: Re: [PATCH 1/3] mac80211: allow turning TWT responder support on
 and off via netlink
From: Johannes Berg <johannes@sipsolutions.net>
Date: Fri, 26 Apr 2019 10:49:17 +0200
In-Reply-To: <20190426084244.28098-2-john@phrozen.org>
References: <20190426084244.28098-1-john@phrozen.org>
 <20190426084244.28098-2-john@phrozen.org>
Mime-Version: 1.0
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
Cc: linux-wireless@vger.kernel.org, Shashidhar Lakkavalli <slakkavalli@datto.com>, Srini Kode <skode@qti.qualcomm.com>, Rajkumar Manoharan <rmanohar@qti.qualcomm.com>, ath11k@lists.infradead.org

On Fri, 2019-04-26 at 10:42 +0200, John Crispin wrote:
> 
> +++ b/net/wireless/nl80211.c
> @@ -6105,6 +6105,7 @@ static int nl80211_set_bss(struct sk_buff *skb, struct genl_info *info)
>  	params.ht_opmode = -1;
>  	params.p2p_ctwindow = -1;
>  	params.p2p_opp_ps = -1;
> +	params.twt_responder = -1;
>  
>  	if (info->attrs[NL80211_ATTR_BSS_CTS_PROT])
>  		params.use_cts_prot =
> @@ -6149,6 +6150,10 @@ static int nl80211_set_bss(struct sk_buff *skb, struct genl_info *info)
>  			return -EINVAL;
>  	}
>  
> +	if (info->attrs[NL80211_ATTR_TWT_RESPONDER])
> +		params.twt_responder =
> +		    nla_get_u8(info->attrs[NL80211_ATTR_TWT_RESPONDER]);

You need an NLA_POLICY_RANGE() policy for that attribute.

johannes


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
