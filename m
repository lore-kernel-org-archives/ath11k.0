Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from m42-4.mailgun.net ([69.72.42.4])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNuzV-00069H-Kx
 for ath11k@lists.infradead.org; Thu, 01 Oct 2020 09:35:15 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: [PATCH 0/8] ath11k: enable shadow register for QCA6390
Date: Thu,  1 Oct 2020 12:34:42 +0300
Message-Id: <1601544890-13450-1-git-send-email-kvalo@codeaurora.org>
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

Enable the shadow register feature for QCA6390, so that it can enter idle power
save mode. Shadow registers can be accessed regardless target's power state,
and hardware will forward the value to target register automatically.

Also implement a workaround to fix a shadow register deficit.

This depends on patchset: ath11k: qca6390: packet log support and fixes for crashes

Kalle

Carl Huang (7):
  ath11k: read and write registers below unwindowed address
  ath11k: enable shadow register configuration and access
  ath11k: set WMI pipe credit to 1 for QCA6390
  ath11k: start a timer to update TCL HP
  ath11k: start a timer to update REO cmd ring
  ath11k: start a timer to update HP for CE pipe 4
  ath11k: enable idle power save mode

Kalle Valo (1):
  ath11k: remove unnecessary casts to u32

 drivers/net/wireless/ath/ath11k/ce.c     |  80 ++++++++++++++++++
 drivers/net/wireless/ath/ath11k/ce.h     |   3 +
 drivers/net/wireless/ath/ath11k/core.c   |   7 ++
 drivers/net/wireless/ath/ath11k/dp.c     |  97 ++++++++++++++++++++++
 drivers/net/wireless/ath/ath11k/dp.h     |  24 ++++++
 drivers/net/wireless/ath/ath11k/dp_tx.c  |   2 +
 drivers/net/wireless/ath/ath11k/hal.c    | 135 +++++++++++++++++++++++++++++--
 drivers/net/wireless/ath/ath11k/hal.h    |  19 ++++-
 drivers/net/wireless/ath/ath11k/hal_rx.c |   2 +
 drivers/net/wireless/ath/ath11k/htc.c    |   6 ++
 drivers/net/wireless/ath/ath11k/hw.h     |   2 +
 drivers/net/wireless/ath/ath11k/mac.c    |   9 +++
 drivers/net/wireless/ath/ath11k/pci.c    |  38 +++++++++
 drivers/net/wireless/ath/ath11k/pci.h    |   7 ++
 drivers/net/wireless/ath/ath11k/qmi.c    |  13 ++-
 drivers/net/wireless/ath/ath11k/qmi.h    |   2 +-
 16 files changed, 434 insertions(+), 12 deletions(-)

-- 
2.7.4


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
