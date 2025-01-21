Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7669EC0218E
	for <ath11k@archiver.kernel.org>; Tue, 21 Jan 2025 17:27:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XU/S9Sk4m3Cf1n01L5292fNIPyUryfbIotTDKW9l8eY=; b=dw8kVw9YHdYlg2lxVPam6HrJoQ
	W2gyl7bKABKybZdNL4cQgdpGNEb5KxvwZmMVoKbDD0hNa7wlmXY4Dm/RV4gWk5quLScXMmighWNJc
	mMIg6R1Fy8OjI+aDlZRNkCNMr05LAdOiFf56sKvrgtHLmbGIFzRnyIcdeFek7h/LopQvkNnborqPo
	fKJDodiXfS4jqq2c44xkcH6Fo4mbnW49VZrsFiFdYz1ea1SamsfrrujinJ3TX2iAENzcJrfeG47ts
	vvjDzuQjigh5GHK7EP+hALDyfBj2M7GL1JHlbd427zhVJ1Rc9M62wPahTMv9UoELMDXraoodvMa9l
	N+payNeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taI2b-00000008TT9-0uh7;
	Tue, 21 Jan 2025 17:27:53 +0000
Received: from mail-yb1-xb29.google.com ([2607:f8b0:4864:20::b29])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taI1Y-00000008TKV-3aAs
	for ath11k@lists.infradead.org;
	Tue, 21 Jan 2025 17:26:49 +0000
Received: by mail-yb1-xb29.google.com with SMTP id 3f1490d57ef6-e5773c5901aso10807467276.1
        for <ath11k@lists.infradead.org>; Tue, 21 Jan 2025 09:26:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gateworks.com; s=google; t=1737480408; x=1738085208; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XU/S9Sk4m3Cf1n01L5292fNIPyUryfbIotTDKW9l8eY=;
        b=F1ZO0ZppTBeg15QetoXcdY3h/hRlNqzkOyaAgjdm2TBT/aXxp4k6LqpsLFZJsFFHWz
         UClVhSYFrChTismtYoXk+Xb42srr+ONkUPtResxmjl0LTg4N14WYct84OjxBZKVWinSg
         8HOslXVcm4+QOKOYdynTZ9tW+S2PPtvk/sGIzTs3W5/rmgY9BWqh/kb4woVMlycGAPOy
         YFh/zZfpHA22FlZsj5mYks/xVEYJzCnpepEe0L93AjFERjYDU+mROW1NYYulGaI/rZRa
         inF3+/OKCjGyI+IpB85l5L3uB6Jx9EiP4FcBfDqUjB8WfSIWQuSqKqLGDsEWnU83sq8h
         PD/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737480408; x=1738085208;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XU/S9Sk4m3Cf1n01L5292fNIPyUryfbIotTDKW9l8eY=;
        b=NcLcwRDI/dSEvIj0VbXz6drZX5/m0Lc4znxHWO5Ww6tg0IOBua4OoUJPL1a9VRZjpD
         o46vIEeg5Jd7fyDYxkuD579R9BuL+4Bb1dVGc1YRgAKY/nQ9knVGsZbjzZFNn9fnJuns
         xAmpwq20WPfnRUqqF78sR44VyHecLh5JC9E9JK60ZRtkoQRT731H+Im41mX+vQ5FBhsV
         F4oCdig7xDq6+whiJscaCCheKosJVhrvcNjrGgIx1aSjTFhfDu1Y/2kRfcZqPL18MTn+
         SNQugkf5vI1k/DQuUAoTt7fZVQa5LK98RyFGndNf9SEeCbSStweG0culj6WjbpGz1EXb
         20yQ==
X-Gm-Message-State: AOJu0YwMJP58WlIDaHrlawrYf2kzeJDdyGtBKb8GbazByGu3wKU+bVYt
	CFh+LKSLgwKaH/RIr2gl7IDrZU9g7uQ3P2ozhSN9v0epN9xTHQDOToIp1vpwff4XWU4JlaVuj53
	8kVY1PTS0U8Gw831lIE5Xw6znOZMCldjb6hN7Vg==
