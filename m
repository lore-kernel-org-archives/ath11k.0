Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kdb7x-0006Nj-B1
 for ath11k@lists.infradead.org; Fri, 13 Nov 2020 15:36:42 +0000
Received: by mail-ed1-x534.google.com with SMTP id l5so11148921edq.11
 for <ath11k@lists.infradead.org>; Fri, 13 Nov 2020 07:36:40 -0800 (PST)
In-Reply-To: <20201112062555.3335-1-cjhuang@codeaurora.org>
From: Pavel Procopiuc <pavel.procopiuc@gmail.com>
Subject: Re: [RFC v2] ath11k: enable non-wow suspend and resume
Message-ID: <2cae4d60-21f3-e248-c5f9-dafd52731008@gmail.com>
Date: Fri, 13 Nov 2020 16:36:36 +0100
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
To: Carl Huang <cjhuang@codeaurora.org>
Cc: ath11k@lists.infradead.org

> For QCA6390, it needs to power down target when system suspends and
> needs to power up target when system resumes in non-wow scenario.
> 
> The power up procedure downloads firmware again.

I've tried the patch against 5.10-rc3 (with 7fef431be9c9 reverted) and resuming from the suspend didn't bring up the 
wireless card QCA6390 (in Dell XPS 17):

$ journalctl -b | grep -iP '05:00|ath11k|Linux version'
Nov 13 13:47:51 razor kernel: Linux version 5.10.0-rc3 (root@razor) (gcc (Gentoo 9.3.0-r1 p3) 9.3.0, GNU ld (Gentoo 2.34 
p6) 2.34.0) #8 SMP Thu Nov 12 13:56:10 CET 2020
Nov 13 13:47:51 razor kernel: pci 0000:05:00.0: [17cb:1101] type 00 class 0x028000
Nov 13 13:47:51 razor kernel: pci 0000:05:00.0: reg 0x10: [mem 0xd2100000-0xd21fffff 64bit]
Nov 13 13:47:51 razor kernel: pci 0000:05:00.0: PME# supported from D0 D3hot D3cold
Nov 13 13:47:51 razor kernel: pci 0000:05:00.0: 4.000 Gb/s available PCIe bandwidth, limited by 5.0 GT/s PCIe x1 link at 
0000:00:1c.1 (capable of 7.876 Gb/s with 8.0 GT/s PCIe x1 link)
Nov 13 13:47:51 razor kernel: pci 0000:05:00.0: Adding to iommu group 21
Nov 13 13:47:52 razor kernel: ath11k_pci 0000:05:00.0: WARNING: ath11k PCI support is experimental!
Nov 13 13:47:52 razor kernel: ath11k_pci 0000:05:00.0: BAR 0: assigned [mem 0xd2100000-0xd21fffff 64bit]
Nov 13 13:47:52 razor kernel: ath11k_pci 0000:05:00.0: enabling device (0000 -> 0002)
Nov 13 13:47:52 razor kernel: mhi 0000:05:00.0: Requested to power ON
Nov 13 13:47:52 razor kernel: mhi 0000:05:00.0: Power on setup success
Nov 13 13:47:52 razor kernel: ath11k_pci 0000:05:00.0: Respond mem req failed, result: 1, err: 0
Nov 13 13:47:52 razor kernel: ath11k_pci 0000:05:00.0: qmi failed to respond fw mem req:-22
Nov 13 13:47:52 razor kernel: ath11k_pci 0000:05:00.0: chip_id 0x0 chip_family 0xb board_id 0xff soc_id 0xffffffff
Nov 13 13:47:52 razor kernel: ath11k_pci 0000:05:00.0: fw_version 0x101c06cc fw_build_timestamp 2020-06-24 19:50 fw_build_id
Nov 13 13:47:54 razor NetworkManager[791]: <info>  [1605271674.1171] rfkill1: found Wi-Fi radio killswitch (at 
/sys/devices/pci0000:00/0000:00:1c.1/0000:05:00.0/ieee80211/phy0/rfkill1) (driver ath11k_pci)
Nov 13 13:47:56 razor ModemManager[728]: <info>  Couldn't check support for device 
'/sys/devices/pci0000:00/0000:00:1c.1/0000:05:00.0': not supported by any plugin

