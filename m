Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C17B2E6ADD0
	for <ath11k@archiver.kernel.org>; Sat, 23 Nov 2024 00:43:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:MIME-Version:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gR9Za9yujplH+airjTKOsXQD1+4Q8Lf3JPFQP16TK6M=; b=oFA3YUN2+oBleTtMiBE+SsWtan
	Q2XOP4WGxYpGWoC4Ar2im0DjpsptKW06hyF6y/+8cBggNUlEfrRA4IB8SLV1UJs8vudEcVdBDH6RW
	gV4cckK2Z86OMtBCx2OHb8IVIsgpLivHjFnEJC3nbPSMtCrFFb1FgTO5Nx01kZ7tuhXuw+0YZTg3x
	LQSpSoPchJCGOaA+UivukeUHDuLRjxzhiGzyr+VI+kYe6a2sBTk4bRfgcRFUJAgXc349tfaiZsg4l
	EFrl4jBeDEl5sEkhzeO0cYssQpdxH1JoVqR0JcnvWDjZtZmeqruNfZV7GDncKn3OpPBPZSHc+aLH7
	SmeLvuEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tEeFS-00000003Zed-2304;
	Sat, 23 Nov 2024 00:43:42 +0000
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tEeFP-00000003ZeD-348e
	for ath11k@lists.infradead.org;
	Sat, 23 Nov 2024 00:43:41 +0000
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-6eb0c2dda3cso34331717b3.1
        for <ath11k@lists.infradead.org>; Fri, 22 Nov 2024 16:43:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gateworks.com; s=google; t=1732322618; x=1732927418; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=gR9Za9yujplH+airjTKOsXQD1+4Q8Lf3JPFQP16TK6M=;
        b=V2PdaCqlkE7dIQzooPT7TDdPmc7QpZbsM0l32H4ByDmwtPBjCbBJi5+FDtF5WZJzjI
         v0iXfsEyCjLKzwjOxR81hCnrV6cZRz0fb5jJ2CDg1aBn0SHQ3kO1iqktzR9h5yxoy0ve
         a0uZ6lqnz9imYT/G1RcjxLd1jFPHERHqPAMZtGbT/SGD+Z6LFOe4b+JX/bKt+KEJuP51
         WNXDcz93PDGyiCUbV3F914cGFC5N1WFD7gkqluJJPRJa7bLPosgXFvLN+ijON5hKEXOX
         bfzQQFgwucodHNv6xlWi+IDksLIZQeibK9dxMsZ5Qy1f+EUUUFwHel+XnQKuYMfsKzod
         OPHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732322618; x=1732927418;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gR9Za9yujplH+airjTKOsXQD1+4Q8Lf3JPFQP16TK6M=;
        b=N/RkvOlTOAMedbnj5DZ5ZDv4RK2OYxOhzjgJxlgszmpYJCwgG3NIa4EQ1wXQOPtpG1
         trWblo2cnFQf4nqSm8kBEYRK2zCNWFVKZSSteTYHciv3eKMKGhyiuwrmERdrEPJneZ7O
         OntC3iRBv8on4LQE+ihM32BUKrivtibd/9HPCnCf1wrg3LA6rsCjMKkJiX1zgnqkW2Uc
         oDg7RJU0DNVvUcqx9jUSDGCZ1ZcTE1Ns/XoodeoPeRE+sxWvJWiRX7CqiQk/Ee4lGVXI
         hl/S1MdPLRCW/t6NdSr38BJWEnhe+tzAF2MRavgpNpSGHEBGnneIifTFDDO9wLF3Cbe9
         M12g==
X-Gm-Message-State: AOJu0YxBHy83tXV9iyVdxdMrOMd8mTxs67U8vew3C5qkAThLryaGAfyp
	2CQoBvkjQHk9hIhOP7afRFJS4EIo0fupxIZNi2C5LiN9ShpJBkD3wrA4eki3ccZCMTye+fdgaqN
	RAKrCdr9O5Kgr2Mb8FTVtTOKsY3hUx+WbvO4dnA==
X-Gm-Gg: ASbGncsxwK8luc21zhkW7ROIKsKwyqoozcHNg1HvQQdlbtyDCazRkERB1z8go3pHLOA
	cBB77JQb2ZuqylHsD/+e3ubkJWSxcy78=
