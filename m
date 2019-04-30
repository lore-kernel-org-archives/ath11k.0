Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hLMTe-0005CI-7v
 for ath11k@lists.infradead.org; Tue, 30 Apr 2019 06:42:55 +0000
MIME-Version: 1.0
Date: Mon, 29 Apr 2019 23:42:49 -0700
From: Rajkumar Manoharan <rmanohar@codeaurora.org>
Subject: Re: [PATCH V2 1/3] mac80211: allow turning TWT responder support on
 and off via netlink
In-Reply-To: <20190426094150.18078-2-john@phrozen.org>
References: <20190426094150.18078-1-john@phrozen.org>
 <20190426094150.18078-2-john@phrozen.org>
Message-ID: <cfa10fe3ee14d7295203d4f255aefd9d@codeaurora.org>
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
Cc: linux-wireless-owner@vger.kernel.org, linux-wireless@vger.kernel.org, Rajkumar Manoharan <rmanohar@qti.qualcomm.com>, Srini Kode <skode@qti.qualcomm.com>, Shashidhar Lakkavalli <slakkavalli@datto.com>, Johannes Berg <johannes@sipsolutions.net>, ath11k@lists.infradead.org, Kalle Valo <kvalo@codeaurora.org>

On 2019-04-26 02:41, John Crispin wrote:
> Allow the userland daemon to en/disable TWT support for an AP.
> 
> Signed-off-by: Shashidhar Lakkavalli <slakkavalli@datto.com>
> Signed-off-by: John Crispin <john@phrozen.org>
> ---
>  include/net/cfg80211.h       | 2 ++
>  include/net/mac80211.h       | 5 +++++
>  include/uapi/linux/nl80211.h | 4 ++++
>  net/mac80211/cfg.c           | 6 ++++++
>  net/wireless/nl80211.c       | 6 ++++++
>  5 files changed, 23 insertions(+)
> 
> diff --git a/include/net/cfg80211.h b/include/net/cfg80211.h
> index bb307a11ee63..8a20f5a42977 100644
> --- a/include/net/cfg80211.h
> +++ b/include/net/cfg80211.h
> @@ -1511,6 +1511,7 @@ struct mpath_info {
>   * 	(u16 = opmode, -1 = do not change)
>   * @p2p_ctwindow: P2P CT Window (-1 = no change)
>   * @p2p_opp_ps: P2P opportunistic PS (-1 = no change)
> + * @twt_responder: HE Target Wait Time support.
> 

Responder support. Perhaps it could named as he_twt_resp to 
differentiate from ah.

>   */
>  struct bss_parameters {
>  	int use_cts_prot;
> @@ -1521,6 +1522,7 @@ struct bss_parameters {
>  	int ap_isolate;
>  	int ht_opmode;
>  	s8 p2p_ctwindow, p2p_opp_ps;
> +	int twt_responder;
>  };
> 
Same here. Better fix he_ in other places as well. thoughts?

>  /**
> diff --git a/include/net/mac80211.h b/include/net/mac80211.h
> index ac2ed8ec662b..87a6e149abda 100644
> --- a/include/net/mac80211.h
> +++ b/include/net/mac80211.h
> @@ -317,6 +317,7 @@ struct ieee80211_vif_chanctx_switch {
>   * @BSS_CHANGED_MCAST_RATE: Multicast Rate setting changed for this 
> interface
>   * @BSS_CHANGED_FTM_RESPONDER: fime timing reasurement request 
> responder
>   *	functionality changed for this BSS (AP mode).
> + * @BSS_CHANGED_TWT: TWT enable status changed
>   *
>   */
>  enum ieee80211_bss_change {
> @@ -347,6 +348,7 @@ enum ieee80211_bss_change {
>  	BSS_CHANGED_KEEP_ALIVE		= 1<<24,
>  	BSS_CHANGED_MCAST_RATE		= 1<<25,
>  	BSS_CHANGED_FTM_RESPONDER	= 1<<26,
> +	BSS_CHANGED_TWT			= 1<<27,
> 
>  	/* when adding here, make sure to change ieee80211_reconfig */
>  };
> @@ -504,6 +506,8 @@ struct ieee80211_ftm_responder_params {
>   * @he_support: does this BSS support HE
>   * @twt_requester: does this BSS support TWT requester (relevant for 
> managed
>   *	mode only, set if the AP advertises TWT responder role)
> + * @twt_responder: does this BSS support TWT responder (relevant for 
> AP
> + *	mode only, set if the AP advertises TWT responder role)
>   * @assoc: association status
>   * @ibss_joined: indicates whether this station is part of an IBSS
>   *	or not
> @@ -611,6 +615,7 @@ struct ieee80211_bss_conf {
>  	u16 frame_time_rts_th;
>  	bool he_support;
>  	bool twt_requester;
> +	bool twt_responder;
> 
ah.. I see existing twt_requester config.

>  	/* association related data */
>  	bool assoc, ibss_joined;
>  	bool ibss_creator;
> diff --git a/include/uapi/linux/nl80211.h 
> b/include/uapi/linux/nl80211.h
> index dd4f86ee286e..ba1f69751a4a 100644
> --- a/include/uapi/linux/nl80211.h
> +++ b/include/uapi/linux/nl80211.h
> @@ -2308,6 +2308,8 @@ enum nl80211_commands {
>   * @NL80211_ATTR_AIRTIME_WEIGHT: Station's weight when scheduled by 
> the airtime
>   *	scheduler.
>   *
> + * @NL80211_ATTR_TWT_RESPONDER: Enable target wait time responder 
> support.
> + *
>   * @NUM_NL80211_ATTR: total number of nl80211_attrs available
>   * @NL80211_ATTR_MAX: highest attribute number currently defined
>   * @__NL80211_ATTR_AFTER_LAST: internal use
> @@ -2759,6 +2761,8 @@ enum nl80211_attrs {
> 
>  	NL80211_ATTR_AIRTIME_WEIGHT,
> 
> +	NL80211_ATTR_TWT_RESPONDER,
> +
>  	/* add attributes here, update the policy in nl80211.c */
> 
>  	__NL80211_ATTR_AFTER_LAST,
> diff --git a/net/mac80211/cfg.c b/net/mac80211/cfg.c
> index 09dd1c2860fc..a66600bf9cef 100644
> --- a/net/mac80211/cfg.c
> +++ b/net/mac80211/cfg.c
> @@ -2176,6 +2176,12 @@ static int ieee80211_change_bss(struct wiphy 
> *wiphy,
>  		changed |= BSS_CHANGED_P2P_PS;
>  	}
> 
> +	if (params->twt_responder >= 0) {
> +		sdata->vif.bss_conf.twt_responder =
> +			params->twt_responder;
> +		changed |= BSS_CHANGED_TWT;
> +	}
> +
>  	ieee80211_bss_info_change_notify(sdata, changed);
> 
>  	return 0;
> diff --git a/net/wireless/nl80211.c b/net/wireless/nl80211.c
> index 25a9e3b5c154..afd04a98a601 100644
> --- a/net/wireless/nl80211.c
> +++ b/net/wireless/nl80211.c
> @@ -541,6 +541,7 @@ const struct nla_policy 
> nl80211_policy[NUM_NL80211_ATTR] = {
>  	[NL80211_ATTR_PEER_MEASUREMENTS] =
>  		NLA_POLICY_NESTED(nl80211_pmsr_attr_policy),
>  	[NL80211_ATTR_AIRTIME_WEIGHT] = NLA_POLICY_MIN(NLA_U16, 1),
> +	[NL80211_ATTR_BSS_SHORT_PREAMBLE] = NLA_POLICY_RANGE(NLA_U8, 0, 1),
>  };
> 
Why SHORT_PREAMBLE? Why not attribute be NLA_FLAG?

-Rajkumar

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
