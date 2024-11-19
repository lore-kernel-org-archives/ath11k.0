Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D810FD6C291
	for <ath11k@archiver.kernel.org>; Tue, 19 Nov 2024 20:16:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:Subject:
	Message-ID:Date:From:MIME-Version:Reply-To:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=KgWpOKHATV4YeR+Un0eRHbRg2ztCrtw2oUnFHzweI6Y=; b=QW81g1f+5K2DPe6FpWTSZrkSUM
	AU/0c2l4m4sO9F6JzFb8tQsIPDyXFcHCCXbCrgO5/iaPvNyHoKmxeCISSRhZpmSPI8lC2a3RaspZv
	jzZZNvkjYELbl/I9MgQ0EnHhZNytBSWxnLIxXb71fhUqj79EhONCAxbRglZhoNw6FT1nidO/vdATl
	blvD4R4BaPoBMQsWVpgsW7bGtEY/h61z3r8YWgDXRNXpJGF3GqmoyDVRBGCQMZMPGpU4oSE6gI12j
	Ru6DoG4vyRLv8Y8yv9hs5vBz9wL6m/TiYhZIBxv8msuH6rX3lCzfG/7np7zjTW2JPy/NR4ppvwmg/
	EwFDIrqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDUe0-0000000DfCY-0NnQ;
	Tue, 19 Nov 2024 20:16:16 +0000
Received: from mail-yb1-xb32.google.com ([2607:f8b0:4864:20::b32])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDUdx-0000000DfB5-2N0X
	for ath11k@lists.infradead.org;
	Tue, 19 Nov 2024 20:16:14 +0000
Received: by mail-yb1-xb32.google.com with SMTP id 3f1490d57ef6-e38b2d868c8so1795997276.1
        for <ath11k@lists.infradead.org>; Tue, 19 Nov 2024 12:16:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gateworks.com; s=google; t=1732047371; x=1732652171; darn=lists.infradead.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=KgWpOKHATV4YeR+Un0eRHbRg2ztCrtw2oUnFHzweI6Y=;
        b=QJ8aP0BMktzk3r/BwHxhCwnDjoHKG9GzENCXaPEkKhQfmHlVg8e9+bZuvnJfT8VodM
         T2JfbofG9mBQEEV0YTdVxykMcNhGksLNcObFi10qhGiK8QGCNhcaUAYzt6N/1NmCu6vi
         WOwEUKjAz/rbCMHK+u8Me73ksN01UR6AWBZNXA9h+v+ALQO/UoGpbAghUX1wNRcv1VKY
         oCH0ZK71YXarA7s9SyepxCRy5ugDTKKuqdNjDyxz7q+YbGKfDUWLDqhaY6J/NGJkbDIA
         Om1F1Q1vlIjCLNT6aF+0cHHTI8XvgtRyKHI3+1bwLlZFYqptcbBnrTALLaWzYapOL42W
         iW3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732047371; x=1732652171;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KgWpOKHATV4YeR+Un0eRHbRg2ztCrtw2oUnFHzweI6Y=;
        b=Sd1zqxD9CTV34ALCUKIRgCSXyBd8tMPbcfxd3xI5mwXT8Cy1ecwQ2X4qvuAk2EX9n4
         Q5nZGyTYoXSzV7GVNI5T1X6hFaV7uHprJOiPGZyJ7tg2UEo9ZarAL7NuAzk1Gg8XFJY+
         +Hl0PPfGy27d8/V/+1h7DxzQO1MbnxO4uagJ2A/1rukeW2KDaAP+vWcrQr4Rjsx3Qg1F
         NDpbrZ+cDT+sAhyyfxu5g33No6FKWCgydpgwKC9ai9+VEP/0Dil8UVkxu8JMeG2WqNmQ
         nqe84GgDGt2+CcwJ02m9/fk/PKgUfSFEat+UoDLQJkPQ2KSSaaITfkr6lVBaJEwaMrMz
         1kSQ==
X-Gm-Message-State: AOJu0YzgxXWNEh9vk3A2csJCVAh7YeyJAofsGW8mHEOLotxJHOSiNyX0
	UD7wsJeQ2+lLtyVuRY9L3z9XRlsPwYkYPDTtg2SvuORGH+DQsssYwFpExFLzNkEh1TyOGmRBFPq
	KPdnXxCneDo+iAeq55fj8XwHdgVgo34NEMq/5/WFPk+npDHvGm58=
