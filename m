Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from so254-31.mailgun.net ([198.61.254.31])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmXfq-0001V6-Lo
 for ath11k@lists.infradead.org; Tue, 08 Dec 2020 07:44:40 +0000
MIME-Version: 1.0
Date: Tue, 08 Dec 2020 15:44:33 +0800
From: Wen Gong <wgong@codeaurora.org>
Subject: Re: [PATCH v4 13/17] mac80211: receive and process S1G beacons
In-Reply-To: <20200922022818.15855-14-thomas@adapt-ip.com>
References: <20200922022818.15855-1-thomas@adapt-ip.com>
 <20200922022818.15855-14-thomas@adapt-ip.com>
Message-ID: <6064b579538afca27c511edeb5400032@codeaurora.org>
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+kvalo=adurom.com@lists.infradead.org
To: Thomas Pedersen <thomas@adapt-ip.com>
Cc: Johannes Berg <johannes@sipsolutions.net>, linux-wireless <linux-wireless@vger.kernel.org>, ath11k@lists.infradead.org, ath10k@lists.infradead.org

On 2020-09-22 10:28, Thomas Pedersen wrote:
> S1G beacons are 802.11 Extension Frames, so the fixed
> header part differs from regular beacons.
> 
> Add a handler to process S1G beacons and abstract out the
> fetching of BSSID and element start locations in the
> beacon body handler.
> 
> Signed-off-by: Thomas Pedersen <thomas@adapt-ip.com>
> ---
>  net/mac80211/ieee80211_i.h |  4 ++
>  net/mac80211/iface.c       |  5 +++
>  net/mac80211/mlme.c        | 84 +++++++++++++++++++++++++++++---------
>  net/mac80211/rx.c          | 84 ++++++++++++++++----------------------
>  net/mac80211/util.c        | 52 +++++++++++++++++++++++
>  5 files changed, 162 insertions(+), 67 deletions(-)
> 
...
> @@ -1801,7 +1756,8 @@ ieee80211_rx_h_sta_process(struct 
> ieee80211_rx_data *rx)
>  		}
>  	} else if (rx->sdata->vif.type == NL80211_IFTYPE_OCB) {
>  		sta->rx_stats.last_rx = jiffies;
> -	} else if (!is_multicast_ether_addr(hdr->addr1)) {
> +	} else if (!ieee80211_is_s1g_beacon(hdr->frame_control) &&
> +		   is_multicast_ether_addr(hdr->addr1)) {
is this a typo mistake?
it removed ! for is_multicast_ether_addr(!is_multicast_ether_addr ==> 
is_multicast_ether_addr)
>  		/*
>  		 * Mesh beacons will update last_rx when if they are found to
>  		 * match the current local configuration when processed.
...

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
