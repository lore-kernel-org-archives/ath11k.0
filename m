Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98092C433EF
	for <ath11k@archiver.kernel.org>; Tue, 21 Dec 2021 14:52:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HTR6qWeUD2j99nAE67vziatdl8S5SxBYmv/UVwix2DE=; b=Fx4vWu5KA5zKsL
	MwmfBFMTbxp/v2bTq+ZzmXMyr4zzCYTtr6sKSuPT+LfCGxYKiaIc9dh05Me1bC2EsB3+NVi85Wilo
	zeM6cR4s7CuY8pPuj0siBZ9kYQgrPGB/l3V3R3TiJSZSwh3RltEAsmLlbVjwLwmZ6q2j79ffSW1Zj
	fsL2yh7eTgQ9ieKFtVnwAyV8sPiZ1rnX/8jqajhP1sH+2hk1ywTkuRVYDkbgWsMyXOtujFuT8rY0U
	dRh2ufnjDqsVAXXrRN2w7MN7hqzdtU7RYVfC/NhwpbB1Al2hytelWC6YFIIreCZUrU1B+NFpHE2uJ
	GoA+lFc7pWs9PF3VMCSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mzgVI-007Cts-DL; Tue, 21 Dec 2021 14:52:36 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mzgVG-007CsA-2S
 for ath11k@lists.infradead.org; Tue, 21 Dec 2021 14:52:35 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id A9165B8171C;
 Tue, 21 Dec 2021 14:52:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77416C36AE8;
 Tue, 21 Dec 2021 14:52:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640098350;
 bh=OC5PS86rnx/DBzqcAG22KirVdIV1bhgCUxQCH9wFEfE=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=KIGBgq7yTaq/5dJdhRwxl6dV8hxrlL96I9u2gmNxzCXqluHm0my42Omkw9WlnEU5a
 RUk99f+/R7nEnH9U1ePyhTyfLEMy4crBmcXK4vYQI0FXl+YiOOmc4yYxwdeAWFKI/D
 ReJZUA9e9IwgXHTCBfb1dEpG9quUPnZXFoqb41pvDH1P14ZkgyIiaBSkXZsGj/v2Sv
 18DdruYrdt7cI+NK57WcxM9WZ3GDoqJLt0LEBPjUapeO0LC5QSIK6GO9iNinwBZGld
 j/Heb1X/9vT3eLCXrrh/upYjbQ3Owfxa1Q4dyR0hsBaIR/FkXdlTct5z6dvuV5HfkJ
 wPlxU7lmMhRiQ==
