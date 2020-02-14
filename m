Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail26.static.mailgun.info ([104.130.122.26])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j2X3P-0000tM-Cp
 for ath11k@lists.infradead.org; Fri, 14 Feb 2020 09:14:33 +0000
From: Manikanta Pubbisetty <mpubbise@codeaurora.org>
Subject: [PATCH 0/2] ath11k: offload PN verification to the HW
Date: Fri, 14 Feb 2020 14:44:10 +0530
Message-Id: <1581671652-8115-1-git-send-email-mpubbise@codeaurora.org>
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
Cc: Manikanta Pubbisetty <mpubbise@codeaurora.org>, linux-wireless@vger.kernel.org

This patch series enables PN validation in the HW thereby
reducing CPU cycles spent in the host CPU. It also is the
basis for other performance improvement patches that follow
this series.

TSC (TKIP sequence counter) validation is also offloaded.

Hardware validates PN/TSC only for unicast packets;
for group addressed packets, PN validation is done
in mac80211.

This patchset is dependent on the following patch:
"ath11k: config reorder queue for all tids during peer setup"

Manikanta Pubbisetty (2):
  ath11k: handle RX fragments
  ath11k: enable PN offload

 drivers/net/wireless/ath/ath11k/Kconfig   |   1 +
 drivers/net/wireless/ath/ath11k/core.h    |   2 +
 drivers/net/wireless/ath/ath11k/dp.c      |  12 +-
 drivers/net/wireless/ath/ath11k/dp.h      |  12 +
 drivers/net/wireless/ath/ath11k/dp_rx.c   | 870 ++++++++++++++++++++++++++----
 drivers/net/wireless/ath/ath11k/dp_rx.h   |   8 +-
 drivers/net/wireless/ath/ath11k/hal.h     |   2 +-
 drivers/net/wireless/ath/ath11k/hal_rx.c  |  14 +-
 drivers/net/wireless/ath/ath11k/mac.c     |  41 +-
 drivers/net/wireless/ath/ath11k/peer.h    |   7 +
 drivers/net/wireless/ath/ath11k/rx_desc.h |   2 +-
 11 files changed, 865 insertions(+), 106 deletions(-)

-- 
2.7.4

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
