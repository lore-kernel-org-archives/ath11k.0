Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6829DC35FFC
	for <ath11k@archiver.kernel.org>; Sat, 22 Mar 2025 20:30:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u6cSUgatbqKhRbZTmyK9VSh/Zt9MhUeI55/TCtex2OE=; b=FZrZS/gMtwx8Vajg6OfpEV3hEM
	oroCjj0UIsASzinnYG9UX003PDt7lbbj0Eo8N04iiva4HEfMcIYuxxVybezHFl0oY1Oo+3RM5nzEl
	s75D3zqF2mICr7KrlpgwDiPTOFllK8CR7/lVsPmpmeLwqDDUXBh+D74UvxV4XVVaqecfgl7lyHlgJ
	bUCOKgqIEhqKLj7eUp/vWinK3/REdKnvNniVLQY7Kl/1Q5sQRN+5h220ffxA9OFHkiVTjUCuKQdm9
	Az23Mf9pXMsyRlikxciVm3a3NL+rCN1HVeDFxweejKklRvZ1jTJLuap0NsPxAjlf14sutQ3TsnyEg
	8NyDmm1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tw5Ts-00000000HSF-3fU6;
	Sat, 22 Mar 2025 20:30:08 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tw5Tq-00000000HRZ-0LZG
	for ath11k@lists.infradead.org;
	Sat, 22 Mar 2025 20:30:07 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-5e61d91a087so4698945a12.0
        for <ath11k@lists.infradead.org>; Sat, 22 Mar 2025 13:30:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kali.org; s=google; t=1742675404; x=1743280204; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u6cSUgatbqKhRbZTmyK9VSh/Zt9MhUeI55/TCtex2OE=;
        b=DSLDzhcSVZ4PVXVY/5ey5X7/DH4aKnjWulOt/5Q5XPPL9NzpVL95KnAHj0InmVsLir
         WJ0tbhWDQ1u4cB4xzKATRONub/KM/xJcYVe/ZNouX6CzaoNytYxEHPmJDKD8r1qFqOOq
         z2/2V5gZs2odMFQFVaTxlEYh3aVkngPLkTVQxpobpsUMOfuaZn+hrCizqiO/0IBVc3xj
         LNUZH7BFrViHtejQTecK2GQTgCfB6AzlIXmaYfcq4qVPr0qion9TR7hglrw84OWWa2q5
         xKEJnS0fBWalu5VA7MpHodwDH+3PTFzzrIj9Tx8/ZEKcQJwWZXQM8iRzpxRGYa2nqVOw
         HE2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742675404; x=1743280204;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u6cSUgatbqKhRbZTmyK9VSh/Zt9MhUeI55/TCtex2OE=;
        b=tblqGezZiOkXoQ21d0b62rDcK9LD0Yb8srpId2Q/j2Kc1nUs5zhZZ9L9TRme1KszBn
         JZE9/I6yNk2MqeEUDeOwEne7cLsYgQNNcwXPcJWKQO0dL0od4GLM8Ty8VlcZdcFwwXQb
         hpqLOudWjO3JMJ5bjCyUjD00ExhbYxHwLWuUnlTjB2/U+9jp+m95Xj/zNZN7DaZ2kpL5
         EJ77pb50Ybp/JbE2INpZgaPYDZ/E8XeSG7mHMzJQP/tlEGyA8+Ho8YaFf4Tqa9t4Og2e
         6DZdruZPoflQ8fTTFkspriHbyo01dSAV+s1I0A7mHRfPfMw//lV6qmYVYUEhQD+sb5tL
         Gi5Q==
X-Forwarded-Encrypted: i=1; AJvYcCX91r/y1rxqItx+2pb59b0He6NSHg2Y1we7aRssb7nNa6Y2x1muOSRCuXmI5nymFiepjpPxeaY=@lists.infradead.org
X-Gm-Message-State: AOJu0YxaiGb5H7TQblN7reADPOOlf6AEudlNEDgYjk32lpbqCHRa4i0B
	Ll8vUG1xiBMJsau5z6+dssNKAortCcHl2stTxRQPMqbukWthv5yayvkyxoGpZF7RcXL7xQBXPGj
	5h00R3IqJ+i83Ps3hGbBMcTtK3o8POZUO3n0Aqg==
