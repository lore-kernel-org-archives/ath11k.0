Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail29.static.mailgun.info ([104.130.122.29])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kIx3W-0005tk-GD
 for ath11k@lists.infradead.org; Thu, 17 Sep 2020 16:46:51 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: [PATCH] ath11k: remove redundant num_keep_alive_pattern assignment
Date: Thu, 17 Sep 2020 19:46:30 +0300
Message-Id: <1600361190-22047-1-git-send-email-kvalo@codeaurora.org>
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

There were two asignments to num_keep_alive_pattern, remove the first one which is wrong.

No functional changes. Compile tested only.

Reported-by: Colin Ian King <colin.king@canonical.com>
Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/hw.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/hw.c b/drivers/net/wireless/ath/ath11k/hw.c
index 5f2eb2032118..4d7d2dc691d2 100644
--- a/drivers/net/wireless/ath/ath11k/hw.c
+++ b/drivers/net/wireless/ath/ath11k/hw.c
@@ -74,7 +74,6 @@ static void ath11k_init_wmi_config_qca6390(struct ath11k_base *ab,
 	config->beacon_tx_offload_max_vdev = 0x2;
 	config->num_multicast_filter_entries = 0x20;
 	config->num_wow_filters = 0x16;
-	config->num_keep_alive_pattern = 0x1;
 	config->num_keep_alive_pattern = 0;
 }
 
-- 
2.7.4


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
