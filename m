Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A93DCC44507
	for <ath11k@archiver.kernel.org>; Thu, 16 Jul 2026 01:49:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qa1jVvwlc7r54xvKrbPUREgWGYwQxqIPvdAwkkBI+/w=; b=45Oe9FII9rhVgdxWs6bQO03cTi
	dW4NOhJGYyMcNinlt5KY+xGEd8hqann+sJPivHgbC9BzPc1hrVaSV+cEzzzSzbI+eXLd8DuvddUxP
	M92JOBGfYlr/3/Uqy78PDNHVtDh4jU2EqNj0/nI/Hsk5lxL0EGyXJrHcC8gew3R0RdyEU7nE1/Fup
	aRRsbmGKhxFvkdZUSjJsz51hIEw0hOsAM2GA/+i4AO09ihnlJ2YlNpDmVJJlRlPOtD1BFXsp7bEL9
	AzQ7c9J04mwbLA1pD+9ZEIftjdGe0atM8dnBxhRs+w5/PSVkSsqi+71cLs7rGFdtIWWcJOLlZOpr+
	EdjazP8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkBEM-0000000GDk6-0sIq;
	Thu, 16 Jul 2026 01:49:42 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkBEJ-0000000GDjA-13eq
	for ath11k@lists.infradead.org;
	Thu, 16 Jul 2026 01:49:40 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66G0Y9C9859738
	for <ath11k@lists.infradead.org>; Thu, 16 Jul 2026 01:49:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=qa1jVvwlc7r54xvKrbPUREgW
	GYwQxqIPvdAwkkBI+/w=; b=bwFLpkhDGO0sp66+VGtYuwpMm1DkFrtzvaZd9Mqv
	xCugxOxtySxzLl3g98ke0kbwal8P9/Kcz3HcKHD98TVw0FSO28926z4atwlDAilQ
	dhPy8ZdrB35lf9QMQ5TOg9wkCWZP0eLKpms+OlzFnJH7wvtghwAEvh5W6kkbckv2
	BYwpThJ22ufruy42bTqwpIkWhUD2IlFKSVu3M/oRCDvY1mzfRr9g7Ts1nt8sSuGZ
	OcUdfDomZNKcsjgNPg7vIyug1WALPYZ3GXx5HI6Lu+CQgkAOSMM5CzT9HsmA88kq
	WzMZ2GuYqjSILovfAD44a4MSbRaxLyvetIMw1soDcRXXYQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fed06230h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Thu, 16 Jul 2026 01:49:30 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3811343bd68so1840757a91.2
        for <ath11k@lists.infradead.org>; Wed, 15 Jul 2026 18:49:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784166570; cv=none;
        d=google.com; s=arc-20260327;
        b=HE1Q5kcU5L6nAEmUY8IyBqbA72wBEFG9nubKRHskwgY3bmg0EJIq8tP/ZHyd6/1cJH
         WFKsMSwB+PCitI3PpvfszXrTOUUILGaPBeGwGjmGHaRPbdVkH2VXEMAS3+upl+98YMj3
         6s8t26L7A8tdkLIN84Y93pUJBsy4VU0YQ5rq6XGe0T2r+jvXuPO7Zy5X2wn/y0tHTdw9
         dTSBw4yTc6WVia2Gfad8Co1q330kJmdMJ1jhSEQCKm2+dtTe2yedZA9yrsMtNhwVvDR7
         jU7JVLpmtzyAVUJGSbxwpAkvJDgOE8nEqsGZeQArj/4RILKDmoOCx5xBPdhDayFWmqUu
         SgRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=qa1jVvwlc7r54xvKrbPUREgWGYwQxqIPvdAwkkBI+/w=;
        fh=Hwg+6h7qec6PoWEDSJlLq/hhbFWRt7O2Zzi8R19sN2w=;
        b=CFj7cO+LjmWvGqjU26Qojdunu8QP7bH975A4z8oGZURglz38cs9WMXleQxvdaikq6v
         1s+HFAOhU9/RvBDfCo3cmX0mYS51McTcmLWpOva0tbFbq16ilypubloOpjOWTBCg/by6
         FecCy7saMn+J4OUt5BRxjk7NIkTCz8UU7LqZ0dgo65BaIoZL1ex/iOYOMSGZd4LPZock
         7JrIqLjDbjLPGiDMJKLv/c9f4RLzoWoFjZpdOd50JQk1y2NPkfMXv0RVuaJbyxT+qj83
         v7NWicgfU+8uqtwSbgbLiY69/kHe+/WPBrXWVySZ+MOAg/uPvHDHiYAsXRJKNHfGzAXd
         C9bw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784166570; x=1784771370; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qa1jVvwlc7r54xvKrbPUREgWGYwQxqIPvdAwkkBI+/w=;
        b=Yyx4Aycy8AslBUMc2kmOhmy1updkEWfLiiNGMKEms8lXorgbdYEIsqttwaOFzbOYuG
         E93hl8j2nhmjt1zh3qOyeiBGZRbZKY07GAfQ6S60wtgoaXaRpJMg6lZoUfZmAqrDDyAt
         XpfnUSNt8px7FWve/Gvvtez9HP4hz5b1j4FcfCAp7sLhCUqGoXZmtSUOVgJxghHp79F3
         J81+ffqAvF191dZOTIBOjQ4dc/JG8E3jr8wq9h+6NwZtYQIwStWpTC9njQRwGcyjJyjs
         2JZvok3Gva8upNBxR+NyXtUSKtK40TDRgB0MjirkemYgO+rDa/8i8z+p8REOvlUkC4iZ
         aDqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784166570; x=1784771370;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=qa1jVvwlc7r54xvKrbPUREgWGYwQxqIPvdAwkkBI+/w=;
        b=XgVErSOMC2QaVRKEa63MP+mtkNLJ99oXwx5mY+q8vt/RIO5Cc2PKajkZ98g+ksEGyU
         JY5PISxifpcbqEiRBAXpDJlSEne8VQCJmUr69IHHLrv9k3TusaBqoAyvVP7zUj6MzxIW
         uDDQXqWoWnbncO58QOp0naAyNtofLhPp5PE2qgeUamaisDa2LfFv9AfHAiJD96APNLVu
         v2ekJHGuUyIX10T04TZe0giAbyfAg7uwVY7BUDu2gNOhU1xSneGu0u0uNsuptXMZ2MSN
         UWk5Q9d8aQNiWboNOlqPo0JyLIrk8MKrzrWsq8HP6P/liUK1H0O0DRMVcM0AR1hzqpZd
         gp2A==
