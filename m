Return-Path: <SRS0=H079=MN=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09145C6377A
	for <ath11k@archiver.kernel.org>; Wed, 21 Jul 2021 20:20:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AF93460FF4
	for <ath11k@archiver.kernel.org>; Wed, 21 Jul 2021 20:20:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AF93460FF4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sCFH7/uij4NeL4CBBI3ACE6mGH4uZB77yX/cSn6f0Fs=; b=hJapXPw9VWj1rL
	yCmd6Mdn97preiqJGtshqITuEeq06s1QDGz08bQ8QzAzDW+s90ijK0vVB+FgfX10iP7h0FfAgCTX3
	mbIYFG9i24yjqPgwGU2T91HB8ZI2sjgdGaQdClEr8Hdsdk8fKa3WA9I3q/UjBfOns5vezsUIsUPbW
	pXet6rpvFpn3AJ4g9BNpYFZwVFI6dLu1ERFswfS1eJ/qRtwP572Zuc2vcaBD0bT0NjYSJ/MfoKtJh
	17WtDIrEMYQiZP3t16eCF33rBdgNhCswKol0kCtwuQzPAkykyDDYuB0xcfFZU8AqqZJCkLc1EUrwP
	/DAEUfGZZQgM4ZWJfkWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m6IhJ-00H6Ij-MC; Wed, 21 Jul 2021 20:20:05 +0000
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m6IhF-00H6Fp-LS
 for ath11k@lists.infradead.org; Wed, 21 Jul 2021 20:20:04 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1626898801; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=vNDhPKYvBzCtNNPOR2XZ3gpCiLJsb4B0V4QUEQKrj0A=;
 b=HL0hE95nL1oKMbyAUlAZb1eoE2nyu7gPZ9NTxaZ7IyLuu/4SVLyFsHqA15Ge5rZ0HyZ4HhRV
 MLu/jCzGCcAa+NNqB0OgiEEisoG8oB97+rnlfobAakE1J/vWmPmcwKELDXg4q0AtlfR8FVdH
 yPOXf7rLPtLBOUCRgNGxrCtPIW0=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 60f881714815712f3a9b42b0 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 21 Jul 2021 20:20:00
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 27570C4360C; Wed, 21 Jul 2021 20:20:00 +0000 (UTC)
Received: from jouni.codeaurora.org (85-76-67-217-nat.elisa-mobile.fi
 [85.76.67.217])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: jouni)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 4D087C433F1;
 Wed, 21 Jul 2021 20:19:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 4D087C433F1
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=jouni@codeaurora.org
From: Jouni Malinen <jouni@codeaurora.org>
To: Kalle Valo <kvalo@codeaurora.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 Anilkumar Kolli <akolli@codeaurora.org>,
 Jouni Malinen <jouni@codeaurora.org>
Subject: [PATCH 2/4] ath11k: clean up BDF download functions
Date: Wed, 21 Jul 2021 23:19:25 +0300
Message-Id: <20210721201927.100369-3-jouni@codeaurora.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210721201927.100369-1-jouni@codeaurora.org>
References: <20210721201927.100369-1-jouni@codeaurora.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210721_132002_048361_4CA2456C 
X-CRM114-Status: GOOD (  22.17  )
X-BeenThere: ath11k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
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
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

From: Anilkumar Kolli <akolli@codeaurora.org>

In current code, AHB/PCI uses two separate functions to download
BDF file. Refactor code and make a common function to send QMI BDF
download request for both AHB and PCI devices. This patch has no
functional change.

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.4.0.1-00009-QCAHKSWPL_SILICONZ-1
Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.4.0.1-01838-QCAHKSWPL_SILICONZ-1

Signed-off-by: Anilkumar Kolli <akolli@codeaurora.org>
Signed-off-by: Jouni Malinen <jouni@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/qmi.c | 238 ++++++++++----------------
 1 file changed, 93 insertions(+), 145 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/qmi.c b/drivers/net/wireless/ath/ath11k/qmi.c
index cc82a431c8b7..a24a6647ba52 100644
--- a/drivers/net/wireless/ath/ath11k/qmi.c
+++ b/drivers/net/wireless/ath/ath11k/qmi.c
@@ -1917,98 +1917,71 @@ static int ath11k_qmi_request_target_cap(struct ath11k_base *ab)
 	return ret;
 }
 
