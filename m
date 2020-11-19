Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from dvalin.narfation.org ([213.160.73.56])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kfm5K-00038y-CI
 for ath11k@lists.infradead.org; Thu, 19 Nov 2020 15:43:01 +0000
From: Sven Eckelmann <sven@narfation.org>
Subject: [PATCH v2 3/3] ath11k: Build check size of ath11k_skb_cb
Date: Thu, 19 Nov 2020 16:42:34 +0100
Message-Id: <20201119154235.263250-3-sven@narfation.org>
In-Reply-To: <20201119154235.263250-1-sven@narfation.org>
References: <20201119154235.263250-1-sven@narfation.org>
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
Cc: linux-wireless@vger.kernel.org, Sven Eckelmann <sven@narfation.org>

It is rather easy to add more entries to ath11k_skb_cb while forgetting the
size limit of ieee80211_tx_info->driver_data. So just check this during the
build to reduce the change of accidental buffer overflow in the skbuff->cb.

Signed-off-by: Sven Eckelmann <sven@narfation.org>
---
v2:
- new patch

 drivers/net/wireless/ath/ath11k/core.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/core.h b/drivers/net/wireless/ath/ath11k/core.h
index 5a7915f75e1e..b5ca4455b2e0 100644
--- a/drivers/net/wireless/ath/ath11k/core.h
+++ b/drivers/net/wireless/ath/ath11k/core.h
@@ -909,6 +909,8 @@ static inline const char *ath11k_scan_state_str(enum ath11k_scan_state state)
 
 static inline struct ath11k_skb_cb *ATH11K_SKB_CB(struct sk_buff *skb)
 {
+	BUILD_BUG_ON(sizeof(struct ath11k_skb_cb) >
+		     IEEE80211_TX_INFO_DRIVER_DATA_SIZE);
 	return (struct ath11k_skb_cb *)&IEEE80211_SKB_CB(skb)->driver_data;
 }
 
-- 
2.29.2


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
