Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56ABCC433EF
	for <ath11k@archiver.kernel.org>; Wed,  8 Dec 2021 07:23:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=46mJTb0wBp+y37k4OgxqQskcw0r8Mez1umt6Vsg3s0g=; b=ujgufdprSfdnkZ
	tIVyorjYB8J9QSwdUykqUq6UPO3bgTZQGZU/Du98kTDXzHDuv5JPHfO+iPyIRamHDP/tA/WM7jRXF
	o7oiQ1/mlmgrMa5GM4opEWkP3zcBar4nmlgiYKQ/Xwzz2AJjCqonGFLZcsfGAL9Lf1+iZfvsRL0m9
	0U3LtLq3HPAitVLuYBRxsDTFHXofG1r3NkIk8aKuZ26Ii481xV1HFo7HIzlfLfKsE4uDy8XSSD+MV
	xnrRwHWUlYwLPfy5CsP9Uu6gB0m9xkTua7NJs2SezlhJ4LWsU1mddFvGSJrytwVNmjHRXD3EN545u
	bV6Kkx2icNlx3fKa/jwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1murIn-00BZ4v-6i; Wed, 08 Dec 2021 07:23:45 +0000
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1murIk-00BZ3x-NE
 for ath11k@lists.infradead.org; Wed, 08 Dec 2021 07:23:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1638948222; x=1670484222;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=aP4aYYc3sR8tigYFU19bF4Ce7DkGODqkL4I450FFV28=;
 b=OENbj6/hBE0zi0/NbjHq7WE5xqaxscNp91VGmcm6gbih5Dwv6CTFJH3O
 wTBW6pPrCC3KUwqRqSiZQ+2MOs8TeTIrIpAaVkgvD3VppgwV6YZwfuIlN
 MdwwaJoO+CAMAvblRtlo0rHZ6388sKYbHBtLcByjqxCkG/7/e9TldEJyw k=;
Received: from unknown (HELO ironmsg03-sd.qualcomm.com) ([10.53.140.143])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 07 Dec 2021 23:23:42 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg03-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2021 23:23:42 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Tue, 7 Dec 2021 23:23:41 -0800
Received: from wgong-HP3-Z230-SFF-Workstation.qca.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Tue, 7 Dec 2021 23:23:40 -0800
From: Wen Gong <quic_wgong@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_wgong@quicinc.com>
Subject: [PATCH v4 0/2] ath11k: add handler for board-2.bin without variant
 and read SMBIOS
Date: Wed, 8 Dec 2021 02:23:25 -0500
Message-ID: <20211208072327.19719-1-quic_wgong@quicinc.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211207_232342_809278_710DEAD4 
X-CRM114-Status: UNSURE (   5.26  )
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

 drivers/net/wireless/ath/ath11k/core.c | 107 +++++++++++++++++++++++--
 drivers/net/wireless/ath/ath11k/core.h |  11 +++
 drivers/net/wireless/ath/ath11k/qmi.c  |   4 +
 3 files changed, 117 insertions(+), 5 deletions(-)


base-commit: 4f4f8aee394b73abf5e5f98c63187fdbf1d627f0
-- 
2.31.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
