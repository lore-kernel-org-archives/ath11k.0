Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kkXE0-0004tR-8j
 for ath11k@lists.infradead.org; Wed, 02 Dec 2020 18:51:58 +0000
Received: by mail-ed1-x52c.google.com with SMTP id b73so1445594edf.13
 for <ath11k@lists.infradead.org>; Wed, 02 Dec 2020 10:51:31 -0800 (PST)
In-Reply-To: <87sg95t9ez.fsf@codeaurora.org>
From: Pavel Procopiuc <pavel.procopiuc@gmail.com>
Subject: Re: ath11k-qca6390-bringup-202011191920: new suspend implementation
Message-ID: <70c6bb24-58e0-7d26-5d78-9eae8d59fb93@gmail.com>
Date: Wed, 2 Dec 2020 19:51:28 +0100
MIME-Version: 1.0
Content-Language: en-US
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+kvalo=adurom.com@lists.infradead.org
To: Kalle Valo <kvalo@codeaurora.org>
Cc: ath11k@lists.infradead.org

> All feedback very welcome, both positive and negative. In the reports
> try to include at least:
> 
> * name of the tag

ath11k-qca6390-bringup-202011301608 cleanly rebased on top of the vanilla 5.10.0-rc6

> * if there are other changes in the kernel, reverts etc

Only kernel argument memmap=20M$12M is used.

> * make and model of the laptop/computer (eg. Dell XPS 9310)

Dell XPS 17 (9700) with i9 CPU (only those come with QCA9390 wifi module), BIOS version: 1.5.0

Everything works perfectly, suspend/resume works too.

Without the aforementioned memmap kernel argument the wireless card firmware doesn't load:

Dec 02 19:37:35 razor kernel: Linux version 5.10.0-rc6 (root@razor) (gcc (Gentoo 9.3.0-r1 p3) 9.3.0, GNU ld (Gentoo 2.34 
p6) 2.34.0) #6 SMP Wed Dec 2 19:33:41 CET 2020
Dec 02 19:37:35 razor kernel:   DMA zone: 64 pages used for memmap
Dec 02 19:37:35 razor kernel:   DMA32 zone: 5213 pages used for memmap
Dec 02 19:37:35 razor kernel:   Normal zone: 255840 pages used for memmap
Dec 02 19:37:35 razor kernel: pci 0000:05:00.0: [17cb:1101] type 00 class 0x028000
Dec 02 19:37:35 razor kernel: pci 0000:05:00.0: reg 0x10: [mem 0xd2100000-0xd21fffff 64bit]
Dec 02 19:37:35 razor kernel: pci 0000:05:00.0: PME# supported from D0 D3hot D3cold
Dec 02 19:37:35 razor kernel: pci 0000:05:00.0: 4.000 Gb/s available PCIe bandwidth, limited by 5.0 GT/s PCIe x1 link at 
0000:00:1c.1 (capable of 7.876 Gb/s with 8.0 GT/s PCIe x1 link)
Dec 02 19:37:35 razor kernel: pci 0000:05:00.0: Adding to iommu group 21
Dec 02 19:37:36 razor kernel: ath11k_pci 0000:05:00.0: WARNING: ath11k PCI support is experimental!
Dec 02 19:37:36 razor kernel: ath11k_pci 0000:05:00.0: BAR 0: assigned [mem 0xd2100000-0xd21fffff 64bit]
Dec 02 19:37:36 razor kernel: ath11k_pci 0000:05:00.0: enabling device (0000 -> 0002)
Dec 02 19:37:36 razor kernel: ath11k_pci 0000:05:00.0: MSI vectors: 32
Dec 02 19:37:36 razor kernel: mhi 0000:05:00.0: Requested to power ON
Dec 02 19:37:36 razor kernel: mhi 0000:05:00.0: Power on setup success
Dec 02 19:37:36 razor kernel: ath11k_pci 0000:05:00.0: qmi req mem_seg[0] 0x1800000 3522560 1
Dec 02 19:37:36 razor kernel: ath11k_pci 0000:05:00.0: qmi req mem_seg[1] 0x1500000 884736 4
Dec 02 19:37:36 razor kernel: ath11k_pci 0000:05:00.0: firmware crashed: MHI_CB_SYS_ERROR
Dec 02 19:37:42 razor kernel: ath11k_pci 0000:05:00.0: qmi failed memory request, err = -110
Dec 02 19:37:42 razor kernel: ath11k_pci 0000:05:00.0: qmi failed to respond fw mem req:-110
Dec 02 19:39:07 razor kernel: mhi 0000:05:00.0: Device failed to exit MHI Reset state

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
