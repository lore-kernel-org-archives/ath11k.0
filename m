Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2]
 helo=sipsolutions.net)
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k19h7-0003s0-Ss
 for ath11k@lists.infradead.org; Thu, 30 Jul 2020 14:38:08 +0000
Message-ID: <3a608bb13f7115e8b019eea770691239a769dc24.camel@sipsolutions.net>
Subject: Re: [PATCH V2 01/10] nl80211: add basic multiple bssid support
From: Johannes Berg <johannes@sipsolutions.net>
Date: Thu, 30 Jul 2020 16:37:59 +0200
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

On Mon, 2020-07-06 at 13:52 +0200, John Crispin wrote:
> 
> @@ -3761,6 +3765,16 @@ static int nl80211_new_interface(struct sk_buff *skb, struct genl_info *info)
>  	if (err < 0)
>  		return err;
>  
> +	if (info->attrs[NL80211_ATTR_MULTI_BSSID_MODE])
> +		params.multi_bssid_mode =
> +			nla_get_u8(info->attrs[NL80211_ATTR_MULTI_BSSID_MODE]);
[...]

Oh .. missed this completely until I got to the iw patch :)

Why are you adding this in *new interface? IMHO it would be more
applicable to "start_ap"? I don't see a reason why an interface couldn't
change the role here regarding multi-BSSID while it's down?

That might also address some of the whole "cfg80211" vs. "mac80211"
thing I raised previously, since now cfg80211 would have a lot more
knowledge about things if the interface is already operating, i.e. it
could track and validate more of this?

johannes


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
