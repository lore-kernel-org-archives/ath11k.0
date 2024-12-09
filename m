Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43741E7717D
	for <ath11k@archiver.kernel.org>; Mon,  9 Dec 2024 19:15:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2kLjgnxaHMn5y0gTT+3dvOLNzEd5yWQ0Er4eRA/5e+Q=; b=AL57FvctFsvfHqjXMfV6Jc5foZ
	n81zKwJJ43LE8anaXbANHXpBgKZTg2mzJG8RUg8hYoLPV8aU+yuhs6NPMJ99ar5/vDtjqMGLnKB3J
	oKZxVTAheqsh5cJRR+ppiC1lhw0lWlIe1OELjFXAWCiqVKhueODN4cbuYGIIzhZ2tcsfKQMim+iIj
	AKGMbTD7o0MLFki0unVUhlNe4UmJqesPJvs2JFdkTHlkx5+m2TnoyCMI/4IwOw87At5NiiFcKbE9L
	UDJGaLnoD3ywfZZ2nq3AgHBNHJiZvSX6HX8UcHaDsOEifbNMRHjSn9dG6YgOBk3eormQGrPpnrZtM
	qu/RmQWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKjDy-0000000915N-26vl;
	Mon, 09 Dec 2024 19:15:18 +0000
Received: from mail-yb1-xb2a.google.com ([2607:f8b0:4864:20::b2a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKjDv-0000000914r-3esK
	for ath11k@lists.infradead.org;
	Mon, 09 Dec 2024 19:15:17 +0000
Received: by mail-yb1-xb2a.google.com with SMTP id 3f1490d57ef6-e3983426f80so3791285276.1
        for <ath11k@lists.infradead.org>; Mon, 09 Dec 2024 11:15:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gateworks.com; s=google; t=1733771714; x=1734376514; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2kLjgnxaHMn5y0gTT+3dvOLNzEd5yWQ0Er4eRA/5e+Q=;
        b=FSdQ5x9SgogEW47Kadvm+KXwJRRbSNInGL0DGdgXGYdZGXHRs/n7wFM8lYGj2fV9js
         78drkcWQZaasiOITt7ZHEJ2PAKyaaQpTSres4uL1TvtnurST49uCgVSlIO2JWnR6MBrO
         u5oqby5FxZ5BGgxrgRQ/qH7F7CB8TTYl4tWvClZK7851NMvhq1Xcwy3RJzp8OmX6AtIX
         s2jKt5eS4yt6OZmbhB3PBXJFomzPTEck0p7q+pKgnVgKF3aAVsSP/numvyKVYeOseRxg
         KxvmErTgqQU5xnffJfRqAsd21QRr+Ys/WbyrfyfRfQaM8Ur2CYAD/DOkyLpKn1+hgUFa
         4mCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733771714; x=1734376514;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2kLjgnxaHMn5y0gTT+3dvOLNzEd5yWQ0Er4eRA/5e+Q=;
        b=te+fJl0x1yBBc1cG2CH+WI4Jf5EWCbqupzjM3r5ItWkoBHnPtS9elLVe6eZneuwfbu
         H3rYbwHSOCquGSsVYb+boWFpVD6EUezSxcn4V0d1VDTfzpwI2j+m7rBm/PuMC6NHMKR/
         iji/yIdCA5llgvADrdNW5NXLRhwZ1D9Otqo5vZ8Z3QK/eaSQXnWn767A586SZWjkHxok
         GtLmWEiEYCnngWA4Ir8FbYx56zgAEkR4Pk77OzTmqhySb7wBT+De5vThizYXaM6OoFlC
         49BJC3/yShsBy97k7ApQzG13LOSjZpFtv2Z3Ls8IkteFbQNz97ZwuRm5uKGaetiqBtim
         dhUA==
X-Forwarded-Encrypted: i=1; AJvYcCWC8EWR/zTtSUF3xZilJiM4+wi1vfk9kq272f5FbDpcYdf/r/kFLfV/EwplxoBINPmcJuV7+bA=@lists.infradead.org
X-Gm-Message-State: AOJu0Yzs3Mg5qt/67/odm4QLgR0g8FWMwP0vL97/1cZQBdmo3E7dOLLr
	l15OXx8iqPF6D33B+fU3pzBqN1z6PNXhDWSCn3ISxlaQse9UvW+hsM/VIfRpAX3We0o/BREscOE
	AgSgSLHhzkzj0/D9hr9MB94qd5UTdulnqkzoyJA==
X-Gm-Gg: ASbGnct48jJtSNSOBjP6LEALtUA4MiZmdz083mJNysfqK6TDf8936augPVUxrjkpR0K
	lbfOu3IjLm77Ng/Dlg7F6xTTa/u9e/M0=
X-Google-Smtp-Source: AGHT+IGEl64T8fh4w41xF5QeO5D03WN4PRl4tWrD5C7XLi4pHuR/6CFrIf/3ED6k/l9Dz+t1Bywo3Kx6XChWXHllhco=
X-Received: by 2002:a05:6902:124b:b0:e3a:32a9:82cc with SMTP id
 3f1490d57ef6-e3a59bade21mr1582408276.36.1733771714002; Mon, 09 Dec 2024
 11:15:14 -0800 (PST)
MIME-Version: 1.0
References: <CAJ+vNU0EL3T+GyNAbVbGqYYQ5NM3h7cgAwqxxBMuZjh+-YQ3bA@mail.gmail.com>
 <1b2ea8b2-6fbe-4118-b6c6-742c8f0be476@quicinc.com> <CAJ+vNU1-OZ3y4p2L+zf64AiVtUv70yZNqkT20jTxyE0_gJb6Jg@mail.gmail.com>
 <0282be95-9094-4d49-b79e-4f7c976dad00@quicinc.com> <CAJ+vNU32EMHjtchJRb1sODBrUKG2vZW4ZEu1_F0+dCCEjCn7Dg@mail.gmail.com>
 <20241209081714.GA25363@lst.de> <593c0d63-d8fd-4439-a57a-97340212c197@arm.com>
In-Reply-To: <593c0d63-d8fd-4439-a57a-97340212c197@arm.com>
From: Tim Harvey <tharvey@gateworks.com>
Date: Mon, 9 Dec 2024 11:15:02 -0800
Message-ID: <CAJ+vNU2ypE_Mn_6iKCmf5LYk9Sth=ryWXyewc5MhOKK8VoAKCA@mail.gmail.com>
Subject: Re: ath11k swiotlb buffer is full (on IMX8M with 4GiB DRAM)
To: Robin Murphy <robin.murphy@arm.com>, Christoph Hellwig <hch@lst.de>
Cc: Baochen Qiang <quic_bqiang@quicinc.com>, ath11k@lists.infradead.org, 
	linux-wireless <linux-wireless@vger.kernel.org>, Fabio Estevam <festevam@gmail.com>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, iommu@lists.linux.dev, 
	P Praneesh <ppranees@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_111515_913800_5049DF59 
X-CRM114-Status: GOOD (  22.05  )
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

On Mon, Dec 9, 2024 at 2:49=E2=80=AFAM Robin Murphy <robin.murphy@arm.com> =
wrote:
>
> On 09/12/2024 8:17 am, Christoph Hellwig wrote:
> > I scrolled three pages before giving up as it was just quotes over
> > quotas.  Can you please write an email that contains whatever you're
> > trying to tell instead of just quotes?  Same for the person replying.
>

Christoph,

Understood; there was a lot of back and forth and likely some
misinformation from my early replies. Let me recap here.

The issue I run into is that with Linux 6.9 and beyond on an IMX8M
Mini SoC (no IMOMMU) with >3GiB DRAM (which requires more than 32 bits
of address due to IMX8M's DRAM base being at 0x40000000) the ath11k
driver will fail to register a netdev and errors out with 'ath11k
swiotlb buffer is full':
[    8.057077] ath11k_pci 0000:04:00.0: BAR 0 [mem
0x18200000-0x183fffff 64bit]: assigned
[    8.057151] ath11k_pci 0000:04:00.0: enabling device (0000 -> 0002)
[    8.091920] ath11k_pci 0000:04:00.0: MSI vectors: 16
[    8.091960] ath11k_pci 0000:04:00.0: qcn9074 hw1.0
[    8.832924] ath11k_pci 0000:04:00.0: chip_id 0x0 chip_family 0x0
board_id 0xff soc_id 0xffffffff
[    8.832951] ath11k_pci 0000:04:00.0: fw_version 0x270206d0
fw_build_timestamp 2022-08-04 12:48 fw_build_id
WLAN.HK.2.7.0.1-01744-QCAHKSWPL_SILICONZ-1
[   10.194343] ath11k_pci 0000:04:00.0: swiotlb buffer is full (sz:
1048583 bytes), total 32768 (slots), used 2529 (slots)
[   10.194406] ath11k_pci 0000:04:00.0: failed to set up tcl_comp ring (0) =
:-12
[   10.194781] ath11k_pci 0000:04:00.0: failed to init DP: -12

After a lot of back and forth and investigation this is due to the
IMX8M SoC's not having an IOMMU thus swiotlb is being used and ath11k
is requesting some buffers that are too large for swiotlb to provide.
There is a specific patch which added the HAL_WBM2SW_RELEASE buffers
to cacheable memory that could be reverted to fix this but the concern
was that it would impact performance moving those buffers to
non-cacheable memory (there are three ~1MiB buffers being allocated):
commit d0e2523bfa9cb ("ath11k: allocate HAL_WBM2SW_RELEASE ring from
cacheable memory").

> TBH I'm hesitant to look too closely since everything those Atheros WiFi
> drivers do with DMA tends to be sketchy, but from what I could make out
> from skimming until I also gave up, I think it might be an attempt to
> reinvent dma_alloc_pages(), or possibly dma_alloc_noncoherent().

Robin,

Agreed - I'm not sure how much attention, review, or testing these
ath11k patches originally got due to the fact that there appears to be
breakage for a couple of years here.

The chain of events as best I can tell are:

commit 6452f0a3d565 ("ath11k: allocate dst ring descriptors from
cacheable memory")
- Nov 12 2021 (made it into Linux 5.17)
- changes allocation of reo_dst rings to cacheable memory to allow
cached descriptor access to optimize CPU usage
- this is flawed because it uses virt_to_phys() to allocate cacheable
memory which does not work on systems with an IOMMU enabled or using
software IOMMU (swiotlb); this causes a kernel crash on client
association

commit d0e2523bfa9c ("ath11k: allocate HAL_WBM2SW_RELEASE ring from
cacheable memory)
- Nov 12 2021 (made it into Linux Linux 5.17)
- furthers the previous patch by also including the WBM2SW buffers in
cacheable memory which are about 1MiB in size

commit aaf244141ed7 ("wifi: ath11k: fix IOMMU errors on buffer rings")
- Dec 20 2023 (made it into Linux 6.9)
- resolves the issue from commit 6452f0a3d565 (but missing a Fixes
tag) by changing the virt_to_phys calls to dma_map_single() but on
systems that need software IOMMUC (IMX8MM > 3GiB) this exposes the
'swiotlb buffer is full' limitation due to commit d0e2523bfa9c which
allocates buffers exceeding the 256KiB limit imposed by swiotlb

Therefore in the case of an IOMMU'less system with DMA address
limitations of 32bit and >3GiB DRAM (as many IMX8M boards have) the
ath11k driver has been broken since 5.17.

Best Regards,

Tim

