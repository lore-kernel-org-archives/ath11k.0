Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail29.static.mailgun.info ([104.130.122.29])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k6TrX-0008RG-Da
 for ath11k@lists.infradead.org; Fri, 14 Aug 2020 07:10:56 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: [PATCH 01/11] ath11k: add support for m3 firmware
Date: Fri, 14 Aug 2020 10:10:20 +0300
Message-Id: <1597389030-13887-2-git-send-email-kvalo@codeaurora.org>
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

From: Govind Singh <govinds@codeaurora.org>

PCI devices like QCA6390 have a separate firmware image for the m3
micro-controller. Add support to load the firmware using m3.bin file.

Tested-on: QCA6390 hw2.0 PCI WLAN.HST.1.0.1-01740-QCAHSTSWPLZ_V2_TO_X86-1
Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.1.0.1-01238-QCAHKSWPL_SILICONZ-2

Signed-off-by: Govind Singh <govinds@codeaurora.org>
Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/ahb.c  |  1 +
 drivers/net/wireless/ath/ath11k/core.h |  1 +
 drivers/net/wireless/ath/ath11k/hw.h   |  1 +
 drivers/net/wireless/ath/ath11k/pci.c  |  1 +
 drivers/net/wireless/ath/ath11k/qmi.c  | 82 +++++++++++++++++++++++++++++++---
 drivers/net/wireless/ath/ath11k/qmi.h  |  7 +++
 6 files changed, 86 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/ahb.c b/drivers/net/wireless/ath/ath11k/ahb.c
index f00c4cc76d74..746e84c4526c 100644
--- a/drivers/net/wireless/ath/ath11k/ahb.c
+++ b/drivers/net/wireless/ath/ath11k/ahb.c
@@ -27,6 +27,7 @@ MODULE_DEVICE_TABLE(of, ath11k_ahb_of_match);
 
 static const struct ath11k_bus_params ath11k_ahb_bus_params = {
 	.mhi_support = false,
+	.m3_fw_support = false,
 };
 
 /* Target firmware's Copy Engine configuration. */
