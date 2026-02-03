Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA767E87857
	for <ath11k@archiver.kernel.org>; Tue,  3 Feb 2026 18:54:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:MIME-Version:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=CmtU7RT5ENPxTg0z+Iwqyn5/DF9ojToNvTX2vIIjWYg=; b=0BvgOM+PZ6X9B7aUegrkKOEbyk
	4ytVG7zrpi10gl5xROkViDJQ7nVWlcVZn8JUNizKZ5Z9VlLAbGGuLqgImWNTX67qyuXOE4j3GgrPC
	aFvvr2gDcK7MukqsOP8TENv+RmRUfYq7ZTukG5xeBb5cXLqOXdjZ/feGdFlVJAqin5HXXVjmdQ5mO
	lNVrWUM4ZxZXN7r07tSYknrM3LawyMDA7gVazGqIcnctrpB4I6sJXFTtsDVR6BQK9lnYnxI444uEC
	kZyJY9mBUy37N3wRd1hEMhKJWAhaPW3uLuiOagwZnq0mTeV9j1iei0ITtLGuJ3LeIZU+6k0JGgyeO
	tE13jbtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnLXj-00000007CbK-2j21;
	Tue, 03 Feb 2026 18:54:31 +0000
Received: from mail-vk1-xa30.google.com ([2607:f8b0:4864:20::a30])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnLXg-00000007Caj-3QyP
	for ath11k@lists.infradead.org;
	Tue, 03 Feb 2026 18:54:31 +0000
Received: by mail-vk1-xa30.google.com with SMTP id 71dfb90a1353d-56379cb870bso1970492e0c.2
        for <ath11k@lists.infradead.org>; Tue, 03 Feb 2026 10:54:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770144867; cv=none;
        d=google.com; s=arc-20240605;
        b=CTHs+7C3qdqlzzahQHO/QGgIK71AoZ3ZtHBpgVyoV5oHQO9GyboxZMnKC6HAle2tFb
         mmsxlpR+IGGyC9YnQxRy7vnG/8qPHcE3kqdnqEH04Ncx52l8IfgSbtQb/kI7RQz1C1SL
         sUpwbDcwTCf9POArDtaJ8AAd5+qvRpejVeJDei/b556bMsOgO8WkKNORBiQVQlUdYo3y
         oqE29UT53MAtqFvOoJ3JqO6ru6lUyzLjmXvlcJQYXwK0ODXoRG6lGnTQdRHRx+5Gp1pd
         UygXYMkWvJdRlOc90Uqum4DRVOVA8CDm9bQWPcRhbGut4wdz2EJwHeLaDqN/HnnfI8IY
         Hgrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=CmtU7RT5ENPxTg0z+Iwqyn5/DF9ojToNvTX2vIIjWYg=;
        fh=hQUEiiksHvYN/EFmEKRXMJqwCC0zT2cV3viCNHAv7Ok=;
        b=JfTwk0uLaYaKka/dWYh0h81vuZMy5QBB5CfMAT8FAwh57N4HwiMvqihY9PeqFhjHZh
         JxKmmz8DDst2xRpnrgg5gIyzK/JTgrvFKH6knL01ihf3H6ofc6mD/lTpk6sg4Oe3xdMK
         vqSCewCqtUHaZk0cKvcA5HDuuyUEJNzeowUI15Kt1aC/xWHDoklD9jQqCRN0dbcv2Y5+
         0azn6eq+K8VeoRBFuwGNfSxjOhFPJwD+TLPjw0J3TZJ4qeHQ8o6MtUPgpSM8OhD5oZHT
         b+u3DWxqygacaO82iOAcuqw1mr3HZenCTtSBBPfdAnqzPvwAi479uxdKZTeWZ2NKQoIR
         ruiQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770144867; x=1770749667; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=CmtU7RT5ENPxTg0z+Iwqyn5/DF9ojToNvTX2vIIjWYg=;
        b=KG4iBcnTNN42SLYmEbJAupxoQXc63kl3rm/B64tRySoH810t7JM4a3ciiPqztyHlRz
         ReB7FM44AbmqUtHIDdILeclM6nIke4LqCPVYjJZr28QHktDPJSIoHXQDAFp8Ggv9ryTW
         X21dZGOSx6Bkhezb+ung0EFaVZhlunxi/SMeqlYwSNwf63n1yedGMB5loeTSO7qvrLYz
         R++r0tdoQhSoe95Eh8N4xNSVVsVZAJ0RFLoP7PGBGU7nb0Yh1/Ipn09NR25IDoyUWvBC
         KdSvkE5+OVcZELmhRJY59b8umTKpBTWsh40dr/wHut4yjK+X+GgWPytI9wpoz+1O4uQU
         7tAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770144867; x=1770749667;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CmtU7RT5ENPxTg0z+Iwqyn5/DF9ojToNvTX2vIIjWYg=;
        b=OqZOl0BB18xqyhSO9I9iCUiwGepTIZtRce3f6BCZHB5E6Pb+RD0bl26r1k8lJhU5sy
         zhtLhHj1AC92X0aMt+Ng3j5AIr4seM7KCUps0Rkb8b2crlqBmJLDnMQSDesv3A+NEyxB
         +Cp7WmoHRWiMADor/FroGOUnaRPkmm3h1UD3DOkZN7FB6I9dL2lj6Nlo5drU8qBaA6fP
         CJhBU02zcZSRRSNQS8jTOsY41F0WrtWpZ8MJQmSxoAp5tG/Y3j+TkD2V11c9oFmj8I7p
         J+Zrnxnw5TCb50PIGeX1FlbNVE2Tn0LAUSatROjTRbayKYUDvRqpdYkEsbmqMcO66m16
         3G7g==
