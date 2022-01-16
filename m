Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E6B6C433EF
	for <ath11k@archiver.kernel.org>; Sun, 16 Jan 2022 12:48:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hBYISDzEy+aA1aoumqtBCDGnt25sJb4yoKmsY+wjIBA=; b=3o9ogE0QDhrbPX
	jYEcSeuJQNo+RneyjXogB0fh75OHJcFvbeh5Glk5iOsE1bI9am93MIG0x6lKCus9Qy5XtONuiDTZC
	CLkcEbljZY+ZzBRB+kkLFNR0bE32eF2QW2XMWl5jY6+TFMPqYWQllPUNbLNC4qCr9QqNP0UNtfpjl
	gl0M90guk7upZJH2B2ymn2HBu+p/zkmg6/ntU9FPYGei7dVg6HAjqn/XJlssUH20Xmr3sa/e5tLND
	C/wAH6tf0gpFssDWEhBp3WF7Bj0RWeLFdpD0e3f82fyu+b8TKC2W3OI0Hq4NyEVZ2W63jVogdhtxJ
	iSxVPegXxpeoZ/RfwL2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n94xF-00CQDn-Kr; Sun, 16 Jan 2022 12:48:17 +0000
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n94x6-00CQ2F-Et
 for ath11k@lists.infradead.org; Sun, 16 Jan 2022 12:48:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1642337288; x=1673873288;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=pApA5J/ocvBCnpyMpqVEyhp1lXSsM8R2P7y4YfluaP4=;
 b=mwgDNGfpJtkNSybYN4/yu+4muFXoERFemuV/Yx1OXCmg+C9hNUT7nn5S
 1dj6IJ0HUvJ3jqV+riOUq+bElTUTJ7kqgJ1R/XLb0br28P4oUi9/OSXKp
 4EdYqB9HCXUa+qrM+EqQncV2KLY5SAFIm+Q3ZlMSewIGHzPHJL7X+RnG7 E=;
Received: from unknown (HELO ironmsg01-sd.qualcomm.com) ([10.53.140.141])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 16 Jan 2022 04:48:07 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg01-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2022 04:48:07 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Sun, 16 Jan 2022 04:48:07 -0800
Received: from mpubbise-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Sun, 16 Jan 2022 04:48:04 -0800
From: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <robh@kernel.org>, Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
Subject: [PATCH v2 14/19] ath11k: Do not put HW in DBS mode for WCN6750
Date: Sun, 16 Jan 2022 18:17:10 +0530
Message-ID: <1642337235-8618-15-git-send-email-quic_mpubbise@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1642337235-8618-1-git-send-email-quic_mpubbise@quicinc.com>
References: <1642337235-8618-1-git-send-email-quic_mpubbise@quicinc.com>
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220116_044808_561027_F441FF0C 
X-CRM114-Status: GOOD (  13.51  )
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

Though WCN6750 is a single PDEV device, it is not a
DBS solution. So, do not put HW in DBS mode for WCN6750.

Tested-on: WCN6750 hw1.0 AHB WLAN.MSL.1.0.1-00573-QCAMSLSWPLZ-1
Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-01720.1-QCAHSPSWPL_V1_V2_SILICONZ_LITE-1
Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.5.0.1-01100-QCAHKSWPL_SILICONZ-1
Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.4.0.1-00192-QCAHKSWPL_SILICONZ-1

Signed-off-by: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/core.c | 2 +-
 drivers/net/wireless/ath/ath11k/wmi.c  | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
index f65347c..7208849 100644
--- a/drivers/net/wireless/ath/ath11k/core.c
+++ b/drivers/net/wireless/ath/ath11k/core.c
@@ -1084,7 +1084,7 @@ static int ath11k_core_start(struct ath11k_base *ab,
 	}
 
 	/* put hardware to DBS mode */
-	if (ab->hw_params.single_pdev_only) {
+	if (ab->hw_params.single_pdev_only && ab->hw_params.num_rxmda_per_pdev > 1) {
 		ret = ath11k_wmi_set_hw_mode(ab, WMI_HOST_HW_MODE_DBS);
 		if (ret) {
 			ath11k_err(ab, "failed to send dbs mode: %d\n", ret);
diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index 6b68ccf6..0cc8957 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: BSD-3-Clause-Clear
 /*
  * Copyright (c) 2018-2019 The Linux Foundation. All rights reserved.
+ * Copyright (c) 2021, Qualcomm Innovation Center, Inc. All rights reserved.
  */
 #include <linux/skbuff.h>
 #include <linux/ctype.h>
@@ -7851,7 +7852,7 @@ int ath11k_wmi_attach(struct ath11k_base *ab)
 	ab->wmi_ab.preferred_hw_mode = WMI_HOST_HW_MODE_MAX;
 
 	/* It's overwritten when service_ext_ready is handled */
-	if (ab->hw_params.single_pdev_only)
+	if (ab->hw_params.single_pdev_only && ab->hw_params.num_rxmda_per_pdev > 1)
 		ab->wmi_ab.preferred_hw_mode = WMI_HOST_HW_MODE_SINGLE;
 
 	/* TODO: Init remaining wmi soc resources required */
-- 
2.7.4


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
