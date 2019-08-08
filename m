Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hvi7D-0001ci-Ta
 for ath11k@lists.infradead.org; Thu, 08 Aug 2019 13:06:01 +0000
From: Karthikeyan Periyasamy <periyasa@codeaurora.org>
Subject: [PATCH] ath11k: Remove mac_registered variable
Date: Thu,  8 Aug 2019 18:35:11 +0530
Message-Id: <1565269511-27056-1-git-send-email-periyasa@codeaurora.org>
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
Cc: Karthikeyan Periyasamy <periyasa@codeaurora.org>

mac_registered is used as a check to avoid the mac register functionality
in recovery flow. It can be achieved by check the dev flags. so removed
the mac_registered variable.

Signed-off-by: Karthikeyan Periyasamy <periyasa@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/core.h |  1 -
 drivers/net/wireless/ath/ath11k/mac.c  | 14 +-------------
 drivers/net/wireless/ath/ath11k/wmi.c  |  2 +-
 3 files changed, 2 insertions(+), 15 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/core.h b/drivers/net/wireless/ath/ath11k/core.h
index 79134c4..a0d6832 100644
--- a/drivers/net/wireless/ath/ath11k/core.h
+++ b/drivers/net/wireless/ath/ath11k/core.h
@@ -594,7 +594,6 @@ struct ath11k_base {
 	struct ath11k_ce ce;
 	struct timer_list rx_replenish_retry;
 	struct ath11k_hal hal;
-	bool mac_registered;
 	/* To synchronize core_start/core_stop */
 	struct mutex core_lock;
 	/* Protects data like peers */
diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 8ffdf59..5ecb74a 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -360,9 +360,6 @@ struct ath11k_vif *ath11k_mac_get_arvif_by_vdev_id(struct ath11k_base *ab,
 	struct ath11k_pdev *pdev;
 	struct ath11k_vif *arvif;
 
-	if (!ab->mac_registered)
-		return NULL;
-
 	for (i = 0; i < ab->num_radios; i++) {
 		pdev = rcu_dereference(ab->pdevs_active[i]);
 		if (pdev && pdev->ar) {
@@ -381,9 +378,6 @@ struct ath11k *ath11k_mac_get_ar_by_vdev_id(struct ath11k_base *ab, u32 vdev_id)
 	struct ath11k_pdev *pdev;
 	struct ath11k_vif *arvif;
 
-	if (!ab->mac_registered)
-		return NULL;
-
 	for (i = 0; i < ab->num_radios; i++) {
 		pdev = rcu_dereference(ab->pdevs_active[i]);
 		if (pdev && pdev->ar) {
@@ -401,9 +395,6 @@ struct ath11k *ath11k_mac_get_ar_by_pdev_id(struct ath11k_base *ab, u32 pdev_id)
 	int i;
 	struct ath11k_pdev *pdev;
 
-	if (!ab->mac_registered)
-		return NULL;
-
 	if (WARN_ON(pdev_id > ab->num_radios))
 		return NULL;
 
@@ -5373,7 +5364,6 @@ void ath11k_mac_unregister(struct ath11k_base *ab)
 
 		SET_IEEE80211_DEV(ar->hw, NULL);
 	}
-	ab->mac_registered = false;
 }
 
 int ath11k_mac_create(struct ath11k_base *ab)
@@ -5384,7 +5374,7 @@ int ath11k_mac_create(struct ath11k_base *ab)
 	int ret;
 	int i;
 
-	if (ab->mac_registered)
+	if (test_bit(ATH11K_FLAG_REGISTERED, &ab->dev_flags))
 		return 0;
 
 	for (i = 0; i < ab->num_radios; i++) {
@@ -5455,8 +5445,6 @@ int ath11k_mac_create(struct ath11k_base *ab)
 	ab->cc_freq_hz = IPQ8074_CC_FREQ_HERTZ;
 	ab->free_vdev_map = (1LL << (ab->num_radios * TARGET_NUM_VDEVS)) - 1;
 
-	ab->mac_registered = true;
-
 	return 0;
 
 err_destroy_mac:
diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index e7a74e0..a9e2d3c 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -4398,7 +4398,7 @@ static int ath11k_reg_chan_list_event(struct ath11k_base *ab, struct sk_buff *sk
 	}
 
 	spin_lock(&ab->base_lock);
-	if (ab->mac_registered) {
+	if (test_bit(ATH11K_FLAG_REGISTERED, &ab->dev_flags)) {
 		/* Once mac is registered, ar is valid and all CC events from
 		 * fw is considered to be received due to user requests
 		 * currently.
-- 
1.9.1


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
