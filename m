Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4335E77180
	for <ath11k@archiver.kernel.org>; Tue, 10 Dec 2024 23:06:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UqT6g0W8wBftvp6aSxR69K7dIiruVpolHF6yT66BzYA=; b=tuPdNgnCHwqEh500RPKx+fj+f4
	0T6sOQD2CyeIyF1mn2XJ1mFkjmW7aq4jBRzcgBGA3IwZmafPIGfef1JI2NbBHe68YTK2rq1h0xjVQ
	cP0oL7Zj9h77unnpgthhBhaKFngo8tH2TWpdgsGFrh9WhQIKevaC4tU0Ec3hyzWFT4K9yd3gWwHAK
	+9p9HbSW3JnY1EqwDWX0eNVWm4gfkMiZFZfiIYuodkae/ai0X5Q1aAuVeCrmX2oF59x8WKPEXsAKE
	TDplk3X2ZsmJbH2VKKm6tPRb8gt2P60cYVELRV4f21NLzuiosTP83fYbygcXVCJBnedsMD91RLAGo
	dgII5yPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tL9JW-0000000D6I5-2Y8u;
	Tue, 10 Dec 2024 23:06:46 +0000
Received: from mail-yb1-xb2e.google.com ([2607:f8b0:4864:20::b2e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tL9JU-0000000D6H5-2XZk
	for ath11k@lists.infradead.org;
	Tue, 10 Dec 2024 23:06:45 +0000
Received: by mail-yb1-xb2e.google.com with SMTP id 3f1490d57ef6-e39fb8548e2so5029803276.3
        for <ath11k@lists.infradead.org>; Tue, 10 Dec 2024 15:06:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gateworks.com; s=google; t=1733872002; x=1734476802; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UqT6g0W8wBftvp6aSxR69K7dIiruVpolHF6yT66BzYA=;
        b=nrlVwZlkmI3MkRcKGNk8wMpWGdH2lp/325Q5wTnYN4PwKqeD07nHapsTMIGlQ5uTlV
         nc88eL9NVdQWBvSnS65uaZjoeDVskEBWbhxomDaY+nRbuGnJCRKVF7WCoNMYPrxaCryO
         JA4dcMSnKMuo+eV0veQLTcuJ8Jz5ZDa+4+EmgaypMJPkrPnC5LBwfUD1BKJJjvfZlSJt
         PivbRWKBhmALONZyVond+qIGxK7SRyuYN2FLdBeMvsNGJCk/Tn63+BFTMvq7NWxaKIgD
         t1qfW5/Anxn0xTFIcFqFUnzPe7LAtqUZOkEDfv48nFsN7QqtXDcjYKl8X5J8yYzQGdEt
         pJzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733872002; x=1734476802;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UqT6g0W8wBftvp6aSxR69K7dIiruVpolHF6yT66BzYA=;
        b=I9XVYmBC8KVye+GCJr9p+Gbe2pUpI/UBlWfZSFnR2fHTs98b2Ew4K87/iiYtmrP/Yk
         3whDZ7SZo8HEOX/qlq5fMs8OpYKX8FanB9Glp2Ng/9v2o4Fuz+UocSBboFtszC74SUJr
         4UzM4zNw+Q19g0/2WjCj3D5wZK4bM/HB8PGV2wqqxDpvwvQdelbaXI5wIlSQxWq1k9q2
         DuOJUfXqXhc+wnnebG+I9jAG+3nnJ/vZaPME6J+lkzg3Y1LBIEV/WhNAnqBIcWr27YUI
         eMeGVfgtRaig/6zk3OH+CtfeOCXFqj8HXTUGQz34XWnMpHxdc9PKQBEQ6mA/e4atBw8K
         b73Q==
X-Forwarded-Encrypted: i=1; AJvYcCXJlFyac7fLPkb7Nvu1obEiS2XMgl2st8bVHuZPJhXgPJvAZpKEoNJOok21pMO5wYAjutAr5x4=@lists.infradead.org
X-Gm-Message-State: AOJu0YyJsDQg9RLQUKrzcL9v7MetwlBlPqiAdRpyV7/C/UvBWHuwaV0P
	XJF4PedreX7yHiZhifHWnF2LpiNG5SMdmhrzoYNNm9+XyS1bH4wC5AM9KSsShR5qxUXb2b1a7vt
	EgsKerUqw4pzgBvItFlicG3saK7H7tIazMwivUk/TTEP+POiwW7Q=
X-Gm-Gg: ASbGnctRr4GF6nq64m9/JpJ7EukxDQkd7c+Mk5NqN0D1tFYLMB8cucW7N1Zk6IkuF99
	YsTz770rEeUh/I2SB5Ur9LM2xGID3cKtj5Mk=
X-Google-Smtp-Source: AGHT+IHDSE8vWTo5AI2GRtvcRlxTgl5Sv9MW1qFpKY2BPLTbrUME85VaPcnBA4mMZTf7UD9AjbDzT6zqXJ7grktQ4+s=
X-Received: by 2002:a05:6902:260c:b0:e39:8f3e:30a1 with SMTP id
 3f1490d57ef6-e3c8e645ca4mr949108276.46.1733872002729; Tue, 10 Dec 2024
 15:06:42 -0800 (PST)
MIME-Version: 1.0
References: <CAJ+vNU0EL3T+GyNAbVbGqYYQ5NM3h7cgAwqxxBMuZjh+-YQ3bA@mail.gmail.com>
 <1b2ea8b2-6fbe-4118-b6c6-742c8f0be476@quicinc.com> <CAJ+vNU1-OZ3y4p2L+zf64AiVtUv70yZNqkT20jTxyE0_gJb6Jg@mail.gmail.com>
 <0282be95-9094-4d49-b79e-4f7c976dad00@quicinc.com> <CAJ+vNU32EMHjtchJRb1sODBrUKG2vZW4ZEu1_F0+dCCEjCn7Dg@mail.gmail.com>
 <20241209081714.GA25363@lst.de> <593c0d63-d8fd-4439-a57a-97340212c197@arm.com>
 <CAJ+vNU2ypE_Mn_6iKCmf5LYk9Sth=ryWXyewc5MhOKK8VoAKCA@mail.gmail.com> <20241210041133.GA17116@lst.de>
In-Reply-To: <20241210041133.GA17116@lst.de>
From: Tim Harvey <tharvey@gateworks.com>
Date: Tue, 10 Dec 2024 15:06:31 -0800
Message-ID: <CAJ+vNU03Cqsc+O5anwmvJW8Wfd-06LbDMVHjxVFdixf01ZLczQ@mail.gmail.com>
Subject: Re: ath11k swiotlb buffer is full (on IMX8M with 4GiB DRAM)
To: Christoph Hellwig <hch@lst.de>
Cc: Robin Murphy <robin.murphy@arm.com>, Baochen Qiang <quic_bqiang@quicinc.com>, 
	ath11k@lists.infradead.org, linux-wireless <linux-wireless@vger.kernel.org>, 
	Fabio Estevam <festevam@gmail.com>, Marek Szyprowski <m.szyprowski@samsung.com>, iommu@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_150644_642648_3C5DAA6B 
X-CRM114-Status: GOOD (  22.35  )
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

On Mon, Dec 9, 2024 at 8:11=E2=80=AFPM Christoph Hellwig <hch@lst.de> wrote=
:
>
> On Mon, Dec 09, 2024 at 11:15:02AM -0800, Tim Harvey wrote:
> > After a lot of back and forth and investigation this is due to the
> > IMX8M SoC's not having an IOMMU thus swiotlb is being used and ath11k
> > is requesting some buffers that are too large for swiotlb to provide.
> > There is a specific patch which added the HAL_WBM2SW_RELEASE buffers
> > to cacheable memory that could be reverted to fix this but the concern
> > was that it would impact performance moving those buffers to
> > non-cacheable memory (there are three ~1MiB buffers being allocated):
> > commit d0e2523bfa9cb ("ath11k: allocate HAL_WBM2SW_RELEASE ring from
> > cacheable memory").
>
> The combination of "buffers" and "swiotlb" sounds like Robin was right
> below.
>
> > The chain of events as best I can tell are:
> >
> > commit 6452f0a3d565 ("ath11k: allocate dst ring descriptors from
> > cacheable memory")
> > - Nov 12 2021 (made it into Linux 5.17)
> > - changes allocation of reo_dst rings to cacheable memory to allow
> > cached descriptor access to optimize CPU usage
> > - this is flawed because it uses virt_to_phys() to allocate cacheable
> > memory which does not work on systems with an IOMMU enabled or using
> > software IOMMU (swiotlb); this causes a kernel crash on client
> > association
>
> And this is where it started to take a wrong turn, that everyhing
> later basically made worse.  If you have long living and potentially
> large DMA allocations, you need to use dma_alloc_* interfaces.
>
> 5.17 already had dma_alloc_pages for quite a while which was and still is
> the proper interface to use.  For much older kernel you'd be stuck
> with dma_alloc_noncoherent or dma_alloc_attrs with the right flag,
> but even that would have been much better.

Christoph,

I'm not clear what you are suggesting be done here. Are you suggesting
that ath11k has been using the wrong mechanism by calling
dma_map_single for cached DMA buffers? I'm not all that familiar with
ath11k so I can't tell what buffers are considered long living.

Best Regards,

Tim

