Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2]
 helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jeD9d-0007ZH-Hg
 for ath11k@lists.infradead.org; Thu, 28 May 2020 07:40:45 +0000
Message-ID: <ec74f39f6591249559f83895e0b1f6d33720f2f5.camel@sipsolutions.net>
Subject: Re: [PATCH v3 02/11] cfg80211: handle 6 GHz capability of new station
From: Johannes Berg <johannes@sipsolutions.net>
Date: Thu, 28 May 2020 09:40:36 +0200
In-Reply-To: <17385b3a2fca16521858bf0956904698@codeaurora.org>
References: <1589399105-25472-1-git-send-email-rmanohar@codeaurora.org>
 <1589399105-25472-2-git-send-email-rmanohar@codeaurora.org>
 <bf0f6c17c188901477c1d6aa61aab6143c4ac635.camel@sipsolutions.net>
 <17385b3a2fca16521858bf0956904698@codeaurora.org>
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
To: Rajkumar Manoharan <rmanohar@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org, kvalo@codeaurora.org

On Wed, 2020-05-27 at 16:24 -0700, Rajkumar Manoharan wrote:
> On 2020-05-27 07:00, Johannes Berg wrote:
> > On Wed, 2020-05-13 at 12:44 -0700, Rajkumar Manoharan wrote:
> > > Handle 6 GHz HE capability while adding new station. It will be used
> > > later in mac80211 station processing.
> > 
> > This doesn't compile without the next patch.
> > 
> My bad.. I must have overlooked while splitting the patch. :(

No worries. Looks like I'm reshuffling everything anyway :)


> > > +       const struct ieee80211_he_6ghz_band_cap *he_6ghz_capa;
> > 
> > This we made just an __le16, any particular reason to have the struct?
> > It does need to be a pointer for the "no changes" case, but the struct
> > seems a bit overkill?
> > 
> Initially I thought of splitting into two u8 for a_mpdu_params and info.
> Later changed to __le16 but retained struct. Nothing else :)

Right. I even saw that we're inconsistent - in mac80211 we used a struct
too, and in cfg80211 I just did __le16 ... I'll be consistent with a
struct, I guess.

> > > @@ -2998,6 +3003,7 @@ enum nl80211_attrs {
> > >  #define NL80211_HE_MAX_CAPABILITY_LEN           54
> > >  #define NL80211_MAX_NR_CIPHER_SUITES		5
> > >  #define NL80211_MAX_NR_AKM_SUITES		2
> > > +#define NL80211_HE_6GHZ_CAPABILITY_LEN		2
> > 
> > This not, we defined it just to be a U16.

And this should probably not be defined anyway since it comes from the
spec (and we now export the policy to userspace even!) and in the policy
we can then use sizeof(struct ...).

> > > +	[NL80211_ATTR_HE_6GHZ_CAPABILITY] = {
> > > +		.type = NLA_EXACT_LEN,
> > > +		.len = NL80211_HE_6GHZ_CAPABILITY_LEN,
> > > +	},
> > 
> > This no longer exists, but I guess I'll just take our patch for the U16
> > here.

Sorry, I was confused - of course this still exists. NLA_EXACT_LEN_WARN
no longer exists since my recent rework in this area.

> >                 /* HE requires WME */
> > -               if (params.he_capa_len)
> > +               if (params.he_capa_len || params.he_6ghz_capa)
> >                         return -EINVAL;
> >         }
> > 
> Fine. One more thing. Pradeep found that 6 GHz capability is not filled 
> in set_station.
> Please handle that in your series. I'm fine with rest of the changes you 
> mentioned.
> 
> --- a/net/wireless/nl80211.c
> +++ b/net/wireless/nl80211.c
> @@ -5893,6 +5893,10 @@ static int nl80211_set_station_tdls(struct
> genl_info *info,
>                          return -EINVAL;
>          }
> 
> +       if (info->attrs[NL80211_ATTR_HE_6GHZ_CAPABILITY])
> +               params->he_6ghz_capa =
> +                       
> nla_data(info->attrs[NL80211_ATTR_HE_6GHZ_CAPABILITY]);
> +

OK, thanks!

johannes


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
