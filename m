Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEB7CC35FFC
	for <ath11k@archiver.kernel.org>; Sat, 22 Mar 2025 20:32:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MBaCnQErjphWQ/6DEDPtyGgc1KmN6LXb9upYohAu4Nc=; b=sHWiBrR124guQnHq1CDqX7wYEQ
	u+t+nisWoklv1miRLqGMQ8m6t5sMAsZRrA/LV7ieNfMyFExcYzr1M/fZdCW5VzDoPPHMkrW/gxa/u
	i3zt6/v5rTiObAtSZgEA5auLHEc6J+nJcoGLWg97JFEG15FI6AVcen+IjFo8VrhCbxuo7dXZXut69
	56TCBl5TjnMLnXkcBEscahpy8GyBTMyY6Imn4J8nXbEXFhc98DtTXkJawcUDpUJi786KluCDV4yRf
	WdVcor6aSlDSC1Z68k27JOYQdRo3wQn5e95it6W4kQCw3K+TpRZVqXWHOzExYTVfSgvF3L4sduZEL
	b3i8MXIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tw5W5-00000000Hf4-1fdd;
	Sat, 22 Mar 2025 20:32:25 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tw5W2-00000000Heh-46Kv
	for ath11k@lists.infradead.org;
	Sat, 22 Mar 2025 20:32:24 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-ac2ab99e16eso626396566b.0
        for <ath11k@lists.infradead.org>; Sat, 22 Mar 2025 13:32:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kali.org; s=google; t=1742675541; x=1743280341; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MBaCnQErjphWQ/6DEDPtyGgc1KmN6LXb9upYohAu4Nc=;
        b=ZuU+I7udNU8KdcWjwR/9bTDjT/ou5XeEUa/of+Tn2U90pI5C1/1m7uunmvfzNt4jOL
         FDyLABWbsHMZreh/8NmD7plCLSFNrTNAXsSm7jhnsJAhslCplTWrFcpY2YC7ssu3I1Sz
         EeIQhB/LLHNiUTUkOmq/m17YJFNct9g1brTZqSPwyv1DTzhyOZi9Prr2UI3E7Adz29Pu
         nw1uHSOEQqw9xBenP+V3pRqF0h/CH4t82TJJQ97WOfcZHkVit+X3+upoQAXaFGBrmROG
         DNjbEtwy7uJ3zsmeA6vxxF5CGE+ZXlR/+rvsfEhrE46VzIfA/mXOL6JdxYEa8/UEYGQ4
         Rd3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742675541; x=1743280341;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MBaCnQErjphWQ/6DEDPtyGgc1KmN6LXb9upYohAu4Nc=;
        b=W76U1q/gWreCGA9fJwkJ2gmSHP1ZM8xJcrCGJkrkA9YoW6UjzJ++/txusclxvd9oYl
         3M+Lm0bwf5Rrrl0u90D9pGczUaIHUCO/GLMhlO7OacNnV0kclVTgqxLw3IRol6S9qgXu
         2cQT5lIMS8sCqrvxXOEZVU3yuaux8JbTPoV/QSuhHei7GvPtZj4AKuSet2PykP9o+vlP
         C7wdp7Dv26txhYnEjhuBdgbwdQAZguSE+rkFwcdN4AtXhCKtwfN7mOg7I4O81hQW0ZOx
         3wXUWEoc3av/i6ochXrUEooAGQpcBjbiVOqRp+AiW8ST9aJGYRo/JXx+zzOEFk7fRBWW
         ITqQ==
X-Forwarded-Encrypted: i=1; AJvYcCV04URL/Ga9v0+8BK8juV/Gm8k2/TxbZbHNVafxzqWiywl9m9x/RuPZHdJdEoUAV80fqvW5O70=@lists.infradead.org
X-Gm-Message-State: AOJu0Yytmc6UTrCVp+ZBrXsI4OgNgfQo+z6T8K6iSMtzhmE6/xIhQOqM
	qvR9HXIr1xF7qoichzBO7PyLeoH4moWnOfzdeEBU2vAJVOfns2ReftbOmU6ghotth7B668oD/Hq
	HiNXPbTAbCt0NRg13siFhY8RGQjiZ0JSNC0pi9A==
