Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hQBwa-0000WI-N9
 for ath11k@lists.infradead.org; Mon, 13 May 2019 14:28:46 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH V4 4/5] ath11k: handle rx status for HE frames
References: <20190509201550.3977-1-john@phrozen.org>
 <20190509201550.3977-5-john@phrozen.org>
Date: Mon, 13 May 2019 17:28:40 +0300
In-Reply-To: <20190509201550.3977-5-john@phrozen.org> (John Crispin's message
 of "Thu, 9 May 2019 22:15:49 +0200")
Message-ID: <87pnomig2v.fsf@kamboji.qca.qualcomm.com>
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
Cc: ath11k@lists.infradead.org, Shashidhar Lakkavalli <slakkavalli@datto.com>

John Crispin <john@phrozen.org> writes:

> The case clause handling HE frames was not handled yet in the code reading
> the RX status. The new case is identical to VHT with the difference of the
> higher maximum MCS rate.
>
> Signed-off-by: Shashidhar Lakkavalli <slakkavalli@datto.com>
> Signed-off-by: John Crispin <john@phrozen.org>
> ---
>  drivers/net/wireless/ath/ath11k/dp_rx.c | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
> index c8fa2681ddb0..82cb3f84df32 100644
> --- a/drivers/net/wireless/ath/ath11k/dp_rx.c
> +++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
> @@ -1718,7 +1718,18 @@ static void ath11k_dp_rx_h_rate(struct ath11k *ar, void *rx_desc,
>  		rx_status->bw = ath11k_bw_to_mac80211_bw(bw);
>  		break;
>  	case RX_MSDU_START_PKT_TYPE_11AX:
> -		ath11k_warn(ar->ab, "pkt_type %d not yet supported\n", pkt_type);
> +		rx_status->rate_idx = rate_mcs;
> +		if (rate_mcs > 11) {

A define would be nice, ATH11K_MCS_MAX or something like that.

-- 
Kalle Valo

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
