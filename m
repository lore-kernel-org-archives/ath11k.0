Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from m43-15.mailgun.net ([69.72.43.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1knmKo-0006k8-Bq
 for ath11k@lists.infradead.org; Fri, 11 Dec 2020 17:36:06 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: [PATCH 00/10] ath11k: suspend support for QCA6390 PCI
Date: Fri, 11 Dec 2020 19:35:40 +0200
Message-Id: <1607708150-21066-1-git-send-email-kvalo@codeaurora.org>
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

Here is suspend support for QCA6390 PCI devices. For suspend we switch firmware
to WoW mode and keep the firmware running. At the moment we are not able to
shutdown and fully power off the device due to bugs in MHI subsystem, so WoW
mode is a workaround for the time being.

This patchset depends on patchset:

ath11k: QCA6390 stability fixes
https://patchwork.kernel.org/project/linux-wireless/list/?series=399797

Please review.

Kalle

Carl Huang (9):
  ath11k: mhi: hook suspend and resume
  ath11k: hif: implement suspend and resume functions
  ath11k: pci: read select_window register to ensure write is finished
  ath11k: htc: implement suspend handling
  ath11k: dp: stop rx pktlog before suspend
  ath11k: set credit_update flag for flow controlled ep only
  ath11k: implement WoW enable and wakeup commands
  ath11k: hif: add ce irq enable and disable functions
  ath11k: implement suspend for QCA6390 PCI devices

Kalle Valo (1):
  ath11k: htc: remove unused struct ath11k_htc_ops

 drivers/net/wireless/ath/ath11k/Makefile |   3 +-
 drivers/net/wireless/ath/ath11k/ce.c     |   2 +-
 drivers/net/wireless/ath/ath11k/ce.h     |   2 +
 drivers/net/wireless/ath/ath11k/core.c   |  88 +++++++++++++++++
 drivers/net/wireless/ath/ath11k/core.h   |  11 +++
 drivers/net/wireless/ath/ath11k/dp.c     |   2 +-
 drivers/net/wireless/ath/ath11k/dp.h     |   2 +
 drivers/net/wireless/ath/ath11k/dp_rx.c  |  48 +++++++++
 drivers/net/wireless/ath/ath11k/dp_rx.h  |   3 +
 drivers/net/wireless/ath/ath11k/hif.h    |  32 ++++++
 drivers/net/wireless/ath/ath11k/htc.c    |  31 +++++-
 drivers/net/wireless/ath/ath11k/htc.h    |  10 +-
 drivers/net/wireless/ath/ath11k/hw.h     |   1 +
 drivers/net/wireless/ath/ath11k/mac.c    |   4 +
 drivers/net/wireless/ath/ath11k/mhi.c    |  11 +++
 drivers/net/wireless/ath/ath11k/mhi.h    |   3 +
 drivers/net/wireless/ath/ath11k/pci.c    |  71 ++++++++++++-
 drivers/net/wireless/ath/ath11k/wmi.c    |  99 +++++++++++++++++++
 drivers/net/wireless/ath/ath11k/wmi.h    | 165 +++++++++++++++++++++++++++++++
 drivers/net/wireless/ath/ath11k/wow.c    |  73 ++++++++++++++
 drivers/net/wireless/ath/ath11k/wow.h    |  10 ++
 21 files changed, 656 insertions(+), 15 deletions(-)
 create mode 100644 drivers/net/wireless/ath/ath11k/wow.c
 create mode 100644 drivers/net/wireless/ath/ath11k/wow.h

-- 
2.7.4


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
