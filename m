Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hfiC0-0007y4-4m
 for ath11k@lists.infradead.org; Tue, 25 Jun 2019 09:56:49 +0000
From: Karthikeyan Periyasamy <periyasa@codeaurora.org>
Subject: [PATCH] ath11k: fix mutex definition without comment warning
Date: Tue, 25 Jun 2019 15:26:28 +0530
Message-Id: <1561456588-9460-1-git-send-email-periyasa@codeaurora.org>
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
Cc: Karthikeyan Periyasamy <periyasa@codeaurora.org>

drivers/net/wireless/ath/ath11k/core.h:446: struct mutex definition without comment
drivers/net/wireless/ath/ath11k/core.h:447: spinlock_t definition without comment
drivers/net/wireless/ath/ath11k/core.h:478: spinlock_t definition without comment

Signed-off-by: Karthikeyan Periyasamy <periyasa@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/core.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/core.h b/drivers/net/wireless/ath/ath11k/core.h
index 65c1a6d..e5b1747 100644
--- a/drivers/net/wireless/ath/ath11k/core.h
+++ b/drivers/net/wireless/ath/ath11k/core.h
@@ -443,8 +443,16 @@ struct ath11k {
 	u32 num_stations;
 	u32 max_num_stations;
 	bool monitor_present;
+	/* To synchronize concurrent synchronous mac80211 callback operations,
+	 * concurrent debugfs configuration and concurrent FW statistics events.
+	 */
 	struct mutex conf_mutex;
+	/* protects the radio specific data like debug stats, ppdu_stats_info stats,
+	 * vdev_stop_status info, scan data, ath11k_sta info, ath11k_vif info,
+	 * channel context data, survey info, test mode data.
+	 */
 	spinlock_t data_lock;
+
 	struct list_head arvifs;
 	/* should never be NULL; needed for regular htt rx */
 	struct ieee80211_channel *rx_channel;
@@ -475,6 +483,7 @@ struct ath11k {
 	u32 num_created_vdevs;
 
 	struct idr txmgmt_idr;
+	/* protects txmgmt_idr data */
 	spinlock_t txmgmt_idr_lock;
 
 	/* cycle count is reported twice for each visited channel during scan.
-- 
1.9.1


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
