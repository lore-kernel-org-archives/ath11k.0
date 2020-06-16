Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jlC9f-0002xA-SH
 for ath11k@lists.infradead.org; Tue, 16 Jun 2020 14:01:43 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: [PATCH 07/12] ath11k: don't use defines for hw specific firmware
 directories
Date: Tue, 16 Jun 2020 17:00:50 +0300
Message-Id: <1592316055-24958-8-git-send-email-kvalo@codeaurora.org>
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

The downside of using defines in struct ath11k_hw_params.fw.dir is that it's
easy to get it wrong as the full path is not visible. So drop the use of
defines and instead create the patch runtime using a static inline function
ath11k_core_create_firmware_path(). Hopefully this reduces the chances of using
incorrect firmware path.

No functional changes. Compile tested only.

Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/core.c | 23 ++++++++---------------
 drivers/net/wireless/ath/ath11k/core.h | 11 +++++++++--
 drivers/net/wireless/ath/ath11k/hw.h   |  1 -
 drivers/net/wireless/ath/ath11k/qmi.c  |  2 +-
 4 files changed, 18 insertions(+), 19 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
index 7e29977c23b4..de5b1d20771a 100644
--- a/drivers/net/wireless/ath/ath11k/core.c
+++ b/drivers/net/wireless/ath/ath11k/core.c
@@ -22,7 +22,7 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.hw_rev = ATH11K_HW_IPQ8074,
 		.name = "ipq8074 hw2.0",
 		.fw = {
-			.dir = IPQ8074_FW_DIR,
+			.dir = "IPQ8074/hw2.0",
 			.board_size = IPQ8074_MAX_BOARD_DATA_SZ,
 			.cal_size =  IPQ8074_MAX_CAL_DATA_SZ,
 		},
@@ -49,27 +49,23 @@ static int ath11k_core_create_board_name(struct ath11k_base *ab, char *name,
 }
 
 const struct firmware *ath11k_core_firmware_request(struct ath11k_base *ab,
-						    const char *dir,
 						    const char *file)
 {
-	char filename[100];
 	const struct firmware *fw;
+	char path[100];
 	int ret;
 
 	if (file == NULL)
 		return ERR_PTR(-ENOENT);
 
-	if (dir == NULL)
-		dir = ".";
+	ath11k_core_create_firmware_path(ab, file, path, sizeof(path));
 
-	snprintf(filename, sizeof(filename), "%s/%s", dir, file);
-
-	ret = firmware_request_nowarn(&fw, filename, ab->dev);
+	ret = firmware_request_nowarn(&fw, path, ab->dev);
 	if (ret)
 		return ERR_PTR(ret);
 
 	ath11k_dbg(ab, ATH11K_DBG_BOOT, "boot firmware request %s size %zu\n",
-		   filename, fw->size);
+		   path, fw->size);
 
 	return fw;
 }
@@ -175,9 +171,8 @@ static int ath11k_core_fetch_board_data_api_n(struct ath11k_base *ab,
 	int ret, ie_id;
 
 	if (!bd->fw)
-		bd->fw = ath11k_core_firmware_request(ab,
-						      ab->hw_params.fw.dir,
-						      filename);
+		bd->fw = ath11k_core_firmware_request(ab, filename);
+
 	if (IS_ERR(bd->fw))
 		return PTR_ERR(bd->fw);
 
@@ -267,9 +262,7 @@ static int ath11k_core_fetch_board_data_api_n(struct ath11k_base *ab,
 static int ath11k_core_fetch_board_data_api_1(struct ath11k_base *ab,
 					      struct ath11k_board_data *bd)
 {
-	bd->fw = ath11k_core_firmware_request(ab,
-					      ab->hw_params.fw.dir,
-					      ATH11K_DEFAULT_BOARD_FILE);
+	bd->fw = ath11k_core_firmware_request(ab, ATH11K_DEFAULT_BOARD_FILE);
 	if (IS_ERR(bd->fw))
 		return PTR_ERR(bd->fw);
 
diff --git a/drivers/net/wireless/ath/ath11k/core.h b/drivers/net/wireless/ath/ath11k/core.h
index be1339a5ea0a..b6ccd9f93853 100644
--- a/drivers/net/wireless/ath/ath11k/core.h
+++ b/drivers/net/wireless/ath/ath11k/core.h
@@ -862,8 +862,7 @@ void ath11k_core_free_bdf(struct ath11k_base *ab, struct ath11k_board_data *bd);
 void ath11k_core_halt(struct ath11k *ar);
 
 const struct firmware *ath11k_core_firmware_request(struct ath11k_base *ab,
-						    const char *dir,
-						    const char *file);
+						    const char *filename);
 
 static inline const char *ath11k_scan_state_str(enum ath11k_scan_state state)
 {
@@ -897,4 +896,12 @@ static inline struct ath11k_vif *ath11k_vif_to_arvif(struct ieee80211_vif *vif)
 	return (struct ath11k_vif *)vif->drv_priv;
 }
 
+static inline void ath11k_core_create_firmware_path(struct ath11k_base *ab,
+						    const char *filename,
+						    void *buf, size_t buf_len)
+{
+	snprintf(buf, buf_len, "%s/%s/%s", ATH11K_FW_DIR,
+		 ab->hw_params.fw.dir, filename);
+}
+
 #endif /* _CORE_H_ */
diff --git a/drivers/net/wireless/ath/ath11k/hw.h b/drivers/net/wireless/ath/ath11k/hw.h
index 78518e3f773d..828c8c076218 100644
--- a/drivers/net/wireless/ath/ath11k/hw.h
+++ b/drivers/net/wireless/ath/ath11k/hw.h
@@ -69,7 +69,6 @@
 #define ATH11K_FW_DIR			"ath11k"
 
 /* IPQ8074 definitions */
-#define IPQ8074_FW_DIR			ATH11K_FW_DIR "/IPQ8074/hw2.0"
 #define IPQ8074_MAX_BOARD_DATA_SZ	(256 * 1024)
 #define IPQ8074_MAX_CAL_DATA_SZ		IPQ8074_MAX_BOARD_DATA_SZ
 
diff --git a/drivers/net/wireless/ath/ath11k/qmi.c b/drivers/net/wireless/ath/ath11k/qmi.c
index 0cd3fb8eeece..d9ffdf84ccae 100644
--- a/drivers/net/wireless/ath/ath11k/qmi.c
+++ b/drivers/net/wireless/ath/ath11k/qmi.c
@@ -1810,7 +1810,7 @@ ath11k_qmi_prepare_bdf_download(struct ath11k_base *ab, int type,
 		ath11k_core_free_bdf(ab, &bd);
 		break;
 	case ATH11K_QMI_FILE_TYPE_CALDATA:
-		fw_entry = ath11k_core_firmware_request(ab, ab->hw_params.fw.dir,
+		fw_entry = ath11k_core_firmware_request(ab,
 							ATH11K_QMI_DEFAULT_CAL_FILE_NAME);
 		if (ret) {
 			ath11k_warn(ab, "failed to load %s: %d\n",
-- 
2.7.4


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