X-Forwarded-Encrypted: i=1; AHgh+Rr/67+roRVMcs/6pdzPahunYnyLFOgAd/Ak9A+bEVsnp4XewGzOmq77OajpscaOKWCZn6s8uT4=@lists.infradead.org
X-Gm-Message-State: AOJu0YydvLAMvrhT1nR9/nNbpShh0iCjYa0C2XS3bv+2wvHMl7MtAjqu
	n7PyuRaDIIqKNEJS/B9dvEQlvtz4HiNCN1UkGVwohATJsqgz98n/XcKfJpJGTV53/oYIpABWAqd
	pe+8+rzEJ8YemNFHFwLOAwckHa0Fk8z1RRLGhX2yZykiw9vJ52Zuk7sQvP1RCO8yI/pYtg9bO31
	Eg7jNqTjl9Re4Um9BRko/rrhRcHOKddraU5KKSuDw=
X-Gm-Gg: AfdE7clFxxyDVp0L+4WfsUd7AhbkYCcqy/IAMNoJqr9YL4FmogWt4ZGeioNo+VVmiEC
	3dTklBPq1eYb0sg6lEw7uyOslvAr9G2pMUauQiTywUaeMdOmz6Dl8MfQPQbtMGYFzLeAdRUglU9
	r6DmR47rY5F78WroTrMAknyvoi+tlN2m+iERd936Th1bSQqEN1kIx+yqps7InTAqSLEJH5XIvRV
	qD7LMI/VG6Fkxprtto=
X-Received: by 2002:a17:90b:3bd0:b0:36b:9323:c726 with SMTP id 98e67ed59e1d1-38dc77ec3f6mr13642868a91.4.1784166569610;
        Wed, 15 Jul 2026 18:49:29 -0700 (PDT)
