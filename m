Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from z5.mailgun.us ([104.130.96.5])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kfvjg-0002vN-Q4
 for ath11k@lists.infradead.org; Fri, 20 Nov 2020 02:01:18 +0000
From: Baochen Qiang <bqiang@codeaurora.org>
Subject: [PATCH] ath11k: fix "rmmod ath11k_pci" failure after QMI sequence
 fails
Date: Fri, 20 Nov 2020 10:00:28 +0800
Message-Id: <20201120020028.12063-1-bqiang@codeaurora.org>
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
Cc: linux-wireless@vger.kernel.org

If board.bin file is missing, QMI sequence fails,
which results in failure of "rmmod ath11k_pci".
This patch fixes this issue.

Tested-on: QCA6390 hw2.0 PCI WLAN.HST.1.0.1-01230-QCAHSTSWPLZ_V2_TO_X86-1
Signed-off-by: Baochen Qiang <bqiang@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/core.h  |  3 ++-
 drivers/net/wireless/ath/ath11k/debug.c |  1 +
 drivers/net/wireless/ath/ath11k/pci.c   |  9 +++++++
 drivers/net/wireless/ath/ath11k/qmi.c   | 35 ++++++++++++++++---------
 4 files changed, 35 insertions(+), 13 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/core.h b/drivers/net/wireless/ath/ath11k/core.h
index 11448755c06d..2ddf690a9d21 100644
--- a/drivers/net/wireless/ath/ath11k/core.h
+++ b/drivers/net/wireless/ath/ath11k/core.h
@@ -188,7 +188,8 @@ enum ath11k_dev_flags {
 	ATH11K_FLAG_REGISTERED,
 	ATH11K_FLAG_FW_RESTART_FOR_HOST,
 	ATH11K_FLAG_CORE_STOPPED,
-	ATH11K_FLAG_CORE_STARTING
+	ATH11K_FLAG_CORE_STARTING,
+	ATH11K_FLAG_QMI_FAIL,
 };
 
 enum ath11k_monitor_flags {
diff --git a/drivers/net/wireless/ath/ath11k/debug.c b/drivers/net/wireless/ath/ath11k/debug.c
index 51226a4ec50f..ef8b3a88d342 100644
--- a/drivers/net/wireless/ath/ath11k/debug.c
+++ b/drivers/net/wireless/ath/ath11k/debug.c
@@ -1072,6 +1072,7 @@ void ath11k_debug_soc_destroy(struct ath11k_base *ab)
 	debugfs_remove_recursive(ab->debugfs_ath11k);
 	ab->debugfs_ath11k = NULL;
 }
