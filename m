Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2]
 helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ign6i-0005Km-Uu
 for ath11k@lists.infradead.org; Mon, 16 Dec 2019 09:56:06 +0000
Message-ID: <a67dd924ebb638a8ba2b742a07fd3d1db34732ce.camel@sipsolutions.net>
Subject: Re: [PATCH v2 2/7] nl80211: add handling for BSS color
From: Johannes Berg <johannes@sipsolutions.net>
Date: Mon, 16 Dec 2019 10:56:00 +0100
In-Reply-To: <20191213155802.25491-2-john@phrozen.org>
References: <20191213155802.25491-1-john@phrozen.org>
 <20191213155802.25491-2-john@phrozen.org>
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
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org


> +/**
> + * enum nl80211_bss_color_attributes - BSS Color attributes
> + * @__NL80211_HE_BSS_COLOR_ATTR_INVALID: Invalid
> + *
> + * @NL80211_HE_BSS_COLOR: the current BSS Color.
> + * @NL80211_HE_BSS_COLOR_DISABLED: is BSS coloring disabled.
> + * @NL80211_HE_BSS_COLOR_PARTIAL: the AID equation to be used..

It makes the names somewhat awkwardly long, but I think _ATTR should be
included here like the invalid/last/max, to make clear it's not the
color itself or something like that?

> +static const struct nla_policy
> +he_bss_color_policy[NL80211_HE_BSS_COLOR_ATTR_MAX + 1] = {

I didn't realize this before and really thought about it only because I
saw the one for the nl80211_policy in the context now, but I guess this
should have a strict start type like below:

>  	[0] = { .strict_start_type = NL80211_ATTR_HE_OBSS_PD },

though in this case we can probably do

	[0] = { .strict_start_type = 0 },

to indicate that all these should be treated strictly.


Also, not directly related to any code, can't the BSS color change, and
thus you need a method to update it?

johannes


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
