Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hvi4c-00084C-58
 for ath11k@lists.infradead.org; Thu, 08 Aug 2019 13:03:20 +0000
From: Maharaja Kennadyrajan <mkenna@codeaurora.org>
Subject: [PATCH 04/15] ath11k: Rename ath11k_base struct from 'sc' to 'ab in
 core.c
Date: Thu,  8 Aug 2019 18:33:01 +0530
Message-Id: <1565269392-2838-5-git-send-email-mkenna@codeaurora.org>
In-Reply-To: <1565269392-2838-1-git-send-email-mkenna@codeaurora.org>
References: <1565269392-2838-1-git-send-email-mkenna@codeaurora.org>
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
Cc: Maharaja Kennadyrajan <mkenna@codeaurora.org>

To avoid confusion and better readability, renamed the
ath11k_base struct from 'sc' to 'ab' in core.c file.

Signed-off-by: Maharaja Kennadyrajan <mkenna@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/core.c | 328 ++++++++++++-------------
 1 file changed, 164 insertions(+), 164 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
index 2e523afc4da8..9324dcb45bbe 100644
--- a/drivers/net/wireless/ath/ath11k/core.c
+++ b/drivers/net/wireless/ath/ath11k/core.c
@@ -43,7 +43,7 @@ u8 ath11k_core_get_hw_mac_id(struct ath11k_base *ab, int pdev_idx)
 	}
 }
 
-static int ath11k_core_create_board_name(struct ath11k_base *sc, char *name,
+static int ath11k_core_create_board_name(struct ath11k_base *ab, char *name,
 					 size_t name_len)
 {
 	/* Note: bus is fixed to ahb. When other bus type supported,
@@ -51,15 +51,15 @@ static int ath11k_core_create_board_name(struct ath11k_base *sc, char *name,
 	 */
 	scnprintf(name, name_len,
 		  "bus=ahb,qmi-chip-id=%d,qmi-board-id=%d",
-		  sc->qmi.target.chip_id,
-		  sc->qmi.target.board_id);
+		  ab->qmi.target.chip_id,
+		  ab->qmi.target.board_id);
 
-	ath11k_dbg(sc, ATH11K_DBG_BOOT, "boot using board name '%s'\n", name);
+	ath11k_dbg(ab, ATH11K_DBG_BOOT, "boot using board name '%s'\n", name);
 
 	return 0;
 }
 