X-Gm-Gg: ASbGnctMAviyty90uS4CjDjJEJxAbvnSsFSHBOUR/Nbw0aLkQuaUYfJUXSq7p8bFKxc
	bT6nQX8vfF33jj50bCZqYs7VXB+Fe3P1VS/ztIOMhr3WMWyW3B9Ltpkg0DoVvcrAT1F8djxKRPT
	9A8iNj7qWIh4CnzsX2+cGcmIHE09zL6V7+pXIpXA==
X-Google-Smtp-Source: AGHT+IFtgOvQ/ipQ5UFSn66TToxJyVI3SzkIjV049UlX5bGqRqNfgfHmq7s9TmGxajhk9iLQXeErbCLQrAMLvdy2238=
X-Received: by 2002:a17:906:d552:b0:ac3:1373:8a3d with SMTP id
 a640c23a62f3a-ac3f226dfc0mr719120366b.20.1742675541018; Sat, 22 Mar 2025
 13:32:21 -0700 (PDT)
MIME-Version: 1.0
References: <20250321145302.4775-1-johan+linaro@kernel.org>
In-Reply-To: <20250321145302.4775-1-johan+linaro@kernel.org>
From: Steev Klimaszewski <steev@kali.org>
Date: Sat, 22 Mar 2025 15:32:08 -0500
X-Gm-Features: AQ5f1Jo_ng3ufW9UOehzcLhlOEtOWJZFpCerf42h3io3os1P4AkoGlgh3Ackpds
Message-ID: <CAKXuJqh0_7fduDgDXWzCE2fYNHV-mDa29Lxq15h7-vam2Nin6w@mail.gmail.com>
Subject: Re: [PATCH] wifi: ath11k: fix rx completion meta data corruption
To: Johan Hovold <johan+linaro@kernel.org>
Cc: Jeff Johnson <jjohnson@kernel.org>, Miaoqing Pan <quic_miaoqing@quicinc.com>, 
	Clayton Craft <clayton@craftyguy.net>, Jens Glathe <jens.glathe@oldschoolsolutions.biz>, 
	ath11k@lists.infradead.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250322_133223_018337_E1B416BF 
X-CRM114-Status: GOOD (  26.95  )
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

Hi Johan,

