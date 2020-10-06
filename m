Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from z5.mailgun.us ([104.130.96.5])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kPhNb-0007Rc-1g
 for ath11k@lists.infradead.org; Tue, 06 Oct 2020 07:27:26 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH 2/2] ath11k: Handle errors if peer creation fails
References: <20201004100218.311653-1-alex.dewar90@gmail.com>
Date: Tue, 06 Oct 2020 10:26:28 +0300
In-Reply-To: <20201004100218.311653-1-alex.dewar90@gmail.com> (Alex Dewar's
 message of "Sun, 4 Oct 2020 11:02:17 +0100")
Message-ID: <87blhfbysb.fsf@codeaurora.org>
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
To: Alex Dewar <alex.dewar90@gmail.com>
Cc: netdev@vger.kernel.org, Carl Huang <cjhuang@codeaurora.org>, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath11k@lists.infradead.org, Jakub Kicinski <kuba@kernel.org>, "David S. Miller" <davem@davemloft.net>

Alex Dewar <alex.dewar90@gmail.com> writes:

> ath11k_peer_create() is called without its return value being checked,
> meaning errors will be unhandled. Add missing check and, as the mutex is
> unconditionally unlocked on leaving this function, simplify the exit
> path.
>
> Addresses-Coverity-ID: 1497531 ("Code maintainability issues")
> Fixes: 701e48a43e15 ("ath11k: add packet log support for QCA6390")
> Signed-off-by: Alex Dewar <alex.dewar90@gmail.com>
> ---
>  drivers/net/wireless/ath/ath11k/mac.c | 21 +++++++++------------
>  1 file changed, 9 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
> index 7f8dd47d2333..58db1b57b941 100644
> --- a/drivers/net/wireless/ath/ath11k/mac.c
> +++ b/drivers/net/wireless/ath/ath11k/mac.c
> @@ -5211,7 +5211,7 @@ ath11k_mac_op_assign_vif_chanctx(struct ieee80211_hw *hw,
>  	struct ath11k *ar = hw->priv;
>  	struct ath11k_base *ab = ar->ab;
>  	struct ath11k_vif *arvif = (void *)vif->drv_priv;
> -	int ret;
> +	int ret = 0;

I prefer not to initialise the ret variable.

>  	arvif->is_started = true;
>  
>  	/* TODO: Setup ps and cts/rts protection */
>  
> -	mutex_unlock(&ar->conf_mutex);
> -
> -	return 0;
> -
> -err:
> +unlock:
>  	mutex_unlock(&ar->conf_mutex);
>  
>  	return ret;

So in the pending branch I changed this to:

	ret = 0;

out:
	mutex_unlock(&ar->conf_mutex);

	return ret;

Please check.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
