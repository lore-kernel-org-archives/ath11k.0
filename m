Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kdYZ2-0007Zj-V7
 for ath11k@lists.infradead.org; Fri, 13 Nov 2020 12:52:30 +0000
Received: by mail-ej1-x631.google.com with SMTP id dk16so13200649ejb.12
 for <ath11k@lists.infradead.org>; Fri, 13 Nov 2020 04:52:28 -0800 (PST)
Subject: Re: Regression: QCA6390 fails with "mm/page_alloc: place pages to
 tail in __free_pages_core()"
References: <d6fb1e30-0d19-9af3-337b-69ff11c2fc6c@suse.cz>
 <8ACA82DB-D2FE-4599-8A01-D42218FDE1E5@redhat.com>
 <87eekz4s04.fsf@codeaurora.org>
 <9d307c40-5ea1-8938-819d-f1742cb99945@gmail.com>
 <cd8d1b1d-a646-b9b1-ed2a-4aa7070efe00@redhat.com>
 <dd24598f-7635-c2e2-9c6d-f320770e3b9e@gmail.com>
 <f1f471905ea99ad9b9c8a8eeae616ff9@codeaurora.org>
From: Pavel Procopiuc <pavel.procopiuc@gmail.com>
Message-ID: <3e30ac52-6ad4-fa7b-8817-bca35a80d268@gmail.com>
Date: Fri, 13 Nov 2020 13:52:25 +0100
MIME-Version: 1.0
In-Reply-To: <f1f471905ea99ad9b9c8a8eeae616ff9@codeaurora.org>
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
To: Carl Huang <cjhuang@codeaurora.org>
Cc: David Hildenbrand <david@redhat.com>, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, Vlastimil Babka <vbabka@suse.cz>, akpm@linux-foundation.org, ath11k@lists.infradead.org, Kalle Valo <kvalo@codeaurora.org>

Op 13.11.2020 om 12:08 schreef Carl Huang:
> Checked some logs. Looks when the error happens, the physical address are
> very small. Its' between 20M - 30M.
> 
> So could you have a try to reserve the memory starting from 20M?
> Add "memmap=10M\$20M" to your grub.cfg or edit in kernel parameters. so ath11k
> can't allocate from these address.
> 
> Or you can try to reserve even larger memory starting from 20M.

That worked, booting with memmap=12M$20M resulted in the working wifi:

