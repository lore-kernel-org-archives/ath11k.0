Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from m42-4.mailgun.net ([69.72.42.4])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNZhf-0004La-Lf
 for ath11k@lists.infradead.org; Wed, 30 Sep 2020 10:51:20 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: [PATCH 0/5] ath11k: qca6390: packet log support and fixes for crashes
Date: Wed, 30 Sep 2020 13:51:08 +0300
Message-Id: <1601463073-12106-1-git-send-email-kvalo@codeaurora.org>
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

Packet log support for QCA6390 is important as otherwise the data connection
will stall. Also some important fixes.

Depends on patchset: ath11k: qca6390: smaller new features and fixes

Carl Huang (4):
  ath11k: add packet log support for QCA6390
  ath11k: pci: fix rmmod crash
  ath11k: fix warning caused by lockdep_assert_held
  ath11k: debugfs: fix crash during rmmod

Wen Gong (1):
  ath11k: mac: remove unused conf_mutex to solve a deadlock

 drivers/net/wireless/ath/ath11k/core.h    |   3 +
 drivers/net/wireless/ath/ath11k/debugfs.c |   8 +--
 drivers/net/wireless/ath/ath11k/dp.c      |   2 +
 drivers/net/wireless/ath/ath11k/dp.h      |   3 +-
 drivers/net/wireless/ath/ath11k/dp_rx.c   | 108 ++++++++++++++++++++++--------
 drivers/net/wireless/ath/ath11k/dp_tx.c   |  81 +++++++++++++++-------
 drivers/net/wireless/ath/ath11k/hal.c     |   2 +
 drivers/net/wireless/ath/ath11k/hal_rx.c  |   4 +-
 drivers/net/wireless/ath/ath11k/hal_rx.h  |   2 +-
 drivers/net/wireless/ath/ath11k/mac.c     |  35 +++++++---
 drivers/net/wireless/ath/ath11k/pci.c     |   9 ++-
 11 files changed, 186 insertions(+), 71 deletions(-)

-- 
2.7.4


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