diff --git a/drivers/net/wireless/ath/ath11k/core.h b/drivers/net/wireless/ath/ath11k/core.h
index 0309b13e38c9..b30abd611f0d 100644
--- a/drivers/net/wireless/ath/ath11k/core.h
+++ b/drivers/net/wireless/ath/ath11k/core.h
@@ -582,6 +582,7 @@ struct ath11k_board_data {
 
 struct ath11k_bus_params {
 	bool mhi_support;
+	bool m3_fw_support;
 };
 
 /* IPQ8074 HW channel counters frequency value in hertz */
diff --git a/drivers/net/wireless/ath/ath11k/hw.h b/drivers/net/wireless/ath/ath11k/hw.h
index c02fd02839d4..5b443a212c85 100644
--- a/drivers/net/wireless/ath/ath11k/hw.h
+++ b/drivers/net/wireless/ath/ath11k/hw.h
@@ -73,6 +73,7 @@
 #define ATH11K_DEFAULT_BOARD_FILE	"board.bin"
 #define ATH11K_DEFAULT_CAL_FILE		"caldata.bin"
 #define ATH11K_AMSS_FILE		"amss.bin"
+#define ATH11K_M3_FILE			"m3.bin"
 
 enum ath11k_hw_rate_cck {
 	ATH11K_HW_RATE_CCK_LP_11M = 0,
diff --git a/drivers/net/wireless/ath/ath11k/pci.c b/drivers/net/wireless/ath/ath11k/pci.c
index d09faaf747ba..802461d1261a 100644
--- a/drivers/net/wireless/ath/ath11k/pci.c
+++ b/drivers/net/wireless/ath/ath11k/pci.c
@@ -29,6 +29,7 @@ MODULE_DEVICE_TABLE(pci, ath11k_pci_id_table);
 
 static const struct ath11k_bus_params ath11k_pci_bus_params = {
 	.mhi_support = true,
+	.m3_fw_support = true,
 };
 
 static const struct ath11k_msi_config msi_config = {
diff --git a/drivers/net/wireless/ath/ath11k/qmi.c b/drivers/net/wireless/ath/ath11k/qmi.c
index 50812df6527d..0d7441e6ff17 100644
--- a/drivers/net/wireless/ath/ath11k/qmi.c
+++ b/drivers/net/wireless/ath/ath11k/qmi.c
@@ -1516,11 +1516,17 @@ static int ath11k_qmi_host_cap_send(struct ath11k_base *ab)
 	req.bdf_support_valid = 1;
 	req.bdf_support = 1;
 
-	req.m3_support_valid = 0;
-	req.m3_support = 0;
-
-	req.m3_cache_support_valid = 0;
-	req.m3_cache_support = 0;
+	if (ab->bus_params.m3_fw_support) {
+		req.m3_support_valid = 1;
+		req.m3_support = 1;
+		req.m3_cache_support_valid = 1;
+		req.m3_cache_support = 1;
+	} else {
+		req.m3_support_valid = 0;
+		req.m3_support = 0;
+		req.m3_cache_support_valid = 0;
+		req.m3_cache_support = 0;
+	}
 
 	req.cal_done_valid = 1;
 	req.cal_done = ab->qmi.cal_done;
@@ -1908,8 +1914,57 @@ static int ath11k_qmi_load_bdf(struct ath11k_base *ab)
 	return ret;
 }
 
+static int ath11k_qmi_m3_load(struct ath11k_base *ab)
+{
+	struct m3_mem_region *m3_mem = &ab->qmi.m3_mem;
+	const struct firmware *fw;
+	char path[100];
+	int ret;
+
+	if (m3_mem->vaddr || m3_mem->size)
+		return 0;
+
+	fw = ath11k_core_firmware_request(ab, ATH11K_M3_FILE);
+	if (IS_ERR(fw)) {
+		ret = PTR_ERR(fw);
+		ath11k_core_create_firmware_path(ab, ATH11K_M3_FILE,
+						 path, sizeof(path));
+		ath11k_err(ab, "failed to load %s: %d\n", path, ret);
+		return ret;
+	}
+
+	m3_mem->vaddr = dma_alloc_coherent(ab->dev,
+					   fw->size, &m3_mem->paddr,
+					   GFP_KERNEL);
+	if (!m3_mem->vaddr) {
+		ath11k_err(ab, "failed to allocate memory for M3 with size %zu\n",
+			   fw->size);
+		release_firmware(fw);
+		return -ENOMEM;
+	}
+
+	memcpy(m3_mem->vaddr, fw->data, fw->size);
+	m3_mem->size = fw->size;
+	release_firmware(fw);
+
+	return 0;
+}
+
+static void ath11k_qmi_m3_free(struct ath11k_base *ab)
+{
+	struct m3_mem_region *m3_mem = &ab->qmi.m3_mem;
+
+	if (!ab->bus_params.m3_fw_support || !m3_mem->vaddr)
+		return;
+
+	dma_free_coherent(ab->dev, m3_mem->size,
+			  m3_mem->vaddr, m3_mem->paddr);
+	m3_mem->vaddr = NULL;
+}
+
 static int ath11k_qmi_wlanfw_m3_info_send(struct ath11k_base *ab)
 {
+	struct m3_mem_region *m3_mem = &ab->qmi.m3_mem;
 	struct qmi_wlanfw_m3_info_req_msg_v01 req;
 	struct qmi_wlanfw_m3_info_resp_msg_v01 resp;
 	struct qmi_txn txn = {};
@@ -1917,8 +1972,20 @@ static int ath11k_qmi_wlanfw_m3_info_send(struct ath11k_base *ab)
 
 	memset(&req, 0, sizeof(req));
 	memset(&resp, 0, sizeof(resp));
-	req.addr = 0;
-	req.size = 0;
+
+	if (ab->bus_params.m3_fw_support) {
+		ret = ath11k_qmi_m3_load(ab);
+		if (ret) {
+			ath11k_err(ab, "failed to load m3 firmware: %d", ret);
+			return ret;
+		}
+
+		req.addr = m3_mem->paddr;
+		req.size = m3_mem->size;
+	} else {
+		req.addr = 0;
+		req.size = 0;
+	}
 
 	ret = qmi_txn_init(&ab->qmi.handle, &txn,
 			   qmi_wlanfw_m3_info_resp_msg_v01_ei, &resp);
@@ -2424,5 +2491,6 @@ void ath11k_qmi_deinit_service(struct ath11k_base *ab)
 	qmi_handle_release(&ab->qmi.handle);
 	cancel_work_sync(&ab->qmi.event_work);
 	destroy_workqueue(ab->qmi.event_wq);
+	ath11k_qmi_m3_free(ab);
 }
 
diff --git a/drivers/net/wireless/ath/ath11k/qmi.h b/drivers/net/wireless/ath/ath11k/qmi.h
index 3307be5be687..dd9e498a2056 100644
--- a/drivers/net/wireless/ath/ath11k/qmi.h
+++ b/drivers/net/wireless/ath/ath11k/qmi.h
@@ -96,6 +96,12 @@ struct target_info {
 	char fw_build_id[ATH11K_QMI_WLANFW_MAX_BUILD_ID_LEN_V01 + 1];
 };
 
+struct m3_mem_region {
+	u32 size;
+	dma_addr_t paddr;
+	void *vaddr;
+};
+
 struct ath11k_qmi {
 	struct ath11k_base *ab;
 	struct qmi_handle handle;
@@ -110,6 +116,7 @@ struct ath11k_qmi {
 	u32 target_mem_mode;
 	u8 cal_done;
 	struct target_info target;
+	struct m3_mem_region m3_mem;
 };
 
 #define QMI_WLANFW_HOST_CAP_REQ_MSG_V01_MAX_LEN		189
-- 
2.7.4


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