X-Received: by 2002:a17:90b:3bd0:b0:36b:9323:c726 with SMTP id
 98e67ed59e1d1-38dc77ec3f6mr13642848a91.4.1784166569134; Wed, 15 Jul 2026
 18:49:29 -0700 (PDT)
MIME-Version: 1.0
References: <20260715125017.277242-1-jtornosm@redhat.com> <20260715125017.277242-3-jtornosm@redhat.com>
In-Reply-To: <20260715125017.277242-3-jtornosm@redhat.com>
From: Tamizh Raja <tamizh.raja@oss.qualcomm.com>
Date: Thu, 16 Jul 2026 07:19:17 +0530
X-Gm-Features: AUfX_mzcv6sf1IfdrSAmX-JluVOmlIR9QE6B2uqgl3rt1pJlfmU8M8nrlTnuAAg
Message-ID: <CABkEBKbcQYvMMRUmVgv+GyG8eNiot0acJ13Xy2236zqqr2cnXw@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] wifi: ath11k: implement custom wake_tx_queue with
 flow control
To: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
Cc: jjohnson@kernel.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDAxNSBTYWx0ZWRfXx1tjoeUS4gpQ
 NzekR4aRQ89+eJB2TLpIVXBFh5hMplB2YN6fBwrGGQ+0uBR853YuXgHohVojtl0QyN2r7T735tz
 JL0y72BVlts+C9TIulC14HGN/DFtix4=
X-Proofpoint-GUID: oTIjkvdgQGV6xmP8RzKwCColsxPUR-aC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDAxNSBTYWx0ZWRfX+11ntJxzrbsx
 x13osZUa0/SN5uPeaJf31vLD53Tt8WrC/ORFNdr7nKzVXWBBHPDggFt/oh//tTKzV9jqhz8tInc
 pJxQvv7M+LHiU3fvqZCdlPmiEyzXIeW+2YffykvDMACALzHtThGS7SNbBgBsIWsUu6seF15HBuv
 QzYvX+XElr2tT3Xpo92lyuOav6MNkOtnTXPxpY/vcRNnRVMv34RI7yahL1HoHFqnyywvDKBUWkS
 Itc6C1au7dpUWeSHp8aQReND+TwIKNTkGcyn+cJknv9fNrRHYWDALNvtaJsdGGfgWA2zJ3XyZA+
 7TejBltGVvugp8O/s295pA0J9kbKGr/3/k0FL28CokppIrzPuIHOQbQXNGvouplh9bsMjhWnAuX
 jry4QUPuGHNj5bSIVWidWzDzPq8PBGJbExjZPpWvRvUfQ46LFrU9tp/+z8x+IJojPPULrYaXCFS
 NjjAXtnI+uuEMyxWU9w==
X-Authority-Analysis: v=2.4 cv=Xb25Co55 c=1 sm=1 tr=0 ts=6a5838aa cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=1RTVyt60vU6GMwtd-eQA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: oTIjkvdgQGV6xmP8RzKwCColsxPUR-aC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_01,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 impostorscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607160015
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_184939_298272_6A296099 
X-CRM114-Status: GOOD (  23.51  )
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
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

