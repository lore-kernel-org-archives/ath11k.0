Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6E97CA6015
	for <ath11k@archiver.kernel.org>; Fri,  9 Oct 2026 02:27:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:MIME-Version:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=egxi+201yGET8ndQ3kOqOy3K5QsLp7SfAN0KuoJ9QK0=; b=XVgGowB0ipd64Ju9zw01U+524F
	4qhL0Wo/qPrSp1WlKbekx7WZCr8I8syC7Bgkp9TnZ/BNKXU2cc14oOHI+k0e/5Yt85mskP5OjQjdU
	a3DexXvH3k5IPZtC2hi9EMwmkm+uwSZA9tbg8ih6Z3Dh+yZQY2CHJrJRWuJZ+qw865xCkyMVqQyNM
	s0blPgXYPyMbRNppcFcWxICkiN9IoHW65rxH8G8mamu9PKT603LlTVQjXwNF7Ss7UsZUxnozgs7Hr
	UNG9QVc9w0ual0XHiJ1u2nhL5wiQh5y/yRglxvFY2Gr9J6Mtsz2zNstlAwBceXaScpqgIFkOheqmr
	jK+ReqPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF0KD-00000005HlU-2e3V;
	Fri, 09 Oct 2026 02:27:09 +0000
Received: from mail-vk1-xa2b.google.com ([2607:f8b0:4864:20::a2b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF0KA-00000005Hl0-1j5V
	for ath11k@lists.infradead.org;
	Fri, 09 Oct 2026 02:27:07 +0000
Received: by mail-vk1-xa2b.google.com with SMTP id 71dfb90a1353d-5dc2dc6d3fdso1401857e0c.0
        for <ath11k@lists.infradead.org>; Thu, 08 Oct 2026 19:27:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791512825; cv=none;
        d=google.com; s=arc-20260327;
        b=dtssyG+Oviw46jKtqHzoJB6uN9b2CtnI+u5woPKwzfeCVBKwRgVIJU9caAwtsAEZf0
         +Vjh+P/x3wNQ54mRZUJBfjl6V6bpoVZ14aUk/rf342G/138CEzM7azr4945KukaLARZB
         nO+DP/QLLvkGNQLRknnqE3ms1DpyPLvEBrrNSAfBVz4ga0pZzJrFVN8i5Dly5dhrQEZC
         k4W24If8HY1VDL/uw1LACVTAvXxPCGWIt/GN0rZhfcB+yEXRmIhDex4JwoVx9aAwuEoU
         k3R+Bpyeql41mPIK8wC3GyNmGCMpb9XGtksuDaHLEbAZJo/A7+MDv0l+6d9WwtgDdI9O
         UoNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=egxi+201yGET8ndQ3kOqOy3K5QsLp7SfAN0KuoJ9QK0=;
        fh=oCTNZ+ERBrbtkfMPw7n0IUReDZfGw+CVfzNMjqGgVnM=;
        b=WKnxm00c/jgXsm7oo7JvrIH1KZ6R7WTew5F/mcENzS5ZYejcAmwjruiekBK8CwedMw
         +mYyWZLs65PRWa0V7SfM/5Rt6wbD68MvhSzHEE4jq+gf/k0bV++oxYbkPIvL0bdoG1C/
         cJRKBHmjL7LSpuHM8hkA8aXjBFMbpl5EAahbKOdyfDUlC4+9/HV2j6RG82OPmMN36ASx
         jvv0Kq/vm1UaNtf16AtACYXzK6Mt94iBeV3YbT1gYHPia3f+F7+Qmb2JizljqCABD7kd
         jwp2foElBD+EuAxiVzGpskinILBCbim8tPGtLvaFeOF1RLVqXHRSB7uElJzIv1VwGqOe
         PTOw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791512825; x=1792117625; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=egxi+201yGET8ndQ3kOqOy3K5QsLp7SfAN0KuoJ9QK0=;
        b=iAlujzuC3ZIjVJT3SapAIsI6uc+KJAmbwLwRSMM2jYeZyHPU7/1yBsiDfrYb04itSV
         dhpbhjWOHsAlBaOrlaledHcXIcf3OOjHjYxJGQ0UQNejW5vK8H5i/Qq6EXa0c6rMosTE
         +qWNcUw0k2cZG2vsi4NjMYfsA1ySms/n09O/Wd8M6uQPWnZqTlYKmq8hQ6nvJlUTbA0S
         YW+nePoNlMGrHy9XvEagSM/W0TXUVAL/l8v0z8nEbJCTk9GdBi+RHpVyRRGY42P7RAMV
         wedljgOguA1XmK7pY6sp3bOlj52Ea8CXUzdoOittF+xGPNJPYEj9pmp5IBjGpFjq7jMZ
         ZPIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791512825; x=1792117625;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=egxi+201yGET8ndQ3kOqOy3K5QsLp7SfAN0KuoJ9QK0=;
        b=mbcRP+D8gDTIWlIArBFaBPq4opPN8sNE9jzbKu6hKaWaW7Ifuzm+IjPFZazwr37V96
         d7vMEvlwtmrRlWxQH78h7U8NkjmNOfN6mxJshrEOecXCDTPS2WKKOlBGEMvaxmA379Gv
         +kLwzIZzXXZFC05QZWkm4aJpjyELvUaK+TYe8RXxmUl+rb2V5KfiJjeTblnl9BZeQm3J
         PnU89VbWdd/ff1G3oPVWXENIwuN7BjHuiKNQWtQb4Ga0h387hViLLnbdFCI7n+z4qgjC
         1rPPHb7bd7eZKYmuFtbN0zFHVS3pX+bk/CubiPRzPKXypJ2qZ7y24ZVr3voNFuWDzCBD
         p6KA==
X-Gm-Message-State: AFq9FYLrwXtCCJyk+FMxtVgdnNty4Om+V3gAJ006CDIKBy4Ihd1ZXa1Z
	z2BaqNsFbkKUVtw+/aa1jqy3bLQxTHMPyHCQee7PC1oAzoM1+SaWntVu3FtsXZw3MqjJjFobTo0
	ciu4M5YXqcPSln+UjGZCIm/Nb+MuDZmdVRZIe
X-Gm-Gg: AYBFou0uUGYe1I7TJqSPQuMzm4IsOoHyyjrZGFMqS5HnH2DwXB1K8zAcm4FFujgEwVF
	t9DJslosb51818gDBwNth6XYZ6LxYGd8hKZAQ4fRbVMPLMnkCbalN9GDU3KxUQd2mm7LtIkBzc9
	aRk+LE+xfEOUaR6+2xJ7l4Hgsfxyne0oN+XnZLejKigxwTHVWpmDCGIGg00+2VsuuzHFS2QnvYo
	xwZVo3gQkFpuikQO27ZLUrVGlXPw8hDShfaXIqdLN+jCaQ9vkJK0Yp3OqcyqGsyw567q2ob+4Jw
	buUf1D5o/bHmGbHq6TFwpF930CmHs7sCNDSY6SsGaiiXzDnyLBhVQw==
X-Received: by 2002:a05:6102:6b0b:b0:7cb:1546:f54a with SMTP id
 ada2fe7eead31-7cb373e6b92mr162183137.31.1791512824847; Thu, 08 Oct 2026
 19:27:04 -0700 (PDT)
MIME-Version: 1.0
From: Christopher Griffin <christophergriffin05@gmail.com>
Date: Thu, 8 Oct 2026 21:26:54 -0500
X-Gm-Features: AclHuK-bsiErsf7TWx5azqLJmbMhHSpk6SEMD_NhsaC9UTLVN3kQF_L2MJrtOq8
Message-ID: <CAKobHXBuRr2Mz=yqFoqzQpeL9nY6ZeXY1HftEwyUxPYoDkS_+w@mail.gmail.com>
Subject: ath11k: QCN9074 public firmware stalls at QMI cap request on C-360
To: ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, Jeff Johnson <jjohnson@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_192706_471285_134796C4 
X-CRM114-Status: GOOD (  14.33  )
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

To: Jeff Johnson <jjohnson@kernel.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org
Subject: ath11k: QCN9074 public firmware stalls at QMI cap request on C-360

Hello Jeff, hello ath11k list,

I'm bringing up OpenWrt on the Arista C-360 access point (IPQ8076A with
two QCN9074 cards, 17cb:1104). The IPQ8074 radios run the public
firmware fine. The two QCN9074 cards don't, with any public QCN9074
build: 15 builds, WLAN.HK.2.5.0.1 to 2.9.0.1.

With every one of them, each card gets as far as:
- MHI mission mode;
- QMI connected;
- host-cap and the memory exchange completed;
- FW_MEM_READY.

Then it never answers the target-capability request.

The firmware Arista ships, WLAN.HK.2.5.r4-00683, works on the same
cards with the same ath11k: it answers in 3.7 ms and runs normally.
Swapping files shows that amss.bin decides it, not m3.bin: the vendor
amss.bin with a public m3.bin works, and a public amss.bin with the
vendor m3.bin fails.

It reproduces 100% (every boot, both cards) on:
- Linux 6.18.55 with ath11k from wireless 7.2 (OpenWrt main);
- linux-firmware 20260910 (WLAN.HK.2.9.0.1-02146).

It also fails on OpenWrt 25.12 (Linux 6.12, ath11k from 6.18.55).

Failing, 2.9.0.1-02146, debug_mask=0x1060, card 0001:01:00.0
(timestamps in seconds; "ath11k_pci 0001:01:00.0:" removed):

  170.464 qmi wifi fw qmi service connected
  170.466 qmi indication register request
  170.467 qmi host cap request
  170.472 qmi firmware request memory request
  170.476 qmi mem seg type 1 size 36700160
  170.476 qmi mem seg type 4 size 3784704
  170.476 qmi mem seg type 3 size 1048576
  170.476 qmi mem seg type 9 size 8388608
  170.476 qmi mem seg type 10 size 8192
  170.476 qmi ignore invalid mem req type 9
  170.481 qmi ignore invalid mem req type 10
  170.488 qmi req mem_seg[0] 0x0000000054800000 36700160 1
  170.488 qmi req mem_seg[1] 0x0000000000000000 3784704 4
  170.488 qmi req mem_seg[2] 0x0000000057500000 1048576 3
  170.488 qmi respond memory request delayed 0
  170.491 qmi firmware memory ready indication
  170.491 qmi target cap request
  180.975 failed to wait qmi cap request: -110
  180.975 failed to request qmi target capabilities: -110

Working, the same system, driver and debug mask, with Arista's
WLAN.HK.2.5.r4-00683-QCAHKSWPL_SILICONZ-1.691405.6.706957.1:

  229.140 qmi host cap request
  229.148 qmi mem seg type 1 size 36700160
  229.148 qmi mem seg type 4 size 3768320
  229.148 qmi mem seg type 3 size 1048576
  229.150 qmi firmware memory ready indication
  229.150 qmi target cap request
  229.153 fw_version 0x250affff fw_build_timestamp 2025-03-21 04:01
  229.162 boot using board name 'bus=pci,qmi-chip-id=0,
          qmi-board-id=255,variant=Arista-C360-pcie1'
  229.263 qmi firmware init done

Hardware:

  SoC       IPQ8076A (soc_id 391, rev 2.0), 2 GiB RAM
  card 0    0000:01:00.0, PCIe Gen3 x1 (root port 17cb:1002)
  card 1    0001:01:00.0, PCIe Gen2 x1 (root port 17cb:0302)
  cards     17cb:1104, subsystem 17cb:1104, revision 01
  QMI       chip_id 0x0 chip_family 0x0 board_id 0xff
            soc_id 0xffffffff (as reported with the vendor firmware)
  memory    fixed regions (memory-region), fw memory mode 0:
            card 0 0x51100000, card 1 0x54800000, 0x3700000 each;
            M3 dump at 0x53e00000 and 0x57500000

The vendor system (QSDK, qca_ol.ko, Linux 4.4.60) describes each card
as "qcom,cnss-qcn9000" with:

  base-addr       0x51100000 / 0x54800000
  hremote-size    0x2d00000 (45 MiB)
  m3-dump-addr    0x53e00000 / 0x57500000
  etr-addr        0x53f00000 / 0x57600000
  caldb-addr      0x54000000 / 0x57700000, caldb-size 0x800000
  tgt-mem-mode    0
  board_id        0xab / 0xaa
  qrtr_node_id    0x20 / 0x21

It also gives each card's MHI a 24 MiB shared-dma-pool (0x57f00000,
0x59700000) and LOOPBACK, DIAG and IPCR channels. It has no pageable
region.

