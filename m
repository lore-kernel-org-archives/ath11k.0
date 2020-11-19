Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kft38-0004iB-Iy
 for ath11k@lists.infradead.org; Thu, 19 Nov 2020 23:09:12 +0000
Received: by mail-ed1-x52b.google.com with SMTP id e18so7620385edy.6
 for <ath11k@lists.infradead.org>; Thu, 19 Nov 2020 15:09:06 -0800 (PST)
MIME-Version: 1.0
References: <87sg95t9ez.fsf@codeaurora.org> <87o8jtt98l.fsf@codeaurora.org>
 <ba11dcda-ed2c-6840-e42c-bb3fa4e59cec@gmail.com>
 <CAHUdJJXWSiWz7Te0hJ5uvzk1iAtSdo8QrjBWiTHw_gSt4R+ZSg@mail.gmail.com>
In-Reply-To: <CAHUdJJXWSiWz7Te0hJ5uvzk1iAtSdo8QrjBWiTHw_gSt4R+ZSg@mail.gmail.com>
From: wi nk <wink@technolu.st>
Date: Fri, 20 Nov 2020 00:08:54 +0100
Message-ID: <CAHUdJJVOcwzKg3QTS8=p-C_s11WnpsX3cHJPSDadphrpKim_sA@mail.gmail.com>
Subject: Re: ath11k-qca6390-bringup-202011191920: new suspend implementation
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+kvalo=adurom.com@lists.infradead.org
To: Pavel Procopiuc <pavel.procopiuc@gmail.com>
Cc: ath11k@lists.infradead.org, Kalle Valo <kvalo@codeaurora.org>

