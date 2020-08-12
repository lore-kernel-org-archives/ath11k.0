Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from nbd.name ([2a01:4f8:221:3d45::2])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k5sFS-0007tj-Lc
 for ath11k@lists.infradead.org; Wed, 12 Aug 2020 15:01:05 +0000
From: John Crispin <john@phrozen.org>
Subject: [PATCH V3 7/9] ath11k: add multiple bssid support to device creation
Date: Wed, 12 Aug 2020 17:00:48 +0200
Message-Id: <20200812150050.2683396-8-john@phrozen.org>
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

We need to pass info such as parent device, bssid count/index and
(non-)transmit mode information to the FW when we create a new vdev.

Signed-off-by: John Crispin <john@phrozen.org>
---
 drivers/net/wireless/ath/ath11k/mac.c | 22 ++++++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 2e4f1966da21..08e7f4ac8a26 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -4269,17 +4269,30 @@ static void ath11k_mac_op_stop(struct ieee80211_hw *hw)
 	atomic_set(&ar->num_pending_mgmt_tx, 0);
 }
 
-static void
+static int
 ath11k_mac_setup_vdev_create_params(struct ath11k_vif *arvif,
 				    struct vdev_create_params *params)
 {
 	struct ath11k *ar = arvif->ar;
+	struct ieee80211_vif *parent;
 	struct ath11k_pdev *pdev = ar->pdev;
 
 	params->if_id = arvif->vdev_id;
 	params->type = arvif->vdev_type;
 	params->subtype = arvif->vdev_subtype;
 	params->pdev_id = pdev->pdev_id;
+	params->vdevid_trans = 0;
+	if (arvif->vif->multiple_bssid.non_transmitted) {
+		params->flags = WMI_HOST_VDEV_FLAGS_NON_TRANSMIT_AP;
+		parent = arvif->vif->multiple_bssid.parent;
+		if (!parent)
+			return -ENOENT;
+		if (ar->hw->wiphy != ieee80211_vif_to_wdev(parent)->wiphy)
+			return -EINVAL;
+		params->vdevid_trans = ath11k_vif_to_arvif(parent)->vdev_id;
+	} else {
+		params->flags = WMI_HOST_VDEV_FLAGS_TRANSMIT_AP;
+	}
 
 	if (pdev->cap.supported_bands & WMI_HOST_WLAN_2G_CAP) {
 		params->chains[NL80211_BAND_2GHZ].tx = ar->num_tx_chains;
@@ -4294,6 +4307,7 @@ ath11k_mac_setup_vdev_create_params(struct ath11k_vif *arvif,
 		params->chains[NL80211_BAND_6GHZ].tx = ar->num_tx_chains;
 		params->chains[NL80211_BAND_6GHZ].rx = ar->num_rx_chains;
 	}
+	return 0;
 }
 
 static u32
@@ -4443,7 +4457,11 @@ static int ath11k_mac_op_add_interface(struct ieee80211_hw *hw,
 	for (i = 0; i < ARRAY_SIZE(vif->hw_queue); i++)
 		vif->hw_queue[i] = i % (ATH11K_HW_MAX_QUEUES - 1);
 
-	ath11k_mac_setup_vdev_create_params(arvif, &vdev_param);
+	ret = ath11k_mac_setup_vdev_create_params(arvif, &vdev_param);
+	if (ret) {
+		ath11k_warn(ab, "failed to prepare vdev %d\n", ret);
+		goto err;
+	}
 
 	ret = ath11k_wmi_vdev_create(ar, vif->addr, &vdev_param);
 	if (ret) {
-- 
2.25.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
