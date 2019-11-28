Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from a27-56.smtp-out.us-west-2.amazonses.com ([54.240.27.56])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iaF3c-00015f-Bt
 for ath11k@lists.infradead.org; Thu, 28 Nov 2019 08:21:49 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: nFrom 964f1808c8512d0e99baf48cfa45cf5ee6b41952 Mon Sep 17 00:00:00
 2001
Date: Thu, 28 Nov 2019 08:21:45 +0000
Message-ID: <0101016eb11a0f72-517acc13-b581-4365-8b87-39e91d43d413-000000@us-west-2.amazonses.com>
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

Here's fourth, and last, round of ath11k patches from
ath11k-post-bringup branch[1] which got queued while ath11k was in
review.

This time there are various fixes.

Please review.

Kalle


John Crispin (1):
  ath11k: fix indentation in ath11k_mac_prepare_he_mode()

Manikanta Pubbisetty (1):
  ath11k: fix vht guard interval mapping

Miles Hu (1):
  ath11k: fix memory leak in monitor mode

Sriram R (1):
  ath11k: Update tx and rx chain count properly on drv_set_antenna

Vasanthakumar Thiagarajan (2):
  ath11k: Move mac80211 hw allocation before wmi_init command
  ath11k: Setup REO destination ring before sending wmi_init command

Venkateswara Naralasetty (3):
  ath11k: Advertise MPDU start spacing as no restriction
  ath11k: update tx duration in station info
  ath11k: Skip update peer stats for management packets

 drivers/net/wireless/ath/ath11k/core.c   |  40 ++++++++---
 drivers/net/wireless/ath/ath11k/core.h   |   1 +
 drivers/net/wireless/ath/ath11k/dp.c     |  10 ++-
 drivers/net/wireless/ath/ath11k/dp.h     |   5 +-
 drivers/net/wireless/ath/ath11k/dp_rx.c  |  95 ++++++++++++++++++-------
 drivers/net/wireless/ath/ath11k/dp_rx.h  |   2 +
 drivers/net/wireless/ath/ath11k/hal_rx.c |  16 ++++-
 drivers/net/wireless/ath/ath11k/hal_rx.h |   6 ++
 drivers/net/wireless/ath/ath11k/mac.c    | 116 ++++++++++++++++++++-----------
 drivers/net/wireless/ath/ath11k/mac.h    |   3 +-
 10 files changed, 211 insertions(+), 83 deletions(-)

-- 
2.7.4


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
