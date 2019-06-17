Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hcuZC-0005rI-Lr
 for ath11k@lists.infradead.org; Mon, 17 Jun 2019 16:33:12 +0000
Received: from potku.adurom.net (88-114-240-156.elisa-laajakaista.fi
 [88.114.240.156])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: kvalo@smtp.codeaurora.org)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id A57C460C60
 for <ath11k@lists.infradead.org>; Mon, 17 Jun 2019 16:33:08 +0000 (UTC)
From: Kalle Valo <kvalo@codeaurora.org>
Subject: [PATCH 5/5] ath11k: warning: comparison of unsigned expression < 0 is
 always false [-Wtype-limits]
Date: Mon, 17 Jun 2019 19:32:59 +0300
Message-Id: <1560789179-3857-5-git-send-email-kvalo@codeaurora.org>
In-Reply-To: <1560789179-3857-1-git-send-email-kvalo@codeaurora.org>
References: <1560789179-3857-1-git-send-email-kvalo@codeaurora.org>
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

Fix gcc W=1 warnings:

drivers/net/wireless/ath/ath11k/dp_tx.c:654:20: warning: comparison of unsigned expression < 0 is always false [-Wtype-limits]
drivers/net/wireless/ath/ath11k/debug.c:808:13: warning: comparison of unsigned expression < 0 is always false [-Wtype-limits]

Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/debug.c | 2 +-
 drivers/net/wireless/ath/ath11k/dp_tx.c | 6 ++++--
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/debug.c b/drivers/net/wireless/ath/ath11k/debug.c
index 97ecde81559c..95bf80d38ea7 100644
--- a/drivers/net/wireless/ath/ath11k/debug.c
+++ b/drivers/net/wireless/ath/ath11k/debug.c
@@ -805,7 +805,7 @@ static ssize_t ath11k_write_extd_rx_stats(struct file *file,
 		goto exit;
 	}
 
-	if (enable < 0 || enable > 1) {
+	if (enable > 1) {
 		ret = -EINVAL;
 		goto exit;
 	}
diff --git a/drivers/net/wireless/ath/ath11k/dp_tx.c b/drivers/net/wireless/ath/ath11k/dp_tx.c
index 75d5629c3979..202dba40ba4f 100644
--- a/drivers/net/wireless/ath/ath11k/dp_tx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_tx.c
@@ -650,10 +650,12 @@ int ath11k_dp_tx_htt_srng_setup(struct ath11k_base *ab, u32 ring_id,
 	cmd->ring_base_addr_hi = (u64)params.ring_base_paddr >>
 				 HAL_ADDR_MSB_REG_SHIFT;
 
-	ring_entry_sz = ath11k_hal_srng_get_entrysize(ring_type);
-	if (ring_entry_sz < 0)
+	ret = ath11k_hal_srng_get_entrysize(ring_type);
+	if (ret < 0)
 		return -EINVAL;
 
+	ring_entry_sz = ret;
+
 	ring_entry_sz >>= 2;
 	cmd->info1 = FIELD_PREP(HTT_SRNG_SETUP_CMD_INFO1_RING_ENTRY_SIZE,
 				ring_entry_sz);
-- 
2.7.4


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