X-Gm-Gg: ASbGncsro3BUHhdktltAt9yaDSjB+HmlsvFIAOlPGDEqeEgvb0bU92kbIrcMSN3V3VC
	IPrtaLT95kU/39qHSD99TsKWkBOQ7v48Mx2d88U/6T+MUftRmbXw=
X-Google-Smtp-Source: AGHT+IFd+gQREMHIvmFV2ABqWuaQze36LJac8HuI3AKKMlj9TsP1Mn9ZzCv+ubSsFiiVOFtV8rpoSb8WeDuDgZ70Nz8=
X-Received: by 2002:a05:690c:9a03:b0:6f0:23c9:2989 with SMTP id
 00721157ae682-6f6eb6b7e9amr136374417b3.11.1737480407727; Tue, 21 Jan 2025
 09:26:47 -0800 (PST)
MIME-Version: 1.0
References: <20250119164219.647059-1-quic_ppranees@quicinc.com> <20250119164219.647059-3-quic_ppranees@quicinc.com>
In-Reply-To: <20250119164219.647059-3-quic_ppranees@quicinc.com>
From: Tim Harvey <tharvey@gateworks.com>
Date: Tue, 21 Jan 2025 09:26:36 -0800
X-Gm-Features: AbW1kvY37jZxQhLj0pk5NfHgGJvx3igq3RoIAPWuvZN3v5GGeaYgIFT3UVgPnfc
Message-ID: <CAJ+vNU2HR2=7i4yocQqKf2Ce8bap1fAaKYC3QxNwD5h-Z9PbAQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] wifi: ath11k: Use dma_alloc_noncoherent for rx_tid
 buffer allocation
To: P Praneesh <quic_ppranees@quicinc.com>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250121_092648_899872_254D29CD 
X-CRM114-Status: GOOD (  24.28  )
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

