Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA6EDC433EF
	for <ath11k@archiver.kernel.org>; Sat, 19 Mar 2022 02:36:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tRwJ3rymXNMJCY4mQqjLxh93tbgC5bvn9gDHFaeNGAk=; b=s+47ddkZPdGkqD
	hW9pdgNaThhXlNy4/KniY0dwoy5zglIw21h1ddxLZ2KxAHx1aBtVGd/tOg45Z2KHLWPzxEbw0un6g
	nYDUIyHpP7VzTNe+mDReoBHcKJQO3Z2YCDHZBCn1o+7d+IJGyV8pU135q/IbbCvickpPuodnSD/X9
	FDYfuzZZGoZ+hQjrGCR+7H6JsBaE9ZbgB8hZ0miq2iCGiRyY1+ao/dL0K9DiNiQqM3t0rX1sM46Yl
	1ORGKJN4sXJCnusvaXCKmNd3zq6t6H2nCHHekjZnBMhvv5oVpC3rG45eDRY/UgT+Yglh2/g20j5nG
	94s82YYT8b1rGuB/x9LQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nVOwv-00372m-UP; Sat, 19 Mar 2022 02:36:13 +0000
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nVOwq-00371i-8X
 for ath11k@lists.infradead.org; Sat, 19 Mar 2022 02:36:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1647657368; x=1679193368;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/511/Rzhpb+uEAbDZ5SR9FAjeWgG0Ir2pmSsdAn76z0=;
 b=rHUTmk8x02t/XC9rk961HuRzk5R5AVvBdZbKEwDh0Vf9xqWCTXQcYMl9
 kqY4LuDifeq8e8voa2W+Z6iHKaxq1pkttz0+3aVCeakYuH3UbdsOn8WvX
 eEztL6zWS7GerJrwejQOv/NEY97X+NAJe7Q7yM1War4Y0gGWfg70AosGH o=;
Received: from unknown (HELO ironmsg02-sd.qualcomm.com) ([10.53.140.142])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 18 Mar 2022 19:36:08 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg02-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2022 19:36:07 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Fri, 18 Mar 2022 19:36:07 -0700
Received: from wgong-HP3-Z230-SFF-Workstation.qca.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Fri, 18 Mar 2022 19:36:06 -0700
From: Wen Gong <quic_wgong@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_wgong@quicinc.com>
Subject: [PATCH 2/3] ath11k: disable regdb support for QCA6390
Date: Fri, 18 Mar 2022 22:35:42 -0400
Message-ID: <20220319023543.14288-3-quic_wgong@quicinc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220319023543.14288-1-quic_wgong@quicinc.com>
References: <20220319023543.14288-1-quic_wgong@quicinc.com>
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220318_193608_348461_26BAD1CD 
X-CRM114-Status: GOOD (  10.50  )
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

Currently it does not have regdb files for QCA6390, so disable its regdb
support feature now.

Tested-on: QCA6390 hw2.0 PCI WLAN.HST.1.0.1-05266-QCAHSTSWPLZ_V2_TO_X86-1

Signed-off-by: Wen Gong <quic_wgong@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
index 71eb7d04c3bf..92797d7537f5 100644
--- a/drivers/net/wireless/ath/ath11k/core.c
+++ b/drivers/net/wireless/ath/ath11k/core.c
@@ -219,7 +219,7 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.num_peers = 512,
 		.supports_suspend = true,
 		.hal_desc_sz = sizeof(struct hal_rx_desc_ipq8074),
-		.supports_regdb = true,
+		.supports_regdb = false,
 		.fix_l1ss = true,
 		.credit_flow = true,
 		.max_tx_ring = DP_TCL_NUM_RING_MAX_QCA6390,
-- 
2.31.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
