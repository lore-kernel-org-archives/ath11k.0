Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43861C433EF
	for <ath11k@archiver.kernel.org>; Thu, 23 Dec 2021 03:56:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=sGHF7zS3TkOpOETBDMuTM37u2HLFD5WCScDrzg2r7Jo=; b=leq6hjDlP0yeJC
	Tt1t44Uh+fdz/Y+QCw1FUdFaKPm4JiHNPX7i93hCf10BLL1kyEGyCG822ppddEZciayJqSsQF3JYi
	coTvgluJ511GGzoxJqn04RKTeeYta56eczA6C3XBYjngWxgvleIVMFSF2sX0fvZWd8pMBi9er3h3B
	wvm/BkLwfjITvAX1KNVWjYfl5OcvXOdgviXf2d6WXNDJ+6Qruws7TEhGzZatdcurRXoirTSTGvFtp
	YMb0iJLYoe7qCev3edZd9DB66Krao7OhHfxC0UjFTtnT4SF3YOKqUz8ED+CHfwPxVL8aqiRbNMzBt
	lualAcBjdlUw3HH7EeaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n0FDi-00BoAL-Df; Thu, 23 Dec 2021 03:56:46 +0000
Received: from alexa-out.qualcomm.com ([129.46.98.28])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n0FDg-00Bo9h-7R
 for ath11k@lists.infradead.org; Thu, 23 Dec 2021 03:56:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1640231804; x=1671767804;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=4bXlA5F3cLVBy3uYJ0gkFL2w1iNHOoR8G+83Wal1ibo=;
 b=arBnjh9SVw/MUtl3IE2hplJvaEdXl99QYJ0iofnA6DCcem3gG737TNdf
 gOzBfNiteol9lFdPhX6cwFJh9/zSBUJVoDUabFkhppUuQa86jn9QnfOPh
 LBQeDIJAGs5zbv1/LDsToLR49j4e7gSmdWLgfis0TKlwb22UQ0A/vGHjI 0=;
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
 by alexa-out.qualcomm.com with ESMTP; 22 Dec 2021 19:56:41 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2021 19:56:40 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Wed, 22 Dec 2021 19:56:40 -0800
Received: from adisi-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Wed, 22 Dec 2021 19:56:38 -0800
From: Aditya Kumar Singh <quic_adisi@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, Aditya Kumar Singh
 <quic_adisi@quicinc.com>
Subject: [PATCH] ath11k: fix workqueue not getting destroyed after rmmod
Date: Thu, 23 Dec 2021 09:26:27 +0530
Message-ID: <1640231787-17408-1-git-send-email-quic_adisi@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211222_195644_349087_C3FF030E 
X-CRM114-Status: GOOD (  10.69  )
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

Currently, ath11k_core_alloc() creates a single thread workqueue.
This workqueue is not detroyed during clean up when ath11k modules
are unloaded from the kernel and is left as it is.
If workqueue is not destroyed, it could lead to kernel
memory scarcity in a longer run. This could affect self and
other drivers workability as well.

Add destroy workqueue in ath11k_core_free(). 

Tested on: IPQ8074 WLAN.HK.2.4.0.1-01746-QCAHKSWPL_SILICONZ-1

Signed-off-by: Aditya Kumar Singh <quic_adisi@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/core.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
index 2ba3bf8..6de0fc5 100644
--- a/drivers/net/wireless/ath/ath11k/core.c
+++ b/drivers/net/wireless/ath/ath11k/core.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: BSD-3-Clause-Clear
 /*
  * Copyright (c) 2018-2019 The Linux Foundation. All rights reserved.
+ * Copyright (c) 2021 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
 #include <linux/module.h>
@@ -1172,6 +1173,9 @@ EXPORT_SYMBOL(ath11k_core_deinit);
 
 void ath11k_core_free(struct ath11k_base *ab)
 {
+	flush_workqueue(ab->workqueue);
+	destroy_workqueue(ab->workqueue);
+
 	kfree(ab);
 }
 EXPORT_SYMBOL(ath11k_core_free);
-- 
2.7.4


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
