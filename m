Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from m42-4.mailgun.net ([69.72.42.4])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kL9SO-0000ox-8g
 for ath11k@lists.infradead.org; Wed, 23 Sep 2020 18:25:33 +0000
From: Karthikeyan Kathirvel <kathirve@codeaurora.org>
Subject: [PATCH] ath11k: removing the ath11k debugfs dir properly
Date: Wed, 23 Sep 2020 23:55:19 +0530
Message-Id: <1600885519-29535-1-git-send-email-kathirve@codeaurora.org>
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
Cc: linux-wireless@vger.kernel.org, Karthikeyan Kathirvel <kathirve@codeaurora.org>

ath11k_debug_pdev_destroy was not called for proper cleaning of debug
files when destroying the pdev, this results in not removing the ath11k
directory in debugfs folder even after rmmod of ath11k. So when next
time doing insmod of ath11k prevents creating another ath11k directory,
hence causing ipq8074_2 to get created in parent dir of debugfs.

Signed-off-by: Karthikeyan Kathirvel <kathirve@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/debug.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/ath/ath11k/debug.c b/drivers/net/wireless/ath/ath11k/debug.c
index 0ba234a..c4759bb 100644
--- a/drivers/net/wireless/ath/ath11k/debug.c
+++ b/drivers/net/wireless/ath/ath11k/debug.c
@@ -973,6 +973,7 @@ void ath11k_debug_soc_destroy(struct ath11k_base *ab)
 {
 	debugfs_remove_recursive(ab->debugfs_soc);
 	ab->debugfs_soc = NULL;
+	ath11k_debug_pdev_destroy(ab);
 }
 
 void ath11k_debug_fw_stats_init(struct ath11k *ar)
-- 
2.7.4


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
