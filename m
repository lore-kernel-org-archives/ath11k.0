Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hgojM-0004G5-GO
 for ath11k@lists.infradead.org; Fri, 28 Jun 2019 11:07:50 +0000
MIME-Version: 1.0
Date: Fri, 28 Jun 2019 16:37:46 +0530
From: Vasanthakumar Thiagarajan <vthiagar@codeaurora.org>
Subject: Re: [RFC 1/2] ath11k: drop tx_status_fifo
In-Reply-To: <20190628101127.6044-1-john@phrozen.org>
References: <20190628101127.6044-1-john@phrozen.org>
Message-ID: <cbda7f0e8a9da4336002d40fbbeefc21@codeaurora.org>
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
Cc: ath11k@lists.infradead.org, Kalle Valo <kvalo@codeaurora.org>, Rajkumar Manoharan <rmanohar@qti.qualcomm.com>

On 2019-06-28 15:41, John Crispin wrote:
> perf top showed that 10% of the cpu time was spent on the memcpy used 
> to
> populate the fifo when the device is under high load. There is no 
> apparent
> benefit from using a fifo so lets just drop it.
> 
> Signed-off-by: John Crispin <john@phrozen.org>
> ---
>  drivers/net/wireless/ath/ath11k/dp.c     | 13 ---------
>  drivers/net/wireless/ath/ath11k/dp.h     |  5 ----
>  drivers/net/wireless/ath/ath11k/dp_tx.c  | 37 +++++-------------------
>  drivers/net/wireless/ath/ath11k/hal_tx.c |  5 ----
>  drivers/net/wireless/ath/ath11k/hal_tx.h |  1 -
>  5 files changed, 8 insertions(+), 53 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath11k/dp.c
> b/drivers/net/wireless/ath/ath11k/dp.c
> index 3f5174a0c622..7e0a67d9e5c1 100644
> --- a/drivers/net/wireless/ath/ath11k/dp.c
> +++ b/drivers/net/wireless/ath/ath11k/dp.c
> @@ -839,10 +839,6 @@ void ath11k_dp_free(struct ath11k_base *sc)
>  			     ath11k_dp_tx_pending_cleanup, sc);
>  		idr_destroy(&dp->tx_ring[i].txbuf_idr);
>  		spin_unlock_bh(&dp->tx_ring[i].tx_idr_lock);
> -
> -		spin_lock_bh(&dp->tx_ring[i].tx_status_lock);
> -		kfifo_free(&dp->tx_ring[i].tx_status_fifo);
> -		spin_unlock_bh(&dp->tx_ring[i].tx_status_lock);
>  	}
> 
>  	/* Deinit any SOC level resource */
> @@ -888,12 +884,6 @@ int ath11k_dp_alloc(struct ath11k_base *sc)
>  		idr_init(&dp->tx_ring[i].txbuf_idr);
>  		spin_lock_init(&dp->tx_ring[i].tx_idr_lock);
>  		dp->tx_ring[i].tcl_data_ring_id = i;
> -
> -		spin_lock_init(&dp->tx_ring[i].tx_status_lock);
> -		ret = kfifo_alloc(&dp->tx_ring[i].tx_status_fifo, size,
> -				  GFP_KERNEL);
> -		if (ret)
> -			goto fail_cmn_srng_cleanup;
>  	}
> 
>  	for (i = 0; i < HAL_DSCP_TID_MAP_TBL_NUM_ENTRIES_MAX; i++)
> @@ -903,9 +893,6 @@ int ath11k_dp_alloc(struct ath11k_base *sc)
> 
>  	return 0;
> 
> -fail_cmn_srng_cleanup:
> -	ath11k_dp_srng_common_cleanup(sc);
> -
>  fail_link_desc_cleanup:
>  	ath11k_dp_link_desc_cleanup(sc, dp->link_desc_banks,
>  				    HAL_WBM_IDLE_LINK, &dp->wbm_idle_ring);
> diff --git a/drivers/net/wireless/ath/ath11k/dp.h
> b/drivers/net/wireless/ath/ath11k/dp.h
> index e09065690481..b654277cb68d 100644
> --- a/drivers/net/wireless/ath/ath11k/dp.h
> +++ b/drivers/net/wireless/ath/ath11k/dp.h
> @@ -66,11 +66,6 @@ struct dp_tx_ring {
>  	u32 num_tx_pending;
>  	/* Protects txbuf_idr and num_pending */
>  	spinlock_t tx_idr_lock;
> -	DECLARE_KFIFO_PTR(tx_status_fifo, struct hal_wbm_release_ring);
> -	/* lock to protect tx_status_fifo because tx_status_fifo can be
> -	 * accessed concurrently.
> -	 */
> -	spinlock_t tx_status_lock;
>  };
> 
>  struct ath11k_pdev_mon_stats {
> diff --git a/drivers/net/wireless/ath/ath11k/dp_tx.c
> b/drivers/net/wireless/ath/ath11k/dp_tx.c
> index e7229f6289c1..b3d5995fc657 100644
> --- a/drivers/net/wireless/ath/ath11k/dp_tx.c
> +++ b/drivers/net/wireless/ath/ath11k/dp_tx.c
> @@ -448,47 +448,28 @@ void ath11k_dp_tx_completion_handler(struct
> ath11k_base *ab, int ring_id)
>  	int hal_ring_id = dp->tx_ring[ring_id].tcl_comp_ring.ring_id;
>  	struct hal_srng *status_ring = &ab->hal.srng_list[hal_ring_id];
>  	struct sk_buff *msdu;
> -	struct hal_wbm_release_ring tx_status;
>  	struct hal_tx_status ts;
>  	struct dp_tx_ring *tx_ring = &dp->tx_ring[ring_id];
> -	u32 *desc;
>  	u32 msdu_id;
> +	u32 *desc;
>  	u8 mac_id;
> 
>  	spin_lock_bh(&status_ring->lock);
> 
>  	ath11k_hal_srng_access_begin(ab, status_ring);
> 
> -	spin_lock_bh(&tx_ring->tx_status_lock);
> -	while (!kfifo_is_full(&tx_ring->tx_status_fifo) &&
> -	       (desc = ath11k_hal_srng_dst_get_next_entry(ab, status_ring))) 
> {
> -		ath11k_hal_tx_status_desc_sync((void *)desc,
> -					       (void *)&tx_status);
> -		kfifo_put(&tx_ring->tx_status_fifo, tx_status);
> -	}
> -
> -	if ((ath11k_hal_srng_dst_peek(ab, status_ring) != NULL) &&
> -	    kfifo_is_full(&tx_ring->tx_status_fifo)) {
> -		/* TODO: Process pending tx_status messages when kfifo_is_full() */
> -		ath11k_warn(ab, "Unable to process some of the tx_status ring desc
> because status_fifo is full\n");
> -	}
> -
> -	spin_unlock_bh(&tx_ring->tx_status_lock);
> -
> -	ath11k_hal_srng_access_end(ab, status_ring);
> -	spin_unlock_bh(&status_ring->lock);
> -
> -	spin_lock_bh(&tx_ring->tx_status_lock);
> -	while (kfifo_get(&tx_ring->tx_status_fifo, &tx_status)) {
> +	while ((desc = ath11k_hal_srng_dst_get_next_entry(ab, status_ring))) 
> {
>  		memset(&ts, 0, sizeof(ts));
> -		ath11k_hal_tx_status_parse(ab, &tx_status, &ts);
> +		ath11k_hal_tx_status_parse(ab,
> +					   (struct hal_wbm_release_ring *)desc,
> +					   &ts);
> 
>  		mac_id = FIELD_GET(DP_TX_DESC_ID_MAC_ID, ts.desc_id);
>  		msdu_id = FIELD_GET(DP_TX_DESC_ID_MSDU_ID, ts.desc_id);
> 
>  		if (ts.buf_rel_source == HAL_WBM_REL_SRC_MODULE_FW) {
>  			ath11k_dp_tx_process_htt_tx_complete(ab,
> -							     (void *)&tx_status,
> +							     (void *)desc,
>  							     mac_id, msdu_id,
>  							     tx_ring);

Delay in reaping tx completion desc from hw ring could trigger 
backpressure on tx completion ring which could result
in target assert. Extensive testing with this change is required to make 
sure this change does not cause any issue.

Vasanth

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
