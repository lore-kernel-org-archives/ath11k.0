Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2]
 helo=sipsolutions.net)
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k188B-0005sl-S0
 for ath11k@lists.infradead.org; Thu, 30 Jul 2020 12:57:57 +0000
Message-ID: <5ccd3a30d9ede70148f1d02d397a8243c37b9c7b.camel@sipsolutions.net>
Subject: Re: [PATCH V2 02/10] nl80211: add attributes for multiple bssid
 related settings
From: Johannes Berg <johannes@sipsolutions.net>
Date: Thu, 30 Jul 2020 14:57:50 +0200
In-Reply-To: <20200706115219.663650-2-john@phrozen.org>
References: <20200706115219.663650-1-john@phrozen.org>
 <20200706115219.663650-2-john@phrozen.org>
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
> @@ -1126,6 +1137,7 @@ struct cfg80211_ap_settings {
>  	u32 flags;
>  	struct ieee80211_he_obss_pd he_obss_pd;
>  	struct cfg80211_he_bss_color he_bss_color;
> +	struct ieee80211_multi_bssid multi_bssid;

Missing docs?

>  };
>  
>  /**
> diff --git a/include/uapi/linux/nl80211.h b/include/uapi/linux/nl80211.h
> index b7a5d1de7aff..45b88f1221b0 100644
> --- a/include/uapi/linux/nl80211.h
> +++ b/include/uapi/linux/nl80211.h
> @@ -2511,6 +2511,11 @@ enum nl80211_commands {
>   * @NL80211_ATTR_MULTI_BSSID_PARENT: If this is a Non-Transmitted BSSID, define
>   *	the parent interface.
>   *
> + * @NL80211_ATTR_MULTI_BSSID_INDEX: The index of this BSS inside the multi bssid
> + *	IE.

Element, not "IE", these days ... :)

johannes


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
