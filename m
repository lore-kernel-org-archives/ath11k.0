Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from dvalin.narfation.org ([2a00:17d8:100::8b1])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hx6OO-0006qK-Rs
 for ath11k@lists.infradead.org; Mon, 12 Aug 2019 09:13:30 +0000
From: Sven Eckelmann <sven@narfation.org>
Subject: [PATCH] ath11k: fix multicast rate parameter size
Date: Mon, 12 Aug 2019 11:13:04 +0200
Message-Id: <20190812091304.27184-1-sven@narfation.org>
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
Cc: Sven Eckelmann <seckelmann@datto.com>

From: Sven Eckelmann <seckelmann@datto.com>

The ATH11K_HW_RATE_CODE() macro uses at least 28 bit to encode the
parameters. An u8 cannot store all these bits.

Fixes: c885aaf227ec ("ath11k: support for multicast rate control")
Signed-off-by: Sven Eckelmann <seckelmann@datto.com>
---
 drivers/net/wireless/ath/ath11k/mac.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 6a3b1a110738..5a65caa019ed 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -1586,7 +1586,7 @@ static void ath11k_mac_op_bss_info_changed(struct ieee80211_hw *hw,
 	u16 bitrate;
 	int ret = 0;
 	u8 rateidx;
-	u8 rate;
+	u32 rate;
 
 	mutex_lock(&ar->conf_mutex);
 
-- 
2.20.1


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
