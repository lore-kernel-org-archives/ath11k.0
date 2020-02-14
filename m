Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail26.static.mailgun.info ([104.130.122.26])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j2YGE-0006D1-BD
 for ath11k@lists.infradead.org; Fri, 14 Feb 2020 10:31:51 +0000
From: Sriram R <srirrama@codeaurora.org>
Subject: [PATCH 0/2] Support hash based reo destination ring selection
Date: Fri, 14 Feb 2020 16:01:24 +0530
Message-Id: <1581676286-13265-1-git-send-email-srirrama@codeaurora.org>
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
Cc: Sriram R <srirrama@codeaurora.org>

Currently, reo destination ring selection is based on pdev,
i.e each pdev is allocated a static reo destintaion ring and
rx packets for the pdev is always received on the ring.
This allows use of only 3 out of 4 reo destination rings at the
max when all pdev's are active and when only one pdev is active
we utilize only one ring and other 3 rings remain idle.
To make effective use of all the reo rings, this patchset enables
hash based reo destination ring selection where the hash is computed
based on the 5-tuple ( src/dst ip, src/dst port, protocol) info
from each packet and is used by hw for destination ring selection.

Also, current implementation of amsdu list based processing is replaced
with per msdu based handling since the received subframe could be
pushed to different rings after decap based on hash value computed.

This patchset is based on patchset "ath11k: offload PN verification to the HW"

Sriram R (2):
  ath11k: Configure hash based reo destination ring selection
  ath11k: Perform per-msdu rx processing

 drivers/net/wireless/ath/ath11k/ahb.c    |   5 -
 drivers/net/wireless/ath/ath11k/core.h   |   5 +-
 drivers/net/wireless/ath/ath11k/dp.c     |  35 ++-
 drivers/net/wireless/ath/ath11k/dp.h     |   4 +-
 drivers/net/wireless/ath/ath11k/dp_rx.c  | 511 +++++++++++++------------------
 drivers/net/wireless/ath/ath11k/dp_rx.h  |   4 +-
 drivers/net/wireless/ath/ath11k/dp_tx.c  |   2 +-
 drivers/net/wireless/ath/ath11k/hal.h    |  12 +-
 drivers/net/wireless/ath/ath11k/hal_rx.c |  15 +-
 drivers/net/wireless/ath/ath11k/mac.c    |  10 +
 drivers/net/wireless/ath/ath11k/mac.h    |   1 +
 drivers/net/wireless/ath/ath11k/peer.c   |   3 +
 drivers/net/wireless/ath/ath11k/peer.h   |   2 +
 drivers/net/wireless/ath/ath11k/wmi.c    |  35 +++
 drivers/net/wireless/ath/ath11k/wmi.h    |  13 +
 15 files changed, 338 insertions(+), 319 deletions(-)

-- 
2.7.4

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
