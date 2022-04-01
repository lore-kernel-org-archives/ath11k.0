Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FE18C4332F
	for <ath11k@archiver.kernel.org>; Fri,  1 Apr 2022 12:10:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=d6CBcy8LDaIKT7vCbD8XdorvU9GYG2twl6jLUZGeNyM=; b=4N+1M3hSGF1j6i
	tcsw6V+iKZtX8ehV7yC5XylCvpJrPRiveUAcfQaDCKoQtH26lrm3oQlSejcPTd85aLaKTYG8Wmfj4
	Ahzo3cD/69GysjiQJsIokV7KHKh56NN28cxDBTIZRP+qhvrxzQJkVitndk+A+qQ6NrdI3dYSSoT/T
	7EztNr+2vMzS5ACqWyL3+DmSvOrpc0Snw7/Mvr7ocWaekpGCIgfuICumfnWer0wla93oZY0o1/9Wp
	sXxJKsfRUN6P3Bq91XiipLbH3ZP7eBlEzuu+NIU9u0zDKb6XPLzwvPgVsBtsun2VrCpnUIeTFTuCd
	Lsi/ru9MHuup2d8CaZfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1naG6U-005ahU-9J; Fri, 01 Apr 2022 12:10:10 +0000
Received: from alexa-out.qualcomm.com ([129.46.98.28])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1naG6S-005afG-7X
 for ath11k@lists.infradead.org; Fri, 01 Apr 2022 12:10:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1648815008; x=1680351008;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=opyx11aftSKol0i2AxU77/phhkQqFw6Q6f566jASU3Q=;
 b=wWH+wtKu7MHmy6vknVvKU9uDa2Rnwn+NsLEIvDF+rYVtsZodYPj9e+Db
 Un61/r6L+NAFDE80NigqMMQtzr6Kh0a4hrjOeB3ZVwkZI19I86upxdclD
 /uTSekGKWZgusHaiAXRAZTDqNGsehjTMNYDaAsXaXWeHDOW0uzwF6gMqb c=;
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
 by alexa-out.qualcomm.com with ESMTP; 01 Apr 2022 05:10:02 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg09-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2022 05:10:02 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Fri, 1 Apr 2022 05:10:01 -0700
Received: from bqiang-Celadon-RN.qca.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Fri, 1 Apr 2022 05:10:00 -0700
From: Baochen Qiang <quic_bqiang@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
Subject: [PATCH v4 0/2] ath11k: Add support for SAR
Date: Fri, 1 Apr 2022 20:09:46 +0800
Message-ID: <20220401120948.1312956-1-quic_bqiang@quicinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220401_051008_328561_7A84D2AD 
X-CRM114-Status: UNSURE (   6.42  )
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

This is to add support for SAR, currently it is only enabled
for WCN6855.

v4:
 1. rebased on latest ath.git
 2. add my own s-o-b in Wen'spatch

v3:
 1. rebased on latest ath.git
 2. add Wen's patch to this patch set so that
    there is no dependency.

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


base-commit: 57b7042c114767b7330b14a260f61732e556742e
-- 
2.25.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
