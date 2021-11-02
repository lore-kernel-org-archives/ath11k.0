Return-Path: <SRS0=OGZV=PV=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C49BC433EF
	for <ath11k@archiver.kernel.org>; Tue,  2 Nov 2021 13:05:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1CD31610A0
	for <ath11k@archiver.kernel.org>; Tue,  2 Nov 2021 13:05:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1CD31610A0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=apoRwF61POdumrzBD/DcK+dtzn+pkgUTxztjxtV1g18=; b=YWuUvL0mOcfVba
	c000UzLP9DXNoYj6Bcf56S5LOalIFMjL8/yDY8qT5ahzrkIMyLEOdicvMAADntd/ZzEr41tklpSpM
	1/H+/cXncVtaTpIFYmYz3FPJehqMuIYJUZp5MvqgH+n8wVWTpzPFXFdSJwqeHK1O5LMGkM1oC2s/6
	HsJ+gS5AgLYfE/SfrBYnP94L8kGShQUWxq0ihCDv8USh2GENNd+tW7NyWkzvMocGAOBkn6QP7Kmc+
	5iDVUMOPNf92QJdic7n1kEKU2gijeh7ccQszDnxW+Uu3eYxdgtioHrgmlxhpuezSUY8MXv8PwIbPl
	a6ts4erK7nSd5xN9pMPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mhtTo-001jr7-V7; Tue, 02 Nov 2021 13:05:32 +0000
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mhtTl-001jp8-TF
 for ath11k@lists.infradead.org; Tue, 02 Nov 2021 13:05:31 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1635858319; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=FYzOHkUt1Vz+16Uiiff9OxZlCKsF7IvoMoPXgSsMOgw=;
 b=gLw28XgCGWEuP3aq97Y8SaNrUNQaTjmw6oWdKqc/gYnHo+om7CDF77WFovcus6G6syZXsSKl
 LrzXCAMEj5gCA3fPlsXi2nfsN/OrCqmSHc3PdF23qnMuVHKW+LIuX9CfVJPmHIcZAiMQSKLN
 040tcT3458ms0GaZCoetAM1nafA=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 618134abaeb2390556454015 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 02 Nov 2021 12:52:59
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id C55FFC43460; Tue,  2 Nov 2021 12:52:58 +0000 (UTC)
Received: from akolli-linux.qualcomm.com
 (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: akolli)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id A6C62C4338F;
 Tue,  2 Nov 2021 12:52:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org A6C62C4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
From: Anilkumar Kolli <akolli@codeaurora.org>
To: ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
	Anilkumar Kolli <akolli@codeaurora.org>
