Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BA5EC4332F
	for <ath11k@archiver.kernel.org>; Tue, 22 Nov 2022 11:16:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:To:From:Subject:
	Date:Message-ID:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=PjxcSYiEDkB7FuY4uXGjCkbmYxGUNEtAZSQ3MxDzNBw=; b=vgc2T9PW4aj8W2
	KuTQzo8z2T7t+Wm4PyYo5aCXG8E8UZGbPb25MjB284OGijvoQ6r+/53wHan19NeZyTFZ5JWWt0VXm
	PrzCc/YmcSGwoJLX7/s5Vn9oagxZrultduzDiuge4ZW3EazdBbMKaq/RiR6vjIdklZ+dwAHSdakfP
	M89QhmSwzHsfygonTmIuwXzPfGwChkwH1tLw5PW8HPElA7u7Zwawa7gcfs/xF8P9DfnWEJP/NRi8S
	O7eCVgXlxGULwzoABXV3JU3/y8cF0EEaQPgwXUwEYt27OFk69Sk3I2fSbXraS8uiUnEABLvr9dBNx
	WoogDBnHXhKlgBcQi6hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxRG0-008IOn-Mh; Tue, 22 Nov 2022 11:16:04 +0000
Received: from smtp-190c.mail.infomaniak.ch ([185.125.25.12])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxRFw-008IMW-9v
	for ath11k@lists.infradead.org; Tue, 22 Nov 2022 11:16:03 +0000
Received: from smtp-3-0000.mail.infomaniak.ch (unknown [10.4.36.107])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4NGhWs171kzMq5X4
	for <ath11k@lists.infradead.org>; Tue, 22 Nov 2022 12:15:53 +0100 (CET)
Received: from [127.0.0.1] (unknown [10.92.208.254])
	by smtp-3-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4NGhWr6ScgzxH
	for <ath11k@lists.infradead.org>; Tue, 22 Nov 2022 12:15:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fls.name; s=20200831;
	t=1669115753; bh=Eb9lL2pl7UlwjjZc/EoqxSsSNklBFM2n7Yie726Kx6c=;
	h=Date:Subject:From:Reply-To:To:From;
	b=ko7doIiipVeD/snPu8JvGUiMsPBOF9u5vtA7XJQI+9D2tvU/wRHE0y+sIjrm8XRv/
	 zb6oSqF8PhUwuaJngm89e18Pk4iKQaZWOzFr24uJaqUP06bMnucHPNQrMgsyxAJAYf
	 h6Bei4sS3aUmE6U/w2pZnwtZUqK9MShTXyGYQvwo=
Message-ID: <1570ef9d2e5995a3c0f54024f7c27ecf@mail.infomaniak.com>
Date: Tue, 22 Nov 2022 12:15:51 +0100
Subject: ath11k: QCN9074: kernel panic after a few seconds in monitor mode
From: Florian Schmidt <florian@fls.name>
To: ath11k@lists.infradead.org
MIME-Version: 1.0
X-WS-User-Origin: eyJpdiI6IkpaVjhPMmRZektCd29sSEhVL3ZFMXc9PSIsInZhbHVlIjoiNHhqZnovclJLTFhxM2hvSHBFd05vUT09IiwibWFjIjoiY2NmZGFmZTg0ZTIwYzEzNGNiNWEyMzM1NTM5ZTBmMDFlYjQyNTEzODgzZTU5OTIzY2ZkZjgzNzM2Y2Q5YTIzMiIsInRhZyI6IiJ9
X-WS-User-Mbox: eyJpdiI6IlphQWJGZDdScXhyRXRibmlFSHRKMVE9PSIsInZhbHVlIjoiS2Y2aEJyMnFKZEZHaDJpZXdMdFRSUT09IiwibWFjIjoiYWFhZGZmNmI3OGM2YWU4MjU5MWZmNDBiMmI5Y2ZhMTZiMDc5ZWRkMDQ1ZWQ0MTY1NTAxYzMzNDQ3Y2ExZDdhMyIsInRhZyI6IiJ9
X-WS-Location: eJxzKUpMKykGAAfpAmU-
X-Mailer: Infomaniak Workspace (1.3.400)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221122_031600_812102_03E586AA 
X-CRM114-Status: GOOD (  12.34  )
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
Reply-To: Florian Schmidt <florian@fls.name>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Hi, 

I'm having issues using ath11k in monitor mode with QCN9074. Using a vanilla 6.0.1 kernel compiled from sources for an arm32 (v7) platform.

