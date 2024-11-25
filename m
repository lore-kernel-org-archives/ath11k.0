Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 703AFD58D75
	for <ath11k@archiver.kernel.org>; Mon, 25 Nov 2024 18:03:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zUwNW1fiQOjehljqiq/mNJRZdtuiZf6yZwSzEIXXiyM=; b=f1PISpcbD38LaGF5hgvNJjBP1H
	c1565WF8JsIdF9Tcj4OPEd6sOSjW31zQTtQTs/knQhGvLRQICKbQc7jZUIufCB9jzatgLxiUao5S+
	HiTaqUB4/xQ5qwjr8zgeGCRcFjJ5Rl9MjzIWPiVqucXknzjqdGjNveLMJqT0SGJwPcIfZL3E0xuX+
	StNQOcxJmZPrjeWQPMlpsq4XSGp5VO5SsaU/JPdC/ydFNEMGXIcZo+YfLocPsuL3mRQgdt2kZn9Ni
	GsIvUT4Mb7wO/AEr6sZlscjF/fRwZD0OnVboX+8EMAc8gB1l9x+hX3+xNuvruhI/5r8ma/riD10VB
	v8L9mq+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFdQK-00000008p9Z-41BK;
	Mon, 25 Nov 2024 18:03:00 +0000
Received: from mail-yb1-xb32.google.com ([2607:f8b0:4864:20::b32])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFdQH-00000008p9B-2YNr
	for ath11k@lists.infradead.org;
	Mon, 25 Nov 2024 18:02:58 +0000
Received: by mail-yb1-xb32.google.com with SMTP id 3f1490d57ef6-e382589e8fdso4689348276.0
        for <ath11k@lists.infradead.org>; Mon, 25 Nov 2024 10:02:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gateworks.com; s=google; t=1732557775; x=1733162575; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zUwNW1fiQOjehljqiq/mNJRZdtuiZf6yZwSzEIXXiyM=;
        b=q8KdoZ+/M2KqXaQaPHcV81rnQCqEsjaytMNGsc9tvZC4cs3ZCTFA+c+gjrHlN7V7Ct
         IoBpm6PtI7KO+E0s9s77XXyMlb/BUptyVyyGTfprivyH6mUF0C3qaKPab+srkH2rySkB
         Ek8OCfnsXekazwW05sA3qkMiIcBMjOBKzC+cgiMF5Cw9ztFWzW1xSeiFHukywPYn9xYF
         igfmq6A3Xi/s1BtN3BIzXXdQR73TKlbD2Gkr29QzBA5kINraAAKzc2qcILWU4y9MvojY
         zKVM1VbqJHOfAR70PXf+C/38iVo+dqj9xGxqJBiN1dwdh7xv/HQt9nKK6CXRj7Vo2Zlg
         BDHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732557775; x=1733162575;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zUwNW1fiQOjehljqiq/mNJRZdtuiZf6yZwSzEIXXiyM=;
        b=Stnp3ec7sFnqFlLj0VV9DIVQXmqfHq3rw8Zvvc/DCe+t75xG5f7FwYHNWzbkiDYSFX
         +1DlLqV453hw6IQT2r1bjzXKh+qnucx4F+aFgS7r1FiM09FidYYZ7JwV1lptEnIsNwY1
         PUxA9bYSQJi+0qXKottmP3V6k4TQH6gq/FvgsDQlIBMM0aK5l7Qx5z5is8wAn4D/9Qht
         L+bcPwckFvwIrRFhHQj+WQvSRrek6WfdSX4TkIlxL6ba8drPoihxSX+lnzlcKWXuRqER
         BcXS8OIc3r+PrNtGSv9tbrej77Gzh+CXeaUlhDcLYWQtZyW4nlTvIsvwP/GCcT5GgtGQ
         9TBw==
X-Gm-Message-State: AOJu0Yxav3B7nX6kWesoYZjHeC5ZfqrLAvRvjt4RixEB3OaCdGsLOjUM
	MFd15a5Uk1YNhKNK3sG/MDrpZcE/LlDelIjfFdalBRl9LMw197YO4UFuinv3XGXTV0JlqHTn7Kl
	NoQuRME+xTEnzpH9Ugvt3Jo0ihoPNQa4bqdgkWA==
X-Gm-Gg: ASbGncte/MwVm255gr2TVqdSTlYZUg7mgEejeocYUrTCSp6h6MpDdU8NVNLoCPjc6iQ
	vD3xr/oaCTecwp2HC8tQgocMVSlUYs/s=
X-Google-Smtp-Source: AGHT+IG44fE193oV8U9ZbSb3zN/BeoPbsGBFG4YdJco0vHjOk/D+w8ltMB4mtJGrperOAFYVvW4NaugLgDCu8w+u4QQ=
X-Received: by 2002:a05:6902:2e84:b0:e38:7d0d:d7df with SMTP id
 3f1490d57ef6-e38f8c0876cmr11704348276.50.1732557775257; Mon, 25 Nov 2024
 10:02:55 -0800 (PST)
