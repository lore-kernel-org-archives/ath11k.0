Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail27.static.mailgun.info ([104.130.122.27])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jWypM-0008DR-FS
 for ath11k@lists.infradead.org; Fri, 08 May 2020 08:57:55 +0000
From: Govind Singh <govinds@codeaurora.org>
Subject: [PATCH 0/4] Add PCI client driver for QCA6390 chipset
Date: Fri,  8 May 2020 14:27:26 +0530
Message-Id: <20200508085730.23272-1-govinds@codeaurora.org>
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
Cc: Govind Singh <govinds@codeaurora.org>, linux-wireless@vger.kernel.org

QCA6390 chipsets is PCI based 11ax chipset to be supported in ath11k.

Add PCI client driver for QCA6390 chipset with enumeration/resource initialization/msi vector mapping.
With these changes driver is splitted in two modules(bus layer module/ common core module).
This is required due to following reasons.

 1) PCI based transport layer for QCA6390 chipsets.
 2) FW loading based on MHI protocol unlike rproc in IPQ8074A.
 3) MSI based data path/CE/fw RAM dump interrupt.
 4) CE assignments is different.
 5) Different boot up sequence due to requirement of voltage regulators/bootstrap
    pinctrls for QCA6390.
 6) Clear separation in bus level operation.


For AHB based devices:
ath11k_ahb.ko
ath11k_ko

For PCI based devices:
ath11k_pci.ko
ath11k.ko

Tested HW:
	IPQ8074A
	X86 + QCA6390: pci probe/resource setup

Govind Singh (4):
  ath11k: Add PCI client driver for QCA6390 chipset
  ath11k: setup pci resource for QCA6390 target
  ath11k: Add msi config init for QCA6390
  ath11k: Register mhi controller device for qca6390

 drivers/net/wireless/ath/ath11k/Kconfig  |  13 +-
 drivers/net/wireless/ath/ath11k/Makefile |   7 +-
 drivers/net/wireless/ath/ath11k/ahb.c    |  71 -----
 drivers/net/wireless/ath/ath11k/ce.c     |   2 +
 drivers/net/wireless/ath/ath11k/core.c   |   7 +
 drivers/net/wireless/ath/ath11k/core.h   |  11 +-
 drivers/net/wireless/ath/ath11k/debug.c  |   6 +-
 drivers/net/wireless/ath/ath11k/debug.h  |   1 +
 drivers/net/wireless/ath/ath11k/dp.c     |   1 +
 drivers/net/wireless/ath/ath11k/hal.c    |   1 +
 drivers/net/wireless/ath/ath11k/hif.h    |  77 ++++-
 drivers/net/wireless/ath/ath11k/mhi.c    | 379 ++++++++++++++++++++++
 drivers/net/wireless/ath/ath11k/mhi.h    |  28 ++
 drivers/net/wireless/ath/ath11k/pci.c    | 385 +++++++++++++++++++++++
 drivers/net/wireless/ath/ath11k/pci.h    |  49 +++
 15 files changed, 954 insertions(+), 84 deletions(-)
 create mode 100644 drivers/net/wireless/ath/ath11k/mhi.c
 create mode 100644 drivers/net/wireless/ath/ath11k/mhi.h
 create mode 100644 drivers/net/wireless/ath/ath11k/pci.c
 create mode 100644 drivers/net/wireless/ath/ath11k/pci.h

-- 
2.22.0

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
