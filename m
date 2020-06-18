Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jln6U-0002lf-DQ
 for ath11k@lists.infradead.org; Thu, 18 Jun 2020 05:28:47 +0000
From: Anilkumar Kolli <akolli@codeaurora.org>
Subject: [PATCH v3 0/3] ath11k: Add IPQ6018 support
Date: Thu, 18 Jun 2020 10:58:21 +0530
Message-Id: <1592458104-2961-1-git-send-email-akolli@codeaurora.org>
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

Anilkumar Kolli (3):
  dt: bindings: net: update compatible for ath11k
  ath11k: copy ce service configs to hw_params
  ath11k: add IPQ6018 support

V2:
 - Added devicetree reviewers 
V3:
 - addressed dt bindinds comments
 - Reworked on Kalles patches
 - copied ce svc configs to hw_params

 .../bindings/net/wireless/qcom,ath11k.yaml         |   6 +-
 drivers/net/wireless/ath/ath11k/ahb.c              | 131 ++++++++++++++++++++-
 drivers/net/wireless/ath/ath11k/core.c             |  20 ++--
 drivers/net/wireless/ath/ath11k/core.h             |   2 +
 drivers/net/wireless/ath/ath11k/hw.h               |   2 +
 5 files changed, 148 insertions(+), 13 deletions(-)

-- 
2.7.4


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
