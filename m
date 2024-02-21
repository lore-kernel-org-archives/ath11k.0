Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 485ADC54787
	for <ath11k@archiver.kernel.org>; Wed, 21 Feb 2024 02:47:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hS43JUPpBFkWaxKWv0yuFZnWSyCbqQIwNbs8b1w7h4s=; b=A37m5dzWgVobMZ4hOkqgEV1xA8
	Sw3Qa6aGuOWmzWTeudHKreGPA7rqLb6nwFI1dqs6hx83gh8/EDDzzpeSmKZEgRrylS/sEV5ioo6id
	lRRTt5n5Pl9HqocEnwIeCvtqXdd13u7jVnPNUrpwxWSRi8DkqOo1o51ShLKke9e2qGmFe15wRq/pc
	w/f3+4XW9DoG1ys5PFSJMtLa8FnuZQrc5lTZlDANkv+Euo21wWn92OsT1DbaSc73JJQNUfwYHALZJ
	Hbd+AFHzBZGkgLQMhBh3th9hU/tQlu/Z37WH/9r0wfhuYuujc1JBbAypj7X3UbBdUVl/9qqtkdW/O
	jqPmv0KQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcceA-0000000GupM-42nj;
	Wed, 21 Feb 2024 02:47:46 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcce7-0000000Gunr-3a2F
	for ath11k@lists.infradead.org;
	Wed, 21 Feb 2024 02:47:45 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41L2THVN024327;
	Wed, 21 Feb 2024 02:47:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	qcppdkim1; bh=hS43JUPpBFkWaxKWv0yuFZnWSyCbqQIwNbs8b1w7h4s=; b=jf
	eB4qQLGcb/any9GG1oSqoaH5I46mIxlYZP9OK5qIzbMg1WwKFizQ57tyswQkKPCz
	3Tnzj33iNOb3LgLGxv4TcBvIiXn5qAqwPUTcAQgTD6LmIf11YB8m7Hi6xT9h/i/+
	cG2JEwdf4zw6DQjJS2e0OFHOeWrMsl/W1MNWYXEssbW4pVddQo+krxTVEAN2FdZg
	2fqkd30pqEfHoPEhuM3+75pyCzZfFh7YNNejdpIxLix08DejfaIt6YQD07WAPpF7
	CNpgEXldjslgR1n/Y1vQr5mF7kQYXhnusjoUbEUVWnRBL/wD8Ur37RdYxITt8hzI
	NmNwblxFy0ypYfN+IHgQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wd22rgsht-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 Feb 2024 02:47:42 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 41L2lf7h020105
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 Feb 2024 02:47:41 GMT
Received: from bqiang-SFF.qca.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Tue, 20 Feb 2024 18:47:40 -0800
From: Baochen Qiang <quic_bqiang@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_bqiang@quicinc.com>
Subject: [PATCH 1/5] wifi: ath11k: rearrange IRQ enable/disable in reset path
Date: Wed, 21 Feb 2024 10:47:21 +0800
Message-ID: <20240221024725.10057-2-quic_bqiang@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240221024725.10057-1-quic_bqiang@quicinc.com>
References: <20240221024725.10057-1-quic_bqiang@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: -MOvkH73xWwHETPgGJEIy87gr4CORXML
X-Proofpoint-GUID: -MOvkH73xWwHETPgGJEIy87gr4CORXML
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-20_06,2024-02-20_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 adultscore=0
 priorityscore=1501 phishscore=0 impostorscore=0 bulkscore=0 mlxscore=0
 lowpriorityscore=0 spamscore=0 mlxlogscore=874 malwarescore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2402210018
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240220_184744_035618_811EFB5A 
X-CRM114-Status: GOOD (  11.34  )
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
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

For non WoW suspend/resume, ath11k host powers down whole hardware
when suspend and powers up it when resume, the code path it goes
through is very like the ath11k reset logic.

In order to reuse that logic, rearrange IRQ handling in the reset
path.

Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.30

Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/core.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
index 922e67f8e04f..c78bce19bd75 100644
--- a/drivers/net/wireless/ath/ath11k/core.c
+++ b/drivers/net/wireless/ath/ath11k/core.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: BSD-3-Clause-Clear
 /*
  * Copyright (c) 2018-2019 The Linux Foundation. All rights reserved.
- * Copyright (c) 2021-2023 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2021-2024 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
 #include <linux/module.h>
@@ -1869,10 +1869,9 @@ static int ath11k_core_reconfigure_on_crash(struct ath11k_base *ab)
 
 	mutex_lock(&ab->core_lock);
 	ath11k_thermal_unregister(ab);
-	ath11k_hif_irq_disable(ab);
 	ath11k_dp_pdev_free(ab);
 	ath11k_spectral_deinit(ab);
-	ath11k_hif_stop(ab);
+	ath11k_ce_cleanup_pipes(ab);
 	ath11k_wmi_detach(ab);
 	ath11k_dp_pdev_reo_cleanup(ab);
 	mutex_unlock(&ab->core_lock);
@@ -2127,6 +2126,9 @@ static void ath11k_core_reset(struct work_struct *work)
 	time_left = wait_for_completion_timeout(&ab->recovery_start,
 						ATH11K_RECOVER_START_TIMEOUT_HZ);
 
+	ath11k_hif_irq_disable(ab);
+	ath11k_hif_ce_irq_disable(ab);
+
 	ath11k_hif_power_down(ab);
 	ath11k_hif_power_up(ab);
 
-- 
2.25.1