On Thu, Nov 19, 2020 at 11:11 PM wi nk <wink@technolu.st> wrote:
>
> On Thu, Nov 19, 2020 at 11:00 PM Pavel Procopiuc
> <pavel.procopiuc@gmail.com> wrote:
> >
> > Op 19.11.2020 om 20:52 schreef Kalle Valo:
> > > Kalle Valo <kvalo@codeaurora.org> writes:
> > >
> > >> (Bcc: people reporting qca6390 problems)
> > >>
> > >> Hi,
> > >>
> > >> I collected all important QCA6390 fixes to ath11k-qca6390 branch so that
> > >> there's a good baseline for all testing:
> > >>
> > >> https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/log/?h=ath11k-qca6390-bringup
> > >>
> > >> At the moment it's based on v5.10-rc4 and I will try to update it to a
> > >> recent -rc release every few weeks or so. Everytime I update the branch
> > >> I create a new tag and the latest tag is now:
> > >>
> > >> ath11k-qca6390-bringup-202011191920
> > >>
> > >> In this tag there's now a brand new implementation for suspend, which
> > >> relies that the platform provides power to QCA6390 during suspend. Not
> > >> all platforms do, but most of them should do that. ath11k also prints a
> > >> warning whenever it notices that the firmware has crashed, but I'm not
> > >> sure yet if it (the MHI subsystem to be exact) can detect every case.
> > >>
> > >> The MSI patch is mostly the same, it had just some refactoring since the
> > >> last version. Unfortunately there's no solution still for the weird
> > >> crashes some people are seeing.
> > >
> > > Forgot to mention when debugging ath11k PCI issues it's a good idea to
> > > enable MHI debug messages. To do that enable CONFIG_MHI_BUS_DEBUG and
> > > CONFIG_DYNAMIC_DEBUG and run:
> > >
> > > sudo sh -c "echo -n 'module mhi +p' > /sys/kernel/debug/dynamic_debug/control"
> >
> > Thanks! I gave it a spin. Regarding problems loading the driver, there doesn't seem to be any changes, without the
> > memmap=20M$12M I'm seeing similar issues as before: inability to load firmware.
> >
> > Log with the module autoload at boot:
> > Nov 19 22:08:15 razor kernel: Linux version 5.10.0-rc4 (root@razor) (gcc (Gentoo 9.3.0-r1 p3) 9.3.0, GNU ld (Gentoo 2.34
> > p6) 2.34.0) #12 SMP Thu Nov 19 22:03:06 CET 2020
> > Nov 19 22:08:15 razor kernel:   DMA zone: 64 pages used for memmap
> > Nov 19 22:08:15 razor kernel:   DMA32 zone: 5213 pages used for memmap
> > Nov 19 22:08:15 razor kernel:   Normal zone: 255840 pages used for memmap
> > Nov 19 22:08:15 razor kernel: pci 0000:05:00.0: [17cb:1101] type 00 class 0x028000
> > Nov 19 22:08:15 razor kernel: pci 0000:05:00.0: reg 0x10: [mem 0xd2100000-0xd21fffff 64bit]
> > Nov 19 22:08:15 razor kernel: pci 0000:05:00.0: PME# supported from D0 D3hot D3cold
> > Nov 19 22:08:15 razor kernel: pci 0000:05:00.0: 4.000 Gb/s available PCIe bandwidth, limited by 5.0 GT/s PCIe x1 link at
> > 0000:00:1c.1 (capable of 7.876 Gb/s with 8.0 GT/s PCIe x1 link)
> > Nov 19 22:08:15 razor kernel: pci 0000:05:00.0: Adding to iommu group 21
> > Nov 19 22:08:16 razor kernel: ath11k_pci 0000:05:00.0: WARNING: ath11k PCI support is experimental!
> > Nov 19 22:08:16 razor kernel: ath11k_pci 0000:05:00.0: BAR 0: assigned [mem 0xd2100000-0xd21fffff 64bit]
> > Nov 19 22:08:16 razor kernel: ath11k_pci 0000:05:00.0: enabling device (0000 -> 0002)
> > Nov 19 22:08:16 razor kernel: ath11k_pci 0000:05:00.0: MSI vectors: 32
> > Nov 19 22:08:16 razor kernel: mhi 0000:05:00.0: Requested to power ON
> > Nov 19 22:08:16 razor kernel: mhi 0000:05:00.0: Power on setup success
> > Nov 19 22:08:16 razor kernel: ath11k_pci 0000:05:00.0: qmi req mem_seg[0] 0x1800000 3522560 1
> > Nov 19 22:08:16 razor kernel: ath11k_pci 0000:05:00.0: qmi req mem_seg[1] 0x1500000 884736 4
> > Nov 19 22:08:21 razor kernel: ath11k_pci 0000:05:00.0: qmi failed memory request, err = -110
> > Nov 19 22:08:21 razor kernel: ath11k_pci 0000:05:00.0: qmi failed to respond fw mem req:-110
> >
> > Log with manual load with "options ath11k debug_mask=0xffffffff" and after doing "echo -n 'module mhi +p' >
> > /sys/kernel/debug/dynamic_debug/control":
> > Nov 19 22:34:07 razor kernel: Linux version 5.10.0-rc4 (root@razor) (gcc (Gentoo 9.3.0-r1 p3) 9.3.0, GNU ld (Gentoo 2.34
> > p6) 2.34.0) #12 SMP Thu Nov 19 22:03:06 CET 2020
> > Nov 19 22:34:07 razor kernel:   DMA zone: 64 pages used for memmap
> > Nov 19 22:34:07 razor kernel:   DMA32 zone: 5213 pages used for memmap
> > Nov 19 22:34:07 razor kernel:   Normal zone: 255840 pages used for memmap
> > Nov 19 22:34:07 razor kernel: pci 0000:05:00.0: [17cb:1101] type 00 class 0x028000
> > Nov 19 22:34:07 razor kernel: pci 0000:05:00.0: reg 0x10: [mem 0xd2100000-0xd21fffff 64bit]
> > Nov 19 22:34:07 razor kernel: pci 0000:05:00.0: PME# supported from D0 D3hot D3cold
> > Nov 19 22:34:07 razor kernel: pci 0000:05:00.0: 4.000 Gb/s available PCIe bandwidth, limited by 5.0 GT/s PCIe x1 link at
> > 0000:00:1c.1 (capable of 7.876 Gb/s with 8.0 GT/s PCIe x1 link)
> > Nov 19 22:34:07 razor kernel: pci 0000:05:00.0: Adding to iommu group 21
> > Nov 19 22:34:42 razor sudo[2247]:      pro : TTY=pts/1 ; PWD=/home/pro ; USER=root ; COMMAND=/sbin/modprobe ath11k_pci
> > Nov 19 22:34:42 razor kernel: ath11k_pci 0000:05:00.0: WARNING: ath11k PCI support is experimental!
> > Nov 19 22:34:42 razor kernel: ath11k_pci 0000:05:00.0: BAR 0: assigned [mem 0xd2100000-0xd21fffff 64bit]
> > Nov 19 22:34:42 razor kernel: ath11k_pci 0000:05:00.0: enabling device (0000 -> 0002)
> > Nov 19 22:34:42 razor kernel: ath11k_pci 0000:05:00.0: boot pci_mem 0x000000003c58b991
> > Nov 19 22:34:42 razor kernel: ath11k_pci 0000:05:00.0: pci tcsr_soc_hw_version major 2 minor 0
> > Nov 19 22:34:42 razor kernel: ath11k_pci 0000:05:00.0: MSI vectors: 32
> > Nov 19 22:34:42 razor kernel: ath11k_pci 0000:05:00.0: msi base data is 0
> > Nov 19 22:34:42 razor kernel: ath11k_pci 0000:05:00.0: Hardware name qca6390 hw2.0
> > Nov 19 22:34:42 razor kernel: ath11k_pci 0000:05:00.0: Assign MSI to user: MHI, num_vectors: 3, user_base_data: 0,
> > base_vector: 0
> > Nov 19 22:34:42 razor kernel: ath11k_pci 0000:05:00.0: Number of assigned MSI for MHI is 3, base vector is 0
> > Nov 19 22:34:42 razor kernel: ath11k_pci 0000:05:00.0: target_reg a3b034, shadow reg 0x8fc shadow_idx 0x0, ring_type 0,
> > ring num 0
> > Nov 19 22:34:42 razor kernel: ath11k_pci 0000:05:00.0: target_reg a3b03c, shadow reg 0x900 shadow_idx 0x1, ring_type 0,
> > ring num 1
> > Nov 19 22:34:42 razor kernel: ath11k_pci 0000:05:00.0: target_reg a3b044, shadow reg 0x904 shadow_idx 0x2, ring_type 0,
> > ring num 2
> > Nov 19 22:34:42 razor kernel: ath11k_pci 0000:05:00.0: target_reg a3b04c, shadow reg 0x908 shadow_idx 0x3, ring_type 0,
> > ring num 3
> > Nov 19 22:34:42 razor kernel: ath11k_pci 0000:05:00.0: target_reg a3b054, shadow reg 0x90c shadow_idx 0x4, ring_type 1,
> > ring num 0
> > Nov 19 22:34:42 razor kernel: ath11k_pci 0000:05:00.0: target_reg a3b028, shadow reg 0x910 shadow_idx 0x5, ring_type 2,
> > ring num 0
> > Nov 19 22:34:42 razor kernel: ath11k_pci 0000:05:00.0: target_reg a3b020, shadow reg 0x914 shadow_idx 0x6, ring_type 3,
> > ring num 0
> > Nov 19 22:34:42 razor kernel: ath11k_pci 0000:05:00.0: target_reg a3b06c, shadow reg 0x918 shadow_idx 0x7, ring_type 4,
> > ring num 0
> > Nov 19 22:34:42 razor kernel: ath11k_pci 0000:05:00.0: target_reg a46000, shadow reg 0x91c shadow_idx 0x8, ring_type 5,
> > ring num 0
> > Nov 19 22:34:42 razor kernel: ath11k_pci 0000:05:00.0: target_reg a46008, shadow reg 0x920 shadow_idx 0x9, ring_type 5,
> > ring num 1
> > Nov 19 22:34:42 razor kernel: ath11k_pci 0000:05:00.0: target_reg a46010, shadow reg 0x924 shadow_idx 0xa, ring_type 5,
> > ring num 2
> > Nov 19 22:34:42 razor kernel: ath11k_pci 0000:05:00.0: target_reg a46018, shadow reg 0x928 shadow_idx 0xb, ring_type 6,
> > ring num 0
> > Nov 19 22:34:42 razor kernel: ath11k_pci 0000:05:00.0: target_reg a46034, shadow reg 0x92c shadow_idx 0xc, ring_type 7,
> > ring num 0
> > Nov 19 22:34:42 razor kernel: ath11k_pci 0000:05:00.0: target_reg a370b0, shadow reg 0x930 shadow_idx 0xd, ring_type 11,
> > ring num 0
> > Nov 19 22:34:42 razor kernel: ath11k_pci 0000:05:00.0: target_reg a37018, shadow reg 0x934 shadow_idx 0xe, ring_type 12,
> > ring num 0
> > Nov 19 22:34:42 razor kernel: ath11k_pci 0000:05:00.0: target_reg a370c4, shadow reg 0x938 shadow_idx 0xf, ring_type 13,
> > ring num 0
> > Nov 19 22:34:42 razor kernel: ath11k_pci 0000:05:00.0: target_reg a370cc, shadow reg 0x93c shadow_idx 0x10, ring_type
> > 13, ring num 1
> > Nov 19 22:34:42 razor kernel: ath11k_pci 0000:05:00.0: target_reg a370d4, shadow reg 0x940 shadow_idx 0x11, ring_type
> > 13, ring num 2
> > Nov 19 22:34:42 razor kernel: ath11k_pci 0000:05:00.0: target_reg a370dc, shadow reg 0x944 shadow_idx 0x12, ring_type
> > 13, ring num 3
> > Nov 19 22:34:42 razor kernel: ath11k_pci 0000:05:00.0: target_reg a00400, shadow reg 0x948 shadow_idx 0x13, ring_type 8,
> > ring num 0
> > Nov 19 22:34:42 razor kernel: ath11k_pci 0000:05:00.0: target_reg a03400, shadow reg 0x94c shadow_idx 0x14, ring_type 9,
> > ring num 1
> > Nov 19 22:34:42 razor kernel: ath11k_pci 0000:05:00.0: target_reg a0340c, shadow reg 0x950 shadow_idx 0x15, ring_type
> > 10, ring num 1
> > Nov 19 22:34:42 razor kernel: ath11k_pci 0000:05:00.0: target_reg a05400, shadow reg 0x954 shadow_idx 0x16, ring_type 9,
> > ring num 2
> > Nov 19 22:34:42 razor kernel: ath11k_pci 0000:05:00.0: target_reg a0540c, shadow reg 0x958 shadow_idx 0x17, ring_type
> > 10, ring num 2
> > Nov 19 22:34:42 razor kernel: ath11k_pci 0000:05:00.0: target_reg a06400, shadow reg 0x95c shadow_idx 0x18, ring_type 8,
> > ring num 3
> > Nov 19 22:34:42 razor kernel: ath11k_pci 0000:05:00.0: target_reg a08400, shadow reg 0x960 shadow_idx 0x19, ring_type 8,
> > ring num 4
> > Nov 19 22:34:42 razor kernel: ath11k_pci 0000:05:00.0: target_reg a0b400, shadow reg 0x964 shadow_idx 0x1a, ring_type 9,
> > ring num 5
> > Nov 19 22:34:42 razor kernel: ath11k_pci 0000:05:00.0: target_reg a0b40c, shadow reg 0x968 shadow_idx 0x1b, ring_type
> > 10, ring num 5
> > Nov 19 22:34:42 razor kernel: ath11k_pci 0000:05:00.0: target_reg a0e400, shadow reg 0x96c shadow_idx 0x1c, ring_type 8,
> > ring num 7
> > Nov 19 22:34:42 razor kernel: ath11k_pci 0000:05:00.0: Assign MSI to user: CE, num_vectors: 10, user_base_data: 3,
> > base_vector: 3
> > Nov 19 22:34:42 razor kernel: ath11k_pci 0000:05:00.0: Assign MSI to user: DP, num_vectors: 18, user_base_data: 14,
> > base_vector: 14
> > Nov 19 22:34:42 razor kernel: ath11k_pci 0000:05:00.0: irq:229 group:0
> > Nov 19 22:34:42 razor kernel: ath11k_pci 0000:05:00.0: irq:230 group:1
> > Nov 19 22:34:42 razor kernel: ath11k_pci 0000:05:00.0: irq:231 group:2
> > Nov 19 22:34:42 razor kernel: ath11k_pci 0000:05:00.0: irq:233 group:4
> > Nov 19 22:34:42 razor kernel: ath11k_pci 0000:05:00.0: irq:234 group:5
> > Nov 19 22:34:42 razor kernel: ath11k_pci 0000:05:00.0: irq:235 group:6
> > Nov 19 22:34:42 razor kernel: ath11k_pci 0000:05:00.0: irq:236 group:7
> > Nov 19 22:34:42 razor kernel: ath11k_pci 0000:05:00.0: irq:237 group:8
> > Nov 19 22:34:42 razor kernel: ath11k_pci 0000:05:00.0: irq:238 group:9
> > Nov 19 22:34:42 razor kernel: ath11k_pci 0000:05:00.0: irq:239 group:10
> > Nov 19 22:34:42 razor kernel: ath11k_pci 0000:05:00.0: msi base data is 0
> > Nov 19 22:34:42 razor kernel: ath11k_pci 0000:05:00.0: MHISTATUS 0xff04
> > Nov 19 22:34:42 razor kernel: ath11k_pci 0000:05:00.0: cookie:0x0
> > Nov 19 22:34:42 razor kernel: ath11k_pci 0000:05:00.0: WLAON_WARM_SW_ENTRY 0x0
> > Nov 19 22:34:42 razor kernel: ath11k_pci 0000:05:00.0: WLAON_WARM_SW_ENTRY 0x0
> > Nov 19 22:34:42 razor kernel: ath11k_pci 0000:05:00.0: soc reset cause:0
> > Nov 19 22:34:42 razor kernel: ath11k_pci 0000:05:00.0: setting mhi state: INIT(0)
> > Nov 19 22:34:42 razor kernel: ath11k_pci 0000:05:00.0: setting mhi state: POWER_ON(2)
> > Nov 19 22:34:42 razor kernel: mhi 0000:05:00.0: Requested to power ON
> > Nov 19 22:34:42 razor kernel: mhi 0000:05:00.0: Power on setup success
> >
> >
> > Suspend seems to work. The log after booting with memmap=20M$12M and doing suspend:
> > Nov 19 22:47:59 razor kernel: Linux version 5.10.0-rc4 (root@razor) (gcc (Gentoo 9.3.0-r1 p3) 9.3.0, GNU ld (Gentoo 2.34
> > p6) 2.34.0) #14 SMP Thu Nov 19 22:44:32 CET 2020
> > Nov 19 22:47:59 razor kernel: Command line: ro root=/dev/nvme0n1p2 resume=/dev/nvme1n1p1 zram.num_devices=2
> > memmap=20M$12M quiet
> > Nov 19 22:47:59 razor kernel:   DMA zone: 47 pages used for memmap
> > Nov 19 22:47:59 razor kernel:   DMA32 zone: 5149 pages used for memmap
> > Nov 19 22:47:59 razor kernel:   Normal zone: 255840 pages used for memmap
> > Nov 19 22:47:59 razor kernel: Kernel command line: ro root=/dev/nvme0n1p2 resume=/dev/nvme1n1p1 zram.num_devices=2
> > memmap=20M$12M quiet ro root=/dev/nvme0n1p2 resume=/dev/nvme1n1p1 zram.num_devices=2 memmap=20M$12M quiet
> > Nov 19 22:47:59 razor kernel: pci 0000:05:00.0: [17cb:1101] type 00 class 0x028000
> > Nov 19 22:47:59 razor kernel: pci 0000:05:00.0: reg 0x10: [mem 0xd2100000-0xd21fffff 64bit]
> > Nov 19 22:47:59 razor kernel: pci 0000:05:00.0: PME# supported from D0 D3hot D3cold
> > Nov 19 22:47:59 razor kernel: pci 0000:05:00.0: 4.000 Gb/s available PCIe bandwidth, limited by 5.0 GT/s PCIe x1 link at
> > 0000:00:1c.1 (capable of 7.876 Gb/s with 8.0 GT/s PCIe x1 link)
> > Nov 19 22:47:59 razor kernel: pci 0000:05:00.0: Adding to iommu group 21
> > Nov 19 22:48:00 razor kernel: ath11k_pci 0000:05:00.0: WARNING: ath11k PCI support is experimental!
> > Nov 19 22:48:00 razor kernel: ath11k_pci 0000:05:00.0: BAR 0: assigned [mem 0xd2100000-0xd21fffff 64bit]
> > Nov 19 22:48:00 razor kernel: ath11k_pci 0000:05:00.0: enabling device (0000 -> 0002)
> > Nov 19 22:48:00 razor kernel: ath11k_pci 0000:05:00.0: MSI vectors: 32
> > Nov 19 22:48:00 razor kernel: mhi 0000:05:00.0: Requested to power ON
> > Nov 19 22:48:00 razor kernel: mhi 0000:05:00.0: Power on setup success
> > Nov 19 22:48:00 razor kernel: ath11k_pci 0000:05:00.0: qmi req mem_seg[0] 0x2800000 3522560 1
> > Nov 19 22:48:00 razor kernel: ath11k_pci 0000:05:00.0: qmi req mem_seg[1] 0x2500000 884736 4
> > Nov 19 22:48:00 razor kernel: ath11k_pci 0000:05:00.0: chip_id 0x0 chip_family 0xb board_id 0xff soc_id 0xffffffff
> > Nov 19 22:48:00 razor kernel: ath11k_pci 0000:05:00.0: fw_version 0x101c06cc fw_build_timestamp 2020-06-24 19:50 fw_build_id
> > Nov 19 22:48:02 razor NetworkManager[793]: <info>  [1605822482.1378] rfkill1: found Wi-Fi radio killswitch (at
> > /sys/devices/pci0000:00/0000:00:1c.1/0000:05:00.0/ieee80211/phy0/rfkill1) (driver ath11k_pci)
> > Nov 19 22:48:04 razor ModemManager[725]: <info>  Couldn't check support for device
> > '/sys/devices/pci0000:00/0000:00:1c.1/0000:05:00.0': not supported by any plugin
> >
> > ... suspend here ...
> >
> > Nov 19 22:49:30 razor kernel: mhi 0000:05:00.0: Allowing M3 transition
> > Nov 19 22:49:30 razor kernel: mhi 0000:05:00.0: Wait for M3 completion
> > Nov 19 22:49:30 razor kernel: mhi 0000:05:00.0: Entered with PM state: M3, MHI state: M3
> > Nov 19 22:49:33 razor ModemManager[725]: <info>  Couldn't check support for device
> > '/sys/devices/pci0000:00/0000:00:1c.1/0000:05:00.0': not supported by any plugin
> >
> > --
> > ath11k mailing list
> > ath11k@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/ath11k
>
> Hi Pavel,
>
>   I'm compiling it now as well.  For your testing did you revert
> 7fef431be9c9ac255838a9578331567b9dba4477 again?  The memmap
> reservation never functioned for me.