Firmware tested, every one failing the same way:

  2.5.0.1  -01100 -01192 -01201 -01208 (SILICONZ-1), -03982 (SILICONZ-3)
  2.6.0.1  -00861 -00883 -01081
  2.7.0.1  -01744 -02409
  2.9.0.1  -01837 -01862 -01890 -01977 -02146
  (2.9.0.1-02175-SILICONZ-2 has 02146's amss.bin, so it was not tested
  separately)

Ruled out, each tested with the same failure:
- memory mode 0 (fixed) and 2 (dynamic);
- CALDB at 0, and inside the region;
- the type 9 and 10 segments given inside the region;
- the reserved memory zeroed;
- host cap without m3_support and m3_cache_support (as cnss2);
- 1 and 16 MSI vectors;
- a single card on the bus;
- ath11k_ahb unloaded;
- the vendor's PCIe CLKREQ/WAKE and PTA pin functions;
- two ath11k versions.

For comparison, OpenWrt supports the Xiaomi AX9000 (IPQ8072A + QCN9074)
on the same ath11k with the public firmware. Its board data is keyed
qmi-board-id=255, so its card also has an unprogrammed board ID.

After the timeout the firmware is alive: MHI stays in mission mode M0
and the IPCR channels are up. A forced RDDM dump of each card (about
46 MB, ATH11K-FW-DUMP v2) shows a thread table with wlan_platform
(entry in a paged segment), DLPager_main, IPCRTR, diag_task and MHI
CORE, but none of the main WLAN threads. The rest is hashed ulog we
can't read.

Three questions:

1. What do the public QCN9074 builds wait for between FW_MEM_READY and
   the capability response, and could someone decode the ulog in our
   RDDM dumps? I can send them.

2. Is there a known board, module or host requirement that these
   Arista modules don't meet and that the 2.5.r4 build doesn't need?

3. Would Qualcomm consider a QCN9074 build in linux-firmware that runs
   on these modules? Today OpenWrt can use these radios only by copying
   the vendor's firmware from the unit's own flash.

I can test any firmware build or debug option on the hardware. Full
logs are available on request.

Firmware files present during the failing run
(md5, path under /lib/firmware/ath11k/):

  1f7baaccad424a768233eaabb684b5ad  IPQ8074/hw2.0/board-2.bin
  90654417600d4438918ec9e5e42fcd3b  QCN9074/hw1.0/amss.bin
  16c532c984d22895601d2107c11920be  QCN9074/hw1.0/m3.bin
  efcfc16a938d16875500bf9250bc5a52  QCN9074/hw1.0/board-2.bin

uname -a: Linux OpenWrt 6.18.55 #0 SMP aarch64 GNU/Linux

Thank you,

Christopher Griffin