X-Google-Smtp-Source: AGHT+IEH11Y8eYsGPH9t9tpCwePL1et0junWOdDz+SMAuxti2yReHyciQjG+kayqmasCVxgulP79Ze6R5xELgyMBe+4=
X-Received: by 2002:a05:690c:7306:b0:6ee:b241:3251 with SMTP id
 00721157ae682-6eee09e5ef6mr54949417b3.20.1732322617827; Fri, 22 Nov 2024
 16:43:37 -0800 (PST)
MIME-Version: 1.0
From: Tim Harvey <tharvey@gateworks.com>
Date: Fri, 22 Nov 2024 16:43:27 -0800
Message-ID: <CAJ+vNU0EL3T+GyNAbVbGqYYQ5NM3h7cgAwqxxBMuZjh+-YQ3bA@mail.gmail.com>
Subject: Re: ath11k swiotlb buffer is full (on IMX8M with 4GiB DRAM)
To: Baochen Qiang <quic_bqiang@quicinc.com>
Cc: ath11k@lists.infradead.org, 
	linux-wireless <linux-wireless@vger.kernel.org>, Fabio Estevam <festevam@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bad-Reply: 'Re:' in Subject but no References or In-Reply-To headers
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241122_164339_777053_7879F2EA 
X-CRM114-Status: GOOD (  37.07  )
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

