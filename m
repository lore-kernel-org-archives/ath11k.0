Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from z5.mailgun.us ([104.130.96.5])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNJE7-0000RF-5j
 for ath11k@lists.infradead.org; Tue, 29 Sep 2020 17:15:44 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: [PATCH 0/8] ath11k: qca6390: smaller new features and fixes
Date: Tue, 29 Sep 2020 20:15:28 +0300
Message-Id: <1601399736-3210-1-git-send-email-kvalo@codeaurora.org>
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

Few new features to improve QCA6390 PCI support and some bugfixes.

Ben Greear (1):
  ath11k: support loading ELF board files

Carl Huang (1):
  ath11k: fix AP mode for QCA6390

Govind Singh (1):
  ath11k: Use GFP_ATOMIC instead of GFP_KERNEL in idr_alloc

Kalle Valo (3):
  ath11k: add interface_modes to hw_params
  ath11k: pci: check TCSR_SOC_HW_VERSION
  ath11k: disable monitor mode on QCA6390

Wen Gong (2):
  ath11k: change to disable softirqs for ath11k_regd_update to solve
    deadlock
  ath11k: Use GFP_ATOMIC instead of GFP_KERNEL in
    ath11k_dp_htt_get_ppdu_desc

 drivers/net/wireless/ath/ath11k/core.c  |  14 ++++
 drivers/net/wireless/ath/ath11k/dp.c    |   3 +-
 drivers/net/wireless/ath/ath11k/dp_rx.c |  30 ++++-----
 drivers/net/wireless/ath/ath11k/dp_rx.h |   6 +-
 drivers/net/wireless/ath/ath11k/hw.h    |   3 +
 drivers/net/wireless/ath/ath11k/mac.c   | 115 ++++++++++++++++++++------------
 drivers/net/wireless/ath/ath11k/pci.c   |  46 +++++++++----
 drivers/net/wireless/ath/ath11k/qmi.c   |  12 +++-
 drivers/net/wireless/ath/ath11k/reg.c   |   6 +-
 9 files changed, 156 insertions(+), 79 deletions(-)

-- 
2.7.4


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
