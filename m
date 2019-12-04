Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from nbd.name ([2a01:4f8:221:3d45::2])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1icZDm-0003NU-BM
 for ath11k@lists.infradead.org; Wed, 04 Dec 2019 18:17:55 +0000
From: John Crispin <john@phrozen.org>
Subject: [PATCH V2 0/9] ath11k: resend pending patches
Date: Wed,  4 Dec 2019 19:17:36 +0100
Message-Id: <20191204181745.27297-1-john@phrozen.org>
MIME-Version: 1.0
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+kvalo=adurom.com@lists.infradead.org
To: Kalle Valo <kvalo@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org, John Crispin <john@phrozen.org>

Kalle merged ath11k into his next tree and then applied the huge backlog
from patchwork. This is a resend of pending patches that no longer apply
due to merge order conflicts.

Changes in V2:
* fix up the comments from Vassant

John Crispin (9):
  ath11k: add wmi helper for turning STA PS on/off
  ath11k: disable PS for STA interfaces by default upon bringup
  ath11k: drop memset when setting up a tx cmd desc
  ath11k: rename ath11k_wmi_base instances from wmi_sc to wmi_ab
  ath11k: add WMI calls to manually add/del/pause/resume TWT dialogs
  ath11k: add debugfs for TWT debug calls
  ath11k: move some tx_status parsing to debugfs code
  ath11k: optimise ath11k_dp_tx_completion_handler
  ath11k: optimize ath11k_hal_tx_status_parse

 drivers/net/wireless/ath/ath11k/core.c        |   4 +-
 drivers/net/wireless/ath/ath11k/core.h        |   3 +-
 drivers/net/wireless/ath/ath11k/debug.c       | 197 +++++++++
 drivers/net/wireless/ath/ath11k/debug.h       |   8 +
 drivers/net/wireless/ath/ath11k/debugfs_sta.c |  66 +--
 drivers/net/wireless/ath/ath11k/dp.c          |  16 +-
 drivers/net/wireless/ath/ath11k/dp.h          |  11 +-
 drivers/net/wireless/ath/ath11k/dp_tx.c       |  81 ++--
 drivers/net/wireless/ath/ath11k/hal_tx.c      |  74 +---
 drivers/net/wireless/ath/ath11k/hal_tx.h      |  13 +-
 drivers/net/wireless/ath/ath11k/htc.c         |   2 +-
 drivers/net/wireless/ath/ath11k/mac.c         |  15 +-
 drivers/net/wireless/ath/ath11k/testmode.c    |   2 +-
 drivers/net/wireless/ath/ath11k/wmi.c         | 407 ++++++++++++++----
 drivers/net/wireless/ath/ath11k/wmi.h         | 123 +++++-
 15 files changed, 771 insertions(+), 251 deletions(-)

-- 
2.20.1


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
