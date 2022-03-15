Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44FB1C433FE
	for <ath11k@archiver.kernel.org>; Tue, 15 Mar 2022 10:47:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=uwZVwv+pD5X42NCofUgYDgb1R0DvX2LbkQSHjSVwZOg=; b=M4FApZn84wywTr
	J8ghlk3g3nTm98BQbX62gv9J/0+KChcXVCOFkJ3YioTar5ihMV0qq9rm6gYmRtYi827eEy+bKe0U9
	OkLX9qkzYUrQNhpGDD/QlOUh/hYd+XjQtRxzOBjUC6nnKKGAKj41kSUSPxc7xANvWHGQNaf7Vgdn4
	fQK+MgL2eZbD6rngOQBHyaOJEx0Ov5A+CC5UQ/UKHcBxT1yPDlwi6D/uv1v2IiOVxPGvi8YWaFiYv
	Gp2Yo8wIhfenjUGNcTmQ4I9BGmxi/0dDxpZ/nJQivUqEM8LQJby5UW7Sd/E4p/WQY1hoCX4WoWxGW
	B8CbhXlDnY6llf8bL6HA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nU4iO-008m68-1M; Tue, 15 Mar 2022 10:47:44 +0000
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nU4iL-008m4N-Gg
 for ath11k@lists.infradead.org; Tue, 15 Mar 2022 10:47:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1647341261; x=1678877261;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Ufc0OnB/c0PI5MDoMcglSeec06KUHzS3onL53D/CBEY=;
 b=vaqV2YZ1RegjW9UE1tWRnolbgQjIQn46UJBphUPf1kUbV3CbYvZu1GKG
 YyPg8LLvXv7gv/pHxyYd8zK/+5hBSvJbRTwEgYcDlzpbCCpXEAyl0iSQ3
 AhaIrv+UCgUvm/CDVy/eBQ30XS7bby8HT0SysQLS+o8LG9CKAmz9AWyR3 Y=;
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 15 Mar 2022 03:47:39 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg-SD-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2022 03:47:39 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Tue, 15 Mar 2022 03:47:38 -0700
Received: from wgong-HP3-Z230-SFF-Workstation.qca.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Tue, 15 Mar 2022 03:47:37 -0700
From: Wen Gong <quic_wgong@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_wgong@quicinc.com>
Subject: [PATCH v6 0/2] ath11k: add handler for board-2.bin without variant
 and read SMBIOS
Date: Tue, 15 Mar 2022 06:47:19 -0400
Message-ID: <20220315104721.26649-1-quic_wgong@quicinc.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220315_034741_632278_CCD4B005 
X-CRM114-Status: UNSURE (   7.05  )
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

v6:
   1. rebased to ath.git ath-202203101556
   2. add error message if could not find any board data at last.
   3. change "ath11k: add read variant from SMBIOS for download board data" for
      add struct ath11k_smbios_bdf, strlen(), not mix defines and function declarations.

v5:
   1. rebased to ath.git ath-202112161538
   2. fix warning "failed to fetch board data for bus=pci,qmi-chip-id=0,qmi-board-id=255,variant=DE_1901 from ath11k/QCA6390/hw2.0/board-2.bin"

v4:
   1. add helper function ath11k_core_create_fallback_board_name()
   2. rebased to ath.git ath-202112071521

v3:
   1. add patch "ath11k: add fallback board name without variant while searching board-2.bin"
   2. reabsed to latest ath.git master ath-202111221436

v2: rebased to latest ath.git master ath-202111170737

When it does not have matched board name with variant in board-2.bin,
ath11k will fallback to search without variant.

Also read the variant from SMBIOS.

Wen Gong (2):
  ath11k: add fallback board name without variant while searching
    board-2.bin
  ath11k: add read variant from SMBIOS for download board data

 drivers/net/wireless/ath/ath11k/core.c | 116 +++++++++++++++++++++++--
 drivers/net/wireless/ath/ath11k/core.h |  20 ++++-
 drivers/net/wireless/ath/ath11k/qmi.c  |   4 +
 3 files changed, 132 insertions(+), 8 deletions(-)


base-commit: d845cf007bdf8b2bf41522e1ecd0eb804e553d57
-- 
2.31.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
