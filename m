Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hvN1f-0005xL-Va
 for ath11k@lists.infradead.org; Wed, 07 Aug 2019 14:34:55 +0000
From: Anilkumar Kolli <akolli@codeaurora.org>
Subject: [PATCH] ath11k: remove bdf-addr from dtsi
Date: Wed,  7 Aug 2019 20:04:39 +0530
Message-Id: <1565188479-3027-1-git-send-email-akolli@codeaurora.org>
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

Remove bdf-addr from DT entry and hard code in driver.

Signed-off-by: Anilkumar Kolli <akolli@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/qcom,ath11k.txt |  4 ----
 drivers/net/wireless/ath/ath11k/qmi.c           | 31 ++++---------------------
 drivers/net/wireless/ath/ath11k/qmi.h           |  2 ++
 3 files changed, 6 insertions(+), 31 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/qcom,ath11k.txt b/drivers/net/wireless/ath/ath11k/qcom,ath11k.txt
index 3e00f470751b..1824238b4b50 100644
--- a/drivers/net/wireless/ath/ath11k/qcom,ath11k.txt
+++ b/drivers/net/wireless/ath/ath11k/qcom,ath11k.txt
@@ -12,8 +12,6 @@ Optional properties:
 - interrupt-names: Must include the entries for CE interrupt
 		   names ("ce0" to "ce11") and hw srng interrupt
 		   names.
-- qcom,tgt-mem-mode: Target memory mode used to select BDF Address
-- qcom,bdf-addr: List of BDF address used to configure for the device
 - qcom,rproc: DT entry of q6v5-wcss
 
 Example:
@@ -125,7 +123,5 @@ wifi0: wifi@c000000 {
 			  "wbm2host-tx-completions-ring2",
 			  "wbm2host-tx-completions-ring1",
 			  "tcl2host-status-ring";
-	qcom,tgt-mem-mode = <0>;
-	qcom,bdf-addr = <0x4BE00000 0x4BE00000>;
 	qcom,rproc = <&qcom_q6v5_wcss>;
 };
diff --git a/drivers/net/wireless/ath/ath11k/qmi.c b/drivers/net/wireless/ath/ath11k/qmi.c
index dffb8629f14b..b79d7e908967 100644
--- a/drivers/net/wireless/ath/ath11k/qmi.c
+++ b/drivers/net/wireless/ath/ath11k/qmi.c
@@ -1676,22 +1676,14 @@ static int ath11k_qmi_respond_fw_mem_request(struct ath11k_base *ab)
 
 static int ath11k_qmi_alloc_target_mem_chunk(struct ath11k_base *ab)
 {
-	u32 bdf_location[2] = {0, 0};
 	struct device *dev = ab->dev;
 	int i, idx, mode = ab->qmi.target_mem_mode;
 
-	if (of_property_read_u32_array(dev->of_node, "qcom,bdf-addr",
-				       &bdf_location[0],
-				       ARRAY_SIZE(bdf_location))) {
-		ath11k_warn(ab, "qmi no bdf_addr in device_tree\n");
-		return -EINVAL;
-	}
-
 	for (i = 0, idx = 0; i < ab->qmi.mem_seg_count; i++) {
 		switch (ab->qmi.target_mem[i].type) {
 		case BDF_MEM_REGION_TYPE:
-			ab->qmi.target_mem[idx].paddr = bdf_location[mode];
-			ab->qmi.target_mem[idx].vaddr = bdf_location[mode];
+			ab->qmi.target_mem[idx].paddr = ATH11K_QMI_BDF_ADDRESS;
+			ab->qmi.target_mem[idx].vaddr = ATH11K_QMI_BDF_ADDRESS;
 			ab->qmi.target_mem[idx].size = ab->qmi.target_mem[i].size;
 			ab->qmi.target_mem[idx].type = ab->qmi.target_mem[i].type;
 			idx++;
@@ -1856,7 +1848,6 @@ static int ath11k_qmi_load_bdf(struct ath11k_base *ab)
 	struct qmi_wlanfw_bdf_download_resp_msg_v01 resp;
 	struct device *dev = ab->dev;
 	struct qmi_txn txn = {};
-	u32 location[2];
 	void __iomem *bdf_addr = NULL;
 	int type, ret;
 
@@ -1865,15 +1856,7 @@ static int ath11k_qmi_load_bdf(struct ath11k_base *ab)
 		return -ENOMEM;
 	memset(&resp, 0, sizeof(resp));
 
-	if (of_property_read_u32_array(dev->of_node, "qcom,bdf-addr", &location[0],
-				       ARRAY_SIZE(location))) {
-		ath11k_err(ab, "qmi bdf_addr is not in device_tree\n");
-		ret = -EINVAL;
-		goto out;
-	}
-
-	bdf_addr = ioremap(location[ab->qmi.target_mem_mode],
-			   ATH11K_QMI_BDF_MAX_SIZE);
+	bdf_addr = ioremap(ATH11K_QMI_BDF_ADDRESS, ATH11K_QMI_BDF_MAX_SIZE);
 	if (!bdf_addr) {
 		ath11k_warn(ab, "qmi ioremap error for BDF\n");
 		ret = -EIO;
@@ -2414,13 +2397,7 @@ int ath11k_qmi_init_service(struct ath11k_base *ab)
 	memset(&ab->qmi.target_mem, 0, sizeof(struct target_mem_chunk));
 	ab->qmi.ab = ab;
 
-	if (of_property_read_u32(dev->of_node,
-				 "qcom,tgt-mem-mode",
-				 &ab->qmi.target_mem_mode)) {
-		ath11k_err(ab, "No ipq8074_tgt_mem_mode entry in dev-tree.\n");
-		ab->qmi.target_mem_mode = 0;
-	}
-
+	ab->qmi.target_mem_mode = ATH11K_QMI_TARGET_MEM_MODE_DEFAULT;
 	ret = qmi_handle_init(&ab->qmi.handle, ATH11K_QMI_RESP_LEN_MAX,
 			      &ath11k_qmi_ops, ath11k_qmi_msg_handlers);
 	if (ret < 0) {
diff --git a/drivers/net/wireless/ath/ath11k/qmi.h b/drivers/net/wireless/ath/ath11k/qmi.h
index fab03f5af271..111ae48b9343 100644
--- a/drivers/net/wireless/ath/ath11k/qmi.h
+++ b/drivers/net/wireless/ath/ath11k/qmi.h
@@ -12,6 +12,7 @@
 #define ATH11K_HOST_VERSION_STRING		"WIN"
 #define ATH11K_QMI_WLANFW_TIMEOUT_MS		5000
 #define ATH11K_QMI_MAX_BDF_FILE_NAME_SIZE	64
+#define ATH11K_QMI_BDF_ADDRESS			0x4B0C0000
 #define ATH11K_QMI_BDF_MAX_SIZE			(256 * 1024)
 #define ATH11K_QMI_CALDATA_OFFSET		(128 * 1024)
 #define ATH11K_QMI_WLANFW_MAX_BUILD_ID_LEN_V01	128
@@ -31,6 +32,7 @@
 
 #define QMI_WLANFW_MAX_DATA_SIZE_V01		6144
 #define ATH11K_FIRMWARE_MODE_OFF		4
+#define ATH11K_QMI_TARGET_MEM_MODE_DEFAULT	0
 
 struct ath11k_base;
 
-- 
1.9.1


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