....
>
>  drivers/net/wireless/ath/ath11k/dp.c  |  1 +
>  drivers/net/wireless/ath/ath11k/dp.h  |  2 +
>  drivers/net/wireless/ath/ath11k/mac.c | 60 ++++++++++++++++++++++++++-
>  3 files changed, 62 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/net/wireless/ath/ath11k/dp.c b/drivers/net/wireless/ath/ath11k/dp.c
> index f389b97acbdd..2e5978ec2b05 100644
> --- a/drivers/net/wireless/ath/ath11k/dp.c
> +++ b/drivers/net/wireless/ath/ath11k/dp.c
> @@ -1087,6 +1087,7 @@ int ath11k_dp_alloc(struct ath11k_base *ab)
>         for (i = 0; i < ab->hw_params.hal_params->num_tx_rings; i++) {
>                 idr_init(&dp->tx_ring[i].txbuf_idr);
>                 spin_lock_init(&dp->tx_ring[i].tx_idr_lock);
> +               spin_lock_init(&dp->tx_ring[i].wake_tx_lock);
>                 dp->tx_ring[i].tcl_data_ring_id = i;
>
>                 dp->tx_ring[i].tx_status_head = 0;
> diff --git a/drivers/net/wireless/ath/ath11k/dp.h b/drivers/net/wireless/ath/ath11k/dp.h
> index 84f66839f0c6..6d99501aa269 100644
> --- a/drivers/net/wireless/ath/ath11k/dp.h
> +++ b/drivers/net/wireless/ath/ath11k/dp.h
> @@ -87,6 +87,8 @@ struct dp_tx_ring {
>         struct idr txbuf_idr;
>         /* Protects txbuf_idr and num_pending */
>         spinlock_t tx_idr_lock;
> +       /* Serializes wake_tx_queue operations for this ring */
> +       spinlock_t wake_tx_lock;
>         struct hal_wbm_release_ring *tx_status;
>         int tx_status_head;
>         int tx_status_tail;
> diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
> index 2d55cdc4d165..046cefd53178 100644
> --- a/drivers/net/wireless/ath/ath11k/mac.c
> +++ b/drivers/net/wireless/ath/ath11k/mac.c
> @@ -10065,9 +10065,67 @@ static int ath11k_mac_op_sta_state(struct ieee80211_hw *hw,
>         return ret;
>  }
>
> +static void ath11k_mac_op_wake_tx_queue(struct ieee80211_hw *hw,
> +                                       struct ieee80211_txq *txq)
> +{
> +       struct ieee80211_tx_control control = {
> +               .sta = txq->sta,
> +       };
> +       const struct sk_buff *peek_skb;
> +       struct ath11k *ar = hw->priv;
> +       struct dp_tx_ring *tx_ring;
> +       struct hal_srng *tcl_ring;
> +       struct sk_buff *skb;
> +       u32 ring_selector;
> +       int num_free;
> +       u8 ring_id;
> +
> +       if (!ar)
> +               return;
> +
> +       while (1) {
> +               if (unlikely(test_bit(ATH11K_FLAG_CRASH_FLUSH,
> +                                     &ar->ab->dev_flags)))
> +                       break;
> +
> +               peek_skb = ieee80211_tx_peek(hw, txq);

in ieee80211_tx_peek() acquires fq->lock, peeks at the skb, releases
the lock, then returns the pointer.
Between spin_unlock_bh(&fq->lock) and using the pointer for
ring_selector. The same skb can also be returned for
the another CPU which calls this function. This may cause use after a
free scenario.

> +               if (!peek_skb)
> +                       break;
> +
> +               ring_selector = ar->ab->hw_params.hw_ops->get_ring_selector(
> +                                       (struct sk_buff *)peek_skb);
> +               ring_id = ring_selector %
> +                         ar->ab->hw_params.hal_params->num_tx_rings;
> +
> +               tx_ring = &ar->ab->dp.tx_ring[ring_id];
> +               tcl_ring = &ar->ab->hal.srng_list[tx_ring->tcl_data_ring.ring_id];
> +
> +               spin_lock_bh(&tx_ring->wake_tx_lock);
> +
> +               spin_lock(&tcl_ring->lock);
> +               num_free = ath11k_hal_srng_src_num_free(ar->ab, tcl_ring, true);
> +               spin_unlock(&tcl_ring->lock);
> +
> +               if (num_free == 0) {
> +                       spin_unlock_bh(&tx_ring->wake_tx_lock);
> +                       break;
> +               }
> +
> +               skb = ieee80211_tx_dequeue(hw, txq);
> +               if (!skb) {
> +                       spin_unlock_bh(&tx_ring->wake_tx_lock);
> +                       break;
> +               }
> +
> +               ath11k_mac_op_tx(hw, &control, skb);
> +
> +               spin_unlock_bh(&tx_ring->wake_tx_lock);
> +       }
> +}
> +
>  static const struct ieee80211_ops ath11k_ops = {
>         .tx                             = ath11k_mac_op_tx,
> -       .wake_tx_queue                  = ieee80211_handle_wake_tx_queue,
> +       .wake_tx_queue                  = ath11k_mac_op_wake_tx_queue,
>         .start                          = ath11k_mac_op_start,
>         .stop                           = ath11k_mac_op_stop,
>         .reconfig_complete              = ath11k_mac_op_reconfig_complete,
> --
> 2.54.0
>
>


-- 
- Tamizh.