The kernel panics a few seconds after the driver has been loaded and the interface set in monitor mode. Do you have any hint on what goes wrong or is there anything I can do to help fix this ?

Thanks,
Florian

Script used to setup interface:
> iw wlan0 set monitor control
> sleep 2
> ip link set wlan0 up
> sleep 2
> iw wlan0 set freq 5680 80MHz
> sleep 2

uname -a
> Linux BV1-26804 6.0.1-xilinx #1 SMP PREEMPT Wed Oct 12 09:15:44 UTC 2022 armv7l GNU/Linux

lspci -mnn
> 00:00.0 "PCI bridge [0604]" "Xilinx Corporation [10ee]" "Device [7121]" "" ""
> 01:00.0 "Network controller [0280]" "Qualcomm [17cb]" "Device [1104]" -r01 "Qualcomm [17cb]" "Device [1104]"

Using firmware from linux-firmware, commit fdf1a65258522edf18a0a1768fbafa61ed07e598
find /lib/firmware/ath11k/ -type f | xargs md5sum
> fcca36959c5f56f9f0fb7015083dc806  /lib/firmware/ath11k/QCN9074/hw1.0/m3.bin
> 668f53050a92db5b4281ae5f26c7e35d  /lib/firmware/ath11k/QCN9074/hw1.0/board-2.bin
> 693ff3f4669e2c345c3a5446ca249406  /lib/firmware/ath11k/QCN9074/hw1.0/amss.bin

