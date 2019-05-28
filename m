Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hVk1o-0003vz-Sj
 for ath11k@lists.infradead.org; Tue, 28 May 2019 21:53:06 +0000
From: Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>
Subject: [PATCH 4/4] ath11k: fix action frame rx processing
Date: Tue, 28 May 2019 14:52:56 -0700
Message-Id: <1559080376-26817-5-git-send-email-pradeepc@codeaurora.org>
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

Firmware/HW delivers broadcast/multicast management frames as encrypted
and it should be decrypted by mac80211. Setting RX_FLAG_DECRYPTED status
for these frames is breaking mesh connection establishment. For unicast
protected action frames, HW decrypts the packet, however, IV and MIC are
not stripped in HW and same must be done by mac80211. so fix that.

Signed-off-by: Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/wmi.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index 9ca44c4b24f8..07a6fd4d2f8c 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -4905,16 +4905,19 @@ static void ath11k_mgmt_rx_event(struct ath11k_base *ab, struct sk_buff *skb)
 	status->flag |= RX_FLAG_SKIP_MONITOR;
 
 	/* In case of PMF, FW delivers decrypted frames with Protected Bit set.
-	 * Don't clear that. FW also delivers broadcast management frames
+	 * Don't clear that. Also, FW delivers broadcast management frames
 	 * (ex: group privacy action frames in mesh) as encrypted payload.
 	 */
-	if (!ieee80211_is_robust_mgmt_frame(skb))  {
+	if (ieee80211_has_protected(hdr->frame_control) &&
+	    !is_multicast_ether_addr(ieee80211_get_DA(hdr))) {
 		status->flag |= RX_FLAG_DECRYPTED;
 
-		status->flag |= RX_FLAG_IV_STRIPPED |
-			RX_FLAG_MMIC_STRIPPED;
-		hdr->frame_control = __cpu_to_le16(fc &
-				~IEEE80211_FCTL_PROTECTED);
+		if (!ieee80211_is_robust_mgmt_frame(skb)) {
+			status->flag |= RX_FLAG_IV_STRIPPED |
+					RX_FLAG_MMIC_STRIPPED;
+			hdr->frame_control = __cpu_to_le16(fc &
+					     ~IEEE80211_FCTL_PROTECTED);
+		}
 	}
 
 	/* TODO: Pending handle beacon implementation
-- 
2.1.2


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
