Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from m43-7.mailgun.net ([69.72.43.7])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k6qAM-0005Wo-1X
 for ath11k@lists.infradead.org; Sat, 15 Aug 2020 06:59:54 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: [PATCH 12/12] ath11k: dp: redefine peer_map and peer_unmap
Date: Sat, 15 Aug 2020 09:59:12 +0300
Message-Id: <1597474752-23287-13-git-send-email-kvalo@codeaurora.org>
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

For QCA6390, it uses peer_map and peer_unmap V1. IPQ8074 uses V2.
Redefine previous definition to peer_map2 and peer_unmap2.

Tested-on: QCA6390 hw2.0 PCI WLAN.HST.1.0.1-01740-QCAHSTSWPLZ_V2_TO_X86-1
Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.1.0.1-01238-QCAHKSWPL_SILICONZ-2

Signed-off-by: Carl Huang <cjhuang@codeaurora.org>
Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/dp.h    | 6 ++++--
 drivers/net/wireless/ath/ath11k/dp_rx.c | 2 ++
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/dp.h b/drivers/net/wireless/ath/ath11k/dp.h
index 7587862d2e32..07876fd521f7 100644
--- a/drivers/net/wireless/ath/ath11k/dp.h
+++ b/drivers/net/wireless/ath/ath11k/dp.h
@@ -936,11 +936,13 @@ struct htt_rx_ring_tlv_filter {
 
 enum htt_t2h_msg_type {
 	HTT_T2H_MSG_TYPE_VERSION_CONF,
+	HTT_T2H_MSG_TYPE_PEER_MAP	= 0x3,
+	HTT_T2H_MSG_TYPE_PEER_UNMAP	= 0x4,
 	HTT_T2H_MSG_TYPE_RX_ADDBA	= 0x5,
 	HTT_T2H_MSG_TYPE_PKTLOG		= 0x8,
 	HTT_T2H_MSG_TYPE_SEC_IND	= 0xb,
-	HTT_T2H_MSG_TYPE_PEER_MAP	= 0x1e,
-	HTT_T2H_MSG_TYPE_PEER_UNMAP	= 0x1f,
+	HTT_T2H_MSG_TYPE_PEER_MAP2	= 0x1e,
+	HTT_T2H_MSG_TYPE_PEER_UNMAP2	= 0x1f,
 	HTT_T2H_MSG_TYPE_PPDU_STATS_IND = 0x1d,
 	HTT_T2H_MSG_TYPE_EXT_STATS_CONF = 0x1c,
 	HTT_T2H_MSG_TYPE_BKPRESSURE_EVENT_IND = 0x24,
diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index 66002de04aec..6009c26ce525 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -1569,6 +1569,7 @@ void ath11k_dp_htt_htc_t2h_msg_handler(struct ath11k_base *ab,
 		complete(&dp->htt_tgt_version_received);
 		break;
 	case HTT_T2H_MSG_TYPE_PEER_MAP:
+	case HTT_T2H_MSG_TYPE_PEER_MAP2:
 		vdev_id = FIELD_GET(HTT_T2H_PEER_MAP_INFO_VDEV_ID,
 				    resp->peer_map_ev.info);
 		peer_id = FIELD_GET(HTT_T2H_PEER_MAP_INFO_PEER_ID,
@@ -1582,6 +1583,7 @@ void ath11k_dp_htt_htc_t2h_msg_handler(struct ath11k_base *ab,
 		ath11k_peer_map_event(ab, vdev_id, peer_id, mac_addr, ast_hash);
 		break;
 	case HTT_T2H_MSG_TYPE_PEER_UNMAP:
+	case HTT_T2H_MSG_TYPE_PEER_UNMAP2:
 		peer_id = FIELD_GET(HTT_T2H_PEER_UNMAP_INFO_PEER_ID,
 				    resp->peer_unmap_ev.info);
 		ath11k_peer_unmap_event(ab, peer_id);
-- 
2.7.4


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
