Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hdxyi-0003Rr-Fb
 for ath11k@lists.infradead.org; Thu, 20 Jun 2019 14:23:53 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH] ath11k: fetch and report DCM and RU stats from ppdu stats
References: <1560872506-21217-1-git-send-email-pradeepc@codeaurora.org>
Date: Thu, 20 Jun 2019 17:23:48 +0300
In-Reply-To: <1560872506-21217-1-git-send-email-pradeepc@codeaurora.org>
 (Pradeep Kumar Chitrapu's message of "Tue, 18 Jun 2019 21:11:46
 +0530")
Message-ID: <878stw49or.fsf@kamboji.qca.qualcomm.com>
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
To: Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>
Cc: ath11k@lists.infradead.org

Pradeep Kumar Chitrapu <pradeepc@codeaurora.org> writes:

> HE DCM and RU allocation info is reported out of bound data path
> by firmware in ppdu stats. These are reported to mac80211 using
> sta_statistics() api.
>
> Signed-off-by: Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>

[...]

> --- a/drivers/net/wireless/ath/ath11k/dp_rx.c
> +++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
> @@ -1093,7 +1093,7 @@ static u32 ath11k_bw_to_mac80211_bwflags(u8 bw)
>  	struct ieee80211_chanctx_conf *conf = NULL;
>  	struct ath11k_per_peer_tx_stats *peer_stats = &ar->peer_tx_stats;
>  	int ret;
> -	u8 flags, mcs, nss, bw, sgi, rate_idx = 0;
> +	u8 flags, mcs, nss, bw, sgi, dcm, rate_idx = 0;
>  	u32 succ_bytes = 0;
>  	u16 rate = 0, succ_pkts = 0;
>  	bool is_ampdu = false;
> @@ -1127,12 +1127,17 @@ static u32 ath11k_bw_to_mac80211_bwflags(u8 bw)
>  	 * Firmare rate's control to be skipped for this?
>           */
>  
> -	if (flags == WMI_RATE_PREAMBLE_VHT && mcs > 9) {
> +	if (flags == WMI_RATE_PREAMBLE_HE && mcs > ATH11K_HE_MCS_MAX) {
> +		ath11k_warn(ab, "Invalid HE mcs %hhd peer stats",  mcs);
> +		return;
> +	}
> +
> +	if (flags == WMI_RATE_PREAMBLE_VHT && mcs > ATH11K_VHT_MCS_MAX) {
>  		ath11k_warn(ab, "Invalid VHT mcs %hhd peer stats",  mcs);
>  		return;
>  	}
>  
> -	if (flags == WMI_RATE_PREAMBLE_HT && (mcs > 7 || nss < 1)) {
> +	if (flags == WMI_RATE_PREAMBLE_HT && (mcs > ATH11K_HT_MCS_MAX || nss < 1)) {
>  		ath11k_warn(ab, "Invalid HT mcs %hhd nss %hhd peer stats",
>  			    mcs, nss);
>  		return;
> @@ -1201,6 +1206,12 @@ static u32 ath11k_bw_to_mac80211_bwflags(u8 bw)
>  						IEEE80211_TX_RC_SHORT_GI;
>  		}
>  		break;
> +	case WMI_RATE_PREAMBLE_HE:
> +		arsta->txrate.he_dcm = dcm;

This causes a new warning:

drivers/net/wireless/ath/ath11k/dp_rx.c:1159:24: warning: 'dcm' may be used uninitialized in this function [-Wmaybe-uninitialized]

Looks valid warning to me. How is this supposed to work, I don't see you
assigning to dcm anywhere?

-- 
Kalle Valo

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
