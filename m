Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iKf3F-0004nU-35
 for ath11k@lists.infradead.org; Wed, 16 Oct 2019 08:53:02 +0000
MIME-Version: 1.0
Subject: Re: [PATCH V2] ath11k: optimize RX path latency
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20191004100429.24565-1-john@phrozen.org>
References: <20191004100429.24565-1-john@phrozen.org>
Message-Id: <20191016085300.C315B60540@smtp.codeaurora.org>
Date: Wed, 16 Oct 2019 08:53:00 +0000 (UTC)
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

John Crispin <john@phrozen.org> wrote:

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
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath11k-post-bringup branch of ath.git, thanks.

fab0afe3c8a0 ath11k: optimize RX path latency

-- 
https://patchwork.kernel.org/patch/11174011/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
