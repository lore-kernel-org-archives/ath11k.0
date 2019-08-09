Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hw1Ar-0000jO-St
 for ath11k@lists.infradead.org; Fri, 09 Aug 2019 09:27:03 +0000
Received: from [127.0.1.1] (88-114-240-156.elisa-laajakaista.fi
 [88.114.240.156])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: kvalo@smtp.codeaurora.org)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id EA7BF60CED
 for <ath11k@lists.infradead.org>; Fri,  9 Aug 2019 09:26:59 +0000 (UTC)
Subject: [PATCH 07/15] ath11k: make static const in debugfs functions
From: Kalle Valo <kvalo@codeaurora.org>
Date: Fri, 09 Aug 2019 12:26:57 +0300
Message-ID: <156534281751.30736.1189769148851226685.stgit@x230>
In-Reply-To: <156534276745.30736.11736417077894270794.stgit@x230>
References: <156534276745.30736.11736417077894270794.stgit@x230>
MIME-Version: 1.0
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+kvalo=adurom.com@lists.infradead.org
To: ath11k@lists.infradead.org

This should save memory.

Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/debug.c       |    4 ++--
 drivers/net/wireless/ath/ath11k/debugfs_sta.c |    6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/debug.c b/drivers/net/wireless/ath/ath11k/debug.c
index 2e3798cd7e99..2ebdd8fd9e81 100644
--- a/drivers/net/wireless/ath/ath11k/debug.c
+++ b/drivers/net/wireless/ath/ath11k/debug.c
@@ -745,12 +745,12 @@ static ssize_t ath11k_debug_dump_soc_rx_stats(struct file *file,
 	struct ath11k_soc_dp_rx_stats *soc_stats = &ab->soc_stats;
 	int len = 0, i, retval;
 	const int size = 4096;
-	const char *rxdma_err[HAL_REO_ENTR_RING_RXDMA_ECODE_MAX] = {
+	static const char *rxdma_err[HAL_REO_ENTR_RING_RXDMA_ECODE_MAX] = {
 			"Overflow", "MPDU len", "FCS", "Decrypt", "TKIP MIC",
 			"Unencrypt", "MSDU len", "MSDU limit", "WiFi parse",
 			"AMSDU parse", "SA timeout", "DA timeout",
 			"Flow timeout", "Flush req"};
-	const char *reo_err[HAL_REO_DEST_RING_ERROR_CODE_MAX] = {
+	static const char *reo_err[HAL_REO_DEST_RING_ERROR_CODE_MAX] = {
 			"Desc addr zero", "Desc inval", "AMPDU in non BA",
 			"Non BA dup", "BA dup", "Frame 2k jump", "BAR 2k jump",
 			"Frame OOR", "BAR OOR", "No BA session",
diff --git a/drivers/net/wireless/ath/ath11k/debugfs_sta.c b/drivers/net/wireless/ath/ath11k/debugfs_sta.c
index 83d65ea96c67..2ca3bc47e502 100644
--- a/drivers/net/wireless/ath/ath11k/debugfs_sta.c
+++ b/drivers/net/wireless/ath/ath11k/debugfs_sta.c
@@ -207,9 +207,9 @@ static ssize_t ath11k_dbg_sta_dump_tx_stats(struct file *file,
 	struct ath11k_sta *arsta = (struct ath11k_sta *)sta->drv_priv;
 	struct ath11k *ar = arsta->arvif->ar;
 	struct ath11k_htt_data_stats *stats;
-	const char *str_name[ATH11K_STATS_TYPE_MAX] = {"succ", "fail",
-						       "retry", "ampdu"};
-	const char *str[ATH11K_COUNTER_TYPE_MAX] = {"bytes", "packets"};
+	static const char *str_name[ATH11K_STATS_TYPE_MAX] = {"succ", "fail",
+							      "retry", "ampdu"};
+	static const char *str[ATH11K_COUNTER_TYPE_MAX] = {"bytes", "packets"};
 	int len = 0, i, j, k, retval = 0;
 	const int size = 2 * 4096;
 	char *buf;


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