From: Kalle Valo <kvalo@kernel.org>
To: Anilkumar Kolli <akolli@codeaurora.org>
Cc: Dan Carpenter <dan.carpenter@oracle.com>,  ath11k@lists.infradead.org
Subject: Re: [bug report] ath11k: Fix pktlog lite rx events
In-Reply-To: <725a45b8c05ebd508df3bfc6b1097b03@codeaurora.org> (Anilkumar
 Kolli's message of "Tue, 14 Dec 2021 19:56:50 +0530")
References: <20211130104159.GD5827@kili>
 <725a45b8c05ebd508df3bfc6b1097b03@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
Date: Tue, 21 Dec 2021 16:52:27 +0200
Message-ID: <87czlq6mdw.fsf@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211221_065234_420438_F088B2A6 
X-CRM114-Status: GOOD (  12.10  )
X-BeenThere: ath11k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
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
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Anilkumar Kolli <akolli@codeaurora.org> writes:

> On 2021-11-30 16:12, Dan Carpenter wrote:
>> Hello Anilkumar Kolli,
>>
>> The patch ab18e3bc1c13: "ath11k: Fix pktlog lite rx events" from Sep
>> 28, 2021, leads to the following Smatch static checker warning:
>>
>> 	drivers/net/wireless/ath/ath11k/dp_rx.c:3105
>> ath11k_dp_rx_process_mon_status()
>> 	error: uninitialized symbol 'rx_buf_sz'.
>>
>> drivers/net/wireless/ath/ath11k/dp_rx.c
>>     3043 int ath11k_dp_rx_process_mon_status(struct ath11k_base *ab,
>> int mac_id,
>>     3044                                     struct napi_struct *napi,
>> int budget)
>>     3045 {
>>     3046         struct ath11k *ar = ath11k_ab_to_ar(ab, mac_id);
>>     3047         enum hal_rx_mon_status hal_status;
>>     3048         struct sk_buff *skb;
>>     3049         struct sk_buff_head skb_list;
>>     3050         struct hal_rx_mon_ppdu_info ppdu_info;
>>     3051         struct ath11k_peer *peer;
>>     3052         struct ath11k_sta *arsta;
>>     3053         int num_buffs_reaped = 0;
>>     3054         u32 rx_buf_sz;
>>                  ^^^^^^^^^^^^^
>>
>>     3055         u16 log_type = 0;
>>     3056
>>     3057         __skb_queue_head_init(&skb_list);
>>     3058
>>     3059         num_buffs_reaped =
>> ath11k_dp_rx_reap_mon_status_ring(ab, mac_id, &budget,
>>     3060
>> &skb_list);
>>     3061         if (!num_buffs_reaped)
>>     3062                 goto exit;
>>     3063
>>     3064         while ((skb = __skb_dequeue(&skb_list))) {
>>     3065                 memset(&ppdu_info, 0, sizeof(ppdu_info));
>>     3066                 ppdu_info.peer_id = HAL_INVALID_PEERID;
>>     3067
>>     3068                 if
>> (ath11k_debugfs_is_pktlog_lite_mode_enabled(ar)) {
>>     3069                         log_type = ATH11K_PKTLOG_TYPE_LITE_RX;
>>     3070                         rx_buf_sz = DP_RX_BUFFER_SIZE_LITE;
>>     3071                 } else if
>> (ath11k_debugfs_is_pktlog_rx_stats_enabled(ar)) {
>>     3072                         log_type =
>> ATH11K_PKTLOG_TYPE_RX_STATBUF;
>>     3073                         rx_buf_sz = DP_RX_BUFFER_SIZE;
>>     3074                 }
>>
>> No else statement.
>>
>>     3075
>>     3076                 if (log_type)
>>     3077                         trace_ath11k_htt_rxdesc(ar,
>> skb->data, log_type, rx_buf_sz);
>>     3078
>>     3079                 hal_status =
>> ath11k_hal_rx_parse_mon_status(ab, &ppdu_info, skb);
>>     3080
>>     3081                 if (ppdu_info.peer_id == HAL_INVALID_PEERID ||
>>     3082                     hal_status !=
>> HAL_RX_MON_STATUS_PPDU_DONE) {
>>     3083                         dev_kfree_skb_any(skb);
>>     3084                         continue;
>>     3085                 }
>>     3086
>>     3087                 rcu_read_lock();
>>     3088                 spin_lock_bh(&ab->base_lock);
>>     3089                 peer = ath11k_peer_find_by_id(ab,
>> ppdu_info.peer_id);
>>     3090
>>     3091                 if (!peer || !peer->sta) {
>>     3092                         ath11k_dbg(ab, ATH11K_DBG_DATA,
>>     3093                                    "failed to find the peer
>> with peer_id %d\n",
>>     3094                                    ppdu_info.peer_id);
>>     3095                         spin_unlock_bh(&ab->base_lock);
>>     3096                         rcu_read_unlock();
>>     3097                         dev_kfree_skb_any(skb);
>>     3098                         continue;
>>     3099                 }
>>     3100
>>     3101                 arsta = (struct ath11k_sta
>> *)peer->sta->drv_priv;
>>     3102                 ath11k_dp_rx_update_peer_stats(arsta,
>> &ppdu_info);
>>     3103
>>     3104                 if (ath11k_debugfs_is_pktlog_peer_valid(ar,
>> peer->addr))
>> --> 3105                         trace_ath11k_htt_rxdesc(ar,
>> skb->data, log_type, rx_buf_sz);
>>
>>            ^^^^^^^^^
>> Warning here.
>>
>>     3106
>>     3107                 spin_unlock_bh(&ab->base_lock);
>>     3108                 rcu_read_unlock();
>>     3109
>>     3110                 dev_kfree_skb_any(skb);
>>     3111         }
>>     3112 exit:
>>     3113         return num_buffs_reaped;
>>     3114 }
>>
>> regards,
>> dan carpenter
>
> Hi Dan carpenter
>
> Thanks for reporting issue. Could you please help in reproducing the
> issue,
>
> I tried to reproduce the warnings using command, but could not
>     make C=1 CHECK="smatch -p=kernel" -C.
> drivers/net/wireless/ath/ath11k/ modules

I don't see why you need to reproduce the error. rx_buf_sz is
uninitialised as there's no else statement, like Dan mentioned above.

Anil, can you send a patch?

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
