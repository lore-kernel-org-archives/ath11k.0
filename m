Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from m42-4.mailgun.net ([69.72.42.4])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNJEH-0000Rg-96
 for ath11k@lists.infradead.org; Tue, 29 Sep 2020 17:15:54 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: [PATCH 8/8] ath11k: Use GFP_ATOMIC instead of GFP_KERNEL in idr_alloc
Date: Tue, 29 Sep 2020 20:15:36 +0300
Message-Id: <1601399736-3210-9-git-send-email-kvalo@codeaurora.org>
In-Reply-To: <1601399736-3210-1-git-send-email-kvalo@codeaurora.org>
References: <1601399736-3210-1-git-send-email-kvalo@codeaurora.org>
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

From: Govind Singh <govinds@codeaurora.org>

With SLUB DEBUG CONFIG below crash is seen as kmem_cache_alloc
is being called in non-atomic context.
To fix this issue, use GFP_ATOMIC instead of GFP_KERNEL in idr_alloc.

BUG: sleeping function called from invalid context at mm/slab.h:393

[   59.805451] Call trace:
[   59.807971]  ___might_sleep+0x110/0x118
[   59.811915]  __might_sleep+0x50/0x84
[   59.815593]  kmem_cache_alloc+0x60/0x3e0
[   59.819630]  radix_tree_node_alloc+0x4c/0xe8
[   59.824014]  radix_tree_extend+0x8c/0x164
[   59.828135]  idr_get_free_cmn+0xa4/0x27c
[   59.832167]  idr_alloc_cmn+0x70/0xe8
[   59.835856]  ath11k_dp_rxbufs_replenish+0x1e8/0x310 [ath11k]
[   59.841687]  ath11k_dp_rxdma_ring_buf_setup+0x50/0x60 [ath11k]
[   59.847693]  ath11k_dp_rx_pdev_alloc+0x260/0x4d8 [ath11k]
[   59.853248]  ath11k_dp_pdev_alloc+0x40/0xc4 [ath11k]
[   59.858357]  ath11k_core_qmi_firmware_ready+0x3c4/0x490 [ath11k]
[   59.864538]  ath11k_qmi_driver_event_work+0x4c8/0x1178 [ath11k]
[   59.870620]  process_one_work+0x208/0x434

Tested-on: QCA6390 hw2.0 PCI WLAN.HST.1.0.1-01740-QCAHSTSWPLZ_V2_TO_X86-1

Signed-off-by: Govind Singh <govinds@codeaurora.org>
Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/dp.c    |  3 +--
 drivers/net/wireless/ath/ath11k/dp_rx.c | 28 +++++++++++++---------------
 drivers/net/wireless/ath/ath11k/dp_rx.h |  6 ++----
 3 files changed, 16 insertions(+), 21 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/dp.c b/drivers/net/wireless/ath/ath11k/dp.c
index 677e2d9fec11..29a614227658 100644
--- a/drivers/net/wireless/ath/ath11k/dp.c
+++ b/drivers/net/wireless/ath/ath11k/dp.c
@@ -812,8 +812,7 @@ int ath11k_dp_service_srng(struct ath11k_base *ab,
 				struct dp_rxdma_ring *rx_ring = &dp->rx_refill_buf_ring;
 
 				ath11k_dp_rxbufs_replenish(ab, id, rx_ring, 0,
-							   HAL_RX_BUF_RBM_SW3_BM,
-							   GFP_ATOMIC);
+							   HAL_RX_BUF_RBM_SW3_BM);
 			}
 		}
 	}
diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index 96828af58d28..37668a2b42cf 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -266,8 +266,7 @@ static u32 ath11k_dp_rxdesc_get_ppduid(struct hal_rx_desc *rx_desc)
 int ath11k_dp_rxbufs_replenish(struct ath11k_base *ab, int mac_id,
 			       struct dp_rxdma_ring *rx_ring,
 			       int req_entries,
-			       enum hal_rx_buf_return_buf_manager mgr,
-			       gfp_t gfp)
+			       enum hal_rx_buf_return_buf_manager mgr)
 {
 	struct hal_srng *srng;
 	u32 *desc;
@@ -314,7 +313,7 @@ int ath11k_dp_rxbufs_replenish(struct ath11k_base *ab, int mac_id,
 
 		spin_lock_bh(&rx_ring->idr_lock);
 		buf_id = idr_alloc(&rx_ring->bufs_idr, skb, 0,
-				   rx_ring->bufs_max * 3, gfp);
+				   rx_ring->bufs_max * 3, GFP_ATOMIC);
 		spin_unlock_bh(&rx_ring->idr_lock);
 		if (buf_id < 0)
 			goto fail_dma_unmap;
@@ -434,7 +433,7 @@ static int ath11k_dp_rxdma_ring_buf_setup(struct ath11k *ar,
 
 	rx_ring->bufs_max = num_entries;
 	ath11k_dp_rxbufs_replenish(ar->ab, dp->mac_id, rx_ring, num_entries,
-				   HAL_RX_BUF_RBM_SW3_BM, GFP_KERNEL);
+				   HAL_RX_BUF_RBM_SW3_BM);
 	return 0;
 }
 
@@ -2598,7 +2597,7 @@ int ath11k_dp_process_rx(struct ath11k_base *ab, int ring_id,
 		rx_ring = &ar->dp.rx_refill_buf_ring;
 
 		ath11k_dp_rxbufs_replenish(ab, i, rx_ring, num_buffs_reaped[i],
-					   HAL_RX_BUF_RBM_SW3_BM, GFP_ATOMIC);
+					   HAL_RX_BUF_RBM_SW3_BM);
 	}
 
 	ath11k_dp_rx_process_received_packets(ab, napi, &msdu_list,
@@ -2680,7 +2679,7 @@ static void ath11k_dp_rx_update_peer_stats(struct ath11k_sta *arsta,
 
 static struct sk_buff *ath11k_dp_rx_alloc_mon_status_buf(struct ath11k_base *ab,
 							 struct dp_rxdma_ring *rx_ring,
-							 int *buf_id, gfp_t gfp)
+							 int *buf_id)
 {
 	struct sk_buff *skb;
 	dma_addr_t paddr;
@@ -2705,7 +2704,7 @@ static struct sk_buff *ath11k_dp_rx_alloc_mon_status_buf(struct ath11k_base *ab,
 
 	spin_lock_bh(&rx_ring->idr_lock);
 	*buf_id = idr_alloc(&rx_ring->bufs_idr, skb, 0,
-			    rx_ring->bufs_max, gfp);
+			    rx_ring->bufs_max, GFP_ATOMIC);
 	spin_unlock_bh(&rx_ring->idr_lock);
 	if (*buf_id < 0)
 		goto fail_dma_unmap;
@@ -2725,8 +2724,7 @@ static struct sk_buff *ath11k_dp_rx_alloc_mon_status_buf(struct ath11k_base *ab,
 int ath11k_dp_rx_mon_status_bufs_replenish(struct ath11k_base *ab, int mac_id,
 					   struct dp_rxdma_ring *rx_ring,
 					   int req_entries,
-					   enum hal_rx_buf_return_buf_manager mgr,
-					   gfp_t gfp)
+					   enum hal_rx_buf_return_buf_manager mgr)
 {
 	struct hal_srng *srng;
 	u32 *desc;
@@ -2752,7 +2750,7 @@ int ath11k_dp_rx_mon_status_bufs_replenish(struct ath11k_base *ab, int mac_id,
 
 	while (num_remain > 0) {
 		skb = ath11k_dp_rx_alloc_mon_status_buf(ab, rx_ring,
-							&buf_id, gfp);
+							&buf_id);
 		if (!skb)
 			break;
 		paddr = ATH11K_SKB_RXCB(skb)->paddr;
@@ -2863,7 +2861,7 @@ static int ath11k_dp_rx_reap_mon_status_ring(struct ath11k_base *ab, int mac_id,
 		}
 move_next:
 		skb = ath11k_dp_rx_alloc_mon_status_buf(ab, rx_ring,
-							&buf_id, GFP_ATOMIC);
+							&buf_id);
 
 		if (!skb) {
 			ath11k_hal_rx_buf_addr_info_set(rx_mon_status_desc, 0, 0,
@@ -3676,7 +3674,7 @@ int ath11k_dp_process_rx_err(struct ath11k_base *ab, struct napi_struct *napi,
 		rx_ring = &ar->dp.rx_refill_buf_ring;
 
 		ath11k_dp_rxbufs_replenish(ab, i, rx_ring, n_bufs_reaped[i],
-					   HAL_RX_BUF_RBM_SW3_BM, GFP_ATOMIC);
+					   HAL_RX_BUF_RBM_SW3_BM);
 	}
 
 	return tot_n_bufs_reaped;
@@ -3972,7 +3970,7 @@ int ath11k_dp_rx_process_wbm_err(struct ath11k_base *ab,
 		rx_ring = &ar->dp.rx_refill_buf_ring;
 
 		ath11k_dp_rxbufs_replenish(ab, i, rx_ring, num_buffs_reaped[i],
-					   HAL_RX_BUF_RBM_SW3_BM, GFP_ATOMIC);
+					   HAL_RX_BUF_RBM_SW3_BM);
 	}
 
 	rcu_read_lock();
@@ -4081,7 +4079,7 @@ int ath11k_dp_process_rxdma_err(struct ath11k_base *ab, int mac_id, int budget)
 
 	if (num_buf_freed)
 		ath11k_dp_rxbufs_replenish(ab, mac_id, rx_ring, num_buf_freed,
-					   HAL_RX_BUF_RBM_SW3_BM, GFP_ATOMIC);
+					   HAL_RX_BUF_RBM_SW3_BM);
 
 	return budget - quota;
 }
@@ -4844,7 +4842,7 @@ static void ath11k_dp_rx_mon_dest_process(struct ath11k *ar, u32 quota,
 		ath11k_dp_rxbufs_replenish(ar->ab, dp->mac_id,
 					   &dp->rxdma_mon_buf_ring,
 					   rx_bufs_used,
-					   HAL_RX_BUF_RBM_SW3_BM, GFP_ATOMIC);
+					   HAL_RX_BUF_RBM_SW3_BM);
 	}
 }
 
diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.h b/drivers/net/wireless/ath/ath11k/dp_rx.h
index 88bbcae14e34..fbea45f79c9b 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.h
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.h
@@ -74,8 +74,7 @@ int ath11k_dp_process_rx(struct ath11k_base *ab, int mac_id,
 int ath11k_dp_rxbufs_replenish(struct ath11k_base *ab, int mac_id,
 			       struct dp_rxdma_ring *rx_ring,
 			       int req_entries,
-			       enum hal_rx_buf_return_buf_manager mgr,
-			       gfp_t gfp);
+			       enum hal_rx_buf_return_buf_manager mgr);
 int ath11k_dp_htt_tlv_iter(struct ath11k_base *ab, const void *ptr, size_t len,
 			   int (*iter)(struct ath11k_base *ar, u16 tag, u16 len,
 				       const void *ptr, void *data),
@@ -87,8 +86,7 @@ int ath11k_dp_rx_process_mon_status(struct ath11k_base *ab, int mac_id,
 int ath11k_dp_rx_mon_status_bufs_replenish(struct ath11k_base *ab, int mac_id,
 					   struct dp_rxdma_ring *rx_ring,
 					   int req_entries,
-					   enum hal_rx_buf_return_buf_manager mgr,
-					   gfp_t gfp);
+					   enum hal_rx_buf_return_buf_manager mgr);
 int ath11k_dp_rx_pdev_mon_detach(struct ath11k *ar);
 int ath11k_dp_rx_pdev_mon_attach(struct ath11k *ar);
 int ath11k_peer_rx_frag_setup(struct ath11k *ar, const u8 *peer_mac, int vdev_id);
-- 
2.7.4


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
