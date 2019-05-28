Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hVUyL-0007BV-AN
 for ath11k@lists.infradead.org; Tue, 28 May 2019 05:48:30 +0000
Received: from vasanth-lnx.qca.qualcomm.com
 (blr-c-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.19.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: vthiagar@smtp.codeaurora.org)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 2C09360712
 for <ath11k@lists.infradead.org>; Tue, 28 May 2019 05:48:27 +0000 (UTC)
From: Vasanthakumar Thiagarajan <vthiagar@codeaurora.org>
Subject: [PATCH 4/4] ath11k: Fix sparse warning using palin integer as NULL
 pointer
Date: Tue, 28 May 2019 11:18:06 +0530
Message-Id: <1559022486-7073-4-git-send-email-vthiagar@codeaurora.org>
In-Reply-To: <1559022486-7073-1-git-send-email-vthiagar@codeaurora.org>
References: <1559022486-7073-1-git-send-email-vthiagar@codeaurora.org>
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

drivers/net/wireless/ath/ath11k/qmi.c:1806:41: warning: Using plain integer as NULL pointer
drivers/net/wireless/ath/ath11k/dp_rx.c:3433:16: warning: Using plain integer as NULL pointer
drivers/net/wireless/ath/ath11k/debug_htt_stats.c:815:59: warning: Using plain integer as NULL pointer

Signed-off-by: Vasanthakumar Thiagarajan <vthiagar@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/debug_htt_stats.c | 2 +-
 drivers/net/wireless/ath/ath11k/dp_rx.c           | 5 +----
 drivers/net/wireless/ath/ath11k/qmi.c             | 4 +++-
 3 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/debug_htt_stats.c b/drivers/net/wireless/ath/ath11k/debug_htt_stats.c
index 876134a..ac217d9 100644
--- a/drivers/net/wireless/ath/ath11k/debug_htt_stats.c
+++ b/drivers/net/wireless/ath/ath11k/debug_htt_stats.c
@@ -812,7 +812,7 @@ static inline void htt_print_tx_peer_rate_stats_tlv(const u32 *tag_buf, u8 *data
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
 	char str_buf[HTT_MAX_STRING_LEN] = {0};
-	char *tx_gi[HTT_TX_PEER_STATS_NUM_GI_COUNTERS] = {0};
+	char *tx_gi[HTT_TX_PEER_STATS_NUM_GI_COUNTERS];
 	u8 j;
 
 	for (j = 0; j < HTT_TX_PEER_STATS_NUM_GI_COUNTERS; j++)
diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index 73865ce..2987c0a 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -3411,7 +3411,7 @@ static inline void ath11k_dp_mon_get_buf_len(struct hal_rx_msdu_desc_info *info,
 	struct ath11k_pdev_dp *dp = &ar->dp;
 	struct ath11k_mon_data *pmon = (struct ath11k_mon_data *)&dp->mon_data;
 	struct dp_rxdma_ring *rx_ring = &dp->rxdma_mon_buf_ring;
-	struct sk_buff *msdu, *last;
+	struct sk_buff *msdu = NULL, *last = NULL;
 	struct hal_rx_msdu_list msdu_list;
 	void *p_buf_addr_info, *p_last_buf_addr_info;
 	void *rx_desc;
@@ -3430,9 +3430,6 @@ static inline void ath11k_dp_mon_get_buf_len(struct hal_rx_msdu_desc_info *info,
 			(struct hal_reo_entrance_ring *)ring_entry;
 	int buf_id;
 
-	msdu = 0;
-	last = NULL;
-
 	ath11k_hal_rx_reo_ent_buf_paddr_get(ring_entry, &paddr,
 					    &sw_cookie, &p_last_buf_addr_info,
 					    &msdu_cnt);
diff --git a/drivers/net/wireless/ath/ath11k/qmi.c b/drivers/net/wireless/ath/ath11k/qmi.c
index 4f3e25b..89ee81d 100644
--- a/drivers/net/wireless/ath/ath11k/qmi.c
+++ b/drivers/net/wireless/ath/ath11k/qmi.c
@@ -1803,10 +1803,12 @@ static int ath11k_qmi_request_target_cap(struct ath11k_base *ab)
 	struct device *dev = ab->dev;
 	char filename[ATH11K_QMI_MAX_BDF_FILE_NAME_SIZE];
 	const struct firmware *fw_entry;
-	struct ath11k_board_data bd = { 0 };
+	struct ath11k_board_data bd;
 	u32 fw_size;
 	int ret = 0;
 
+	memset(&bd, 0, sizeof(bd));
+
 	switch (type) {
 	case ATH11K_QMI_FILE_TYPE_BDF_GOLDEN:
 		ret = ath11k_core_fetch_bdf(ab, &bd);
-- 
1.9.1


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
