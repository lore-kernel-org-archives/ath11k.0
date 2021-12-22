Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3A96C433EF
	for <ath11k@archiver.kernel.org>; Wed, 22 Dec 2021 03:29:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GnIQbZMk6YaqCJxygyrpxvVaplYjciDXpAxU3kE7e3Y=; b=IlpBiVqM+Uyd9Np2MnBfhLD07v
	t5FqavIZZbxYL0JtWvBNFkMdkGDCK5HfPL25Z8rWblkulK6rH03mYkIrbFE4bCgHZOepJdTMvyo+0
	PVukN1Ob+igwwVOJ0mWVemAagjsS7zxqYdQCmMXQsij1Y2p2yBzGaJ6jCDyI5j4TM7Me93XdSOpRX
	RCsuh0oOWKoQUQsEXCbwPPxYxyT0lxSL7/ZAztFlMprEGcUYE/FWDscrYJUpw0RRDw0n+RwSapfZ5
	IpVpFgkPdDmDEYTBMyQ+nFouUePP997C5iKZRicVrUT2r+oSy1sYmuPUlFW8jTTy5dpgkWO4UpMbh
	LDtgVzNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mzsJX-0096Hm-PA; Wed, 22 Dec 2021 03:29:15 +0000
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mzsJV-0096Gf-0B
 for ath11k@lists.infradead.org; Wed, 22 Dec 2021 03:29:14 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1640143749; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=/cbcC71buEWMwe5M5gbCCByHXv+YwjnFFxIxasGSsBc=;
 b=P9YIMsKskA28lmtwtdF/+sBjuJyQuvUqhYcKFzkM0zAApZujZCrWFovhJppacb4FEwEteEww
 Ob1DeWdcKu5zcn1S0wTIwdiqJhnu5ZrgsOGL0ddAhGBiOGlVHe/hC1lenjO51PlfwHTJpbmb
 lDWWbieBCpHnlPs3e0sitkPkPac=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 61c29b857d878c8ded142566 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 22 Dec 2021 03:29:09
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 515CBC43616; Wed, 22 Dec 2021 03:29:08 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: akolli)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id F3D1EC4338F;
 Wed, 22 Dec 2021 03:29:06 +0000 (UTC)
MIME-Version: 1.0
Date: Wed, 22 Dec 2021 08:59:06 +0530
From: Anilkumar Kolli <akolli@codeaurora.org>
To: Kalle Valo <kvalo@kernel.org>
Cc: Dan Carpenter <dan.carpenter@oracle.com>, ath11k@lists.infradead.org
Subject: Re: [bug report] ath11k: Fix pktlog lite rx events
In-Reply-To: <87czlq6mdw.fsf@kernel.org>
References: <20211130104159.GD5827@kili>
 <725a45b8c05ebd508df3bfc6b1097b03@codeaurora.org>
 <87czlq6mdw.fsf@kernel.org>
