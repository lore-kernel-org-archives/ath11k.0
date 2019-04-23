Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hJ0FF-0007DP-PB
 for ath11k@lists.infradead.org; Tue, 23 Apr 2019 18:34:18 +0000
From: Bhagavathi Perumal S <bperumal@codeaurora.org>
Subject: [PATCH v2 0/3] ath11k: Add some bug fixes and enhancements in htt
 stats
Date: Wed, 24 Apr 2019 00:03:48 +0530
Message-Id: <1556044431-32431-1-git-send-email-bperumal@codeaurora.org>
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

v2:
 Fixes compilation errors and warnings in x86_64.

 drivers/net/wireless/ath/ath11k/core.h            |   11 +-
 drivers/net/wireless/ath/ath11k/debug.h           |   50 +
 drivers/net/wireless/ath/ath11k/debug_htt_stats.c | 1346 +++++++++------------
 drivers/net/wireless/ath/ath11k/debug_htt_stats.h |  134 +-
 drivers/net/wireless/ath/ath11k/debugfs_sta.c     |   56 +
 drivers/net/wireless/ath/ath11k/dp.h              |   41 +
 drivers/net/wireless/ath/ath11k/dp_tx.c           |   12 +-
 drivers/net/wireless/ath/ath11k/dp_tx.h           |    4 +-
 8 files changed, 713 insertions(+), 941 deletions(-)

-- 
1.9.1


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
