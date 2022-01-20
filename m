Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3013C43217
	for <ath11k@archiver.kernel.org>; Thu, 20 Jan 2022 10:14:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Ft5XIab4k7GkdTMiqK+HExqJToOSQK9ci55SwauX6Mg=; b=CzoveiOyH4pJCW
	X1f33Vx/UQI5/P8ZfBwLZ4dQhagYBWcvcAEpp0Og/u/e1oIrnkz4GQlLsX/OYVrHGGVn6rkGsn3KV
	XmEwm6ZrQCvWFxd692VEoEwQDVU2riwfl71KijJ7Cny7GYHyDbIo3a8Mbc7WqsXs2mH7BUGgct6DI
	d7xoLl1g2ftF5nGxy651WHpMwX5otsOu8IEVZoWsmZ4UJ+vimkhuhLxdVR5E4h3gT8qdSrUMdaHzE
	DRQkgr2PnnydcVy/ih/FVz3fSQC8wEs5/c3tg0Pq6m3kCN69nwrOZVqfrr9QikMK0Gm5spelSVBXU
	YoHU/M7kCiZJPlBnieuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nAUSA-00AaXX-Ah; Thu, 20 Jan 2022 10:14:02 +0000
Received: from alexa-out.qualcomm.com ([129.46.98.28])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nAUS6-00AaVT-Qc
 for ath11k@lists.infradead.org; Thu, 20 Jan 2022 10:14:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1642673639; x=1674209639;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=haG84iyvbfXWuFHxn8z/Z75Pk+T+kgVVx6jLzWCNP4E=;
 b=d7bgK+RXytg/i4yPWZlZBL8iOVt7mh55zY2meo8aFHIV609qLNKDhKhr
 j6hXDroIdrtr/IMcZFMYfHESdgMhYTMZrYaCFtVqkVQdoA1qz/ZBjDXE9
 3wtWBgqy2vcxYHnkT0v1yYou/A4KEOHSQgGufJF/MbFZQfqpB2+btTfWW M=;
Received: from ironmsg07-lv.qualcomm.com ([10.47.202.151])
 by alexa-out.qualcomm.com with ESMTP; 20 Jan 2022 02:13:58 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg07-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2022 02:13:57 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Thu, 20 Jan 2022 02:13:57 -0800
Received: from cjhuang2-gv.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Thu, 20 Jan 2022 02:13:56 -0800
From: Carl Huang <quic_cjhuang@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
Subject: [PATCH v2 0/6] ath11k: support WoW functionalities
Date: Thu, 20 Jan 2022 18:13:21 +0800
Message-ID: <1642673607-8896-1-git-send-email-quic_cjhuang@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220120_021358_939712_04690170 
X-CRM114-Status: UNSURE (   5.99  )
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
 drivers/net/wireless/ath/ath11k/core.h  |  31 ++
 drivers/net/wireless/ath/ath11k/dp_rx.c |   1 -
 drivers/net/wireless/ath/ath11k/htc.c   |   6 +
 drivers/net/wireless/ath/ath11k/htc.h   |   1 +
 drivers/net/wireless/ath/ath11k/mac.c   | 217 ++++++++-
 drivers/net/wireless/ath/ath11k/mac.h   |   1 +
 drivers/net/wireless/ath/ath11k/wmi.c   | 612 +++++++++++++++++++++++++
 drivers/net/wireless/ath/ath11k/wmi.h   | 353 ++++++++++++++-
 drivers/net/wireless/ath/ath11k/wow.c   | 759 ++++++++++++++++++++++++++++++++
 drivers/net/wireless/ath/ath11k/wow.h   |  36 ++
 11 files changed, 2034 insertions(+), 19 deletions(-)

-- 
2.7.4


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
