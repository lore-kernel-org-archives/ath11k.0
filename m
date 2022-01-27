Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C601FC433EF
	for <ath11k@archiver.kernel.org>; Thu, 27 Jan 2022 05:34:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pXv7SKWngzTtpcyDRAw2z2TmpVr/JBeSriFF0S0qMxI=; b=ts/nJI4JKB49s0
	G6/r2lPLEF59qpLycV807FLm4M14aBKtY9SIn1cWLdnqXIAU1+BWheOqlT6UIa8NOa9kSySqSvtpA
	VyqU1rP+yQ/sAlkULNGng0tc9/vJa1gYoRrt1YJFt+yuyaHCzAkmSS1bfiI892u4l6VnJoaOKuHRw
	6tsbUS8CVv6Hy/dxHlj1SCcnnVQ9rz5ToAlBqRc1yqZBkupKqVCIyVPaQ9+uzpCWQ3J7JrzDafRNy
	QeACJ0nuICB8OhUyWKYnlZ3OIv6mG+79yNP3bjvE65L8dG3wIWMW6chz+cRrZWQqO+ZJZQjB+T7N1
	q7bV6T3pTRuaCq+03B4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nCxQ2-00EPZf-0R; Thu, 27 Jan 2022 05:34:02 +0000
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nCxPw-00EPWC-2b
 for ath11k@lists.infradead.org; Thu, 27 Jan 2022 05:34:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1643261636; x=1674797636;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=grINu50fIJpu2V6gAsNBKv5IVQeesGIUlU5chOhbTic=;
 b=IYTx8dhA9c/pqDmpYUPWEn551kT1Dwha4EKcwq2gWTL92k63SbyCl9QC
 710HGIWs1/wp1vCkdoZhmyrw8iL9EQkkuVkUj9J0MLRufbH43JUrhURNI
 RMl7nMjOMdlZzpU1YhGFLVNa1znAeEHu5xv8alRnEUIErN+um4sojvdRn M=;
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 26 Jan 2022 21:33:55 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg-SD-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2022 21:33:55 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Wed, 26 Jan 2022 21:33:55 -0800
Received: from mpubbise-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Wed, 26 Jan 2022 21:33:53 -0800
From: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, Manikanta Pubbisetty
 <quic_mpubbise@quicinc.com>
Subject: [PATCH RFC 6/8] ath11k: Increase TCL data ring size
Date: Thu, 27 Jan 2022 11:03:27 +0530
Message-ID: <1643261609-13500-7-git-send-email-quic_mpubbise@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1643261609-13500-1-git-send-email-quic_mpubbise@quicinc.com>
References: <1643261609-13500-1-git-send-email-quic_mpubbise@quicinc.com>
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220126_213356_168694_9135D8FD 
X-CRM114-Status: GOOD (  11.22  )
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

Increase TCL data ring size from 512 to 2048, this is
needed to meet 160Mhz TX throughput on WCN6750.

As the ring size is increased, there will be a slight
increase in memory used but should not impact the
functioning of any hardware.

Tested-on: WCN6750 hw1.0 AHB WLAN.MSL.1.0.1-00573-QCAMSLSWPLZ-1

Signed-off-by: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/dp.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/dp.h b/drivers/net/wireless/ath/ath11k/dp.h
index 409d6cc..9a30367 100644
--- a/drivers/net/wireless/ath/ath11k/dp.h
+++ b/drivers/net/wireless/ath/ath11k/dp.h
@@ -1,6 +1,7 @@
 /* SPDX-License-Identifier: BSD-3-Clause-Clear */
 /*
  * Copyright (c) 2018-2019 The Linux Foundation. All rights reserved.
+ * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
 #ifndef ATH11K_DP_H
@@ -199,7 +200,7 @@ struct ath11k_pdev_dp {
 #define DP_IDLE_SCATTER_BUFS_MAX 16
 
 #define DP_WBM_RELEASE_RING_SIZE	64
-#define DP_TCL_DATA_RING_SIZE		512
+#define DP_TCL_DATA_RING_SIZE		2048
 #define DP_TX_COMP_RING_SIZE		32768
 #define DP_TX_IDR_SIZE			DP_TX_COMP_RING_SIZE
 #define DP_TCL_CMD_RING_SIZE		32
-- 
2.7.4


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
