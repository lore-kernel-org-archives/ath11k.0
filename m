Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail29.static.mailgun.info ([104.130.122.29])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k7BGu-00075E-QN
 for ath11k@lists.infradead.org; Sun, 16 Aug 2020 05:32:03 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: [PATCH 6/9] ath11k: assign correct search flag and type for QCA6390
Date: Sun, 16 Aug 2020 08:31:28 +0300
Message-Id: <1597555891-26112-7-git-send-email-kvalo@codeaurora.org>
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

QCA6390 doesn't enable V2 map and ummap event, so the addr search
flags and type is different from IPQ8074. Assign correct search flags
and type for QCA6390.

Without this change, ping sometimes fails. With this change, now ping
is always successful.

Tested-on: QCA6390 hw2.0 PCI WLAN.HST.1.0.1-01740-QCAHSTSWPLZ_V2_TO_X86-1
Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.1.0.1-01238-QCAHKSWPL_SILICONZ-2

Signed-off-by: Carl Huang <cjhuang@codeaurora.org>
Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/core.c  |  2 ++
 drivers/net/wireless/ath/ath11k/dp.c    | 15 +++++++++++----
 drivers/net/wireless/ath/ath11k/dp_rx.c | 10 ++++++++++
 drivers/net/wireless/ath/ath11k/hw.h    |  1 +
 4 files changed, 24 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
index c469904057f9..a279450438bb 100644
--- a/drivers/net/wireless/ath/ath11k/core.c
+++ b/drivers/net/wireless/ath/ath11k/core.c
@@ -41,6 +41,7 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.num_rxmda_per_pdev = 1,
 		.rx_mac_buf_ring = false,
 		.vdev_start_delay = false,
+		.htt_peer_map_v2 = true,
 	},
 	{
 		.name = "qca6390 hw2.0",
@@ -64,6 +65,7 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.num_rxmda_per_pdev = 2,
 		.rx_mac_buf_ring = true,
 		.vdev_start_delay = true,
+		.htt_peer_map_v2 = false,
 	},
 };
 
diff --git a/drivers/net/wireless/ath/ath11k/dp.c b/drivers/net/wireless/ath/ath11k/dp.c
index 93f30525d7f6..fb82c4f75ced 100644
--- a/drivers/net/wireless/ath/ath11k/dp.c
+++ b/drivers/net/wireless/ath/ath11k/dp.c
@@ -909,13 +909,20 @@ int ath11k_dp_htt_connect(struct ath11k_dp *dp)
 
 static void ath11k_dp_update_vdev_search(struct ath11k_vif *arvif)
 {
-	 /* For STA mode, enable address search index,
-	  * tcl uses ast_hash value in the descriptor.
+	 /* When v2_map_support is true:for STA mode, enable address
+	  * search index, tcl uses ast_hash value in the descriptor.
+	  * When v2_map_support is false: for STA mode, dont' enable
+	  * address search index.
 	  */
 	switch (arvif->vdev_type) {
 	case WMI_VDEV_TYPE_STA:
-		arvif->hal_addr_search_flags = HAL_TX_ADDRX_EN;
-		arvif->search_type = HAL_TX_ADDR_SEARCH_INDEX;
+		if (arvif->ar->ab->hw_params.htt_peer_map_v2) {
+			arvif->hal_addr_search_flags = HAL_TX_ADDRX_EN;
+			arvif->search_type = HAL_TX_ADDR_SEARCH_INDEX;
+		} else {
+			arvif->hal_addr_search_flags = HAL_TX_ADDRY_EN;
+			arvif->search_type = HAL_TX_ADDR_SEARCH_DEFAULT;
+		}
 		break;
 	case WMI_VDEV_TYPE_AP:
 	case WMI_VDEV_TYPE_IBSS:
diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index 4d745ea63f3e..33c7c232773f 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -1625,6 +1625,16 @@ void ath11k_dp_htt_htc_t2h_msg_handler(struct ath11k_base *ab,
 		complete(&dp->htt_tgt_version_received);
 		break;
 	case HTT_T2H_MSG_TYPE_PEER_MAP:
+		vdev_id = FIELD_GET(HTT_T2H_PEER_MAP_INFO_VDEV_ID,
+				    resp->peer_map_ev.info);
+		peer_id = FIELD_GET(HTT_T2H_PEER_MAP_INFO_PEER_ID,
+				    resp->peer_map_ev.info);
+		peer_mac_h16 = FIELD_GET(HTT_T2H_PEER_MAP_INFO1_MAC_ADDR_H16,
+					 resp->peer_map_ev.info1);
+		ath11k_dp_get_mac_addr(resp->peer_map_ev.mac_addr_l32,
+				       peer_mac_h16, mac_addr);
+		ath11k_peer_map_event(ab, vdev_id, peer_id, mac_addr, 0);
+		break;
 	case HTT_T2H_MSG_TYPE_PEER_MAP2:
 		vdev_id = FIELD_GET(HTT_T2H_PEER_MAP_INFO_VDEV_ID,
 				    resp->peer_map_ev.info);
diff --git a/drivers/net/wireless/ath/ath11k/hw.h b/drivers/net/wireless/ath/ath11k/hw.h
index cac6cd3c4c57..500060b36fb4 100644
--- a/drivers/net/wireless/ath/ath11k/hw.h
+++ b/drivers/net/wireless/ath/ath11k/hw.h
@@ -150,6 +150,7 @@ struct ath11k_hw_params {
 	int num_rxmda_per_pdev;
 	bool rx_mac_buf_ring;
 	bool vdev_start_delay;
+	bool htt_peer_map_v2;
 };
 
 struct ath11k_hw_ops {
-- 
2.7.4


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
