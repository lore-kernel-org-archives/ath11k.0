Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iPiKw-0004Ja-TX
 for ath11k@lists.infradead.org; Wed, 30 Oct 2019 07:24:12 +0000
From: Anilkumar Kolli <akolli@codeaurora.org>
Subject: [PATCH] ath11k: pktlog: fix sending/using the pdev id
Date: Wed, 30 Oct 2019 12:53:45 +0530
Message-Id: <1572420225-28801-1-git-send-email-akolli@codeaurora.org>
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

Fixes sending the pdev id(0,1,2 for mac0, mac1, mac2)
to FW in wmi cmd pktlog enable/disable.

Signed-off-by: Anilkumar Kolli <akolli@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/dp_rx.c | 8 +++++---
 drivers/net/wireless/ath/ath11k/wmi.c   | 6 +++---
 2 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index 9491a479fab5..ae4bfa5fe3b8 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -1287,7 +1287,6 @@ static void ath11k_htt_pktlog(struct ath11k_base *ab, struct sk_buff *skb)
 	u8 pdev_id;
 
 	len = FIELD_GET(HTT_T2H_PPDU_STATS_INFO_PAYLOAD_SIZE, data->hdr);
-
 	if (len > ATH11K_HTT_PKTLOG_MAX_SIZE) {
 		ath11k_warn(ab, "htt pktlog buffer size %d, expected < %d\n",
 			    len,
@@ -1296,8 +1295,11 @@ static void ath11k_htt_pktlog(struct ath11k_base *ab, struct sk_buff *skb)
 	}
 
 	pdev_id = FIELD_GET(HTT_T2H_PPDU_STATS_INFO_PDEV_ID, data->hdr);
-	pdev_id = DP_HW2SW_MACID(pdev_id);
-	ar = ab->pdevs[pdev_id].ar;
+	ar = ath11k_mac_get_ar_by_pdev_id(ab, pdev_id);
+	if (!ar) {
+		ath11k_warn(ab, "invalid pdev id %d on htt pktlog\n", pdev_id);
+		return;
+	}
 
 	trace_ath11k_htt_pktlog(ar, data->payload, len);
 }
diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index 3d1d4d3c3f20..80074f6bc6ba 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -2313,7 +2313,7 @@ int ath11k_wmi_pdev_peer_pktlog_filter(struct ath11k *ar, u8 *addr, u8 enable)
 	cmd->tlv_header = FIELD_PREP(WMI_TLV_TAG, WMI_TAG_PDEV_PEER_PKTLOG_FILTER_CMD) |
 			  FIELD_PREP(WMI_TLV_LEN, sizeof(*cmd) - TLV_HDR_SIZE);
 
-	cmd->pdev_id = ar->pdev->pdev_id;
+	cmd->pdev_id = DP_HW2SW_MACID(ar->pdev->pdev_id);
 	cmd->num_mac = 1;
 	cmd->enable = enable;
 
@@ -2411,7 +2411,7 @@ int ath11k_wmi_pdev_pktlog_enable(struct ath11k *ar, u32 pktlog_filter)
 	cmd->tlv_header = FIELD_PREP(WMI_TLV_TAG, WMI_TAG_PDEV_PKTLOG_ENABLE_CMD) |
 			  FIELD_PREP(WMI_TLV_LEN, sizeof(*cmd) - TLV_HDR_SIZE);
 
-	cmd->pdev_id = ar->pdev->pdev_id;
+	cmd->pdev_id = DP_HW2SW_MACID(ar->pdev->pdev_id);
 	cmd->evlist = pktlog_filter;
 	cmd->enable = ATH11K_WMI_PKTLOG_ENABLE_FORCE;
 
@@ -2441,7 +2441,7 @@ int ath11k_wmi_pdev_pktlog_disable(struct ath11k *ar)
 	cmd->tlv_header = FIELD_PREP(WMI_TLV_TAG, WMI_TAG_PDEV_PKTLOG_DISABLE_CMD) |
 			  FIELD_PREP(WMI_TLV_LEN, sizeof(*cmd) - TLV_HDR_SIZE);
 
-	cmd->pdev_id = ar->pdev->pdev_id;
+	cmd->pdev_id = DP_HW2SW_MACID(ar->pdev->pdev_id);
 
 	ret = ath11k_wmi_cmd_send(wmi, skb,
 				  WMI_PDEV_PKTLOG_DISABLE_CMDID);
-- 
1.9.1


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
