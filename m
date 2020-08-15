Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from m43-7.mailgun.net ([69.72.43.7])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k6q9x-0005Uw-Ta
 for ath11k@lists.infradead.org; Sat, 15 Aug 2020 06:59:23 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: [PATCH 00/12] ath11k: CE and HAL support for QCA6390
Date: Sat, 15 Aug 2020 09:59:00 +0300
Message-Id: <1597474752-23287-1-git-send-email-kvalo@codeaurora.org>
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

Here we are adding QCA6390 support to CE and HAL as well as some
changes to WMI.

For QCA6390 support there will be one more patchset after this. Please
review.

This patchset depends on the patchset:

ath11k: firmware and board file support for PCI devices

Kalle

Carl Huang (9):
  ath11k: hal: create register values dynamically
  ath11k: ce: support different CE configurations
  ath11k: hal: assign msi_addr and msi_data to srng
  ath11k: ce: get msi_addr and msi_data before srng setup
  ath11k: disable CE interrupt before hif start
  ath11k: force single pdev only for QCA6390
  ath11k: initialize wmi config based on hw_params
  ath11k: wmi: put hardware to DBS mode
  ath11k: dp: redefine peer_map and peer_unmap

Kalle Valo (3):
  ath11k: hal: cleanup dynamic register macros
  ath11k: ce: remove host_ce_config_wlan macro
  ath11k: ce: remove CE_COUNT() macro

 drivers/net/wireless/ath/ath11k/ahb.c    |  24 ++--
 drivers/net/wireless/ath/ath11k/ce.c     | 114 ++++++++++++++---
 drivers/net/wireless/ath/ath11k/ce.h     |  10 +-
 drivers/net/wireless/ath/ath11k/core.c   |  10 ++
 drivers/net/wireless/ath/ath11k/core.h   |   1 +
 drivers/net/wireless/ath/ath11k/dp.h     |   6 +-
 drivers/net/wireless/ath/ath11k/dp_rx.c  |   2 +
 drivers/net/wireless/ath/ath11k/hal.c    |  72 +++++------
 drivers/net/wireless/ath/ath11k/hal.h    | 171 ++++++++++++++------------
 drivers/net/wireless/ath/ath11k/hal_rx.c |   8 +-
 drivers/net/wireless/ath/ath11k/htc.c    |   2 +-
 drivers/net/wireless/ath/ath11k/hw.c     | 204 +++++++++++++++++++++++++++++++
 drivers/net/wireless/ath/ath11k/hw.h     |  63 ++++++++++
 drivers/net/wireless/ath/ath11k/mac.c    |  33 +++++
 drivers/net/wireless/ath/ath11k/pci.c    |  25 ++--
 drivers/net/wireless/ath/ath11k/wmi.c    |  94 +++++++++-----
 16 files changed, 648 insertions(+), 191 deletions(-)

-- 
2.7.4


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
