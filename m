Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from a27-188.smtp-out.us-west-2.amazonses.com ([54.240.27.188])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iZHLb-0006pJ-N4
 for ath11k@lists.infradead.org; Mon, 25 Nov 2019 16:36:25 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: [PATCH 0/8] ath11k: first round of post-bringup patches
Date: Mon, 25 Nov 2019 16:36:18 +0000
Message-ID: <0101016ea36bc31b-81925bd3-6a89-4ea8-95ef-f255c81a4568-000000@us-west-2.amazonses.com>
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
To: linux-wireless@vger.kernel.org
Cc: ath11k@lists.infradead.org

Here's first of round of ath11k patches from ath11k-post-bringup
branch[1] which got queued while ath11k was in review. Major features
here are HE and TWT support.

Please review.

Kalle

[1] https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/log/?h=ath11k-post-bringup


John Crispin (6):
  ath11k: add RX stats support for radiotap
  ath11k: ignore event 0x6017
  ath11k: convert message from info to dbg
  ath11k: add HE support
  ath11k: add TWT support
  ath11k: add spatial reuse support

Tamizh chelvam (2):
  ath11k: fix missed bw conversion in tx completion
  ath11k: Remove dead code while handling amsdu packets

 drivers/net/wireless/ath/ath11k/core.h        |   2 +
 drivers/net/wireless/ath/ath11k/debugfs_sta.c |   2 +-
 drivers/net/wireless/ath/ath11k/dp_rx.c       |  51 ++---
 drivers/net/wireless/ath/ath11k/mac.c         | 309 +++++++++++++++++++++++++-
 drivers/net/wireless/ath/ath11k/mac.h         |   1 +
 drivers/net/wireless/ath/ath11k/reg.c         |   1 +
 drivers/net/wireless/ath/ath11k/wmi.c         | 133 ++++++++++-
 drivers/net/wireless/ath/ath11k/wmi.h         | 105 ++++++++-
 8 files changed, 558 insertions(+), 46 deletions(-)

-- 
2.7.4


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
