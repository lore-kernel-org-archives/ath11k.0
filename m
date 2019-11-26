Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from a27-187.smtp-out.us-west-2.amazonses.com ([54.240.27.187])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iZYeG-0002uV-Jq
 for ath11k@lists.infradead.org; Tue, 26 Nov 2019 11:04:49 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: [PATCH 01/10] ath11k: Fix htt stats sounding info and pdev cca stats
Date: Tue, 26 Nov 2019 11:04:45 +0000
Message-ID: <0101016ea76291d2-4b8f69f8-8b9f-4272-942e-984a1b2138ce-000000@us-west-2.amazonses.com>
In-Reply-To: <1574766279-13105-1-git-send-email-kvalo@codeaurora.org>
References: <1574766279-13105-1-git-send-email-kvalo@codeaurora.org>
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
To: linux-wireless@vger.kernel.org
Cc: ath11k@lists.infradead.org

From: Ganesh Sesetti <gseset@codeaurora.org>

The Previous configuartion of htt stats sounding info and pdev cca stats
are invalid due to that getting time out error.

Changing htt stats sounding info value from 0xFF to 0x00 and htt pdev cca
stats from 0x10 to 0x00

Signed-off-by: Ganesh Sesetti <gseset@codeaurora.org>
Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/dp.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/dp.h b/drivers/net/wireless/ath/ath11k/dp.h
index 4db71173db62..eb0f3df131c5 100644
--- a/drivers/net/wireless/ath/ath11k/dp.h
+++ b/drivers/net/wireless/ath/ath11k/dp.h
@@ -1365,8 +1365,8 @@ struct htt_ext_stats_cfg_cmd {
 #define HTT_STAT_DEFAULT_CFG0_ALL_CMDQS 0xffff
 #define HTT_STAT_DEFAULT_CFG0_ALL_RINGS 0xffff
 #define HTT_STAT_DEFAULT_CFG0_ACTIVE_PEERS 0xff
-#define HTT_STAT_DEFAULT_CFG0_CCA_CUMULATIVE 0x10
-#define HTT_STAT_DEFAULT_CFG0_ACTIVE_VDEVS 0xff
+#define HTT_STAT_DEFAULT_CFG0_CCA_CUMULATIVE 0x00
+#define HTT_STAT_DEFAULT_CFG0_ACTIVE_VDEVS 0x00
 
 /* HTT_DBG_EXT_STATS_PEER_INFO
  * PARAMS:
-- 
2.7.4


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
