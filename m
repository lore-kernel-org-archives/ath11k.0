Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C726C433EF
	for <ath11k@archiver.kernel.org>; Mon, 29 Nov 2021 10:46:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=YNJqGiPS0XT1FlnFKxUiWjIapQYufKKAdyIMD5cPUMk=; b=zIanCrjjMzWZjM
	6scPJAGn/4kCHOo35xAhps7Km6MSGzsVnpuY5ir8f3LziY8tss+6O4f1Yf2okwNUUUkon/MpZaa7O
	KtxqQR+d/s+OPUAQPfY803UgQmXS4Avd6lVlBLNgl0NSLb0/fjyTTzvteWF5hAWQsPMIav71e1yan
	2Bo45r3KYdQyP/wH2z0f0svjkGCg39uadpye7yq+DmcH0vWxT5YRs59lqSflGtkYzU1YYFvPvcYcV
	4fq0gUi22U5D5V7j1789Q4mnHF0az6OuWWDMWi65xX4xV7vbC2UeFThlLgXxn2uyRv/qzGO958MxI
	QAA//J2gmP+S4cWoz3Ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mreAo-000Rd1-9r; Mon, 29 Nov 2021 10:46:14 +0000
Received: from alexa-out.qualcomm.com ([129.46.98.28])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mreAl-000RcC-GE
 for ath11k@lists.infradead.org; Mon, 29 Nov 2021 10:46:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1638182771; x=1669718771;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=xQfZW3W2SqB9B/GUUGAEVORZfsPc106MbuUl7YPBwH4=;
 b=Nc9VgAL223HbZZe8pkGj+1t/l7hSBFppiScBgpqJzlUaeJspOob79JoG
 L5oqRb0hI/+hTOqAy2ZcYrglsiQo82yuM7s8BkIqfEO/a8H09kuqKClgF
 nnH8QzFSvaWjN2B+Ltj+ghOGsCzK7dTuRkiu8EEqSn55Ybr95UTCb3IW+ 8=;
Received: from ironmsg07-lv.qualcomm.com ([10.47.202.151])
 by alexa-out.qualcomm.com with ESMTP; 29 Nov 2021 02:46:11 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg07-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2021 02:46:10 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Mon, 29 Nov 2021 02:46:10 -0800
Received: from seevalam-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Mon, 29 Nov 2021 02:46:08 -0800
From: Seevalamuthu Mariappan <quic_seevalam@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, Seevalamuthu Mariappan
 <quic_seevalam@quicinc.com>
Subject: [PATCH] ath11k: Fix QMI file type enum value
Date: Mon, 29 Nov 2021 16:15:54 +0530
Message-ID: <1638182754-18408-1-git-send-email-quic_seevalam@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211129_024611_645769_CCAAAFC3 
X-CRM114-Status: UNSURE (   9.82  )
X-CRM114-Notice: Please train this message.
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

bdf_type for caldata in QMI_WLANFW_BDF_DOWNLOAD_REQ_V01 is wrongly
sent as 1. But, expected bdf_type value for caldata and EEPROM is 2 and 3
respectively. It leads to firmware crash. Fix ath11k_qmi_file_type enum
values.

Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.5.0.1-01100-QCAHKSWPL_SILICONZ-1
Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.4.0.1-00192-QCAHKSWPL_SILICONZ-1

Fixes: 336e7b53c82f ("ath11k: clean up BDF download functions")
Signed-off-by: Seevalamuthu Mariappan <quic_seevalam@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/qmi.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/qmi.h b/drivers/net/wireless/ath/ath11k/qmi.h
index 3bb0f9e..d9e95b7 100644
--- a/drivers/net/wireless/ath/ath11k/qmi.h
+++ b/drivers/net/wireless/ath/ath11k/qmi.h
@@ -41,7 +41,7 @@ struct ath11k_base;
 
 enum ath11k_qmi_file_type {
 	ATH11K_QMI_FILE_TYPE_BDF_GOLDEN,
-	ATH11K_QMI_FILE_TYPE_CALDATA,
+	ATH11K_QMI_FILE_TYPE_CALDATA = 2,
 	ATH11K_QMI_FILE_TYPE_EEPROM,
 	ATH11K_QMI_MAX_FILE_TYPE,
 };
-- 
2.7.4


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
