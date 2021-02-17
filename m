Return-Path: <SRS0=IuQG=HT=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25551C433E6
	for <ath11k@archiver.kernel.org>; Wed, 17 Feb 2021 13:44:05 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A727464E45
	for <ath11k@archiver.kernel.org>; Wed, 17 Feb 2021 13:44:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A727464E45
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=EY2vPD5pocBnlg9OrwlFUG+qEQZo2ZJiNbaBHqbwKXk=; b=MP0snGnCzhS9+Igx5qIlY65/tP
	ClrAnPBBYQq4c88L4A+IHdHD1rb+OUe1bUvfyd/magkaPNu5qFBaNGeXMBwfWfrwa0T/k+Nlst9ZY
	Cswo6iv289yHgSlWYdfSsH3+e80kFoen78W8CrKysyykz0/2xlSwuFQ0BvTWhQJaJ2ws5S0LtPE52
	jIpaPiRqXcehf8y87gXsocSP2yv/a3xFGj4Icvn31Xi51onEQxX8e/uZMANbCvRIP3WvwhwvwPq3u
	pM7KM+jsncTZROOjkPVvpToS6C+WyBq89jfPLIKGsGkx5YcKzD1QlSnp1TX5rIMxJSybOD1fyzwv/
	LzAIeokA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lCN7Z-0006bu-AH; Wed, 17 Feb 2021 13:44:01 +0000
Received: from m42-2.mailgun.net ([69.72.42.2])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lCN7V-0006ai-Hq
 for ath11k@lists.infradead.org; Wed, 17 Feb 2021 13:43:59 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1613569438; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=3CyA+S571AxJykjGmJEqYPdxCJUqFk+N+fLxYUZPVac=;
 b=qD7N9ivQ2yyGc1A71uJtEvFwK1yysnXh7766akfzHo/qu2GuegFsLKZUM0adY5A8KGunrOSc
 a1IZk5RFT0tfvYhaL3pTFt49Q2KAMU/g8XDmOxFomp0GDQdTjJ0lq6q5vfWlRgkuv4A7JMbo
 pKBr2Ik0zrt8SHU32KnCwuDqPcc=
X-Mailgun-Sending-Ip: 69.72.42.2
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 602d1d9270933e9467292a17 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 17 Feb 2021 13:43:46
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id AF423C43461; Wed, 17 Feb 2021 13:43:45 +0000 (UTC)
Received: from potku.adurom.net (88-114-240-156.elisa-laajakaista.fi
 [88.114.240.156])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 3B22DC433ED;
 Wed, 17 Feb 2021 13:43:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 3B22DC433ED
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=kvalo@codeaurora.org
From: Kalle Valo <kvalo@codeaurora.org>
To: ath11k@lists.infradead.org
Subject: [PATCH 1/2] ath11k: qmi: add more debug messages
Date: Wed, 17 Feb 2021 15:43:40 +0200
Message-Id: <1613569421-14177-1-git-send-email-kvalo@codeaurora.org>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210217_084358_901121_3B6A11E2 
X-CRM114-Status: GOOD (  11.49  )
X-BeenThere: ath11k@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Cc: linux-wireless@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

To make it easier to follow the qmi event flow.

No functional changes, compile tested only.

Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/qmi.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/qmi.c b/drivers/net/wireless/ath/ath11k/qmi.c
index eb1b987c9df2..69eb67a94f47 100644
--- a/drivers/net/wireless/ath/ath11k/qmi.c
+++ b/drivers/net/wireless/ath/ath11k/qmi.c
@@ -1556,6 +1556,8 @@ static int ath11k_qmi_host_cap_send(struct ath11k_base *ab)
 		req.nm_modem |= SLEEP_CLOCK_SELECT_INTERNAL_BIT;
 	}
 
+	ath11k_dbg(ab, ATH11K_DBG_QMI, "qmi host cap request\n");
+
 	ret = qmi_txn_init(&ab->qmi.handle, &txn,
 			   qmi_wlanfw_host_cap_resp_msg_v01_ei, &resp);
 	if (ret < 0)
@@ -1624,6 +1626,8 @@ static int ath11k_qmi_fw_ind_register_send(struct ath11k_base *ab)
 	if (ret < 0)
 		goto out;
 
