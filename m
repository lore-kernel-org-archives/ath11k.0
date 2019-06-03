Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hXkcA-0000wS-Q5
 for ath11k@lists.infradead.org; Mon, 03 Jun 2019 10:54:56 +0000
Received: from vasanth-lnx.qca.qualcomm.com
 (blr-c-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.19.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: vthiagar@smtp.codeaurora.org)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 9DE626043F
 for <ath11k@lists.infradead.org>; Mon,  3 Jun 2019 10:54:52 +0000 (UTC)
From: Vasanthakumar Thiagarajan <vthiagar@codeaurora.org>
Subject: [PATCH] ath11k/dp_tx: Remove endian conversion in
 HTT_H2T_MSG_TYPE_RX_RING_SELECTION_CFG
Date: Mon,  3 Jun 2019 16:24:37 +0530
Message-Id: <1559559277-21696-1-git-send-email-vthiagar@codeaurora.org>
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

With copyengine performing byte-swap when host target endian is different,
driver should not do any endian conversion over the messages going through
any of the copyengines. Remove the endian conversion while sending
HTT_H2T_MSG_TYPE_RX_RING_SELECTION_CFG, this also fixes the below sparse
warnings.

drivers/net/wireless/ath/ath11k/dp_tx.c:837:33: warning: incorrect type in assignment (different base types)
drivers/net/wireless/ath/ath11k/dp_tx.c:837:33:    expected unsigned int [usertype] pkt_type_en_flags0
drivers/net/wireless/ath/ath11k/dp_tx.c:837:33:    got restricted __le32 [usertype]
drivers/net/wireless/ath/ath11k/dp_tx.c:838:33: warning: incorrect type in assignment (different base types)
drivers/net/wireless/ath/ath11k/dp_tx.c:838:33:    expected unsigned int [usertype] pkt_type_en_flags1
drivers/net/wireless/ath/ath11k/dp_tx.c:838:33:    got restricted __le32 [usertype]
drivers/net/wireless/ath/ath11k/dp_tx.c:839:33: warning: incorrect type in assignment (different base types)
drivers/net/wireless/ath/ath11k/dp_tx.c:839:33:    expected unsigned int [usertype] pkt_type_en_flags2
drivers/net/wireless/ath/ath11k/dp_tx.c:839:33:    got restricted __le32 [usertype]
drivers/net/wireless/ath/ath11k/dp_tx.c:840:33: warning: incorrect type in assignment (different base types)
drivers/net/wireless/ath/ath11k/dp_tx.c:840:33:    expected unsigned int [usertype] pkt_type_en_flags3
drivers/net/wireless/ath/ath11k/dp_tx.c:840:33:    got restricted __le32 [usertype]
drivers/net/wireless/ath/ath11k/dp_tx.c:841:28: warning: incorrect type in assignment (different base types)
drivers/net/wireless/ath/ath11k/dp_tx.c:841:28:    expected unsigned int [usertype] rx_filter_tlv
drivers/net/wireless/ath/ath11k/dp_tx.c:841:28:    got restricted __le32 [usertype]

Signed-off-by: Vasanthakumar Thiagarajan <vthiagar@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/dp_tx.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/dp_tx.c b/drivers/net/wireless/ath/ath11k/dp_tx.c
index 2a15ca3..5670796 100644
--- a/drivers/net/wireless/ath/ath11k/dp_tx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_tx.c
@@ -834,11 +834,11 @@ int ath11k_dp_htt_rx_filter_setup(struct ath11k_base *ab, u32 ring_id,
 
 	cmd->info1 = FIELD_PREP(HTT_RX_RING_SELECTION_CFG_CMD_INFO1_BUF_SIZE,
 				rx_buf_size);
-	cmd->pkt_type_en_flags0 = __cpu_to_le32(tlv_filter->pkt_filter_flags0);
-	cmd->pkt_type_en_flags1 = __cpu_to_le32(tlv_filter->pkt_filter_flags1);
-	cmd->pkt_type_en_flags2 = __cpu_to_le32(tlv_filter->pkt_filter_flags2);
-	cmd->pkt_type_en_flags3 = __cpu_to_le32(tlv_filter->pkt_filter_flags3);
-	cmd->rx_filter_tlv = __cpu_to_le32(tlv_filter->rx_filter);
+	cmd->pkt_type_en_flags0 = tlv_filter->pkt_filter_flags0;
+	cmd->pkt_type_en_flags1 = tlv_filter->pkt_filter_flags1;
+	cmd->pkt_type_en_flags2 = tlv_filter->pkt_filter_flags2;
+	cmd->pkt_type_en_flags3 = tlv_filter->pkt_filter_flags3;
+	cmd->rx_filter_tlv = tlv_filter->rx_filter;
 
 	ret = ath11k_htc_send(&ab->htc, ab->dp.eid, skb);
 	if (ret)
-- 
1.9.1


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
