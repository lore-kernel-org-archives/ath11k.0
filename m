Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E66CC433F5
	for <ath11k@archiver.kernel.org>; Sat, 19 Mar 2022 02:36:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xjqDRefjglAD3mrVobXK49ZX75CrpJ1o+91Y1LvqM9Q=; b=gy4sUm57bL38wA
	BO5pDW73wJ5/+cyhMfNchnjK2ECZmXAlUPinMWmfsNwIIQfiJIOqiMlMyrcXPH/GA/aDIbECUfz0/
	rx66XcfvvYmK6pO/fy/aETUz57eB6QeyMZ1nSvYxfjuCJtVTvqFYAgx4CzArrfPCtQvWyWd8mY+rO
	Nyg83DCm3mb0rQf0JBi8P0WvM4L+ggPXcQg4fCOeyHxHatzW3d2I6H9EO1jdQ+ZBO4kLabrv5ZUoH
	LisjvCR/EAsK8LfjXrwDm06y6kr9eEy5j/qKYULHEsPAt1XG2zKjQIP4rTPz7XLHFLYfewUOD9sEM
	drgffgjGhnCjyk+tdg+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nVOwv-00372X-C8; Sat, 19 Mar 2022 02:36:13 +0000
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nVOwp-00371U-VR
 for ath11k@lists.infradead.org; Sat, 19 Mar 2022 02:36:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1647657367; x=1679193367;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=RF5igoTu3j2FYAqjDSBzSvxMRT7HE8ocLWW0XvWMDw8=;
 b=DgXObzTTK0Ojrf4stAtJIsjB5k/eOMicGPs4bkX2dg29xKZks6jyGtAM
 HVmdytmhtvx9sW4950yQgG8e6h+yA1ksfSbwHHsWh+NLj+HJAjv+OcH0A
 j5i7paWYOWCQE1DAAORctbWKedOVXqToDr365PLt2SYyPL+Sj01gsyzdj M=;
Received: from unknown (HELO ironmsg02-sd.qualcomm.com) ([10.53.140.142])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 18 Mar 2022 19:36:05 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg02-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2022 19:36:05 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Fri, 18 Mar 2022 19:36:04 -0700
Received: from wgong-HP3-Z230-SFF-Workstation.qca.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Fri, 18 Mar 2022 19:36:03 -0700
From: Wen Gong <quic_wgong@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_wgong@quicinc.com>
Subject: [PATCH 0/3] ath11k: add support muti-type regdb data for WCN6855
Date: Fri, 18 Mar 2022 22:35:40 -0400
Message-ID: <20220319023543.14288-1-quic_wgong@quicinc.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220318_193608_108258_209914D8 
X-CRM114-Status: UNSURE (   4.66  )
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

Add enum value ATH11K_BD_IE_REGDB and enum type ath11k_bd_ie_regdb_type
for regdb data, the board-2.bin will include both board data and regdb
files.

Wen Gong (3):
  ath11k: remove unused ATH11K_BD_IE_BOARD_EXT
  ath11k: disable regdb support for QCA6390
  ath11k: add support to search regdb data in board-2.bin for WCN6855

 drivers/net/wireless/ath/ath11k/core.c | 81 ++++++++++++++++++--------
 drivers/net/wireless/ath/ath11k/hw.h   | 20 ++++++-
 2 files changed, 75 insertions(+), 26 deletions(-)


base-commit: d845cf007bdf8b2bf41522e1ecd0eb804e553d57
-- 
2.31.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
