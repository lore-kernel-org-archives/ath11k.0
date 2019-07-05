Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from dvalin.narfation.org ([213.160.73.56])
 by casper.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hjLWT-0003Ge-LD
 for ath11k@lists.infradead.org; Fri, 05 Jul 2019 10:32:59 +0000
From: Sven Eckelmann <sven@narfation.org>
Subject: [PATCH 3/3] ath11k: apply mgmt rate for beacons
Date: Fri,  5 Jul 2019 12:31:08 +0200
Message-Id: <20190705103109.3731-4-sven@narfation.org>
In-Reply-To: <20190705103109.3731-1-sven@narfation.org>
References: <20190705103109.3731-1-sven@narfation.org>
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
To: ath11k@lists.infradead.org
Cc: Sven Eckelmann <seckelmann@datto.com>

From: Sven Eckelmann <seckelmann@datto.com>

ath11k is using the lowest basic rate to send management frames. But the
firmware is still sending the beacons at 1 Mbit/s for 2.4GHz and 6 Mbit/s
on 5GHz. But it could be that these rates are not part of the basic rates.
And thus the AP should not try to submit using these rates when clients
don't need to support these rates (and thus might not be able to receive
these rates).

Signed-off-by: Sven Eckelmann <seckelmann@datto.com>
---
 drivers/net/wireless/ath/ath11k/mac.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index cda5b39f1a9b..37e225e0205d 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -1668,6 +1668,12 @@ static void ath11k_recalculate_mgmt_rate(struct ath11k *ar,
 					    hw_rate_code);
 	if (ret)
 		ath11k_warn(ar->ab, "failed to set mgmt tx rate %d\n", ret);
+
+	vdev_param = WMI_VDEV_PARAM_BEACON_RATE;
+	ret = ath11k_wmi_vdev_set_param_cmd(ar, arvif->vdev_id, vdev_param,
+					    hw_rate_code);
+	if (ret)
+		ath11k_warn(ar->ab, "failed to set beacon tx rate %d\n", ret);
 }
 
 static void ath11k_mac_op_bss_info_changed(struct ieee80211_hw *hw,
-- 
2.20.1


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