Dmesg's output:
> pci 0000:01:00.0: reg 0x10: [mem 0x00000000-0x001fffff 64bit]
> pci 0000:01:00.0: PME# supported from D0 D3hot D3cold
> pci 0000:01:00.0: 4.000 Gb/s available PCIe bandwidth, limited by 5.0 GT/s PCIe x1 link at 0000:00:00.0 (capable of 15.752 Gb/s with 8.0 GT/s PCIe x2 link)
> pci 0000:00:00.0: BAR 8: assigned [mem 0x80000000-0x801fffff]
> pci 0000:01:00.0: BAR 0: assigned [mem 0x80000000-0x801fffff 64bit]
> pci 0000:00:00.0: PCI bridge to [bus 01]
> pci 0000:00:00.0:   bridge window [mem 0x80000000-0x801fffff]
> ath11k_pci 0000:01:00.0: BAR 0: assigned [mem 0x80000000-0x801fffff 64bit]
> pci 0000:00:00.0: enabling device (0140 -> 0142)
> ath11k_pci 0000:01:00.0: enabling device (0000 -> 0002)
> ath11k_pci 0000:01:00.0: MSI vectors: 1
> ath11k_pci 0000:01:00.0: qcn9074 hw1.0
> NET: Registered PF_QIPCRTR protocol family
> mhi mhi0: Requested to power ON
> mhi mhi0: Power on setup success
> mhi mhi0: Wait for device to enter SBL or Mission mode
> ath11k_pci 0000:01:00.0: chip_id 0x0 chip_family 0x0 board_id 0xff soc_id 0xffffffff
> ath11k_pci 0000:01:00.0: fw_version 0x250a04b8 fw_build_timestamp 2021-12-20 06:41 fw_build_id
> ath11k_pci 0000:01:00.0: leaving PCI ASPM disabled to avoid MHI M2 problems
> 8<--- cut here ---
> Unable to handle kernel NULL pointer dereference at virtual address 00000064
> [00000064] *pgd=00000000
> Internal error: Oops - BUG: 17 [#1] PREEMPT SMP ARM
> Modules linked in: qrtr_mhi qrtr ath11k_pci mhi ath11k qmi_helpers mac80211 libarc4
> CPU: 0 PID: 0 Comm: swapper/0 Not tainted 6.0.1-xilinx #1
> Hardware name: Xilinx Zynq Platform
> PC is at ath11k_hw_qcn9074_rx_desc_get_decap_type+0x0/0xc [ath11k]
> LR is at ath11k_dp_rx_deliver_msdu+0x98/0x364 [ath11k]
> pc : [<bf0be008>]    lr : [<bf0b3658>]    psr: 40000113
> sp : c0c01c48  ip : ca729c38  fp : 08000080
> r10: 04000080  r9 : 00000001  r8 : cba1b540
> r7 : 00000000  r6 : ca729880  r5 : cba1b540  r4 : ca729a38
> r3 : bf0be008  r2 : cba1b540  r1 : 00000000  r0 : 00000000
> Flags: nZcv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Segment none
> Control: 18c5387d  Table: 0784804a  DAC: 00000051
> Register r0 information: NULL pointer
> Register r1 information: NULL pointer
> Register r2 information: slab skbuff_head_cache start cba1b540 pointer offset 0 size 48
> Register r3 information: 85-page vmalloc region starting at 0xbf08f000 allocated at load_module+0x978/0x1694
> Register r4 information: slab kmalloc-32k start ca728000 pointer offset 6712 size 32768
> Register r5 information: slab skbuff_head_cache start cba1b540 pointer offset 0 size 48
> Register r6 information: slab kmalloc-32k start ca728000 pointer offset 6272 size 32768
> Register r7 information: NULL pointer
> Register r8 information: slab skbuff_head_cache start cba1b540 pointer offset 0 size 48
> Register r9 information: non-paged memory
> Register r10 information: non-paged memory
> Register r11 information: non-paged memory
> Register r12 information: slab kmalloc-32k start ca728000 pointer offset 7224 size 32768
> Process swapper/0 (pid: 0, stack limit = 0xe8738c12)
> Stack: (0xc0c01c48 to 0xc0c02000)
> 1c40:                   00000000 00010000 00000000 00000000 00000000 00000001
> 1c60: c0c01ce4 ee2f6c73 00040088 c1002c80 cc43e540 bf0b9f8c a0000113 00000000
> 1c80: 00000000 ca729cb0 dd0ec000 c01e91ac ca729880 c7960000 ca729b08 00000000
> 1ca0: 00000000 bf0b9f9c 00000000 ca729880 00000000 cba91500 00000001 00000000
> 1cc0: 00000000 c7967c60 ca729880 ca729880 ca729b08 00000000 00000000 cba1b540
> 1ce0: 00000001 04000080 08000080 bf0b3ec4 c0c01cec 00000000 ca729a38 ee2f6c73
> 1d00: 00000000 ca729880 c7960000 c7d3dd00 00000000 00000000 00000001 c796124c
> 1d20: c796124c bf0ba654 cba1b540 c7967c60 0000003f c7967c60 00000000 c0c03cc8
> 1d40: 00000001 c0c01d78 00000001 ee2f6c73 0000003f 00000040 00000000 c796b000
> 1d60: c7960000 00000003 00000000 c7967c60 00000000 bf0afc88 c7cd9d00 c0157350
> 1d80: c7cd9d00 c0157370 c0c03cc8 00000040 c7967c60 00000040 c0c01e0b c0c01e14
> 1da0: 0000012c 00000000 c7967c60 bf0becc4 c7967c60 00000001 00000040 c0c01e0b
> 1dc0: c0c01e14 0000012c 00000000 c05f86b0 c7967c60 c0c01e0b c7968320 db7b7e40
> 1de0: c0b41e40 1ac76000 c0c01e0c c05f89e0 00020000 db7b8000 00010bc9 c0c03cc8
> 1e00: c0c02d40 00000000 007b61f0 c7968320 c7969760 c0c01e14 c0c01e14 ee2f6c73
> 1e20: c1205918 40000003 00000048 c0b41100 c0c075c0 0000000a c0c0208c 00000101
> 1e40: c0c02080 c010141c c1205900 c0824e34 04200002 00010bc8 00000004 c0c02d40
> 1e60: c0c02080 00000003 c0c040fc c05689d8 60000013 ffffffff c0c01ed4 00000000
> 1e80: c0c075c0 00000000 000000e5 c011f3bc c05689d8 c011f4a0 c05689d8 c0100ba8
> 1ea0: 00000000 000000e5 1ac76000 db7b7480 db7b6878 75964280 c0c356e0 00000000
> 1ec0: 00000000 7588900a 00000000 000000e5 fffffff5 c0c01ef0 c05689b4 c05689d8
> 1ee0: 60000013 ffffffff 00000051 c05689a4 c0c01f5b 00000000 000000e5 c073bc94
> 1f00: 0006770c 00000000 00375191 00000000 00000000 db7b6878 c0c356e0 00000000
> 1f20: 00000001 c0c03d58 c0b40870 c0c03d60 00000000 c0568ba4 db7b6878 c0c356e0
> 1f40: c0c03d10 c014729c 000000ec c0c03cc8 c0c03cc8 c0c03cc0 01000000 ee2f6c73
> 1f60: c0c3f000 000000ec 00000002 c0c03cc8 c0c03cc0 00000000 dbfffd80 c0c3f000
> 1f80: c0b32a68 c014741c c0c0baf0 c073a1b4 c0c3f068 00000001 c0c03cc8 c0b00a54
> 1fa0: c0c3f068 c0b00f84 ffffffff ffffffff 00000000 c0b006e8 00000000 c0c03cc8
> 1fc0: 00000000 c0b32a68 ee296c72 00000000 00000000 c0b00420 00000051 10c0387d
> 1fe0: 00000000 060f0000 413fc090 18c5387d 00000000 00000000 00000000 00000000
>  ath11k_hw_qcn9074_rx_desc_get_decap_type [ath11k] from ath11k_dp_rx_deliver_msdu+0x98/0x364 [ath11k]
>  ath11k_dp_rx_deliver_msdu [ath11k] from ath11k_dp_rx_mon_deliver+0x17c/0x398 [ath11k]
>  ath11k_dp_rx_mon_deliver [ath11k] from ath11k_dp_rx_process_mon_rings+0x2fc/0x3d0 [ath11k]
>  ath11k_dp_rx_process_mon_rings [ath11k] from ath11k_dp_service_srng+0x15c/0x264 [ath11k]
>  ath11k_dp_service_srng [ath11k] from ath11k_pcic_ext_grp_napi_poll+0x1c/0x7c [ath11k]
>  ath11k_pcic_ext_grp_napi_poll [ath11k] from __napi_poll+0x28/0x14c
>  __napi_poll from net_rx_action+0x14c/0x274
>  net_rx_action from __do_softirq+0x15c/0x1dc
>  __do_softirq from __irq_exit_rcu+0x80/0xcc
>  __irq_exit_rcu from irq_exit+0x8/0x10
>  irq_exit from __irq_svc+0x88/0xc8
> Exception stack(0xc0c01ea0 to 0xc0c01ee8)
> 1ea0: 00000000 000000e5 1ac76000 db7b7480 db7b6878 75964280 c0c356e0 00000000
> 1ec0: 00000000 7588900a 00000000 000000e5 fffffff5 c0c01ef0 c05689b4 c05689d8
> 1ee0: 60000013 ffffffff
>  __irq_svc from cpuidle_enter_state+0x180/0x310
>  cpuidle_enter_state from cpuidle_enter+0x28/0x38
>  cpuidle_enter from do_idle+0x23c/0x260
>  do_idle from cpu_startup_entry+0x18/0x1c
>  cpu_startup_entry from rest_init+0xb0/0xcc
>  rest_init from arch_post_acpi_subsys_init+0x0/0x8
> Code: e12fff1e e59000a4 e7e30150 e12fff1e (e5900064)
> ---[ end trace 0000000000000000 ]---
> Kernel panic - not syncing: Fatal exception in interrupt
> CPU1: stopping
> CPU: 1 PID: 533 Comm: syslogd Tainted: G      D            6.0.1-xilinx #1
> Hardware name: Xilinx Zynq Platform
>  unwind_backtrace from show_stack+0x10/0x14
>  show_stack from dump_stack_lvl+0x40/0x4c
>  dump_stack_lvl from do_handle_IPI+0x7c/0x13c
>  do_handle_IPI from ipi_handler+0x14/0x20
>  ipi_handler from handle_percpu_devid_irq+0x4c/0xe0
>  handle_percpu_devid_irq from handle_irq_desc+0x1c/0x2c
>  handle_irq_desc from gic_handle_irq+0x68/0x78
>  gic_handle_irq from generic_handle_arch_irq+0x28/0x3c
>  generic_handle_arch_irq from call_with_stack+0x18/0x20
>  call_with_stack from __irq_svc+0x98/0xc8
> Exception stack(0xf4bc9f08 to 0xf4bc9f50)
> 9f00:                   c13bb900 00000003 c7f1a818 000d801e 00004000 00000067
> 9f20: 0054d5ac c0c03cc8 f4bc9f7c 0054d5ac 00000067 be92eba0 00000001 f4bc9f58
> 9f40: c020af30 c020af48 600f0013 ffffffff
>  __irq_svc from __fget_light+0x40/0x5c
>  __fget_light from __fdget_pos+0x8/0x40
>  __fdget_pos from fdget_pos+0x10/0x28
>  fdget_pos from ksys_write+0x2c/0xb4
>  ksys_write from ret_fast_syscall+0x0/0x54
> Exception stack(0xf4bc9fa8 to 0xf4bc9ff0)
> 9fa0:                   0000006c 00000067 00000003 0054d5ac 00000067 00000000
> 9fc0: 0000006c 00000067 0054d5ac 00000004 0054c6d4 0000000c 00000004 be92eba0
> 9fe0: 00000004 be92ea88 b6e97a6b b6e246c6
> ---[ end Kernel panic - not syncing: Fatal exception in interrupt ]---

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
