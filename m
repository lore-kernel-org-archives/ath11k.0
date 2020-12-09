Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-oi1-x234.google.com ([2607:f8b0:4864:20::234])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kn1BB-0002Fb-OB
 for ath11k@lists.infradead.org; Wed, 09 Dec 2020 15:14:59 +0000
Received: by mail-oi1-x234.google.com with SMTP id q25so2024988oij.10
 for <ath11k@lists.infradead.org>; Wed, 09 Dec 2020 07:14:55 -0800 (PST)
MIME-Version: 1.0
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 9 Dec 2020 18:14:42 +0300
Message-ID: <CAA8EJpo-QvRkrL_dabY5R_uEh0_aaGEqNC6n_bpj=LR7dUPvvQ@mail.gmail.com>
Subject: ath11k: additional board files
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
To: ath11k@lists.infradead.org

Hello,

I'd like to ask for inclusion of the board data for
bus=pci,qmi-chip-id=0,qmi-board-id=4 into QCA6390/hw2.0 board data,
which is necessary to bring up WiFi on Qualcomm's SM8250 SoC.

Kernel without board data:

# dmesg | grep 1:00
[    4.188174] pci 0000:01:00.0: [17cb:1101] type 00 class 0xff0000
[    4.194498] pci 0000:01:00.0: reg 0x10: [mem 0x00000000-0x000fffff 64bit]
[    4.202474] pci 0000:01:00.0: PME# supported from D0 D3hot D3cold
[    4.209090] pci 0000:01:00.0: 4.000 Gb/s available PCIe bandwidth,
limited by 5.0 GT/s PCIe x1 link at 0000:00:00.0 (capable of 7.876
Gb/s with 8.0 GT/s PCIe x1 link)
[    4.265964] pci 0000:01:00.0: BAR 0: assigned [mem
0x60300000-0x603fffff 64bit]
[    4.311981] ath11k_pci 0000:01:00.0: Adding to iommu group 6
[    4.317830] ath11k_pci 0000:01:00.0: WARNING: ath11k PCI support is
experimental!
[    4.326180] ath11k_pci 0000:01:00.0: BAR 0: assigned [mem
0x60300000-0x603fffff 64bit]
[    4.334423] ath11k_pci 0000:01:00.0: enabling device (0000 -> 0002)
[    4.416053] ath11k_pci 0000:01:00.0: aspm 0x40 changed to 0x40
[    4.422099] mhi 0000:01:00.0: Requested to power ON
[    4.429152] mhi 0000:01:00.0: Power on setup success
[    4.653608] ath11k_pci 0000:01:00.0: chip_id 0x0 chip_family 0xb
board_id 0x4 soc_id 0xffffffff
[    4.662558] ath11k_pci 0000:01:00.0: fw_version 0x101c06cc
fw_build_timestamp 2020-06-24 19:50 fw_build_id
[    4.672657] ath11k_pci 0000:01:00.0: failed to fetch board data for
bus=pci,qmi-chip-id=0,qmi-board-id=4 from
ath11k/QCA6390/hw2.0/board-2.bin
[   66.625006] ath11k_pci 0000:01:00.0: failed to fetch board-2.bin or
board.bin from QCA6390/hw2.0
[   66.634067] ath11k_pci 0000:01:00.0: qmi failed to load bdf:
[   66.640097] ath11k_pci 0000:01:00.0: qmi failed to load board data file:-11


Kernel log with proper board file:

# dmesg | grep 1:00
[    4.199993] pci 0000:01:00.0: [17cb:1101] type 00 class 0xff0000
[    4.206319] pci 0000:01:00.0: reg 0x10: [mem 0x00000000-0x000fffff 64bit]
[    4.214295] pci 0000:01:00.0: PME# supported from D0 D3hot D3cold
[    4.220911] pci 0000:01:00.0: 4.000 Gb/s available PCIe bandwidth,
limited by 5.0 GT/s PCIe x1 link at 0000:00:00.0 (capable of 7.876
Gb/s with 8.0 GT/s PCIe x1 link)
[    4.277673] pci 0000:01:00.0: BAR 0: assigned [mem
0x60300000-0x603fffff 64bit]
[    4.323674] ath11k_pci 0000:01:00.0: Adding to iommu group 6
[    4.329522] ath11k_pci 0000:01:00.0: WARNING: ath11k PCI support is
experimental!
[    4.338034] ath11k_pci 0000:01:00.0: BAR 0: assigned [mem
0x60300000-0x603fffff 64bit]
[    4.346288] ath11k_pci 0000:01:00.0: enabling device (0000 -> 0002)
[    4.428084] ath11k_pci 0000:01:00.0: aspm 0x40 changed to 0x40
[    4.434132] mhi 0000:01:00.0: Requested to power ON
[    4.441169] mhi 0000:01:00.0: Power on setup success
[    4.664210] ath11k_pci 0000:01:00.0: chip_id 0x0 chip_family 0xb
board_id 0x4 soc_id 0xffffffff
[    4.673189] ath11k_pci 0000:01:00.0: fw_version 0x101c06cc
fw_build_timestamp 2020-06-24 19:50 fw_build_id
[   10.710139] ath11k_pci 0000:01:00.0 wlp1s0: renamed from wlan0

-- 
With best wishes
Dmitry

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