On Thu, Nov 21, 2024 at 9:51=E2=80=AFPM Baochen Qiang <quic_bqiang@quicinc.=
com> wrote:
>
>
>
> On 11/22/2024 5:50 AM, Tim Harvey wrote:
> > On Tue, Nov 19, 2024 at 6:32=E2=80=AFPM Baochen Qiang <quic_bqiang@quic=
inc.com> wrote:
> >>
> >>
> >>
> >> On 11/20/2024 4:16 AM, Tim Harvey wrote:
> >>> Greetings,
> >>>
> >>> I've got an ath11k card that is failing to init on an IMX8MM system
> >>> with 4GB of DRAM:
> >>> [    7.551582] ath11k_pci 0000:01:00.0: BAR 0 [mem
> >>> 0x18000000-0x181fffff 64bit]: assigned
> >>> [    7.551713] ath11k_pci 0000:01:00.0: enabling device (0000 -> 0002=
)
> >>> [    7.552401] ath11k_pci 0000:01:00.0: MSI vectors: 16
> >>> [    7.552440] ath11k_pci 0000:01:00.0: qcn9074 hw1.0
> >>> [    7.887186] mhi mhi0: Loaded FW: ath11k/QCN9074/hw1.0/amss.bin,
> >>> sha256: 5ee1b7b204541b5f99984f21d694ececaec08fbce1b520ffe6fe740b02a4a=
fd7
> >>> [    8.435964] ath11k_pci 0000:01:00.0: chip_id 0x0 chip_family 0x0
> >>> board_id 0xff soc_id 0xffffffff
> >>> [    8.435991] ath11k_pci 0000:01:00.0: fw_version 0x270206d0
> >>> fw_build_timestamp 2022-08-04 12:48 fw_build_id
> >>> WLAN.HK.2.7.0.1-01744-QCAHKSWPL_SILICONZ-1
> >>> [    8.441700] ath11k_pci 0000:01:00.0: Loaded FW:
> >>> ath11k/QCN9074/hw1.0/board-2.bin, sha256:
> >>> dbf0ca14aa1229eccd48f26f1026901b9718b143bd30b51b8ea67c84ba6207f1
> >>> [    9.753764] ath11k_pci 0000:01:00.0: Loaded FW:
> >>> ath11k/QCN9074/hw1.0/m3.bin, sha256:
> >>> b6d957f335073a15a8de809398e1506f0200a08747eaf7189c843cf519ffc1de
> >>> [    9.789791] ath11k_pci 0000:01:00.0: swiotlb buffer is full (sz:
> >>> 1048583 bytes), total 32768 (slots), used 2528 (slots)
> >>> [    9.789853] ath11k_pci 0000:01:00.0: failed to set up tcl_comp rin=
g (0) :-12
> >>> [    9.790238] ath11k_pci 0000:01:00.0: failed to init DP: -12
> >>> root@noble-venice:~# cat /proc/cmdline
> >>> console=3Dttymxc1,115200 earlycon=3Dec_imx6q,0x30890000,115200
> >>> root=3DPARTUUID=3D5cdde84f-01 rootwait net.ifnames=3D0 cma=3D196M
> >>>
> >>> The IMX8MM's DRAM base is at 1GB so anything above 3GB hits the 32bit
> >>> address boundary. If I pass in a mem=3D3096M the device registers jus=
t
> >>> fine.
> >> yeah ... that parameter makes kernel alloc memory below 32bit boundary=
, thus swiotlb is not necessary.
> >
> > Hi Baochen,
> >
> > Yes, that makes sense as I step through the code. On IMX8M with DRAM
> > 3GB or less dma_capable(...) is true so swiotlb bounce buffers are not
> > needed.
> >
> >>
> >>>
> >>> I found this to be the case with modern kernels however I found
> >>> differing behavior with older kernels:
> >>> - 6.6 and 6.1 the device registers with 4GB DRAM but crashes on clien=
t connect
> >>> - 5.15 devices registers with 4GB DRAM and appears to work just fine
> >> are you using Linus' tree or the stable tree?
> >>
> >
> > For 6.6 I tested stable.
> can you try Linus's tree ? as I know the stable tree is possible to miss =
some important fix.
>
> >
> > This likely has something to do with commit dbd73acb22d8 ("wifi:
> > ath11k: enable 36 bit mask for stream DMA") but it would seem to me
> > that patch was trying to avoid the entire 32bit DMA limitation. Maybe
> > that patch sets the ath11k device DMA mask to 36 bits but maybe the
> > IMX8M PCI DMA is only capable of 32bits?
> that patch is making situation better, not worse. that said, it helps to =
avoid swiotlb in
> ath11k DMA, rather than to get it involved.
>

Yes, that patch would be an improvement on systems capable of
addressing 64bit memory but not on the IMX8M which is seemingly
capable of only 32bit DMA over PCI.

> >
> >>>
> >>> Could anyone explain what is going on here? Obviously there have been
> >>> changes at some point to start using swiotlb which I believe was all
> >>> about avoiding 32bit DMA limitations but I'm not clear how I should b=
e
> >>> configuring this for IMX8MM with 4GB DRAM. Maybe my kernel IOMMU
> >>> configuration is incorrect somehow?
> >> there are quite some options associated with IOMMU, not sure which one=
 might be causing this. But basically you may check:
> >>
> >> CONFIG_IOMMU_IOVA
> >> CONFIG_IOMMU_API
> >> CONFIG_IOMMU_SUPPORT
> >> CONFIG_IOMMU_DMA=3Dy
> >>
> >
> > These are enabled which I believe appropriate for IMX8M. If I want to
> > utilize the full 4GB DRAM on IMX then I must use IOMMU and swiotlb
> > which would mean a performance hit due to copying mem to/from bounce
> > buffers not to mention the fact that I can't figure out how to
> > configure the system to avoid the 'swiotlb swiotlb buffer is full'
> > issue.

My statement regarding needing an IOMMU above is wrong; apparently the
IMX8M SoC's don't have an IOMMU but the fact I have it enabled in the
kernel should be a don't-care. If I understand swiotlb correctly, if I
did have an IOMMU then it would be used instead of swiotlb.

> >
> > Enabling CONFIG_SWIOTLB_DYNAMIC does not help nor does increasing the
> > number of slots - it has something to do with the number/size of DMA
> > buffers that ath11k is asking for:
> yeah, ath11k asks for fixed size DMA buffer regardless of that config.
>
> > # dmesg | grep swiotlb_tbl_map_single
> > [    5.237731] ath11k_pci 0000:01:00.0: swiotlb_tbl_map_single size=3D
> > 65535B index=3D 16384 (slots=3D32768/    32)
> > [    5.247519] ath11k_pci 0000:01:00.0: swiotlb_tbl_map_single size=3D
> > 65535B index=3D 16416 (slots=3D32768/    64)
> > [    5.261794] ath11k_pci 0000:01:00.0: swiotlb_tbl_map_single size=3D
> > 65535B index=3D 16448 (slots=3D32768/    96)
> > [    5.275114] ath11k_pci 0000:01:00.0: swiotlb_tbl_map_single size=3D
> > 65535B index=3D 16480 (slots=3D32768/   128)
> > [    5.287757] ath11k_pci 0000:01:00.0: swiotlb_tbl_map_single size=3D
> > 65535B index=3D 16512 (slots=3D32768/   160)
> > [    5.299688] ath11k_pci 0000:01:00.0: swiotlb_tbl_map_single size=3D
> > 65535B index=3D 16544 (slots=3D32768/   192)
> > [    5.312482] ath11k_pci 0000:01:00.0: swiotlb_tbl_map_single size=3D
> > 65535B index=3D 16576 (slots=3D32768/   224)
> > [    5.324493] ath11k_pci 0000:01:00.0: swiotlb_tbl_map_single size=3D
> > 65535B index=3D 16608 (slots=3D32768/   256)
> > [    5.337001] ath11k_pci 0000:01:00.0: swiotlb_tbl_map_single size=3D
> > 65535B index=3D 16640 (slots=3D32768/   288)
> > [    5.346754] ath11k_pci 0000:01:00.0: swiotlb_tbl_map_single size=3D
> > 65535B index=3D 16672 (slots=3D32768/   320)
> > [    5.356571] ath11k_pci 0000:01:00.0: swiotlb_tbl_map_single size=3D
> > 65535B index=3D 16704 (slots=3D32768/   352)
> > [    5.366372] ath11k_pci 0000:01:00.0: swiotlb_tbl_map_single size=3D
> > 65535B index=3D 16736 (slots=3D32768/   384)
> > [    5.376164] ath11k_pci 0000:01:00.0: swiotlb_tbl_map_single size=3D
> > 65535B index=3D 16768 (slots=3D32768/   416)
> > [    5.385944] ath11k_pci 0000:01:00.0: swiotlb_tbl_map_single size=3D
> > 65535B index=3D 16800 (slots=3D32768/   448)
> > [    5.395712] ath11k_pci 0000:01:00.0: swiotlb_tbl_map_single size=3D
> > 65535B index=3D 16832 (slots=3D32768/   480)
> > [    5.408270] ath11k_pci 0000:01:00.0: swiotlb_tbl_map_single size=3D
> > 65535B index=3D 16864 (slots=3D32768/   512)
> > [    5.419768] ath11k_pci 0000:01:00.0: swiotlb_tbl_map_single size=3D
> > 65535B index=3D 16896 (slots=3D32768/   544)
> > [    5.430966] ath11k_pci 0000:01:00.0: swiotlb_tbl_map_single size=3D
> > 65535B index=3D 16928 (slots=3D32768/   576)
> > [    5.442368] ath11k_pci 0000:01:00.0: swiotlb_tbl_map_single size=3D
> > 65535B index=3D 16960 (slots=3D32768/   608)
> > [    5.452422] ath11k_pci 0000:01:00.0: swiotlb_tbl_map_single size=3D
> > 65535B index=3D 16992 (slots=3D32768/   640)
> > [    5.463507] ath11k_pci 0000:01:00.0: swiotlb_tbl_map_single size=3D
> > 65535B index=3D 17024 (slots=3D32768/   672)
> > [    5.473536] ath11k_pci 0000:01:00.0: swiotlb_tbl_map_single size=3D
> > 65535B index=3D 17056 (slots=3D32768/   704)
> > [    5.485661] ath11k_pci 0000:01:00.0: swiotlb_tbl_map_single size=3D
> > 65535B index=3D 17088 (slots=3D32768/   736)
> > [    5.495404] ath11k_pci 0000:01:00.0: swiotlb_tbl_map_single size=3D
> > 65535B index=3D 17120 (slots=3D32768/   768)
> > [    5.509626] ath11k_pci 0000:01:00.0: swiotlb_tbl_map_single size=3D
> > 65535B index=3D 17152 (slots=3D32768/   800)
> > [    5.519353] ath11k_pci 0000:01:00.0: swiotlb_tbl_map_single size=3D
> > 65535B index=3D 17184 (slots=3D32768/   832)
> > [    5.529077] ath11k_pci 0000:01:00.0: swiotlb_tbl_map_single size=3D
> > 65535B index=3D 17216 (slots=3D32768/   864)
> > [    5.538799] ath11k_pci 0000:01:00.0: swiotlb_tbl_map_single size=3D
> > 65535B index=3D 17248 (slots=3D32768/   896)
> > [    5.548517] ath11k_pci 0000:01:00.0: swiotlb_tbl_map_single size=3D
> > 65535B index=3D 17280 (slots=3D32768/   928)
> > [    5.558238] ath11k_pci 0000:01:00.0: swiotlb_tbl_map_single size=3D
> > 65535B index=3D 17312 (slots=3D32768/   960)
> > [    5.567965] ath11k_pci 0000:01:00.0: swiotlb_tbl_map_single size=3D
> > 65535B index=3D 17344 (slots=3D32768/   992)
> > [    5.578943] ath11k_pci 0000:01:00.0: swiotlb_tbl_map_single size=3D
> > 65535B index=3D     0 (slots=3D32768/   992)
> > [    5.578964] ath11k_pci 0000:01:00.0: swiotlb_tbl_map_single size=3D
> >  52B index=3D  8192 (slots=3D32768/   993)
> > [    5.599793] ath11k_pci 0000:01:00.0: swiotlb_tbl_map_single size=3D
> > 65535B index=3D    32 (slots=3D32768/   992)
> > [    5.599861] ath11k_pci 0000:01:00.0: swiotlb_tbl_map_single size=3D
> >  68B index=3D  8193 (slots=3D32768/   993)
> > [    5.609589] ath11k_pci 0000:01:00.0: swiotlb_tbl_map_single size=3D
> > 65535B index=3D    64 (slots=3D32768/   993)
> > [    5.628921] ath11k_pci 0000:01:00.0: swiotlb_tbl_map_single size=3D
> > 65535B index=3D    96 (slots=3D32768/   992)
> > [    5.638703] ath11k_pci 0000:01:00.0: swiotlb_tbl_map_single size=3D
> >  68B index=3D 17376 (slots=3D32768/   993)
> > [    5.649602] ath11k_pci 0000:01:00.0: swiotlb_tbl_map_single size=3D
> > 65535B index=3D   128 (slots=3D32768/   992)
> > [    5.659389] ath11k_pci 0000:01:00.0: swiotlb_tbl_map_single size=3D
> > 65535B index=3D   160 (slots=3D32768/   992)
> > [    5.674038] ath11k_pci 0000:01:00.0: swiotlb_tbl_map_single size=3D
> >  96B index=3D 17377 (slots=3D32768/   993)
> > [    5.685016] ath11k_pci 0000:01:00.0: swiotlb_tbl_map_single size=3D
> > 65535B index=3D   192 (slots=3D32768/   992)
> > [    5.694819] ath11k_pci 0000:01:00.0: swiotlb_tbl_map_single size=3D
> > 65535B index=3D   224 (slots=3D32768/   992)
> > [    5.694831] ath11k_pci 0000:01:00.0: swiotlb_tbl_map_single size=3D
> >  52B index=3D 17378 (slots=3D32768/   993)
> > [    5.714194] ath11k_pci 0000:01:00.0: swiotlb_tbl_map_single size=3D
> >  40B index=3D 17379 (slots=3D32768/   994)
> > [    5.725089] ath11k_pci 0000:01:00.0: swiotlb_tbl_map_single size=3D
> > 65535B index=3D   256 (slots=3D32768/   992)
> > [    5.753507] ath11k_pci 0000:01:00.0: swiotlb_tbl_map_single size=3D
> > 6224B index=3D 17380 (slots=3D32768/   996)
> > [    5.764668] ath11k_pci 0000:01:00.0: swiotlb_tbl_map_single size=3D
> > 65535B index=3D   288 (slots=3D32768/   992)
> > [    5.774456] ath11k_pci 0000:01:00.0: swiotlb_tbl_map_single size=3D
> > 65535B index=3D   320 (slots=3D32768/   992)
> > [    5.774620] ath11k_pci 0000:01:00.0: swiotlb_tbl_map_single size=3D
> > 6224B index=3D 17384 (slots=3D32768/   996)
> > [    5.795091] ath11k_pci 0000:01:00.0: swiotlb_tbl_map_single size=3D
> > 65535B index=3D   352 (slots=3D32768/   992)
> > [    5.795241] ath11k_pci 0000:01:00.0: swiotlb_tbl_map_single size=3D
> > 6224B index=3D 17388 (slots=3D32768/   996)
> > [    5.815724] ath11k_pci 0000:01:00.0: swiotlb_tbl_map_single size=3D
> > 65535B index=3D   384 (slots=3D32768/   992)
> > [    5.815884] ath11k_pci 0000:01:00.0: swiotlb_tbl_map_single size=3D
> > 6224B index=3D 17392 (slots=3D32768/   996)
> > [    5.836357] ath11k_pci 0000:01:00.0: swiotlb_tbl_map_single size=3D
> > 65535B index=3D   416 (slots=3D32768/   992)
> > [    5.836368] ath11k_pci 0000:01:00.0: swiotlb_tbl_map_single size=3D
> >  52B index=3D  8194 (slots=3D32768/   993)
> > [    5.855856] ath11k_pci 0000:01:00.0: swiotlb_tbl_map_single size=3D
> > 6224B index=3D 17396 (slots=3D32768/   997)
> > [    5.866818] ath11k_pci 0000:01:00.0: swiotlb_tbl_map_single size=3D
> > 65535B index=3D   448 (slots=3D32768/   992)
> > [    5.866978] ath11k_pci 0000:01:00.0: swiotlb_tbl_map_single size=3D
> > 6224B index=3D 17400 (slots=3D32768/   996)
> > [    5.887451] ath11k_pci 0000:01:00.0: swiotlb_tbl_map_single size=3D
> > 65535B index=3D   480 (slots=3D32768/   992)
> > [    5.897231] ath11k_pci 0000:01:00.0: swiotlb_tbl_map_single size=3D
> > 65535B index=3D   512 (slots=3D32768/   992)
> > [    5.897389] ath11k_pci 0000:01:00.0: swiotlb_tbl_map_single size=3D
> > 6224B index=3D 17404 (slots=3D32768/   996)
> > [    5.917866] ath11k_pci 0000:01:00.0: swiotlb_tbl_map_single size=3D
> > 65535B index=3D   544 (slots=3D32768/   992)
> > [    5.918026] ath11k_pci 0000:01:00.0: swiotlb_tbl_map_single size=3D
> > 6224B index=3D 17408 (slots=3D32768/   996)
> > [    5.938489] ath11k_pci 0000:01:00.0: swiotlb_tbl_map_single size=3D
> > 65535B index=3D   576 (slots=3D32768/   992)
> > [    5.938642] ath11k_pci 0000:01:00.0: swiotlb_tbl_map_single size=3D
> > 6224B index=3D 17412 (slots=3D32768/   996)
> > [    5.959121] ath11k_pci 0000:01:00.0: swiotlb_tbl_map_single size=3D
> > 65535B index=3D   608 (slots=3D32768/   992)
> > [    5.959135] ath11k_pci 0000:01:00.0: swiotlb_tbl_map_single size=3D
> >  52B index=3D  8195 (slots=3D32768/   993)
> > [    5.978619] ath11k_pci 0000:01:00.0: swiotlb_tbl_map_single size=3D
> > 6224B index=3D 17416 (slots=3D32768/   997)
> > [    5.989588] ath11k_pci 0000:01:00.0: swiotlb_tbl_map_single size=3D
> > 65535B index=3D   640 (slots=3D32768/   992)
> > [    5.989738] ath11k_pci 0000:01:00.0: swiotlb_tbl_map_single size=3D
> > 6224B index=3D 17420 (slots=3D32768/   996)
> > [    6.010215] ath11k_pci 0000:01:00.0: swiotlb_tbl_map_single size=3D
> > 65535B index=3D   672 (slots=3D32768/   992)
> > [    6.020001] ath11k_pci 0000:01:00.0: swiotlb_tbl_map_single size=3D
> > 65535B index=3D   704 (slots=3D32768/   992)
> > [    6.020158] ath11k_pci 0000:01:00.0: swiotlb_tbl_map_single size=3D
> > 6224B index=3D 17424 (slots=3D32768/   996)
> > [    6.040643] ath11k_pci 0000:01:00.0: swiotlb_tbl_map_single size=3D
> > 65535B index=3D   736 (slots=3D32768/   992)
> > [    6.040798] ath11k_pci 0000:01:00.0: swiotlb_tbl_map_single size=3D
> > 6224B index=3D 17428 (slots=3D32768/   996)
> > [    6.061287] ath11k_pci 0000:01:00.0: swiotlb_tbl_map_single size=3D
> > 65535B index=3D   768 (slots=3D32768/   992)
> > [    6.061437] ath11k_pci 0000:01:00.0: swiotlb_tbl_map_single size=3D
> > 6224B index=3D 17432 (slots=3D32768/   996)
> > [    6.081918] ath11k_pci 0000:01:00.0: swiotlb_tbl_map_single size=3D
> > 65535B index=3D   800 (slots=3D32768/   992)
> > [    6.081929] ath11k_pci 0000:01:00.0: swiotlb_tbl_map_single size=3D
> >  52B index=3D  8196 (slots=3D32768/   993)
> > [    6.101409] ath11k_pci 0000:01:00.0: swiotlb_tbl_map_single size=3D
> > 6224B index=3D 17436 (slots=3D32768/   997)
> > [    6.112375] ath11k_pci 0000:01:00.0: swiotlb_tbl_map_single size=3D
> > 65535B index=3D   832 (slots=3D32768/   992)
> > [    6.112528] ath11k_pci 0000:01:00.0: swiotlb_tbl_map_single size=3D
> > 6224B index=3D 17440 (slots=3D32768/   996)
> > [    6.133004] ath11k_pci 0000:01:00.0: swiotlb_tbl_map_single size=3D
> > 65535B index=3D   864 (slots=3D32768/   992)
> > [    6.142785] ath11k_pci 0000:01:00.0: swiotlb_tbl_map_single size=3D
> > 65535B index=3D   896 (slots=3D32768/   992)
> > [    6.142949] ath11k_pci 0000:01:00.0: swiotlb_tbl_map_single size=3D
> > 6224B index=3D 17444 (slots=3D32768/   996)
> > [    6.163426] ath11k_pci 0000:01:00.0: swiotlb_tbl_map_single size=3D
> > 65535B index=3D   928 (slots=3D32768/   992)
> > [    6.163576] ath11k_pci 0000:01:00.0: swiotlb_tbl_map_single size=3D
> > 6224B index=3D 17448 (slots=3D32768/   996)
> > [    6.184058] ath11k_pci 0000:01:00.0: swiotlb_tbl_map_single size=3D
> > 65535B index=3D   960 (slots=3D32768/   992)
> > [    6.184208] ath11k_pci 0000:01:00.0: swiotlb_tbl_map_single size=3D
> > 6224B index=3D 17452 (slots=3D32768/   996)
> > [    6.204691] ath11k_pci 0000:01:00.0: swiotlb_tbl_map_single size=3D
> > 65535B index=3D   992 (slots=3D32768/   992)
> > [    6.204704] ath11k_pci 0000:01:00.0: swiotlb_tbl_map_single size=3D
> >  52B index=3D  8197 (slots=3D32768/   993)
> > [    6.224183] ath11k_pci 0000:01:00.0: swiotlb_tbl_map_single size=3D
> > 6224B index=3D 17456 (slots=3D32768/   997)
> > [    6.235148] ath11k_pci 0000:01:00.0: swiotlb_tbl_map_single size=3D
> > 65535B index=3D  1024 (slots=3D32768/   992)
> > [    6.235308] ath11k_pci 0000:01:00.0: swiotlb_tbl_map_single size=3D
> > 6224B index=3D 17460 (slots=3D32768/   996)
> > [    6.255777] ath11k_pci 0000:01:00.0: swiotlb_tbl_map_single size=3D
> > 65535B index=3D  1056 (slots=3D32768/   992)
> > [    6.265552] ath11k_pci 0000:01:00.0: swiotlb_tbl_map_single size=3D
> > 65535B index=3D  1088 (slots=3D32768/   992)
> > [    6.265633] ath11k_pci 0000:01:00.0: swiotlb_tbl_map_single size=3D
> > 2128B index=3D 17464 (slots=3D32768/   994)
> > [    6.286142] ath11k_pci 0000:01:00.0: swiotlb_tbl_map_single size=3D
> > 65535B index=3D  1120 (slots=3D32768/   992)
> > [    6.286182] ath11k_pci 0000:01:00.0: swiotlb_tbl_map_single size=3D
> >  72B index=3D 17466 (slots=3D32768/   993)
> > [    7.574489] ath11k_pci 0000:01:00.0: swiotlb_tbl_map_single size=3D
> > 65535B index=3D  1152 (slots=3D32768/   992)
> > [    7.584645] ath11k_pci 0000:01:00.0: swiotlb_tbl_map_single size=3D
> >  60B index=3D 17467 (slots=3D32768/   993)
> > [    7.595593] ath11k_pci 0000:01:00.0: swiotlb_tbl_map_single size=3D
> > 65535B index=3D  1184 (slots=3D32768/   992)
> > [    7.595608] ath11k_pci 0000:01:00.0: swiotlb_tbl_map_single size=3D
> >  52B index=3D  8198 (slots=3D32768/   993)
> > [    7.605359] ath11k_pci 0000:01:00.0: swiotlb_tbl_map_single size=3D
> > 65535B index=3D  1216 (slots=3D32768/   993)
> > [    7.624703] ath11k_pci 0000:01:00.0: swiotlb_tbl_map_single size=3D
> > 452B index=3D  1248 (slots=3D32768/   993)
> > [    7.635603] ath11k_pci 0000:01:00.0: swiotlb_tbl_map_single size=3D
> > 65535B index=3D  1280 (slots=3D32768/   992)
> > [    7.645344] ath11k_pci 0000:01:00.0: swiotlb_tbl_map_single size=3D
> >  52B index=3D  1312 (slots=3D32768/   993)
> > [    7.656247] ath11k_pci 0000:01:00.0: swiotlb_tbl_map_single size=3D
> > 65535B index=3D  1314 (slots=3D32768/   992)
> > [    7.683567] ath11k_pci 0000:01:00.0: swiotlb_tbl_map_single size=3D
> > 65535B index=3D  1346 (slots=3D32768/   992)
> > [    7.696095] ath11k_pci 0000:01:00.0: swiotlb_tbl_map_single
> > size=3D1048583B index=3D    -1 (slots=3D32768/   992)
> >
> > I'm still trying to understand the swiotlb allocation to see if there
> > is some configuration change I should be making.
>
> I suspect you hit the same issue mentioned here:
>
> https://lore.kernel.org/all/CAOMZO5A7+nxACoBPY0k8cOpVQByZtEV_N1489MK5wETH=
F_RXWA@mail.gmail.com/
>
> so can you check if below commit present in your kernel, and if not could=
 you pick it up
> and try again?
>
> commit 14cebf689a78 ("swiotlb: Reinstate page-alignment for mappings >=3D=
 PAGE_SIZE")
>

I bisected the 'swiotlb buffer is full' issue back to commit
aaf244141ed7 ("wifi: ath11k: fix IOMMU errors on buffer rings") which
looks to me to be a legitimate fix and if I revert it swiotlb is now
happy and the driver registers but I get the crash on client connect
that I was seeing in 6.6 so that commit fixes an issue, but causes
swiotlb to not be fulfilled.

The issue seems to be that the swiotlb memory buffer allocator is
getting too fragmented to be useful with what ath11k is now asking for
(a lot of 2K and 64K buffers and then finally a 1048583B buffer which
fails due to the fragmentation of the swiotlb buffer.

I'm guessing that this has gone unnoticed for a while because there
are maybe not a lot of systems out there that require swiotlb with
ath11k (either no IOMMU or more memory than DMA can address) and my
guess is that if you test ath11k with swiotlb=3Dforce you will easily
see this 'swiotlb buffer is full' issue on other systems.

I'm not that knowledgeable about ath11k but I do know that ath10 and
ath12k do not have this issue with swiotlb. Debugging a bit shows that
there are a lot of large DMA buffers being requested by ath11k and I'm
wondering if that could be reduced or optimized somehow.

>
> >
> > To avoid using swiotlb is there some way to limit the memory region
> > used for DMA operations to below 32bit boundary yet still allow the
> > memory above 32bit to be useful in the system for userspace maybe?
> if you are using dma_alloc_coherent() I'm afraid there is no way for that=
. the API
> internally ignores any zone flags passed with the 'gfp' argument. see
>
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/k=
ernel/dma/mapping.c#n615
>

is DMA_RESTRICTED_POOL a solution for me?

Best Regards,

Tim

