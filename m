Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83784C433F5
	for <ath11k@archiver.kernel.org>; Mon, 20 Dec 2021 06:50:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+zHeac8S2ttlCCbsx3r7RPUXomEGdmpJuUOk6sKtorw=; b=ub8my8jezd39uR
	08omMP396S+avfIDlMncLnozDeneKxSdJmOklOIGn7ryq88ggeQbiY0nNvt5sI+ugnqMEDkAd64zX
	gDZokQGrcGYbvKPy4uQCwwom1+brsmw/cgzDsztedYk4+0VTLvvIwm5kFEoR9L87ESsnajdjVw2iK
	7tXr6WXXkLTvcaUOPEw+cwojUTqR7DdKpvFh7yWre+gRohY7GkzXCtqXKt+kJvaiKPSPO5u3/0BXO
	8PnkTcHz04fWS/jrNNOQdMFpouaaKLalSzhViTgZ+vRj1HPGYagbGjV92D9P2n3jJLvhZFYOnQETu
	FHsroVjtF08+Hkl9lpJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mzCVM-000tk5-CP; Mon, 20 Dec 2021 06:50:40 +0000
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mzCVJ-000tip-Jh
 for ath11k@lists.infradead.org; Mon, 20 Dec 2021 06:50:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1639983037; x=1671519037;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=9b4fjRJttUTuRZlt/18dgyodwSFqYIP4t+yCyXJAPa4=;
 b=IymZKkEB8AJOe6r8WGqYcPvhrbo9WzEeHmipQUmG07rXkjCRPEoElMPv
 PeT+VM+SFcaKkRTQh77ReNr0B4NamdDceRWvpR8Jde177pCtW2EVl2gT7
 H3Ch0iqfwBFQIymTrnY2x55FAnOTkMzbCbsnQm7/5nqqMfr39sN9Cr8w4 0=;
Received: from unknown (HELO ironmsg02-sd.qualcomm.com) ([10.53.140.142])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 19 Dec 2021 22:50:36 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg02-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2021 22:50:36 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Sun, 19 Dec 2021 22:50:36 -0800
Received: from wgong-HP3-Z230-SFF-Workstation.qca.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Sun, 19 Dec 2021 22:50:34 -0800
From: Wen Gong <quic_wgong@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_wgong@quicinc.com>
Subject: [PATCH v5 0/2] ath11k: add handler for board-2.bin without variant
 and read SMBIOS
Date: Mon, 20 Dec 2021 01:48:27 -0500
Message-ID: <20211220064829.17557-1-quic_wgong@quicinc.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211219_225037_696499_2A8367EC 
X-CRM114-Status: UNSURE (   5.85  )
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

 drivers/net/wireless/ath/ath11k/core.c | 109 +++++++++++++++++++++++--
 drivers/net/wireless/ath/ath11k/core.h |  11 +++
 drivers/net/wireless/ath/ath11k/qmi.c  |   4 +
 3 files changed, 118 insertions(+), 6 deletions(-)


base-commit: 12018ad8603a598d773e2cae12542a1981c94886
-- 
2.31.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
