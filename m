Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from a27-11.smtp-out.us-west-2.amazonses.com ([54.240.27.11])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iZYeK-0003Mm-6n
 for ath11k@lists.infradead.org; Tue, 26 Nov 2019 11:04:53 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: [PATCH 04/10] ath11k: update tcl cmd descriptor parameters for STA
 mode
Date: Tue, 26 Nov 2019 11:04:49 +0000
Message-ID: <0101016ea762a321-ae03ef3c-62d6-4d7c-aad6-9245868c5ef0-000000@us-west-2.amazonses.com>
In-Reply-To: <1574766279-13105-1-git-send-email-kvalo@codeaurora.org>
References: <1574766279-13105-1-git-send-email-kvalo@codeaurora.org>
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
To: linux-wireless@vger.kernel.org
Cc: ath11k@lists.infradead.org

From: Anilkumar Kolli <akolli@codeaurora.org>

It is observed that ath11k STA mode UL throughput is low.
This is due to packets delivered to FW from TCL instead of TQM.
TCL AST search fail causes packet delivered to FW, fix this by
properly configuring the TCL address search type and ast_hash.
STA UL throughput is improved 10times with 11AC AP.

Signed-off-by: Anilkumar Kolli <akolli@codeaurora.org>
Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/dp.c       | 9 ++++-----
 drivers/net/wireless/ath/ath11k/dp_rx.c    | 2 +-
 drivers/net/wireless/ath/ath11k/hal_desc.h | 5 ++---
 drivers/net/wireless/ath/ath11k/hal_tx.c   | 6 +++---
 drivers/net/wireless/ath/ath11k/hal_tx.h   | 4 ++--
 5 files changed, 12 insertions(+), 14 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/dp.c b/drivers/net/wireless/ath/ath11k/dp.c
index aa2b28189cda..ff510e821a29 100644
--- a/drivers/net/wireless/ath/ath11k/dp.c
+++ b/drivers/net/wireless/ath/ath11k/dp.c
@@ -758,13 +758,12 @@ int ath11k_dp_htt_connect(struct ath11k_dp *dp)
 
 static void ath11k_dp_update_vdev_search(struct ath11k_vif *arvif)
 {
-	/* Enable AddrY (SA based search) for STA mode. All other modes it
-	 * is going to be AddrX (DA based search). For STA mode, set search
-	 * type based on AST value.
-	 */
+	 /* For STA mode, enable address search index,
+	  * tcl uses ast_hash value in the descriptor.
+	  */
 	switch (arvif->vdev_type) {
 	case WMI_VDEV_TYPE_STA:
-		arvif->hal_addr_search_flags = HAL_TX_ADDRY_EN;
+		arvif->hal_addr_search_flags = HAL_TX_ADDRX_EN;
 		arvif->search_type = HAL_TX_ADDR_SEARCH_INDEX;
 		break;
 	case WMI_VDEV_TYPE_AP:
diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index 7aade0314e61..396658be6f26 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -1312,7 +1312,7 @@ void ath11k_dp_htt_htc_t2h_msg_handler(struct ath11k_base *ab,
 		ath11k_dp_get_mac_addr(resp->peer_map_ev.mac_addr_l32,
 				       peer_mac_h16, mac_addr);
 		ast_hash = FIELD_GET(HTT_T2H_PEER_MAP_INFO2_AST_HASH_VAL,
-				     resp->peer_map_ev.info1);
+				     resp->peer_map_ev.info2);
 		ath11k_peer_map_event(ab, vdev_id, peer_id, mac_addr, ast_hash);
 		break;
 	case HTT_T2H_MSG_TYPE_PEER_UNMAP:
diff --git a/drivers/net/wireless/ath/ath11k/hal_desc.h b/drivers/net/wireless/ath/ath11k/hal_desc.h
index 35e191b77271..5e200380cca4 100644
--- a/drivers/net/wireless/ath/ath11k/hal_desc.h
+++ b/drivers/net/wireless/ath/ath11k/hal_desc.h
@@ -934,9 +934,8 @@ struct hal_reo_flush_cache {
 #define HAL_TCL_DATA_CMD_INFO0_ENCRYPT_TYPE	GENMASK(7, 4)
 #define HAL_TCL_DATA_CMD_INFO0_SRC_BUF_SWAP	BIT(8)
 #define HAL_TCL_DATA_CMD_INFO0_LNK_META_SWAP	BIT(9)
-#define HAL_TCL_DATA_CMD_INFO0_SEARCH_TYPE	BIT(12)
-#define HAL_TCL_DATA_CMD_INFO0_ADDRX_EN		BIT(14)
-#define HAL_TCL_DATA_CMD_INFO0_ADDRY_EN		BIT(15)
+#define HAL_TCL_DATA_CMD_INFO0_SEARCH_TYPE	GENMASK(13, 12)
+#define HAL_TCL_DATA_CMD_INFO0_ADDR_EN		GENMASK(15, 14)
 #define HAL_TCL_DATA_CMD_INFO0_CMD_NUM		GENMASK(31, 16)
 
 #define HAL_TCL_DATA_CMD_INFO1_DATA_LEN		GENMASK(15, 0)
diff --git a/drivers/net/wireless/ath/ath11k/hal_tx.c b/drivers/net/wireless/ath/ath11k/hal_tx.c
index bb27591023fe..cbe549798762 100644
--- a/drivers/net/wireless/ath/ath11k/hal_tx.c
+++ b/drivers/net/wireless/ath/ath11k/hal_tx.c
@@ -52,9 +52,9 @@ void ath11k_hal_tx_cmd_desc_setup(struct ath11k_base *ab, void *cmd,
 		FIELD_PREP(HAL_TCL_DATA_CMD_INFO0_ENCAP_TYPE, ti->encap_type) |
 		FIELD_PREP(HAL_TCL_DATA_CMD_INFO0_ENCRYPT_TYPE,
 			   ti->encrypt_type) |
-		FIELD_PREP(HAL_TCL_DATA_CMD_INFO0_ADDRX_EN,
-			   ti->addr_search_flags) |
-		FIELD_PREP(HAL_TCL_DATA_CMD_INFO0_ADDRY_EN,
+		FIELD_PREP(HAL_TCL_DATA_CMD_INFO0_SEARCH_TYPE,
+			   ti->search_type) |
+		FIELD_PREP(HAL_TCL_DATA_CMD_INFO0_ADDR_EN,
 			   ti->addr_search_flags) |
 		FIELD_PREP(HAL_TCL_DATA_CMD_INFO0_CMD_NUM,
 			   ti->meta_data_flags);
diff --git a/drivers/net/wireless/ath/ath11k/hal_tx.h b/drivers/net/wireless/ath/ath11k/hal_tx.h
index f955070bcf1e..5217eaf9da50 100644
--- a/drivers/net/wireless/ath/ath11k/hal_tx.h
+++ b/drivers/net/wireless/ath/ath11k/hal_tx.h
@@ -11,8 +11,8 @@
 #define HAL_TX_ADDRX_EN			1
 #define HAL_TX_ADDRY_EN			2
 
-#define HAL_TX_ADDR_SEARCH_INDEX	0
-#define HAL_TX_ADDR_SEARCH_DEFAULT	1
+#define HAL_TX_ADDR_SEARCH_DEFAULT	0
+#define HAL_TX_ADDR_SEARCH_INDEX	1
 
 struct hal_tx_info {
 	u16 meta_data_flags; /* %HAL_TCL_DATA_CMD_INFO0_META_ */
-- 
2.7.4


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
