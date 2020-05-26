Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2]
 helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jdZIp-0006i3-6T
 for ath11k@lists.infradead.org; Tue, 26 May 2020 13:07:32 +0000
Message-ID: <e4009ab74aaf037148932eccf41a6d7739bef59c.camel@sipsolutions.net>
Subject: Re: [PATCH V4 1/3] nl80211: add support for setting fixed HE
 rate/gi/ltf
From: Johannes Berg <johannes@sipsolutions.net>
Date: Tue, 26 May 2020 15:07:25 +0200
In-Reply-To: <20200504102051.6438-1-john@phrozen.org>
 (sfid-20200504_122104_674755_5B1A7EF6)
References: <20200504102051.6438-1-john@phrozen.org>
 (sfid-20200504_122104_674755_5B1A7EF6)
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
Cc: Miles Hu <milehu@codeaurora.org>, linux-wireless@vger.kernel.org, ath11k@lists.infradead.org

On Mon, 2020-05-04 at 12:20 +0200, John Crispin wrote:
> 
> * properly make use the iftype_data array

questionable? ;)
 
> +/**
> + * ieee80211_get_he_cap - return the first he_cap that we find for a sband
> + * @sband: the sband that we want to check for HE support
> + *
> + * Return: return a valid he_cap or NULL
> + */
> +static inline const struct ieee80211_sta_he_cap *
> +ieee80211_get_he_cap(const struct ieee80211_supported_band *sband)

So this returns an ... arbitrary one basically.

> +static bool he_set_mcs_mask(struct genl_info *info,
> +			    struct ieee80211_supported_band *sband,
> +			    struct nl80211_txrate_he *txrate,
> +			    u16 mcs[NL80211_HE_NSS_MAX])
> +{
> +	const struct ieee80211_sta_he_cap *he_cap;
> +	u16 tx_mcs_mask[NL80211_HE_NSS_MAX] = {};
> +	u16 tx_mcs_map = 0;
> +	u8 i;
> +
> +	he_cap = ieee80211_get_he_cap(sband);

and here you use it

But! In all the cases where you actually get here, you should have a
netdev. So you also know the correct type, and don't have to pick an
arbitrary one.

johannes



_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
