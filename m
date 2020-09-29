Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from m42-4.mailgun.net ([69.72.42.4])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNJE9-0000Rg-Ld
 for ath11k@lists.infradead.org; Tue, 29 Sep 2020 17:15:46 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: [PATCH 2/8] ath11k: fix AP mode for QCA6390
Date: Tue, 29 Sep 2020 20:15:30 +0300
Message-Id: <1601399736-3210-3-git-send-email-kvalo@codeaurora.org>
In-Reply-To: <1601399736-3210-1-git-send-email-kvalo@codeaurora.org>
References: <1601399736-3210-1-git-send-email-kvalo@codeaurora.org>
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
Cc: linux-wireless@vger.kernel.org

From: Carl Huang <cjhuang@codeaurora.org>

For QCA6390, station vdev needs to delay startup but not for AP mode. On AP
mode vdev starts up immediately after bss peer is created in chanctx assignment
context.

This patch does not affect IPQ8074 family of devices.

Tested-on: QCA6390 hw2.0 PCI WLAN.HST.1.0.1-01740-QCAHSTSWPLZ_V2_TO_X86-1

Signed-off-by: Carl Huang <cjhuang@codeaurora.org>
Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/mac.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 86a1b984859f..32cbe643f734 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -2994,7 +2994,8 @@ static int ath11k_mac_station_add(struct ath11k *ar,
 		goto free_tx_stats;
 	}
 
-	if (ab->hw_params.vdev_start_delay) {
+	if (ab->hw_params.vdev_start_delay &&
+	    arvif->vdev_type != WMI_VDEV_TYPE_AP) {
 		ret = ath11k_start_vdev_delay(ar->hw, vif);
 		if (ret) {
 			ath11k_warn(ab, "failed to delay vdev start: %d\n", ret);
@@ -5210,7 +5211,8 @@ ath11k_mac_op_assign_vif_chanctx(struct ieee80211_hw *hw,
 		   ctx, arvif->vdev_id);
 
 	/* for QCA6390 bss peer must be created before vdev_start */
-	if (ab->hw_params.vdev_start_delay) {
+	if (ab->hw_params.vdev_start_delay &&
+	    arvif->vdev_type != WMI_VDEV_TYPE_AP) {
 		memcpy(&arvif->chanctx, ctx, sizeof(*ctx));
 		mutex_unlock(&ar->conf_mutex);
 		return 0;
-- 
2.7.4


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
