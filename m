Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2]
 helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jeEJn-0006xB-Hw
 for ath11k@lists.infradead.org; Thu, 28 May 2020 08:55:17 +0000
Message-ID: <f9a764eaf9f0898c257b6c98346536c2c0f5d6f8.camel@sipsolutions.net>
Subject: Re: [PATCH v3 06/11] mac80211: handle HE 6 GHz Capability in HE STA
 processing
From: Johannes Berg <johannes@sipsolutions.net>
Date: Thu, 28 May 2020 10:55:09 +0200
In-Reply-To: <1589399105-25472-6-git-send-email-rmanohar@codeaurora.org>
References: <1589399105-25472-1-git-send-email-rmanohar@codeaurora.org>
 <1589399105-25472-6-git-send-email-rmanohar@codeaurora.org>
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
To: Rajkumar Manoharan <rmanohar@codeaurora.org>, kvalo@codeaurora.org
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org


> +++ b/include/net/cfg80211.h
> @@ -332,15 +332,25 @@ struct ieee80211_sta_vht_cap {
>   * to describe 802.11ax HE capabilities for a STA.
>   *
>   * @has_he: true iff HE data is valid.
> + * @has_he_6ghz: true iff HE 6 GHz data is valid.
>   * @he_cap_elem: Fixed portion of the HE capabilities element.
>   * @he_mcs_nss_supp: The supported NSS/MCS combinations.
>   * @ppe_thres: Holds the PPE Thresholds data.
> + * @ampdu_factor: Maximum A-MPDU length factor used in 6 GHz.
> + * @ampdu_density: Minimum A-MPDU spacing used in 6 GHz.
> + * @cap: HE 6 GHz Band capability.
>   */
>  struct ieee80211_sta_he_cap {
>  	bool has_he;
> +	bool has_he_6ghz;
>  	struct ieee80211_he_cap_elem he_cap_elem;
>  	struct ieee80211_he_mcs_nss_supp he_mcs_nss_supp;
>  	u8 ppe_thres[IEEE80211_HE_PPE_THRES_MAX_LEN];
> +	struct {
> +		u8 ampdu_factor;
> +		u8 ampdu_density;
> +		u16 cap;
> +	} he_6ghz;
>  };

So ... I'm a bit unsure about this now. What I had done was this (well,
I adjusted it slightly now):

https://p.sipsolutions.net/2d0eb7c7e23a1b92.txt


But it's only half related? Maybe you're also using that for the
associated stations, not just for "self"? But then again, you *already*
added 

@@ -1270,6 +1271,7 @@ struct station_parameters {
        u8 he_capa_len;
        u16 airtime_weight;
        struct sta_txpwr txpwr;
+       const struct ieee80211_he_6ghz_capa *he_6ghz_capa;
 };

right?


But no ... that's different. We still have a need to store the station's
capabilities.

But even then,

> +	struct {
> +		u8 ampdu_factor;
> +		u8 ampdu_density;
> +		u16 cap;
> +	} he_6ghz;

doesn't really make sense, does it? "cap' already includes the
ampdu_factor and ampdu_density flags, so that's doubled...


I think I would prefer to have this separate. We need it as I put into
my patch that I linked to above, and we also need it in the station in
mac80211 for AP, but we don't really need it for cfg80211 as you put it
here.

I'll continue with my other patches, and then maybe see how this fits in
later.

johannes


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
