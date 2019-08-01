Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1ht1Q0-0002Gj-M0
 for ath11k@lists.infradead.org; Thu, 01 Aug 2019 03:06:17 +0000
From: Ganesh Sesetti <gseset@codeaurora.org>
Subject: [PATCH v2] ath11k: Fix htt stats sounding info and pdev cca stats
Date: Thu,  1 Aug 2019 08:36:09 +0530
Message-Id: <1564628769-23490-1-git-send-email-gseset@codeaurora.org>
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
Cc: Ganesh Sesetti <gseset@codeaurora.org>

The Previous configuartion of htt stats sounding info and pdev cca stats
are invalid due to that getting time out error.

Changing htt stats sounding info value from 0xFF to 0x00 and htt pdev cca
stats from 0x10 to 0x00

Signed-off-by: Ganesh Sesetti <gseset@codeaurora.org>
---

v2:
	Added the reson for htt stats sounding info and pdev cca stats 
	
 drivers/net/wireless/ath/ath11k/dp.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/dp.h b/drivers/net/wireless/ath/ath11k/dp.h
index bda5ac27f20d..0bd3a5c06471 100644
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
1.9.1


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