-static int
-ath11k_qmi_prepare_bdf_download(struct ath11k_base *ab, int type,
-				struct qmi_wlanfw_bdf_download_req_msg_v01 *req,
-				void __iomem *bdf_addr)
-{
-	const struct firmware *fw_entry;
-	struct ath11k_board_data bd;
-	u32 fw_size;
-	int ret;
-
-	switch (type) {
-	case ATH11K_QMI_FILE_TYPE_BDF_GOLDEN:
-		memset(&bd, 0, sizeof(bd));
-
-		ret = ath11k_core_fetch_bdf(ab, &bd);
-		if (ret) {
-			ath11k_warn(ab, "failed to load board file: %d\n", ret);
-			return ret;
-		}
-
-		fw_size = min_t(u32, ab->hw_params.fw.board_size, bd.len);
-		memcpy_toio(bdf_addr, bd.data, fw_size);
-		ath11k_core_free_bdf(ab, &bd);
-		break;
-	case ATH11K_QMI_FILE_TYPE_CALDATA:
-		fw_entry = ath11k_core_firmware_request(ab, ATH11K_DEFAULT_CAL_FILE);
-		if (IS_ERR(fw_entry)) {
-			ret = PTR_ERR(fw_entry);
-			ath11k_warn(ab, "failed to load %s: %d\n",
-				    ATH11K_DEFAULT_CAL_FILE, ret);
-			return ret;
-		}
-
-		fw_size = min_t(u32, ab->hw_params.fw.board_size,
-				fw_entry->size);
-
-		memcpy_toio(bdf_addr + ab->hw_params.fw.cal_offset,
-			    fw_entry->data, fw_size);
-
-		release_firmware(fw_entry);
-		break;
-	default:
-		return -EINVAL;
-	}
-
-	req->total_size = fw_size;
-	return 0;
-}
-
-static int ath11k_qmi_load_bdf_fixed_addr(struct ath11k_base *ab)
+static int ath11k_qmi_load_file_target_mem(struct ath11k_base *ab,
+					   const u8 *data, u32 len, u8 type)
 {
 	struct qmi_wlanfw_bdf_download_req_msg_v01 *req;
 	struct qmi_wlanfw_bdf_download_resp_msg_v01 resp;
 	struct qmi_txn txn = {};
+	const u8 *temp = data;
 	void __iomem *bdf_addr = NULL;
-	int type, ret;
+	int ret;
+	u32 remaining = len;
 
 	req = kzalloc(sizeof(*req), GFP_KERNEL);
 	if (!req)
 		return -ENOMEM;
 	memset(&resp, 0, sizeof(resp));
 
-	bdf_addr = ioremap(ab->hw_params.bdf_addr, ab->hw_params.fw.board_size);
-	if (!bdf_addr) {
-		ath11k_warn(ab, "failed ioremap for board file\n");
-		ret = -EIO;
-		goto out;
+	if (ab->bus_params.fixed_bdf_addr) {
+		bdf_addr = ioremap(ab->hw_params.bdf_addr, ab->hw_params.fw.board_size);
+		if (!bdf_addr) {
+			ath11k_warn(ab, "qmi ioremap error for BDF\n");
+			ret = -EIO;
+			goto out_req;
+		}
 	}
 
-	for (type = 0; type < ATH11K_QMI_MAX_FILE_TYPE; type++) {
+	while (remaining) {
 		req->valid = 1;
 		req->file_id_valid = 1;
 		req->file_id = ab->qmi.target.board_id;
 		req->total_size_valid = 1;
+		req->total_size = remaining;
 		req->seg_id_valid = 1;
-		req->seg_id = type;
-		req->data_valid = 0;
-		req->data_len = ATH11K_QMI_MAX_BDF_FILE_NAME_SIZE;
-		req->bdf_type = 0;
-		req->bdf_type_valid = 0;
+		req->data_valid = 1;
+		req->bdf_type = type;
+		req->bdf_type_valid = 1;
 		req->end_valid = 1;
-		req->end = 1;
+		req->end = 0;
 
-		ret = ath11k_qmi_prepare_bdf_download(ab, type, req, bdf_addr);
-		if (ret < 0)
-			goto out_qmi_bdf;
+		if (remaining > QMI_WLANFW_MAX_DATA_SIZE_V01) {
+			req->data_len = QMI_WLANFW_MAX_DATA_SIZE_V01;
+		} else {
+			req->data_len = remaining;
+			req->end = 1;
+		}
+
+		if (ab->bus_params.fixed_bdf_addr) {
+			req->data_valid = 0;
+			req->end = 1;
+			req->data_len = ATH11K_QMI_MAX_BDF_FILE_NAME_SIZE;
+		} else {
+			memcpy(req->data, temp, req->data_len);
+		}
+
+		if (ab->bus_params.fixed_bdf_addr) {
+			if (type == ATH11K_QMI_FILE_TYPE_CALDATA)
+				bdf_addr += ab->hw_params.fw.cal_offset;
+
+			memcpy_toio(bdf_addr, temp, len);
+		}
 
 		ret = qmi_txn_init(&ab->qmi.handle, &txn,
 				   qmi_wlanfw_bdf_download_resp_msg_v01_ei,
 				   &resp);
 		if (ret < 0)
-			goto out_qmi_bdf;
+			goto out;
 
 		ath11k_dbg(ab, ATH11K_DBG_QMI, "qmi bdf download req fixed addr type %d\n",
 			   type);
@@ -2019,54 +1992,54 @@ static int ath11k_qmi_load_bdf_fixed_addr(struct ath11k_base *ab)
 				       qmi_wlanfw_bdf_download_req_msg_v01_ei, req);
 		if (ret < 0) {
 			qmi_txn_cancel(&txn);
-			goto out_qmi_bdf;
+			goto out;
 		}
 
 		ret = qmi_txn_wait(&txn, msecs_to_jiffies(ATH11K_QMI_WLANFW_TIMEOUT_MS));
 		if (ret < 0)
-			goto out_qmi_bdf;
+			goto out;
 
 		if (resp.resp.result != QMI_RESULT_SUCCESS_V01) {
 			ath11k_warn(ab, "board file download request failed: %d %d\n",
 				    resp.resp.result, resp.resp.error);
 			ret = -EINVAL;
-			goto out_qmi_bdf;
+			goto out;
+		}
+
+		if (ab->bus_params.fixed_bdf_addr) {
+			remaining = 0;
+		} else {
+			remaining -= req->data_len;
+			temp += req->data_len;
+			req->seg_id++;
+			ath11k_dbg(ab, ATH11K_DBG_QMI, "qmi bdf download request remaining %i\n",
+				   remaining);
 		}
 	}
 
-out_qmi_bdf:
-	iounmap(bdf_addr);
 out:
+	if (ab->bus_params.fixed_bdf_addr)
+		iounmap(bdf_addr);
+out_req:
 	kfree(req);
 	return ret;
 }
 
 static int ath11k_qmi_load_bdf_qmi(struct ath11k_base *ab)
 {
-	struct qmi_wlanfw_bdf_download_req_msg_v01 *req;
-	struct qmi_wlanfw_bdf_download_resp_msg_v01 resp;
+	char filename[ATH11K_QMI_MAX_BDF_FILE_NAME_SIZE];
+	const struct firmware *fw_entry;
 	struct ath11k_board_data bd;
-	unsigned int remaining;
-	struct qmi_txn txn = {};
-	int ret;
-	const u8 *temp;
-	int bdf_type;
-
-	req = kzalloc(sizeof(*req), GFP_KERNEL);
-	if (!req)
-		return -ENOMEM;
-	memset(&resp, 0, sizeof(resp));
+	u32 fw_size, file_type;
+	int ret = 0, bdf_type;
 
 	memset(&bd, 0, sizeof(bd));
 	ret = ath11k_core_fetch_bdf(ab, &bd);
 	if (ret) {
-		ath11k_warn(ab, "failed to fetch board file: %d\n", ret);
+		ath11k_warn(ab, "qmi failed to fetch board file: %d\n", ret);
 		goto out;
 	}
 
-	temp = bd.data;
-	remaining = bd.len;
-
 	if (bd.len >= SELFMAG && memcmp(bd.data, ELFMAG, SELFMAG) == 0)
 		bdf_type = ATH11K_QMI_BDF_TYPE_ELF;
 	else
@@ -2074,67 +2047,45 @@ static int ath11k_qmi_load_bdf_qmi(struct ath11k_base *ab)
 
 	ath11k_dbg(ab, ATH11K_DBG_QMI, "qmi bdf_type %d\n", bdf_type);
 
-	while (remaining) {
-		req->valid = 1;
-		req->file_id_valid = 1;
-		req->file_id = ab->qmi.target.board_id;
-		req->total_size_valid = 1;
-		req->total_size = bd.len;
-		req->seg_id_valid = 1;
-		req->data_valid = 1;
-		req->data_len = ATH11K_QMI_MAX_BDF_FILE_NAME_SIZE;
-		req->bdf_type = bdf_type;
-		req->bdf_type_valid = 1;
-		req->end_valid = 1;
-		req->end = 0;
-
-		if (remaining > QMI_WLANFW_MAX_DATA_SIZE_V01) {
-			req->data_len = QMI_WLANFW_MAX_DATA_SIZE_V01;
-		} else {
-			req->data_len = remaining;
-			req->end = 1;
-		}
-
-		memcpy(req->data, temp, req->data_len);
-
-		ret = qmi_txn_init(&ab->qmi.handle, &txn,
-				   qmi_wlanfw_bdf_download_resp_msg_v01_ei,
-				   &resp);
-		if (ret < 0)
-			goto out_qmi_bdf;
+	fw_size = bd.len;
+	fw_size = min_t(u32, ab->hw_params.fw.board_size, bd.len);
 
-		ath11k_dbg(ab, ATH11K_DBG_QMI, "qmi bdf download request remaining %i\n",
-			   remaining);
+	ret = ath11k_qmi_load_file_target_mem(ab, bd.data, fw_size, bdf_type);
+	if (ret < 0) {
+		ath11k_warn(ab, "qmi failed to load bdf file\n");
+		goto out;
+	}
 
-		ret = qmi_send_request(&ab->qmi.handle, NULL, &txn,
-				       QMI_WLANFW_BDF_DOWNLOAD_REQ_V01,
-				       QMI_WLANFW_BDF_DOWNLOAD_REQ_MSG_V01_MAX_LEN,
-				       qmi_wlanfw_bdf_download_req_msg_v01_ei, req);
-		if (ret < 0) {
-			qmi_txn_cancel(&txn);
-			goto out_qmi_bdf;
-		}
+	/* QCA6390 does not support cal data file, skip it */
+	if (bdf_type == ATH11K_QMI_BDF_TYPE_ELF)
+		goto out;
 
-		ret = qmi_txn_wait(&txn, msecs_to_jiffies(ATH11K_QMI_WLANFW_TIMEOUT_MS));
-		if (ret < 0)
-			goto out_qmi_bdf;
+	file_type = ATH11K_QMI_FILE_TYPE_CALDATA;
+	fw_entry = ath11k_core_firmware_request(ab, ATH11K_DEFAULT_CAL_FILE);
+	if (IS_ERR(fw_entry)) {
+		ret = PTR_ERR(fw_entry);
+		ath11k_warn(ab,
+			    "qmi failed to load CAL data file:%s\n",
+			    filename);
+		goto out;
+	}
 
-		if (resp.resp.result != QMI_RESULT_SUCCESS_V01) {
-			ath11k_warn(ab, "bdf download request failed: %d %d\n",
-				    resp.resp.result, resp.resp.error);
-			ret = resp.resp.result;
-			goto out_qmi_bdf;
-		}
-		remaining -= req->data_len;
-		temp += req->data_len;
-		req->seg_id++;
+	fw_size = min_t(u32, ab->hw_params.fw.board_size, fw_entry->size);
+	ret = ath11k_qmi_load_file_target_mem(ab, fw_entry->data, fw_size, file_type);
+	if (ret < 0) {
+		ath11k_warn(ab, "qmi failed to load caldata\n");
+		goto out_qmi_cal;
 	}
 
-out_qmi_bdf:
-	ath11k_core_free_bdf(ab, &bd);
+	ath11k_dbg(ab, ATH11K_DBG_QMI, "qmi caldata downloaded: type: %u\n",
+		   file_type);
 
+out_qmi_cal:
+	release_firmware(fw_entry);
 out:
-	kfree(req);
+	ath11k_core_free_bdf(ab, &bd);
+	ath11k_dbg(ab, ATH11K_DBG_QMI, "qmi BDF download sequence completed\n");
+
 	return ret;
 }
 
@@ -2519,10 +2470,7 @@ static int ath11k_qmi_event_load_bdf(struct ath11k_qmi *qmi)
 		return ret;
 	}
 
-	if (ab->bus_params.fixed_bdf_addr)
-		ret = ath11k_qmi_load_bdf_fixed_addr(ab);
-	else
-		ret = ath11k_qmi_load_bdf_qmi(ab);
+	ret = ath11k_qmi_load_bdf_qmi(ab);
 	if (ret < 0) {
 		ath11k_warn(ab, "failed to load board data file: %d\n", ret);
 		return ret;
-- 
2.25.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
