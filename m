Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail26.static.mailgun.info ([104.130.122.26])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jVkey-0000mK-Pd
 for ath11k@lists.infradead.org; Mon, 04 May 2020 23:38:11 +0000
MIME-Version: 1.0
Date: Mon, 04 May 2020 16:37:41 -0700
From: Rajkumar Manoharan <rmanohar@codeaurora.org>
Subject: Re: [PATCH 2/2] ath11k: use cumulative survey statistics
In-Reply-To: <20200504154122.91862-2-markus.theil@tu-ilmenau.de>
References: <20200504154122.91862-1-markus.theil@tu-ilmenau.de>
 <20200504154122.91862-2-markus.theil@tu-ilmenau.de>
Message-ID: <85fa2d5f9183b3a12c5283b800f3750f@codeaurora.org>
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
To: Markus Theil <markus.theil@tu-ilmenau.de>
Cc: linux-wireless-owner@vger.kernel.org, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, kvalo@codeaurora.org, ath11k@lists.infradead.org

On 2020-05-04 08:41, Markus Theil wrote:
> ath11k currently reports survey results for the last interval between 
> each
> invocation of NL80211_CMD_GET_SURVEY. For concurrent invocations, this
> can lead to unexpectedly small results, e.g. when hostapd uses survey
> data and iw survey dump is invoked in parallel. Fix this by returning
> cumulative results, that don't depend on the last invocation. Other
> drivers, e.g. ath9k or mt76 also use this behavior.
> 
> Signed-off-by: Markus Theil <markus.theil@tu-ilmenau.de>
> ---
>  drivers/net/wireless/ath/ath11k/wmi.c | 20 ++++++++++----------
>  1 file changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath11k/wmi.c
> b/drivers/net/wireless/ath/ath11k/wmi.c
> index c2a972377687..322ddfda5bfd 100644
> --- a/drivers/net/wireless/ath/ath11k/wmi.c
> +++ b/drivers/net/wireless/ath/ath11k/wmi.c
> @@ -5610,16 +5610,16 @@ ath11k_pdev_bss_chan_info_event(struct
> ath11k_base *ab, struct sk_buff *skb)
> 
>  	survey = &ar->survey[idx];
> 
> -	survey->noise     = bss_ch_info_ev.noise_floor;
> -	survey->time      = div_u64(total, cc_freq_hz);
> -	survey->time_busy = div_u64(busy, cc_freq_hz);
> -	survey->time_rx   = div_u64(rx_bss, cc_freq_hz);
> -	survey->time_tx   = div_u64(tx, cc_freq_hz);
> -	survey->filled   |= (SURVEY_INFO_NOISE_DBM |
> -			     SURVEY_INFO_TIME |
> -			     SURVEY_INFO_TIME_BUSY |
> -			     SURVEY_INFO_TIME_RX |
> -			     SURVEY_INFO_TIME_TX);
> +	survey->noise      = bss_ch_info_ev.noise_floor;
> +	survey->time      += div_u64(total, cc_freq_hz);
> +	survey->time_busy += div_u64(busy, cc_freq_hz);
> +	survey->time_rx   += div_u64(rx_bss, cc_freq_hz);
> +	survey->time_tx   += div_u64(tx, cc_freq_hz);
> +	survey->filled    |= (SURVEY_INFO_NOISE_DBM |
> +			      SURVEY_INFO_TIME |
> +			      SURVEY_INFO_TIME_BUSY |
> +			      SURVEY_INFO_TIME_RX |
> +			      SURVEY_INFO_TIME_TX);

Markus,

It depends on type of survey request is given to firmware. In ath11k, 
firmware reports
accumulated values. So the above addition is wrong and report double 
value. Have you
tested this change?

-Rajkumar

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
