Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2]
 helo=sipsolutions.net)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kkNQk-0007am-AL
 for ath11k@lists.infradead.org; Wed, 02 Dec 2020 08:24:23 +0000
Message-ID: <9b1543d8798277bbfc891b794362451432d98884.camel@sipsolutions.net>
Subject: Re: [PATCH] mac80211: fix rx byte values not updated on mesh link
From: Johannes Berg <johannes@sipsolutions.net>
Date: Wed, 02 Dec 2020 09:23:57 +0100
In-Reply-To: <1606884912-10987-1-git-send-email-tmariyap@codeaurora.org>
 (sfid-20201202_055729_704309_A90E5928)
References: <1606884912-10987-1-git-send-email-tmariyap@codeaurora.org>
 (sfid-20201202_055729_704309_A90E5928)
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
To: Thiraviyam Mariyappan <tmariyap@codeaurora.org>, ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org

On Wed, 2020-12-02 at 10:25 +0530, Thiraviyam Mariyappan wrote:
> In mesh link, rx byte values were not updating though rx packets keep
> increasing in the station dump. This is because of rx_stats were updated
> regardless of USES_RSS flag is enabled/disabled. Solved the issue by
> updating the rx_stats from percpu pointers according to the USES_RSS flag

You should write commit logs in imperative voice, e.g. "Solve the
issue..."

> +++ b/net/mac80211/rx.c
> @@ -2212,6 +2212,7 @@ ieee80211_rx_h_defragment(struct ieee80211_rx_data *rx)
>  	unsigned int frag, seq;
>  	struct ieee80211_fragment_entry *entry;
>  	struct sk_buff *skb;
> +	struct ieee80211_sta_rx_stats *stats;
>  
>  	hdr = (struct ieee80211_hdr *)rx->skb->data;
>  	fc = hdr->frame_control;
> @@ -2340,8 +2341,12 @@ ieee80211_rx_h_defragment(struct ieee80211_rx_data *rx)
>   out:
>  	ieee80211_led_rx(rx->local);
>   out_no_led:
> -	if (rx->sta)
> -		rx->sta->rx_stats.packets++;
> +	if (rx->sta) {
> +		stats = &rx->sta->rx_stats;
> +		if (ieee80211_hw_check(&rx->sdata->local->hw, USES_RSS))
> +			stats = this_cpu_ptr(rx->sta->pcpu_rx_stats);
> +		stats->packets++;
> +	}
>  	return RX_CONTINUE;
> 

This is certainly not only related to mesh, so the commit log is wrong.

Also, let's not copy/paste this code so much ...

johannes


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