... suspended and resumed here ...

Nov 13 14:09:13 razor kernel: ath11k_pci 0000:05:00.0: link down error during global reset
Nov 13 14:09:13 razor kernel: ath11k_pci 0000:05:00.0: link down error during global reset
Nov 13 14:09:13 razor kernel: DMAR: [INTR-REMAP] Request device [05:00.0] fault index 80 [fault reason 34] Present field 
in the IRTE entry is clear
Nov 13 14:09:13 razor kernel: mhi 0000:05:00.0: Requested to power ON
Nov 13 14:09:13 razor kernel: mhi 0000:05:00.0: Power on setup success
Nov 13 14:09:13 razor kernel: ath11k_pci 0000:05:00.0: Respond mem req failed, result: 1, err: 0
Nov 13 14:09:13 razor kernel: ath11k_pci 0000:05:00.0: qmi failed to respond fw mem req:-22
Nov 13 14:09:13 razor kernel: ath11k_pci 0000:05:00.0: chip_id 0x0 chip_family 0xb board_id 0xff soc_id 0xffffffff
Nov 13 14:09:13 razor kernel: ath11k_pci 0000:05:00.0: fw_version 0x101c06cc fw_build_timestamp 2020-06-24 19:50 fw_build_id
Nov 13 14:09:13 razor kernel: ath11k_pci 0000:05:00.0: failed to connect to HTT: -108
Nov 13 14:09:13 razor kernel: ath11k_pci 0000:05:00.0: failed to start core: -108
Nov 13 14:09:16 razor ModemManager[728]: <info>  Couldn't check support for device 
'/sys/devices/pci0000:00/0000:00:1c.1/0000:05:00.0': not supported by any plugin
Nov 13 14:09:17 razor kernel: ath11k_pci 0000:05:00.0: wait mac start timeout
Nov 13 14:09:17 razor kernel: ath11k_pci 0000:05:00.0: failed to send WMI_PDEV_SET_PARAM cmd
Nov 13 14:09:17 razor kernel: ath11k_pci 0000:05:00.0: failed to enable PMF QOS: (-108
Nov 13 14:09:17 razor kernel: ath11k_pci 0000:05:00.0: failed to send WMI_PDEV_SET_PARAM cmd
Nov 13 14:09:17 razor kernel: ath11k_pci 0000:05:00.0: failed to enable PMF QOS: (-108
Nov 13 14:09:17 razor kernel: ath11k_pci 0000:05:00.0: failed to send WMI_PDEV_SET_PARAM cmd
Nov 13 14:09:17 razor kernel: ath11k_pci 0000:05:00.0: failed to enable PMF QOS: (-108
Nov 13 14:09:27 razor kernel: ath11k_pci 0000:05:00.0: failed to send WMI_PDEV_SET_PARAM cmd
Nov 13 14:09:27 razor kernel: ath11k_pci 0000:05:00.0: failed to enable PMF QOS: (-108
Nov 13 14:09:27 razor kernel: ath11k_pci 0000:05:00.0: failed to send WMI_PDEV_SET_PARAM cmd
Nov 13 14:09:27 razor kernel: ath11k_pci 0000:05:00.0: failed to enable PMF QOS: (-108
Nov 13 14:09:37 razor kernel: ath11k_pci 0000:05:00.0: failed to send WMI_PDEV_SET_PARAM cmd
Nov 13 14:09:37 razor kernel: ath11k_pci 0000:05:00.0: failed to enable PMF QOS: (-108
Nov 13 14:09:37 razor kernel: ath11k_pci 0000:05:00.0: failed to send WMI_PDEV_SET_PARAM cmd
Nov 13 14:09:37 razor kernel: ath11k_pci 0000:05:00.0: failed to enable PMF QOS: (-108
Nov 13 14:09:41 razor NetworkManager[791]: <info>  [1605272981.9889] radio killswitch 
/sys/devices/pci0000:00/0000:00:1c.1/0000:05:00.0/ieee80211/phy0/rfkill1 disappeared

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
