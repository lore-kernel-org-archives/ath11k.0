Return-Path: <SRS0=5A3f=PK=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E71F9C433EF
	for <ath11k@archiver.kernel.org>; Fri, 22 Oct 2021 23:16:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9E52760F93
	for <ath11k@archiver.kernel.org>; Fri, 22 Oct 2021 23:16:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9E52760F93
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:
	From:MIME-Version:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=XT0I0uYJg2BMYK6r13LrieeyHY9OcJu57cd1/rt9EhM=; b=fxne+cMd04F+bE
	46LfrTGbMcLvlCbMtn3CJlLqijgT/DlvOo/mvFqIc4pP8wdV64mwVF2A9VQM3b7IEfUispZ12MMjN
	mTj0h9GLu2ftH6DQD26GMpo0QQgCtzgCqOLQdrKMaHcEI5jk4393Q3UYs/OxMWj7o8FJ+Zi1wL62l
	uNFDNE3iVoHM9AYfJMP0qkT3tfwt5WtpZc9/g6slkrfNVau1qU/0XF1RFrn8JlbgZwys0mrdR6/M2
	MHsDphayeJ3Sp5S2DVNN1lnQnHa67/2a5ckBOQr768JSndAzVk2oa98pDEIk5qoXxNi1TK3dCSqVV
	WhX2DKlhEYu5372Mt4aA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1me3mR-00C6kX-BP; Fri, 22 Oct 2021 23:16:55 +0000
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1me3mN-00C6ji-Pv
 for ath11k@lists.infradead.org; Fri, 22 Oct 2021 23:16:53 +0000
Received: by mail-lj1-x234.google.com with SMTP id o26so1609363ljj.2
 for <ath11k@lists.infradead.org>; Fri, 22 Oct 2021 16:16:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:reply-to:from:date:message-id:subject:to;
 bh=YngJjVjxiAJePR78YgghS3B0LV2fbJGPtOyxpqqNTZk=;
 b=G4SnkfUSH8KjtuWbReugoop+9dAfkprq/nazvkw8RQ6FiCgIez9mSq8m911dqXyEcX
 e45snf3g4TTghzYe66nJoIBGOT53/Byk+iX5YxHB1245H3A4ojTpIcv7IWSmQgufSBLR
 EX0/Vy30T5tA9j35yJmackCOSjyTepidchTdWE8EMgVbXRyOGZ2Jtzn1Lh6dFk6DNGE1
 WsRBD9xj1CDodYcA03gw3/A7mff+uHwwcKzrI97TTv24mRh23SmaING2gSFNZ4DzFxwC
 DtZLtw7tWEfhj9C43PnhWbbDDT4LaZMATCnrVnQR5N86c6qJgmJ0a7+K+y7Ftko7zIia
 BbnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:reply-to:from:date:message-id
 :subject:to;
 bh=YngJjVjxiAJePR78YgghS3B0LV2fbJGPtOyxpqqNTZk=;
 b=5XGw3QTwYLQqqeZ5miCu7Jhy5H6OoaJFBo2+eBNEz/WvPi5gQgJU4Qz6zHd9XlUZZ+
 R59P9jjQsNkDOSo6tRjqidvHHVmAZWHGPUBVod0Iv9yIV9Mpnfhu6RDpMmO63Zkiq0ic
 1bgMv3MU5UWOEmytn841tEwinLlOP7pQDOBpbyXvJJ0X8I7REuGk1NAMU93sM6GH6IQq
 FnHxFtVqRr8o+Xeu5ZKV2avM9RpR+TdPchLOzu0N9zBQI70yrYIumZ6vy8I37KLj6O0S
 QBTxAzYUcob+i2mLSsOW5uvTfwCxL0GtED7G6GmcRY3h7nRwLYH1ELqdyuk/IDcsAlNt
 ksAQ==
X-Gm-Message-State: AOAM532Nu7a8SNVzd1KlmwxctjLtVdrQTx/9UNKYRDgju93hMXIl2gsR
 9RyhEaBNKDOz2bt8NwvURt+6Ud9dOV2OcSM9KWn4z53evzH4NA==