On Fri, Mar 21, 2025 at 9:55=E2=80=AFAM Johan Hovold <johan+linaro@kernel.o=
rg> wrote:
>
> Add the missing memory barrier to make sure that the REO dest ring
> descriptor is read after the head pointer to avoid using stale data on
> weakly ordered architectures like aarch64.
>
> This may fix the ring-buffer corruption worked around by commit
> f9fff67d2d7c ("wifi: ath11k: Fix SKB corruption in REO destination
> ring") by silently discarding data, and may possibly also address user
> reported errors like:
>
>         ath11k_pci 0006:01:00.0: msdu_done bit in attention is not set
>
> Tested-on: WCN6855 hw2.1 WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LIT=
E-3.6510.41
>
> Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
> Cc: stable@vger.kernel.org      # 5.6
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=3D218005
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
>
> As I reported here:
>
>         https://lore.kernel.org/lkml/Z9G5zEOcTdGKm7Ei@hovoldconsulting.co=
m/
>
> the ath11k and ath12k appear to be missing a number of memory barriers
> that are required on weakly ordered architectures like aarch64 to avoid
> memory corruption issues.
>
> Here's a fix for one more such case which people already seem to be
> hitting.
>
> Note that I've seen one "msdu_done" bit not set warning also with this
> patch so whether it helps with that at all remains to be seen. I'm CCing
> Jens and Steev that see these warnings frequently and that may be able
> to help out with testing.
>
> Johan
>
>
>  drivers/net/wireless/ath/ath11k/dp_rx.c | 25 ++++++++++++++++---------
>  1 file changed, 16 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wirele=
ss/ath/ath11k/dp_rx.c
> index 029ecf51c9ef..0a57b337e4c6 100644
> --- a/drivers/net/wireless/ath/ath11k/dp_rx.c
> +++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
> @@ -2646,7 +2646,7 @@ int ath11k_dp_process_rx(struct ath11k_base *ab, in=
t ring_id,
>         struct ath11k *ar;
>         struct hal_reo_dest_ring *desc;
>         enum hal_reo_dest_ring_push_reason push_reason;
> -       u32 cookie;
> +       u32 cookie, info0, rx_msdu_info0, rx_mpdu_info0;
>         int i;
>
>         for (i =3D 0; i < MAX_RADIOS; i++)
> @@ -2659,11 +2659,14 @@ int ath11k_dp_process_rx(struct ath11k_base *ab, =
int ring_id,
>  try_again:
>         ath11k_hal_srng_access_begin(ab, srng);
>
> +       /* Make sure descriptor is read after the head pointer. */
> +       dma_rmb();
> +
>         while (likely(desc =3D
>               (struct hal_reo_dest_ring *)ath11k_hal_srng_dst_get_next_en=
try(ab,
>                                                                          =
    srng))) {
>                 cookie =3D FIELD_GET(BUFFER_ADDR_INFO1_SW_COOKIE,
> -                                  desc->buf_addr_info.info1);
> +                                  READ_ONCE(desc->buf_addr_info.info1));
>                 buf_id =3D FIELD_GET(DP_RXDMA_BUF_COOKIE_BUF_ID,
>                                    cookie);
>                 mac_id =3D FIELD_GET(DP_RXDMA_BUF_COOKIE_PDEV_ID, cookie)=
;
> @@ -2692,8 +2695,9 @@ int ath11k_dp_process_rx(struct ath11k_base *ab, in=
t ring_id,
>
>                 num_buffs_reaped[mac_id]++;
>
> +               info0 =3D READ_ONCE(desc->info0);
>                 push_reason =3D FIELD_GET(HAL_REO_DEST_RING_INFO0_PUSH_RE=
ASON,
> -                                       desc->info0);
> +                                       info0);
>                 if (unlikely(push_reason !=3D
>                              HAL_REO_DEST_RING_PUSH_REASON_ROUTING_INSTRU=
CTION)) {
>                         dev_kfree_skb_any(msdu);
> @@ -2701,18 +2705,21 @@ int ath11k_dp_process_rx(struct ath11k_base *ab, =
int ring_id,
>                         continue;
>                 }
>
> -               rxcb->is_first_msdu =3D !!(desc->rx_msdu_info.info0 &
> +               rx_msdu_info0 =3D READ_ONCE(desc->rx_msdu_info.info0);
> +               rx_mpdu_info0 =3D READ_ONCE(desc->rx_mpdu_info.info0);
> +
> +               rxcb->is_first_msdu =3D !!(rx_msdu_info0 &
>                                          RX_MSDU_DESC_INFO0_FIRST_MSDU_IN=
_MPDU);
> -               rxcb->is_last_msdu =3D !!(desc->rx_msdu_info.info0 &
> +               rxcb->is_last_msdu =3D !!(rx_msdu_info0 &
>                                         RX_MSDU_DESC_INFO0_LAST_MSDU_IN_M=
PDU);
> -               rxcb->is_continuation =3D !!(desc->rx_msdu_info.info0 &
> +               rxcb->is_continuation =3D !!(rx_msdu_info0 &
>                                            RX_MSDU_DESC_INFO0_MSDU_CONTIN=
UATION);
>                 rxcb->peer_id =3D FIELD_GET(RX_MPDU_DESC_META_DATA_PEER_I=
D,
> -                                         desc->rx_mpdu_info.meta_data);
> +                                         READ_ONCE(desc->rx_mpdu_info.me=
ta_data));
>                 rxcb->seq_no =3D FIELD_GET(RX_MPDU_DESC_INFO0_SEQ_NUM,
> -                                        desc->rx_mpdu_info.info0);
> +                                        rx_mpdu_info0);
>                 rxcb->tid =3D FIELD_GET(HAL_REO_DEST_RING_INFO0_RX_QUEUE_=
NUM,
> -                                     desc->info0);
> +                                     info0);
>
>                 rxcb->mac_id =3D mac_id;
>                 __skb_queue_tail(&msdu_list[mac_id], msdu);
> --
> 2.48.1
>

While the fix is definitely a fix, it does not seem to help with the
`msdu_done bit in attention is not set` message as I have seen it 43
times in the last 12 hours.

-- Steev