-static const struct firmware *ath11k_fetch_fw_file(struct ath11k_base *sc,
+static const struct firmware *ath11k_fetch_fw_file(struct ath11k_base *ab,
 						   const char *dir,
 						   const char *file)
 {
@@ -74,19 +74,19 @@ static const struct firmware *ath11k_fetch_fw_file(struct ath11k_base *sc,
 		dir = ".";
 
 	snprintf(filename, sizeof(filename), "%s/%s", dir, file);
-	ret = firmware_request_nowarn(&fw, filename, sc->dev);
-	ath11k_dbg(sc, ATH11K_DBG_BOOT, "boot fw request '%s': %d\n",
+	ret = firmware_request_nowarn(&fw, filename, ab->dev);
+	ath11k_dbg(ab, ATH11K_DBG_BOOT, "boot fw request '%s': %d\n",
 		   filename, ret);
 
 	if (ret)
 		return ERR_PTR(ret);
-	ath11k_warn(sc, "Downloading BDF: %s, size: %zu\n",
+	ath11k_warn(ab, "Downloading BDF: %s, size: %zu\n",
 		    filename, fw->size);
 
 	return fw;
 }
 
-void ath11k_core_free_bdf(struct ath11k_base *sc, struct ath11k_board_data *bd)
+void ath11k_core_free_bdf(struct ath11k_base *ab, struct ath11k_board_data *bd)
 {
 	if (!IS_ERR(bd->fw))
 		release_firmware(bd->fw);
@@ -94,7 +94,7 @@ void ath11k_core_free_bdf(struct ath11k_base *sc, struct ath11k_board_data *bd)
 	memset(bd, 0, sizeof(*bd));
 }
 
-static int ath11k_core_parse_bd_ie_board(struct ath11k_base *sc,
+static int ath11k_core_parse_bd_ie_board(struct ath11k_base *ab,
 					 struct ath11k_board_data *bd,
 					 const void *buf, size_t buf_len,
 					 const char *boardname,
@@ -119,7 +119,7 @@ static int ath11k_core_parse_bd_ie_board(struct ath11k_base *sc,
 		buf += sizeof(*hdr);
 
 		if (buf_len < ALIGN(board_ie_len, 4)) {
-			ath11k_err(sc, "invalid ATH11K_BD_IE_BOARD length: %zu < %zu\n",
+			ath11k_err(ab, "invalid ATH11K_BD_IE_BOARD length: %zu < %zu\n",
 				   buf_len, ALIGN(board_ie_len, 4));
 			ret = -EINVAL;
 			goto out;
@@ -127,7 +127,7 @@ static int ath11k_core_parse_bd_ie_board(struct ath11k_base *sc,
 
 		switch (board_ie_id) {
 		case ATH11K_BD_IE_BOARD_NAME:
-			ath11k_dbg_dump(sc, ATH11K_DBG_BOOT, "board name", "",
+			ath11k_dbg_dump(ab, ATH11K_DBG_BOOT, "board name", "",
 					board_ie_data, board_ie_len);
 
 			if (board_ie_len != strlen(boardname))
@@ -138,7 +138,7 @@ static int ath11k_core_parse_bd_ie_board(struct ath11k_base *sc,
 				break;
 
 			name_match_found = true;
-			ath11k_dbg(sc, ATH11K_DBG_BOOT,
+			ath11k_dbg(ab, ATH11K_DBG_BOOT,
 				   "boot found match for name '%s'",
 				   boardname);
 			break;
@@ -147,7 +147,7 @@ static int ath11k_core_parse_bd_ie_board(struct ath11k_base *sc,
 				/* no match found */
 				break;
 
-			ath11k_dbg(sc, ATH11K_DBG_BOOT,
+			ath11k_dbg(ab, ATH11K_DBG_BOOT,
 				   "boot found board data for '%s'", boardname);
 
 			bd->data = board_ie_data;
@@ -156,7 +156,7 @@ static int ath11k_core_parse_bd_ie_board(struct ath11k_base *sc,
 			ret = 0;
 			goto out;
 		default:
-			ath11k_warn(sc, "unknown ATH11K_BD_IE_BOARD found: %d\n",
+			ath11k_warn(ab, "unknown ATH11K_BD_IE_BOARD found: %d\n",
 				    board_ie_id);
 			break;
 		}
@@ -175,7 +175,7 @@ static int ath11k_core_parse_bd_ie_board(struct ath11k_base *sc,
 	return ret;
 }
 
-static int ath11k_core_fetch_board_data_api_n(struct ath11k_base *sc,
+static int ath11k_core_fetch_board_data_api_n(struct ath11k_base *ab,
 					      struct ath11k_board_data *bd,
 					      const char *boardname)
 {
@@ -187,8 +187,8 @@ static int ath11k_core_fetch_board_data_api_n(struct ath11k_base *sc,
 	int ret, ie_id;
 
 	if (!bd->fw)
-		bd->fw = ath11k_fetch_fw_file(sc,
-					      sc->hw_params.fw.dir,
+		bd->fw = ath11k_fetch_fw_file(ab,
+					      ab->hw_params.fw.dir,
 					      filename);
 	if (IS_ERR(bd->fw))
 		return PTR_ERR(bd->fw);
@@ -199,14 +199,14 @@ static int ath11k_core_fetch_board_data_api_n(struct ath11k_base *sc,
 	/* magic has extra null byte padded */
 	magic_len = strlen(ATH11K_BOARD_MAGIC) + 1;
 	if (len < magic_len) {
-		ath11k_err(sc, "failed to find magic value in %s/%s, file too short: %zu\n",
-			   sc->hw_params.fw.dir, filename, len);
+		ath11k_err(ab, "failed to find magic value in %s/%s, file too short: %zu\n",
+			   ab->hw_params.fw.dir, filename, len);
 		ret = -EINVAL;
 		goto err;
 	}
 
 	if (memcmp(data, ATH11K_BOARD_MAGIC, magic_len)) {
-		ath11k_err(sc, "found invalid board magic\n");
+		ath11k_err(ab, "found invalid board magic\n");
 		ret = -EINVAL;
 		goto err;
 	}
@@ -214,8 +214,8 @@ static int ath11k_core_fetch_board_data_api_n(struct ath11k_base *sc,
 	/* magic is padded to 4 bytes */
 	magic_len = ALIGN(magic_len, 4);
 	if (len < magic_len) {
-		ath11k_err(sc, "failed: %s/%s too small to contain board data, len: %zu\n",
-			   sc->hw_params.fw.dir, filename, len);
+		ath11k_err(ab, "failed: %s/%s too small to contain board data, len: %zu\n",
+			   ab->hw_params.fw.dir, filename, len);
 		ret = -EINVAL;
 		goto err;
 	}
@@ -232,14 +232,14 @@ static int ath11k_core_fetch_board_data_api_n(struct ath11k_base *sc,
 		data = hdr->data;
 
 		if (len < ALIGN(ie_len, 4)) {
-			ath11k_err(sc, "invalid length for board ie_id %d ie_len %zu len %zu\n",
+			ath11k_err(ab, "invalid length for board ie_id %d ie_len %zu len %zu\n",
 				   ie_id, ie_len, len);
 			return -EINVAL;
 		}
 
 		switch (ie_id) {
 		case ATH11K_BD_IE_BOARD:
-			ret = ath11k_core_parse_bd_ie_board(sc, bd, data,
+			ret = ath11k_core_parse_bd_ie_board(ab, bd, data,
 							    ie_len,
 							    boardname,
 							    ATH11K_BD_IE_BOARD);
@@ -262,9 +262,9 @@ static int ath11k_core_fetch_board_data_api_n(struct ath11k_base *sc,
 
 out:
 	if (!bd->data || !bd->len) {
-		ath11k_err(sc,
+		ath11k_err(ab,
 			   "failed to fetch board data for %s from %s/%s\n",
-			   boardname, sc->hw_params.fw.dir, filename);
+			   boardname, ab->hw_params.fw.dir, filename);
 		ret = -ENODATA;
 		goto err;
 	}
@@ -272,15 +272,15 @@ static int ath11k_core_fetch_board_data_api_n(struct ath11k_base *sc,
 	return 0;
 
 err:
-	ath11k_core_free_bdf(sc, bd);
+	ath11k_core_free_bdf(ab, bd);
 	return ret;
 }
 
-static int ath11k_core_fetch_board_data_api_1(struct ath11k_base *sc,
+static int ath11k_core_fetch_board_data_api_1(struct ath11k_base *ab,
 					      struct ath11k_board_data *bd)
 {
-	bd->fw = ath11k_fetch_fw_file(sc,
-				      sc->hw_params.fw.dir,
+	bd->fw = ath11k_fetch_fw_file(ab,
+				      ab->hw_params.fw.dir,
 				      ATH11K_DEFAULT_BOARD_FILE);
 	if (IS_ERR(bd->fw))
 		return PTR_ERR(bd->fw);
@@ -292,192 +292,192 @@ static int ath11k_core_fetch_board_data_api_1(struct ath11k_base *sc,
 }
 
 #define BOARD_NAME_SIZE 100
-int ath11k_core_fetch_bdf(struct ath11k_base *sc, struct ath11k_board_data *bd)
+int ath11k_core_fetch_bdf(struct ath11k_base *ab, struct ath11k_board_data *bd)
 {
 	char boardname[BOARD_NAME_SIZE];
 	int ret;
 
-	ret = ath11k_core_create_board_name(sc, boardname, BOARD_NAME_SIZE);
+	ret = ath11k_core_create_board_name(ab, boardname, BOARD_NAME_SIZE);
 	if (ret) {
-		ath11k_err(sc, "failed to create board name: %d", ret);
+		ath11k_err(ab, "failed to create board name: %d", ret);
 		return ret;
 	}
 
-	sc->bd_api = 2;
-	ret = ath11k_core_fetch_board_data_api_n(sc, bd, boardname);
+	ab->bd_api = 2;
+	ret = ath11k_core_fetch_board_data_api_n(ab, bd, boardname);
 	if (!ret)
 		goto success;
 
-	sc->bd_api = 1;
-	ret = ath11k_core_fetch_board_data_api_1(sc, bd);
+	ab->bd_api = 1;
+	ret = ath11k_core_fetch_board_data_api_1(ab, bd);
 	if (ret) {
-		ath11k_err(sc, "failed to fetch board-2.bin or board.bin from %s\n",
-			   sc->hw_params.fw.dir);
+		ath11k_err(ab, "failed to fetch board-2.bin or board.bin from %s\n",
+			   ab->hw_params.fw.dir);
 		return ret;
 	}
 
 success:
-	ath11k_dbg(sc, ATH11K_DBG_BOOT, "using board api %d\n", sc->bd_api);
+	ath11k_dbg(ab, ATH11K_DBG_BOOT, "using board api %d\n", ab->bd_api);
 	return 0;
 }
 
-static void ath11k_core_stop(struct ath11k_base *sc)
+static void ath11k_core_stop(struct ath11k_base *ab)
 {
-	if (!test_bit(ATH11K_FLAG_CRASH_FLUSH, &sc->dev_flags))
-		ath11k_qmi_firmware_stop(sc);
-	ath11k_ahb_stop(sc);
-	ath11k_wmi_detach(sc);
+	if (!test_bit(ATH11K_FLAG_CRASH_FLUSH, &ab->dev_flags))
+		ath11k_qmi_firmware_stop(ab);
+	ath11k_ahb_stop(ab);
+	ath11k_wmi_detach(ab);
 
 	/* De-Init of components as needed */
 }
 
-static int ath11k_core_soc_create(struct ath11k_base *sc)
+static int ath11k_core_soc_create(struct ath11k_base *ab)
 {
 	int ret;
 
-	ret = ath11k_qmi_init_service(sc);
+	ret = ath11k_qmi_init_service(ab);
 	if (ret) {
-		ath11k_err(sc, "failed to initialize qmi :%d\n", ret);
+		ath11k_err(ab, "failed to initialize qmi :%d\n", ret);
 		return ret;
 	}
 
-	ret = ath11k_debug_soc_create(sc);
+	ret = ath11k_debug_soc_create(ab);
 	if (ret) {
-		ath11k_err(sc, "failed to create ath11k debugfs\n");
+		ath11k_err(ab, "failed to create ath11k debugfs\n");
 		goto err_qmi_deinit;
 	}
 
-	ret = ath11k_ahb_power_up(sc);
+	ret = ath11k_ahb_power_up(ab);
 	if (ret) {
-		ath11k_err(sc, "failed to power up :%d\n", ret);
+		ath11k_err(ab, "failed to power up :%d\n", ret);
 		goto err_debugfs_reg;
 	}
 
 	return 0;
 
 err_debugfs_reg:
-	ath11k_debug_soc_destroy(sc);
+	ath11k_debug_soc_destroy(ab);
 err_qmi_deinit:
-	ath11k_qmi_deinit_service(sc);
+	ath11k_qmi_deinit_service(ab);
 	return ret;
 }
 
-static void ath11k_core_soc_destroy(struct ath11k_base *sc)
+static void ath11k_core_soc_destroy(struct ath11k_base *ab)
 {
-	ath11k_debug_soc_destroy(sc);
-	ath11k_dp_free(sc);
-	ath11k_reg_free(sc);
-	ath11k_qmi_deinit_service(sc);
+	ath11k_debug_soc_destroy(ab);
+	ath11k_dp_free(ab);
+	ath11k_reg_free(ab);
+	ath11k_qmi_deinit_service(ab);
 }
 
-static int ath11k_core_pdev_create(struct ath11k_base *sc)
+static int ath11k_core_pdev_create(struct ath11k_base *ab)
 {
 	int ret;
 
-	ret = ath11k_mac_create(sc);
+	ret = ath11k_mac_create(ab);
 	if (ret) {
-		ath11k_err(sc, "failed to create new hw device with mac80211 :%d\n",
+		ath11k_err(ab, "failed to create new hw device with mac80211 :%d\n",
 			   ret);
 		return ret;
 	}
 
-	ret = ath11k_dp_pdev_alloc(sc);
+	ret = ath11k_dp_pdev_alloc(ab);
 	if (ret) {
-		ath11k_err(sc, "failed to attach DP pdev: %d\n", ret);
+		ath11k_err(ab, "failed to attach DP pdev: %d\n", ret);
 		goto err_mac_destroy;
 	}
 
 	return 0;
 
 err_mac_destroy:
-	ath11k_mac_destroy(sc);
+	ath11k_mac_destroy(ab);
 
 	return ret;
 }
 
-static void ath11k_core_pdev_destroy(struct ath11k_base *sc)
+static void ath11k_core_pdev_destroy(struct ath11k_base *ab)
 {
-	ath11k_mac_unregister(sc);
-	ath11k_ahb_ext_irq_disable(sc);
-	ath11k_dp_pdev_free(sc);
+	ath11k_mac_unregister(ab);
+	ath11k_ahb_ext_irq_disable(ab);
+	ath11k_dp_pdev_free(ab);
 }
 
-static int ath11k_core_start(struct ath11k_base *sc,
+static int ath11k_core_start(struct ath11k_base *ab,
 			     enum ath11k_firmware_mode mode)
 {
 	int ret;
 
-	ret = ath11k_qmi_firmware_start(sc, mode);
+	ret = ath11k_qmi_firmware_start(ab, mode);
 	if (ret) {
-		ath11k_err(sc, "failed to attach wmi: %d\n", ret);
+		ath11k_err(ab, "failed to attach wmi: %d\n", ret);
 		return ret;
 	}
 
-	ret = ath11k_wmi_attach(sc);
+	ret = ath11k_wmi_attach(ab);
 	if (ret) {
-		ath11k_err(sc, "failed to attach wmi: %d\n", ret);
+		ath11k_err(ab, "failed to attach wmi: %d\n", ret);
 		goto err_firmware_stop;
 	}
 
-	ret = ath11k_htc_init(sc);
+	ret = ath11k_htc_init(ab);
 	if (ret) {
-		ath11k_err(sc, "failed to init htc: %d\n", ret);
+		ath11k_err(ab, "failed to init htc: %d\n", ret);
 		goto err_wmi_detach;
 	}
 
-	ret = ath11k_ahb_start(sc);
+	ret = ath11k_ahb_start(ab);
 	if (ret) {
-		ath11k_err(sc, "failed to start HIF: %d\n", ret);
+		ath11k_err(ab, "failed to start HIF: %d\n", ret);
 		goto err_wmi_detach;
 	}
 
-	ret = ath11k_htc_wait_target(&sc->htc);
+	ret = ath11k_htc_wait_target(&ab->htc);
 	if (ret) {
-		ath11k_err(sc, "failed to connect to HTC: %d\n", ret);
+		ath11k_err(ab, "failed to connect to HTC: %d\n", ret);
 		goto err_hif_stop;
 	}
 
-	ret = ath11k_dp_htt_connect(&sc->dp);
+	ret = ath11k_dp_htt_connect(&ab->dp);
 	if (ret) {
-		ath11k_err(sc, "failed to connect to HTT: %d\n", ret);
+		ath11k_err(ab, "failed to connect to HTT: %d\n", ret);
 		goto err_hif_stop;
 	}
 
-	ret = ath11k_wmi_connect(sc);
+	ret = ath11k_wmi_connect(ab);
 	if (ret) {
-		ath11k_err(sc, "failed to connect wmi: %d\n", ret);
+		ath11k_err(ab, "failed to connect wmi: %d\n", ret);
 		goto err_hif_stop;
 	}
 
-	ret = ath11k_htc_start(&sc->htc);
+	ret = ath11k_htc_start(&ab->htc);
 	if (ret) {
-		ath11k_err(sc, "failed to start HTC: %d\n", ret);
+		ath11k_err(ab, "failed to start HTC: %d\n", ret);
 		goto err_hif_stop;
 	}
 
-	ret = ath11k_wmi_wait_for_service_ready(sc);
+	ret = ath11k_wmi_wait_for_service_ready(ab);
 	if (ret) {
-		ath11k_err(sc, "failed to receive wmi service ready event: %d\n",
+		ath11k_err(ab, "failed to receive wmi service ready event: %d\n",
 			   ret);
 		goto err_hif_stop;
 	}
 
-	ret = ath11k_wmi_cmd_init(sc);
+	ret = ath11k_wmi_cmd_init(ab);
 	if (ret) {
-		ath11k_err(sc, "failed to send wmi init cmd: %d\n", ret);
+		ath11k_err(ab, "failed to send wmi init cmd: %d\n", ret);
 		goto err_hif_stop;
 	}
 
-	ret = ath11k_wmi_wait_for_unified_ready(sc);
+	ret = ath11k_wmi_wait_for_unified_ready(ab);
 	if (ret) {
-		ath11k_err(sc, "failed to receive wmi unified ready event: %d\n",
+		ath11k_err(ab, "failed to receive wmi unified ready event: %d\n",
 			   ret);
 		goto err_hif_stop;
 	}
 
-	ret = ath11k_dp_tx_htt_h2t_ver_req_msg(sc);
+	ret = ath11k_dp_tx_htt_h2t_ver_req_msg(ab);
 	if (ret) {
-		ath11k_err(sc, "failed to send htt version request message: %d\n",
+		ath11k_err(ab, "failed to send htt version request message: %d\n",
 			   ret);
 		goto err_hif_stop;
 	}
@@ -485,11 +485,11 @@ static int ath11k_core_start(struct ath11k_base *sc,
 	return 0;
 
 err_hif_stop:
-	ath11k_ahb_stop(sc);
+	ath11k_ahb_stop(ab);
 err_wmi_detach:
-	ath11k_wmi_detach(sc);
+	ath11k_wmi_detach(ab);
 err_firmware_stop:
-	ath11k_qmi_firmware_stop(sc);
+	ath11k_qmi_firmware_stop(ab);
 
 	return ret;
 }
@@ -534,44 +534,44 @@ int ath11k_core_qmi_firmware_ready(struct ath11k_base *ab)
 	return ret;
 }
 
-static int ath11k_core_reconfigure_on_crash(struct ath11k_base *sc)
+static int ath11k_core_reconfigure_on_crash(struct ath11k_base *ab)
 {
 	int ret;
 
-	mutex_lock(&sc->core_lock);
-	ath11k_ahb_ext_irq_disable(sc);
-	ath11k_dp_pdev_free(sc);
-	ath11k_ahb_stop(sc);
-	ath11k_wmi_detach(sc);
-	mutex_unlock(&sc->core_lock);
+	mutex_lock(&ab->core_lock);
+	ath11k_ahb_ext_irq_disable(ab);
+	ath11k_dp_pdev_free(ab);
+	ath11k_ahb_stop(ab);
+	ath11k_wmi_detach(ab);
+	mutex_unlock(&ab->core_lock);
 
-	ath11k_dp_free(sc);
-	ath11k_hal_srng_deinit(sc);
+	ath11k_dp_free(ab);
+	ath11k_hal_srng_deinit(ab);
 
-	sc->free_vdev_map = (1LL << (sc->num_radios * TARGET_NUM_VDEVS)) - 1;
+	ab->free_vdev_map = (1LL << (ab->num_radios * TARGET_NUM_VDEVS)) - 1;
 
-	ret = ath11k_hal_srng_init(sc);
+	ret = ath11k_hal_srng_init(ab);
 	if (ret)
 		return ret;
 
-	clear_bit(ATH11K_FLAG_CRASH_FLUSH, &sc->dev_flags);
+	clear_bit(ATH11K_FLAG_CRASH_FLUSH, &ab->dev_flags);
 
-	ret = ath11k_core_qmi_firmware_ready(sc);
+	ret = ath11k_core_qmi_firmware_ready(ab);
 	if (ret)
 		goto err_hal_srng_deinit;
 
-	clear_bit(ATH11K_FLAG_RECOVERY, &sc->dev_flags);
+	clear_bit(ATH11K_FLAG_RECOVERY, &ab->dev_flags);
 
 	return 0;
 
 err_hal_srng_deinit:
-	ath11k_hal_srng_deinit(sc);
+	ath11k_hal_srng_deinit(ab);
 	return ret;
 }
 
 void ath11k_core_halt(struct ath11k *ar)
 {
-	struct ath11k_base *sc = ar->ab;
+	struct ath11k_base *ab = ar->ab;
 
 	lockdep_assert_held(&ar->conf_mutex);
 
@@ -582,7 +582,7 @@ void ath11k_core_halt(struct ath11k *ar)
 	cancel_delayed_work_sync(&ar->scan.timeout);
 	cancel_work_sync(&ar->regd_update_work);
 
-	rcu_assign_pointer(sc->pdevs_active[ar->pdev_idx], NULL);
+	rcu_assign_pointer(ab->pdevs_active[ar->pdev_idx], NULL);
 	synchronize_rcu();
 	INIT_LIST_HEAD(&ar->arvifs);
 	idr_init(&ar->txmgmt_idr);
@@ -590,17 +590,17 @@ void ath11k_core_halt(struct ath11k *ar)
 
 static void ath11k_core_restart(struct work_struct *work)
 {
-	struct ath11k_base *sc = container_of(work, struct ath11k_base, restart_work);
+	struct ath11k_base *ab = container_of(work, struct ath11k_base, restart_work);
 	struct ath11k *ar;
 	struct ath11k_pdev *pdev;
 	int i, ret = 0;
 
-	spin_lock_bh(&sc->base_lock);
-	sc->stats.fw_crash_counter++;
-	spin_unlock_bh(&sc->base_lock);
+	spin_lock_bh(&ab->base_lock);
+	ab->stats.fw_crash_counter++;
+	spin_unlock_bh(&ab->base_lock);
 
-	for (i = 0; i < sc->num_radios; i++) {
-		pdev = &sc->pdevs[i];
+	for (i = 0; i < ab->num_radios; i++) {
+		pdev = &ab->pdevs[i];
 		ar = pdev->ar;
 		if (!ar || ar->state == ATH11K_STATE_OFF)
 			continue;
@@ -620,17 +620,17 @@ static void ath11k_core_restart(struct work_struct *work)
 		idr_destroy(&ar->txmgmt_idr);
 	}
 
-	wake_up(&sc->wmi_sc.tx_credits_wq);
-	wake_up(&sc->peer_mapping_wq);
+	wake_up(&ab->wmi_sc.tx_credits_wq);
+	wake_up(&ab->peer_mapping_wq);
 
-	ret = ath11k_core_reconfigure_on_crash(sc);
+	ret = ath11k_core_reconfigure_on_crash(ab);
 	if (ret) {
-		ath11k_err(sc, "failed to reconfigure driver on crash recovery\n");
+		ath11k_err(ab, "failed to reconfigure driver on crash recovery\n");
 		return;
 	}
 
-	for (i = 0; i < sc->num_radios; i++) {
-		pdev = &sc->pdevs[i];
+	for (i = 0; i < ab->num_radios; i++) {
+		pdev = &ab->pdevs[i];
 		ar = pdev->ar;
 		if (!ar || ar->state == ATH11K_STATE_OFF)
 			continue;
@@ -644,7 +644,7 @@ static void ath11k_core_restart(struct work_struct *work)
 			ieee80211_restart_hw(ar->hw);
 			break;
 		case ATH11K_STATE_OFF:
-			ath11k_warn(sc,
+			ath11k_warn(ab,
 				    "cannot restart radio %d that hasn't been started\n",
 				    i);
 			break;
@@ -654,91 +654,91 @@ static void ath11k_core_restart(struct work_struct *work)
 			ar->state = ATH11K_STATE_WEDGED;
 			/* fall through */
 		case ATH11K_STATE_WEDGED:
-			ath11k_warn(sc,
+			ath11k_warn(ab,
 				    "device is wedged, will not restart radio %d\n", i);
 			break;
 		}
 		mutex_unlock(&ar->conf_mutex);
 	}
-	complete(&sc->driver_recovery);
+	complete(&ab->driver_recovery);
 }
 
-int ath11k_core_init(struct ath11k_base *sc)
+int ath11k_core_init(struct ath11k_base *ab)
 {
-	struct device *dev = sc->dev;
+	struct device *dev = ab->dev;
 	struct rproc *prproc;
 	phandle rproc_phandle;
 	int ret;
 
 	if (of_property_read_u32(dev->of_node, "qcom,rproc", &rproc_phandle)) {
-		ath11k_err(sc, "failed to get q6_rproc handle\n");
+		ath11k_err(ab, "failed to get q6_rproc handle\n");
 		return -ENOENT;
 	}
 
 	prproc = rproc_get_by_phandle(rproc_phandle);
 	if (!prproc) {
-		ath11k_err(sc, "failed to get rproc\n");
+		ath11k_err(ab, "failed to get rproc\n");
 		return -EINVAL;
 	}
-	sc->tgt_rproc = prproc;
-	sc->hw_params = ath11k_hw_params;
+	ab->tgt_rproc = prproc;
+	ab->hw_params = ath11k_hw_params;
 
-	ret = ath11k_core_soc_create(sc);
+	ret = ath11k_core_soc_create(ab);
 	if (ret) {
-		ath11k_err(sc, "failed to create soc core: %d\n", ret);
+		ath11k_err(ab, "failed to create soc core: %d\n", ret);
 		return ret;
 	}
 
 	return 0;
 }
 
-void ath11k_core_deinit(struct ath11k_base *sc)
+void ath11k_core_deinit(struct ath11k_base *ab)
 {
-	mutex_lock(&sc->core_lock);
+	mutex_lock(&ab->core_lock);
 
-	ath11k_core_pdev_destroy(sc);
-	ath11k_core_stop(sc);
+	ath11k_core_pdev_destroy(ab);
+	ath11k_core_stop(ab);
 
-	mutex_unlock(&sc->core_lock);
+	mutex_unlock(&ab->core_lock);
 
-	ath11k_ahb_power_down(sc);
-	ath11k_mac_destroy(sc);
-	ath11k_core_soc_destroy(sc);
+	ath11k_ahb_power_down(ab);
+	ath11k_mac_destroy(ab);
+	ath11k_core_soc_destroy(ab);
 }
 
-void ath11k_core_free(struct ath11k_base *sc)
+void ath11k_core_free(struct ath11k_base *ab)
 {
-	kfree(sc);
+	kfree(ab);
 }
 
 struct ath11k_base *ath11k_core_alloc(struct device *dev)
 {
-	struct ath11k_base *sc;
+	struct ath11k_base *ab;
 
-	sc = kzalloc(sizeof(*sc), GFP_KERNEL);
-	if (!sc)
+	ab = kzalloc(sizeof(*ab), GFP_KERNEL);
+	if (!ab)
 		return NULL;
 
-	init_completion(&sc->driver_recovery);
+	init_completion(&ab->driver_recovery);
 
-	sc->workqueue = create_singlethread_workqueue("ath11k_wq");
-	if (!sc->workqueue)
+	ab->workqueue = create_singlethread_workqueue("ath11k_wq");
+	if (!ab->workqueue)
 		goto err_sc_free;
 
-	mutex_init(&sc->core_lock);
-	spin_lock_init(&sc->base_lock);
+	mutex_init(&ab->core_lock);
+	spin_lock_init(&ab->base_lock);
 
-	INIT_LIST_HEAD(&sc->peers);
-	init_waitqueue_head(&sc->peer_mapping_wq);
-	init_waitqueue_head(&sc->wmi_sc.tx_credits_wq);
-	INIT_WORK(&sc->restart_work, ath11k_core_restart);
-	timer_setup(&sc->rx_replenish_retry, ath11k_ce_rx_replenish_retry, 0);
-	sc->dev = dev;
+	INIT_LIST_HEAD(&ab->peers);
+	init_waitqueue_head(&ab->peer_mapping_wq);
+	init_waitqueue_head(&ab->wmi_sc.tx_credits_wq);
+	INIT_WORK(&ab->restart_work, ath11k_core_restart);
+	timer_setup(&ab->rx_replenish_retry, ath11k_ce_rx_replenish_retry, 0);
+	ab->dev = dev;
 
-	return sc;
+	return ab;
 
 err_sc_free:
-	kfree(sc);
+	kfree(ab);
 	return NULL;
 }
 
-- 
2.21.0


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
