Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A17D3C433EF
	for <ath11k@archiver.kernel.org>; Thu,  5 May 2022 01:39:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=8DIwXeQxbkf5dhD+ejA3cOAa2zt3dTqDqHbjmGJ8oM0=; b=qlvhiufDFdBlvs
	jBUp/7P8olnjhx+W++JDmcUFvrH/JkIxiLZ/SryGIjITFrvebOtgsPROgMu0alGXTpW+THoAT4IZO
	ewJXIspH7o6ngQbjxE5mSId4R6wqeXjhnURIQVDYzZokX0vakRSpQprWOBu1cCl65AkKpO+KASVpj
	JKPT1avylZLvjEnvso1C6seXkmAK5kOh0z41K99e8QEuNbBkJQ5yH8fpcwGAxyp6+zMVBV9utazQN
	FPsyrLgLj3O9ZHPaGLVGXqL5/MpaBnj2GZnCkDon2QYx8rvCgMUmKUVlx7YpGz1pzYyUP5aEbJ6RZ
	KlGT+7/PW9nm/ffy6Kpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmQSa-00DWJn-Bs; Thu, 05 May 2022 01:39:16 +0000
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmQSR-00DWG1-LU
 for ath11k@lists.infradead.org; Thu, 05 May 2022 01:39:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1651714747; x=1683250747;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=eJEj/nxSr1KlTmF7oDl23RHuI5Q4XTfaWNrgPA3i6nM=;
 b=v3mHGStHzzfvafSDGtwKbNco8jxP9WO8XyOHdkqPRbHyAFAUbXZ0L/2G
 Ea8shJsOge3uxtQSj4baYjLobbUznRe8W/2d0sj1dUi0265oc17j8XjTo
 ydaAa54HbaJCpvpqY3dswTuDLnaFtexgprrExRisSGQwQ2Uq2VJfPcFk8 A=;
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 04 May 2022 18:39:06 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg04-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2022 18:39:06 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 4 May 2022 18:39:06 -0700
Received: from bqiang-Celadon-RN.qca.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 4 May 2022 18:39:05 -0700
From: Baochen Qiang <quic_bqiang@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
Subject: [PATCH 0/3]  ath11k: Add support for Passpoint
Date: Thu, 5 May 2022 09:38:48 +0800
Message-ID: <20220505013851.1548789-1-quic_bqiang@quicinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220504_183907_761075_40CF301C 
X-CRM114-Status: UNSURE (   6.72  )
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

This is to add Passpoint support for WCN6855 and QCA6390.
With this patch set, STA can successfully connect to an
Passpoint AP.

Baochen Qiang (3):
  ath11k: Implement remain-on-channel support
  ath11k: Don't check arvif->is_started before sending management frames
  ath11k: Designating channel frequency when sending management frames

 drivers/net/wireless/ath/ath11k/core.c |   8 ++
 drivers/net/wireless/ath/ath11k/hw.h   |   1 +
 drivers/net/wireless/ath/ath11k/mac.c  | 120 ++++++++++++++++++++++++-
 drivers/net/wireless/ath/ath11k/wmi.c  |  21 ++++-
 4 files changed, 147 insertions(+), 3 deletions(-)


base-commit: b04efb72cd9d2d471a14f0a5758873f6c78923c2
-- 
2.25.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
