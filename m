Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hNeuE-0007Q2-NJ
 for ath11k@lists.infradead.org; Mon, 06 May 2019 14:47:52 +0000
From: Anilkumar Kolli <akolli@codeaurora.org>
Subject: [PATCH] ath11k: clean up in qmi source files
Date: Mon,  6 May 2019 20:17:31 +0530
Message-Id: <1557154051-8682-1-git-send-email-akolli@codeaurora.org>
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

Fix coding style, Remove unused variable.

Signed-off-by: Anilkumar Kolli <akolli@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/qmi.c | 36 +++++++++---------------
 drivers/net/wireless/ath/ath11k/qmi.h | 53 ++++++++++++++++-------------------
 2 files changed, 37 insertions(+), 52 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/qmi.c b/drivers/net/wireless/ath/ath11k/qmi.c
index aca717ca1955..7acfb0e18b49 100644
--- a/drivers/net/wireless/ath/ath11k/qmi.c
+++ b/drivers/net/wireless/ath/ath11k/qmi.c
@@ -312,7 +312,7 @@
 		.array_type	= NO_ARRAY,
 		.tlv_type	= 0x11,
 		.offset		= offsetof(struct qmi_wlanfw_ind_register_req_msg_v01,
-				  	   initiate_cal_download_enable),
+					   initiate_cal_download_enable),
 	},
 	{
 		.data_type	= QMI_OPT_FLAG,
@@ -570,7 +570,6 @@ struct qmi_elem_info qmi_wlanfw_ind_register_resp_msg_v01_ei[] = {
 	},
 };
 
-
 static struct qmi_elem_info qmi_wlanfw_mem_seg_s_v01_ei[] = {
 	{
 		.data_type	= QMI_UNSIGNED_4_BYTE,
@@ -1640,12 +1639,6 @@ static int ath11k_qmi_respond_fw_mem_request(struct ath11k_base *ab)
 		goto out;
 
 	for (i = 0; i < req.mem_seg_len ; i++) {
-		if (!ab->qmi.target_mem[i].paddr || !ab->qmi.target_mem[i].size) {
-			ath11k_warn(ab, "qmi invalid mem request for target\n");
-			ret = -EINVAL;
-			goto out;
-		}
-
 		req.mem_seg[i].addr = ab->qmi.target_mem[i].paddr;
 		req.mem_seg[i].size = ab->qmi.target_mem[i].size;
 		req.mem_seg[i].type = ab->qmi.target_mem[i].type;
@@ -1684,8 +1677,8 @@ static int ath11k_qmi_alloc_target_mem_chunk(struct ath11k_base *ab)
 	int i, idx, mode = ab->qmi.target_mem_mode;
 
 	if (of_property_read_u32_array(dev->of_node, "qcom,bdf-addr",
-				   &bdf_location[0],
-				   ARRAY_SIZE(bdf_location))) {
+				       &bdf_location[0],
+				       ARRAY_SIZE(bdf_location))) {
 		ath11k_warn(ab, "qmi no bdf_addr in device_tree\n");
 		return -EINVAL;
 	}
@@ -1704,17 +1697,16 @@ static int ath11k_qmi_alloc_target_mem_chunk(struct ath11k_base *ab)
 				ath11k_warn(ab, "qmi mem size is low to load caldata\n");
 				return -EINVAL;
 			}
-			ab->qmi.target_mem[idx].paddr =
-					bdf_location[mode] + ATH11K_QMI_CALDATA_OFFSET;
-			ab->qmi.target_mem[idx].vaddr =
-					bdf_location[mode] + ATH11K_QMI_CALDATA_OFFSET;
+			/* TODO ath11k does not support cold boot calibration */
+			ab->qmi.target_mem[idx].paddr = 0;
+			ab->qmi.target_mem[idx].vaddr = 0;
 			ab->qmi.target_mem[idx].size = ab->qmi.target_mem[i].size;
 			ab->qmi.target_mem[idx].type = ab->qmi.target_mem[i].type;
 			idx++;
 			break;
 		default:
 			ath11k_warn(ab, "qmi ignore invalid mem req type %d\n",
-			       ab->qmi.target_mem[i].type);
+				    ab->qmi.target_mem[i].type);
 			break;
 		}
 	}
@@ -1787,7 +1779,6 @@ static int ath11k_qmi_request_target_cap(struct ath11k_base *ab)
 	return ret;
 }
 
