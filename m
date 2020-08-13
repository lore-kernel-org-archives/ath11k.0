Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from m43-7.mailgun.net ([69.72.43.7])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k69AV-0006go-Fa
 for ath11k@lists.infradead.org; Thu, 13 Aug 2020 09:05:06 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: [PATCH 00/10] ath11k: initial PCI support
Date: Thu, 13 Aug 2020 12:04:16 +0300
Message-Id: <1597309466-19688-1-git-send-email-kvalo@codeaurora.org>
MIME-Version: 1.0
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
Cc: linux-wireless@vger.kernel.org

ath11k: initial PCI support

QCA6390 is a Wi-Fi 6 device using PCI bus but which accessed using
Modem Host Interface (MHI) protocol. As the first step to get QCA6390
working in ath11k add basic support for PCI and MHI.

With this patchset only the simple PCI initialisation works with
QCA6390. More patches will follow to get more features working with
QCA6390.

Tested-on: QCA6390 hw2.0 PCI WLAN.HST.1.0.1-01740-QCAHSTSWPLZ_V2_TO_X86-1
Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.1.0.1-01238-QCAHKSWPL_SILICONZ-2

Please review.

Kalle

Carl Huang (2):
  ath11k: do not depend on ARCH_QCOM for ath11k
  ath11k: add hw_params entry for QCA6390

Govind Singh (6):
  ath11k: add simple PCI client driver for QCA6390 chipset
  ath11k: pci: setup resources
  ath11k: pci: add MSI config initialisation
  ath11k: register MHI controller device for QCA6390
  ath11k: pci: add HAL, CE and core initialisation
  ath11k: use remoteproc only with AHB devices

Kalle Valo (2):
  ath11k: move ring mask definitions to hw_params
  ath11k: implement ath11k_core_pre_init()

 drivers/net/wireless/ath/ath11k/Kconfig  |  18 +-
 drivers/net/wireless/ath/ath11k/Makefile |   7 +-
 drivers/net/wireless/ath/ath11k/ahb.c    | 100 +----
 drivers/net/wireless/ath/ath11k/ce.c     |   4 +
 drivers/net/wireless/ath/ath11k/core.c   |  59 ++-
 drivers/net/wireless/ath/ath11k/core.h   |  22 +-
 drivers/net/wireless/ath/ath11k/debug.c  |   5 +
 drivers/net/wireless/ath/ath11k/debug.h  |   1 +
 drivers/net/wireless/ath/ath11k/dp.c     |  23 +-
 drivers/net/wireless/ath/ath11k/hal.c    |   2 +
 drivers/net/wireless/ath/ath11k/hif.h    |   4 +
 drivers/net/wireless/ath/ath11k/hw.c     |  72 +++
 drivers/net/wireless/ath/ath11k/hw.h     |  19 +
 drivers/net/wireless/ath/ath11k/mhi.c    | 423 ++++++++++++++++++
 drivers/net/wireless/ath/ath11k/mhi.h    |  28 ++
 drivers/net/wireless/ath/ath11k/pci.c    | 738 +++++++++++++++++++++++++++++++
 drivers/net/wireless/ath/ath11k/pci.h    |  44 ++
 17 files changed, 1459 insertions(+), 110 deletions(-)
 create mode 100644 drivers/net/wireless/ath/ath11k/mhi.c
 create mode 100644 drivers/net/wireless/ath/ath11k/mhi.h
 create mode 100644 drivers/net/wireless/ath/ath11k/pci.c
 create mode 100644 drivers/net/wireless/ath/ath11k/pci.h

-- 
2.7.4


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
