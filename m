Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jisPQ-0000wB-Nx
 for ath11k@lists.infradead.org; Wed, 10 Jun 2020 04:32:23 +0000
From: Sriram R <srirrama@codeaurora.org>
Subject: [PATCH 0/2] mac80211: add 802.11 decapsulation offload support
Date: Wed, 10 Jun 2020 10:00:54 +0530
Message-Id: <1591763456-23275-1-git-send-email-srirrama@codeaurora.org>
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
To: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org
Cc: Sriram R <srirrama@codeaurora.org>

Adding support for offloading 802.11 decapsulation to the HW.
This helps in RX path optmization to reduces the CPU cycles
spent on host CPU for doing the conversion from 802.11 format
to ethernet format and thereby improving the performance of the device.

Sriram R (2):
  mac80211: add receive path for ethernet frame format
  ath11k: add rx path 802.11 decapsulation offloading support

 drivers/net/wireless/ath/ath11k/core.h     |   3 +
 drivers/net/wireless/ath/ath11k/dp_rx.c    | 185 ++++++++++++++----------
 drivers/net/wireless/ath/ath11k/hal_desc.h |   2 +
 drivers/net/wireless/ath/ath11k/mac.c      |  20 +++
 include/net/mac80211.h                     |  20 +++
 net/mac80211/rx.c                          | 222 ++++++++++++++++++++++++++++-
 6 files changed, 373 insertions(+), 79 deletions(-)

-- 
2.7.4


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
