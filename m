Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from m43-7.mailgun.net ([69.72.43.7])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k7BRv-00008i-LX
 for ath11k@lists.infradead.org; Sun, 16 Aug 2020 05:43:25 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: [PATCH 8/9] ath11k: use TCL_DATA_RING_0 for QCA6390
Date: Sun, 16 Aug 2020 08:31:30 +0300
Message-Id: <1597555891-26112-9-git-send-email-kvalo@codeaurora.org>
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

For QCA6390, wbm2sw1 is used for other purpose rather than
tx completion ring. So use TCL_DATA_RING 0 only for QCA6390.

Add MISC_CAPS_TCL_0_ONLY to control it.

Tested-on: QCA6390 hw2.0 PCI WLAN.HST.1.0.1-01740-QCAHSTSWPLZ_V2_TO_X86-1
Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.1.0.1-01238-QCAHKSWPL_SILICONZ-2

Signed-off-by: Carl Huang <cjhuang@codeaurora.org>
Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/core.c  |  2 ++
 drivers/net/wireless/ath/ath11k/dp_tx.c | 10 ++++++++--
 drivers/net/wireless/ath/ath11k/hw.h    |  1 +
 3 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
index a279450438bb..4e397664d1b9 100644
--- a/drivers/net/wireless/ath/ath11k/core.c
+++ b/drivers/net/wireless/ath/ath11k/core.c
@@ -42,6 +42,7 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.rx_mac_buf_ring = false,
 		.vdev_start_delay = false,
 		.htt_peer_map_v2 = true,
+		.tcl_0_only = false,
 	},
 	{
 		.name = "qca6390 hw2.0",
@@ -66,6 +67,7 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.rx_mac_buf_ring = true,
 		.vdev_start_delay = true,
 		.htt_peer_map_v2 = false,
+		.tcl_0_only = true,
 	},
 };
 
diff --git a/drivers/net/wireless/ath/ath11k/dp_tx.c b/drivers/net/wireless/ath/ath11k/dp_tx.c
index 953c435ef3b3..a9632b774304 100644
--- a/drivers/net/wireless/ath/ath11k/dp_tx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_tx.c
@@ -110,7 +110,12 @@ int ath11k_dp_tx(struct ath11k *ar, struct ath11k_vif *arvif,
 
 tcl_ring_sel:
 	tcl_ring_retry = false;
-	ti.ring_id = ring_selector % DP_TCL_NUM_RING_MAX;
+	/* For some chip, it can only use tcl0 to tx */
+	if (ar->ab->hw_params.tcl_0_only)
+		ti.ring_id = 0;
+	else
+		ti.ring_id = ring_selector % DP_TCL_NUM_RING_MAX;
+
 	ring_map |= BIT(ti.ring_id);
 
 	tx_ring = &dp->tx_ring[ti.ring_id];
@@ -221,7 +226,8 @@ int ath11k_dp_tx(struct ath11k *ar, struct ath11k_vif *arvif,
 		 * checking this ring earlier for each pkt tx.
 		 * Restart ring selection if some rings are not checked yet.
 		 */
-		if (ring_map != (BIT(DP_TCL_NUM_RING_MAX) - 1)) {
+		if (ring_map != (BIT(DP_TCL_NUM_RING_MAX) - 1) &&
+		    !ar->ab->hw_params.tcl_0_only) {
 			tcl_ring_retry = true;
 			ring_selector++;
 		}
diff --git a/drivers/net/wireless/ath/ath11k/hw.h b/drivers/net/wireless/ath/ath11k/hw.h
index 500060b36fb4..d15fa7fd6d5d 100644
--- a/drivers/net/wireless/ath/ath11k/hw.h
+++ b/drivers/net/wireless/ath/ath11k/hw.h
@@ -151,6 +151,7 @@ struct ath11k_hw_params {
 	bool rx_mac_buf_ring;
 	bool vdev_start_delay;
 	bool htt_peer_map_v2;
+	bool tcl_0_only;
 };
 
 struct ath11k_hw_ops {
-- 
2.7.4


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
