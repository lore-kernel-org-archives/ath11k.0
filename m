Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91AFBC433EF
	for <ath11k@archiver.kernel.org>; Thu, 27 Jan 2022 05:33:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=SmsGpwIrX7qT7xRX359DW2XkLO8G9bu1TqeKBVs0bsQ=; b=ov+cJSLG+Eu4r8
	H2fZNLCWe9LqbzGNp1yYm0oyHODCrurKtBs33INLOJT/M++ydgXm8em17ci3CApud/Z8AQWY7auHY
	QlI71NPSx0ZjBzVxZbM0uBpwX8n07FZwfIdl4VApmuxW0GhwFYsXsdTltLcCv2hWkuIhcwOv165FU
	jlWTPnuzuqwagfUtaWMCHBINBlTq1G8I+X3Y66Q3P4gNmg6d7otFLVVdyFy/UpQV9H9c1hbPYt0Kn
	xjLBOe9l43GPC0snvCatq1E+Unkx2tY0SBxVdgHwUFKAWYgFg2kXUnT0ZD0/blSD2Sq9+Gfy8nPiY
	JmrpUAsPmYfv4zb7yBIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nCxPp-00EPTO-Bg; Thu, 27 Jan 2022 05:33:49 +0000
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nCxPj-00EPSC-8E
 for ath11k@lists.infradead.org; Thu, 27 Jan 2022 05:33:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1643261623; x=1674797623;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=yQ3INR6n570uHvp11Q1QrySW8cBpez/o3z3TkFMm0dc=;
 b=DqIcKK77tV+45O459S2ItjNs7Zws0OuvKBjl4/0CVge7HSLoEKLuHi8i
 oULNuOEVPeLJ0FlVmH0WttcMDdOvaru4wFgNQ/0JUswofBjNwf7gyJVre
 UujrENn3IorNFA3KoyxEkjHC8k0g8+czrdQ2F6M+jeb9SOL+tV5FnUAxg I=;
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 26 Jan 2022 21:33:42 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg-SD-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2022 21:33:42 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Wed, 26 Jan 2022 21:33:42 -0800
Received: from mpubbise-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Wed, 26 Jan 2022 21:33:40 -0800
From: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, Manikanta Pubbisetty
 <quic_mpubbise@quicinc.com>
Subject: [PATCH RFC 0/8] Follow-on series for WCN6750
Date: Thu, 27 Jan 2022 11:03:21 +0530
Message-ID: <1643261609-13500-1-git-send-email-quic_mpubbise@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220126_213343_346011_71C19540 
X-CRM114-Status: GOOD (  10.20  )
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

This is a follow-on series for WCN6750 adding several
features, fixes and throughput enhancements.

Manikanta Pubbisetty (8):
  ath11k: Enable low power mode when WLAN is not active
  ath11k: Register shutdown handler for WCN6750
  ath11k: Cold boot calibration support on WCN6750
  ath11k: Cap NSS of HE peer to radio supported NSS
  ath11k: Enable threaded NAPI on WCN6750
  ath11k: Increase TCL data ring size
  ath11k: Add multi TX ring support for WCN6750
  ath11k: Add Coredump support of MSA region for WCN6750
---
Note: This series is dependent on another series adding
      support for WCN6750 in ATH11K.
      https://patchwork.kernel.org/project/linux-wireless/list/?series=605793

 drivers/net/wireless/ath/ath11k/Kconfig    |   1 +
 drivers/net/wireless/ath/ath11k/Makefile   |   1 +
 drivers/net/wireless/ath/ath11k/ahb.c      | 126 +++++++++++++++++++++-
 drivers/net/wireless/ath/ath11k/ahb.h      |   8 +-
 drivers/net/wireless/ath/ath11k/core.c     | 168 ++++++++++++++++++++++++-----
 drivers/net/wireless/ath/ath11k/core.h     |   5 +-
 drivers/net/wireless/ath/ath11k/coredump.c |  87 +++++++++++++++
 drivers/net/wireless/ath/ath11k/coredump.h |  71 ++++++++++++
 drivers/net/wireless/ath/ath11k/dp.c       |  23 ++--
 drivers/net/wireless/ath/ath11k/dp.h       |   5 +-
 drivers/net/wireless/ath/ath11k/dp_tx.c    |  14 +--
 drivers/net/wireless/ath/ath11k/hal.c      |   4 +-
 drivers/net/wireless/ath/ath11k/hal.h      |   4 +-
 drivers/net/wireless/ath/ath11k/hal_tx.c   |   4 +-
 drivers/net/wireless/ath/ath11k/hal_tx.h   |   2 +
 drivers/net/wireless/ath/ath11k/hw.c       | 113 ++++++++++++++++++-
 drivers/net/wireless/ath/ath11k/hw.h       |  17 ++-
 drivers/net/wireless/ath/ath11k/mac.c      |  28 ++++-
 drivers/net/wireless/ath/ath11k/pci_cmn.c  |   4 +-
 drivers/net/wireless/ath/ath11k/qmi.c      |  47 +++++++-
 drivers/net/wireless/ath/ath11k/qmi.h      |  12 ++-
 drivers/net/wireless/ath/ath11k/thermal.c  |  12 +++
 22 files changed, 685 insertions(+), 71 deletions(-)
 create mode 100644 drivers/net/wireless/ath/ath11k/coredump.c
 create mode 100644 drivers/net/wireless/ath/ath11k/coredump.h

-- 
2.7.4


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
