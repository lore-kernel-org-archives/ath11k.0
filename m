Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2]
 helo=sipsolutions.net)
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k19WF-0003CX-DG
 for ath11k@lists.infradead.org; Thu, 30 Jul 2020 14:26:54 +0000
Message-ID: <350e8bd7bc1c892f1e28f0964de6618bb81edfc0.camel@sipsolutions.net>
Subject: Re: [PATCH V2 1/3] nl80211: add support for BSS coloring
From: Johannes Berg <johannes@sipsolutions.net>
Date: Thu, 30 Jul 2020 16:26:44 +0200
In-Reply-To: <20200706170616.1764626-1-john@phrozen.org>
References: <20200706170616.1764626-1-john@phrozen.org>
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

On Mon, 2020-07-06 at 19:06 +0200, John Crispin wrote:
> 
> +/**
> + * struct cfg80211_cca_settings - color change settings
> + *
> + * Used for color change
> + *
> + * @beacon_cca: beacon data while performing the change
> + * @counter_offsets_beacon: offsets of the counters within the beacon (tail)
> + * @counter_offsets_presp: offsets of the counters within the probe response
> + * @beacon_after: beacon data to be used after the change
> + * @count: number of beacons until the change
> + * @color: the color that we will have after th change

typo: the change

>   * @WIPHY_FLAG_SUPPORTS_EXT_KEK_KCK: The device supports bigger kek and kck keys
> + * @WIPHY_FLAG_SUPPORTS_BSS_COLOR: Device supports BSS coloring
>   */
>  enum wiphy_flags {
>  	WIPHY_FLAG_SUPPORTS_EXT_KEK_KCK		= BIT(0),
> @@ -4198,6 +4224,7 @@ enum wiphy_flags {
>  	WIPHY_FLAG_SUPPORTS_5_10_MHZ		= BIT(22),
>  	WIPHY_FLAG_HAS_CHANNEL_SWITCH		= BIT(23),
>  	WIPHY_FLAG_HAS_STATIC_WEP		= BIT(24),
> +	WIPHY_FLAG_SUPPORTS_BSS_COLOR		= BIT(25),

That seems to belong into an entirely different patchset?

And probably should be an extended nl80211 feature?

> + * @NL80211_CMD_CCA_STARTED_NOTIFY: Notify userland, that we color change has
> + *	started
> + *
> + * @NL80211_CMD_CCA_ABORTED_NOTIFY: Notify userland, that we color change has
> + *	been aborted
> + *
> + * @NL80211_CMD_CCA_NOTIFY: Notify userland, that we color change has completed

s/userland,/userland/
s/we/the/

Btw, whoever came up with "CCA" as the acronym for this? if it's not in
the spec, can you change it? I can't not think "channel clear
assessment" ...

> + * @NL80211_ATTR_OBSS_COLOR_BITMAP: bitmap of the 64 BSS colors for the
> + *	%NL80211_CMD_OBSS_COLOR_COLLISION command.

u64 attribute then, presumably?

s/command/event/?

> + * @NL80211_ATTR_CCA_C_OFF_BEACON: An array of offsets (u16) to the color
> + *	switch counters in the beacons tail (%NL80211_ATTR_BEACON_TAIL).
> + * @NL80211_ATTR_CCA_C_OFF_PRESP: An array of offsets (u16) to the color
> + *	switch counters in the probe response (%NL80211_ATTR_PROBE_RESP).

I think we discussed this, and we're not going to support both CSA and
CCA at the same time, right?

So perhaps we can repurpose the CSA attributes, and even rename them by
leaving a "#define oldname newname" in nl80211.h. We've done that
before.

E.g. just NL80211_ATTR_CNTDWN_OFFS_PRESP or something like that?

> +	err = nla_parse_nested_deprecated(cca_attrs, NL80211_ATTR_MAX,
> +					  info->attrs[NL80211_ATTR_CCA_IES],
> +					  nl80211_policy, info->extack);

You shouldn't use the _deprecated function for new attributes.

And if this is nested, you should use NLA_POLICY_NESTED() in the policy.
You're now allowed to nest recursively (i.e. nest nl80211_policy into
its own nested attributes), but I'm a bit confused as to why you need
that and didn't move to use a new sub-enum? That'd save a ton of stack
space - in fact the "cca_attrs" array is probably big enough now to
cause stack size warnings immediately?

johannes


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
