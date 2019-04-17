Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hGdLn-0002X5-Cf
 for ath11k@lists.infradead.org; Wed, 17 Apr 2019 05:43:16 +0000
From: Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>
Subject: [PATCH] ath11k: enable support for subsystem recovery.
Date: Tue, 16 Apr 2019 22:43:08 -0700
Message-Id: <1555479788-22765-1-git-send-email-pradeepc@codeaurora.org>
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

When underlying device crash for some reason, driver will
restore wireless state and perform the recovery.

Signed-off-by: Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/ahb.h  |  2 +-
 drivers/net/wireless/ath/ath11k/core.c | 10 +++++-----
 drivers/net/wireless/ath/ath11k/qmi.c  | 19 ++++++++++---------
 3 files changed, 16 insertions(+), 15 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/ahb.h b/drivers/net/wireless/ath/ath11k/ahb.h
index b0bc4e763dbc..8a6b308d4a6a 100644
--- a/drivers/net/wireless/ath/ath11k/ahb.h
+++ b/drivers/net/wireless/ath/ath11k/ahb.h
@@ -7,7 +7,7 @@
 
 #include "core.h"
 
-#define ATH11K_AHB_RECOVERY_TIMEOUT (100000 * HZ)
+#define ATH11K_AHB_RECOVERY_TIMEOUT (3 * HZ)
 struct ath11k_base;
 
 u32 ath11k_ahb_read32(struct ath11k_base *ab, u32 address);
diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
index 5d7c78b8c570..dc56df5d98f6 100644
--- a/drivers/net/wireless/ath/ath11k/core.c
+++ b/drivers/net/wireless/ath/ath11k/core.c
@@ -625,13 +625,16 @@ static int ath11k_core_reconfigure_on_crash(struct ath11k_base *sc)
 {
 	int ret;
 
+	mutex_lock(&sc->core_lock);
 	ath11k_ahb_ext_irq_disable(sc);
-
 	ath11k_dp_pdev_free(sc);
-	ath11k_dp_free(sc);
 	ath11k_ahb_stop(sc);
 	ath11k_wmi_detach(sc);
+	mutex_unlock(&sc->core_lock);
+
+	ath11k_dp_free(sc);
 	ath11k_hal_srng_deinit(sc);
+
 	sc->free_vdev_map = (1LL << (sc->num_radios * TARGET_NUM_VDEVS)) - 1;
 
 	ret = ath11k_hal_srng_init(sc);
@@ -707,13 +710,11 @@ static void ath11k_core_restart(struct work_struct *work)
 	wake_up(&sc->wmi_sc.tx_credits_wq);
 	wake_up(&sc->peer_mapping_wq);
 
-	mutex_lock(&sc->core_lock);
 	ret = ath11k_core_reconfigure_on_crash(sc);
 	if (ret) {
 		ath11k_err(sc, "failed to reconfigure driver on crash recovery\n");
 		return;
 	}
-	mutex_unlock(&sc->core_lock);
 
 	for (i = 0; i < sc->num_radios; i++) {
 		pdev = &sc->pdevs[i];
@@ -767,7 +768,6 @@ int ath11k_core_init(struct ath11k_base *sc)
 	sc->tgt_rproc = prproc;
 	sc->hw_params = ath11k_hw_params;
 
-	set_bit(ATH11K_FLAG_REGISTERED, &sc->dev_flags);
 	ret = ath11k_core_soc_create(sc);
 	if (ret) {
 		ath11k_err(sc, "failed to create soc core: %d\n", ret);
diff --git a/drivers/net/wireless/ath/ath11k/qmi.c b/drivers/net/wireless/ath/ath11k/qmi.c
index af09686fbe70..aca717ca1955 100644
--- a/drivers/net/wireless/ath/ath11k/qmi.c
+++ b/drivers/net/wireless/ath/ath11k/qmi.c
@@ -2351,6 +2351,9 @@ static void ath11k_qmi_driver_event_work(struct work_struct *work)
 		list_del(&event->list);
 		spin_unlock(&qmi->event_lock);
 
+		if (test_bit(ATH11K_FLAG_UNREGISTERING, &ab->dev_flags))
+			return;
+
 		switch (event->type) {
 		case ATH11K_QMI_EVENT_SERVER_ARRIVE:
 			ath11k_qmi_event_server_arrive(qmi);
@@ -2366,17 +2369,15 @@ static void ath11k_qmi_driver_event_work(struct work_struct *work)
 			ath11k_qmi_event_load_bdf(qmi);
 			break;
 		case ATH11K_QMI_EVENT_FW_READY:
-			if (test_bit(ATH11K_FLAG_REGISTERED, &ab->dev_flags) &&
-			    !test_bit(ATH11K_FLAG_UNREGISTERING, &ab->dev_flags) &&
-			    ab->qmi.cal_done) {
-				set_bit(ATH11K_FLAG_CRASH_FLUSH, &ab->dev_flags);
-				set_bit(ATH11K_FLAG_RECOVERY, &ab->dev_flags);
+			if (test_bit(ATH11K_FLAG_REGISTERED, &ab->dev_flags)) {
 				queue_work(ab->workqueue, &ab->restart_work);
+				break;
 			}
-			else {
-				ath11k_qmi_firmware_indication(ab);
-				ab->qmi.cal_done = 1;
-			}
+
+			ath11k_qmi_firmware_indication(ab);
+			ab->qmi.cal_done = 1;
+			set_bit(ATH11K_FLAG_REGISTERED, &ab->dev_flags);
+
 			break;
 		case ATH11K_QMI_EVENT_COLD_BOOT_CAL_DONE:
 			break;
-- 
1.9.1


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