Ok, so I can answer my own question, no I didn't need to revert that
commit.  That said I seem to be activating the RT throttling message
way more frequently (4/5 boots, this fifth one was successful).  Kalle
- following the thought that something is going out of control in the
irq tasklet stuff, earlier today I was playing with the MSI patch that
introduces the irq_enable_flag and the functions to set/unset it and
noticed that in the ath11k_pci_ce_* functions that enable / disable
IRQs , if I switched the order of the flag assignment and the irq
enable/disable function call, I saw this behavior more frequently as
well.  I haven't fully groked the re-entrancy model of these
functions, but there's definitely a race occuring somehow.  It seems
to occur mostly during some of the actual 802.11 association:

[   26.945028] ath11k_pci 0000:55:00.0: WARNING: ath11k PCI support is
experimental!
[   26.945102] ath11k_pci 0000:55:00.0: BAR 0: assigned [mem
0x8e300000-0x8e3fffff 64bit]
[   26.945120] ath11k_pci 0000:55:00.0: enabling device (0000 -> 0002)
[   26.945207] ath11k_pci 0000:55:00.0: MSI vectors: 1
[   26.949329] NET: Registered protocol family 42
[   26.999257] mhi 0000:55:00.0: Requested to power ON
[   26.999419] mhi 0000:55:00.0: Power on setup success
[   27.171994] ath11k_pci 0000:55:00.0: qmi req mem_seg[0] 0x27800000 3522560 1
[   27.171999] ath11k_pci 0000:55:00.0: qmi req mem_seg[1] 0x27d00000 884736 4
[   27.183341] ath11k_pci 0000:55:00.0: chip_id 0x0 chip_family 0xb
board_id 0xff soc_id 0xffffffff
[   27.183345] ath11k_pci 0000:55:00.0: fw_version 0x101c06cc
fw_build_timestamp 2020-06-24 19:50 fw_build_id
[   27.387420] ath11k_pci 0000:55:00.0 wlp85s0: renamed from wlan0

<snip>  Some time during the following pile of messages (after some
seconds) is when I usually experience the machine spinning out and
freezing.

[   34.843605] wlp85s0: authenticate with ec:08:6b:27:01:ea
[   34.990949] wlp85s0: send auth to ec:08:6b:27:01:ea (try 1/3)
[   35.094334] wlp85s0: send auth to ec:08:6b:27:01:ea (try 2/3)
[   35.096624] wlp85s0: authenticated
[   35.102421] wlp85s0: associate with ec:08:6b:27:01:ea (try 1/3)
[   35.105012] wlp85s0: RX AssocResp from ec:08:6b:27:01:ea
(capab=0x411 status=0 aid=6)
[   35.116898] wlp85s0: associated
[   35.154059] IPv6: ADDRCONF(NETDEV_CHANGE): wlp85s0: link becomes ready

If the machine/adapter survives about 10 seconds beyond this, it will
stay up indefinitely..

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