+EXPORT_SYMBOL(ath11k_debug_soc_destroy);
 
 void ath11k_debug_fw_stats_init(struct ath11k *ar)
 {
diff --git a/drivers/net/wireless/ath/ath11k/pci.c b/drivers/net/wireless/ath/ath11k/pci.c
index 43a8bffc4ba0..b59741796ac2 100644
--- a/drivers/net/wireless/ath/ath11k/pci.c
+++ b/drivers/net/wireless/ath/ath11k/pci.c
@@ -1184,7 +1184,16 @@ static void ath11k_pci_remove(struct pci_dev *pdev)
 	cancel_work_sync(&ab->update_11d_work);
 	cancel_work_sync(&ab->rfkill_work);
 	cancel_work_sync(&ab->reset_work);
+
+	if (test_bit(ATH11K_FLAG_QMI_FAIL, &ab->dev_flags)) {
+		ath11k_hif_power_down(ab);
+		ath11k_debug_soc_destroy(ab);
+		ath11k_qmi_deinit_service(ab);
+		goto qmi_fail;
+	}
+
 	ath11k_core_deinit(ab);
+qmi_fail:
 	ath11k_mhi_unregister(ab_pci);
 
 	ath11k_pci_free_irq(ab);
diff --git a/drivers/net/wireless/ath/ath11k/qmi.c b/drivers/net/wireless/ath/ath11k/qmi.c
index 83a083a2d097..075fd94d92df 100644
--- a/drivers/net/wireless/ath/ath11k/qmi.c
+++ b/drivers/net/wireless/ath/ath11k/qmi.c
@@ -2501,7 +2501,7 @@ ath11k_qmi_driver_event_post(struct ath11k_qmi *qmi,
 	return 0;
 }
 
-static void ath11k_qmi_event_server_arrive(struct ath11k_qmi *qmi)
+static int ath11k_qmi_event_server_arrive(struct ath11k_qmi *qmi)
 {
 	struct ath11k_base *ab = qmi->ab;
 	int ret;
@@ -2509,17 +2509,19 @@ static void ath11k_qmi_event_server_arrive(struct ath11k_qmi *qmi)
 	ret = ath11k_qmi_fw_ind_register_send(ab);
 	if (ret < 0) {
 		ath11k_warn(ab, "qmi failed to send FW indication QMI:%d\n", ret);
-		return;
+		return ret;
 	}
 
 	ret = ath11k_qmi_host_cap_send(ab);
 	if (ret < 0) {
 		ath11k_warn(ab, "qmi failed to send host cap QMI:%d\n", ret);
-		return;
+		return ret;
 	}
+
+	return 0;
 }
 
-static void ath11k_qmi_event_mem_request(struct ath11k_qmi *qmi)
+static int ath11k_qmi_event_mem_request(struct ath11k_qmi *qmi)
 {
 	struct ath11k_base *ab = qmi->ab;
 	int ret;
@@ -2527,11 +2529,13 @@ static void ath11k_qmi_event_mem_request(struct ath11k_qmi *qmi)
 	ret = ath11k_qmi_respond_fw_mem_request(ab);
 	if (ret < 0) {
 		ath11k_warn(ab, "qmi failed to respond fw mem req:%d\n", ret);
-		return;
+		return ret;
 	}
+
+	return 0;
 }
 
-static void ath11k_qmi_event_load_bdf(struct ath11k_qmi *qmi)
+static int ath11k_qmi_event_load_bdf(struct ath11k_qmi *qmi)
 {
 	struct ath11k_base *ab = qmi->ab;
 	int ret;
@@ -2539,7 +2543,7 @@ static void ath11k_qmi_event_load_bdf(struct ath11k_qmi *qmi)
 	ret = ath11k_qmi_request_target_cap(ab);
 	if (ret < 0) {
 		ath11k_warn(ab, "qmi failed to req target capabilities:%d\n", ret);
-		return;
+		return ret;
 	}
 
 	if (ab->bus_params.fixed_bdf_addr) {
@@ -2551,14 +2555,16 @@ static void ath11k_qmi_event_load_bdf(struct ath11k_qmi *qmi)
 
 	if (ret < 0) {
 		ath11k_warn(ab, "qmi failed to load board data file:%d\n", ret);
-		return;
+		return ret;
 	}
 
 	ret = ath11k_qmi_wlanfw_m3_info_send(ab);
 	if (ret < 0) {
 		ath11k_warn(ab, "qmi failed to send m3 info req:%d\n", ret);
-		return;
+		return ret;
 	}
+
+	return 0;
 }
 
 static void ath11k_qmi_msg_mem_request_cb(struct qmi_handle *qmi_hdl,
@@ -2715,6 +2721,7 @@ static void ath11k_qmi_driver_event_work(struct work_struct *work)
 					      event_work);
 	struct ath11k_qmi_driver_event *event;
 	struct ath11k_base *ab = qmi->ab;
+	int ret = 0;
 
 	spin_lock(&qmi->event_lock);
 	while (!list_empty(&qmi->event_list)) {
@@ -2730,17 +2737,17 @@ static void ath11k_qmi_driver_event_work(struct work_struct *work)
 
 		switch (event->type) {
 		case ATH11K_QMI_EVENT_SERVER_ARRIVE:
-			ath11k_qmi_event_server_arrive(qmi);
+			ret = ath11k_qmi_event_server_arrive(qmi);
 			break;
 		case ATH11K_QMI_EVENT_SERVER_EXIT:
 			set_bit(ATH11K_FLAG_CRASH_FLUSH, &ab->dev_flags);
 			set_bit(ATH11K_FLAG_RECOVERY, &ab->dev_flags);
 			break;
 		case ATH11K_QMI_EVENT_REQUEST_MEM:
-			ath11k_qmi_event_mem_request(qmi);
+			ret = ath11k_qmi_event_mem_request(qmi);
 			break;
 		case ATH11K_QMI_EVENT_FW_MEM_READY:
-			ath11k_qmi_event_load_bdf(qmi);
+			ret = ath11k_qmi_event_load_bdf(qmi);
 			break;
 		case ATH11K_QMI_EVENT_FW_READY:
 			if (test_bit(ATH11K_FLAG_REGISTERED, &ab->dev_flags) &&
@@ -2762,6 +2769,7 @@ static void ath11k_qmi_driver_event_work(struct work_struct *work)
 			ath11k_core_qmi_firmware_ready(ab);
 			ab->qmi.cal_done = 1;
 			set_bit(ATH11K_FLAG_REGISTERED, &ab->dev_flags);
+			clear_bit(ATH11K_FLAG_QMI_FAIL, &ab->dev_flags);
 
 			break;
 		case ATH11K_QMI_EVENT_COLD_BOOT_CAL_DONE:
@@ -2771,6 +2779,8 @@ static void ath11k_qmi_driver_event_work(struct work_struct *work)
 			break;
 		}
 		kfree(event);
+		if (ret < 0)
+			set_bit(ATH11K_FLAG_QMI_FAIL, &ab->dev_flags);
 		spin_lock(&qmi->event_lock);
 	}
 	spin_unlock(&qmi->event_lock);
@@ -2831,4 +2841,5 @@ void ath11k_qmi_deinit_service(struct ath11k_base *ab)
 	destroy_workqueue(ab->qmi.event_wq);
 	ath11k_qmi_free_resource(ab);
 }
+EXPORT_SYMBOL(ath11k_qmi_deinit_service);
 
-- 
2.25.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