On Sun, Jan 19, 2025 at 8:42=E2=80=AFAM P Praneesh <quic_ppranees@quicinc.c=
om> wrote:
>
> Currently, the driver allocates cacheable DMA buffers for the rx_tid
> structure using kzalloc() and dma_map_single(). These buffers are
> long-lived and can persist for the lifetime of the peer, which is not
> advisable. Instead of using kzalloc() and dma_map_single() for allocating
> cacheable DMA buffers, utilize the dma_alloc_noncoherent() helper for the
> allocation of long-lived cacheable DMA buffers, such as the peer's rx_tid=
.
> Since dma_alloc_noncoherent() returns unaligned physical and virtual
> addresses, align them internally before use within the driver. This
> ensures proper allocation of non-coherent memory through the kernel
> helper.
>
> Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.7.0.1-01744-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ=
_LITE-3
>
> Signed-off-by: P Praneesh <quic_ppranees@quicinc.com>
> ---
>  drivers/net/wireless/ath/ath11k/dp.h    |   6 +-
>  drivers/net/wireless/ath/ath11k/dp_rx.c | 117 +++++++++++-------------
>  2 files changed, 58 insertions(+), 65 deletions(-)
>
> diff --git a/drivers/net/wireless/ath/ath11k/dp.h b/drivers/net/wireless/=
ath/ath11k/dp.h
> index f777314db8b3..7a55afd33be8 100644
> --- a/drivers/net/wireless/ath/ath11k/dp.h
> +++ b/drivers/net/wireless/ath/ath11k/dp.h
> @@ -1,7 +1,7 @@
>  /* SPDX-License-Identifier: BSD-3-Clause-Clear */
>  /*
>   * Copyright (c) 2018-2019 The Linux Foundation. All rights reserved.
> - * Copyright (c) 2021-2023 Qualcomm Innovation Center, Inc. All rights r=
eserved.
> + * Copyright (c) 2021-2023, 2025 Qualcomm Innovation Center, Inc. All ri=
ghts reserved.
>   */
>
>  #ifndef ATH11K_DP_H
> @@ -20,7 +20,6 @@ struct ath11k_ext_irq_grp;
>
>  struct dp_rx_tid {
>         u8 tid;
> -       u32 *vaddr;
>         dma_addr_t paddr;
>         u32 size;
>         u32 ba_win_sz;
> @@ -37,6 +36,9 @@ struct dp_rx_tid {
>         /* Timer info related to fragments */
>         struct timer_list frag_timer;
>         struct ath11k_base *ab;
> +       u32 *vaddr_unaligned;
> +       dma_addr_t paddr_unaligned;
> +       u32 unaligned_size;
>  };
>
>  #define DP_REO_DESC_FREE_THRESHOLD  64
> diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wirele=
ss/ath/ath11k/dp_rx.c
> index 029ecf51c9ef..5e71e5d9ecb7 100644
> --- a/drivers/net/wireless/ath/ath11k/dp_rx.c
> +++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
> @@ -1,7 +1,7 @@
>  // SPDX-License-Identifier: BSD-3-Clause-Clear
>  /*
>   * Copyright (c) 2018-2019 The Linux Foundation. All rights reserved.
> - * Copyright (c) 2021-2024 Qualcomm Innovation Center, Inc. All rights r=
eserved.
> + * Copyright (c) 2021-2025 Qualcomm Innovation Center, Inc. All rights r=
eserved.
>   */
>
>  #include <linux/ieee80211.h>
> @@ -675,11 +675,11 @@ void ath11k_dp_reo_cmd_list_cleanup(struct ath11k_b=
ase *ab)
>         list_for_each_entry_safe(cmd, tmp, &dp->reo_cmd_list, list) {
>                 list_del(&cmd->list);
>                 rx_tid =3D &cmd->data;
> -               if (rx_tid->vaddr) {
> -                       dma_unmap_single(ab->dev, rx_tid->paddr,
> -                                        rx_tid->size, DMA_BIDIRECTIONAL)=
;
> -                       kfree(rx_tid->vaddr);
> -                       rx_tid->vaddr =3D NULL;
> +               if (rx_tid->vaddr_unaligned) {
> +                       dma_free_noncoherent(ab->dev, rx_tid->unaligned_s=
ize,
> +                                            rx_tid->vaddr_unaligned,
> +                                            rx_tid->paddr_unaligned, DMA=
_BIDIRECTIONAL);
> +                       rx_tid->vaddr_unaligned =3D NULL;
>                 }
>                 kfree(cmd);
>         }
> @@ -689,11 +689,11 @@ void ath11k_dp_reo_cmd_list_cleanup(struct ath11k_b=
ase *ab)
>                 list_del(&cmd_cache->list);
>                 dp->reo_cmd_cache_flush_count--;
>                 rx_tid =3D &cmd_cache->data;
> -               if (rx_tid->vaddr) {
> -                       dma_unmap_single(ab->dev, rx_tid->paddr,
> -                                        rx_tid->size, DMA_BIDIRECTIONAL)=
;
> -                       kfree(rx_tid->vaddr);
> -                       rx_tid->vaddr =3D NULL;
> +               if (rx_tid->vaddr_unaligned) {
> +                       dma_free_noncoherent(ab->dev, rx_tid->unaligned_s=
ize,
> +                                            rx_tid->vaddr_unaligned,
> +                                            rx_tid->paddr_unaligned, DMA=
_BIDIRECTIONAL);
> +                       rx_tid->vaddr_unaligned =3D NULL;
>                 }
>                 kfree(cmd_cache);
>         }
> @@ -708,11 +708,11 @@ static void ath11k_dp_reo_cmd_free(struct ath11k_dp=
 *dp, void *ctx,
>         if (status !=3D HAL_REO_CMD_SUCCESS)
>                 ath11k_warn(dp->ab, "failed to flush rx tid hw desc, tid =
%d status %d\n",
>                             rx_tid->tid, status);
> -       if (rx_tid->vaddr) {
> -               dma_unmap_single(dp->ab->dev, rx_tid->paddr, rx_tid->size=
,
> -                                DMA_BIDIRECTIONAL);
> -               kfree(rx_tid->vaddr);
> -               rx_tid->vaddr =3D NULL;
> +       if (rx_tid->vaddr_unaligned) {
> +               dma_free_noncoherent(dp->ab->dev, rx_tid->unaligned_size,
> +                                    rx_tid->vaddr_unaligned,
> +                                    rx_tid->paddr_unaligned, DMA_BIDIREC=
TIONAL);
> +               rx_tid->vaddr_unaligned =3D NULL;
>         }
>  }
>
> @@ -749,10 +749,10 @@ static void ath11k_dp_reo_cache_flush(struct ath11k=
_base *ab,
>         if (ret) {
>                 ath11k_err(ab, "failed to send HAL_REO_CMD_FLUSH_CACHE cm=
d, tid %d (%d)\n",
>                            rx_tid->tid, ret);
> -               dma_unmap_single(ab->dev, rx_tid->paddr, rx_tid->size,
> -                                DMA_BIDIRECTIONAL);
> -               kfree(rx_tid->vaddr);
> -               rx_tid->vaddr =3D NULL;
> +               dma_free_noncoherent(ab->dev, rx_tid->unaligned_size,
> +                                    rx_tid->vaddr_unaligned,
> +                                    rx_tid->paddr_unaligned, DMA_BIDIREC=
TIONAL);
> +               rx_tid->vaddr_unaligned =3D NULL;
>         }
>  }
>
> @@ -802,10 +802,10 @@ static void ath11k_dp_rx_tid_del_func(struct ath11k=
_dp *dp, void *ctx,
>
>         return;
>  free_desc:
> -       dma_unmap_single(ab->dev, rx_tid->paddr, rx_tid->size,
> -                        DMA_BIDIRECTIONAL);
> -       kfree(rx_tid->vaddr);
> -       rx_tid->vaddr =3D NULL;
> +       dma_free_noncoherent(ab->dev, rx_tid->unaligned_size,
> +                            rx_tid->vaddr_unaligned,
> +                            rx_tid->paddr_unaligned, DMA_BIDIRECTIONAL);
> +       rx_tid->vaddr_unaligned =3D NULL;
>  }
>
>  void ath11k_peer_rx_tid_delete(struct ath11k *ar,
> @@ -831,14 +831,16 @@ void ath11k_peer_rx_tid_delete(struct ath11k *ar,
>                 if (ret !=3D -ESHUTDOWN)
>                         ath11k_err(ar->ab, "failed to send HAL_REO_CMD_UP=
DATE_RX_QUEUE cmd, tid %d (%d)\n",
>                                    tid, ret);
> -               dma_unmap_single(ar->ab->dev, rx_tid->paddr, rx_tid->size=
,
> -                                DMA_BIDIRECTIONAL);
> -               kfree(rx_tid->vaddr);
> -               rx_tid->vaddr =3D NULL;
> +               dma_free_noncoherent(ar->ab->dev, rx_tid->unaligned_size,
> +                                    rx_tid->vaddr_unaligned,
> +                                    rx_tid->paddr_unaligned, DMA_BIDIREC=
TIONAL);
> +               rx_tid->vaddr_unaligned =3D NULL;
>         }
>
>         rx_tid->paddr =3D 0;
> +       rx_tid->paddr_unaligned =3D 0;
>         rx_tid->size =3D 0;
> +       rx_tid->unaligned_size =3D 0;
>  }
>
>  static int ath11k_dp_rx_link_desc_return(struct ath11k_base *ab,
> @@ -982,10 +984,9 @@ static void ath11k_dp_rx_tid_mem_free(struct ath11k_=
base *ab,
>         if (!rx_tid->active)
>                 goto unlock_exit;
>
> -       dma_unmap_single(ab->dev, rx_tid->paddr, rx_tid->size,
> -                        DMA_BIDIRECTIONAL);
> -       kfree(rx_tid->vaddr);
> -       rx_tid->vaddr =3D NULL;
> +       dma_free_noncoherent(ab->dev, rx_tid->unaligned_size, rx_tid->vad=
dr_unaligned,
> +                            rx_tid->paddr_unaligned, DMA_BIDIRECTIONAL);
> +       rx_tid->vaddr_unaligned =3D NULL;
>
>         rx_tid->active =3D false;
>
> @@ -1000,9 +1001,8 @@ int ath11k_peer_rx_tid_setup(struct ath11k *ar, con=
st u8 *peer_mac, int vdev_id,
>         struct ath11k_base *ab =3D ar->ab;
>         struct ath11k_peer *peer;
>         struct dp_rx_tid *rx_tid;
> -       u32 hw_desc_sz;
> -       u32 *addr_aligned;
> -       void *vaddr;
> +       u32 hw_desc_sz, *vaddr;
> +       void *vaddr_unaligned;
>         dma_addr_t paddr;
>         int ret;
>
> @@ -1050,49 +1050,40 @@ int ath11k_peer_rx_tid_setup(struct ath11k *ar, c=
onst u8 *peer_mac, int vdev_id,
>         else
>                 hw_desc_sz =3D ath11k_hal_reo_qdesc_size(DP_BA_WIN_SZ_MAX=
, tid);
>
> -       vaddr =3D kzalloc(hw_desc_sz + HAL_LINK_DESC_ALIGN - 1, GFP_ATOMI=
C);
> -       if (!vaddr) {
> +       rx_tid->unaligned_size =3D hw_desc_sz + HAL_LINK_DESC_ALIGN - 1;
> +       vaddr_unaligned =3D dma_alloc_noncoherent(ab->dev, rx_tid->unalig=
ned_size, &paddr,
> +                                               DMA_BIDIRECTIONAL, GFP_AT=
OMIC);
> +       if (!vaddr_unaligned) {
>                 spin_unlock_bh(&ab->base_lock);
>                 return -ENOMEM;
>         }
>
> -       addr_aligned =3D PTR_ALIGN(vaddr, HAL_LINK_DESC_ALIGN);
> -
> -       ath11k_hal_reo_qdesc_setup(addr_aligned, tid, ba_win_sz,
> -                                  ssn, pn_type);
> -
> -       paddr =3D dma_map_single(ab->dev, addr_aligned, hw_desc_sz,
> -                              DMA_BIDIRECTIONAL);
> -
> -       ret =3D dma_mapping_error(ab->dev, paddr);
> -       if (ret) {
> -               spin_unlock_bh(&ab->base_lock);
> -               ath11k_warn(ab, "failed to setup dma map for peer %pM rx =
tid %d: %d\n",
> -                           peer_mac, tid, ret);
> -               goto err_mem_free;
> -       }
> -
> -       rx_tid->vaddr =3D vaddr;
> -       rx_tid->paddr =3D paddr;
> +       rx_tid->vaddr_unaligned =3D vaddr_unaligned;
> +       vaddr =3D PTR_ALIGN(vaddr_unaligned, HAL_LINK_DESC_ALIGN);
> +       rx_tid->paddr_unaligned =3D paddr;
> +       rx_tid->paddr =3D rx_tid->paddr_unaligned + ((unsigned long)vaddr=
 -
> +                       (unsigned long)rx_tid->vaddr_unaligned);
> +       ath11k_hal_reo_qdesc_setup(vaddr, tid, ba_win_sz, ssn, pn_type);
>         rx_tid->size =3D hw_desc_sz;
>         rx_tid->active =3D true;
>
> +       /* After dma_alloc_noncoherent, vaddr is being modified for reo q=
desc setup.
> +        * Since these changes are not reflected in the device, driver no=
w needs to
> +        * explicitly call dma_sync_single_for_device.
> +        */
> +       dma_sync_single_for_device(ab->dev, rx_tid->paddr,
> +                                  rx_tid->size,
> +                                  DMA_TO_DEVICE);
>         spin_unlock_bh(&ab->base_lock);
>
> -       ret =3D ath11k_wmi_peer_rx_reorder_queue_setup(ar, vdev_id, peer_=
mac,
> -                                                    paddr, tid, 1, ba_wi=
n_sz);
> +       ret =3D ath11k_wmi_peer_rx_reorder_queue_setup(ar, vdev_id, peer_=
mac, rx_tid->paddr,
> +                                                    tid, 1, ba_win_sz);
>         if (ret) {
>                 ath11k_warn(ar->ab, "failed to setup rx reorder queue for=
 peer %pM tid %d: %d\n",
>                             peer_mac, tid, ret);
>                 ath11k_dp_rx_tid_mem_free(ab, peer_mac, vdev_id, tid);
>         }
>
> -       return ret;
> -
> -err_mem_free:
> -       kfree(rx_tid->vaddr);
> -       rx_tid->vaddr =3D NULL;
> -
>         return ret;
>  }
>
> --
> 2.34.1
>

I tested this with qcn9074 on an imx8mm (no iommu) with 4GiB DRAM and
verified swiotlb was not being used and infrastructure mode worked
fine.

Tested-By: Tim Harvey <tharvey@gateworks.com>

Best regards,

Tim

