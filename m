Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hb0nK-0000BK-VK
 for ath11k@lists.infradead.org; Wed, 12 Jun 2019 10:47:56 +0000
From: Maharaja Kennadyrajan <mkenna@codeaurora.org>
Subject: [PATCH 0/2] Added prefix in dp_tx.c and dp_rx.c files
Date: Wed, 12 Jun 2019 16:19:10 +0530
Message-Id: <1560336554-14420-3-git-send-email-mkenna@codeaurora.org>
In-Reply-To: <1560336554-14420-1-git-send-email-mkenna@codeaurora.org>
References: <1560336554-14420-1-git-send-email-mkenna@codeaurora.org>
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
Cc: Maharaja Kennadyrajan <mkenna@codeaurora.org>

Added 'ath11k' prefix to the struct dp_htt_wbm_tx_status
in the dp_tx.c and 'ath11k_dp_tx' prefix to all the
functions in the dp_tx.c and dp_rx.c

Maharaja Kennadyrajan (2):
  ath11k: Added 'ath11k' as prefix to the struct dp_htt_wbm_tx_status
  ath11k: Added prefix to all the functions in dp_tx.c file

 drivers/net/wireless/ath/ath11k/core.c        |   2 +-
 drivers/net/wireless/ath/ath11k/debug.c       |  12 +-
 .../net/wireless/ath/ath11k/debug_htt_stats.c |  10 +-
 drivers/net/wireless/ath/ath11k/dp.h          |   4 +-
 drivers/net/wireless/ath/ath11k/dp_rx.c       |  47 +++----
 drivers/net/wireless/ath/ath11k/dp_tx.c       | 130 +++++++++---------
 drivers/net/wireless/ath/ath11k/dp_tx.h       |  33 ++---
 drivers/net/wireless/ath/ath11k/mac.c         |   5 +-
 8 files changed, 124 insertions(+), 119 deletions(-)

-- 
2.21.0


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