X-Google-Smtp-Source: ABdhPJwk7VhdfiAZK+eEEK87RG5xqiCCd+RA7lkt47Et9TkHOcnqZcwjVisnu2rexxBdF0EpaX4mzoUHrv8tFiU4PUQ=
X-Received: by 2002:a2e:8891:: with SMTP id k17mr2827300lji.503.1634944609839; 
 Fri, 22 Oct 2021 16:16:49 -0700 (PDT)
MIME-Version: 1.0
From: Rama McIntosh <face00@gmail.com>
Date: Fri, 22 Oct 2021 13:16:38 -1000
Message-ID: <CAPVWjyNcZuDTRrqCyWJkoU49UzKs8QyZHfKC5PO8JzdMzjQ8rg@mail.gmail.com>
Subject: [PATCH RFT] ath11k: pci: support platforms with one MSI vector
To: ath11k@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211022_161651_872757_D595A7EB 
X-CRM114-Status: GOOD (  11.60  )
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
Reply-To: rama@myutil.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Hi Kalle and Carl,

Nice, I missed this patch.    While my hardware supports multi-vector
msi and the driver works great on fedora (dell 9700), I run Qubes-os
and qemu hw/xen currently only supports a single msi vector.   I've
been looking into fixing qemu to support multi-vector msi...but don't
have a lot of free time and am still learning how pci and qemu all
work (should be doable, qemu supports multi vector for msix, just not
msi).

