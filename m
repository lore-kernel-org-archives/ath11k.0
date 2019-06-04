Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hY7k7-0002e2-2w
 for ath11k@lists.infradead.org; Tue, 04 Jun 2019 11:36:40 +0000
From: Maharaja Kennadyrajan <mkenna@codeaurora.org>
Subject: [PATCH] ath11k: Disable peer fixed rate before setting the vdev fixed
 rate
Date: Tue,  4 Jun 2019 17:08:00 +0530
Message-Id: <1559648280-16284-1-git-send-email-mkenna@codeaurora.org>
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

As per the firmware design, peer fixed rate should be disabled before
setting the VDEV fixed rate again.
When it is not disabled, then the user can't set the legacy rate(VDEV
fixed rate) after setting peer fixed rate(as peer fixed rate has higher
priority in the rate setting).

Signed-off-by: Maharaja Kennadyrajan <mkenna@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/mac.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index cb0de8e2aa60..cb1189136959 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -4573,6 +4573,23 @@ static void ath11k_mac_set_bitrate_mask_iter(void *data,
 	ieee80211_queue_work(ar->hw, &arsta->update_wk);
 }
 
+static void ath11k_mac_disable_peer_fixed_rate(void *data,
+					       struct ieee80211_sta *sta)
+{
+	struct ath11k_vif *arvif = data;
+	struct ath11k *ar = arvif->ar;
+	int ret;
+
+	ret = ath11k_wmi_set_peer_param(ar, sta->addr,
+					arvif->vdev_id,
+					WMI_PEER_PARAM_FIXED_RATE,
+					WMI_FIXED_RATE_NONE);
+	if (ret)
+		ath11k_warn(ar->ab,
+			    "failed to disable peer fixed rate for STA %pM ret %d\n",
+			    sta->addr, ret);
+}
+
 static int
 ath11k_mac_op_set_bitrate_mask(struct ieee80211_hw *hw,
 			       struct ieee80211_vif *vif,
@@ -4620,6 +4637,9 @@ ath11k_mac_op_set_bitrate_mask(struct ieee80211_hw *hw,
 				    arvif->vdev_id, ret);
 			return ret;
 		}
+		ieee80211_iterate_stations_atomic(ar->hw,
+						  ath11k_mac_disable_peer_fixed_rate,
+						  arvif);
 	} else if (ath11k_mac_bitrate_mask_get_single_nss(ar, band, mask,
 							  &single_nss)) {
 		rate = WMI_FIXED_RATE_NONE;
-- 
2.21.0


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