MIME-Version: 1.0
References: <CAJ+vNU0EL3T+GyNAbVbGqYYQ5NM3h7cgAwqxxBMuZjh+-YQ3bA@mail.gmail.com>
 <1b2ea8b2-6fbe-4118-b6c6-742c8f0be476@quicinc.com>
In-Reply-To: <1b2ea8b2-6fbe-4118-b6c6-742c8f0be476@quicinc.com>
From: Tim Harvey <tharvey@gateworks.com>
Date: Mon, 25 Nov 2024 10:02:44 -0800
Message-ID: <CAJ+vNU1-OZ3y4p2L+zf64AiVtUv70yZNqkT20jTxyE0_gJb6Jg@mail.gmail.com>
Subject: Re: ath11k swiotlb buffer is full (on IMX8M with 4GiB DRAM)
To: Baochen Qiang <quic_bqiang@quicinc.com>
Cc: ath11k@lists.infradead.org, 
	linux-wireless <linux-wireless@vger.kernel.org>, Fabio Estevam <festevam@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241125_100257_655167_9D2EC716 
X-CRM114-Status: GOOD (  36.91  )
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

On Sun, Nov 24, 2024 at 11:23=E2=80=AFPM Baochen Qiang <quic_bqiang@quicinc=
.com> wrote:
>
>
>
> On 11/23/2024 8:43 AM, Tim Harvey wrote:
> > On Thu, Nov 21, 2024 at 9:51=E2=80=AFPM Baochen Qiang <quic_bqiang@quic=
inc.com> wrote:
> >>
> >>
> >>
> >> On 11/22/2024 5:50 AM, Tim Harvey wrote:
> >>> On Tue, Nov 19, 2024 at 6:32=E2=80=AFPM Baochen Qiang <quic_bqiang@qu=
icinc.com> wrote:
> >>>>
> >>>>
> >>>>
> >>>> On 11/20/2024 4:16 AM, Tim Harvey wrote:
> >>>>> Greetings,
> >>>>>
> >>>>> I've got an ath11k card that is failing to init on an IMX8MM system
> >>>>> with 4GB of DRAM:
> >>>>> [    7.551582] ath11k_pci 0000:01:00.0: BAR 0 [mem
> >>>>> 0x18000000-0x181fffff 64bit]: assigned
> >>>>> [    7.551713] ath11k_pci 0000:01:00.0: enabling device (0000 -> 00=
02)
> >>>>> [    7.552401] ath11k_pci 0000:01:00.0: MSI vectors: 16
> >>>>> [    7.552440] ath11k_pci 0000:01:00.0: qcn9074 hw1.0
> >>>>> [    7.887186] mhi mhi0: Loaded FW: ath11k/QCN9074/hw1.0/amss.bin,
> >>>>> sha256: 5ee1b7b204541b5f99984f21d694ececaec08fbce1b520ffe6fe740b02a=
4afd7
> >>>>> [    8.435964] ath11k_pci 0000:01:00.0: chip_id 0x0 chip_family 0x0
> >>>>> board_id 0xff soc_id 0xffffffff
> >>>>> [    8.435991] ath11k_pci 0000:01:00.0: fw_version 0x270206d0
> >>>>> fw_build_timestamp 2022-08-04 12:48 fw_build_id
> >>>>> WLAN.HK.2.7.0.1-01744-QCAHKSWPL_SILICONZ-1
> >>>>> [    8.441700] ath11k_pci 0000:01:00.0: Loaded FW:
> >>>>> ath11k/QCN9074/hw1.0/board-2.bin, sha256:
> >>>>> dbf0ca14aa1229eccd48f26f1026901b9718b143bd30b51b8ea67c84ba6207f1
> >>>>> [    9.753764] ath11k_pci 0000:01:00.0: Loaded FW:
> >>>>> ath11k/QCN9074/hw1.0/m3.bin, sha256:
> >>>>> b6d957f335073a15a8de809398e1506f0200a08747eaf7189c843cf519ffc1de
> >>>>> [    9.789791] ath11k_pci 0000:01:00.0: swiotlb buffer is full (sz:
> >>>>> 1048583 bytes), total 32768 (slots), used 2528 (slots)
> >>>>> [    9.789853] ath11k_pci 0000:01:00.0: failed to set up tcl_comp r=
ing (0) :-12
> >>>>> [    9.790238] ath11k_pci 0000:01:00.0: failed to init DP: -12
> >>>>> root@noble-venice:~# cat /proc/cmdline
> >>>>> console=3Dttymxc1,115200 earlycon=3Dec_imx6q,0x30890000,115200
> >>>>> root=3DPARTUUID=3D5cdde84f-01 rootwait net.ifnames=3D0 cma=3D196M
> >>>>>
> >>>>> The IMX8MM's DRAM base is at 1GB so anything above 3GB hits the 32b=
it
> >>>>> address boundary. If I pass in a mem=3D3096M the device registers j=
ust
> >>>>> fine.
> >>>> yeah ... that parameter makes kernel alloc memory below 32bit bounda=
ry, thus swiotlb is not necessary.
> >>>
> >>> Hi Baochen,
> >>>
> >>> Yes, that makes sense as I step through the code. On IMX8M with DRAM
> >>> 3GB or less dma_capable(...) is true so swiotlb bounce buffers are no=
t
> >>> needed.
> >>>
> >>>>
> >>>>>
> >>>>> I found this to be the case with modern kernels however I found
> >>>>> differing behavior with older kernels:
> >>>>> - 6.6 and 6.1 the device registers with 4GB DRAM but crashes on cli=
ent connect
> >>>>> - 5.15 devices registers with 4GB DRAM and appears to work just fin=
e
> >>>> are you using Linus' tree or the stable tree?
> >>>>
> >>>
> >>> For 6.6 I tested stable.
> >> can you try Linus's tree ? as I know the stable tree is possible to mi=
ss some important fix.
> >>
> >>>
> >>> This likely has something to do with commit dbd73acb22d8 ("wifi:
> >>> ath11k: enable 36 bit mask for stream DMA") but it would seem to me
> >>> that patch was trying to avoid the entire 32bit DMA limitation. Maybe
> >>> that patch sets the ath11k device DMA mask to 36 bits but maybe the
> >>> IMX8M PCI DMA is only capable of 32bits?
> >> that patch is making situation better, not worse. that said, it helps =
to avoid swiotlb in
> >> ath11k DMA, rather than to get it involved.
> >>
> >
> > Yes, that patch would be an improvement on systems capable of
> > addressing 64bit memory but not on the IMX8M which is seemingly
> > capable of only 32bit DMA over PCI.
> >
> >>>
> >>>>>
> >>>>> Could anyone explain what is going on here? Obviously there have be=
en
> >>>>> changes at some point to start using swiotlb which I believe was al=
l
> >>>>> about avoiding 32bit DMA limitations but I'm not clear how I should=
 be
> >>>>> configuring this for IMX8MM with 4GB DRAM. Maybe my kernel IOMMU
> >>>>> configuration is incorrect somehow?
> >>>> there are quite some options associated with IOMMU, not sure which o=
ne might be causing this. But basically you may check:
> >>>>
> >>>> CONFIG_IOMMU_IOVA
> >>>> CONFIG_IOMMU_API
> >>>> CONFIG_IOMMU_SUPPORT
> >>>> CONFIG_IOMMU_DMA=3Dy
> >>>>
> >>>
> >>> These are enabled which I believe appropriate for IMX8M. If I want to
> >>> utilize the full 4GB DRAM on IMX then I must use IOMMU and swiotlb
> >>> which would mean a performance hit due to copying mem to/from bounce
> >>> buffers not to mention the fact that I can't figure out how to
> >>> configure the system to avoid the 'swiotlb swiotlb buffer is full'
> >>> issue.
> >
> > My statement regarding needing an IOMMU above is wrong; apparently the
> > IMX8M SoC's don't have an IOMMU but the fact I have it enabled in the
> > kernel should be a don't-care. If I understand swiotlb correctly, if I
> > did have an IOMMU then it would be used instead of swiotlb.
> >
> >>>
> >>> Enabling CONFIG_SWIOTLB_DYNAMIC does not help nor does increasing the
> >>> number of slots - it has something to do with the number/size of DMA
> >>> buffers that ath11k is asking for:
> >> yeah, ath11k asks for fixed size DMA buffer regardless of that config.
> >>
> >>> # dmesg | grep swiotlb_tbl_map_single
> >>> [    5.237731] ath11k_pci 0000:01:00.0: swiotlb_tbl_map_single size=
=3D
> >>> 65535B index=3D 16384 (slots=3D32768/    32)
> >>> [    5.247519] ath11k_pci 0000:01:00.0: swiotlb_tbl_map_single size=
=3D
> >>> 65535B index=3D 16416 (slots=3D32768/    64)
> >>> [    5.261794] ath11k_pci 0000:01:00.0: swiotlb_tbl_map_single size=
=3D
> >>> 65535B index=3D 16448 (slots=3D32768/    96)
> >>> [    5.275114] ath11k_pci 0000:01:00.0: swiotlb_tbl_map_single size=
=3D
> >>> 65535B index=3D 16480 (slots=3D32768/   128)
> >>> [    5.287757] ath11k_pci 0000:01:00.0: swiotlb_tbl_map_single size=
=3D
> >>> 65535B index=3D 16512 (slots=3D32768/   160)
> >>> [    5.299688] ath11k_pci 0000:01:00.0: swiotlb_tbl_map_single size=
=3D
> >>> 65535B index=3D 16544 (slots=3D32768/   192)
> >>> [    5.312482] ath11k_pci 0000:01:00.0: swiotlb_tbl_map_single size=
=3D
> >>> 65535B index=3D 16576 (slots=3D32768/   224)
> >>> [    5.324493] ath11k_pci 0000:01:00.0: swiotlb_tbl_map_single size=
=3D
> >>> 65535B index=3D 16608 (slots=3D32768/   256)
> >>> [    5.337001] ath11k_pci 0000:01:00.0: swiotlb_tbl_map_single size=
=3D
> >>> 65535B index=3D 16640 (slots=3D32768/   288)
> >>> [    5.346754] ath11k_pci 0000:01:00.0: swiotlb_tbl_map_single size=
=3D
> >>> 65535B index=3D 16672 (slots=3D32768/   320)
> >>> [    5.356571] ath11k_pci 0000:01:00.0: swiotlb_tbl_map_single size=
=3D
> >>> 65535B index=3D 16704 (slots=3D32768/   352)
> >>> [    5.366372] ath11k_pci 0000:01:00.0: swiotlb_tbl_map_single size=
=3D
> >>> 65535B index=3D 16736 (slots=3D32768/   384)
> >>> [    5.376164] ath11k_pci 0000:01:00.0: swiotlb_tbl_map_single size=
=3D
> >>> 65535B index=3D 16768 (slots=3D32768/   416)
> >>> [    5.385944] ath11k_pci 0000:01:00.0: swiotlb_tbl_map_single size=
=3D
> >>> 65535B index=3D 16800 (slots=3D32768/   448)
> >>> [    5.395712] ath11k_pci 0000:01:00.0: swiotlb_tbl_map_single size=
=3D
> >>> 65535B index=3D 16832 (slots=3D32768/   480)
> >>> [    5.408270] ath11k_pci 0000:01:00.0: swiotlb_tbl_map_single size=
=3D
> >>> 65535B index=3D 16864 (slots=3D32768/   512)
> >>> [    5.419768] ath11k_pci 0000:01:00.0: swiotlb_tbl_map_single size=
=3D
> >>> 65535B index=3D 16896 (slots=3D32768/   544)
> >>> [    5.430966] ath11k_pci 0000:01:00.0: swiotlb_tbl_map_single size=
=3D
> >>> 65535B index=3D 16928 (slots=3D32768/   576)
> >>> [    5.442368] ath11k_pci 0000:01:00.0: swiotlb_tbl_map_single size=
=3D
> >>> 65535B index=3D 16960 (slots=3D32768/   608)
> >>> [    5.452422] ath11k_pci 0000:01:00.0: swiotlb_tbl_map_single size=
=3D
> >>> 65535B index=3D 16992 (slots=3D32768/   640)
> >>> [    5.463507] ath11k_pci 0000:01:00.0: swiotlb_tbl_map_single size=
=3D
> >>> 65535B index=3D 17024 (slots=3D32768/   672)
> >>> [    5.473536] ath11k_pci 0000:01:00.0: swiotlb_tbl_map_single size=
=3D
> >>> 65535B index=3D 17056 (slots=3D32768/   704)
> >>> [    5.485661] ath11k_pci 0000:01:00.0: swiotlb_tbl_map_single size=
=3D
> >>> 65535B index=3D 17088 (slots=3D32768/   736)
> >>> [    5.495404] ath11k_pci 0000:01:00.0: swiotlb_tbl_map_single size=
=3D
> >>> 65535B index=3D 17120 (slots=3D32768/   768)
> >>> [    5.509626] ath11k_pci 0000:01:00.0: swiotlb_tbl_map_single size=
=3D
> >>> 65535B index=3D 17152 (slots=3D32768/   800)
> >>> [    5.519353] ath11k_pci 0000:01:00.0: swiotlb_tbl_map_single size=
=3D
> >>> 65535B index=3D 17184 (slots=3D32768/   832)
> >>> [    5.529077] ath11k_pci 0000:01:00.0: swiotlb_tbl_map_single size=
=3D
> >>> 65535B index=3D 17216 (slots=3D32768/   864)
> >>> [    5.538799] ath11k_pci 0000:01:00.0: swiotlb_tbl_map_single size=
=3D
> >>> 65535B index=3D 17248 (slots=3D32768/   896)
> >>> [    5.548517] ath11k_pci 0000:01:00.0: swiotlb_tbl_map_single size=
=3D
> >>> 65535B index=3D 17280 (slots=3D32768/   928)
> >>> [    5.558238] ath11k_pci 0000:01:00.0: swiotlb_tbl_map_single size=
=3D
> >>> 65535B index=3D 17312 (slots=3D32768/   960)
> >>> [    5.567965] ath11k_pci 0000:01:00.0: swiotlb_tbl_map_single size=
=3D
> >>> 65535B index=3D 17344 (slots=3D32768/   992)
> >>> [    5.578943] ath11k_pci 0000:01:00.0: swiotlb_tbl_map_single size=
=3D
> >>> 65535B index=3D     0 (slots=3D32768/   992)
> >>> [    5.578964] ath11k_pci 0000:01:00.0: swiotlb_tbl_map_single size=
=3D
> >>>  52B index=3D  8192 (slots=3D32768/   993)
> >>> [    5.599793] ath11k_pci 0000:01:00.0: swiotlb_tbl_map_single size=
=3D
> >>> 65535B index=3D    32 (slots=3D32768/   992)
> >>> [    5.599861] ath11k_pci 0000:01:00.0: swiotlb_tbl_map_single size=
=3D
> >>>  68B index=3D  8193 (slots=3D32768/   993)
> >>> [    5.609589] ath11k_pci 0000:01:00.0: swiotlb_tbl_map_single size=
=3D
> >>> 65535B index=3D    64 (slots=3D32768/   993)
> >>> [    5.628921] ath11k_pci 0000:01:00.0: swiotlb_tbl_map_single size=
=3D
> >>> 65535B index=3D    96 (slots=3D32768/   992)
> >>> [    5.638703] ath11k_pci 0000:01:00.0: swiotlb_tbl_map_single size=
=3D
> >>>  68B index=3D 17376 (slots=3D32768/   993)
> >>> [    5.649602] ath11k_pci 0000:01:00.0: swiotlb_tbl_map_single size=
=3D
> >>> 65535B index=3D   128 (slots=3D32768/   992)
> >>> [    5.659389] ath11k_pci 0000:01:00.0: swiotlb_tbl_map_single size=
=3D
> >>> 65535B index=3D   160 (slots=3D32768/   992)
> >>> [    5.674038] ath11k_pci 0000:01:00.0: swiotlb_tbl_map_single size=
=3D
> >>>  96B index=3D 17377 (slots=3D32768/   993)
> >>> [    5.685016] ath11k_pci 0000:01:00.0: swiotlb_tbl_map_single size=
=3D
> >>> 65535B index=3D   192 (slots=3D32768/   992)
> >>> [    5.694819] ath11k_pci 0000:01:00.0: swiotlb_tbl_map_single size=
=3D
> >>> 65535B index=3D   224 (slots=3D32768/   992)
> >>> [    5.694831] ath11k_pci 0000:01:00.0: swiotlb_tbl_map_single size=
=3D
> >>>  52B index=3D 17378 (slots=3D32768/   993)
> >>> [    5.714194] ath11k_pci 0000:01:00.0: swiotlb_tbl_map_single size=
=3D
> >>>  40B index=3D 17379 (slots=3D32768/   994)
> >>> [    5.725089] ath11k_pci 0000:01:00.0: swiotlb_tbl_map_single size=
=3D
> >>> 65535B index=3D   256 (slots=3D32768/   992)
> >>> [    5.753507] ath11k_pci 0000:01:00.0: swiotlb_tbl_map_single size=
=3D
> >>> 6224B index=3D 17380 (slots=3D32768/   996)
> >>> [    5.764668] ath11k_pci 0000:01:00.0: swiotlb_tbl_map_single size=
=3D
> >>> 65535B index=3D   288 (slots=3D32768/   992)
> >>> [    5.774456] ath11k_pci 0000:01:00.0: swiotlb_tbl_map_single size=
=3D
> >>> 65535B index=3D   320 (slots=3D32768/   992)
> >>> [    5.774620] ath11k_pci 0000:01:00.0: swiotlb_tbl_map_single size=
=3D
> >>> 6224B index=3D 17384 (slots=3D32768/   996)
> >>> [    5.795091] ath11k_pci 0000:01:00.0: swiotlb_tbl_map_single size=
=3D
> >>> 65535B index=3D   352 (slots=3D32768/   992)
> >>> [    5.795241] ath11k_pci 0000:01:00.0: swiotlb_tbl_map_single size=
=3D
> >>> 6224B index=3D 17388 (slots=3D32768/   996)
> >>> [    5.815724] ath11k_pci 0000:01:00.0: swiotlb_tbl_map_single size=
=3D
> >>> 65535B index=3D   384 (slots=3D32768/   992)
> >>> [    5.815884] ath11k_pci 0000:01:00.0: swiotlb_tbl_map_single size=
=3D
> >>> 6224B index=3D 17392 (slots=3D32768/   996)
> >>> [    5.836357] ath11k_pci 0000:01:00.0: swiotlb_tbl_map_single size=
=3D
> >>> 65535B index=3D   416 (slots=3D32768/   992)
> >>> [    5.836368] ath11k_pci 0000:01:00.0: swiotlb_tbl_map_single size=
=3D
> >>>  52B index=3D  8194 (slots=3D32768/   993)
> >>> [    5.855856] ath11k_pci 0000:01:00.0: swiotlb_tbl_map_single size=
=3D
> >>> 6224B index=3D 17396 (slots=3D32768/   997)
> >>> [    5.866818] ath11k_pci 0000:01:00.0: swiotlb_tbl_map_single size=
=3D
> >>> 65535B index=3D   448 (slots=3D32768/   992)
> >>> [    5.866978] ath11k_pci 0000:01:00.0: swiotlb_tbl_map_single size=
=3D
> >>> 6224B index=3D 17400 (slots=3D32768/   996)
> >>> [    5.887451] ath11k_pci 0000:01:00.0: swiotlb_tbl_map_single size=
=3D
> >>> 65535B index=3D   480 (slots=3D32768/   992)
> >>> [    5.897231] ath11k_pci 0000:01:00.0: swiotlb_tbl_map_single size=
=3D
> >>> 65535B index=3D   512 (slots=3D32768/   992)
> >>> [    5.897389] ath11k_pci 0000:01:00.0: swiotlb_tbl_map_single size=
=3D
> >>> 6224B index=3D 17404 (slots=3D32768/   996)
> >>> [    5.917866] ath11k_pci 0000:01:00.0: swiotlb_tbl_map_single size=
=3D
> >>> 65535B index=3D   544 (slots=3D32768/   992)
> >>> [    5.918026] ath11k_pci 0000:01:00.0: swiotlb_tbl_map_single size=
=3D
> >>> 6224B index=3D 17408 (slots=3D32768/   996)
> >>> [    5.938489] ath11k_pci 0000:01:00.0: swiotlb_tbl_map_single size=
=3D
> >>> 65535B index=3D   576 (slots=3D32768/   992)
> >>> [    5.938642] ath11k_pci 0000:01:00.0: swiotlb_tbl_map_single size=
=3D
> >>> 6224B index=3D 17412 (slots=3D32768/   996)
> >>> [    5.959121] ath11k_pci 0000:01:00.0: swiotlb_tbl_map_single size=
=3D
> >>> 65535B index=3D   608 (slots=3D32768/   992)
> >>> [    5.959135] ath11k_pci 0000:01:00.0: swiotlb_tbl_map_single size=
=3D
> >>>  52B index=3D  8195 (slots=3D32768/   993)
> >>> [    5.978619] ath11k_pci 0000:01:00.0: swiotlb_tbl_map_single size=
=3D
> >>> 6224B index=3D 17416 (slots=3D32768/   997)
> >>> [    5.989588] ath11k_pci 0000:01:00.0: swiotlb_tbl_map_single size=
=3D
> >>> 65535B index=3D   640 (slots=3D32768/   992)
> >>> [    5.989738] ath11k_pci 0000:01:00.0: swiotlb_tbl_map_single size=
=3D
> >>> 6224B index=3D 17420 (slots=3D32768/   996)
> >>> [    6.010215] ath11k_pci 0000:01:00.0: swiotlb_tbl_map_single size=
=3D
> >>> 65535B index=3D   672 (slots=3D32768/   992)
> >>> [    6.020001] ath11k_pci 0000:01:00.0: swiotlb_tbl_map_single size=
=3D
> >>> 65535B index=3D   704 (slots=3D32768/   992)
> >>> [    6.020158] ath11k_pci 0000:01:00.0: swiotlb_tbl_map_single size=
=3D
> >>> 6224B index=3D 17424 (slots=3D32768/   996)
> >>> [    6.040643] ath11k_pci 0000:01:00.0: swiotlb_tbl_map_single size=
=3D
> >>> 65535B index=3D   736 (slots=3D32768/   992)
> >>> [    6.040798] ath11k_pci 0000:01:00.0: swiotlb_tbl_map_single size=
=3D
> >>> 6224B index=3D 17428 (slots=3D32768/   996)
> >>> [    6.061287] ath11k_pci 0000:01:00.0: swiotlb_tbl_map_single size=
=3D
> >>> 65535B index=3D   768 (slots=3D32768/   992)
> >>> [    6.061437] ath11k_pci 0000:01:00.0: swiotlb_tbl_map_single size=
=3D
> >>> 6224B index=3D 17432 (slots=3D32768/   996)
> >>> [    6.081918] ath11k_pci 0000:01:00.0: swiotlb_tbl_map_single size=
=3D
> >>> 65535B index=3D   800 (slots=3D32768/   992)
> >>> [    6.081929] ath11k_pci 0000:01:00.0: swiotlb_tbl_map_single size=
=3D
> >>>  52B index=3D  8196 (slots=3D32768/   993)
> >>> [    6.101409] ath11k_pci 0000:01:00.0: swiotlb_tbl_map_single size=
=3D
> >>> 6224B index=3D 17436 (slots=3D32768/   997)
> >>> [    6.112375] ath11k_pci 0000:01:00.0: swiotlb_tbl_map_single size=
=3D
> >>> 65535B index=3D   832 (slots=3D32768/   992)
> >>> [    6.112528] ath11k_pci 0000:01:00.0: swiotlb_tbl_map_single size=
=3D
> >>> 6224B index=3D 17440 (slots=3D32768/   996)
> >>> [    6.133004] ath11k_pci 0000:01:00.0: swiotlb_tbl_map_single size=
=3D
> >>> 65535B index=3D   864 (slots=3D32768/   992)
> >>> [    6.142785] ath11k_pci 0000:01:00.0: swiotlb_tbl_map_single size=
=3D
> >>> 65535B index=3D   896 (slots=3D32768/   992)
> >>> [    6.142949] ath11k_pci 0000:01:00.0: swiotlb_tbl_map_single size=
=3D
> >>> 6224B index=3D 17444 (slots=3D32768/   996)
> >>> [    6.163426] ath11k_pci 0000:01:00.0: swiotlb_tbl_map_single size=
=3D
> >>> 65535B index=3D   928 (slots=3D32768/   992)
> >>> [    6.163576] ath11k_pci 0000:01:00.0: swiotlb_tbl_map_single size=
=3D
> >>> 6224B index=3D 17448 (slots=3D32768/   996)
> >>> [    6.184058] ath11k_pci 0000:01:00.0: swiotlb_tbl_map_single size=
=3D
> >>> 65535B index=3D   960 (slots=3D32768/   992)
> >>> [    6.184208] ath11k_pci 0000:01:00.0: swiotlb_tbl_map_single size=
=3D
> >>> 6224B index=3D 17452 (slots=3D32768/   996)
> >>> [    6.204691] ath11k_pci 0000:01:00.0: swiotlb_tbl_map_single size=
=3D
> >>> 65535B index=3D   992 (slots=3D32768/   992)
> >>> [    6.204704] ath11k_pci 0000:01:00.0: swiotlb_tbl_map_single size=
=3D
> >>>  52B index=3D  8197 (slots=3D32768/   993)
> >>> [    6.224183] ath11k_pci 0000:01:00.0: swiotlb_tbl_map_single size=
=3D
> >>> 6224B index=3D 17456 (slots=3D32768/   997)
> >>> [    6.235148] ath11k_pci 0000:01:00.0: swiotlb_tbl_map_single size=
=3D
> >>> 65535B index=3D  1024 (slots=3D32768/   992)
> >>> [    6.235308] ath11k_pci 0000:01:00.0: swiotlb_tbl_map_single size=
=3D
> >>> 6224B index=3D 17460 (slots=3D32768/   996)
> >>> [    6.255777] ath11k_pci 0000:01:00.0: swiotlb_tbl_map_single size=
=3D
> >>> 65535B index=3D  1056 (slots=3D32768/   992)
> >>> [    6.265552] ath11k_pci 0000:01:00.0: swiotlb_tbl_map_single size=
=3D
> >>> 65535B index=3D  1088 (slots=3D32768/   992)
> >>> [    6.265633] ath11k_pci 0000:01:00.0: swiotlb_tbl_map_single size=
=3D
> >>> 2128B index=3D 17464 (slots=3D32768/   994)
> >>> [    6.286142] ath11k_pci 0000:01:00.0: swiotlb_tbl_map_single size=
=3D
> >>> 65535B index=3D  1120 (slots=3D32768/   992)
> >>> [    6.286182] ath11k_pci 0000:01:00.0: swiotlb_tbl_map_single size=
=3D
> >>>  72B index=3D 17466 (slots=3D32768/   993)
> >>> [    7.574489] ath11k_pci 0000:01:00.0: swiotlb_tbl_map_single size=
=3D
> >>> 65535B index=3D  1152 (slots=3D32768/   992)
> >>> [    7.584645] ath11k_pci 0000:01:00.0: swiotlb_tbl_map_single size=
=3D
> >>>  60B index=3D 17467 (slots=3D32768/   993)
> >>> [    7.595593] ath11k_pci 0000:01:00.0: swiotlb_tbl_map_single size=
=3D
> >>> 65535B index=3D  1184 (slots=3D32768/   992)
> >>> [    7.595608] ath11k_pci 0000:01:00.0: swiotlb_tbl_map_single size=
=3D
> >>>  52B index=3D  8198 (slots=3D32768/   993)
> >>> [    7.605359] ath11k_pci 0000:01:00.0: swiotlb_tbl_map_single size=
=3D
> >>> 65535B index=3D  1216 (slots=3D32768/   993)
> >>> [    7.624703] ath11k_pci 0000:01:00.0: swiotlb_tbl_map_single size=
=3D
> >>> 452B index=3D  1248 (slots=3D32768/   993)
> >>> [    7.635603] ath11k_pci 0000:01:00.0: swiotlb_tbl_map_single size=
=3D
> >>> 65535B index=3D  1280 (slots=3D32768/   992)
> >>> [    7.645344] ath11k_pci 0000:01:00.0: swiotlb_tbl_map_single size=
=3D
> >>>  52B index=3D  1312 (slots=3D32768/   993)
> >>> [    7.656247] ath11k_pci 0000:01:00.0: swiotlb_tbl_map_single size=
=3D
> >>> 65535B index=3D  1314 (slots=3D32768/   992)
> >>> [    7.683567] ath11k_pci 0000:01:00.0: swiotlb_tbl_map_single size=
=3D
> >>> 65535B index=3D  1346 (slots=3D32768/   992)
> >>> [    7.696095] ath11k_pci 0000:01:00.0: swiotlb_tbl_map_single
> >>> size=3D1048583B index=3D    -1 (slots=3D32768/   992)
> >>>
> >>> I'm still trying to understand the swiotlb allocation to see if there
> >>> is some configuration change I should be making.
> >>
> >> I suspect you hit the same issue mentioned here:
> >>
> >> https://lore.kernel.org/all/CAOMZO5A7+nxACoBPY0k8cOpVQByZtEV_N1489MK5w=
ETHF_RXWA@mail.gmail.com/
> >>
> >> so can you check if below commit present in your kernel, and if not co=
uld you pick it up
> >> and try again?
> >>
> >> commit 14cebf689a78 ("swiotlb: Reinstate page-alignment for mappings >=
=3D PAGE_SIZE")
> ignore this request since it should be no related to your issue :(
>
> >>
> >
> > I bisected the 'swiotlb buffer is full' issue back to commit
> > aaf244141ed7 ("wifi: ath11k: fix IOMMU errors on buffer rings") which
> > looks to me to be a legitimate fix and if I revert it swiotlb is now
> > happy and the driver registers but I get the crash on client connect
> > that I was seeing in 6.6 so that commit fixes an issue, but causes
> > swiotlb to not be fulfilled.
> not really ... that commit is not the cause to your issue. you don;t see =
the 'swiotlb
> full' error after revert it simply because dma_map_single() is NOT called=
 then.
>
>
> >
> > The issue seems to be that the swiotlb memory buffer allocator is
> > getting too fragmented to be useful with what ath11k is now asking for
> > (a lot of 2K and 64K buffers and then finally a 1048583B buffer which
> > fails due to the fragmentation of the swiotlb buffer.
> no, the direct cause to 'swiotlb full' error is that kernel does not allo=
w a swiotlb map
> request larger than 256kb [1]:
>
> 'A single allocation from swiotlb is limited to IO_TLB_SIZE * IO_TLB_SEGS=
IZE bytes, which
> is 256 KiB with current definitions'
>
> while here ath11k is requesting a buffer of 1048583 bytes.
>
>
> howevr the question is that why swiotlb is involved here: for streamed DM=
A operation
> ath11k is capable of addressing 64GB memory (with 36bit DMA mask), in you=
r case this
> covers whole system memory. the most possible reason I can think of is th=
at swiotlb is
> forcebly enabled in your kernel (with swiotlb=3Dforce?) such that each DM=
A buffer would be
> bounced by swiotlb regardless of its physical address.
>

I do not have swiotlb forced explicitly. Again, this is because I'm on
a IMX8MM with 4GiB DRAM which has no IOMMU and a 32bit DMA where
peripherals can not access memory over 3GiB as its base DRAM starting
at 1GiB (so swiotlb is getting used with a DRAM size >3GiB).

Reverting commit d0e2523bfa9c ("ath11k: allocate HAL_WBM2SW_RELEASE
ring from cacheable memory") indeed resolves this issue.

I notice that ath12k has a similar architecture as ath11k where
ath12k_dp_srng_setup() looks like what ath11k_dp_srng_setup() before
the change to allocate its buffers from cacheable memory so it's
probably just a matter of time before the same changes are made to
ath12k which will break that for this platform/memory-size as well.

So the way I see to resolve this either:
a) revert commit d0e2523bfa9c ("ath11k: allocate HAL_WBM2SW_RELEASE
ring from cacheable memory") - to stop asking for buffers >256KiB
b) find some other use of that upper 1GiB so that it can't be
allocated by DMA and swiotlb isn't needed
c) tell my board users to use mem=3D3096M and lose that last 1GiB of DRAM

>
>
> [1] Documentation/core-api/swiotlb.rst
>
> >
> > I'm guessing that this has gone unnoticed for a while because there
> > are maybe not a lot of systems out there that require swiotlb with
> > ath11k (either no IOMMU or more memory than DMA can address) and my
> > guess is that if you test ath11k with swiotlb=3Dforce you will easily
> > see this 'swiotlb buffer is full' issue on other systems.
> >
> > I'm not that knowledgeable about ath11k but I do know that ath10 and
> > ath12k do not have this issue with swiotlb. Debugging a bit shows that
> > there are a lot of large DMA buffers being requested by ath11k and I'm
> > wondering if that could be reduced or optimized somehow.
> >
> >>
> >>>
> >>> To avoid using swiotlb is there some way to limit the memory region
> >>> used for DMA operations to below 32bit boundary yet still allow the
> >>> memory above 32bit to be useful in the system for userspace maybe?
> >> if you are using dma_alloc_coherent() I'm afraid there is no way for t=
hat. the API
> >> internally ignores any zone flags passed with the 'gfp' argument. see
> >>
> >> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tre=
e/kernel/dma/mapping.c#n615
> >>
> >
> > is DMA_RESTRICTED_POOL a solution for me?
> i don;t think this help since this is used in coherent DMA?
>

While DMA_RESTRICTED_POOL does allow defining the area used by swiotlb
it doesn't change the way swiotlb allocates buffers or the fact that
swiotlb is used at all.

Best Regards,

Tim


> >
> > Best Regards,
> >
> > Tim
> >
>

