Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from alexa-out-blr-01.qualcomm.com ([103.229.18.197])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hONph-0007dh-RX
 for ath11k@lists.infradead.org; Wed, 08 May 2019 14:46:11 +0000
From: Venkateswara Naralasetty <vnaralas@codeaurora.org>
Subject: [PATCH] ath11k: reject tx fragmentation configuration
Date: Wed,  8 May 2019 20:16:04 +0530
Message-Id: <1557326764-29931-1-git-send-email-vnaralas@codeaurora.org>
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
Cc: Venkateswara Naralasetty <vnaralas@codeaurora.org>

Currently no known firmware actually implements frag threshold support.
Moreover it is not possible to rely frame fragmentation to mac80211
because firmware clears the "more fragments" bit in frame control making
it impossible for remote devices to reassemble frames.

Hence implement a dummy callback just to say fragmentation isn't
supported. This effectively prevents mac80211 from doing frame
fragmentation in software.

This fixes Tx becoming broken after setting fragmentation threshold.

Signed-off-by: Venkateswara Naralasetty <vnaralas@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/mac.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index dc2733c..aa805a4 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -4300,10 +4300,17 @@ static int ath11k_set_rts_threshold(struct ieee80211_hw *hw, u32 value)
 
 static int ath11k_set_frag_threshold(struct ieee80211_hw *hw, u32 value)
 {
-	struct ath11k *ar = hw->priv;
-	int param_id = WMI_VDEV_PARAM_FRAGMENTATION_THRESHOLD;
-
-	return ath11k_set_vdev_param_to_all_vifs(ar, param_id, value);
+	/* Even though there's a WMI vdev param for fragmentation threshold no
+	 * known firmware actually implements it. Moreover it is not possible to
+	 * rely frame fragmentation to mac80211 because firmware clears the
+	 * "more fragments" bit in frame control making it impossible for remote
+	 * devices to reassemble frames.
+	 *
+	 * Hence implement a dummy callback just to say fragmentation isn't
+	 * supported. This effectively prevents mac80211 from doing frame
+	 * fragmentation in software.
+	 */
+	return -EOPNOTSUPP;
 }
 
 static void ath11k_flush(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
-- 
2.7.4


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
