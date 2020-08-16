Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from m43-7.mailgun.net ([69.72.43.7])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k7BGi-00075F-Gk
 for ath11k@lists.infradead.org; Sun, 16 Aug 2020 05:31:51 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: [PATCH 2/9] ath11k: don't initialize rxdma1 related ring
Date: Sun, 16 Aug 2020 08:31:24 +0300
Message-Id: <1597555891-26112-3-git-send-email-kvalo@codeaurora.org>
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

For QCA6390, it has 2 lmacs and thus 2 rxdmas. However, each rxdma has rxdma0
only, and doesn't have rxdma1. So for QCA6390, don't initialize rxdma1 related
rings such as rx_mon_buf_ring, rx_mon_dst_ring and rx_mon_desc_ring.

Tested-on: QCA6390 hw2.0 PCI WLAN.HST.1.0.1-01740-QCAHSTSWPLZ_V2_TO_X86-1
Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.1.0.1-01238-QCAHKSWPL_SILICONZ-2

Signed-off-by: Carl Huang <cjhuang@codeaurora.org>
Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/core.c  |  2 ++
 drivers/net/wireless/ath/ath11k/dp_rx.c | 34 +++++++++++++++++++++++++++++++--
 drivers/net/wireless/ath/ath11k/hw.h    |  2 ++
 3 files changed, 36 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
index 45d16f7ad461..8e9bf0e64a68 100644
--- a/drivers/net/wireless/ath/ath11k/core.c
+++ b/drivers/net/wireless/ath/ath11k/core.c
@@ -37,6 +37,7 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.ce_count = 12,
 		.single_pdev_only = false,
 		.needs_band_to_mac = true,
+		.rxdma1_enable = true,
 	},
 	{
 		.name = "qca6390 hw2.0",
@@ -56,6 +57,7 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.ce_count = 9,
 		.single_pdev_only = true,
 		.needs_band_to_mac = false,
+		.rxdma1_enable = false,
 	},
 };
 
diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index 6009c26ce525..64aa0077a45d 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -375,6 +375,12 @@ static int ath11k_dp_rxdma_buf_ring_free(struct ath11k *ar,
 	idr_destroy(&rx_ring->bufs_idr);
 	spin_unlock_bh(&rx_ring->idr_lock);
 
+	/* if rxdma1_enable is false, mon_status_refill_ring
+	 * isn't setup, so don't clean.
+	 */
+	if (!ar->ab->hw_params.rxdma1_enable)
+		return 0;
+
 	rx_ring = &dp->rx_mon_status_refill_ring;
 
 	spin_lock_bh(&rx_ring->idr_lock);
@@ -390,6 +396,7 @@ static int ath11k_dp_rxdma_buf_ring_free(struct ath11k *ar,
 
 	idr_destroy(&rx_ring->bufs_idr);
 	spin_unlock_bh(&rx_ring->idr_lock);
+
 	return 0;
 }
 
@@ -431,8 +438,10 @@ static int ath11k_dp_rxdma_pdev_buf_setup(struct ath11k *ar)
 
 	ath11k_dp_rxdma_ring_buf_setup(ar, rx_ring, HAL_RXDMA_BUF);
 
-	rx_ring = &dp->rxdma_mon_buf_ring;
-	ath11k_dp_rxdma_ring_buf_setup(ar, rx_ring, HAL_RXDMA_MONITOR_BUF);
+	if (ar->ab->hw_params.rxdma1_enable) {
+		rx_ring = &dp->rxdma_mon_buf_ring;
+		ath11k_dp_rxdma_ring_buf_setup(ar, rx_ring, HAL_RXDMA_MONITOR_BUF);
+	}
 
 	rx_ring = &dp->rx_mon_status_refill_ring;
 	ath11k_dp_rxdma_ring_buf_setup(ar, rx_ring, HAL_RXDMA_MONITOR_STATUS);
@@ -516,6 +525,14 @@ static int ath11k_dp_rx_pdev_srng_alloc(struct ath11k *ar)
 			    "failed to setup rx_mon_status_refill_ring\n");
 		return ret;
 	}
+
+	/* if rxdma1_enable is false, then it doesn't need
+	 * to setup rxdam_mon_buf_ring, rxdma_mon_dst_ring
+	 * and rxdma_mon_desc_ring.
+	 */
+	if (!ar->ab->hw_params.rxdma1_enable)
+		return 0;
+
 	ret = ath11k_dp_srng_setup(ar->ab,
 				   &dp->rxdma_mon_buf_ring.refill_buf_ring,
 				   HAL_RXDMA_MONITOR_BUF, 0, dp->mac_id,
@@ -4129,6 +4146,9 @@ int ath11k_dp_rx_pdev_alloc(struct ath11k_base *ab, int mac_id)
 		return ret;
 	}
 
+	if (!ab->hw_params.rxdma1_enable)
+		goto config_refill_ring;
+
 	ring_id = dp->rxdma_mon_buf_ring.refill_buf_ring.ring_id;
 	ret = ath11k_dp_tx_htt_srng_setup(ab, ring_id,
 					  mac_id, HAL_RXDMA_MONITOR_BUF);
@@ -4153,6 +4173,8 @@ int ath11k_dp_rx_pdev_alloc(struct ath11k_base *ab, int mac_id)
 			    ret);
 		return ret;
 	}
+
+config_refill_ring:
 	ring_id = dp->rx_mon_status_refill_ring.refill_buf_ring.ring_id;
 	ret = ath11k_dp_tx_htt_srng_setup(ab, ring_id, mac_id,
 					  HAL_RXDMA_MONITOR_STATUS);
@@ -4162,6 +4184,7 @@ int ath11k_dp_rx_pdev_alloc(struct ath11k_base *ab, int mac_id)
 			    ret);
 		return ret;
 	}
+
 	return 0;
 }
 
@@ -4834,6 +4857,12 @@ int ath11k_dp_rx_pdev_mon_attach(struct ath11k *ar)
 		return ret;
 	}
 
+	/* if rxdma1_enable is false, no need to setup
+	 * rxdma_mon_desc_ring.
+	 */
+	if (!ar->ab->hw_params.rxdma1_enable)
+		return 0;
+
 	dp_srng = &dp->rxdma_mon_desc_ring;
 	n_link_desc = dp_srng->size /
 		ath11k_hal_srng_get_entrysize(ar->ab, HAL_RXDMA_MONITOR_DESC);
@@ -4850,6 +4879,7 @@ int ath11k_dp_rx_pdev_mon_attach(struct ath11k *ar)
 	pmon->mon_last_linkdesc_paddr = 0;
 	pmon->mon_last_buf_cookie = DP_RX_DESC_COOKIE_MAX + 1;
 	spin_lock_init(&pmon->mon_lock);
+
 	return 0;
 }
 
diff --git a/drivers/net/wireless/ath/ath11k/hw.h b/drivers/net/wireless/ath/ath11k/hw.h
index 1c9176273883..2e88194da329 100644
--- a/drivers/net/wireless/ath/ath11k/hw.h
+++ b/drivers/net/wireless/ath/ath11k/hw.h
@@ -151,6 +151,8 @@ struct ath11k_hw_params {
 	 * firmware creates the mapping.
 	 */
 	bool needs_band_to_mac;
+
+	bool rxdma1_enable;
 };
 
 extern const struct ath11k_hw_ops ipq8074_ops;
-- 
2.7.4


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
