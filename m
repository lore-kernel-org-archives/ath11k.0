Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hVk1o-0003vj-Tw
 for ath11k@lists.infradead.org; Tue, 28 May 2019 21:53:06 +0000
From: Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>
Subject: [PATCH 2/4] ath11k: pad mic len for protected action frames
Date: Tue, 28 May 2019 14:52:54 -0700
Message-Id: <1559080376-26817-3-git-send-email-pradeepc@codeaurora.org>
In-Reply-To: <1559080376-26817-1-git-send-email-pradeepc@codeaurora.org>
References: <1559080376-26817-1-git-send-email-pradeepc@codeaurora.org>
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
Cc: Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>

padding mic space is necessary for firmware to generate mic len
correctly and to not run into any memory issues.

Signed-off-by: Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/mac.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index cb0de8e2aa60..c78c1481fe7f 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -3179,6 +3179,7 @@ static int ath11k_mac_mgmt_tx_wmi(struct ath11k *ar, struct ath11k_vif *arvif,
 				  struct sk_buff *skb)
 {
 	struct ath11k_base *ab = ar->ab;
+	struct ieee80211_hdr *hdr = (struct ieee80211_hdr *)skb->data;
 	dma_addr_t paddr;
 	int buf_id;
 	int ret;
@@ -3190,6 +3191,13 @@ static int ath11k_mac_mgmt_tx_wmi(struct ath11k *ar, struct ath11k_vif *arvif,
 	if (buf_id < 0)
 		return -ENOSPC;
 
+	if ((ieee80211_is_action(hdr->frame_control) ||
+	     ieee80211_is_deauth(hdr->frame_control) ||
+	     ieee80211_is_disassoc(hdr->frame_control)) &&
+	     ieee80211_has_protected(hdr->frame_control)) {
+		skb_put(skb, IEEE80211_CCMP_MIC_LEN);
+	}
+
 	paddr = dma_map_single(ab->dev, skb->data, skb->len, DMA_TO_DEVICE);
 	if (dma_mapping_error(ab->dev, paddr)) {
 		ath11k_warn(ab, "failed to DMA map mgmt Tx buffer\n");
-- 
2.1.2


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
