Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from m43-7.mailgun.net ([69.72.43.7])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kBUwp-0005Sg-5T
 for ath11k@lists.infradead.org; Fri, 28 Aug 2020 03:21:06 +0000
MIME-Version: 1.0
Date: Thu, 27 Aug 2020 20:20:56 -0700
From: Aloka Dixit <alokad@codeaurora.org>
Subject: Re: [PATCH V3 4/9] mac80211: add multiple bssid/ema support to bcn
 templating
In-Reply-To: <20200812150050.2683396-5-john@phrozen.org>
References: <20200812150050.2683396-1-john@phrozen.org>
 <20200812150050.2683396-5-john@phrozen.org>
Message-ID: <e1822f692145388684e5c9cca767bbda@codeaurora.org>
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
To: John Crispin <john@phrozen.org>
Cc: linux-wireless-owner@vger.kernel.org, Johannes Berg <johannes@sipsolutions.net>, linux-wireless@vger.kernel.org, ath11k@lists.infradead.org

> +static void
> +ieee80211_beacon_add_multiple_bssid_config(struct ieee80211_vif *vif,
> struct sk_buff *skb,
> +					   struct cfg80211_multiple_bssid_data *config)
> +{
> +	u8 *pos = skb_put(skb, 6);
> +
> +	*pos++ = WLAN_EID_EXTENSION;
> +	*pos++ = 4;
> +	*pos++ = WLAN_EID_EXT_MULTIPLE_BSSID_CONFIGURATION;
> +	*pos++ = 2;
> +	*pos++ = vif->bss_conf.multiple_bssid.count;
> +	*pos++ = config->cnt;
> +}
> +

Hi John,
Which field in the IE is this line for : '*pos++ = 2;' ?
This IE should be total 5 bytes with length=3.

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