-
 static int
 ath11k_qmi_prepare_bdf_download(struct ath11k_base *ab, int type,
 				struct qmi_wlanfw_bdf_download_req_msg_v01 *req,
@@ -1814,7 +1805,7 @@ static int ath11k_qmi_request_target_cap(struct ath11k_base *ab)
 		break;
 	case ATH11K_QMI_FILE_TYPE_CALDATA:
 		snprintf(filename, sizeof(filename),
-			 "%s/%s",ab->hw_params.fw.dir, ATH11K_QMI_DEFAULT_CAL_FILE_NAME);
+			 "%s/%s", ab->hw_params.fw.dir, ATH11K_QMI_DEFAULT_CAL_FILE_NAME);
 		ret = request_firmware(&fw_entry, filename, dev);
 		if (ret) {
 			ath11k_warn(ab, "qmi failed to load CAL: %s\n", filename);
@@ -1831,7 +1822,7 @@ static int ath11k_qmi_request_target_cap(struct ath11k_base *ab)
 		release_firmware(fw_entry);
 		break;
 	default:
-		ret =-EINVAL;
+		ret = -EINVAL;
 		goto out;
 	}
 
@@ -1859,7 +1850,7 @@ static int ath11k_qmi_load_bdf(struct ath11k_base *ab)
 	if (of_property_read_u32_array(dev->of_node, "qcom,bdf-addr", &location[0],
 				       ARRAY_SIZE(location))) {
 		ath11k_err(ab, "qmi bdf_addr is not in device_tree\n");
-		ret =-EINVAL;
+		ret = -EINVAL;
 		goto out;
 	}
 
@@ -1910,7 +1901,7 @@ static int ath11k_qmi_load_bdf(struct ath11k_base *ab)
 
 		if (resp.resp.result != QMI_RESULT_SUCCESS_V01) {
 			ath11k_warn(ab, "qmi BDF download failed, result: %d, err: %d\n",
-				   resp.resp.result, resp.resp.error);
+				    resp.resp.result, resp.resp.error);
 			ret = resp.resp.result;
 			goto out_qmi_bdf;
 		}
@@ -2257,7 +2248,6 @@ static void ath11k_qmi_msg_fw_ready_cb(struct qmi_handle *qmi_hdl,
 	ath11k_qmi_driver_event_post(qmi, ATH11K_QMI_EVENT_FW_READY, NULL);
 }
 
