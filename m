Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E199AC433F5
	for <ath11k@archiver.kernel.org>; Wed,  9 Mar 2022 11:24:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=FSvanuJn2RSX9aV8s5dyTZoU/HwaRTTgRkd4mgISOIo=; b=J1h59wvBhJqFqv
	30JkpP+2sgDzRnjlxtdQf5HH2dzSHazTCfKbjipMZXitEFBsx4FnuercbLUxDbwhIpzmkIqHXkB/p
	5YMmL62tyS3puZ3rNWJAu46aLNiKdVnaRpMecyfRIIXu25biA0GZ9rulzGpp2ckEg7bFk/igLlFpt
	DUPXG58MrXCrkyUc6+Y+76UfbZlkZJB8Sq8Zb6/ZjIc/DIi8e1b71CaAPpUhjO/89jY4duw6orkkY
	aUotQ+bil4vHsvpYEkhaPogxR63h7uQTqFm5C366C5fzCSnbXO3Zn1fDrgZ4k192Yw7+3b6Hh8XPG
	0g3YKV7DhoUvAH6JmNRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nRuQz-008HO6-8l; Wed, 09 Mar 2022 11:24:49 +0000
Received: from alexa-out.qualcomm.com ([129.46.98.28])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nRuQw-008HN2-7Y
 for ath11k@lists.infradead.org; Wed, 09 Mar 2022 11:24:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1646825086; x=1678361086;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=ehH+Lo/z/nbOf/9EJEdMK+qE8kvy+kJoylFy5ryoBg4=;
 b=aTEvMI83BUhFjuG4QghwJjeariTWGt8BdzGNfBzzIJiavOFTwOfWqBC2
 wb6KKWvIumkjm1Y3IZxsMkp9iRVBgwaMqlonl8n74x5h7uQqsKBh1dNV+
 57Zq6NExfYHmni/N4JBylZJFtrdSXlKZTs/WwtIk3aVI0Ij2FpniPsqB+ E=;
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
 by alexa-out.qualcomm.com with ESMTP; 09 Mar 2022 03:24:44 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg09-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2022 03:24:44 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Wed, 9 Mar 2022 03:24:43 -0800
Received: from haric-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Wed, 9 Mar 2022 03:24:41 -0800
From: <quic_haric@quicinc.com>
To: <quic_kvalo@quicinc.com>
CC: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>, "Hari
 Chandrakanthan" <quic_haric@quicinc.com>
Subject: [PATCH v1] ath11k: change fw build id format in driver init log
Date: Wed, 9 Mar 2022 16:54:25 +0530
Message-ID: <1646825065-7736-1-git-send-email-quic_haric@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220309_032446_351641_0C468D33 
X-CRM114-Status: GOOD (  11.01  )
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

From: Hari Chandrakanthan <quic_haric@quicinc.com>

Currently fw build id is printed during init as follows.

fw_version 0x250684a5 fw_build_timestamp 2021-07-13 10:57
fw_build_id QC_IMAGE_VERSION_STRING=WLAN.HK.2.5.0.1-01100-QCAHKSWPL_SILICONZ-1

The string "QC_IMAGE_VERSION_STRING=" is removed from the log
to improve readability.

With this patch the fw build id is printed during init as follows.
fw_version 0x250684a5 fw_build_timestamp 2021-07-13 10:57
fw_build_id WLAN.HK.2.5.0.1-01100-QCAHKSWPL_SILICONZ-1

Signed-off-by: Hari Chandrakanthan <quic_haric@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/qmi.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/qmi.c b/drivers/net/wireless/ath/ath11k/qmi.c
index b717813..a35cdaf 100644
--- a/drivers/net/wireless/ath/ath11k/qmi.c
+++ b/drivers/net/wireless/ath/ath11k/qmi.c
@@ -14,6 +14,8 @@
 #define SLEEP_CLOCK_SELECT_INTERNAL_BIT	0x02
 #define HOST_CSTATE_BIT			0x04
 
+#define FW_BUILD_ID_MASK "QC_IMAGE_VERSION_STRING="
+
 bool ath11k_cold_boot_cal = 1;
 EXPORT_SYMBOL(ath11k_cold_boot_cal);
 module_param_named(cold_boot_cal, ath11k_cold_boot_cal, bool, 0644);
@@ -1917,6 +1919,8 @@ static int ath11k_qmi_request_target_cap(struct ath11k_base *ab)
 	struct qmi_txn txn;
 	int ret = 0;
 	int r;
+	char *fw_build_id;
+	int fw_build_id_mask_len;
 
 	memset(&req, 0, sizeof(req));
 	memset(&resp, 0, sizeof(resp));
@@ -1982,6 +1986,11 @@ static int ath11k_qmi_request_target_cap(struct ath11k_base *ab)
 		ath11k_dbg(ab, ATH11K_DBG_QMI, "qmi cal data supported from eeprom\n");
 	}
 
+	fw_build_id = ab->qmi.target.fw_build_id;
+	fw_build_id_mask_len = strlen(FW_BUILD_ID_MASK);
+	if (!strncmp(fw_build_id, FW_BUILD_ID_MASK, fw_build_id_mask_len))
+		fw_build_id = fw_build_id + fw_build_id_mask_len;
+
 	ath11k_info(ab, "chip_id 0x%x chip_family 0x%x board_id 0x%x soc_id 0x%x\n",
 		    ab->qmi.target.chip_id, ab->qmi.target.chip_family,
 		    ab->qmi.target.board_id, ab->qmi.target.soc_id);
@@ -1989,7 +1998,7 @@ static int ath11k_qmi_request_target_cap(struct ath11k_base *ab)
 	ath11k_info(ab, "fw_version 0x%x fw_build_timestamp %s fw_build_id %s",
 		    ab->qmi.target.fw_version,
 		    ab->qmi.target.fw_build_timestamp,
-		    ab->qmi.target.fw_build_id);
+		    fw_build_id);
 
 	r = ath11k_core_check_dt(ab);
 	if (r)
-- 
2.7.4


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
