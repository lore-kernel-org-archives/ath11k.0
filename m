Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F254C433F5
	for <ath11k@archiver.kernel.org>; Tue, 17 May 2022 05:53:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ry7YJxXHE8iihx49ihLVZbDORT8Nrk3wkLIOKr+yWmI=; b=uZodavEhID5LWp
	RF5PH7eqI7f1qOrmLU8XEczHsXN3BTdPlZUmXcwpaYgS7Zf7tS3mz1c/Sy85HicAp8XvxX7MXDOR3
	ju5WfsvAmNc/dOmRHnhKPXs2dzkSDGdC3nKaqSVDGgbQDJZCwJ3Zbt7b2jug+Dne/3Vt0o5T8G2Mn
	kcrCVFt5lPXF2x747Fn4Yyb/XPqVqO1deUbYaRuNYn1bwWVzXHntte+ELQj29AJDliX4QDktzsgkJ
	/La2acKjiNJTPlOubZclzUzrc8BgJCtJhzOYcrKGVsioGsjjhpFH7P9KG9pEKpWGLE8fZtjDD+1Kd
	4LmwWfXXC5FTCRGJQkQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nqq8x-00Bk6a-3F; Tue, 17 May 2022 05:53:15 +0000
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nqq8u-00Bk4x-AO
 for ath11k@lists.infradead.org; Tue, 17 May 2022 05:53:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1652766792; x=1684302792;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=2BEfwWj1pj5ztvRLob/vY7ITqciMcbXsvRZhwbzIy+0=;
 b=j8MoarFPsX2z7csqUdPtYhtgnm8mGzkSXUqsN5hw/Hf6UeCCcoxPs9xj
 Gi/kgiwvD5qi2rEPV4rT+cHDUfEZ6UpB5nrKX+tqJr6xJ3dArvmYcNjaY
 Ez3HbT7c4g1QVCobeujuEVCY8VxGSpKzGPcZCvIB1xYqZCnLPlKq0zI6k A=;
Received: from unknown (HELO ironmsg02-sd.qualcomm.com) ([10.53.140.142])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 16 May 2022 22:53:03 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg02-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2022 22:53:03 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Mon, 16 May 2022 22:53:02 -0700
Received: from mpubbise-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Mon, 16 May 2022 22:53:00 -0700
From: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, Manikanta Pubbisetty
 <quic_mpubbise@quicinc.com>
Subject: [PATCH] ath11k: Init hw_params before setting up AHB resources
Date: Tue, 17 May 2022 11:22:41 +0530
Message-ID: <20220517055241.15885-1-quic_mpubbise@quicinc.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220516_225312_430998_97BFBC1E 
X-CRM114-Status: GOOD (  11.89  )
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

As part of adding the support of WCN6750 to ath11k, bus_params
were moved to hw_params and this regressed the initialization
of WCN6750. By the time AHB resources are setup for WCN6750,
hw_params will not be initialized and therefore initialization
for WCN6750 will fail. This is applicable only for WCN6750,
no other device is impacted.

Fix this by moving the initialization of hw_params before
setting up AHB resources.

Tested-on: WCN6750 hw1.0 AHB WLAN.MSL.1.0.1-00887-QCAMSLSWPLZ-1

Fixes: 00402f49d26f ("ath11k: Add support for WCN6750 device")
Signed-off-by: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/ahb.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/ahb.c b/drivers/net/wireless/ath/ath11k/ahb.c
index fa11807f48a9..d7d33d5cdfc5 100644
--- a/drivers/net/wireless/ath/ath11k/ahb.c
+++ b/drivers/net/wireless/ath/ath11k/ahb.c
@@ -976,11 +976,11 @@ static int ath11k_ahb_probe(struct platform_device *pdev)
 	ab->hw_rev = hw_rev;
 	platform_set_drvdata(pdev, ab);
 
-	ret = ath11k_ahb_setup_resources(ab);
+	ret = ath11k_core_pre_init(ab);
 	if (ret)
 		goto err_core_free;
 
-	ret = ath11k_core_pre_init(ab);
+	ret = ath11k_ahb_setup_resources(ab);
 	if (ret)
 		goto err_core_free;
 
-- 
2.35.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
