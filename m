Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail27.static.mailgun.info ([104.130.122.27])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j9kGc-0006GR-Hb
 for ath11k@lists.infradead.org; Thu, 05 Mar 2020 06:46:03 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [ath6kl:pending 21/34]
 drivers/net/wireless/ath/ath11k/dp_rx.c:3078:5-11: WARNING: Unsigned
 expression compared with zero: buf_id < 0 (fwd)
References: <alpine.DEB.2.21.2003042103370.3192@hadrien>
Date: Thu, 05 Mar 2020 08:45:24 +0200
In-Reply-To: <alpine.DEB.2.21.2003042103370.3192@hadrien> (Julia Lawall's
 message of "Wed, 4 Mar 2020 21:04:43 +0100 (CET)")
Message-ID: <87y2sf5mgr.fsf@codeaurora.org>
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
To: Julia Lawall <julia.lawall@inria.fr>
Cc: Manikanta Pubbisetty <mpubbise@codeaurora.org>, kbuild-all@lists.01.org, ath11k@lists.infradead.org

Hi,

moving from ath10k to ath11k list, keeping intact the whole email below.
Can someone look at this, please?

Kalle

Julia Lawall <julia.lawall@inria.fr> writes:

> Hello,
>
> Please check on the use of buf_id on line 3078.  Idr_alloc returns an int,
> not an unsigned value.
>
> julia
>
> ---------- Forwarded message ----------
> Date: Wed, 4 Mar 2020 21:19:46 +0800
> From: kbuild test robot <lkp@intel.com>
> To: kbuild@lists.01.org
> Cc: Julia Lawall <julia.lawall@lip6.fr>
> Subject: [ath6kl:pending 21/34]
>     drivers/net/wireless/ath/ath11k/dp_rx.c:3078:5-11: WARNING: Unsigned
>     expression compared with zero: buf_id < 0
>
> CC: kbuild-all@lists.01.org
> CC: Kalle Valo <kvalo@codeaurora.org>
> CC: ath10k@lists.infradead.org
> TO: Manikanta Pubbisetty <mpubbise@codeaurora.org>
> CC: Kalle Valo <kvalo@codeaurora.org>
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git pending
> head:   8098994ce0e3684547d874966af5d4c27c11f855
> commit: 481e5890884c05226b129e9cae2dca58b22c1a4f [21/34] ath11k: handle RX fragments
> :::::: branch date: 8 hours ago
> :::::: commit date: 3 weeks ago
>
> If you fix the issue, kindly add following tag
> Reported-by: kbuild test robot <lkp@intel.com>
> Reported-by: Julia Lawall <julia.lawall@lip6.fr>
>
>>> drivers/net/wireless/ath/ath11k/dp_rx.c:3078:5-11: WARNING:
> Unsigned expression compared with zero: buf_id < 0
>
> #
> https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?id=481e5890884c05226b129e9cae2dca58b22c1a4f
> git remote add ath6kl https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git
> git remote update ath6kl
> git checkout 481e5890884c05226b129e9cae2dca58b22c1a4f
> vim +3078 drivers/net/wireless/ath/ath11k/dp_rx.c
>
> 481e5890884c05 Manikanta Pubbisetty 2020-02-14  3023
> 481e5890884c05 Manikanta Pubbisetty 2020-02-14 3024 static int
> ath11k_dp_rx_h_defrag_reo_reinject(struct ath11k *ar, struct dp_rx_tid
> *rx_tid,
> 481e5890884c05 Manikanta Pubbisetty 2020-02-14 3025 struct sk_buff
> *defrag_skb)
> 481e5890884c05 Manikanta Pubbisetty 2020-02-14  3026  {
> 481e5890884c05 Manikanta Pubbisetty 2020-02-14  3027  	struct ath11k_base *ab = ar->ab;
> 481e5890884c05 Manikanta Pubbisetty 2020-02-14  3028  	struct ath11k_pdev_dp *dp = &ar->dp;
> 481e5890884c05 Manikanta Pubbisetty 2020-02-14 3029 struct
> dp_rxdma_ring *rx_refill_ring = &dp->rx_refill_buf_ring;
> 481e5890884c05 Manikanta Pubbisetty 2020-02-14 3030 struct hal_rx_desc
> *rx_desc = (struct hal_rx_desc *)defrag_skb->data;
> 481e5890884c05 Manikanta Pubbisetty 2020-02-14 3031 struct
> hal_reo_entrance_ring *reo_ent_ring;
> 481e5890884c05 Manikanta Pubbisetty 2020-02-14 3032 struct
> hal_reo_dest_ring *reo_dest_ring;
> 481e5890884c05 Manikanta Pubbisetty 2020-02-14 3033 struct
> dp_link_desc_bank *link_desc_banks;
> 481e5890884c05 Manikanta Pubbisetty 2020-02-14  3034  	struct hal_rx_msdu_link *msdu_link;
> 481e5890884c05 Manikanta Pubbisetty 2020-02-14  3035  	struct hal_rx_msdu_details *msdu0;
> 481e5890884c05 Manikanta Pubbisetty 2020-02-14  3036  	struct hal_srng *srng;
> 481e5890884c05 Manikanta Pubbisetty 2020-02-14  3037  	dma_addr_t paddr;
> 481e5890884c05 Manikanta Pubbisetty 2020-02-14  3038  	u32 desc_bank, msdu_info, mpdu_info;
> 481e5890884c05 Manikanta Pubbisetty 2020-02-14  3039  	u32 dst_idx, buf_id, cookie;
> 481e5890884c05 Manikanta Pubbisetty 2020-02-14  3040  	u32 *msdu_len_offset;
> 481e5890884c05 Manikanta Pubbisetty 2020-02-14  3041  	int ret;
> 481e5890884c05 Manikanta Pubbisetty 2020-02-14  3042
> 481e5890884c05 Manikanta Pubbisetty 2020-02-14 3043 link_desc_banks =
> ab->dp.link_desc_banks;
> 481e5890884c05 Manikanta Pubbisetty 2020-02-14 3044 reo_dest_ring =
> rx_tid->dst_ring_desc;
> 481e5890884c05 Manikanta Pubbisetty 2020-02-14  3045
> 481e5890884c05 Manikanta Pubbisetty 2020-02-14 3046
> ath11k_hal_rx_reo_ent_paddr_get(ab, reo_dest_ring, &paddr,
> &desc_bank);
> 481e5890884c05 Manikanta Pubbisetty 2020-02-14 3047 msdu_link =
> (struct hal_rx_msdu_link *)(link_desc_banks[desc_bank].vaddr +
> 481e5890884c05 Manikanta Pubbisetty 2020-02-14 3048 (paddr -
> link_desc_banks[desc_bank].paddr));
> 481e5890884c05 Manikanta Pubbisetty 2020-02-14  3049  	msdu0 = &msdu_link->msdu_link[0];
> 481e5890884c05 Manikanta Pubbisetty 2020-02-14 3050 dst_idx =
> FIELD_GET(RX_MSDU_DESC_INFO0_REO_DEST_IND, msdu0->rx_msdu_info.info0);
> 481e5890884c05 Manikanta Pubbisetty 2020-02-14  3051  	memset(msdu0, 0, sizeof(*msdu0));
> 481e5890884c05 Manikanta Pubbisetty 2020-02-14  3052
> 481e5890884c05 Manikanta Pubbisetty 2020-02-14 3053 msdu_info =
> FIELD_PREP(RX_MSDU_DESC_INFO0_FIRST_MSDU_IN_MPDU, 1) |
> 481e5890884c05 Manikanta Pubbisetty 2020-02-14 3054
> FIELD_PREP(RX_MSDU_DESC_INFO0_LAST_MSDU_IN_MPDU, 1) |
> 481e5890884c05 Manikanta Pubbisetty 2020-02-14 3055
> FIELD_PREP(RX_MSDU_DESC_INFO0_MSDU_CONTINUATION, 0) |
> 481e5890884c05 Manikanta Pubbisetty 2020-02-14 3056
> FIELD_PREP(RX_MSDU_DESC_INFO0_MSDU_LENGTH,
> 481e5890884c05 Manikanta Pubbisetty 2020-02-14 3057 defrag_skb->len -
> HAL_RX_DESC_SIZE) |
> 481e5890884c05 Manikanta Pubbisetty 2020-02-14 3058
> FIELD_PREP(RX_MSDU_DESC_INFO0_REO_DEST_IND, dst_idx) |
> 481e5890884c05 Manikanta Pubbisetty 2020-02-14 3059
> FIELD_PREP(RX_MSDU_DESC_INFO0_VALID_SA, 1) |
> 481e5890884c05 Manikanta Pubbisetty 2020-02-14 3060
> FIELD_PREP(RX_MSDU_DESC_INFO0_VALID_DA, 1);
> 481e5890884c05 Manikanta Pubbisetty 2020-02-14 3061
> msdu0->rx_msdu_info.info0 = msdu_info;
> 481e5890884c05 Manikanta Pubbisetty 2020-02-14  3062
> 481e5890884c05 Manikanta Pubbisetty 2020-02-14  3063  	/* change msdu len in hal rx desc */
> 481e5890884c05 Manikanta Pubbisetty 2020-02-14 3064 msdu_len_offset =
> (u32 *)&rx_desc->msdu_start;
> 481e5890884c05 Manikanta Pubbisetty 2020-02-14 3065 *msdu_len_offset
> &= ~(RX_MSDU_START_INFO1_MSDU_LENGTH);
> 481e5890884c05 Manikanta Pubbisetty 2020-02-14 3066 *msdu_len_offset
> |= defrag_skb->len - HAL_RX_DESC_SIZE;
> 481e5890884c05 Manikanta Pubbisetty 2020-02-14  3067
> 481e5890884c05 Manikanta Pubbisetty 2020-02-14 3068 paddr =
> dma_map_single(ab->dev, defrag_skb->data,
> 481e5890884c05 Manikanta Pubbisetty 2020-02-14 3069 defrag_skb->len +
> skb_tailroom(defrag_skb),
> 481e5890884c05 Manikanta Pubbisetty 2020-02-14 3070 DMA_FROM_DEVICE);
> 481e5890884c05 Manikanta Pubbisetty 2020-02-14 3071 if
> (dma_mapping_error(ab->dev, paddr))
> 481e5890884c05 Manikanta Pubbisetty 2020-02-14  3072  		return -ENOMEM;
> 481e5890884c05 Manikanta Pubbisetty 2020-02-14  3073
> 481e5890884c05 Manikanta Pubbisetty 2020-02-14 3074
> spin_lock_bh(&rx_refill_ring->idr_lock);
> 481e5890884c05 Manikanta Pubbisetty 2020-02-14 3075 buf_id =
> idr_alloc(&rx_refill_ring->bufs_idr, defrag_skb, 0,
> 481e5890884c05 Manikanta Pubbisetty 2020-02-14 3076
> rx_refill_ring->bufs_max * 3, GFP_ATOMIC);
> 481e5890884c05 Manikanta Pubbisetty 2020-02-14 3077
> spin_unlock_bh(&rx_refill_ring->idr_lock);
> 481e5890884c05 Manikanta Pubbisetty 2020-02-14 @3078  	if (buf_id < 0) {
> 481e5890884c05 Manikanta Pubbisetty 2020-02-14  3079  		ret = -ENOMEM;
> 481e5890884c05 Manikanta Pubbisetty 2020-02-14  3080  		goto err_unmap_dma;
> 481e5890884c05 Manikanta Pubbisetty 2020-02-14  3081  	}
> 481e5890884c05 Manikanta Pubbisetty 2020-02-14  3082
> 481e5890884c05 Manikanta Pubbisetty 2020-02-14 3083
> ATH11K_SKB_RXCB(defrag_skb)->paddr = paddr;
> 481e5890884c05 Manikanta Pubbisetty 2020-02-14 3084 cookie =
> FIELD_PREP(DP_RXDMA_BUF_COOKIE_PDEV_ID, dp->mac_id) |
> 481e5890884c05 Manikanta Pubbisetty 2020-02-14 3085
> FIELD_PREP(DP_RXDMA_BUF_COOKIE_BUF_ID, buf_id);
> 481e5890884c05 Manikanta Pubbisetty 2020-02-14  3086
> 481e5890884c05 Manikanta Pubbisetty 2020-02-14 3087
> ath11k_hal_rx_buf_addr_info_set(msdu0, paddr, cookie,
> HAL_RX_BUF_RBM_SW3_BM);
> 481e5890884c05 Manikanta Pubbisetty 2020-02-14  3088
> 481e5890884c05 Manikanta Pubbisetty 2020-02-14 3089 /* Fill mpdu
> details into reo entrace ring */
> 481e5890884c05 Manikanta Pubbisetty 2020-02-14 3090 srng =
> &ab->hal.srng_list[ab->dp.reo_reinject_ring.ring_id];
> 481e5890884c05 Manikanta Pubbisetty 2020-02-14  3091
> 481e5890884c05 Manikanta Pubbisetty 2020-02-14  3092  	spin_lock_bh(&srng->lock);
> 481e5890884c05 Manikanta Pubbisetty 2020-02-14 3093
> ath11k_hal_srng_access_begin(ab, srng);
> 481e5890884c05 Manikanta Pubbisetty 2020-02-14  3094
> 481e5890884c05 Manikanta Pubbisetty 2020-02-14 3095 reo_ent_ring =
> (struct hal_reo_entrance_ring *)
> 481e5890884c05 Manikanta Pubbisetty 2020-02-14 3096
> ath11k_hal_srng_src_get_next_entry(ab, srng);
> 481e5890884c05 Manikanta Pubbisetty 2020-02-14  3097  	if (!reo_ent_ring) {
> 481e5890884c05 Manikanta Pubbisetty 2020-02-14 3098
> ath11k_hal_srng_access_end(ab, srng);
> 481e5890884c05 Manikanta Pubbisetty 2020-02-14  3099  		spin_unlock_bh(&srng->lock);
> 481e5890884c05 Manikanta Pubbisetty 2020-02-14  3100  		ret = -ENOSPC;
> 481e5890884c05 Manikanta Pubbisetty 2020-02-14  3101  		goto err_free_idr;
> 481e5890884c05 Manikanta Pubbisetty 2020-02-14  3102  	}
> 481e5890884c05 Manikanta Pubbisetty 2020-02-14 3103
> memset(reo_ent_ring, 0, sizeof(*reo_ent_ring));
> 481e5890884c05 Manikanta Pubbisetty 2020-02-14  3104
> 481e5890884c05 Manikanta Pubbisetty 2020-02-14 3105
> ath11k_hal_rx_reo_ent_paddr_get(ab, reo_dest_ring, &paddr,
> &desc_bank);
> 481e5890884c05 Manikanta Pubbisetty 2020-02-14 3106
> ath11k_hal_rx_buf_addr_info_set(reo_ent_ring, paddr, desc_bank,
> 481e5890884c05 Manikanta Pubbisetty 2020-02-14 3107
> HAL_RX_BUF_RBM_WBM_IDLE_DESC_LIST);
> 481e5890884c05 Manikanta Pubbisetty 2020-02-14  3108
> 481e5890884c05 Manikanta Pubbisetty 2020-02-14 3109 mpdu_info =
> FIELD_PREP(RX_MPDU_DESC_INFO0_MSDU_COUNT, 1) |
> 481e5890884c05 Manikanta Pubbisetty 2020-02-14 3110
> FIELD_PREP(RX_MPDU_DESC_INFO0_SEQ_NUM, rx_tid->cur_sn) |
> 481e5890884c05 Manikanta Pubbisetty 2020-02-14 3111
> FIELD_PREP(RX_MPDU_DESC_INFO0_FRAG_FLAG, 0) |
> 481e5890884c05 Manikanta Pubbisetty 2020-02-14 3112
> FIELD_PREP(RX_MPDU_DESC_INFO0_VALID_SA, 1) |
> 481e5890884c05 Manikanta Pubbisetty 2020-02-14 3113
> FIELD_PREP(RX_MPDU_DESC_INFO0_VALID_DA, 1) |
> 481e5890884c05 Manikanta Pubbisetty 2020-02-14 3114
> FIELD_PREP(RX_MPDU_DESC_INFO0_RAW_MPDU, 1) |
> 481e5890884c05 Manikanta Pubbisetty 2020-02-14 3115
> FIELD_PREP(RX_MPDU_DESC_INFO0_VALID_PN, 1);
> 481e5890884c05 Manikanta Pubbisetty 2020-02-14  3116
> 481e5890884c05 Manikanta Pubbisetty 2020-02-14 3117
> reo_ent_ring->rx_mpdu_info.info0 = mpdu_info;
> 481e5890884c05 Manikanta Pubbisetty 2020-02-14 3118
> reo_ent_ring->rx_mpdu_info.meta_data =
> reo_dest_ring->rx_mpdu_info.meta_data;
> 481e5890884c05 Manikanta Pubbisetty 2020-02-14 3119
> reo_ent_ring->queue_addr_lo = reo_dest_ring->queue_addr_lo;
> 481e5890884c05 Manikanta Pubbisetty 2020-02-14 3120
> reo_ent_ring->info0 =
> FIELD_PREP(HAL_REO_ENTR_RING_INFO0_QUEUE_ADDR_HI,
> 481e5890884c05 Manikanta Pubbisetty 2020-02-14 3121
> FIELD_GET(HAL_REO_DEST_RING_INFO0_QUEUE_ADDR_HI,
> 481e5890884c05 Manikanta Pubbisetty 2020-02-14 3122
> reo_dest_ring->info0)) |
> 481e5890884c05 Manikanta Pubbisetty 2020-02-14 3123
> FIELD_PREP(HAL_REO_ENTR_RING_INFO0_DEST_IND, dst_idx);
> 481e5890884c05 Manikanta Pubbisetty 2020-02-14 3124
> ath11k_hal_srng_access_end(ab, srng);
> 481e5890884c05 Manikanta Pubbisetty 2020-02-14  3125  	spin_unlock_bh(&srng->lock);
> 481e5890884c05 Manikanta Pubbisetty 2020-02-14  3126
> 481e5890884c05 Manikanta Pubbisetty 2020-02-14  3127  	return 0;
> 481e5890884c05 Manikanta Pubbisetty 2020-02-14  3128
> 481e5890884c05 Manikanta Pubbisetty 2020-02-14  3129  err_free_idr:
> 481e5890884c05 Manikanta Pubbisetty 2020-02-14 3130
> spin_lock_bh(&rx_refill_ring->idr_lock);
> 481e5890884c05 Manikanta Pubbisetty 2020-02-14 3131
> idr_remove(&rx_refill_ring->bufs_idr, buf_id);
> 481e5890884c05 Manikanta Pubbisetty 2020-02-14 3132
> spin_unlock_bh(&rx_refill_ring->idr_lock);
> 481e5890884c05 Manikanta Pubbisetty 2020-02-14  3133  err_unmap_dma:
> 481e5890884c05 Manikanta Pubbisetty 2020-02-14 3134
> dma_unmap_single(ab->dev, paddr, defrag_skb->len +
> skb_tailroom(defrag_skb),
> 481e5890884c05 Manikanta Pubbisetty 2020-02-14  3135  			 DMA_FROM_DEVICE);
> 481e5890884c05 Manikanta Pubbisetty 2020-02-14  3136  	return ret;
> 481e5890884c05 Manikanta Pubbisetty 2020-02-14  3137  }
> 481e5890884c05 Manikanta Pubbisetty 2020-02-14  3138
>
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

-- 
https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