X-Gm-Message-State: AOJu0Yw3bmrep0xBlLrD4H24QAcHOuZSNr0udPbSLEyQp2Tv5Whvho4x
	2eBpJQTflcAMIyqR0D8ysbBBh+pWh4uReqcuBoIOQ1L77YxxzcvU04OjwH2b/7Q+nya31ExVxRn
	eIPWhrnMF0qPpoFIt/CcjfZdvN3tTiYr9rUl1
X-Gm-Gg: AZuq6aILu1vSlMtKrhe9hmUlvoYsHyuzq8k9UVpOJy/zNPaUjsvU5LVGx6v5GonN5zg
	/RvZpj/mB5+NTzS6UoTum5pfC8JOCY6SUCDfVrW8Y0/4TUF1nfyJt3/B9WZEN0/zAGrsSqQE3KI
	aM8bu9KzU9gOa5qTKO1FDyhRtzxB+hBcO5dZabYZROo06E2AMJLHG91TpVac8Cg40sQRf5cAftA
	+F5vULb9Av2/hRJHIUMxueoNvBL9QrnHRE2N8wIiKXmCoMcOeYr4/V6vo3VLuIwEhWV6KGl74Ji
	KIcKnw==
X-Received: by 2002:a05:6102:3f06:b0:5f1:72a7:f879 with SMTP id
 ada2fe7eead31-5f9395bcab9mr235560137.28.1770144867118; Tue, 03 Feb 2026
 10:54:27 -0800 (PST)
MIME-Version: 1.0
From: Mohamed Sallam <sallamx99@gmail.com>
Date: Tue, 3 Feb 2026 20:54:00 +0200
X-Gm-Features: AZwV_Qg0zuNmPc-RqUWYuxa9iWC_QTz_O_laHPZvXVqGcvd4Yt-VLU3RSIMP37o
Message-ID: <CALOnm7APGpVWcx45O78fa4hOCUGDc0-ywGoqicr51YtpxNueLg@mail.gmail.com>
Subject: Potential firmware selection issue with QCNFA765 on ThinkPad P14s Gen 5
To: ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_105429_925943_D1364CDA 
X-CRM114-Status: GOOD (  18.44  )
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

Hi ath11k maintainers,

I'm not very experienced with Linux - I'm an end user who noticed something
strange with my WiFi and wanted to share my findings in case it helps others.

Full disclosure: I used AI tools to help me investigate this issue and
understand the driver behavior. If I'm misunderstanding something fundamental,
please let me know.

WHAT I OBSERVED
===============
I have a Lenovo ThinkPad P14s Gen 5 AMD with a Qualcomm QCNFA765 WiFi card
(PCI ID 17cb:1103, subsystem 17aa:9309). I'm running Arch Linux with kernel
6.12.68-1-lts and firmware package linux-firmware-atheros 20260110-1.

