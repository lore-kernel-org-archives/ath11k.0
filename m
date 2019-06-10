Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1haGq5-0007WS-Vj
 for ath11k@lists.infradead.org; Mon, 10 Jun 2019 09:43:46 +0000
From: Karthikeyan Periyasamy <periyasa@codeaurora.org>
Subject: [PATCH] ath11k: Cleanup the access code of hw mac_id mapping
Date: Mon, 10 Jun 2019 15:13:15 +0530
Message-Id: <1560159795-5931-1-git-send-email-periyasa@codeaurora.org>
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
Cc: Karthikeyan Periyasamy <periyasa@codeaurora.org>

Added separate function call to get the hw mac id from the pdev index.

Signed-off-by: Karthikeyan Periyasamy <periyasa@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/ahb.c  |  8 ++++----
 drivers/net/wireless/ath/ath11k/core.c | 23 +++++++++++++++++++++++
 drivers/net/wireless/ath/ath11k/core.h |  4 ++--
 drivers/net/wireless/ath/ath11k/mac.c  |  2 +-
 4 files changed, 30 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/ahb.c b/drivers/net/wireless/ath/ath11k/ahb.c
index c3e487a..a2c697b 100644
--- a/drivers/net/wireless/ath/ath11k/ahb.c
+++ b/drivers/net/wireless/ath/ath11k/ahb.c
@@ -803,22 +803,22 @@ static int ath11k_ahb_ext_irq_config(struct ath11k_base *sc)
 				if (ath11k_rxdma2host_ring_mask[i] & BIT(j)) {
 					irq_grp->irqs[num_irq++] =
 						rxdma2host_destination_ring_mac1
-						- hw_mac_id_map[j];
+						- ath11k_core_get_hw_mac_id(sc, j);
 				}
 
 				if (ath11k_host2rxdma_ring_mask[i] & BIT(j)) {
 					irq_grp->irqs[num_irq++] =
 						host2rxdma_host_buf_ring_mac1
-						- hw_mac_id_map[j];
+						- ath11k_core_get_hw_mac_id(sc, j);
 				}
 
 				if (rx_mon_status_ring_mask[i] & BIT(j)) {
 					irq_grp->irqs[num_irq++] =
 						ppdu_end_interrupts_mac1 -
-						hw_mac_id_map[j];
+						ath11k_core_get_hw_mac_id(sc, j);
 					irq_grp->irqs[num_irq++] =
 						rxdma2host_monitor_status_ring_mac1 -
-						hw_mac_id_map[j];
+						ath11k_core_get_hw_mac_id(sc, j);
 				}
 			}
 		}
diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
index 928d47b..5655df3 100644
--- a/drivers/net/wireless/ath/ath11k/core.c
+++ b/drivers/net/wireless/ath/ath11k/core.c
@@ -27,6 +27,29 @@
 			},
 };
 
+/* Map from pdev index to hw mac index */
+u8 ath11k_core_get_hw_mac_id(struct ath11k_base *ab, int pdev_idx)
+{
+	u8 mac_id;
+
+	switch (pdev_idx) {
+	case 0:
+		mac_id = 0;
+		break;
+	case 1:
+		mac_id = 2;
+		break;
+	case 2:
+		mac_id = 1;
+		break;
+	default:
+		mac_id = ATH11K_INVALID_HW_MAC_ID;
+		ath11k_warn(ab, "Invalid pdev idx %d\n", pdev_idx);
+		break;
+	}
+	return mac_id;
+}
+
 static int ath11k_core_create_board_name(struct ath11k_base *sc, char *name,
 					 size_t name_len)
 {
diff --git a/drivers/net/wireless/ath/ath11k/core.h b/drivers/net/wireless/ath/ath11k/core.h
index 7ebb5a4..038f905 100644
--- a/drivers/net/wireless/ath/ath11k/core.h
+++ b/drivers/net/wireless/ath/ath11k/core.h
@@ -24,8 +24,7 @@
 
 #define ATH11K_TX_MGMT_NUM_PENDING_MAX	512
 
-/* Map from pdev index to hw mac index */
-static const u8 hw_mac_id_map[MAX_RADIOS] = { 0, 2, 1, };
+#define ATH11K_INVALID_HW_MAC_ID	0xFF
 
 enum ath11k_supported_bw {
 	ATH11K_BW_20	= 0,
@@ -828,6 +827,7 @@ struct ieee80211_regdomain *
 int ath11k_regd_update(struct ath11k *ar, bool init);
 int ath11k_reg_update_chan_list(struct ath11k *ar);
 void ath11k_core_halt(struct ath11k *ar);
+u8 ath11k_core_get_hw_mac_id(struct ath11k_base *ab, int pdev_idx);
 
 static inline const char *ath11k_scan_state_str(enum ath11k_scan_state state)
 {
diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 13da2e8..ab4670f 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -5570,7 +5570,7 @@ int ath11k_mac_create(struct ath11k_base *ab)
 		ar->ab = ab;
 		ar->pdev = pdev;
 		ar->pdev_idx = i;
-		ar->lmac_id = hw_mac_id_map[i];
+		ar->lmac_id = ath11k_core_get_hw_mac_id(ab, i);
 
 		ar->wmi = &ab->wmi_sc.wmi[i];
 		/* FIXME wmi[0] is already initialized during attach,
-- 
1.9.1


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
