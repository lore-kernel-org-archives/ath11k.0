Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail26.static.mailgun.info ([104.130.122.26])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ii90Z-0005hr-3D
 for ath11k@lists.infradead.org; Fri, 20 Dec 2019 03:31:21 +0000
Received: from cjhuang-station.qca.qualcomm.com (unknown [180.166.53.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: cjhuang)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 3B019C43383
 for <ath11k@lists.infradead.org>; Fri, 20 Dec 2019 03:31:10 +0000 (UTC)
From: Carl Huang <cjhuang@codeaurora.org>
Subject: [PATCH qca6390-bringup] ath11k: fix QCA6390 ping sometimes is not
 successful
Date: Fri, 20 Dec 2019 11:31:04 +0800
Message-Id: <1576812664-25161-1-git-send-email-cjhuang@codeaurora.org>
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

QCA6390 doesn't enable V2 map and ummap event, so the addr search
flags and type is different from IPQ8074. Assign correct search flags
and type to QCA6390.  With this change, now ping is always successful.

Signed-off-by: Carl Huang <cjhuang@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/core.c  |  2 ++
 drivers/net/wireless/ath/ath11k/dp.c    | 15 +++++++++++----
 drivers/net/wireless/ath/ath11k/dp_rx.c | 10 ++++++++++
 drivers/net/wireless/ath/ath11k/hw.h    |  1 +
 4 files changed, 24 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
index d3a8968..b182d15 100644
--- a/drivers/net/wireless/ath/ath11k/core.c
+++ b/drivers/net/wireless/ath/ath11k/core.c
@@ -32,6 +32,7 @@ static const struct ath11k_hw_params ath11k_hw_params_list[] = {
 		.disable_pktlog = false,
 		.channel_num_war = false,
 		.band_2g_fake = false,
+		.v2_map_support = true,
 	},
 	{
 		.name = "hst6390",
@@ -42,6 +43,7 @@ static const struct ath11k_hw_params ath11k_hw_params_list[] = {
 		.disable_pktlog = true,
 		.channel_num_war = true,
 		.band_2g_fake = true,
+		.v2_map_support = false,
 	}
 };
 
diff --git a/drivers/net/wireless/ath/ath11k/dp.c b/drivers/net/wireless/ath/ath11k/dp.c
index af2a92e..73d27b5 100644
--- a/drivers/net/wireless/ath/ath11k/dp.c
+++ b/drivers/net/wireless/ath/ath11k/dp.c
@@ -899,13 +899,20 @@ int ath11k_dp_htt_connect(struct ath11k_dp *dp)
 
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
+		if (arvif->ar->ab->hw_params.v2_map_support) {
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
index a36986f..c941bef 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -1352,6 +1352,16 @@ void ath11k_dp_htt_htc_t2h_msg_handler(struct ath11k_base *ab,
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
index 2e06fea..e8efa52 100644
--- a/drivers/net/wireless/ath/ath11k/hw.h
+++ b/drivers/net/wireless/ath/ath11k/hw.h
@@ -126,6 +126,7 @@ struct ath11k_hw_params {
 	bool disable_pktlog;
 	bool channel_num_war;
 	bool band_2g_fake;
+	bool v2_map_support;
 };
 
 struct ath11k_fw_ie {
-- 
2.7.4

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
