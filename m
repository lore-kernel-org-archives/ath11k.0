Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hQBut-0000PF-G1
 for ath11k@lists.infradead.org; Mon, 13 May 2019 14:27:00 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH V4 1/5] ath11k: move phymode selection from function to
 array lookup
References: <20190509201550.3977-1-john@phrozen.org>
 <20190509201550.3977-2-john@phrozen.org>
Date: Mon, 13 May 2019 17:26:54 +0300
In-Reply-To: <20190509201550.3977-2-john@phrozen.org> (John Crispin's message
 of "Thu, 9 May 2019 22:15:46 +0200")
Message-ID: <87tvdyig5t.fsf@kamboji.qca.qualcomm.com>
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

> With HE support getting added, the approach of using functions will quickly
> get convoluted. Change the code to use an array lookup function instead.
>
> Signed-off-by: Shashidhar Lakkavalli <slakkavalli@datto.com>
> Signed-off-by: John Crispin <john@phrozen.org>
> ---
>  drivers/net/wireless/ath/ath11k/mac.c | 116 +++++++++++++++-------------------
>  include/uapi/linux/nl80211.h          |   4 ++
>  2 files changed, 56 insertions(+), 64 deletions(-)
>
> diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
> index 94a87d0fb08e..cd7fb9a13639 100644
> --- a/drivers/net/wireless/ath/ath11k/mac.c
> +++ b/drivers/net/wireless/ath/ath11k/mac.c
> @@ -105,6 +105,51 @@ static struct ieee80211_rate ath11k_legacy_rates[] = {
>  	{ .bitrate = 540, .hw_value = ATH11K_HW_RATE_OFDM_54M },
>  };
>  
> +static int ath11k_phymodes[NUM_NL80211_BANDS][2][__NL80211_CHAN_WIDTH_NUM] = {

static const?

> @@ -3889,7 +3872,12 @@ ath11k_mac_vdev_start_restart(struct ath11k_vif *arvif,
>  	arg.channel.freq = chandef->chan->center_freq;
>  	arg.channel.band_center_freq1 = chandef->center_freq1;
>  	arg.channel.band_center_freq2 = chandef->center_freq2;
> -	arg.channel.mode = chan_to_phymode(chandef);
> +	arg.channel.mode =
> +		ath11k_phymodes[chandef->chan->band][he_support][chandef->width];
> +	if (arg.channel.mode == MODE_11G &&
> +	    chandef->chan->flags & IEEE80211_CHAN_NO_OFDM)
> +		arg.channel.mode = MODE_11B;
> +	WARN_ON(arg.channel.mode == MODE_UNKNOWN);

What happens when mode is MODE_UNKNOWN? Should we assign some default
value after the warning message?

-- 
Kalle Valo

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
