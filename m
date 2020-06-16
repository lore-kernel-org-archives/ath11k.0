Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail27.static.mailgun.info ([104.130.122.27])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jlC9I-0002d1-E6
 for ath11k@lists.infradead.org; Tue, 16 Jun 2020 14:01:16 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: [PATCH 00/12] preparation for IPQ6018 support
Date: Tue, 16 Jun 2020 17:00:43 +0300
Message-Id: <1592316055-24958-1-git-send-email-kvalo@codeaurora.org>
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

Here are some preparation patches for IPQ6018. Some of the patches are from
Anil's patchset "ath11k: Add IPQ6018 support" which I modifies and I did some
refactoring and cleanup on top.

All patches are compile tested only.

Anilkumar Kolli (5):
  ath11k: ahb: call ath11k_core_init() before irq configuration
  ath11k: convert ath11k_hw_params to an array
  ath11k: define max_radios in hw_params
  ath11k: add hw_ops for pdev id to hw_mac mapping
  ath11k: Add bdf-addr in hw_params

Kalle Valo (7):
  ath11k: create a common function to request all firmware files
  ath11k: don't use defines for hw specific firmware directories
  ath11k: change ath11k_core_fetch_board_data_api_n() to use
    ath11k_core_create_firmware_path()
  ath11k: remove useless info messages
  ath11k: qmi: cleanup info messages
  ath11k: don't use defines in hw_params
  ath11k: remove define ATH11K_QMI_DEFAULT_CAL_FILE_NAME

 drivers/net/wireless/ath/ath11k/Makefile   |   3 +-
 drivers/net/wireless/ath/ath11k/ahb.c      |  23 +++---
 drivers/net/wireless/ath/ath11k/core.c     | 115 ++++++++++++++++-------------
 drivers/net/wireless/ath/ath11k/core.h     |  12 ++-
 drivers/net/wireless/ath/ath11k/dp_rx.c    |   2 +-
 drivers/net/wireless/ath/ath11k/htc.c      |   2 +-
 drivers/net/wireless/ath/ath11k/hw.c       |  34 +++++++++
 drivers/net/wireless/ath/ath11k/hw.h       |  28 +++++--
 drivers/net/wireless/ath/ath11k/mac.c      |  10 +--
 drivers/net/wireless/ath/ath11k/peer.c     |   3 -
 drivers/net/wireless/ath/ath11k/qmi.c      |  22 ++----
 drivers/net/wireless/ath/ath11k/qmi.h      |   2 -
 drivers/net/wireless/ath/ath11k/reg.c      |   2 +-
 drivers/net/wireless/ath/ath11k/spectral.c |   8 +-
 drivers/net/wireless/ath/ath11k/wmi.c      |   4 +-
 15 files changed, 163 insertions(+), 107 deletions(-)
 create mode 100644 drivers/net/wireless/ath/ath11k/hw.c

-- 
2.7.4


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
