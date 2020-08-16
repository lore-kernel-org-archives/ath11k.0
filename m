Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail29.static.mailgun.info ([104.130.122.29])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k7BGl-00075W-IT
 for ath11k@lists.infradead.org; Sun, 16 Aug 2020 05:31:49 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: [PATCH 7/9] ath11k: process both lmac rings for QCA6390
Date: Sun, 16 Aug 2020 08:31:29 +0300
Message-Id: <1597555891-26112-8-git-send-email-kvalo@codeaurora.org>
In-Reply-To: <1597555891-26112-1-git-send-email-kvalo@codeaurora.org>
References: <1597555891-26112-1-git-send-email-kvalo@codeaurora.org>
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

For QCA6390, the num_radios is 1 but it needs to process 2 lmac rings.
So use NUM_RXDMA_PER_PDEV to do another loop.

Tested-on: QCA6390 hw2.0 PCI WLAN.HST.1.0.1-01740-QCAHSTSWPLZ_V2_TO_X86-1
Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.1.0.1-01238-QCAHKSWPL_SILICONZ-2

Signed-off-by: Carl Huang <cjhuang@codeaurora.org>
Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/dp.c | 59 +++++++++++++++++++++---------------
 1 file changed, 35 insertions(+), 24 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/dp.c b/drivers/net/wireless/ath/ath11k/dp.c
index fb82c4f75ced..b0ea5958833a 100644
--- a/drivers/net/wireless/ath/ath11k/dp.c
+++ b/drivers/net/wireless/ath/ath11k/dp.c
@@ -731,7 +731,7 @@ int ath11k_dp_service_srng(struct ath11k_base *ab,
 	struct napi_struct *napi = &irq_grp->napi;
 	int grp_id = irq_grp->grp_id;
 	int work_done = 0;
-	int i = 0;
+	int i = 0, j;
 	int tot_work_done = 0;
 
 	while (ab->hw_params.ring_mask->tx[grp_id] >> i) {
@@ -770,17 +770,23 @@ int ath11k_dp_service_srng(struct ath11k_base *ab,
 	}
 
 	if (ab->hw_params.ring_mask->rx_mon_status[grp_id]) {
-		for (i = 0; i <  ab->num_radios; i++) {
-			if (ab->hw_params.ring_mask->rx_mon_status[grp_id] & BIT(i)) {
-				work_done =
-				ath11k_dp_rx_process_mon_rings(ab,
-							       i, napi,
-							       budget);
-				budget -= work_done;
-				tot_work_done += work_done;
+		for (i = 0; i < ab->num_radios; i++) {
+			for (j = 0; j < ab->hw_params.num_rxmda_per_pdev; j++) {
+				int id = i * ab->hw_params.num_rxmda_per_pdev + j;
+
+				if (ab->hw_params.ring_mask->rx_mon_status[grp_id] &
+					BIT(id)) {
+					work_done =
+					ath11k_dp_rx_process_mon_rings(ab,
+								       id,
+								       napi, budget);
+					budget -= work_done;
+					tot_work_done += work_done;
+
+					if (budget <= 0)
+						goto done;
+				}
 			}
-			if (budget <= 0)
-				goto done;
 		}
 	}
 
@@ -788,22 +794,27 @@ int ath11k_dp_service_srng(struct ath11k_base *ab,
 		ath11k_dp_process_reo_status(ab);
 
 	for (i = 0; i < ab->num_radios; i++) {
-		if (ab->hw_params.ring_mask->rxdma2host[grp_id] & BIT(i)) {
-			work_done = ath11k_dp_process_rxdma_err(ab, i, budget);
-			budget -= work_done;
-			tot_work_done += work_done;
-		}
+		for (j = 0; j < ab->hw_params.num_rxmda_per_pdev; j++) {
+			int id = i * ab->hw_params.num_rxmda_per_pdev + j;
 
-		if (budget <= 0)
-			goto done;
+			if (ab->hw_params.ring_mask->rxdma2host[grp_id] & BIT(id)) {
+				work_done = ath11k_dp_process_rxdma_err(ab, id, budget);
+				budget -= work_done;
+				tot_work_done += work_done;
+			}
 
-		if (ab->hw_params.ring_mask->host2rxdma[grp_id] & BIT(i)) {
-			struct ath11k_pdev_dp *dp = &ab->pdevs[i].ar->dp;
-			struct dp_rxdma_ring *rx_ring = &dp->rx_refill_buf_ring;
+			if (budget <= 0)
+				goto done;
+
+			if (ab->hw_params.ring_mask->host2rxdma[grp_id] & BIT(id)) {
+				struct ath11k *ar = ath11k_ab_to_ar(ab, id);
+				struct ath11k_pdev_dp *dp = &ar->dp;
+				struct dp_rxdma_ring *rx_ring = &dp->rx_refill_buf_ring;
 
-			ath11k_dp_rxbufs_replenish(ab, i, rx_ring, 0,
-						   HAL_RX_BUF_RBM_SW3_BM,
-						   GFP_ATOMIC);
+				ath11k_dp_rxbufs_replenish(ab, id, rx_ring, 0,
+							   HAL_RX_BUF_RBM_SW3_BM,
+							   GFP_ATOMIC);
+			}
 		}
 	}
 	/* TODO: Implement handler for other interrupts */
-- 
2.7.4


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
