Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hb0nI-00009V-9l
 for ath11k@lists.infradead.org; Wed, 12 Jun 2019 10:47:53 +0000
From: Maharaja Kennadyrajan <mkenna@codeaurora.org>
Subject: [PATCH] ath11k: Removed MICHAEL_MIC_LEN and use IEEE80211_CCMP_MIC_LEN
Date: Wed, 12 Jun 2019 16:19:08 +0530
Message-Id: <1560336554-14420-1-git-send-email-mkenna@codeaurora.org>
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

Removed the macro MICHAEL_MIC_LEN and use IEEE80211_CCMP_MIC_LEN
in the ath11k_dp_rx_h_undecap_raw() in dp_rx.c.

Signed-off-by: Maharaja Kennadyrajan <mkenna@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/dp_rx.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index 84e4dd147ff0..d68db3f57200 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -1453,8 +1453,6 @@ static void ath11k_dp_rx_h_undecap_nwifi(struct ath11k *ar,
 	ether_addr_copy(ieee80211_get_SA(hdr), sa);
 }
 
-#define MICHAEL_MIC_LEN 8
-
 static void ath11k_dp_rx_h_undecap_raw(struct ath11k *ar, struct sk_buff *msdu,
 				       enum hal_encrypt_type enctype,
 				       struct ieee80211_rx_status *status,
@@ -1501,7 +1499,7 @@ static void ath11k_dp_rx_h_undecap_raw(struct ath11k *ar, struct sk_buff *msdu,
 	if ((status->flag & RX_FLAG_MMIC_STRIPPED) &&
 	    !ieee80211_has_morefrags(hdr->frame_control) &&
 	    enctype == HAL_ENCRYPT_TYPE_TKIP_MIC)
-		skb_trim(msdu, msdu->len - MICHAEL_MIC_LEN);
+		skb_trim(msdu, msdu->len - IEEE80211_CCMP_MIC_LEN);
 
 	/* Head */
 	if (status->flag & RX_FLAG_IV_STRIPPED) {
-- 
2.21.0


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
