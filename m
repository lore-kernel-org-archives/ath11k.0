Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F65BC02182
	for <ath11k@archiver.kernel.org>; Tue, 21 Jan 2025 17:27:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cZp+12xKP21ZFL3cBiPy0Qk2QS0v25Vmx1pqZJpeMtM=; b=hzegE83Bfo/ZVUsZmGurFn1SR7
	QwakXyogXHU5llArHHg/f+62OZ5JehUXB5NXpc2prVlxTludxR9lcN1XlYlorqDEfhf5tivVlahX7
	cFdqUkN2+KO5Unrx8q331Cu09nfFP1P045XTrgxJyk181nnxgF6zXy+SwUe3UHvLM5ceZ4NDafMxL
	DFQsD8n1hs2iec8Xhg9i8P6bB7bZbm0iJ4fq1Gtn7A+StTsv1Sl/aHTDk6gpXlvJnRch/OpVmlQnF
	A9PspWdPDnLZ6KfUJVbpf1tGxO/qPR/hosoHWBfDllhOibZAMYK8HBCR8FqcGhloTOOx+LSOT7WwK
	M6DzRWug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taI2Z-00000008TS3-4AHq;
	Tue, 21 Jan 2025 17:27:51 +0000
Received: from mail-yb1-xb2a.google.com ([2607:f8b0:4864:20::b2a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taI0k-00000008TFN-3N2u
	for ath11k@lists.infradead.org;
	Tue, 21 Jan 2025 17:26:00 +0000
Received: by mail-yb1-xb2a.google.com with SMTP id 3f1490d57ef6-e455bf1f4d3so8144971276.2
        for <ath11k@lists.infradead.org>; Tue, 21 Jan 2025 09:25:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gateworks.com; s=google; t=1737480358; x=1738085158; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cZp+12xKP21ZFL3cBiPy0Qk2QS0v25Vmx1pqZJpeMtM=;
        b=RJB1SMiRW9xpZZDMgZUmSfNEtGoiUKACBqW2E3QgL0rOw6BEkOMQBkmBq5twaa5G/U
         cURfQz6ylvEWAk8XJoJp4HhA3eu2WwWHMHRoi3Vn0gfGsPkWnz5fxnPUq2glxNLMvUh/
         eVvl/8bMLfaCb7wJDcvkqbcb7DJ9O77J9gJAuGvXvcPgwnn27b34G8tpeCRY0vgsMayj
         uQUxoEMZfub8kVnZN4cWdQR1jhmq4h8uy1E8DVZcGs3hiw+Ja9NpTwe3bEQ8Ojz+YgD0
         z8/L0AnZvmf8ITR+WIsogepQKGsPO4YAqame7gILGQnwTRLBUcCN8HjQbpAgldPa3JmL
         vbcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737480358; x=1738085158;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cZp+12xKP21ZFL3cBiPy0Qk2QS0v25Vmx1pqZJpeMtM=;
        b=TJ5utd13f+Sp5IBXi40u3TXQC3v7F07SAJrjRi7oyFmjaJxw3myDl4lSc4KU/4ndzY
         l0jyEj4VeL1FgoQ246B4EchVp3pynaXof/NjhfoOx+LY57P15mdwERDeIytPptNXLzgy
         OgTy+UqUUlg4p2AX+KmksXzkmBDA8tvZSMd4XSxeYBJtlPMmQ6IbvLCb96lthUQNrLym
         1g2BGFq7Vaau9xSzqpnexEw1yEJrz+J8618/RlLB60F/DyesStLc8AKLzXFE1hNtH2xq
         xWYj0IX9iKk3321ZxSUZKzWRzFmLn477L0h/5GgHZ84c5dyrMGgCPORWiHer2eRt+ikd
         7+2g==
X-Gm-Message-State: AOJu0YzP9c34FPBbAMg8pBbPCB27NSJh1Gb8Ox3N/0NirsvpyK4IUgzs
	+LDSXrdgI6mkHHO0DYUhq4tHbTx7rqK/Xjahq2IAFfLiU0hCEY2uD6EkAlh/g4JJS2KmZWZ8dZ5
	z0L7kvH8v/vTFWSOQgZZB1zEyeic5utyJQqAZqRVqNHChfmJi/xs=
X-Gm-Gg: ASbGnct2D3k2DqtMbM8/GFGQkB7R4DeavrNdKq2yPrJYrRWiy4QJ04vgOjKjd80mRQg
	8br+woAL646uO/N8atC0defiul1XaTXNwTnT30GzCVlt8pnMmZmw=
X-Google-Smtp-Source: AGHT+IEX1pKh9G84uwoaF3TqQpxgmY7OnnF45ZehTheO7LEqcZCsVe/VzASXMGnKB75TYtJraGnR5I94fz1agsyNSdc=
X-Received: by 2002:a05:690c:4b12:b0:6f6:7ef2:fe6c with SMTP id
 00721157ae682-6f6eb93f6f7mr150917467b3.37.1737480357673; Tue, 21 Jan 2025
 09:25:57 -0800 (PST)
MIME-Version: 1.0
References: <20250119164219.647059-1-quic_ppranees@quicinc.com> <20250119164219.647059-2-quic_ppranees@quicinc.com>
In-Reply-To: <20250119164219.647059-2-quic_ppranees@quicinc.com>
From: Tim Harvey <tharvey@gateworks.com>
Date: Tue, 21 Jan 2025 09:25:46 -0800
X-Gm-Features: AbW1kvZt9ZPqjB0BdpQkRL5KgHpWGtbyJj2SAQ_Ua2QqTrkqbigoGJLir67evL4
Message-ID: <CAJ+vNU01rQM8uvZxSDuMP91nLFovtNZXRvCPpunt2MrjK+8uRA@mail.gmail.com>
Subject: Re: [PATCH 1/2] wifi: ath11k: Fix DMA buffer allocation to resolve
 SWIOTLB issues
To: P Praneesh <quic_ppranees@quicinc.com>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250121_092558_843617_04F70A60 
X-CRM114-Status: GOOD (  21.44  )
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
> Currently, the driver allocates cacheable DMA buffers for rings like
> HAL_REO_DST and HAL_WBM2SW_RELEASE. The buffers for HAL_WBM2SW_RELEASE
> are large (1024 KiB), exceeding the SWIOTLB slot size of 256 KiB. This
> leads to "swiotlb buffer is full" error messages on systems without an
> IOMMU that use SWIOTLB, causing driver initialization failures. The drive=
r
> calls dma_map_single() with these large buffers obtained from kzalloc(),
> resulting in ring initialization errors on systems without an IOMMU that
> use SWIOTLB.
>
> To address these issues, replace the flawed buffer allocation mechanism
> with the appropriate DMA API. Specifically, use dma_alloc_noncoherent()
> for cacheable DMA buffers, ensuring proper freeing of buffers with
> dma_free_noncoherent().
>
> Error log:
> [   10.194343] ath11k_pci 0000:04:00.0: swiotlb buffer is full (sz:104858=
3 bytes), total 32768 (slots), used 2529 (slots)
> [   10.194406] ath11k_pci 0000:04:00.0: failed to set up tcl_comp ring (0=
) :-12
> [   10.194781] ath11k_pci 0000:04:00.0: failed to init DP: -12
>
> Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.7.0.1-01744-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ=
_LITE-3
>
> Reported-by: Tim Harvey <tharvey@gateworks.com>
> Closes: https://lore.kernel.org/all/20241210041133.GA17116@lst.de/
> Signed-off-by: P Praneesh <quic_ppranees@quicinc.com>
> ---
>  drivers/net/wireless/ath/ath11k/dp.c | 35 +++++++++-------------------
>  1 file changed, 11 insertions(+), 24 deletions(-)
>
> diff --git a/drivers/net/wireless/ath/ath11k/dp.c b/drivers/net/wireless/=
ath/ath11k/dp.c
> index fbf666d0ecf1..f124b7329e1a 100644
> --- a/drivers/net/wireless/ath/ath11k/dp.c
> +++ b/drivers/net/wireless/ath/ath11k/dp.c
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
>  #include <crypto/hash.h>
> @@ -104,14 +104,12 @@ void ath11k_dp_srng_cleanup(struct ath11k_base *ab,=
 struct dp_srng *ring)
>         if (!ring->vaddr_unaligned)
>                 return;
>
> -       if (ring->cached) {
> -               dma_unmap_single(ab->dev, ring->paddr_unaligned, ring->si=
ze,
> -                                DMA_FROM_DEVICE);
> -               kfree(ring->vaddr_unaligned);
> -       } else {
> +       if (ring->cached)
> +               dma_free_noncoherent(ab->dev, ring->size, ring->vaddr_una=
ligned,
> +                                    ring->paddr_unaligned, DMA_FROM_DEVI=
CE);
> +       else
>                 dma_free_coherent(ab->dev, ring->size, ring->vaddr_unalig=
ned,
>                                   ring->paddr_unaligned);
> -       }
>
>         ring->vaddr_unaligned =3D NULL;
>  }
> @@ -249,25 +247,14 @@ int ath11k_dp_srng_setup(struct ath11k_base *ab, st=
ruct dp_srng *ring,
>                 default:
>                         cached =3D false;
>                 }
> -
> -               if (cached) {
> -                       ring->vaddr_unaligned =3D kzalloc(ring->size, GFP=
_KERNEL);
> -                       if (!ring->vaddr_unaligned)
> -                               return -ENOMEM;
> -
> -                       ring->paddr_unaligned =3D dma_map_single(ab->dev,
> -                                                              ring->vadd=
r_unaligned,
> -                                                              ring->size=
,
> -                                                              DMA_FROM_D=
EVICE);
> -                       if (dma_mapping_error(ab->dev, ring->paddr_unalig=
ned)) {
> -                               kfree(ring->vaddr_unaligned);
> -                               ring->vaddr_unaligned =3D NULL;
> -                               return -ENOMEM;
> -                       }
> -               }
>         }
>
> -       if (!cached)
> +       if (cached)
> +               ring->vaddr_unaligned =3D dma_alloc_noncoherent(ab->dev, =
ring->size,
> +                                                             &ring->padd=
r_unaligned,
> +                                                             DMA_FROM_DE=
VICE,
> +                                                             GFP_KERNEL)=
;
> +       else
>                 ring->vaddr_unaligned =3D dma_alloc_coherent(ab->dev, rin=
g->size,
>                                                            &ring->paddr_u=
naligned,
>                                                            GFP_KERNEL);
> --
> 2.34.1
>

Thanks, this resolves the issue I reported. I tested this with qcn9074
on an imx8mm (no iommu) with 4GiB DRAM and verified swiotlb was not
being used and infrastructure mode worked fine.

Tested-By: Tim Harvey <tharvey@gateworks.com>

Best regards,

Tim