$ journalctl -b | grep -iP '05:00|ath11k|Linux version|memmap'
Nov 13 13:45:34 razor kernel: Linux version 5.10.0-rc2 (root@razor) (gcc (Gentoo 9.3.0-r1 p3) 9.3.0, GNU ld (Gentoo 2.34 
p6) 2.34.0) #1 SMP Fri Nov 13 13:29:48 CET 2020
Nov 13 13:45:34 razor kernel: Command line: ro root=/dev/nvme0n1p2 resume=/dev/nvme1n1p1 zram.num_devices=2 
memmap=12M$20M quiet
Nov 13 13:45:34 razor kernel:   DMA zone: 64 pages used for memmap
Nov 13 13:45:34 razor kernel:   DMA32 zone: 5165 pages used for memmap
Nov 13 13:45:34 razor kernel:   Normal zone: 255840 pages used for memmap
Nov 13 13:45:34 razor kernel: Kernel command line: ro root=/dev/nvme0n1p2 resume=/dev/nvme1n1p1 zram.num_devices=2 
memmap=12M$20M quiet ro root=/dev/nvme0n1p2 resume=/dev/nvme1n1p1 zram.num_devices=2 memmap=12M$20M quiet
Nov 13 13:45:34 razor kernel: pci 0000:05:00.0: [17cb:1101] type 00 class 0x028000
Nov 13 13:45:34 razor kernel: pci 0000:05:00.0: reg 0x10: [mem 0xd2100000-0xd21fffff 64bit]
Nov 13 13:45:34 razor kernel: pci 0000:05:00.0: PME# supported from D0 D3hot D3cold
Nov 13 13:45:34 razor kernel: pci 0000:05:00.0: 4.000 Gb/s available PCIe bandwidth, limited by 5.0 GT/s PCIe x1 link at 
0000:00:1c.1 (capable of 7.876 Gb/s with 8.0 GT/s PCIe x1 link)
Nov 13 13:45:34 razor kernel: pci 0000:05:00.0: Adding to iommu group 21
Nov 13 13:45:35 razor kernel: ath11k_pci 0000:05:00.0: WARNING: ath11k PCI support is experimental!
Nov 13 13:45:35 razor kernel: ath11k_pci 0000:05:00.0: BAR 0: assigned [mem 0xd2100000-0xd21fffff 64bit]
Nov 13 13:45:35 razor kernel: ath11k_pci 0000:05:00.0: enabling device (0000 -> 0002)
Nov 13 13:45:35 razor kernel: ath11k_pci 0000:05:00.0: MSI vectors: 32
Nov 13 13:45:35 razor kernel: mhi 0000:05:00.0: Requested to power ON
Nov 13 13:45:35 razor kernel: mhi 0000:05:00.0: Power on setup success
Nov 13 13:45:35 razor kernel: ath11k_pci 0000:05:00.0: Respond mem req failed, result: 1, err: 0
Nov 13 13:45:35 razor kernel: ath11k_pci 0000:05:00.0: qmi failed to respond fw mem req:-22
Nov 13 13:45:35 razor kernel: ath11k_pci 0000:05:00.0: req mem_seg[0] 0x2100000 524288 1
Nov 13 13:45:35 razor kernel: ath11k_pci 0000:05:00.0: req mem_seg[1] 0x2180000 524288 1
Nov 13 13:45:35 razor kernel: ath11k_pci 0000:05:00.0: req mem_seg[2] 0x2200000 524288 1
Nov 13 13:45:35 razor kernel: ath11k_pci 0000:05:00.0: req mem_seg[3] 0x2280000 294912 1
Nov 13 13:45:35 razor kernel: ath11k_pci 0000:05:00.0: req mem_seg[4] 0x2300000 524288 1
Nov 13 13:45:35 razor kernel: ath11k_pci 0000:05:00.0: req mem_seg[5] 0x2380000 524288 1
Nov 13 13:45:35 razor kernel: ath11k_pci 0000:05:00.0: req mem_seg[6] 0x2400000 458752 1
Nov 13 13:45:35 razor kernel: ath11k_pci 0000:05:00.0: req mem_seg[7] 0x20c0000 131072 1
Nov 13 13:45:35 razor kernel: ath11k_pci 0000:05:00.0: req mem_seg[8] 0x2480000 524288 4
Nov 13 13:45:35 razor kernel: ath11k_pci 0000:05:00.0: req mem_seg[9] 0x2500000 360448 4
Nov 13 13:45:35 razor kernel: ath11k_pci 0000:05:00.0: req mem_seg[10] 0x20a4000 16384 1
Nov 13 13:45:35 razor kernel: ath11k_pci 0000:05:00.0: chip_id 0x0 chip_family 0xb board_id 0xff soc_id 0xffffffff
Nov 13 13:45:35 razor kernel: ath11k_pci 0000:05:00.0: fw_version 0x101c06cc fw_build_timestamp 2020-06-24 19:50 
fw_build_id
Nov 13 13:45:37 razor NetworkManager[782]: <info>  [1605271537.1168] rfkill1: found Wi-Fi radio killswitch (at 
/sys/devices/pci0000:00/0000:00:1c.1/0000:05:00.0/ieee80211/phy0/rfkill1) (driver ath11k_pci)
Nov 13 13:45:39 razor ModemManager[722]: <info>  Couldn't check support for device 
'/sys/devices/pci0000:00/0000:00:1c.1/0000:05:00.0': not supported by any plugin
Nov 13 13:45:45 razor kernel: ath11k_pci 0000:05:00.0: failed to enqueue rx buf: -28

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
