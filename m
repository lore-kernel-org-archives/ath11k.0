Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from m43-7.mailgun.net ([69.72.43.7])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k6Ts4-0008VS-8Q
 for ath11k@lists.infradead.org; Fri, 14 Aug 2020 07:11:30 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: [PATCH 08/11] ath11k: fix memory OOB access in qmi_decode
Date: Fri, 14 Aug 2020 10:10:27 +0300
Message-Id: <1597389030-13887-9-git-send-email-kvalo@codeaurora.org>
In-Reply-To: <1597389030-13887-1-git-send-email-kvalo@codeaurora.org>
References: <1597389030-13887-1-git-send-email-kvalo@codeaurora.org>
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

The decoded_size is wrongly assigned in ath11k_qmi_msg_handlers and it results
in out of boundary access in qmi_decode. The correct decoded_size should be
calculated from the related ind_msg structure.

This issue is exposed with QCA6390 because it needs 11 small memory chunks
which are stored in qmi_wlanfw_request_mem_ind_msg_v01 and hence the
decoded_size exceeds the wrongly assigend decoded_size.

Tested-on: QCA6390 hw2.0 PCI WLAN.HST.1.0.1-01740-QCAHSTSWPLZ_V2_TO_X86-1
Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.1.0.1-01238-QCAHKSWPL_SILICONZ-2

Signed-off-by: Carl Huang <cjhuang@codeaurora.org>
Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/qmi.c | 8 ++++----
 drivers/net/wireless/ath/ath11k/qmi.h | 8 ++++++++
 2 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/qmi.c b/drivers/net/wireless/ath/ath11k/qmi.c
index b386ab4bd806..529886b1f068 100644
--- a/drivers/net/wireless/ath/ath11k/qmi.c
+++ b/drivers/net/wireless/ath/ath11k/qmi.c
@@ -2477,21 +2477,21 @@ static const struct qmi_msg_handler ath11k_qmi_msg_handlers[] = {
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
@@ -2499,7 +2499,7 @@ static const struct qmi_msg_handler ath11k_qmi_msg_handlers[] = {
 		.msg_id = QMI_WLFW_COLD_BOOT_CAL_DONE_IND_V01,
 		.ei = qmi_wlanfw_cold_boot_cal_done_ind_msg_v01_ei,
 		.decoded_size =
-			sizeof(qmi_wlanfw_cold_boot_cal_done_ind_msg_v01_ei),
+			sizeof(struct qmi_wlanfw_fw_cold_cal_done_ind_msg_v01),
 		.fn = ath11k_qmi_msg_cold_boot_cal_done_cb,
 	},
 };
diff --git a/drivers/net/wireless/ath/ath11k/qmi.h b/drivers/net/wireless/ath/ath11k/qmi.h
index d55ce6cf7222..60e904683165 100644
--- a/drivers/net/wireless/ath/ath11k/qmi.h
+++ b/drivers/net/wireless/ath/ath11k/qmi.h
@@ -267,6 +267,14 @@ struct qmi_wlanfw_fw_mem_ready_ind_msg_v01 {
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


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