X-Gm-Gg: ASbGncvsVXpL+Cfh9baysWVgr+Qb3ziBoEvlJbcWslZ38rkjm+72SJOK3Jl6hiEnx4a
	WrbQZpk8blZLHtnPPBqp9KC69qlpRq13+23DqSKv67CFTE2v95ICkhWV54iOt3F3yPirYFU3XR9
	ye0AFEkh46gtjoCmd0a7T9Ja2jRSU=
X-Google-Smtp-Source: AGHT+IFBIVXZYDtiJpjWV/LcWygCCyM8XLLo2e1nj12IRbPwY/47eV7JcCDI5vBSVRn6rhZYRnytHKUjzgf552Rs/uQ=
X-Received: by 2002:a05:6402:524e:b0:5dc:6e27:e6e8 with SMTP id
 4fb4d7f45d1cf-5ebcd4fa24dmr7390153a12.24.1742675403691; Sat, 22 Mar 2025
 13:30:03 -0700 (PDT)
MIME-Version: 1.0
References: <20250321094916.19098-1-johan+linaro@kernel.org>
In-Reply-To: <20250321094916.19098-1-johan+linaro@kernel.org>
From: Steev Klimaszewski <steev@kali.org>
Date: Sat, 22 Mar 2025 15:29:52 -0500
X-Gm-Features: AQ5f1JoCXYzLr6Wcr5GEM3kx8AqnGOONhGWVUVet26agDhGD1qrhlsAqp0-B4Hs
Message-ID: <CAKXuJqjTP9Pr_AFOfNwzzi9F=qOO8zdo7Ga+6-a8x1ihsN4SpA@mail.gmail.com>
Subject: Re: [PATCH] wifi: ath11k: fix ring-buffer corruption
To: Johan Hovold <johan+linaro@kernel.org>
Cc: Jeff Johnson <jjohnson@kernel.org>, Miaoqing Pan <quic_miaoqing@quicinc.com>, 
	Clayton Craft <clayton@craftyguy.net>, Jens Glathe <jens.glathe@oldschoolsolutions.biz>, 
	ath11k@lists.infradead.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250322_133006_128362_F3011A73 
X-CRM114-Status: GOOD (  26.03  )
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

