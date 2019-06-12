Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hb0nJ-00009k-EQ
 for ath11k@lists.infradead.org; Wed, 12 Jun 2019 10:47:54 +0000
From: Maharaja Kennadyrajan <mkenna@codeaurora.org>
Subject: [PATCH] ath11k: Removed unnecessary spaces before 'else if'
Date: Wed, 12 Jun 2019 16:19:09 +0530
Message-Id: <1560336554-14420-2-git-send-email-mkenna@codeaurora.org>
In-Reply-To: <1560336554-14420-1-git-send-email-mkenna@codeaurora.org>
References: <1560336554-14420-1-git-send-email-mkenna@codeaurora.org>
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
Cc: Maharaja Kennadyrajan <mkenna@codeaurora.org>

Removed unnecessary spaces before 'else if' in the
ath11k_dp_rx_mon_merg_msdus().

Signed-off-by: Maharaja Kennadyrajan <mkenna@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/dp_rx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index 84e4dd147ff0..fc6d3d9dc2e1 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -3636,7 +3636,7 @@ ath11k_dp_rx_mon_merg_msdus(struct ath11k *ar,
 		prev_buf->next = NULL;
 
 		skb_trim(prev_buf, prev_buf->len - HAL_RX_FCS_LEN);
-	}	else if (decap_format == DP_RX_DECAP_TYPE_NATIVE_WIFI) {
+	} else if (decap_format == DP_RX_DECAP_TYPE_NATIVE_WIFI) {
 		__le16 qos_field;
 		u8 qos_pkt = 0;
 
-- 
2.21.0


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