I applied this patch to the latest Qubes-os 4.1 alpha (kernel
5.10.71).      Now instead of the msi initialization error (-28),  I
get a page fault and kernel panic in my sys-net vm.   I tried
permissive mode and no-strict-rest mode too, same effect (i.e 'qvm-pci
attach sys-net-clone-1  dom0:05_00.0 --persistent -o permissive=true
-o no-strict-reset=true').    However, I'm excited and I will see if I
can fix this patch to work with xen as soon as I have some time off
work.    Here is the details:

[2021-10-22 12:46:11] [    2.920848] ath11k_pci 0000:00:06.0: link
down error during global reset
[2021-10-22 12:46:11] [    2.941848] ath11k_pci 0000:00:06.0: link
down error during global reset
[2021-10-22 12:46:11] [    2.972047] mhi 0000:00:06.0: Requested to power ON
[2021-10-22 12:46:11] [    2.975416] BUG: unable to handle page fault
for address: ffff9a46c070001f
[2021-10-22 12:46:11] [    2.975417] #PF: supervisor write access in kernel mode
[2021-10-22 12:46:11] [    2.975418] #PF: error_code(0x0002) - not-present page
[2021-10-22 12:46:11] [    2.975419] PGD 1000067 P4D 1000067 PUD 0
[2021-10-22 12:46:11] [    2.975421] Oops: 0002 [#1] SMP PTI
[2021-10-22 12:46:11] [    2.975422] CPU: 0 PID: 314 Comm:
systemd-udevd Not tainted 5.10.71-2.fc32.qubes.x86_64 #1
[2021-10-22 12:46:11] [    2.975423] Hardware name: Xen HVM domU, BIOS
4.14.3 10/09/2021
[2021-10-22 12:46:11] [    2.975426] RIP:
0010:ath11k_mhi_op_write_reg+0x5/0x10 [ath11k_pci]
[2021-10-22 12:46:11] [    2.975427] Code: 00 00 00 00 00 0f 1f 44 00
00 c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 8b 06 89 02 31 c0
c3 0f 1f 40 00 0f 1f 44 00 00 <89> 16 c3 0f 1f 84 00 00 00 00 00 48 83
ef 01 b8 ff ff ff ff 48 c1
[2021-10-22 12:46:11] [    2.975428] RSP: 0018:ffff9a45c0283b10 EFLAGS: 00010082
[2021-10-22 12:46:11] [    2.975429] RAX: ffffffffc0a09040 RBX:
0000000000000000 RCX: 0000000000000000
[2021-10-22 12:46:11] [    2.975429] RDX: 0000000000000000 RSI:
ffff9a46c070001f RDI: ffff8d6682d92800
[2021-10-22 12:46:11] [    2.975430] RBP: ffff8d668fe40000 R08:
0000000000000020 R09: ffffffff8c944708
[2021-10-22 12:46:11] [    2.975430] R10: 0000000000000000 R11:
0000000000000000 R12: 0000000000000000
[2021-10-22 12:46:11] [    2.975431] R13: ffff8d6682d91c28 R14:
ffff8d6682d92920 R15: ffff8d6682d92800
[2021-10-22 12:46:11] [    2.975432] FS:  0000792a78e7db40(0000)
GS:ffff8d66bd400000(0000) knlGS:0000000000000000
[2021-10-22 12:46:11] [    2.975433] CS:  0010 DS: 0000 ES: 0000 CR0:
0000000080050033
[2021-10-22 12:46:11] [    2.975433] CR2: ffff9a46c070001f CR3:
000000000b520002 CR4: 00000000007706f0
[2021-10-22 12:46:11] [    2.975435] PKRU: 55555554
[2021-10-22 12:46:11] [    2.975436] Call Trace:
[2021-10-22 12:46:11] [    2.975440]  mhi_async_power_up+0x1b7/0x401 [mhi]
[2021-10-22 12:46:11] [    2.975442]  ? mhi_init_dev_ctxt+0x262/0x430 [mhi]
[2021-10-22 12:46:11] [    2.975447]  ath11k_mhi_start+0x6d/0x120 [ath11k_pci]
[2021-10-22 12:46:11] [    2.975449]  ath11k_pci_power_up+0x3c/0x70 [ath11k_pci]
[2021-10-22 12:46:11] [    2.975455]  ath11k_core_soc_create+0x36/0xa0 [ath11k]
[2021-10-22 12:46:11] [    2.975458]  ath11k_core_init+0x12/0x40 [ath11k]
[2021-10-22 12:46:11] [    2.975461]  ? irq_get_irq_data+0xa/0x20
[2021-10-22 12:46:11] [    2.975463]  ath11k_pci_probe+0x2ad/0x318 [ath11k_pci]
[2021-10-22 12:46:11] [    2.975466]  local_pci_probe+0x42/0x80
[2021-10-22 12:46:11] [    2.975820]  ? _cond_resched+0x16/0x40
[2021-10-22 12:46:11] [    2.975822]  pci_call_probe+0x51/0xf0
[2021-10-22 12:46:11] [    2.975823]  pci_device_probe+0xa5/0xe0
[2021-10-22 12:46:11] [    2.975826]  really_probe+0x222/0x480
[2021-10-22 12:46:11] [    2.975828]  driver_probe_device+0xe1/0x150
[2021-10-22 12:46:11] [    2.975829]  device_driver_attach+0xa1/0xb0
[2021-10-22 12:46:11] [    2.975831]  __driver_attach+0x8a/0x150
[2021-10-22 12:46:11] [    2.975832]  ? device_driver_attach+0xb0/0xb0
[2021-10-22 12:46:11] [    2.975833]  ? device_driver_attach+0xb0/0xb0
[2021-10-22 12:46:11] [    2.975835]  bus_for_each_dev+0x89/0xd0
[2021-10-22 12:46:11] [    2.975836]  bus_add_driver+0x12b/0x1e0
[2021-10-22 12:46:11] [    2.975838]  driver_register+0x8f/0xe0
[2021-10-22 12:46:11] [    2.975840]  ?
ath11k_get_user_msi_assignment+0x20/0x20 [ath11k_pci]
[2021-10-22 12:46:11] [    2.975841]  ath11k_pci_init+0x21/0x40 [ath11k_pci]
[2021-10-22 12:46:11] [    2.975843]  do_one_initcall+0x57/0x200
[2021-10-22 12:46:11] [    2.975846]  do_init_module+0x5c/0x260
[2021-10-22 12:46:11] [    2.975847]  __do_sys_finit_module+0xb1/0x110
[2021-10-22 12:46:11] [    2.975849]  do_syscall_64+0x33/0x40
[2021-10-22 12:46:11] [    2.975851]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
[2021-10-22 12:46:11] [    2.975853] RIP: 0033:0x792a79ac2e0d
[2021-10-22 12:46:11] [    2.975855] Code: c8 0c 00 0f 05 eb a9 66 0f
1f 44 00 00 f3 0f 1e fa 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2
4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 3b
80 0c 00 f7 d8 64 89 01 48
[2021-10-22 12:46:11] [    2.975855] RSP: 002b:00007ffc4ae4dc18
EFLAGS: 00000246 ORIG_RAX: 0000000000000139
[2021-10-22 12:46:11] [    2.975856] RAX: ffffffffffffffda RBX:
00005e699a802970 RCX: 0000792a79ac2e0d
[2021-10-22 12:46:11] [    2.975857] RDX: 0000000000000000 RSI:
0000792a79c1c32c RDI: 0000000000000013
[2021-10-22 12:46:11] [    2.975857] R[2021-10-22 12:46:11] BP:
0000000000020000 R08: 0000000000000000 R09: 0000000000000000
[2021-10-22 12:46:11] [    2.975858] R10: 0000000000000013 R11:
0000000000000246 R12: 0000792a79c1c32c
[2021-10-22 12:46:11] [    2.975858] R13: 00005e699a7d2380 R14:
0000000000000007 R15: 00005e699a8dbf70
[2021-10-22 12:46:11] [    2.975859] Modules linked in: iptable_nat
nf_nat nf_conntrack qrtr nf_defrag_ipv6 ns nf_defrag_ipv4
ath11k_pci(+) mhi intel_cstate(-) ath11k qmi_helpers mac80211
drm_vram_helper drm_ttm_helper ttm drm_kms_helper pcspkr cfg80211
ehci_pci rfkill serio_raw libarc4 ehci_hcd ata_generic cec i2c_piix4
pata_acpi floppy xen_scsiback target_core_mod xen_netback xen_privcmd
xen_gntdev xen_gntalloc xen_blkback xen_evtchn drm fuse bpf_preload
ip_tables overlay xen_blkfront
[2021-10-22 12:46:11] [    2.975879] CR2: ffff9a46c070001f
[2021-10-22 12:46:11] [    2.975882] ---[ end trace 7cec67ab6b3c652d ]---
[2021-10-22 12:46:11] [    2.975884] RIP:
0010:ath11k_mhi_op_write_reg+0x5/0x10 [ath11k_pci]
[2021-10-22 12:46:11] [    2.975884] Code: 00 00 00 00 00 0f 1f 44 00
00 c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 8b 06 89 02 31 c0
c3 0f 1f 40 00 0f 1f 44 00 00 <89> 16 c3 0f 1f 84 00 00 00 00 00 48 83
ef 01 b8 ff ff ff ff 48 c1
[2021-10-22 12:46:11] [    2.975885] RSP: 0018:ffff9a45c0283b10 EFLAGS: 00010082
[2021-10-22 12:46:11] [    2.975886] RAX: ffffffffc0a09040 RBX:
0000000000000000 RCX: 0000000000000000
[2021-10-22 12:46:11] [    2.975886] RDX: 0000000000000000 RSI:
ffff9a46c070001f RDI: ffff8d6682d92800
[2021-10-22 12:46:11] [    2.975887] RBP: ffff8d668fe40000 R08:
0000000000000020 R09: ffffffff8c944708
[2021-10-22 12:46:11] [    2.975887] R10: 0000000000000000 R11:
0000000000000000 R12: 0000000000000000
[2021-10-22 12:46:11] [    2.975888] R13: ffff8d6682d91c28 R14:
ffff8d6682d92920 R15: ffff8d6682d92800
[2021-10-22 12:46:11] [    2.975889] FS:  0000792a78e7db40(0000)
GS:ffff8d66bd400000(0000) knlGS:0000000000000000
[2021-10-22 12:46:11] [    2.975889] CS:  0010 DS: 0000 ES: 0000 CR0:
0000000080050033
[2021-10-22 12:46:11] [    2.975890] CR2: ffff9a46c070001f CR3:
000000000b520002 CR4: 00000000007706f0
[2021-10-22 12:46:11] [    2.975890] PKRU: 55555554
[2021-10-22 12:46:11] [    2.975891] Kernel panic - not syncing: Fatal exception
[2021-10-22 12:46:11] [    2.975948] Kernel Offset: 0xa000000 from
0xffffffff81000000 (relocation range:
0xffffffff80000000-0xffffffffbfffffff)




-- 
http://myutil.com

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
