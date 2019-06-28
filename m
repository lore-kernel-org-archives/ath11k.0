Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hgowK-0001jc-Qd
 for ath11k@lists.infradead.org; Fri, 28 Jun 2019 11:21:14 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [RFC 2/2] ath11k: drop memset in tx status hotpath
References: <20190628101127.6044-1-john@phrozen.org>
 <20190628101127.6044-2-john@phrozen.org>
Date: Fri, 28 Jun 2019 14:21:07 +0300
In-Reply-To: <20190628101127.6044-2-john@phrozen.org> (John Crispin's message
 of "Fri, 28 Jun 2019 12:11:27 +0200")
Message-ID: <87sgruez18.fsf@kamboji.qca.qualcomm.com>
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
Cc: ath11k@lists.infradead.org, Rajkumar Manoharan <rmanohar@qti.qualcomm.com>

John Crispin <john@phrozen.org> writes:

> This in a small but measurable performance increase.
>
> Signed-off-by: John Crispin <john@phrozen.org>
> ---
>  drivers/net/wireless/ath/ath11k/dp_tx.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/net/wireless/ath/ath11k/dp_tx.c b/drivers/net/wireless/ath/ath11k/dp_tx.c
> index b3d5995fc657..8c5db3c88a87 100644
> --- a/drivers/net/wireless/ath/ath11k/dp_tx.c
> +++ b/drivers/net/wireless/ath/ath11k/dp_tx.c
> @@ -448,7 +448,6 @@ void ath11k_dp_tx_completion_handler(struct ath11k_base *ab, int ring_id)
>  	int hal_ring_id = dp->tx_ring[ring_id].tcl_comp_ring.ring_id;
>  	struct hal_srng *status_ring = &ab->hal.srng_list[hal_ring_id];
>  	struct sk_buff *msdu;
> -	struct hal_tx_status ts;
>  	struct dp_tx_ring *tx_ring = &dp->tx_ring[ring_id];
>  	u32 msdu_id;
>  	u32 *desc;
> @@ -459,7 +458,8 @@ void ath11k_dp_tx_completion_handler(struct ath11k_base *ab, int ring_id)
>  	ath11k_hal_srng_access_begin(ab, status_ring);
>  
>  	while ((desc = ath11k_hal_srng_dst_get_next_entry(ab, status_ring))) {
> -		memset(&ts, 0, sizeof(ts));
> +		struct hal_tx_status ts = { 0 };

Very interesting, so a compiler zeroes memory from stack faster than
memset() from "heap" (or whatever kmalloced memory should be called)?
Just out of curiosity, any ideas why memset() is so slow?

Also some kind of numbers (before and after) would be nice to have in
the commit log. It's not uncommon that years after we investigate why a
certain change was made.

-- 
Kalle Valo

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