X-Google-Smtp-Source: AGHT+IFIGoS5c0Sgz4TtH9ip/vT18yheZrm4GNWm5kgq7Tyare9DQG7i5JIN9B5P7dc9QHZDKavFxMYENugU59McLDw=
X-Received: by 2002:a05:690c:9a8c:b0:6ee:5cf9:f893 with SMTP id
 00721157ae682-6eebd0e61b4mr3481347b3.2.1732047371675; Tue, 19 Nov 2024
 12:16:11 -0800 (PST)
MIME-Version: 1.0
From: Tim Harvey <tharvey@gateworks.com>
Date: Tue, 19 Nov 2024 12:16:00 -0800
Message-ID: <CAJ+vNU0dCV7-2gFDPTiOjAV-HCeHZ3H1DjGdqYKo+MGadfrSbA@mail.gmail.com>
Subject: ath11k swiotlb buffer is full
To: ath11k@lists.infradead.org, 
	linux-wireless <linux-wireless@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241119_121613_695131_EA96FDDF 
X-CRM114-Status: UNSURE (   9.74  )
X-CRM114-Notice: Please train this message.
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

Greetings,

I've got an ath11k card that is failing to init on an IMX8MM system
with 4GB of DRAM:
[    7.551582] ath11k_pci 0000:01:00.0: BAR 0 [mem
0x18000000-0x181fffff 64bit]: assigned
[    7.551713] ath11k_pci 0000:01:00.0: enabling device (0000 -> 0002)
[    7.552401] ath11k_pci 0000:01:00.0: MSI vectors: 16
[    7.552440] ath11k_pci 0000:01:00.0: qcn9074 hw1.0
[    7.887186] mhi mhi0: Loaded FW: ath11k/QCN9074/hw1.0/amss.bin,
sha256: 5ee1b7b204541b5f99984f21d694ececaec08fbce1b520ffe6fe740b02a4afd7
[    8.435964] ath11k_pci 0000:01:00.0: chip_id 0x0 chip_family 0x0
board_id 0xff soc_id 0xffffffff
[    8.435991] ath11k_pci 0000:01:00.0: fw_version 0x270206d0
fw_build_timestamp 2022-08-04 12:48 fw_build_id
WLAN.HK.2.7.0.1-01744-QCAHKSWPL_SILICONZ-1
[    8.441700] ath11k_pci 0000:01:00.0: Loaded FW:
ath11k/QCN9074/hw1.0/board-2.bin, sha256:
dbf0ca14aa1229eccd48f26f1026901b9718b143bd30b51b8ea67c84ba6207f1
[    9.753764] ath11k_pci 0000:01:00.0: Loaded FW:
ath11k/QCN9074/hw1.0/m3.bin, sha256:
b6d957f335073a15a8de809398e1506f0200a08747eaf7189c843cf519ffc1de
[    9.789791] ath11k_pci 0000:01:00.0: swiotlb buffer is full (sz:
1048583 bytes), total 32768 (slots), used 2528 (slots)
[    9.789853] ath11k_pci 0000:01:00.0: failed to set up tcl_comp ring (0) :-12
[    9.790238] ath11k_pci 0000:01:00.0: failed to init DP: -12
root@noble-venice:~# cat /proc/cmdline
console=ttymxc1,115200 earlycon=ec_imx6q,0x30890000,115200
root=PARTUUID=5cdde84f-01 rootwait net.ifnames=0 cma=196M

The IMX8MM's DRAM base is at 1GB so anything above 3GB hits the 32bit
address boundary. If I pass in a mem=3096M the device registers just
fine.

I found this to be the case with modern kernels however I found
differing behavior with older kernels:
- 6.6 and 6.1 the device registers with 4GB DRAM but crashes on client connect
- 5.15 devices registers with 4GB DRAM and appears to work just fine

Could anyone explain what is going on here? Obviously there have been
changes at some point to start using swiotlb which I believe was all
about avoiding 32bit DMA limitations but I'm not clear how I should be
configuring this for IMX8MM with 4GB DRAM. Maybe my kernel IOMMU
configuration is incorrect somehow?

I'm also unclear why there was no apparent problem with older kernels
such as 5.15.

Best Regards,

Tim

