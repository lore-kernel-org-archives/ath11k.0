Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2]
 helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jFICe-0000fo-5b
 for ath11k@lists.infradead.org; Fri, 20 Mar 2020 14:00:50 +0000
Message-ID: <fc46dc237012ee859d9c70d6198cb4ad5040564c.camel@sipsolutions.net>
Subject: Re: [RFCv2 1/2] mac80211: add receive path for ethernet frame format
From: Johannes Berg <johannes@sipsolutions.net>
Date: Fri, 20 Mar 2020 15:00:42 +0100
In-Reply-To: <1582804899-12814-2-git-send-email-mpubbise@codeaurora.org>
 (sfid-20200227_130214_238348_6B0CDFF4)
References: <1582804899-12814-1-git-send-email-mpubbise@codeaurora.org>
 <1582804899-12814-2-git-send-email-mpubbise@codeaurora.org>
 (sfid-20200227_130214_238348_6B0CDFF4)
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
To: Manikanta Pubbisetty <mpubbise@codeaurora.org>, ath11k@lists.infradead.org
Cc: Vasanthakumar Thiagarajan <vthiagar@codeaurora.org>, linux-wireless@vger.kernel.org

Hi,

On Thu, 2020-02-27 at 17:31 +0530, Manikanta Pubbisetty wrote:
> From: Vasanthakumar Thiagarajan <vthiagar@codeaurora.org>
> 
> Implement rx path which does fewer processing on the received data
> frame which has already gone through 802.11 header decapsulation
> and other functionalities which require 802.11 header in the low
> level driver or hardware. Currently this rx path is restricted
> to AP and STA mode, but can be extended for Adhoc mode as well.
> 
> It is upto to the low level driver to invoke the correct API and
> make sure if the frame that it passes is in ethernet format and
> the sta pointer is valid.

I guess generally this seems fine...


> +static const u8 pae_group_addr[ETH_ALEN] __aligned(2) = {0x01, 0x80, 0xC2, 0x00,
> +							 0x00, 0x03};

The coding style here is a bit weird ...

> +static void
> +ieee80211_rx_handle_decap_offl(struct ieee80211_sub_if_data *sdata,
> +			       struct sta_info *sta, struct sk_buff *skb,
> +			       struct napi_struct *napi)
> +{
> +	struct ieee80211_local *local = sdata->local;
> +	struct ieee80211_vif *vif = &sdata->vif;
> +	struct net_device *dev = sdata->dev;
> +	struct ieee80211_rx_status *status;
> +	struct ieee80211_key *key = NULL;
> +	struct ieee80211_rx_data rx;
> +	int i;
> +	struct ethhdr *ehdr;
> +	struct ieee80211_sta_rx_stats *stats = &sta->rx_stats;
> +
> +	ehdr = (struct ethhdr *)skb->data;

You need to ensure that this is actually accessible in the skb head.

> +	status = IEEE80211_SKB_RXCB(skb);
> +
> +	if (ieee80211_hw_check(&local->hw, USES_RSS))
> +		stats = this_cpu_ptr(sta->pcpu_rx_stats);
> +
> +	/* TODO: Extend ieee80211_rx_decap_offl() with bssid so that Ethernet
> +	 * encap/decap can be supported in Adhoc interface type as well.
> +	 * Adhoc interface depends on bssid to update last_rx.
> +	 */
> +	if (vif->type != NL80211_IFTYPE_STATION &&
> +	    vif->type != NL80211_IFTYPE_AP_VLAN &&
> +	    vif->type != NL80211_IFTYPE_AP)
> +		goto drop;

Is there any value in this TODO? Probably should even WARN_ON() here.

> +	stats->bytes += skb->len;

There's a bit of a mismatch here now between frames with 802.11 header
and frames with just ethernet - I don't know if we really need to
consider that, but it's there still?

> +	/* Forcing seqno index to -1 so that tid specific stats are
> +	 * not updated in ieee80211_deliver_skb().
> +	 */
> +	rx.seqno_idx = -1;

I guess that means you should also not advertise them to userspace ...
unless you're assuming that the driver would? But that seems far from
certain, so I guess if the driver intends to use ethernet RX then we
should remove a bunch of things in sta_set_tidstats()?


So I guess my biggest concern is about statistics - not that they need
to be there, but that we shouldn't show missing ones as (close to) zero,
but rather just not have them at all in this case.

johannes


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
