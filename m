Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kZx3H-0002Mb-LI
 for ath11k@lists.infradead.org; Tue, 03 Nov 2020 14:12:50 +0000
Received: by mail-ej1-x629.google.com with SMTP id dk16so23707460ejb.12
 for <ath11k@lists.infradead.org>; Tue, 03 Nov 2020 06:12:46 -0800 (PST)
Subject: Re: PROBLEM: unable to get QCA6390 to work
References: <fa22cf0f-3bac-add6-8c71-6f6cad5206d8@gmail.com>
 <87lffjodu7.fsf@codeaurora.org>
 <fa338986-8de4-fde1-6805-d46793c947e4@gmail.com>
 <c9cc0ec6-4dda-2608-3575-0e6dfb6d0852@gmail.com>
 <51201ba28aeccb57dabc5e72868a899f@codeaurora.org>
From: Pavel Procopiuc <pavel.procopiuc@gmail.com>
Message-ID: <c4894a78-51d8-c347-7942-614deddeb41f@gmail.com>
Date: Tue, 3 Nov 2020 15:12:44 +0100
MIME-Version: 1.0
In-Reply-To: <51201ba28aeccb57dabc5e72868a899f@codeaurora.org>
Content-Type: multipart/mixed; boundary="------------89E4DB2A56BC0E4D5AEA4048"
Content-Language: en-US
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+kvalo=adurom.com@lists.infradead.org
To: Carl Huang <cjhuang@codeaurora.org>
Cc: ath11k@lists.infradead.org, Kalle Valo <kvalo@codeaurora.org>

This is a multi-part message in MIME format.
--------------89E4DB2A56BC0E4D5AEA4048
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

I'm attaching the output of:

# journalctl -b | grep -iP '05:00|ath11k|Linux version'

This is pristine 5.10-rc2 without any patches with the following firmware:

# md5sum /lib/firmware/ath11k/QCA6390/hw2.0/*
a101dc90f8e876f39383b60c9da64ec4  /lib/firmware/ath11k/QCA6390/hw2.0/amss.bin
4c0781f659d2b7d6bef10a2e3d457728  /lib/firmware/ath11k/QCA6390/hw2.0/board-2.bin
d4c912a3501a3694a3f460d13de06d28  /lib/firmware/ath11k/QCA6390/hw2.0/m3.bin

Op 03.11.2020 om 09:42 schreef Carl Huang:
> Please set ath11k.ko module parameter debug_mask to 0xffffffff, and then reproduce and share the log.

--------------89E4DB2A56BC0E4D5AEA4048
Content-Type: text/x-log; charset=UTF-8;
 name="ath11k.log"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="ath11k.log"

