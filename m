Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from szxga07-in.huawei.com ([45.249.212.35] helo=huawei.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jQVGf-0001Dg-0X
 for ath11k@lists.infradead.org; Mon, 20 Apr 2020 12:11:18 +0000
From: Jason Yan <yanaijie@huawei.com>
Subject: [PATCH] ath11k: remove conversion to bool in
 ath11k_debug_fw_stats_process()
Date: Mon, 20 Apr 2020 20:37:45 +0800
Message-ID: <20200420123745.4159-1-yanaijie@huawei.com>
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
To: kvalo@codeaurora.org, davem@davemloft.net, colin.king@canonical.com, ath11k@lists.infradead.org, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Jason Yan <yanaijie@huawei.com>

The '==' expression itself is bool, no need to convert it to bool again.
This fixes the following coccicheck warning:

drivers/net/wireless/ath/ath11k/debug.c:198:57-62: WARNING: conversion
to bool not needed here
drivers/net/wireless/ath/ath11k/debug.c:218:58-63: WARNING: conversion
to bool not needed here

Signed-off-by: Jason Yan <yanaijie@huawei.com>
---
 drivers/net/wireless/ath/ath11k/debug.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/debug.c b/drivers/net/wireless/ath/ath11k/debug.c
index 8d485171b0b3..69db298e16fb 100644
--- a/drivers/net/wireless/ath/ath11k/debug.c
+++ b/drivers/net/wireless/ath/ath11k/debug.c
@@ -195,7 +195,7 @@ void ath11k_debug_fw_stats_process(struct ath11k_base *ab, struct sk_buff *skb)
 				total_vdevs_started += ar->num_started_vdevs;
 		}
 
-		is_end = ((++num_vdev) == total_vdevs_started ? true : false);
+		is_end = ((++num_vdev) == total_vdevs_started);
 
 		list_splice_tail_init(&stats.vdevs,
 				      &ar->debug.fw_stats.vdevs);
@@ -215,7 +215,7 @@ void ath11k_debug_fw_stats_process(struct ath11k_base *ab, struct sk_buff *skb)
 		/* Mark end until we reached the count of all started VDEVs
 		 * within the PDEV
 		 */
-		is_end = ((++num_bcn) == ar->num_started_vdevs ? true : false);
+		is_end = ((++num_bcn) == ar->num_started_vdevs);
 
 		list_splice_tail_init(&stats.bcn,
 				      &ar->debug.fw_stats.bcn);
-- 
2.21.1


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