I noticed that channels 149-165 in the 5 GHz band are marked with (no IR),
preventing me from using them. This happens consistently on my system.

WHAT I FOUND
============
While trying to understand why this happens, I discovered that the
linux-firmware package contains two different firmware files:
- Generic: ath11k/WCN6855/hw2.0/amss.bin
- Card-specific: ath11k/WCN6855/hw2.0/nfa765/amss.bin

When I manually create a symlink to use the nfa765 variant instead of the
default, the (no IR) restrictions disappear and all channels work normally.
This suggests the driver might not be selecting the optimal firmware for
this specific card variant.

The AI analysis suggested that:
- The driver looks for firmware at ath11k/<chip>/<hw_rev>/<filename>
- There's a "firmware-name" property that can override this, but it seems
to only work on ARM platforms with device trees, not x86 laptops
- The PCI subsystem ID (17aa:9309) might be available to the driver but
isn't being used to pick different firmware files

I don't know if this is accurate - it's just what the AI told me based on
looking at the driver code. The key point is that the firmware swap fixes
the issue for me.

REPRODUCTION STEPS
==================
On my system, with the default setup:
1. Check channel flags: iw phy | grep -E "5745|5765|5785|5805|5825"
2. Channels 149-165 show (no IR)

After applying the workaround (symlink nfa765 firmware):
1. Same check shows channels without (no IR) restrictions
2. WiFi works on all channels

TECHNICAL DETAILS
=================
Hardware: Lenovo ThinkPad P14s Gen 5 AMD (21ME001MUS)
WiFi: Qualcomm QCNFA765 (WCN6855 hw2.1)
PCI: 17cb:1103, subsystem 17aa:9309 (Lenovo)
Kernel: 6.12.68-1-lts
Firmware: linux-firmware-atheros 20260110-1
Firmware ver: WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.41

Logs from my system:
$ dmesg | grep ath11k
[    2.845632] ath11k_pci 0000:02:00.0: chip_id 0x0 chip_family 0x0
board_id 0xff
[    2.845778] ath11k_pci 0000:02:00.0: fw_version 0x1019B0E1
fw_build_timestamp 2024-12-19
[    2.845789] ath11k_pci 0000:02:00.0: fw_build_id
WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.41
[    2.845806] ath11k_pci 0000:02:00.0: qmi failed to load bdf
[    2.845809] ath11k_pci 0000:02:00.0: qmi failed to load cal data,
fallback to 0xff

$ lspci -vnns 02:00.0
02:00.0 0280: 17cb:1103 (rev 01)
    Subsystem: 17aa:9309
    Kernel driver in use: ath11k_pci

With default firmware:
$ iw phy | grep -E "5745|5765|5785|5805|5825"
* 5745.0 MHz [149] (14.0 dBm) (no IR)
* 5765.0 MHz [153] (14.0 dBm) (no IR)
* 5785.0 MHz [157] (14.0 dBm) (no IR)
* 5805.0 MHz [161] (14.0 dBm) (no IR)
* 5825.0 MHz [165] (14.0 dBm) (no IR)

With nfa765 firmware symlinked:
* 5745.0 MHz [149] (23.0 dBm)
* 5765.0 MHz [153] (23.0 dBm)
* 5785.0 MHz [157] (23.0 dBm)
* 5805.0 MHz [161] (23.0 dBm)
* 5825.0 MHz [165] (23.0 dBm)

MY WORKAROUND
=============
I'm currently using this workaround:
  sudo ln -sf ../hw2.0/nfa765/amss.bin.zst \
      /lib/firmware/ath11k/WCN6855/hw2.1/amss.bin.zst

This fixes the issue for me, but I understand it's a hack, not a proper
solution.

QUESTIONS
=========
1. Is the driver supposed to automatically select card-specific firmware
   based on PCI subsystem ID, or is this working as designed?
2. If it's supposed to work this way, could there be a bug in the firmware
   path selection logic?
3. Is there a better workaround than manually symlinking firmware files?

Thank you for your time and for maintaining this driver. I appreciate
any guidance you can provide, even if it's just to tell me this is
expected behavior and I'm misunderstanding something.

Best regards,
Mohamed Sallam