On Fri, Mar 21, 2025 at 4:51=E2=80=AFAM Johan Hovold <johan+linaro@kernel.o=
rg> wrote:
>
> Users of the Lenovo ThinkPad X13s have reported that Wi-Fi sometimes
> breaks and the log fills up with errors like:
>
>     ath11k_pci 0006:01:00.0: HTC Rx: insufficient length, got 1484, expec=
ted 1492
>     ath11k_pci 0006:01:00.0: HTC Rx: insufficient length, got 1460, expec=
ted 1484
>
> which based on a quick look at the driver seemed to indicate some kind
> of ring-buffer corruption.
>
> Miaoqing Pan tracked it down to the host seeing the updated destination
> ring head pointer before the updated descriptor, and the error handling
> for that in turn leaves the ring buffer in an inconsistent state.
>
> Add the missing memory barrier to make sure that the descriptor is read
> after the head pointer to address the root cause of the corruption while
> fixing up the error handling in case there are ever any (ordering) bugs
> on the device side.
>
> Note that the READ_ONCE() are only needed to avoid compiler mischief in
> case the ring-buffer helpers are ever inlined.
>
> Tested-on: WCN6855 hw2.1 WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LIT=
E-3.6510.41
>
> Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=3D218623
> Link: https://lore.kernel.org/20250310010217.3845141-3-quic_miaoqing@quic=
inc.com
> Cc: Miaoqing Pan <quic_miaoqing@quicinc.com>
> Cc: stable@vger.kernel.org      # 5.6
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
>  drivers/net/wireless/ath/ath11k/ce.c  | 11 +++++------
>  drivers/net/wireless/ath/ath11k/hal.c |  4 ++--
>  2 files changed, 7 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/net/wireless/ath/ath11k/ce.c b/drivers/net/wireless/=
ath/ath11k/ce.c
> index e66e86bdec20..9d8efec46508 100644
> --- a/drivers/net/wireless/ath/ath11k/ce.c
> +++ b/drivers/net/wireless/ath/ath11k/ce.c
> @@ -393,11 +393,10 @@ static int ath11k_ce_completed_recv_next(struct ath=
11k_ce_pipe *pipe,
>                 goto err;
>         }
>
> +       /* Make sure descriptor is read after the head pointer. */
> +       dma_rmb();
> +
>         *nbytes =3D ath11k_hal_ce_dst_status_get_length(desc);
> -       if (*nbytes =3D=3D 0) {
> -               ret =3D -EIO;
> -               goto err;
> -       }
>
>         *skb =3D pipe->dest_ring->skb[sw_index];
>         pipe->dest_ring->skb[sw_index] =3D NULL;
> @@ -430,8 +429,8 @@ static void ath11k_ce_recv_process_cb(struct ath11k_c=
e_pipe *pipe)
>                 dma_unmap_single(ab->dev, ATH11K_SKB_RXCB(skb)->paddr,
>                                  max_nbytes, DMA_FROM_DEVICE);
>
> -               if (unlikely(max_nbytes < nbytes)) {
> -                       ath11k_warn(ab, "rxed more than expected (nbytes =
%d, max %d)",
> +               if (unlikely(max_nbytes < nbytes || nbytes =3D=3D 0)) {
> +                       ath11k_warn(ab, "unexpected rx length (nbytes %d,=
 max %d)",
>                                     nbytes, max_nbytes);
>                         dev_kfree_skb_any(skb);
>                         continue;
> diff --git a/drivers/net/wireless/ath/ath11k/hal.c b/drivers/net/wireless=
/ath/ath11k/hal.c
> index 61f4b6dd5380..8cb1505a5a0c 100644
> --- a/drivers/net/wireless/ath/ath11k/hal.c
> +++ b/drivers/net/wireless/ath/ath11k/hal.c
> @@ -599,7 +599,7 @@ u32 ath11k_hal_ce_dst_status_get_length(void *buf)
>         struct hal_ce_srng_dst_status_desc *desc =3D buf;
>         u32 len;
>
> -       len =3D FIELD_GET(HAL_CE_DST_STATUS_DESC_FLAGS_LEN, desc->flags);
> +       len =3D FIELD_GET(HAL_CE_DST_STATUS_DESC_FLAGS_LEN, READ_ONCE(des=
c->flags));
>         desc->flags &=3D ~HAL_CE_DST_STATUS_DESC_FLAGS_LEN;
>
>         return len;
> @@ -829,7 +829,7 @@ void ath11k_hal_srng_access_begin(struct ath11k_base =
*ab, struct hal_srng *srng)
>                 srng->u.src_ring.cached_tp =3D
>                         *(volatile u32 *)srng->u.src_ring.tp_addr;
>         } else {
> -               srng->u.dst_ring.cached_hp =3D *srng->u.dst_ring.hp_addr;
> +               srng->u.dst_ring.cached_hp =3D READ_ONCE(*srng->u.dst_rin=
g.hp_addr);
>
>                 /* Try to prefetch the next descriptor in the ring */
>                 if (srng->flags & HAL_SRNG_FLAGS_CACHED)
> --
> 2.48.1
>

Like the others, I was seeing this message multiple times a day, and
on a not so rare occasion it would also take the wifi device offline,
with this patch applied, I do not see that at all here.

Tested-by: Steev Klimaszewski <steev@kali.org>

