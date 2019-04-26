Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2]
 helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hK6si-0001pq-10
 for ath11k@lists.infradead.org; Fri, 26 Apr 2019 19:51:37 +0000
Message-ID: <8b456918fc5cd0674f834771be2bb5134bccd26a.camel@sipsolutions.net>
Subject: Re: [PATCH V2 1/3] mac80211: allow turning TWT responder support on
 and off via netlink
From: Johannes Berg <johannes@sipsolutions.net>
Date: Fri, 26 Apr 2019 21:51:26 +0200
In-Reply-To: <2f153f21-17fe-26aa-98a4-b82cdb16ffff@phrozen.org>
References: <20190426094150.18078-1-john@phrozen.org>
 <20190426094150.18078-2-john@phrozen.org>
 <2f153f21-17fe-26aa-98a4-b82cdb16ffff@phrozen.org>
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
Cc: Srini Kode <skode@qti.qualcomm.com>, ath11k@lists.infradead.org, linux-wireless@vger.kernel.org, Rajkumar Manoharan <rmanohar@qti.qualcomm.com>, Shashidhar Lakkavalli <slakkavalli@datto.com>

On Fri, 2019-04-26 at 21:50 +0200, John Crispin wrote:
> On 26/04/2019 11:41, John Crispin wrote:
> > @@ -6105,6 +6106,7 @@ static int nl80211_set_bss(struct sk_buff *skb, struct genl_info *info)
> >   	params.ht_opmode = -1;
> >   	params.p2p_ctwindow = -1;
> >   	params.p2p_opp_ps = -1;
> > +	params.twt_responder = -1;
> >   
> >   	if (info->attrs[NL80211_ATTR_BSS_CTS_PROT])
> >   		params.use_cts_prot =
> > @@ -6149,6 +6151,10 @@ static int nl80211_set_bss(struct sk_buff *skb, struct genl_info *info)
> >   			return -EINVAL;
> >   	}
> >   
> > +	if (info->attrs[NL80211_ATTR_TWT_RESPONDER])
> > +		params.twt_responder =
> > +		    nla_get_u8(info->attrs[NL80211_ATTR_TWT_RESPONDER]);
> > +
> >   	if (!rdev->ops->change_bss)
> >   		return -EOPNOTSUPP;
> 
> Hi,
> 
> this should probably be moved to nl80211_start_ap() instead of 
> nl80211_set_bss() as we probably dont want to change this at runtime ?

I have no idea, can we change it at runtime? Is it a capability or an
operational state?

johannes


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
