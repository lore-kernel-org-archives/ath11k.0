Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 041ABE7717F
	for <ath11k@archiver.kernel.org>; Thu, 12 Dec 2024 19:58:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=es3BFB53+lctNKfs4aUSJijTNGpS8BvQvLSU21bgHvQ=; b=dWghnXjLeXIf0KRzTHNJN401xZ
	pbtAxV3Iwd819niDHapl68vzR1R65xTcUbHnDjLac7RzZVACN5A0UZBHuXIFNlLNIFVASqxbPLjlQ
	FIB6AWm7MoG41+Qk/KelOHGu4dP9UGJDvRiJBXiC+6e6E8cxR+2UTOPmbUfarWvIJNhZvUDsyrIjr
	jbFaD9MLZyTLgDIW4c+sCGCytufM8glK8Uxkj1d9aisJX2N8N3mLhY9FcsIiSwZlHseuhVUpQhEsv
	01QCxLDt7w+mM85dHz9S4BWnyZ4Q1vDGqL18AOFPPrdIemuHESkZRPiIaiEv9garqUi62ET+2pm01
	pOw3r0mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLpK9-00000001irI-2lH4;
	Thu, 12 Dec 2024 19:58:13 +0000
Received: from mail-yw1-x112a.google.com ([2607:f8b0:4864:20::112a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLpK6-00000001ipq-2qAG
	for ath11k@lists.infradead.org;
	Thu, 12 Dec 2024 19:58:11 +0000
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-6ef7f8d4f30so9122567b3.1
        for <ath11k@lists.infradead.org>; Thu, 12 Dec 2024 11:58:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gateworks.com; s=google; t=1734033489; x=1734638289; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=es3BFB53+lctNKfs4aUSJijTNGpS8BvQvLSU21bgHvQ=;
        b=NlO/ShhbLpAdtKkc26qpyNi3Dq6dzrzbHWJK/oTIui+UT99yBMfL05MXl4e18FhWOV
         F9Z8z9HfiD1BQ/z7E/8G9+OH5KP3mG8zbxxjEHVTquaq0gApuXJfvni7pQfoE+q1cFgY
         iQ47PfRlry7HyX9P7HaB8zwYr5FKKy/dcxPQrWdOWwGgF2LcH26kiqvsDeOaKxvoyYkr
         Fr+uRkJSaLh7M8hvqTbr6msIarVdG3DGHjIKqThybfLyDsxy0DGs2e6mfLQzJAO3+sJH
         Jh8dDYYhWXatwZbK0PebKDgl3TAju7WvWSs6vuD9Gos1+pc9xfGPN2ZzwbgAbA5ldNxZ
         EiKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734033489; x=1734638289;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=es3BFB53+lctNKfs4aUSJijTNGpS8BvQvLSU21bgHvQ=;
        b=hmklX8kuzFQG3s8gdFqJkBAaBSXRFORW4ZDPrfAuQ2x7sdasHAWfdAeFWQT5WDLzTz
         j7P+XkhSDAA20ptrCVHMzNOUUg43+LQC5IEhDpU/TRFg9k3tEc950nFClWGjb6jUqzqd
         dDTUMmfDpmxOWmWuI/VtfguHq1+LtOZvL1KVWj+Rj0ZM/r2WvhxhsS0ohIrs0PlS9L43
         yf2lhktmjvXhUEcUtpGrbb3HdNd5jWXAcOjXyeqaxQKtTthgpcEwF3SGp3cnlq/YSv94
         anDKeXrPv+qq534ZKnDy98p627F/0wv0IRhU5EcnjR0jO9zOnWmKmLt7jBJw8FzW52vz
         2jsQ==
X-Forwarded-Encrypted: i=1; AJvYcCXKF+siT0a5pFsMTgigZ++VW0K4TknwapJQrpD9Pk3x71d3Owx3CFiQI5G0/6jhsObHDdpB1pE=@lists.infradead.org
X-Gm-Message-State: AOJu0YylrEofZ7XOYnzMJkCa2mRo2scMDxMbS7RmQQfbfc8GWp7JBMYl
	WuVbgN8Bd7LkHvI0ZVMY7agwGQW5eU2PEuvGMyoAdfZFtIH4xBlWsYQPkI2+KEdV6Y4rvsx30L3
	U53RzDKr9k//JxqxmrTKqnyXs5p6Kc4EeOBIvJg==
X-Gm-Gg: ASbGncuo01ckM2kGZuxHnbLI2W+NOjU7a+Vbr7eaR3ZqRuf9HR6W30li4gkhYC0v7Q7
	TP0cPGPNILOEVAayrdPi2vYnlr+cEUPsoA4GLfg==
X-Google-Smtp-Source: AGHT+IE+lPF/qLoY6pAEypWuIRGNZppvfbzy6XsQEdtFs6bR6IRA8406DPbu63fZQJOWbgOJrMamI9waVwE+nSHCj4A=
X-Received: by 2002:a05:690c:3805:b0:6ef:7312:d06c with SMTP id
 00721157ae682-6f279b2367dmr120167b3.21.1734033488919; Thu, 12 Dec 2024
 11:58:08 -0800 (PST)
MIME-Version: 1.0
References: <CAJ+vNU0EL3T+GyNAbVbGqYYQ5NM3h7cgAwqxxBMuZjh+-YQ3bA@mail.gmail.com>
 <1b2ea8b2-6fbe-4118-b6c6-742c8f0be476@quicinc.com> <CAJ+vNU1-OZ3y4p2L+zf64AiVtUv70yZNqkT20jTxyE0_gJb6Jg@mail.gmail.com>
 <0282be95-9094-4d49-b79e-4f7c976dad00@quicinc.com> <CAJ+vNU32EMHjtchJRb1sODBrUKG2vZW4ZEu1_F0+dCCEjCn7Dg@mail.gmail.com>
 <20241209081714.GA25363@lst.de> <593c0d63-d8fd-4439-a57a-97340212c197@arm.com>
 <CAJ+vNU2ypE_Mn_6iKCmf5LYk9Sth=ryWXyewc5MhOKK8VoAKCA@mail.gmail.com>
 <20241210041133.GA17116@lst.de> <CAJ+vNU03Cqsc+O5anwmvJW8Wfd-06LbDMVHjxVFdixf01ZLczQ@mail.gmail.com>
 <5fe372df-ae51-4a8b-9fa3-a4a0ea2d33e3@quicinc.com> <9b2e8ffa-ba2c-46da-a478-eb1fb44b693e@arm.com>
 <80992ae5-e329-4a34-94c8-9345b2e8a9a0@quicinc.com>
In-Reply-To: <80992ae5-e329-4a34-94c8-9345b2e8a9a0@quicinc.com>
From: Tim Harvey <tharvey@gateworks.com>
Date: Thu, 12 Dec 2024 11:57:57 -0800
Message-ID: <CAJ+vNU1v6JMTcnKhJAPtRu2A-rVjNNUd3MrqAP64EWMiNVuC4g@mail.gmail.com>
Subject: Re: ath11k swiotlb buffer is full (on IMX8M with 4GiB DRAM)
To: Baochen Qiang <quic_bqiang@quicinc.com>
Cc: Robin Murphy <robin.murphy@arm.com>, Christoph Hellwig <hch@lst.de>, ath11k@lists.infradead.org, 
	linux-wireless <linux-wireless@vger.kernel.org>, Fabio Estevam <festevam@gmail.com>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, iommu@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_115810_719852_22213B74 
X-CRM114-Status: GOOD (  35.97  )
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

On Wed, Dec 11, 2024 at 9:24=E2=80=AFPM Baochen Qiang <quic_bqiang@quicinc.=
com> wrote:
>
>
>
> On 12/11/2024 9:44 PM, Robin Murphy wrote:
> > On 2024-12-11 2:31 am, Baochen Qiang wrote:
> >>
> >>
> >> On 12/11/2024 7:06 AM, Tim Harvey wrote:
> >>> On Mon, Dec 9, 2024 at 8:11=E2=80=AFPM Christoph Hellwig <hch@lst.de>=
 wrote:
> >>>>
> >>>> On Mon, Dec 09, 2024 at 11:15:02AM -0800, Tim Harvey wrote:
> >>>>> After a lot of back and forth and investigation this is due to the
> >>>>> IMX8M SoC's not having an IOMMU thus swiotlb is being used and ath1=
1k
> >>>>> is requesting some buffers that are too large for swiotlb to provid=
e.
> >>>>> There is a specific patch which added the HAL_WBM2SW_RELEASE buffer=
s
> >>>>> to cacheable memory that could be reverted to fix this but the conc=
ern
> >>>>> was that it would impact performance moving those buffers to
> >>>>> non-cacheable memory (there are three ~1MiB buffers being allocated=
):
> >>>>> commit d0e2523bfa9cb ("ath11k: allocate HAL_WBM2SW_RELEASE ring fro=
m
> >>>>> cacheable memory").
> >>>>
> >>>> The combination of "buffers" and "swiotlb" sounds like Robin was rig=
ht
> >>>> below.
> >>>>
> >>>>> The chain of events as best I can tell are:
> >>>>>
> >>>>> commit 6452f0a3d565 ("ath11k: allocate dst ring descriptors from
> >>>>> cacheable memory")
> >>>>> - Nov 12 2021 (made it into Linux 5.17)
> >>>>> - changes allocation of reo_dst rings to cacheable memory to allow
> >>>>> cached descriptor access to optimize CPU usage
> >>>>> - this is flawed because it uses virt_to_phys() to allocate cacheab=
le
> >>>>> memory which does not work on systems with an IOMMU enabled or usin=
g
> >>>>> software IOMMU (swiotlb); this causes a kernel crash on client
> >>>>> association
> >>>>
> >>>> And this is where it started to take a wrong turn, that everyhing
> >>>> later basically made worse.  If you have long living and potentially
> >>>> large DMA allocations, you need to use dma_alloc_* interfaces.
> >>>>
> >>>> 5.17 already had dma_alloc_pages for quite a while which was and sti=
ll is
> >>>> the proper interface to use.  For much older kernel you'd be stuck
> >>>> with dma_alloc_noncoherent or dma_alloc_attrs with the right flag,
> >>>> but even that would have been much better.
> >>>
> >>> Christoph,
> >>>
> >>> I'm not clear what you are suggesting be done here. Are you suggestin=
g
> >>> that ath11k has been using the wrong mechanism by calling
> >>> dma_map_single for cached DMA buffers? I'm not all that familiar with
> >>> ath11k so I can't tell what buffers are considered long living.
> >>
> >> those buffers are allocated when driver load and freed when driver unl=
oad, so IMO they are
> >> long living.
> >
> > The point is that if this driver wants a notion of "cached DMA buffers"=
, then it should
> > allocate such buffers the proper way, not try to reinvent it badly. Tha=
t means using
> > dma_alloc_pages(), or modern dma_alloc_noncoherent() which is essential=
ly the same thing
> > but with the dma_map_page() call automatically done for you as well.
>
> yeah, you are right, Robin. didn't know there are convenient interfaces l=
ike these already.
>
> Tim, can you work out a patch then?
>

How about:

diff --git a/drivers/net/wireless/ath/ath11k/dp.c
b/drivers/net/wireless/ath/ath11k/dp.c
index fbf666d0ecf1..557e06187e95 100644
--- a/drivers/net/wireless/ath/ath11k/dp.c
+++ b/drivers/net/wireless/ath/ath11k/dp.c
@@ -105,9 +105,8 @@ void ath11k_dp_srng_cleanup(struct ath11k_base
*ab, struct dp_srng *ring)
                return;

        if (ring->cached) {
-               dma_unmap_single(ab->dev, ring->paddr_unaligned, ring->size=
,
-                                DMA_FROM_DEVICE);
-               kfree(ring->vaddr_unaligned);
+               dma_free_noncoherent(ab->dev, ring->size, ring->vaddr_unali=
gned,
+                                    ring->paddr_unaligned, DMA_FROM_DEVICE=
);
        } else {
                dma_free_coherent(ab->dev, ring->size, ring->vaddr_unaligne=
d,
                                  ring->paddr_unaligned);
@@ -249,28 +248,18 @@ int ath11k_dp_srng_setup(struct ath11k_base *ab,
struct dp_srng *ring,
                default:
                        cached =3D false;
                }
-
-               if (cached) {
-                       ring->vaddr_unaligned =3D kzalloc(ring->size, GFP_K=
ERNEL);
-                       if (!ring->vaddr_unaligned)
-                               return -ENOMEM;
-
-                       ring->paddr_unaligned =3D dma_map_single(ab->dev,
-
ring->vaddr_unaligned,
-                                                              ring->size,
-                                                              DMA_FROM_DEV=
ICE);
-                       if (dma_mapping_error(ab->dev, ring->paddr_unaligne=
d)) {
-                               kfree(ring->vaddr_unaligned);
-                               ring->vaddr_unaligned =3D NULL;
-                               return -ENOMEM;
-                       }
-               }
        }

-       if (!cached)
+       if (cached) {
+               ring->vaddr_unaligned =3D dma_alloc_noncoherent(ab->dev,
ring->size,
+
&ring->paddr_unaligned,
+                                                             DMA_FROM_DEVI=
CE,
+                                                             GFP_KERNEL);
+       } else {
                ring->vaddr_unaligned =3D dma_alloc_coherent(ab->dev, ring-=
>size,

&ring->paddr_unaligned,
                                                           GFP_KERNEL);
+       }

        if (!ring->vaddr_unaligned)
                return -ENOMEM;

If this is what we are talking about here I can submit that with a
proper commit log. Note there are a lot of other calls to
dma_map_single in the ath drivers and my understanding is those may be
just fine for small short-lived buffers but I'm not clear if that is
what they are always used for.

Best Regards,

Tim

> >
> > Thanks,
> > Robin.
>

