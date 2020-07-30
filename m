Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2]
 helo=sipsolutions.net)
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k18E6-0006FI-Df
 for ath11k@lists.infradead.org; Thu, 30 Jul 2020 13:04:05 +0000
Message-ID: <518246cd35a827a3652a0fcc5fc655fc4686ca76.camel@sipsolutions.net>
Subject: Re: [PATCH V2 03/10] mac80211: add multiple bssid support
From: Johannes Berg <johannes@sipsolutions.net>
Date: Thu, 30 Jul 2020 15:03:56 +0200
In-Reply-To: <20200706115219.663650-3-john@phrozen.org>
References: <20200706115219.663650-1-john@phrozen.org>
 <20200706115219.663650-3-john@phrozen.org>
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

On Mon, 2020-07-06 at 13:52 +0200, John Crispin wrote:
> 
> +/**
> + * ieee80211_get_multi_bssid_mode - get a vifs multi bssid mode.
> + *
> + * This function is used to help look up the multi bssid mode which is tracked
> + * inside the wdev.
> + *
> + * @vif: &struct ieee80211_vif pointer from the add_interface callback.
> + */
> +enum nl80211_multi_bssid_mode ieee80211_get_multi_bssid_mode(struct ieee80211_vif *vif);
> +
> +/**
> + * ieee80211_get_multi_bssid_parent - get a vifs multi bssid parent.
> + *
> + * This function is used to help look up the multi bssid parent which is tracked
> + * inside the wdev.
> + *
> + * @vif: &struct ieee80211_vif pointer from the add_interface callback.
> + */
> +struct ieee80211_vif *ieee80211_get_multi_bssid_parent(struct ieee80211_vif *vif);

All this can be a lot simpler if you don't just push the data that I
just mentioned from the wdev down to the sdata, but actually down to the
vif. Then these are just something like

	vif->multi_bssid.parent

without a need to call a function. That'd probably result in
significantly smaller code too, since exporting a function takes quite a
bit of space.

(Also, if you insist that it must be in the wdev, you can use the
function that obtains the wdev from the vif, and dereference that -
still wouldn't require exporting a lot of new functions.)

> +	if (params->multi_bssid_mode &&
> +	    !ieee80211_hw_check(&local->hw, SUPPORTS_MULTI_BSSID))
> +		return -ENOTSUPP;

IMHO that needs to be a new, separate feature bit, probably even at
nl80211 level. This here was more of a client-side thing, and now you're
doing AP side. I don't think we can mix those (and iwlwifi surely would
have issues with that.)

>  static int ieee80211_del_iface(struct wiphy *wiphy, struct wireless_dev *wdev)
>  {
> +	struct ieee80211_sub_if_data *sdata;
> +	struct wireless_dev *child, *tmp;
> +
> +	sdata = IEEE80211_WDEV_TO_SUB_IF(wdev);
> +	switch (sdata->wdev.multi_bssid_mode) {
> +	case NL80211_MULTIPLE_BSSID_TRANSMITTED:
> +		if (list_empty(&sdata->wdev.multi_bssid_list))
> +			break;
> +		sdata_info(sdata, "deleting while non-transmitting children still exist\n");

Is that even worth a message? I mean, you could just destroy the
children too, and document it in the API that way?

> +		list_for_each_entry_safe(child, tmp, &sdata->wdev.multi_bssid_list,
> +					 multi_bssid_list) {
> +			list_del(&child->multi_bssid_list);
> +			child->multi_bssid_parent = NULL;
> +		}

It also seems you shouldn't just NULL out the pointer but dev_close()
them so they stop operating?

>  	case NL80211_IFTYPE_AP:
>  		sdata->bss = &sdata->u.ap;
> +		if (wdev->multi_bssid_mode == NL80211_MULTIPLE_BSSID_TRANSMITTED) {
> +			struct wireless_dev *child;
> +			int children_down = 0;
> +
> +			/* check if all children are already up */
> +			list_for_each_entry(child, &wdev->multi_bssid_list,
> +					    multi_bssid_list)
> +				if (!wdev_running(child))
> +					children_down = 1;
> +			if (children_down)
> +				sdata_info(sdata, "non-transmitting children are not up yet\n");

reject it?

> @@ -800,6 +812,7 @@ static int ieee80211_open(struct net_device *dev)
>  static void ieee80211_do_stop(struct ieee80211_sub_if_data *sdata,
>  			      bool going_down)
>  {
> +	struct wireless_dev *wdev = ieee80211_vif_to_wdev(&sdata->vif);
>  	struct ieee80211_local *local = sdata->local;
>  	unsigned long flags;
>  	struct sk_buff *skb, *tmp;
> @@ -810,6 +823,12 @@ static void ieee80211_do_stop(struct ieee80211_sub_if_data *sdata,
>  	bool cancel_scan;
>  	struct cfg80211_nan_func *func;
>  
> +	if (sdata->vif.type == NL80211_IFTYPE_AP &&
> +	    wdev->multi_bssid_mode == NL80211_MULTIPLE_BSSID_NON_TRANSMITTED)
> +		/* make sure the parent is already down */
> +		if (wdev->multi_bssid_parent && wdev_running(wdev->multi_bssid_parent))
> +			sdata_info(sdata, "transmitting parent is still up\n");

Reject it? Or dev_close() the parent?

johannes


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
