Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail29.static.mailgun.info ([104.130.122.29])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k6TrQ-0008RG-My
 for ath11k@lists.infradead.org; Fri, 14 Aug 2020 07:10:49 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: [PATCH 00/11] ath11k: firmware and board file support for PCI devices
Date: Fri, 14 Aug 2020 10:10:19 +0300
Message-Id: <1597389030-13887-1-git-send-email-kvalo@codeaurora.org>
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+kvalo=adurom.com@lists.infradead.org
To: ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org

Here's a second set of patches adding QCA6390 PCI support to ath11k.
Now m3 firmware and board file support is added as well various
smaller tweaks and fixes needed QCA6390 support.

There will be two more patchsets for QCA6390 after this. Please
review.

This patchset depends on the patchset:

ath11k: initial PCI support

Kalle

Carl Huang (4):
  ath11k: allocate smaller chunks of memory for firmware
  ath11k: fix memory OOB access in qmi_decode
  ath11k: fix KASAN warning of ath11k_qmi_wlanfw_wlan_cfg_send
  ath11k: enable internal sleep clock

Govind Singh (6):
  ath11k: add support for m3 firmware
  ath11k: add board file support for PCI devices
  ath11k: fill appropriate QMI service instance id for QCA6390
  ath11k: pci: add read32() and write32() hif operations
  ath11k: configure copy engine msi address in CE srng
  ath11k: setup ce tasklet for control path

Kalle Valo (1):
  ath11k: hal: create hw_srng_config dynamically

 drivers/net/wireless/ath/ath11k/ahb.c    |   4 +
 drivers/net/wireless/ath/ath11k/ce.c     |  32 ++++
 drivers/net/wireless/ath/ath11k/ce.h     |   2 +
 drivers/net/wireless/ath/ath11k/core.c   |   9 +-
 drivers/net/wireless/ath/ath11k/core.h   |  16 ++
 drivers/net/wireless/ath/ath11k/dbring.c |   2 +-
 drivers/net/wireless/ath/ath11k/dp.c     |   8 +-
 drivers/net/wireless/ath/ath11k/dp_rx.c  |   4 +-
 drivers/net/wireless/ath/ath11k/dp_tx.c  |   2 +-
 drivers/net/wireless/ath/ath11k/hal.c    | 119 +++++++------
 drivers/net/wireless/ath/ath11k/hal.h    |   8 +-
 drivers/net/wireless/ath/ath11k/hal_rx.c |   2 +-
 drivers/net/wireless/ath/ath11k/hal_tx.c |   2 +-
 drivers/net/wireless/ath/ath11k/hif.h    |  26 +++
 drivers/net/wireless/ath/ath11k/hw.h     |   3 +
 drivers/net/wireless/ath/ath11k/pci.c    | 200 ++++++++++++++++++++-
 drivers/net/wireless/ath/ath11k/pci.h    |   4 +
 drivers/net/wireless/ath/ath11k/qmi.c    | 293 ++++++++++++++++++++++++++++---
 drivers/net/wireless/ath/ath11k/qmi.h    |  25 ++-
 19 files changed, 654 insertions(+), 107 deletions(-)

-- 
2.7.4


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
