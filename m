Return-Path: <SRS0=Pndp=QF=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D09DC433FE
	for <ath11k@archiver.kernel.org>; Thu, 18 Nov 2021 10:06:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D5CA16108B
	for <ath11k@archiver.kernel.org>; Thu, 18 Nov 2021 10:06:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D5CA16108B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=quicinc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=X4a586RBATyNgUibx/Ik8ZekrfPdcJFpI45f9KLAxas=; b=W8IgPVXXQ7cu64
	mo30Liyy6yCoqCtu8q0IDecBn78GKsWfTwUWQwGn2Zv3tdDS2vdMEzoLjNoey3GDg8ND7j6Q280vq
	wJVIE2gx1HYiHm7ARtamC8LHiA7S8Hqn8+JIjiLSGdgUbu/TFL6Gvh0Bpml41oyPG8gwS1v7uNxxK
	3Zbb6plVy6UrW3JhiLcKg8rHUp9wigLHW2frsZASzLd0eeStWD1W57/gFkR0iLkOKemO9sYO8teg8
	eERDtR9HEz0w5hBTlN2PjT0ii9AvPkPYhaeGVR+vtBJ0Mh1MghCfmmHacHqPivpj9FoPz5TzLlXG6
	3Ou6W8GOwYIETHEQN3ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mneJ5-007Pse-Se; Thu, 18 Nov 2021 10:06:15 +0000
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mneJ2-007Pr9-SB
 for ath11k@lists.infradead.org; Thu, 18 Nov 2021 10:06:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1637229972; x=1668765972;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=fesCBQVeE61jL1NpbtR+zGFtftyBldNp7hqjXZl6euM=;
 b=dBV22HO0VIu1Q3Ghu7feuA9P6joy9y5P039b9dPvpZJs1/UFvQ1X+OdJ
 G/P1vih9abCeG3PK2RWXWB7ZxW9Uq8F9pms/sjmQtGTKZH5G+HuxNwUZB
 B3+CXFgrh/h3qZ/f3xMz8YHmA3uUJjgN3hrrBHAvtUO5Mrqg8axx33qFQ 8=;
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 18 Nov 2021 02:06:12 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg-SD-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2021 02:06:12 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Thu, 18 Nov 2021 02:06:12 -0800
Received: from wgong-HP3-Z230-SFF-Workstation.qca.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Thu, 18 Nov 2021 02:06:10 -0800
From: Wen Gong <quic_wgong@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_wgong@quicinc.com>
Subject: [PATCH v2 0/2] ath11k: add 11d scan offload support for
 QCA6390/WCN6855
Date: Thu, 18 Nov 2021 05:05:55 -0500
Message-ID: <20211118100557.9029-1-quic_wgong@quicinc.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211118_020612_959766_B8773C04 
X-CRM114-Status: UNSURE (   7.32  )
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

v2:
   1. rebased to latest ath.git master ath-202111170737
   2. add "ath11k: add configure country code for QCA6390 and WCN6855", it is needed for 
      patch "ath11k: add 11d scan offload support"

Wen Gong (2):
  ath11k: add configure country code for QCA6390 and WCN6855
  ath11k: add 11d scan offload support

 drivers/net/wireless/ath/ath11k/core.c |  30 +++++
 drivers/net/wireless/ath/ath11k/core.h |   9 ++
 drivers/net/wireless/ath/ath11k/mac.c  | 162 ++++++++++++++++++++++++-
 drivers/net/wireless/ath/ath11k/mac.h  |   7 ++
 drivers/net/wireless/ath/ath11k/pci.c  |   1 +
 drivers/net/wireless/ath/ath11k/reg.c  |  15 +++
 drivers/net/wireless/ath/ath11k/wmi.c  | 145 ++++++++++++++++++++++
 drivers/net/wireless/ath/ath11k/wmi.h  |  39 ++++++
 8 files changed, 407 insertions(+), 1 deletion(-)


base-commit: 63ec871bc50a306aac550e2d85f697ca2d5f5deb
-- 
2.31.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
