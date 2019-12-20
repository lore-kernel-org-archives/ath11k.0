Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail25.static.mailgun.info ([104.130.122.25])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iiDeO-0003UO-5d
 for ath11k@lists.infradead.org; Fri, 20 Dec 2019 08:28:46 +0000
Received: from cjhuang-station.qca.qualcomm.com (unknown [180.166.53.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: cjhuang)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id B1BACC447A2
 for <ath11k@lists.infradead.org>; Fri, 20 Dec 2019 08:28:37 +0000 (UTC)
From: Carl Huang <cjhuang@codeaurora.org>
Subject: [PATCH qca6390-bringup] ath11k: fix memory OOB access in qmi_decode
Date: Fri, 20 Dec 2019 16:28:31 +0800
Message-Id: <1576830511-30561-1-git-send-email-cjhuang@codeaurora.org>
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

The decoded_size is wrongly assigned in ath11k_qmi_msg_handlers and
it results in out of boundary access in qmi_decode. The correct
decoded_size should be calculated from the related ind_msg structure.

This issue is exposed with QCA6390 because QCA6390 needs 11 small memory
chunks which are stored in qmi_wlanfw_request_mem_ind_msg_v01 and hence
the decoded_size exceeds the wrongly assigend decoded_size.

Signed-off-by: Carl Huang <cjhuang@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/qmi.c | 8 ++++----
 drivers/net/wireless/ath/ath11k/qmi.h | 8 ++++++++
 2 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/qmi.c b/drivers/net/wireless/ath/ath11k/qmi.c
index 5de861e..44060b2 100644
--- a/drivers/net/wireless/ath/ath11k/qmi.c
+++ b/drivers/net/wireless/ath/ath11k/qmi.c
@@ -2497,21 +2497,21 @@ static const struct qmi_msg_handler ath11k_qmi_msg_handlers[] = {
 		.type = QMI_INDICATION,
 		.msg_id = QMI_WLFW_REQUEST_MEM_IND_V01,
 		.ei = qmi_wlanfw_request_mem_ind_msg_v01_ei,
-		.decoded_size = sizeof(qmi_wlanfw_request_mem_ind_msg_v01_ei),
+		.decoded_size = sizeof(struct qmi_wlanfw_request_mem_ind_msg_v01),
 		.fn = ath11k_qmi_msg_mem_request_cb,
 	},
 	{
 		.type = QMI_INDICATION,
 		.msg_id = QMI_WLFW_FW_MEM_READY_IND_V01,
 		.ei = qmi_wlanfw_mem_ready_ind_msg_v01_ei,
-		.decoded_size = sizeof(qmi_wlanfw_mem_ready_ind_msg_v01_ei),
+		.decoded_size = sizeof(struct qmi_wlanfw_fw_mem_ready_ind_msg_v01),
 		.fn = ath11k_qmi_msg_mem_ready_cb,
 	},
 	{
 		.type = QMI_INDICATION,
 		.msg_id = QMI_WLFW_FW_READY_IND_V01,
 		.ei = qmi_wlanfw_fw_ready_ind_msg_v01_ei,
-		.decoded_size = sizeof(qmi_wlanfw_fw_ready_ind_msg_v01_ei),
+		.decoded_size = sizeof(struct qmi_wlanfw_fw_ready_ind_msg_v01),
 		.fn = ath11k_qmi_msg_fw_ready_cb,
 	},
 	{
@@ -2519,7 +2519,7 @@ static const struct qmi_msg_handler ath11k_qmi_msg_handlers[] = {
 		.msg_id = QMI_WLFW_COLD_BOOT_CAL_DONE_IND_V01,
 		.ei = qmi_wlanfw_cold_boot_cal_done_ind_msg_v01_ei,
 		.decoded_size =
-			sizeof(qmi_wlanfw_cold_boot_cal_done_ind_msg_v01_ei),
+			sizeof(struct qmi_wlanfw_fw_cold_cal_done_ind_msg_v01),
 		.fn = ath11k_qmi_msg_cold_boot_cal_done_cb,
 	},
 };
diff --git a/drivers/net/wireless/ath/ath11k/qmi.h b/drivers/net/wireless/ath/ath11k/qmi.h
index a1c95b7..6d71895 100644
--- a/drivers/net/wireless/ath/ath11k/qmi.h
+++ b/drivers/net/wireless/ath/ath11k/qmi.h
@@ -264,6 +264,14 @@ struct qmi_wlanfw_fw_mem_ready_ind_msg_v01 {
 	char placeholder;
 };
 
+struct qmi_wlanfw_fw_ready_ind_msg_v01 {
+	char placeholder;
+};
+
+struct qmi_wlanfw_fw_cold_cal_done_ind_msg_v01 {
+	char placeholder;
+};
+
 #define QMI_WLANFW_CAP_REQ_MSG_V01_MAX_LEN	0
 #define QMI_WLANFW_CAP_RESP_MSG_V01_MAX_LEN	207
 #define QMI_WLANFW_CAP_REQ_V01			0x0024
-- 
2.7.4

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
