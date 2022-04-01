Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A7A6C433EF
	for <ath11k@archiver.kernel.org>; Fri,  1 Apr 2022 07:32:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+x17P9a8n+RlDwBwPptAQlbaCc+2sxhRKIJzXNEFBbQ=; b=DopK7wwy4zN/Vb
	OyKVxL22hNccTLxsERlWrZaQSMNfIj/zDbhLQQYYbdLa62H3UlWBOdI1elXTWySAXMKCTM9gtHksk
	1juFFxYhJSky22cfXsnbigFE8rX9h++9dPyabgxIWFDjEkz9MZ0DyqUVmgcZJIzSMmygQV2f5MKLL
	WrKixzOV0vZBF25jy4GJa4NJz6gi8PU1WtNCZZorAP5ZkmSKnFCRj9eIQkkZj1M3UiR1nvZeKHtTO
	QYmPNQHTIMuq1Hs/vMljZh4NB7GG1VYmTVA7zz+hvwBgRdmZQRIopUr32CKJFni+bTaZ8aQFrZVWl
	Pd4GGJmpoOsRzbTRX0Lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1naBlI-004nh1-Mb; Fri, 01 Apr 2022 07:32:00 +0000
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1naBlG-004ngk-TF
 for ath11k@lists.infradead.org; Fri, 01 Apr 2022 07:32:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1648798318; x=1680334318;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Q/rPu336six2VeuZ+f8xOlNtVLTMD9/U1JCdnnpPLX0=;
 b=Ub37HERTA/eTqKbZbCcghA0iSF8WCMJxuUDN4qg4wZRNguKdkZ2l3mX8
 eHuomPy+rCuKB+JcC3MoPottD5cBZx6EDwOCgtxioFxqHwIPJ+ra6Ah02
 3pVsAfLGrl35AllG/0Zrel8LbjoypVTVLeps6sZ0yhzYTROGsKnd7WneO 0=;
Received: from unknown (HELO ironmsg05-sd.qualcomm.com) ([10.53.140.145])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 01 Apr 2022 00:31:55 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg05-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2022 00:31:55 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Fri, 1 Apr 2022 00:31:55 -0700
Received: from bqiang-Celadon-RN.qca.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Fri, 1 Apr 2022 00:31:54 -0700
From: Baochen Qiang <quic_bqiang@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
Subject: [PATCH v3 0/2] ath11k: Add support for SAR
Date: Fri, 1 Apr 2022 15:31:42 +0800
Message-ID: <20220401073142.1195018-1-quic_bqiang@quicinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220401_003159_008898_746A3F1A 
X-CRM114-Status: UNSURE (   7.08  )
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

This is to add support for SAR. Currently SAR is enabled
only for WCN6855.

v3:
 1. rebased on latest ath.git
 2. add Wen's patch "ath11k: add support for extended wmi service bit"
    to this patch set so that there will be no dependency for the SAR patch.
v2:
 1. rebased on latest ath.git
 2. add base-commit tag.

Baochen Qiang (1):
  ath11k: Add support for SAR

Wen Gong (1):
  ath11k: add support for extended wmi service bit

 drivers/net/wireless/ath/ath11k/core.c |   6 +
 drivers/net/wireless/ath/ath11k/hw.c   |  20 ++++
 drivers/net/wireless/ath/ath11k/hw.h   |   2 +
 drivers/net/wireless/ath/ath11k/mac.c  |  66 +++++++++++
 drivers/net/wireless/ath/ath11k/wmi.c  | 151 +++++++++++++++++++------
 drivers/net/wireless/ath/ath11k/wmi.h  |  36 +++++-
 6 files changed, 247 insertions(+), 34 deletions(-)


base-commit: 748b34786d1c96e758862d8e8577106ccde6515a
-- 
2.25.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
