Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jlC9X-0002qc-R9
 for ath11k@lists.infradead.org; Tue, 16 Jun 2020 14:01:37 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: [PATCH 06/12] ath11k: create a common function to request all
 firmware files
Date: Tue, 16 Jun 2020 17:00:49 +0300
Message-Id: <1592316055-24958-7-git-send-email-kvalo@codeaurora.org>
In-Reply-To: <1592316055-24958-1-git-send-email-kvalo@codeaurora.org>
References: <1592316055-24958-1-git-send-email-kvalo@codeaurora.org>
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

To avoid duplicating the logic how the full firmware path is created create a
common function ath11k_core_firmware_request() and convert also qmi.c to use it.

Also remove a useless info print, it's more like a debug message anyway.

No functional changes. Compile tested only.

Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/core.c | 27 +++++++++++++--------------
 drivers/net/wireless/ath/ath11k/core.h |  4 ++++
 drivers/net/wireless/ath/ath11k/qmi.c  | 12 ++++--------
 3 files changed, 21 insertions(+), 22 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
index 5232a355ac12..7e29977c23b4 100644
--- a/drivers/net/wireless/ath/ath11k/core.c
+++ b/drivers/net/wireless/ath/ath11k/core.c
@@ -48,9 +48,9 @@ static int ath11k_core_create_board_name(struct ath11k_base *ab, char *name,
 	return 0;
 }
 
-static const struct firmware *ath11k_fetch_fw_file(struct ath11k_base *ab,
-						   const char *dir,
-						   const char *file)
+const struct firmware *ath11k_core_firmware_request(struct ath11k_base *ab,
+						    const char *dir,
+						    const char *file)
 {
 	char filename[100];
 	const struct firmware *fw;
@@ -63,14 +63,13 @@ static const struct firmware *ath11k_fetch_fw_file(struct ath11k_base *ab,
 		dir = ".";
 
 	snprintf(filename, sizeof(filename), "%s/%s", dir, file);
-	ret = firmware_request_nowarn(&fw, filename, ab->dev);
-	ath11k_dbg(ab, ATH11K_DBG_BOOT, "boot fw request '%s': %d\n",
-		   filename, ret);
 
+	ret = firmware_request_nowarn(&fw, filename, ab->dev);
 	if (ret)
 		return ERR_PTR(ret);
-	ath11k_warn(ab, "Downloading BDF: %s, size: %zu\n",
-		    filename, fw->size);
+
+	ath11k_dbg(ab, ATH11K_DBG_BOOT, "boot firmware request %s size %zu\n",
+		   filename, fw->size);
 
 	return fw;
 }
@@ -176,9 +175,9 @@ static int ath11k_core_fetch_board_data_api_n(struct ath11k_base *ab,
 	int ret, ie_id;
 
 	if (!bd->fw)
-		bd->fw = ath11k_fetch_fw_file(ab,
-					      ab->hw_params.fw.dir,
-					      filename);
+		bd->fw = ath11k_core_firmware_request(ab,
+						      ab->hw_params.fw.dir,
+						      filename);
 	if (IS_ERR(bd->fw))
 		return PTR_ERR(bd->fw);
 
@@ -268,9 +267,9 @@ static int ath11k_core_fetch_board_data_api_n(struct ath11k_base *ab,
 static int ath11k_core_fetch_board_data_api_1(struct ath11k_base *ab,
 					      struct ath11k_board_data *bd)
 {
-	bd->fw = ath11k_fetch_fw_file(ab,
-				      ab->hw_params.fw.dir,
-				      ATH11K_DEFAULT_BOARD_FILE);
+	bd->fw = ath11k_core_firmware_request(ab,
+					      ab->hw_params.fw.dir,
+					      ATH11K_DEFAULT_BOARD_FILE);
 	if (IS_ERR(bd->fw))
 		return PTR_ERR(bd->fw);
 
diff --git a/drivers/net/wireless/ath/ath11k/core.h b/drivers/net/wireless/ath/ath11k/core.h
index 98de9c35e178..be1339a5ea0a 100644
--- a/drivers/net/wireless/ath/ath11k/core.h
+++ b/drivers/net/wireless/ath/ath11k/core.h
@@ -861,6 +861,10 @@ void ath11k_core_free_bdf(struct ath11k_base *ab, struct ath11k_board_data *bd);
 
 void ath11k_core_halt(struct ath11k *ar);
 
+const struct firmware *ath11k_core_firmware_request(struct ath11k_base *ab,
+						    const char *dir,
+						    const char *file);
+
 static inline const char *ath11k_scan_state_str(enum ath11k_scan_state state)
 {
 	switch (state) {
diff --git a/drivers/net/wireless/ath/ath11k/qmi.c b/drivers/net/wireless/ath/ath11k/qmi.c
index e4198d3b0bae..0cd3fb8eeece 100644
--- a/drivers/net/wireless/ath/ath11k/qmi.c
+++ b/drivers/net/wireless/ath/ath11k/qmi.c
@@ -1790,8 +1790,6 @@ ath11k_qmi_prepare_bdf_download(struct ath11k_base *ab, int type,
 				struct qmi_wlanfw_bdf_download_req_msg_v01 *req,
 				void __iomem *bdf_addr)
 {
-	struct device *dev = ab->dev;
-	char filename[ATH11K_QMI_MAX_BDF_FILE_NAME_SIZE];
 	const struct firmware *fw_entry;
 	struct ath11k_board_data bd;
 	u32 fw_size;
@@ -1812,11 +1810,11 @@ ath11k_qmi_prepare_bdf_download(struct ath11k_base *ab, int type,
 		ath11k_core_free_bdf(ab, &bd);
 		break;
 	case ATH11K_QMI_FILE_TYPE_CALDATA:
-		snprintf(filename, sizeof(filename),
-			 "%s/%s", ab->hw_params.fw.dir, ATH11K_QMI_DEFAULT_CAL_FILE_NAME);
-		ret = request_firmware(&fw_entry, filename, dev);
+		fw_entry = ath11k_core_firmware_request(ab, ab->hw_params.fw.dir,
+							ATH11K_QMI_DEFAULT_CAL_FILE_NAME);
 		if (ret) {
-			ath11k_warn(ab, "qmi failed to load CAL: %s\n", filename);
+			ath11k_warn(ab, "failed to load %s: %d\n",
+				    ATH11K_QMI_DEFAULT_CAL_FILE_NAME, ret);
 			goto out;
 		}
 
@@ -1825,8 +1823,6 @@ ath11k_qmi_prepare_bdf_download(struct ath11k_base *ab, int type,
 
 		memcpy_toio(bdf_addr + ATH11K_QMI_CALDATA_OFFSET,
 			    fw_entry->data, fw_size);
-		ath11k_info(ab, "qmi downloading BDF: %s, size: %zu\n",
-			    filename, fw_entry->size);
 
 		release_firmware(fw_entry);
 		break;
-- 
2.7.4


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
