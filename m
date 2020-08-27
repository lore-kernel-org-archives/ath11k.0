Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2]
 helo=sipsolutions.net)
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kBHdv-0004io-QJ
 for ath11k@lists.infradead.org; Thu, 27 Aug 2020 13:08:42 +0000
Message-ID: <2f1de2e5672f1516ac1d94520f54b00153fd24f3.camel@sipsolutions.net>
Subject: Re: [PATCH V3 2/9] mac80211: add multiple bssid support to
 interface handling
From: Johannes Berg <johannes@sipsolutions.net>
Date: Thu, 27 Aug 2020 15:08:33 +0200
In-Reply-To: <20200812150050.2683396-3-john@phrozen.org>
References: <20200812150050.2683396-1-john@phrozen.org>
 <20200812150050.2683396-3-john@phrozen.org>
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


> +	struct {
> +		struct ieee80211_vif *parent;
> +		struct list_head list;
> +		bool non_transmitted;
> +	} multiple_bssid;

Oh, and also - surely parent isn't set for the transmitted BSSID, so the
bool non_transmitted is redundant? It's basically the same as !!parent?

Which also applies at the cfg80211 level.

> +static int ieee80211_set_multiple_bssid_options(struct ieee80211_sub_if_data *sdata,
> +						struct vif_params *params)
> +{
> +	struct ieee80211_local *local = sdata->local;
> +	struct wiphy *wiphy = local->hw.wiphy;
> +	struct net_device *parent;
> +	struct ieee80211_sub_if_data *psdata;
> +
> +	if (!ieee80211_hw_check(&local->hw, SUPPORTS_MULTI_BSSID_AP))
> +		return 0;

That was probably meant to be an error? Otherwise the function can be
void.

> +++ b/net/mac80211/iface.c
> @@ -810,6 +810,13 @@ static void ieee80211_do_stop(struct ieee80211_sub_if_data *sdata,
>  	bool cancel_scan;
>  	struct cfg80211_nan_func *func;
>  
> +	if (sdata->vif.type == NL80211_IFTYPE_AP &&
> +	    sdata->vif.multiple_bssid.non_transmitted)
> +		/* make sure the parent is already down */
> +		if (sdata->vif.multiple_bssid.parent &&
> +		    ieee80211_sdata_running(vif_to_sdata(sdata->vif.multiple_bssid.parent)))
> +			dev_close(vif_to_sdata(sdata->vif.multiple_bssid.parent)->wdev.netdev);
> +
> 

This is nice but somewhere you also need to actually NULL the pointer.
As it is now, it seems you could set up two interfaces, say

wlan_nontx
wlan_tx

then ifup both, then delete wlan_tx (forcing wlan_nontx down) and then
set wlan_nontx back up and back down or whatever, but the parent pointer
wasn't cleared so ... bad things will happen?

Maybe this stuff could even happen at the cfg80211 level? Might be
useful for others too.

johannes


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