Message-ID: <e2df0d82a0ca520123c96e070cdabf56@codeaurora.org>
X-Sender: akolli@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211221_192913_177930_19730CDC 
X-CRM114-Status: GOOD (  13.51  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

On 2021-12-21 20:22, Kalle Valo wrote:
> Anilkumar Kolli <akolli@codeaurora.org> writes:
> 
>> On 2021-11-30 16:12, Dan Carpenter wrote:
>>> Hello Anilkumar Kolli,
>>> 
>>> The patch ab18e3bc1c13: "ath11k: Fix pktlog lite rx events" from Sep
>>> 28, 2021, leads to the following Smatch static checker warning:
>>> 
>>> 	drivers/net/wireless/ath/ath11k/dp_rx.c:3105
>>> ath11k_dp_rx_process_mon_status()
>>> 	error: uninitialized symbol 'rx_buf_sz'.
>>> 
>>> drivers/net/wireless/ath/ath11k/dp_rx.c
>>>     3043 int ath11k_dp_rx_process_mon_status(struct ath11k_base *ab,
>>> int mac_id,
>>>     3044                                     struct napi_struct 
>>> *napi,
>>> int budget)
>>>     3045 {
>>>     3046         struct ath11k *ar = ath11k_ab_to_ar(ab, mac_id);
>>>     3047         enum hal_rx_mon_status hal_status;
>>>     3048         struct sk_buff *skb;
>>>     3049         struct sk_buff_head skb_list;
>>>     3050         struct hal_rx_mon_ppdu_info ppdu_info;
>>>     3051         struct ath11k_peer *peer;
>>>     3052         struct ath11k_sta *arsta;
>>>     3053         int num_buffs_reaped = 0;
>>>     3054         u32 rx_buf_sz;
>>>                  ^^^^^^^^^^^^^
>>> 
>>>     3055         u16 log_type = 0;
>>>     3056
>>>     3057         __skb_queue_head_init(&skb_list);
>>>     3058
>>>     3059         num_buffs_reaped =
>>> ath11k_dp_rx_reap_mon_status_ring(ab, mac_id, &budget,
>>>     3060
>>> &skb_list);
>>>     3061         if (!num_buffs_reaped)
>>>     3062                 goto exit;
>>>     3063
>>>     3064         while ((skb = __skb_dequeue(&skb_list))) {
>>>     3065                 memset(&ppdu_info, 0, sizeof(ppdu_info));
>>>     3066                 ppdu_info.peer_id = HAL_INVALID_PEERID;
>>>     3067
>>>     3068                 if
>>> (ath11k_debugfs_is_pktlog_lite_mode_enabled(ar)) {
>>>     3069                         log_type = 
>>> ATH11K_PKTLOG_TYPE_LITE_RX;
>>>     3070                         rx_buf_sz = DP_RX_BUFFER_SIZE_LITE;
>>>     3071                 } else if
>>> (ath11k_debugfs_is_pktlog_rx_stats_enabled(ar)) {
>>>     3072                         log_type =
>>> ATH11K_PKTLOG_TYPE_RX_STATBUF;
>>>     3073                         rx_buf_sz = DP_RX_BUFFER_SIZE;
>>>     3074                 }
>>> 
>>> No else statement.
>>> 
>>>     3075
>>>     3076                 if (log_type)
>>>     3077                         trace_ath11k_htt_rxdesc(ar,
>>> skb->data, log_type, rx_buf_sz);
>>>     3078
>>>     3079                 hal_status =
>>> ath11k_hal_rx_parse_mon_status(ab, &ppdu_info, skb);
>>>     3080
>>>     3081                 if (ppdu_info.peer_id == HAL_INVALID_PEERID 
>>> ||
>>>     3082                     hal_status !=
>>> HAL_RX_MON_STATUS_PPDU_DONE) {
>>>     3083                         dev_kfree_skb_any(skb);
>>>     3084                         continue;
>>>     3085                 }
>>>     3086
>>>     3087                 rcu_read_lock();
>>>     3088                 spin_lock_bh(&ab->base_lock);
>>>     3089                 peer = ath11k_peer_find_by_id(ab,
>>> ppdu_info.peer_id);
>>>     3090
>>>     3091                 if (!peer || !peer->sta) {
>>>     3092                         ath11k_dbg(ab, ATH11K_DBG_DATA,
>>>     3093                                    "failed to find the peer
>>> with peer_id %d\n",
>>>     3094                                    ppdu_info.peer_id);
>>>     3095                         spin_unlock_bh(&ab->base_lock);
>>>     3096                         rcu_read_unlock();
>>>     3097                         dev_kfree_skb_any(skb);
>>>     3098                         continue;
>>>     3099                 }
>>>     3100
>>>     3101                 arsta = (struct ath11k_sta
>>> *)peer->sta->drv_priv;
>>>     3102                 ath11k_dp_rx_update_peer_stats(arsta,
>>> &ppdu_info);
>>>     3103
>>>     3104                 if (ath11k_debugfs_is_pktlog_peer_valid(ar,
>>> peer->addr))
>>> --> 3105                         trace_ath11k_htt_rxdesc(ar,
>>> skb->data, log_type, rx_buf_sz);
>>> 
>>>            ^^^^^^^^^
>>> Warning here.
>>> 
>>>     3106
>>>     3107                 spin_unlock_bh(&ab->base_lock);
>>>     3108                 rcu_read_unlock();
>>>     3109
>>>     3110                 dev_kfree_skb_any(skb);
>>>     3111         }
>>>     3112 exit:
>>>     3113         return num_buffs_reaped;
>>>     3114 }
>>> 
>>> regards,
>>> dan carpenter
>> 
>> Hi Dan carpenter
>> 
>> Thanks for reporting issue. Could you please help in reproducing the
>> issue,
>> 
>> I tried to reproduce the warnings using command, but could not
>>     make C=1 CHECK="smatch -p=kernel" -C.
>> drivers/net/wireless/ath/ath11k/ modules
> 
> I don't see why you need to reproduce the error. rx_buf_sz is
> uninitialised as there's no else statement, like Dan mentioned above.
> 

I thought this script is useful for ath11k.

> Anil, can you send a patch?

Sure Kalle, I will submit a patch.

- Anil.

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
