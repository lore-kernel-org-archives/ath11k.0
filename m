Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iKMcj-0004EL-Kc
 for ath11k@lists.infradead.org; Tue, 15 Oct 2019 13:12:27 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH V2] ath11k: optimize RX path latency
References: <20191004100429.24565-1-john@phrozen.org>
Date: Tue, 15 Oct 2019 16:12:21 +0300
In-Reply-To: <20191004100429.24565-1-john@phrozen.org> (John Crispin's message
 of "Fri, 4 Oct 2019 12:04:29 +0200")
Message-ID: <87a7a2xidm.fsf@kamboji.qca.qualcomm.com>
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

> This patch drops ath11k_hal_rx_parse_dst_ring_desc(). This function was
> creating a huge amount of load, which lead to a signifcant latency delay
> when processing data in the RX path.
>
> Pegging the processing on a specific core and running perf --top we get
> the following output when running HE80 at a fixed bandwidth of 1gbit.
>
> with patch
>     19.19%  [ath11k]       [k] ath11k_dp_process_rx
>      5.02%  [ath11k]       [k] ath11k_dp_rx_tid_del_func
>      4.39%  [kernel]       [k] v7_dma_inv_range
>      4.15%  [kernel]       [k] __slab_alloc.constprop.1
>      4.03%  [kernel]       [k] dev_gro_receive
>      3.86%  [kernel]       [k] tcp_gro_receive
>      3.07%  [ip_tables]    [k] ipt_do_table
>      2.96%  [kernel]       [k] dma_cache_maint_page
>
> without patch
>     21.64%  [ath11k]       [k] ath11k_hal_rx_parse_dst_ring_desc
>     10.80%  [ath11k]       [k] ath11k_dp_process_rx
>      3.77%  [kernel]       [k] v7_dma_inv_range
>      3.48%  [kernel]       [k] dev_gro_receive
>      3.32%  [ath11k]       [k] ath11k_dp_rx_tid_del_func
>      3.17%  [mac80211]     [k] ieee80211_rx_napi
>      2.70%  [kernel]       [k] dma_cache_maint_page
>      2.65%  [mac80211]     [k] ieee80211_sta_ps_transition
>
> When removing the the bandwidth limit and rerunning the test we see an
> overall throughput improvement of 3-400mbit when running 4x4 HE80.
>
> Signed-off-by: Shashidhar Lakkavalli <slakkavalli@datto.com>
> Signed-off-by: John Crispin <john@phrozen.org>

A great finding! Amazing how this small patch can make such a big
difference, this has to be a some kind of record :)

> @@ -2192,9 +2196,12 @@ int ath11k_dp_process_rx(struct ath11k_base *ab, int mac_id,
>  			continue;
>  		}
>  
> -		rxcb->is_first_msdu = meta_info.msdu_meta.first;
> -		rxcb->is_last_msdu = meta_info.msdu_meta.last;
> -		rxcb->is_continuation = meta_info.msdu_meta.continuation;
> +		rxcb->is_first_msdu =
> +			!!(desc->rx_msdu_info.info0 & RX_MSDU_DESC_INFO0_FIRST_MSDU_IN_MPDU);
> +		rxcb->is_last_msdu =
> +			!!(desc->rx_msdu_info.info0 & RX_MSDU_DESC_INFO0_LAST_MSDU_IN_MPDU);
> +		rxcb->is_continuation =
> +			!!(desc->rx_msdu_info.info0 & RX_MSDU_DESC_INFO0_MSDU_CONTINUATION);

Checkpatch warned about this:

drivers/net/wireless/ath/ath11k/dp_rx.c:2200: line over 90 characters
drivers/net/wireless/ath/ath11k/dp_rx.c:2202: line over 90 characters
drivers/net/wireless/ath/ath11k/dp_rx.c:2204: line over 90 characters

So I reformatted the lines a bit, please check my changes:

https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=pending-ath11k&id=4dc613aeef4243ee4053972656f6932b5f6a614c

-- 
https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
