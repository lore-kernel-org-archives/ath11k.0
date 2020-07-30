Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2]
 helo=sipsolutions.net)
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k185l-0005lk-Lj
 for ath11k@lists.infradead.org; Thu, 30 Jul 2020 12:55:28 +0000
Message-ID: <5e0206e79c71ecfeae004dadcebaa44e40d96b8b.camel@sipsolutions.net>
Subject: Re: [PATCH V2 01/10] nl80211: add basic multiple bssid support
From: Johannes Berg <johannes@sipsolutions.net>
Date: Thu, 30 Jul 2020 14:55:10 +0200
In-Reply-To: <20200706115219.663650-1-john@phrozen.org>
References: <20200706115219.663650-1-john@phrozen.org>
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
To: John Crispin <john@phrozen.org>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org


> +++ b/include/net/cfg80211.h
> @@ -604,6 +604,8 @@ struct vif_params {
>  	u8 macaddr[ETH_ALEN];
>  	const u8 *vht_mumimo_groups;
>  	const u8 *vht_mumimo_follow_addr;
> +	enum nl80211_multi_bssid_mode multi_bssid_mode;
> +	u32 multi_bssid_parent;

Can you put this into a(n anonymous) sub-structure?

This also missed kernel-doc.

>   *	unprotected beacon report
> + * @multi_bssid_mode: Is this a legacy, transmitted or non-transmitted bssid
> + * @multi_bssid_parent: a non-transmitted bssid has a transmitted parent
> + * @multi_bssid_list: linked list for tracking parent - child relations.


FWIW, you can (now?) write

 * @multi_bssid.list: ...

to document data for anonymous sub-structures.

I started applying this and changed it myself, but am having second
thoughts on later patches in this series.

> + * @NL80211_ATTR_MULTI_BSSID_MODE: Set the (Non-)Transmitted flag for this
> + *	BSSIDs beacon.
> + *
> + * @NL80211_ATTR_MULTI_BSSID_PARENT: If this is a Non-Transmitted BSSID, define
> + *	the parent interface.

Maybe clarify

	the parent (transmitted BSSID) interface

or so?

> +/**
> + * enum nl80211_multi_bssid_mode - Multiple BSSID beacon type
> + *
> + * Used by cfg80211_ap_settings

That'd be weird, but it's not true, you have it for
NL80211_ATTR_MULTI_BSSID_MODE. Actually, that documentation should point
here and say the values are from this enum.

> + * @MULTIPLE_BSSID_LEGACY: This BSS is not part of a multiple BSSID group
> + * @MULTIPLE_BSSID_TRANSMITTED: This BSS is broadcasting a multiple BSSID
> + *                                    beacon

Please just use a single tab there :)

> +	[NL80211_ATTR_MULTI_BSSID_MODE] = NLA_POLICY_RANGE(NLA_U8,
> +					NL80211_MULTIPLE_BSSID_LEGACY,
> +					NL80211_MULTIPLE_BSSID_NON_TRANSMITTED),

Maybe nicer as

	[...] = 
		NLA_POLICY_RANGE(...

johannes


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
