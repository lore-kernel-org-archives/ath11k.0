Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hGgsv-0008MW-Pa
 for ath11k@lists.infradead.org; Wed, 17 Apr 2019 09:29:43 +0000
From: Rajkumar Manoharan <rmanohar@codeaurora.org>
Subject: [PATCH 3/3] ath11k: remove unnecessary check for PMF
Date: Wed, 17 Apr 2019 02:29:18 -0700
Message-Id: <1555493358-16381-4-git-send-email-rmanohar@codeaurora.org>
In-Reply-To: <1555493358-16381-1-git-send-email-rmanohar@codeaurora.org>
References: <1555493358-16381-1-git-send-email-rmanohar@codeaurora.org>
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
Cc: Rajkumar Manoharan <rmanohar@codeaurora.org>

Firmware delivers mesh group action frame as encrypted payload.
To allow software decryption for these group action frames, rx
status should not be marked as RX_FLAG_DECRYPTED and protected
bit in frame control should not be cleared. Existing robust
management check is enough to handle RX_FLAG_DECRYPTED. Hence
removing unnecessary protected frame validation.

Signed-off-by: Rajkumar Manoharan <rmanohar@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/wmi.c | 21 ++++++++++-----------
 1 file changed, 10 insertions(+), 11 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index cdacbaea188c..5712ac030419 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -5196,18 +5196,17 @@ void ath11k_mgmt_rx_event(struct ath11k_base *ab, struct sk_buff *skb)
 	 */
 	status->flag |= RX_FLAG_SKIP_MONITOR;
 
-	if (ieee80211_has_protected(hdr->frame_control)) {
-		/* In case of PMF, FW delivers decrypted frames
-		 * with Protected Bit set. Don't clear that.
-		 */
-		if (!ieee80211_is_robust_mgmt_frame(skb))  {
-			status->flag |= RX_FLAG_DECRYPTED;
+	/* In case of PMF, FW delivers decrypted frames with Protected Bit set.
+	 * Don't clear that. FW also delivers broadcast management frames
+	 * (ex: group privacy action frames in mesh) as encrypted payload.
+	 */
+	if (!ieee80211_is_robust_mgmt_frame(skb))  {
+		status->flag |= RX_FLAG_DECRYPTED;
 
-			status->flag |= RX_FLAG_IV_STRIPPED |
-					RX_FLAG_MMIC_STRIPPED;
-			hdr->frame_control = __cpu_to_le16(fc &
-					~IEEE80211_FCTL_PROTECTED);
-		}
+		status->flag |= RX_FLAG_IV_STRIPPED |
+			RX_FLAG_MMIC_STRIPPED;
+		hdr->frame_control = __cpu_to_le16(fc &
+				~IEEE80211_FCTL_PROTECTED);
 	}
 
 	/* TODO: Pending handle beacon implementation
-- 
1.9.1


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
