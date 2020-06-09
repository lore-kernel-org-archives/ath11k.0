Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail27.static.mailgun.info ([104.130.122.27])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jieNj-0007WP-43
 for ath11k@lists.infradead.org; Tue, 09 Jun 2020 13:33:39 +0000
From: Anilkumar Kolli <akolli@codeaurora.org>
Subject: [PATCH v2 0/8] ath11k: Add IPQ6018 support
Date: Tue,  9 Jun 2020 19:02:53 +0530
Message-Id: <1591709581-18039-1-git-send-email-akolli@codeaurora.org>
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
Cc: devicetree@vger.kernel.org, linux-wireless@vger.kernel.org

IPQ6018 has a 5G radio and 2G radio with 2x2
and shares IPQ8074 configuration.

Tested on: IPQ6018 WLAN.HK.2.2-02134-QCAHKSWPL_SILICONZ-1
Tested on: IPQ8074 WLAN.HK.2.4.0.1-00009-QCAHKSWPL_SILICONZ-1 

Anilkumar Kolli (8):
  dt: bindings: net: update compatible for ath11k
  ath11k: update firmware files read path
  ath11k: rename default board file
  ath11k: add IPQ6018 support
  ath11k: define max_radios in hw_params
  ath11k: add hw_ops for pdev id to hw_mac mapping
  ath11k: add ce services for IPQ6018
  ath11k: Add bdf-addr in hw_params

 .../bindings/net/wireless/qcom,ath11k.yaml         |   4 +-
 drivers/net/wireless/ath/ath11k/Makefile           |   3 +-
 drivers/net/wireless/ath/ath11k/ahb.c              | 151 ++++++++++++++++++---
 drivers/net/wireless/ath/ath11k/core.c             |  78 +++++++----
 drivers/net/wireless/ath/ath11k/core.h             |   2 +-
 drivers/net/wireless/ath/ath11k/dp_rx.c            |   2 +-
 drivers/net/wireless/ath/ath11k/htc.c              |   2 +-
 drivers/net/wireless/ath/ath11k/hw.c               |  34 +++++
 drivers/net/wireless/ath/ath11k/hw.h               |  31 ++++-
 drivers/net/wireless/ath/ath11k/mac.c              |   2 +-
 drivers/net/wireless/ath/ath11k/qmi.c              |   6 +-
 drivers/net/wireless/ath/ath11k/qmi.h              |   1 -
 drivers/net/wireless/ath/ath11k/reg.c              |   2 +-
 drivers/net/wireless/ath/ath11k/wmi.c              |   4 +-
 14 files changed, 266 insertions(+), 56 deletions(-)
 create mode 100644 drivers/net/wireless/ath/ath11k/hw.c

V2:
 - Added devicetree reviewers 
-- 
2.7.4


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