Nov 03 15:05:52 razor kernel: Linux version 5.10.0-rc2 (root@razor) (gcc (Gentoo 9.3.0-r1 p3) 9.3.0, GNU ld (Gentoo 2.34 p6) 2.34.0) #3 SMP Tue Nov 3 14:57:57 CET 2020
Nov 03 15:05:52 razor kernel: pci 0000:05:00.0: [17cb:1101] type 00 class 0x028000
Nov 03 15:05:52 razor kernel: pci 0000:05:00.0: reg 0x10: [mem 0xd2100000-0xd21fffff 64bit]
Nov 03 15:05:52 razor kernel: pci 0000:05:00.0: PME# supported from D0 D3hot D3cold
Nov 03 15:05:52 razor kernel: pci 0000:05:00.0: 4.000 Gb/s available PCIe bandwidth, limited by 5.0 GT/s PCIe x1 link at 0000:00:1c.1 (capable of 7.876 Gb/s with 8.0 GT/s PCIe x1 link)
Nov 03 15:05:52 razor kernel: pci 0000:05:00.0: Adding to iommu group 21
Nov 03 15:05:53 razor kernel: ath11k_pci 0000:05:00.0: WARNING: ath11k PCI support is experimental!
Nov 03 15:05:53 razor kernel: ath11k_pci 0000:05:00.0: BAR 0: assigned [mem 0xd2100000-0xd21fffff 64bit]
Nov 03 15:05:53 razor kernel: ath11k_pci 0000:05:00.0: enabling device (0000 -> 0002)
Nov 03 15:05:53 razor kernel: ath11k_pci 0000:05:00.0: boot pci_mem 0x00000000b539abac
Nov 03 15:05:53 razor kernel: ath11k_pci 0000:05:00.0: pci tcsr_soc_hw_version major 2 minor 0
Nov 03 15:05:53 razor kernel: ath11k_pci 0000:05:00.0: msi base data is 0
Nov 03 15:05:53 razor kernel: ath11k_pci 0000:05:00.0: Hardware name qca6390 hw2.0
Nov 03 15:05:53 razor kernel: ath11k_pci 0000:05:00.0: Assign MSI to user: MHI, num_vectors: 3, user_base_data: 0, base_vector: 0
Nov 03 15:05:53 razor kernel: ath11k_pci 0000:05:00.0: Number of assigned MSI for MHI is 3, base vector is 0
Nov 03 15:05:53 razor kernel: ath11k_pci 0000:05:00.0: target_reg a3b034, shadow reg 0x8fc shadow_idx 0x0, ring_type 0, ring num 0
Nov 03 15:05:53 razor kernel: ath11k_pci 0000:05:00.0: target_reg a3b03c, shadow reg 0x900 shadow_idx 0x1, ring_type 0, ring num 1
Nov 03 15:05:53 razor kernel: ath11k_pci 0000:05:00.0: target_reg a3b044, shadow reg 0x904 shadow_idx 0x2, ring_type 0, ring num 2
Nov 03 15:05:53 razor kernel: ath11k_pci 0000:05:00.0: target_reg a3b04c, shadow reg 0x908 shadow_idx 0x3, ring_type 0, ring num 3
Nov 03 15:05:53 razor kernel: ath11k_pci 0000:05:00.0: target_reg a3b054, shadow reg 0x90c shadow_idx 0x4, ring_type 1, ring num 0
Nov 03 15:05:53 razor kernel: ath11k_pci 0000:05:00.0: target_reg a3b028, shadow reg 0x910 shadow_idx 0x5, ring_type 2, ring num 0
Nov 03 15:05:53 razor kernel: ath11k_pci 0000:05:00.0: target_reg a3b020, shadow reg 0x914 shadow_idx 0x6, ring_type 3, ring num 0
Nov 03 15:05:53 razor kernel: ath11k_pci 0000:05:00.0: target_reg a3b06c, shadow reg 0x918 shadow_idx 0x7, ring_type 4, ring num 0
Nov 03 15:05:53 razor kernel: ath11k_pci 0000:05:00.0: target_reg a46000, shadow reg 0x91c shadow_idx 0x8, ring_type 5, ring num 0
Nov 03 15:05:53 razor kernel: ath11k_pci 0000:05:00.0: target_reg a46008, shadow reg 0x920 shadow_idx 0x9, ring_type 5, ring num 1
Nov 03 15:05:53 razor kernel: ath11k_pci 0000:05:00.0: target_reg a46010, shadow reg 0x924 shadow_idx 0xa, ring_type 5, ring num 2
Nov 03 15:05:53 razor kernel: ath11k_pci 0000:05:00.0: target_reg a46018, shadow reg 0x928 shadow_idx 0xb, ring_type 6, ring num 0
Nov 03 15:05:53 razor kernel: ath11k_pci 0000:05:00.0: target_reg a46034, shadow reg 0x92c shadow_idx 0xc, ring_type 7, ring num 0
Nov 03 15:05:53 razor kernel: ath11k_pci 0000:05:00.0: target_reg a370b0, shadow reg 0x930 shadow_idx 0xd, ring_type 11, ring num 0
Nov 03 15:05:53 razor kernel: ath11k_pci 0000:05:00.0: target_reg a37018, shadow reg 0x934 shadow_idx 0xe, ring_type 12, ring num 0
Nov 03 15:05:53 razor kernel: ath11k_pci 0000:05:00.0: target_reg a370c4, shadow reg 0x938 shadow_idx 0xf, ring_type 13, ring num 0
Nov 03 15:05:53 razor kernel: ath11k_pci 0000:05:00.0: target_reg a370cc, shadow reg 0x93c shadow_idx 0x10, ring_type 13, ring num 1
Nov 03 15:05:53 razor kernel: ath11k_pci 0000:05:00.0: target_reg a370d4, shadow reg 0x940 shadow_idx 0x11, ring_type 13, ring num 2
Nov 03 15:05:53 razor kernel: ath11k_pci 0000:05:00.0: target_reg a370dc, shadow reg 0x944 shadow_idx 0x12, ring_type 13, ring num 3
Nov 03 15:05:53 razor kernel: ath11k_pci 0000:05:00.0: target_reg a00400, shadow reg 0x948 shadow_idx 0x13, ring_type 8, ring num 0
Nov 03 15:05:53 razor kernel: ath11k_pci 0000:05:00.0: target_reg a03400, shadow reg 0x94c shadow_idx 0x14, ring_type 9, ring num 1
Nov 03 15:05:53 razor kernel: ath11k_pci 0000:05:00.0: target_reg a0340c, shadow reg 0x950 shadow_idx 0x15, ring_type 10, ring num 1
Nov 03 15:05:53 razor kernel: ath11k_pci 0000:05:00.0: target_reg a05400, shadow reg 0x954 shadow_idx 0x16, ring_type 9, ring num 2
Nov 03 15:05:53 razor kernel: ath11k_pci 0000:05:00.0: target_reg a0540c, shadow reg 0x958 shadow_idx 0x17, ring_type 10, ring num 2
Nov 03 15:05:53 razor kernel: ath11k_pci 0000:05:00.0: target_reg a06400, shadow reg 0x95c shadow_idx 0x18, ring_type 8, ring num 3
Nov 03 15:05:53 razor kernel: ath11k_pci 0000:05:00.0: target_reg a08400, shadow reg 0x960 shadow_idx 0x19, ring_type 8, ring num 4
Nov 03 15:05:53 razor kernel: ath11k_pci 0000:05:00.0: target_reg a0b400, shadow reg 0x964 shadow_idx 0x1a, ring_type 9, ring num 5
Nov 03 15:05:53 razor kernel: ath11k_pci 0000:05:00.0: target_reg a0b40c, shadow reg 0x968 shadow_idx 0x1b, ring_type 10, ring num 5
Nov 03 15:05:53 razor kernel: ath11k_pci 0000:05:00.0: target_reg a0e400, shadow reg 0x96c shadow_idx 0x1c, ring_type 8, ring num 7
Nov 03 15:05:53 razor kernel: ath11k_pci 0000:05:00.0: Assign MSI to user: CE, num_vectors: 10, user_base_data: 3, base_vector: 3
Nov 03 15:05:53 razor kernel: ath11k_pci 0000:05:00.0: Assign MSI to user: DP, num_vectors: 18, user_base_data: 14, base_vector: 14
Nov 03 15:05:53 razor kernel: ath11k_pci 0000:05:00.0: irq:226 group:0
Nov 03 15:05:53 razor kernel: ath11k_pci 0000:05:00.0: irq:227 group:1
Nov 03 15:05:53 razor kernel: ath11k_pci 0000:05:00.0: irq:228 group:2
Nov 03 15:05:53 razor kernel: ath11k_pci 0000:05:00.0: irq:230 group:4
Nov 03 15:05:53 razor kernel: ath11k_pci 0000:05:00.0: irq:231 group:5
Nov 03 15:05:53 razor kernel: ath11k_pci 0000:05:00.0: irq:232 group:6
Nov 03 15:05:53 razor kernel: ath11k_pci 0000:05:00.0: irq:233 group:7
Nov 03 15:05:53 razor kernel: ath11k_pci 0000:05:00.0: irq:234 group:8
Nov 03 15:05:53 razor kernel: ath11k_pci 0000:05:00.0: irq:235 group:9
Nov 03 15:05:53 razor kernel: ath11k_pci 0000:05:00.0: irq:236 group:10
Nov 03 15:05:53 razor kernel: ath11k_pci 0000:05:00.0: MHISTATUS 0xff04
Nov 03 15:05:53 razor kernel: ath11k_pci 0000:05:00.0: cookie:0x0
Nov 03 15:05:53 razor kernel: ath11k_pci 0000:05:00.0: WLAON_WARM_SW_ENTRY 0x152f8a8
Nov 03 15:05:53 razor kernel: ath11k_pci 0000:05:00.0: WLAON_WARM_SW_ENTRY 0x0
Nov 03 15:05:53 razor kernel: ath11k_pci 0000:05:00.0: soc reset cause:0
Nov 03 15:05:53 razor kernel: ath11k_pci 0000:05:00.0: setting mhi state: INIT(0)
Nov 03 15:05:53 razor kernel: ath11k_pci 0000:05:00.0: setting mhi state: POWER_ON(2)
Nov 03 15:05:53 razor kernel: mhi 0000:05:00.0: Requested to power ON
Nov 03 15:05:53 razor kernel: mhi 0000:05:00.0: Power on setup success
Nov 03 15:05:53 razor kernel: ath11k_pci 0000:05:00.0: qmi wifi fw qmi service connected
Nov 03 15:05:53 razor kernel: ath11k_pci 0000:05:00.0: qmi firmware request memory request
Nov 03 15:05:53 razor kernel: ath11k_pci 0000:05:00.0: qmi mem seg type 1 size 3522560
Nov 03 15:05:53 razor kernel: ath11k_pci 0000:05:00.0: qmi mem seg type 4 size 884736
Nov 03 15:05:53 razor kernel: ath11k_pci 0000:05:00.0: qmi delays mem_request 2
Nov 03 15:05:53 razor kernel: ath11k_pci 0000:05:00.0: Respond mem req failed, result: 1, err: 0
Nov 03 15:05:53 razor kernel: ath11k_pci 0000:05:00.0: qmi firmware request memory request
Nov 03 15:05:53 razor kernel: ath11k_pci 0000:05:00.0: qmi mem seg type 1 size 524288
Nov 03 15:05:53 razor kernel: ath11k_pci 0000:05:00.0: qmi failed to respond fw mem req:-22
Nov 03 15:05:53 razor kernel: ath11k_pci 0000:05:00.0: qmi mem seg type 1 size 524288
Nov 03 15:05:53 razor kernel: ath11k_pci 0000:05:00.0: qmi mem seg type 1 size 524288
Nov 03 15:05:53 razor kernel: ath11k_pci 0000:05:00.0: qmi mem seg type 1 size 294912
Nov 03 15:05:53 razor kernel: ath11k_pci 0000:05:00.0: qmi mem seg type 1 size 524288
Nov 03 15:05:53 razor kernel: ath11k_pci 0000:05:00.0: qmi mem seg type 1 size 524288
Nov 03 15:05:53 razor kernel: ath11k_pci 0000:05:00.0: qmi mem seg type 1 size 458752
Nov 03 15:05:53 razor kernel: ath11k_pci 0000:05:00.0: qmi mem seg type 1 size 131072
Nov 03 15:05:53 razor kernel: ath11k_pci 0000:05:00.0: qmi mem seg type 4 size 524288
Nov 03 15:05:53 razor kernel: ath11k_pci 0000:05:00.0: qmi mem seg type 4 size 360448
Nov 03 15:05:53 razor kernel: ath11k_pci 0000:05:00.0: qmi mem seg type 1 size 16384
Nov 03 15:05:58 razor kernel: ath11k_pci 0000:05:00.0: qmi failed memory request, err = -110
Nov 03 15:05:58 razor kernel: ath11k_pci 0000:05:00.0: qmi failed to respond fw mem req:-110

--------------89E4DB2A56BC0E4D5AEA4048
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k

--------------89E4DB2A56BC0E4D5AEA4048--
