Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail29.static.mailgun.info ([104.130.122.29])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k6qAM-0005Wm-3j
 for ath11k@lists.infradead.org; Sat, 15 Aug 2020 06:59:48 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: [PATCH 07/12] ath11k: ce: get msi_addr and msi_data before srng setup
Date: Sat, 15 Aug 2020 09:59:07 +0300
Message-Id: <1597474752-23287-8-git-send-email-kvalo@codeaurora.org>
In-Reply-To: <1597474752-23287-1-git-send-email-kvalo@codeaurora.org>
References: <1597474752-23287-1-git-send-email-kvalo@codeaurora.org>
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

From: Carl Huang <cjhuang@codeaurora.org>

Move function to get msi_addr and msi_data before srng setup,
otherwise srng is setup with no MSI configuration.

Tested-on: QCA6390 hw2.0 PCI WLAN.HST.1.0.1-01740-QCAHSTSWPLZ_V2_TO_X86-1
Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.1.0.1-01238-QCAHKSWPL_SILICONZ-2

Signed-off-by: Carl Huang <cjhuang@codeaurora.org>
Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/ce.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/ce.c b/drivers/net/wireless/ath/ath11k/ce.c
index 41c1a6e56596..b2da1f937478 100644
--- a/drivers/net/wireless/ath/ath11k/ce.c
+++ b/drivers/net/wireless/ath/ath11k/ce.c
@@ -467,6 +467,9 @@ static int ath11k_ce_init_ring(struct ath11k_base *ab,
 	params.ring_base_vaddr = ce_ring->base_addr_owner_space;
 	params.num_entries = ce_ring->nentries;
 
+	if (!(CE_ATTR_DIS_INTR & ab->hw_params.host_ce_config[ce_id].flags))
+		ath11k_ce_srng_msi_ring_params_setup(ab, ce_id, &params);
+
 	switch (type) {
 	case HAL_CE_SRC:
 		if (!(CE_ATTR_DIS_INTR & ab->hw_params.host_ce_config[ce_id].flags))
@@ -500,9 +503,6 @@ static int ath11k_ce_init_ring(struct ath11k_base *ab,
 		return ret;
 	}
 
-	if (!(CE_ATTR_DIS_INTR & ab->hw_params.host_ce_config[ce_id].flags))
-		ath11k_ce_srng_msi_ring_params_setup(ab, ce_id, &params);
-
 	ce_ring->hal_ring_id = ret;
 
 	return 0;
-- 
2.7.4


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
