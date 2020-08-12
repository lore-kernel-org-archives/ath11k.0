Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from nbd.name ([2a01:4f8:221:3d45::2])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k5sFT-0007u0-D6
 for ath11k@lists.infradead.org; Wed, 12 Aug 2020 15:01:07 +0000
From: John Crispin <john@phrozen.org>
Subject: [PATCH V3 8/9] ath11k: add EMA beacon support
Date: Wed, 12 Aug 2020 17:00:49 +0200
Message-Id: <20200812150050.2683396-9-john@phrozen.org>
In-Reply-To: <20200812150050.2683396-1-john@phrozen.org>
References: <20200812150050.2683396-1-john@phrozen.org>
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
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org, John Crispin <john@phrozen.org>

We need to update the beacon in multiple bssid mode after each completion
event to get the next EMA beacon.

Signed-off-by: John Crispin <john@phrozen.org>
---
 drivers/net/wireless/ath/ath11k/mac.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 08e7f4ac8a26..306f123c09a7 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -791,7 +791,10 @@ static int ath11k_mac_setup_bcn_tmpl(struct ath11k_vif *arvif)
 	if (arvif->vdev_type != WMI_VDEV_TYPE_AP)
 		return 0;
 
-	bcn = ieee80211_beacon_get_template(hw, vif, &offs);
+	if (arvif->vif->multiple_bssid.non_transmitted)
+		return 0;
+
+	bcn = ieee80211_beacon_get_template_ema(hw, vif, &offs);
 	if (!bcn) {
 		ath11k_warn(ab, "failed to get beacon template from mac80211\n");
 		return -EPERM;
@@ -822,16 +825,23 @@ static int ath11k_mac_setup_bcn_tmpl(struct ath11k_vif *arvif)
 void ath11k_mac_bcn_tx_event(struct ath11k_vif *arvif)
 {
 	struct ieee80211_vif *vif = arvif->vif;
+	int multiple_bssid = 0;
 
-	if (!vif->cca_active)
+	if (!vif->multiple_bssid.non_transmitted &&
+	    !list_empty(&vif->multiple_bssid.list))
+		multiple_bssid = 1;
+
+	if (!multiple_bssid && !vif->cca_active)
 		return;
 
-	if (ieee80211_beacon_cntdwn_is_complete(vif)) {
+	if (vif->cca_active && ieee80211_beacon_cntdwn_is_complete(vif)) {
 		ieee80211_cca_finish(vif);
 		return;
 	}
 
-	ieee80211_beacon_update_cntdwn(vif);
+	if (vif->cca_active)
+		ieee80211_beacon_update_cntdwn(vif);
+
 	ath11k_mac_setup_bcn_tmpl(arvif);
 }
 
-- 
2.25.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
