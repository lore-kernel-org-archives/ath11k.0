Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7DFDCCA486
	for <ath11k@archiver.kernel.org>; Wed, 20 Jul 2022 13:51:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=g8RDziR2iC9phHwihvJIGGKxIW5WiD7XomswKEImDpk=; b=gszVXDmJ8nyHO0
	lf79CfDMkS3ZhVtOrWqXeUq3RrjIwcqj+epPPI44NA83kcPce/VKXvPoyMlfFWqZssUKwtAm29cjs
	weulzAL2yFt75F6376VY8g9CZ3qlfAsR1s3EaEhh/rJX8aVd+4HcbKDwKhmXmyf8OhiIKiWlXj3iu
	g5hRwa5ZIc512gKaSE0ojJScM2Sr+J4H5mISYPeAYABdm8mnbEGJGMTu8re00ERHj7V7EzftF4DxB
	cwzAY7LddOGDlUb3bk4vozGXFuRjD1jKH+wzJ5PHhjL6OQBFciLWAoT2fnHvrISOpfm198eZjaeeX
	j0H9ODl11OhulNSmfZIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEA6w-006IZx-Tm; Wed, 20 Jul 2022 13:51:34 +0000
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEA6t-006IVJ-Eg
	for ath11k@lists.infradead.org; Wed, 20 Jul 2022 13:51:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1658325091; x=1689861091;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=248ZfeN56jR2hneRPQlauiUdkN7AJeUIKxC5kACWV6g=;
  b=nrwGP21ovUO6umjFYl3/iIqzXUIcy7KPau1tklW/Z55EQyRMu4kzu19D
   jdDb48UGFW6F5gLWqTzSMby3dNvAVQ3yhY6UjxxkjELAYmXFX1HlF1OTl
   ZDh3S8FayajrAd14AM/DUB+GF8yR6mKqmffImPbIbziIBXBRKLV4q5GuP
   s=;
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 20 Jul 2022 06:51:28 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg04-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2022 06:51:28 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 20 Jul 2022 06:51:27 -0700
Received: from mpubbise-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 20 Jul 2022 06:51:26 -0700
From: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, Manikanta Pubbisetty
	<quic_mpubbise@quicinc.com>
Subject: [PATCH 0/3] Throughput fixes for WCN6750
Date: Wed, 20 Jul 2022 19:21:10 +0530
Message-ID: <20220720135113.15755-1-quic_mpubbise@quicinc.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220720_065131_556031_179D5F20 
X-CRM114-Status: UNSURE (   7.50  )
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

Fix throughput issues on WCN6750. This includes 160 MHz
throughput fixes in both TX & RX directions.

Tested-on: WCN6750 hw1.0 AHB WLAN.MSL.1.0.1-00887-QCAMSLSWPLZ-1

Manikanta Pubbisetty (3):
  ath11k: Enable threaded NAPI on WCN6750
  ath11k: Add multi TX ring support for WCN6750
  ath11k: Increase TCL data ring size for WCN6750

 drivers/net/wireless/ath/ath11k/ahb.c    |   1 +
 drivers/net/wireless/ath/ath11k/core.c   |  20 +++-
 drivers/net/wireless/ath/ath11k/dp.c     |  26 ++---
 drivers/net/wireless/ath/ath11k/dp.h     |   4 +
 drivers/net/wireless/ath/ath11k/dp_tx.c  |  19 ++--
 drivers/net/wireless/ath/ath11k/hal.c    |   2 +-
 drivers/net/wireless/ath/ath11k/hal.h    |   2 +
 drivers/net/wireless/ath/ath11k/hal_tx.c |   4 +-
 drivers/net/wireless/ath/ath11k/hal_tx.h |   2 +
 drivers/net/wireless/ath/ath11k/hw.c     | 117 ++++++++++++++++++++++-
 drivers/net/wireless/ath/ath11k/hw.h     |  12 +++
 drivers/net/wireless/ath/ath11k/pcic.c   |   1 +
 12 files changed, 179 insertions(+), 31 deletions(-)

-- 
2.35.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
