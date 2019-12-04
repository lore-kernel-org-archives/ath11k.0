Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from a27-10.smtp-out.us-west-2.amazonses.com ([54.240.27.10])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1icNjr-0004vz-MH
 for ath11k@lists.infradead.org; Wed, 04 Dec 2019 06:02:16 +0000
MIME-Version: 1.0
Date: Wed, 4 Dec 2019 06:02:12 +0000
From: vthiagar@codeaurora.org
Subject: Re: [RESEND 9/9] ath11k: optimize ath11k_hal_tx_status_parse
In-Reply-To: <20191204053713.3064-10-john@phrozen.org>
References: <20191204053713.3064-1-john@phrozen.org>
 <20191204053713.3064-10-john@phrozen.org>
Message-ID: <0101016ecf8075de-f0ce1178-d1b9-49f5-9e5c-c9e9a0bc2558-000000@us-west-2.amazonses.com>
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
Cc: linux-wireless-owner@vger.kernel.org, linux-wireless@vger.kernel.org, ath11k@lists.infradead.org, Kalle Valo <kvalo@codeaurora.org>

On 2019-12-04 11:07, John Crispin wrote:
> Moving the function into dp_tx.c allows gcc to optimize the code better
> and also avoid chace invalidates and context switches.
> 
> Signed-off-by: John Crispin <john@phrozen.org>
> ---
>  drivers/net/wireless/ath/ath11k/dp.h     |  2 +-
>  drivers/net/wireless/ath/ath11k/dp_tx.c  | 38 +++++++++++++++++++--
>  drivers/net/wireless/ath/ath11k/hal_tx.c | 43 ------------------------
>  drivers/net/wireless/ath/ath11k/hal_tx.h |  4 ---
>  4 files changed, 37 insertions(+), 50 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath11k/dp.h
> b/drivers/net/wireless/ath/ath11k/dp.h
> index d4011f902930..2f0980f2c762 100644
> --- a/drivers/net/wireless/ath/ath11k/dp.h
> +++ b/drivers/net/wireless/ath/ath11k/dp.h
> @@ -57,7 +57,7 @@ struct dp_rxdma_ring {
>  	int bufs_max;
>  };
> 
> -#define ATH11K_TX_COMPL_NEXT(x)	((x + 1) % DP_TX_COMP_RING_SIZE)
> +#define ATH11K_TX_COMPL_NEXT(x)	(((x) + 1) % DP_TX_COMP_RING_SIZE)
> 
>  struct dp_tx_ring {
>  	u8 tcl_data_ring_id;
> diff --git a/drivers/net/wireless/ath/ath11k/dp_tx.c
> b/drivers/net/wireless/ath/ath11k/dp_tx.c
> index 5d6403cf99ab..828f8984235e 100644
> --- a/drivers/net/wireless/ath/ath11k/dp_tx.c
> +++ b/drivers/net/wireless/ath/ath11k/dp_tx.c
> @@ -423,6 +423,37 @@ static void ath11k_dp_tx_complete_msdu(struct 
> ath11k *ar,
>  	rcu_read_unlock();
>  }
> 
> +static inline void ath11k_hal_tx_status_parse(struct ath11k_base *ab,
> +					      struct hal_wbm_release_ring *desc,
> +					      struct hal_tx_status *ts)

The function naming may need to be changed to be consistent with the 
other
functions in the file.

Vasanth

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
