Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from a27-55.smtp-out.us-west-2.amazonses.com ([54.240.27.55])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kFYTU-0007e5-G4
 for ath11k@lists.infradead.org; Tue, 08 Sep 2020 07:55:34 +0000
From: Anilkumar Kolli <akolli@codeaurora.org>
Subject: [PATCH v7 0/3] ath11k: Add IPQ6018 support
Date: Tue, 8 Sep 2020 07:55:28 +0000
Message-ID: <010101746cb66b1e-11f5f43e-dd84-43a9-acbd-471c8f1577d8-000000@us-west-2.amazonses.com>
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
Cc: devicetree@vger.kernel.org, Anilkumar Kolli <akolli@codeaurora.org>, linux-wireless@vger.kernel.org

IPQ6018 has a 5G radio and 2G radio with 2x2
and shares IPQ8074 configuration.

Tested on: IPQ6018 WLAN.HK.2.2-02134-QCAHKSWPL_SILICONZ-1
Tested on: IPQ8074 WLAN.HK.2.4.0.1-00009-QCAHKSWPL_SILICONZ-1 

Anilkumar Kolli (3):
  dt: bindings: net: update compatible for ath11k
  ath11k: move target ce configs to hw_params
  ath11k: add IPQ6018 support

V2:
 - Added devicetree reviewers 
V3:
 - addressed dt bindinds comments
 - Reworked on Kalles patches
 - copied ce svc configs to hw_params
V4:
 - updated dt patch (Rob)
V5:
 - Fixes errors in 'make dt_binding_check' (Rob)
V6:
 - Rebased on latest ath.git top of tree
V7:
 - Removed hw_rev check as suggested in review(Kalle, Julian)

 .../bindings/net/wireless/qcom,ath11k.yaml         |   4 +-
 drivers/net/wireless/ath/ath11k/ahb.c              | 257 +----------
 drivers/net/wireless/ath/ath11k/core.c             |  37 ++
 drivers/net/wireless/ath/ath11k/core.h             |   8 +
 drivers/net/wireless/ath/ath11k/hw.c               | 512 +++++++++++++++++++++
 drivers/net/wireless/ath/ath11k/hw.h               |   5 +-
 drivers/net/wireless/ath/ath11k/pci.c              | 193 +-------
 7 files changed, 581 insertions(+), 435 deletions(-)

-- 
2.7.4


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
