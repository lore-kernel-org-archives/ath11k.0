Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4229EC433EF
	for <ath11k@archiver.kernel.org>; Tue,  8 Feb 2022 08:13:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=QfabevquNp/9gP8dVZIQKI6WDP88UhK8MvpOJZaT1s8=; b=DFGTkPJj7h+M+n
	Sn3BFonTYhFtPl6eVk4hzDKaFSLQj9fNM3ZFI2UA8ZuyueUnHifTQfq6VaWKdMdZPc6d3ov12Rv3e
	isTA1I78nR+6V12qtrNN/A4PB8YwaZJ7I2mAPFQeYglIVtBQJTjTmjeNid8Kt8mwQOiItXw3AhxYH
	3aBh9hlOtO5RJrQfFtBYDH6obj+aXOuN7IuBTdf44xDcYVu/Cg0HVWq2KxBeZCVhs/dghrHjaRD+q
	/2YCMPM2fXsBNUylk7ZkYJzNnG8S2q6hrfm69EqAomtMY9EN4QxvwvA0of73eAuFDsdpoG7iWOZkm
	ZMOooJH1Qx3+3qlfKHjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nHLd7-00Css1-Oy; Tue, 08 Feb 2022 08:13:41 +0000
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nHLd4-00CsrY-Q4
 for ath11k@lists.infradead.org; Tue, 08 Feb 2022 08:13:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1644308018; x=1675844018;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=LU5HkVROhz+hS+wWIm1coOpMnpPIr2928HaLE6l4DQs=;
 b=kk3/yh8T9pbSxBLKXZXuAbu5B7RJGhh4XEfYNJEknZ34Np5eJ5HSzGqx
 RE+1IRInvEQrT22aCivBw61AJQYLsgOTdcKche21C/Qa4gs4Rq7IiTA35
 j6dplU92Np4CmNMDeeKk9oFA4qNiwlABtG7pJFw3xUYGRcpVV0Id9BmP8 Q=;
Received: from unknown (HELO ironmsg05-sd.qualcomm.com) ([10.53.140.145])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 08 Feb 2022 00:13:37 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg05-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2022 00:13:37 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Tue, 8 Feb 2022 00:13:37 -0800
Received: from cjhuang2-gv.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Tue, 8 Feb 2022 00:13:36 -0800
From: Carl Huang <quic_cjhuang@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
Subject: [PATCH v3 0/6] ath11k: support WoW functionalities
Date: Tue, 8 Feb 2022 16:13:20 +0800
Message-ID: <1644308006-22784-1-git-send-email-quic_cjhuang@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220208_001338_913672_1C3DA3BF 
X-CRM114-Status: UNSURE (   5.13  )
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

Ath11k WoW basic funtionalities are merged from ath10k such
as magic-pattern, PNO, disconnect and patterns.

Hw data filter and pktlog purge are required for ath11k.

ARP and NS offload, GTK rekey offload are new WoW features
implemented on ath11k.

v3:
	- rebased to 76680d49b5e0e661bc4abcdaf13fb7e124b4ca08
          (tag ath-202202030905)

v2:
        - fixed minor style issues commented by Kalle
        - fixed endianness
        - rebased to ath-202112161538
 
Carl Huang (6):
  ath11k: Add basic WoW functionalities
  ath11k: Add WoW net-detect functionality
  ath11k: implement hardware data filter
  ath11k: purge rx pktlog when entering WoW
  ath11k: support ARP and NS offload
  ath11k: support GTK rekey offload

 drivers/net/wireless/ath/ath11k/core.c  |  36 +-
 drivers/net/wireless/ath/ath11k/core.h  |  31 +
 drivers/net/wireless/ath/ath11k/dp_rx.c |   1 -
 drivers/net/wireless/ath/ath11k/htc.c   |   6 +
 drivers/net/wireless/ath/ath11k/htc.h   |   1 +
 drivers/net/wireless/ath/ath11k/mac.c   | 217 ++++++-
 drivers/net/wireless/ath/ath11k/mac.h   |   1 +
 drivers/net/wireless/ath/ath11k/wmi.c   | 612 +++++++++++++++++++
 drivers/net/wireless/ath/ath11k/wmi.h   | 353 ++++++++++-
 drivers/net/wireless/ath/ath11k/wow.c   | 759 ++++++++++++++++++++++++
 drivers/net/wireless/ath/ath11k/wow.h   |  36 ++
 11 files changed, 2034 insertions(+), 19 deletions(-)


base-commit: 76680d49b5e0e661bc4abcdaf13fb7e124b4ca08
-- 
2.32.0


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