Subject: [PATCH] ath11k: Add missing qmi_txn_cancel()
Date: Tue,  2 Nov 2021 18:22:38 +0530
Message-Id: <1635857558-21733-1-git-send-email-akolli@codeaurora.org>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211102_060530_040413_8541F125 
X-CRM114-Status: GOOD (  11.55  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Currently many functions do not follow this guidance when
qmi_send_request() fails, therefore add missing
qmi_txn_cancel() in the qmi_send_request() error path.

Also remove initialization on 'struct qmi_txn'
since qmi_tx_init() performs all necessary initialization.

Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.4.0.1-01838-QCAHKSWPL_SILICONZ-1

Signed-off-by: Anilkumar Kolli <akolli@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/qmi.c | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/qmi.c b/drivers/net/wireless/ath/ath11k/qmi.c
index fa73118de6db..25eb22cbeaeb 100644
--- a/drivers/net/wireless/ath/ath11k/qmi.c
+++ b/drivers/net/wireless/ath/ath11k/qmi.c
@@ -1586,7 +1586,7 @@ static int ath11k_qmi_host_cap_send(struct ath11k_base *ab)
 {
 	struct qmi_wlanfw_host_cap_req_msg_v01 req;
 	struct qmi_wlanfw_host_cap_resp_msg_v01 resp;
-	struct qmi_txn txn = {};
+	struct qmi_txn txn;
 	int ret = 0;
 
 	memset(&req, 0, sizeof(req));
@@ -1640,6 +1640,7 @@ static int ath11k_qmi_host_cap_send(struct ath11k_base *ab)
 			       QMI_WLANFW_HOST_CAP_REQ_MSG_V01_MAX_LEN,
 			       qmi_wlanfw_host_cap_req_msg_v01_ei, &req);
 	if (ret < 0) {
+		qmi_txn_cancel(&txn);
 		ath11k_warn(ab, "failed to send host capability request: %d\n", ret);
 		goto out;
 	}
@@ -1705,6 +1706,7 @@ static int ath11k_qmi_fw_ind_register_send(struct ath11k_base *ab)
 			       QMI_WLANFW_IND_REGISTER_REQ_MSG_V01_MAX_LEN,
 			       qmi_wlanfw_ind_register_req_msg_v01_ei, req);
 	if (ret < 0) {
+		qmi_txn_cancel(&txn);
 		ath11k_warn(ab, "failed to send indication register request: %d\n",
 			    ret);
 		goto out;
@@ -1734,7 +1736,7 @@ static int ath11k_qmi_respond_fw_mem_request(struct ath11k_base *ab)
 {
 	struct qmi_wlanfw_respond_mem_req_msg_v01 *req;
 	struct qmi_wlanfw_respond_mem_resp_msg_v01 resp;
-	struct qmi_txn txn = {};
+	struct qmi_txn txn;
 	int ret = 0, i;
 	bool delayed;
 
@@ -1783,6 +1785,7 @@ static int ath11k_qmi_respond_fw_mem_request(struct ath11k_base *ab)
 			       QMI_WLANFW_RESPOND_MEM_REQ_MSG_V01_MAX_LEN,
 			       qmi_wlanfw_respond_mem_req_msg_v01_ei, req);
 	if (ret < 0) {
+		qmi_txn_cancel(&txn);
 		ath11k_warn(ab, "failed to respond qmi memory request: %d\n",
 			    ret);
 		goto out;
@@ -1911,7 +1914,7 @@ static int ath11k_qmi_request_target_cap(struct ath11k_base *ab)
 {
 	struct qmi_wlanfw_cap_req_msg_v01 req;
 	struct qmi_wlanfw_cap_resp_msg_v01 resp;
-	struct qmi_txn txn = {};
+	struct qmi_txn txn;
 	int ret = 0;
 	int r;
 
@@ -1930,6 +1933,7 @@ static int ath11k_qmi_request_target_cap(struct ath11k_base *ab)
 			       QMI_WLANFW_CAP_REQ_MSG_V01_MAX_LEN,
 			       qmi_wlanfw_cap_req_msg_v01_ei, &req);
 	if (ret < 0) {
+		qmi_txn_cancel(&txn);
 		ath11k_warn(ab, "failed to send qmi cap request: %d\n",
 			    ret);
 		goto out;
@@ -2000,7 +2004,7 @@ static int ath11k_qmi_load_file_target_mem(struct ath11k_base *ab,
 {
 	struct qmi_wlanfw_bdf_download_req_msg_v01 *req;
 	struct qmi_wlanfw_bdf_download_resp_msg_v01 resp;
-	struct qmi_txn txn = {};
+	struct qmi_txn txn;
 	const u8 *temp = data;
 	void __iomem *bdf_addr = NULL;
 	int ret;
@@ -2245,7 +2249,7 @@ static int ath11k_qmi_wlanfw_m3_info_send(struct ath11k_base *ab)
 	struct m3_mem_region *m3_mem = &ab->qmi.m3_mem;
 	struct qmi_wlanfw_m3_info_req_msg_v01 req;
 	struct qmi_wlanfw_m3_info_resp_msg_v01 resp;
-	struct qmi_txn txn = {};
+	struct qmi_txn txn;
 	int ret = 0;
 
 	memset(&req, 0, sizeof(req));
@@ -2277,6 +2281,7 @@ static int ath11k_qmi_wlanfw_m3_info_send(struct ath11k_base *ab)
 			       QMI_WLANFW_M3_INFO_REQ_MSG_V01_MAX_MSG_LEN,
 			       qmi_wlanfw_m3_info_req_msg_v01_ei, &req);
 	if (ret < 0) {
+		qmi_txn_cancel(&txn);
 		ath11k_warn(ab, "failed to send m3 information request: %d\n",
 			    ret);
 		goto out;
@@ -2303,7 +2308,7 @@ static int ath11k_qmi_wlanfw_mode_send(struct ath11k_base *ab,
 {
 	struct qmi_wlanfw_wlan_mode_req_msg_v01 req;
 	struct qmi_wlanfw_wlan_mode_resp_msg_v01 resp;
-	struct qmi_txn txn = {};
+	struct qmi_txn txn;
 	int ret = 0;
 
 	memset(&req, 0, sizeof(req));
@@ -2325,6 +2330,7 @@ static int ath11k_qmi_wlanfw_mode_send(struct ath11k_base *ab,
 			       QMI_WLANFW_WLAN_MODE_REQ_MSG_V01_MAX_LEN,
 			       qmi_wlanfw_wlan_mode_req_msg_v01_ei, &req);
 	if (ret < 0) {
+		qmi_txn_cancel(&txn);
 		ath11k_warn(ab, "failed to send wlan mode request (mode %d): %d\n",
 			    mode, ret);
 		goto out;
@@ -2358,7 +2364,7 @@ static int ath11k_qmi_wlanfw_wlan_cfg_send(struct ath11k_base *ab)
 	struct qmi_wlanfw_wlan_cfg_resp_msg_v01 resp;
 	struct ce_pipe_config *ce_cfg;
 	struct service_to_pipe *svc_cfg;
-	struct qmi_txn txn = {};
+	struct qmi_txn txn;
 	int ret = 0, pipe_num;
 
 	ce_cfg	= (struct ce_pipe_config *)ab->qmi.ce_cfg.tgt_ce;
@@ -2419,6 +2425,7 @@ static int ath11k_qmi_wlanfw_wlan_cfg_send(struct ath11k_base *ab)
 			       QMI_WLANFW_WLAN_CFG_REQ_MSG_V01_MAX_LEN,
 			       qmi_wlanfw_wlan_cfg_req_msg_v01_ei, req);
 	if (ret < 0) {
+		qmi_txn_cancel(&txn);
 		ath11k_warn(ab, "failed to send wlan config request: %d\n",
 			    ret);
 		goto out;
-- 
2.7.4


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
