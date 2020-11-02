Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kZX8A-00058x-S8
 for ath11k@lists.infradead.org; Mon, 02 Nov 2020 10:32:08 +0000
Received: by mail-ej1-x635.google.com with SMTP id oq3so16326266ejb.7
 for <ath11k@lists.infradead.org>; Mon, 02 Nov 2020 02:32:04 -0800 (PST)
Received: from ?IPv6:2a02:a44f:d2f0:0:3dc2:225b:4ecb:cb81?
 (2a02-a44f-d2f0-0-3dc2-225b-4ecb-cb81.fixed6.kpn.net.
 [2a02:a44f:d2f0:0:3dc2:225b:4ecb:cb81])
 by smtp.gmail.com with ESMTPSA id v21sm10091976edt.80.2020.11.02.02.32.02
 for <ath11k@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Nov 2020 02:32:02 -0800 (PST)
From: Pavel Procopiuc <pavel.procopiuc@gmail.com>
Subject: PROBLEM: unable to get QCA6390 to work
Message-ID: <fa22cf0f-3bac-add6-8c71-6f6cad5206d8@gmail.com>
Date: Mon, 2 Nov 2020 11:32:02 +0100
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
To: ath11k@lists.infradead.org

Hi,

I'm unable to get QCA6390 to work on kernel 5.10-rc2.

I have a Dell XPS 17 laptop with the QCA6390 device and I'm trying to get it to work using 5.10-rc2 kernel. So far I'm 
getting firmware errors in the log. For the kernel setup and firmware files I was following the guide from 
https://www.spinics.net/lists/linux-wireless/msg203111.html.

* The current firmware repo structure is a bit different so I'm using:
QCA6390/hw2.0/board-2.bin -> /lib/firmware/ath11k/QCA6390/hw2.0/board.bin
QCA6390/hw2.0/1.0.1/WLAN.HST.1.0.1-01740-QCAHSTSWPLZ_V2_TO_X86-1/amss.bin -> /lib/firmware/ath11k/QCA6390/hw2.0/amss.bin
QCA6390/hw2.0/1.0.1/WLAN.HST.1.0.1-01740-QCAHSTSWPLZ_V2_TO_X86-1/m3.bin -> /lib/firmware/ath11k/QCA6390/hw2.0/m3.bin

* My kernel info:
Linux razor 5.10.0-rc2 #2 SMP Mon Nov 2 10:38:39 CET 2020 x86_64 Intel(R) Core(TM) i9-10885H CPU @ 2.40GHz GenuineIntel 
GNU/Linux

* Kernel config:
# zgrep ATH11K /proc/config.gz
CONFIG_ATH11K=m
# CONFIG_ATH11K_AHB is not set
CONFIG_ATH11K_PCI=m
CONFIG_ATH11K_DEBUG=y
CONFIG_ATH11K_DEBUGFS=y
CONFIG_ATH11K_TRACING=y
CONFIG_ATH11K_SPECTRAL=y

* Modules:
# lsmod | grep ath11k
ath11k_pci             24576  0
mhi                    69632  2 ath11k_pci,qrtr_mhi
ath11k                450560  1 ath11k_pci
mac80211              892928  4 ath11k,rtl_usb,rtl8192cu,rtlwifi
cfg80211              815104  3 ath11k,rtlwifi,mac80211
qmi_helpers            28672  1 ath11k

* Relevant errors from the log:
# journalctl -b | grep -iP '05:00|ath11k'
Nov 02 10:41:26 razor kernel: pci 0000:05:00.0: [17cb:1101] type 00 class 0x028000
Nov 02 10:41:26 razor kernel: pci 0000:05:00.0: reg 0x10: [mem 0xd2100000-0xd21fffff 64bit]
Nov 02 10:41:26 razor kernel: pci 0000:05:00.0: PME# supported from D0 D3hot D3cold
Nov 02 10:41:26 razor kernel: pci 0000:05:00.0: 4.000 Gb/s available PCIe bandwidth, limited by 5.0 GT/s PCIe x1 link at 
0000:00:1c.1 (capable of 7.876 Gb/s with 8.0 GT/s PCIe x1 link)
Nov 02 10:41:26 razor kernel: pci 0000:05:00.0: Adding to iommu group 21
Nov 02 10:41:27 razor kernel: ath11k_pci 0000:05:00.0: WARNING: ath11k PCI support is experimental!
Nov 02 10:41:27 razor kernel: ath11k_pci 0000:05:00.0: BAR 0: assigned [mem 0xd2100000-0xd21fffff 64bit]
Nov 02 10:41:27 razor kernel: ath11k_pci 0000:05:00.0: enabling device (0000 -> 0002)
Nov 02 10:41:27 razor kernel: mhi 0000:05:00.0: Requested to power ON
Nov 02 10:41:27 razor kernel: mhi 0000:05:00.0: Power on setup success
Nov 02 10:41:27 razor kernel: ath11k_pci 0000:05:00.0: Respond mem req failed, result: 1, err: 0
Nov 02 10:41:27 razor kernel: ath11k_pci 0000:05:00.0: qmi failed to respond fw mem req:-22
Nov 02 10:41:32 razor kernel: ath11k_pci 0000:05:00.0: qmi failed memory request, err = -110
Nov 02 10:41:32 razor kernel: ath11k_pci 0000:05:00.0: qmi failed to respond fw mem req:-110
Nov 02 10:42:58 razor kernel: mhi 0000:05:00.0: Device failed to exit MHI Reset state

# lspci -knn
...
05:00.0 Network controller [0280]: Qualcomm Device [17cb:1101] (rev 01)
         Subsystem: Bigfoot Networks, Inc. Device [1a56:a501]
         Kernel driver in use: ath11k_pci
         Kernel modules: ath11k_pci
...

Regards,
Pavel

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
