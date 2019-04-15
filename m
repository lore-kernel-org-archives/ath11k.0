Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hG3uz-0007zY-OW
 for ath11k@lists.infradead.org; Mon, 15 Apr 2019 15:53:14 +0000
From: Bhagavathi Perumal S <bperumal@codeaurora.org>
Subject: [PATCH 0/3] ath11k: Add some bug fixes and enhancements in htt stats
Date: Mon, 15 Apr 2019 21:22:46 +0530
Message-Id: <1555343569-2072-1-git-send-email-bperumal@codeaurora.org>
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
Cc: Bhagavathi Perumal S <bperumal@codeaurora.org>

This fixes few coding bugs, And adds htt peer stats
as a separate debugfs entry and htt stats reset.

Bhagavathi Perumal S (3):
  ath11k: Fix few coding bugs in htt stats
  ath11k: Add htt peer stats support
  ath11k: Add debugfs entry to support htt stats reset

 drivers/net/wireless/ath/ath11k/core.h            |   11 +-
 drivers/net/wireless/ath/ath11k/debug.h           |   50 +
 drivers/net/wireless/ath/ath11k/debug_htt_stats.c | 1338 +++++++++------------
 drivers/net/wireless/ath/ath11k/debug_htt_stats.h |  134 +--
 drivers/net/wireless/ath/ath11k/debugfs_sta.c     |   56 +
 drivers/net/wireless/ath/ath11k/dp.h              |   41 +
 drivers/net/wireless/ath/ath11k/dp_tx.c           |   12 +-
 drivers/net/wireless/ath/ath11k/dp_tx.h           |    4 +-
 8 files changed, 709 insertions(+), 937 deletions(-)

-- 
1.9.1


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