+	ath11k_dbg(ab, ATH11K_DBG_QMI, "qmi indication register request\n");
+
 	ret = qmi_send_request(&ab->qmi.handle, NULL, &txn,
 			       QMI_WLANFW_IND_REGISTER_REQ_V01,
 			       QMI_WLANFW_IND_REGISTER_REQ_MSG_V01_MAX_LEN,
@@ -1699,6 +1703,9 @@ static int ath11k_qmi_respond_fw_mem_request(struct ath11k_base *ab)
 	if (ret < 0)
 		goto out;
 
+	ath11k_dbg(ab, ATH11K_DBG_QMI, "qmi respond memory request delayed %i\n",
+		   delayed);
+
 	ret = qmi_send_request(&ab->qmi.handle, NULL, &txn,
 			       QMI_WLANFW_RESPOND_MEM_REQ_V01,
 			       QMI_WLANFW_RESPOND_MEM_REQ_MSG_V01_MAX_LEN,
@@ -1843,6 +1850,8 @@ static int ath11k_qmi_request_target_cap(struct ath11k_base *ab)
 	if (ret < 0)
 		goto out;
 
+	ath11k_dbg(ab, ATH11K_DBG_QMI, "qmi target cap request\n");
+
 	ret = qmi_send_request(&ab->qmi.handle, NULL, &txn,
 			       QMI_WLANFW_CAP_REQ_V01,
 			       QMI_WLANFW_CAP_REQ_MSG_V01_MAX_LEN,
@@ -2000,6 +2009,9 @@ static int ath11k_qmi_load_bdf_fixed_addr(struct ath11k_base *ab)
 		if (ret < 0)
 			goto out_qmi_bdf;
 
+		ath11k_dbg(ab, ATH11K_DBG_QMI, "qmi bdf download req fixed addr type %d\n",
+			   type);
+
 		ret = qmi_send_request(&ab->qmi.handle, NULL, &txn,
 				       QMI_WLANFW_BDF_DOWNLOAD_REQ_V01,
 				       QMI_WLANFW_BDF_DOWNLOAD_REQ_MSG_V01_MAX_LEN,
@@ -2090,6 +2102,9 @@ static int ath11k_qmi_load_bdf_qmi(struct ath11k_base *ab)
 		if (ret < 0)
 			goto out_qmi_bdf;
 
+		ath11k_dbg(ab, ATH11K_DBG_QMI, "qmi bdf download request remaining %i\n",
+			   remaining);
+
 		ret = qmi_send_request(&ab->qmi.handle, NULL, &txn,
 				       QMI_WLANFW_BDF_DOWNLOAD_REQ_V01,
 				       QMI_WLANFW_BDF_DOWNLOAD_REQ_MSG_V01_MAX_LEN,
@@ -2200,6 +2215,8 @@ static int ath11k_qmi_wlanfw_m3_info_send(struct ath11k_base *ab)
 	if (ret < 0)
 		goto out;
 
+	ath11k_dbg(ab, ATH11K_DBG_QMI, "qmi m3 info req\n");
+
 	ret = qmi_send_request(&ab->qmi.handle, NULL, &txn,
 			       QMI_WLANFW_M3_INFO_REQ_V01,
 			       QMI_WLANFW_M3_INFO_REQ_MSG_V01_MAX_MSG_LEN,
@@ -2246,6 +2263,8 @@ static int ath11k_qmi_wlanfw_mode_send(struct ath11k_base *ab,
 	if (ret < 0)
 		goto out;
 
+	ath11k_dbg(ab, ATH11K_DBG_QMI, "qmi wlan mode req mode %d\n", mode);
+
 	ret = qmi_send_request(&ab->qmi.handle, NULL, &txn,
 			       QMI_WLANFW_WLAN_MODE_REQ_V01,
 			       QMI_WLANFW_WLAN_MODE_REQ_MSG_V01_MAX_LEN,
@@ -2338,6 +2357,8 @@ static int ath11k_qmi_wlanfw_wlan_cfg_send(struct ath11k_base *ab)
 	if (ret < 0)
 		goto out;
 
+	ath11k_dbg(ab, ATH11K_DBG_QMI, "qmi wlan cfg req\n");
+
 	ret = qmi_send_request(&ab->qmi.handle, NULL, &txn,
 			       QMI_WLANFW_WLAN_CFG_REQ_V01,
 			       QMI_WLANFW_WLAN_CFG_REQ_MSG_V01_MAX_LEN,
@@ -2370,6 +2391,8 @@ void ath11k_qmi_firmware_stop(struct ath11k_base *ab)
 {
 	int ret;
 
+	ath11k_dbg(ab, ATH11K_DBG_QMI, "qmi firmware stop\n");
+
 	ret = ath11k_qmi_wlanfw_mode_send(ab, ATH11K_FIRMWARE_MODE_OFF);
 	if (ret < 0) {
 		ath11k_warn(ab, "qmi failed to send wlan mode off\n");
@@ -2382,6 +2405,8 @@ int ath11k_qmi_firmware_start(struct ath11k_base *ab,
 {
 	int ret;
 
+	ath11k_dbg(ab, ATH11K_DBG_QMI, "qmi firmware start\n");
+
 	ret = ath11k_qmi_wlanfw_wlan_cfg_send(ab);
 	if (ret < 0) {
 		ath11k_warn(ab, "qmi failed to send wlan cfg:%d\n", ret);
-- 
2.7.4


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