-
 static void ath11k_qmi_msg_cold_boot_cal_done_cb(struct qmi_handle *qmi,
 						 struct sockaddr_qrtr *sq,
 						 struct qmi_txn *txn,
@@ -2426,8 +2416,8 @@ int ath11k_qmi_init_service(struct ath11k_base *ab)
 	INIT_WORK(&ab->qmi.event_work, ath11k_qmi_driver_event_work);
 
 	ret = qmi_add_lookup(&ab->qmi.handle, ATH11K_QMI_WLFW_SERVICE_ID_V01,
-			ATH11K_QMI_WLFW_SERVICE_VERS_V01,
-			ATH11K_QMI_WLFW_SERVICE_INS_ID_V01);
+			     ATH11K_QMI_WLFW_SERVICE_VERS_V01,
+			     ATH11K_QMI_WLFW_SERVICE_INS_ID_V01);
 	if (ret < 0) {
 		ath11k_warn(ab, "failed to add qmi lookup\n");
 		return ret;
diff --git a/drivers/net/wireless/ath/ath11k/qmi.h b/drivers/net/wireless/ath/ath11k/qmi.h
index b01759667466..0d1b45d37c8a 100644
--- a/drivers/net/wireless/ath/ath11k/qmi.h
+++ b/drivers/net/wireless/ath/ath11k/qmi.h
@@ -13,15 +13,15 @@
 #define ATH11K_QMI_WLANFW_TIMEOUT_MS		5000
 #define ATH11K_QMI_MAX_BDF_FILE_NAME_SIZE	64
 #define ATH11K_QMI_BDF_MAX_SIZE			(256 * 1024)
-#define ATH11K_QMI_CALDATA_OFFSET 		(128 * 1024)
+#define ATH11K_QMI_CALDATA_OFFSET		(128 * 1024)
 #define ATH11K_QMI_WLANFW_MAX_BUILD_ID_LEN_V01	128
 #define ATH11K_QMI_WLFW_SERVICE_ID_V01		0x45
 #define ATH11K_QMI_WLFW_SERVICE_VERS_V01	0x01
 #define ATH11K_QMI_WLFW_SERVICE_INS_ID_V01	0x02
-#define ATH11K_QMI_WLANFW_MAX_TIMESTAMP_LEN_V01 32
+#define ATH11K_QMI_WLANFW_MAX_TIMESTAMP_LEN_V01	32
 #define ATH11K_QMI_RESP_LEN_MAX			8192
 #define ATH11K_QMI_WLANFW_MAX_NUM_MEM_SEG_V01	32
-#define ATH11K_QMI_CALDB_SIZE 			0x480000
+#define ATH11K_QMI_CALDB_SIZE			0x480000
 #define ATH11K_QMI_DEFAULT_CAL_FILE_NAME	"caldata.bin"
 
 #define QMI_WLFW_REQUEST_MEM_IND_V01		0x0035
@@ -31,15 +31,12 @@
 
 #define QMI_WLANFW_MAX_DATA_SIZE_V01		6144
 #define ATH11K_FIRMWARE_MODE_OFF		4
-#define Q6_CALDB_ADDR 0x50000000
-#define Q6_CALDB_SIZE 0x480000
 
 struct ath11k_base;
-enum ath11k_firmware_mode;
 
 enum ath11k_qmi_file_type {
 	ATH11K_QMI_FILE_TYPE_BDF_GOLDEN,
-	ATH11K_QMI_FILE_TYPE_CALDATA,	
+	ATH11K_QMI_FILE_TYPE_CALDATA,
 	ATH11K_QMI_MAX_FILE_TYPE,
 };
 
@@ -66,7 +63,6 @@ struct ath11k_qmi_driver_event {
 	void *data;
 };
 
-
 struct ath11k_qmi_ce_cfg {
 	const u8 *tgt_ce;
 	int tgt_ce_len;
@@ -88,7 +84,6 @@ struct target_mem_chunk {
 	u32 type;
 	dma_addr_t paddr;
 	u32 vaddr;
-	bool is_valid;
 };
 
 struct target_info {
@@ -112,7 +107,7 @@ struct ath11k_qmi {
 	struct target_mem_chunk target_mem[ATH11K_QMI_WLANFW_MAX_NUM_MEM_SEG_V01];
 	u32 mem_seg_count;
 	u32 target_mem_mode;
-	bool cal_done;
+	u8 cal_done;
 	struct target_info target;
 };
 
@@ -120,11 +115,11 @@ struct ath11k_qmi {
 #define QMI_WLANFW_HOST_CAP_REQ_V01			0x0034
 #define QMI_WLANFW_HOST_CAP_RESP_MSG_V01_MAX_LEN	7
 #define QMI_WLFW_HOST_CAP_RESP_V01			0x0034
-#define QMI_WLFW_MAX_NUM_GPIO_V01 			32
+#define QMI_WLFW_MAX_NUM_GPIO_V01			32
 #define QMI_IPQ8074_FW_MEM_MODE				0xFF
-#define HOST_DDR_REGION_TYPE            0x1
-#define BDF_MEM_REGION_TYPE             0x2
-#define CALDB_MEM_REGION_TYPE           0x4
+#define HOST_DDR_REGION_TYPE				0x1
+#define BDF_MEM_REGION_TYPE				0x2
+#define CALDB_MEM_REGION_TYPE				0x4
 
 struct qmi_wlanfw_host_cap_req_msg_v01 {
 	u8 num_clients_valid;
@@ -208,27 +203,27 @@ struct qmi_wlanfw_ind_register_resp_msg_v01 {
 #define QMI_WLANFW_MAX_NUM_MEM_CFG_V01			2
 
 struct qmi_wlanfw_mem_cfg_s_v01 {
-        u64 offset;
-        u32 size;
-        u8 secure_flag;
+	u64 offset;
+	u32 size;
+	u8 secure_flag;
 };
 
 enum qmi_wlanfw_mem_type_enum_v01 {
-        WLANFW_MEM_TYPE_ENUM_MIN_VAL_V01 = INT_MIN,
-        QMI_WLANFW_MEM_TYPE_MSA_V01 = 0,
-        QMI_WLANFW_MEM_TYPE_DDR_V01 = 1,
-        QMI_WLANFW_MEM_BDF_V01 = 2,
-        QMI_WLANFW_MEM_M3_V01 = 3,
-        QMI_WLANFW_MEM_CAL_V01 = 4,
-        QMI_WLANFW_MEM_DPD_V01 = 5,
-        WLANFW_MEM_TYPE_ENUM_MAX_VAL_V01 = INT_MAX,
+	WLANFW_MEM_TYPE_ENUM_MIN_VAL_V01 = INT_MIN,
+	QMI_WLANFW_MEM_TYPE_MSA_V01 = 0,
+	QMI_WLANFW_MEM_TYPE_DDR_V01 = 1,
+	QMI_WLANFW_MEM_BDF_V01 = 2,
+	QMI_WLANFW_MEM_M3_V01 = 3,
+	QMI_WLANFW_MEM_CAL_V01 = 4,
+	QMI_WLANFW_MEM_DPD_V01 = 5,
+	WLANFW_MEM_TYPE_ENUM_MAX_VAL_V01 = INT_MAX,
 };
 
 struct qmi_wlanfw_mem_seg_s_v01 {
-        u32 size;
-        enum qmi_wlanfw_mem_type_enum_v01 type;
-        u32 mem_cfg_len;
-        struct qmi_wlanfw_mem_cfg_s_v01 mem_cfg[QMI_WLANFW_MAX_NUM_MEM_CFG_V01];
+	u32 size;
+	enum qmi_wlanfw_mem_type_enum_v01 type;
+	u32 mem_cfg_len;
+	struct qmi_wlanfw_mem_cfg_s_v01 mem_cfg[QMI_WLANFW_MAX_NUM_MEM_CFG_V01];
 };
 
 struct qmi_wlanfw_request_mem_ind_msg_v01 {
-- 
1.9.1


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
