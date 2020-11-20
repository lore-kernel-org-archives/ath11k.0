Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kg3au-0000Rz-Ve
 for ath11k@lists.infradead.org; Fri, 20 Nov 2020 10:24:46 +0000
Received: by mail-ej1-x635.google.com with SMTP id lv15so6291408ejb.12
 for <ath11k@lists.infradead.org>; Fri, 20 Nov 2020 02:24:44 -0800 (PST)
Subject: Re: ath11k-qca6390-bringup-202011191920: new suspend implementation
References: <87sg95t9ez.fsf@codeaurora.org> <87o8jtt98l.fsf@codeaurora.org>
 <ba11dcda-ed2c-6840-e42c-bb3fa4e59cec@gmail.com>
 <875z60tlh8.fsf@codeaurora.org>
From: Pavel Procopiuc <pavel.procopiuc@gmail.com>
Message-ID: <d2cb032b-3dd8-6915-1b49-1c45e73f1ba7@gmail.com>
Date: Fri, 20 Nov 2020 11:24:41 +0100
MIME-Version: 1.0
In-Reply-To: <875z60tlh8.fsf@codeaurora.org>
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

Op 20.11.2020 om 10:40 schreef Kalle Valo:
> Pavel Procopiuc <pavel.procopiuc@gmail.com> writes:
> 
>> Suspend seems to work. The log after booting with memmap=20M$12M and doing suspend:
>> Nov 19 22:47:59 razor kernel: Linux version 5.10.0-rc4 (root@razor)
>> (gcc (Gentoo 9.3.0-r1 p3) 9.3.0, GNU ld (Gentoo 2.34 p6) 2.34.0) #14
>> SMP Thu Nov 19 22:44:32 CET 2020
>> Nov 19 22:47:59 razor kernel: Command line: ro root=/dev/nvme0n1p2
>> resume=/dev/nvme1n1p1 zram.num_devices=2 memmap=20M$12M quiet
>> Nov 19 22:47:59 razor kernel:   DMA zone: 47 pages used for memmap
>> Nov 19 22:47:59 razor kernel:   DMA32 zone: 5149 pages used for memmap
>> Nov 19 22:47:59 razor kernel:   Normal zone: 255840 pages used for memmap
>> Nov 19 22:47:59 razor kernel: Kernel command line: ro
>> root=/dev/nvme0n1p2 resume=/dev/nvme1n1p1 zram.num_devices=2
>> memmap=20M$12M quiet ro root=/dev/nvme0n1p2 resume=/dev/nvme1n1p1
>> zram.num_devices=2 memmap=20M$12M quiet
>> Nov 19 22:47:59 razor kernel: pci 0000:05:00.0: [17cb:1101] type 00 class 0x028000
>> Nov 19 22:47:59 razor kernel: pci 0000:05:00.0: reg 0x10: [mem
>> 0xd2100000-0xd21fffff 64bit]
>> Nov 19 22:47:59 razor kernel: pci 0000:05:00.0: PME# supported from D0 D3hot D3cold
>> Nov 19 22:47:59 razor kernel: pci 0000:05:00.0: 4.000 Gb/s available
>> PCIe bandwidth, limited by 5.0 GT/s PCIe x1 link at 0000:00:1c.1
>> (capable of 7.876 Gb/s with 8.0 GT/s PCIe x1 link)
>> Nov 19 22:47:59 razor kernel: pci 0000:05:00.0: Adding to iommu group 21
>> Nov 19 22:48:00 razor kernel: ath11k_pci 0000:05:00.0: WARNING: ath11k
>> PCI support is experimental!
>> Nov 19 22:48:00 razor kernel: ath11k_pci 0000:05:00.0: BAR 0: assigned
>> [mem 0xd2100000-0xd21fffff 64bit]
>> Nov 19 22:48:00 razor kernel: ath11k_pci 0000:05:00.0: enabling device (0000 -> 0002)
>> Nov 19 22:48:00 razor kernel: ath11k_pci 0000:05:00.0: MSI vectors: 32
>> Nov 19 22:48:00 razor kernel: mhi 0000:05:00.0: Requested to power ON
>> Nov 19 22:48:00 razor kernel: mhi 0000:05:00.0: Power on setup success
>> Nov 19 22:48:00 razor kernel: ath11k_pci 0000:05:00.0: qmi req
>> mem_seg[0] 0x2800000 3522560 1
>> Nov 19 22:48:00 razor kernel: ath11k_pci 0000:05:00.0: qmi req
>> mem_seg[1] 0x2500000 884736 4
>> Nov 19 22:48:00 razor kernel: ath11k_pci 0000:05:00.0: chip_id 0x0
>> chip_family 0xb board_id 0xff soc_id 0xffffffff
>> Nov 19 22:48:00 razor kernel: ath11k_pci 0000:05:00.0: fw_version
>> 0x101c06cc fw_build_timestamp 2020-06-24 19:50 fw_build_id
>> Nov 19 22:48:02 razor NetworkManager[793]: <info>  [1605822482.1378]
>> rfkill1: found Wi-Fi radio killswitch (at
>> /sys/devices/pci0000:00/0000:00:1c.1/0000:05:00.0/ieee80211/phy0/rfkill1)
>> (driver ath11k_pci)
>> Nov 19 22:48:04 razor ModemManager[725]: <info>  Couldn't check
>> support for device
>> '/sys/devices/pci0000:00/0000:00:1c.1/0000:05:00.0': not supported by
>> any plugin
>>
>> ... suspend here ...
>>
>> Nov 19 22:49:30 razor kernel: mhi 0000:05:00.0: Allowing M3 transition
>> Nov 19 22:49:30 razor kernel: mhi 0000:05:00.0: Wait for M3 completion
>> Nov 19 22:49:30 razor kernel: mhi 0000:05:00.0: Entered with PM state:
>> M3, MHI state: M3
>> Nov 19 22:49:33 razor ModemManager[725]: <info>  Couldn't check
>> support for device
>> '/sys/devices/pci0000:00/0000:00:1c.1/0000:05:00.0': not supported by
>> any plugin
> 
> And I guess resume also worked? :) Do you have logs about resume?

Yes, resume was successful and I could use wireless network thereafter :)) The ath11k module didn't produce any 
additional log lines after resume, only those "kernel: mhi ..." lines were visible.

> You had Dell XPS 17, right?

Yes, I've got the XPS 17 model with the i9 processor (the i7 and lower are outfitted with the Killer AX1650 wireless card).

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
