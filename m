Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail29.static.mailgun.info ([104.130.122.29])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k7BGk-00075V-1M
 for ath11k@lists.infradead.org; Sun, 16 Aug 2020 05:31:49 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: [PATCH 0/9] ath11k: last patches for QCA6390 support
Date: Sun, 16 Aug 2020 08:31:22 +0300
Message-Id: <1597555891-26112-1-git-send-email-kvalo@codeaurora.org>
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

Here interrupt and ring configuration changes, and some smaller stuff,
are done to get QCA6390 working.

This is the last patchset adding initial QCA6390 support. Now it's
possible to associate to an AP and ping with an QCA6390 device.

This patchset depends on the patchset:

ath11k: CE and HAL support for QCA6390

Kalle

Carl Huang (9):
  ath11k: enable DP interrupt setup for QCA6390
  ath11k: don't initialize rxdma1 related ring
  ath11k: setup QCA6390 rings for both rxdmas
  ath11k: refine the phy_id check in ath11k_reg_chan_list_event
  ath11k: delay vdev_start for QCA6390
  ath11k: assign correct search flag and type for QCA6390
  ath11k: process both lmac rings for QCA6390
  ath11k: use TCL_DATA_RING_0 for QCA6390
  ath11k: reset MHI during power down and power up

 drivers/net/wireless/ath/ath11k/core.c  |  14 +-
 drivers/net/wireless/ath/ath11k/core.h  |   7 +
 drivers/net/wireless/ath/ath11k/debug.c |  41 ++++--
 drivers/net/wireless/ath/ath11k/dp.c    | 189 ++++++++++++++++++++----
 drivers/net/wireless/ath/ath11k/dp.h    |   7 +-
 drivers/net/wireless/ath/ath11k/dp_rx.c | 208 +++++++++++++++++++-------
 drivers/net/wireless/ath/ath11k/dp_tx.c |  65 +++++---
 drivers/net/wireless/ath/ath11k/hw.c    |  68 +++++++++
 drivers/net/wireless/ath/ath11k/hw.h    |  40 ++++-
 drivers/net/wireless/ath/ath11k/mac.c   |  66 ++++++++-
 drivers/net/wireless/ath/ath11k/mhi.c   |  46 +++++-
 drivers/net/wireless/ath/ath11k/mhi.h   |  11 ++
 drivers/net/wireless/ath/ath11k/pci.c   | 254 +++++++++++++++++++++++++++++++-
 drivers/net/wireless/ath/ath11k/pci.h   |  17 +++
 drivers/net/wireless/ath/ath11k/wmi.c   |   7 +-
 15 files changed, 907 insertions(+), 133 deletions(-)

-- 
2.7.4


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
