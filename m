Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from nbd.name ([2a01:4f8:221:3d45::2])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j1UcO-0003PD-WD
 for ath11k@lists.infradead.org; Tue, 11 Feb 2020 12:26:22 +0000
From: John Crispin <john@phrozen.org>
Subject: [PATCH 2/2] ath11k: set queue_len to 4096
Date: Tue, 11 Feb 2020 13:26:05 +0100
Message-Id: <20200211122605.13002-2-john@phrozen.org>
In-Reply-To: <20200211122605.13002-1-john@phrozen.org>
References: <20200211122605.13002-1-john@phrozen.org>
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
To: Johannes Berg <johannes@sipsolutions.net>, Kalle Valo <kvalo@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org, John Crispin <john@phrozen.org>

The driver currently does not use wake_txq_queue. This leads to the
tx_queue_len being defaulted to 1000. Setting this parameter will
change the queue_len to 4096 which is more fitting for HE.

Signed-off-by: John Crispin <john@phrozen.org>
---
 drivers/net/wireless/ath/ath11k/hw.h  | 1 +
 drivers/net/wireless/ath/ath11k/mac.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/hw.h b/drivers/net/wireless/ath/ath11k/hw.h
index dd39333ec0ea..9973477ae373 100644
--- a/drivers/net/wireless/ath/ath11k/hw.h
+++ b/drivers/net/wireless/ath/ath11k/hw.h
@@ -62,6 +62,7 @@
 #define TARGET_RX_BATCHMODE		1
 
 #define ATH11K_HW_MAX_QUEUES		4
+#define ATH11K_QUEUE_LEN		4096
 
 #define ATH11k_HW_RATECODE_CCK_SHORT_PREAM_MASK  0x4
 
diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 139ecbcf0179..c0606e4a8967 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -6025,6 +6025,7 @@ static int __ath11k_mac_register(struct ath11k *ar)
 	ar->hw->wiphy->max_ap_assoc_sta = ar->max_num_stations;
 
 	ar->hw->queues = ATH11K_HW_MAX_QUEUES;
+	ar->hw->wiphy->tx_queue_len = ATH11K_QUEUE_LEN;
 	ar->hw->offchannel_tx_hw_queue = ATH11K_HW_MAX_QUEUES - 1;
 	ar->hw->max_rx_aggregation_subframes = IEEE80211_MAX_AMPDU_BUF;
 
-- 
2.20.1


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
