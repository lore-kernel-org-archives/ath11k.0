Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AA6BC4332F
	for <ath11k@archiver.kernel.org>; Thu, 25 Nov 2021 08:45:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=XCC+2nr2ZzNj12zYDbNaeDJBuBHuuBZ4GS3WDwxDNnw=; b=TB2GQzH+lcnJa+
	43eJd6Z/j3dqjGVUQW4jUzeTlA+WN6CZWgV1f0zaGsmCm/O8gb+DVSCC+/AIzbl9JcjlVzPXt5jFU
	/zchiStKP1VD2COuqAVR98duHl0AFuC4+KUl7qh2aXVAvaFDXkhpadNqIhPRC83I8D5ZbqXO6voi5
	ECm+wotfKmNCZH19hBcG8UCjaVP2G1tBtS+GWGoH9ecnX+BDg2cUS4nCtFcdXhdPMU8xmrf1nIqVv
	hTVDaaW+7V+5kPj4jT1PYOHxDNZyXZj9KjpWZCszFDf0sMKJDKPEphxX817qp9FlQejJon9v5uOta
	QJUd2w+Ae6+D0EhXK1Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mqANd-006lBN-F9; Thu, 25 Nov 2021 08:45:21 +0000
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mqANa-006lA6-J9
 for ath11k@lists.infradead.org; Thu, 25 Nov 2021 08:45:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1637829918; x=1669365918;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=n7JTmABnHGbCDFRTgvk6w5xUhqfeJdFM3tMJsvJWUyk=;
 b=VfMXt9AnNSPno2o1E4wJbKs/Qm6y+WZquJTDOAV5JlvdkVNAiyh0nkH5
 IF+2i0oD68l/JaApi6OBMsRVRL/C6ShOHhZ2xrKEMx3xK87yuoUOlDpsa
 YtSW6EDKLpI+U8phI0qfkEElvG0mM90P0DD7n4IyHAQi70YvtkPPVYM48 U=;
Received: from unknown (HELO ironmsg03-sd.qualcomm.com) ([10.53.140.143])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 25 Nov 2021 00:45:16 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg03-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2021 00:45:16 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Thu, 25 Nov 2021 00:45:16 -0800
Received: from wgong-HP3-Z230-SFF-Workstation.qca.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Thu, 25 Nov 2021 00:45:14 -0800
From: Wen Gong <quic_wgong@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_wgong@quicinc.com>
Subject: [PATCH v3 0/2] ath11k: add handler for board-2.bin without variant
 and read SMBIOS
Date: Thu, 25 Nov 2021 03:44:56 -0500
Message-ID: <20211125084458.16352-1-quic_wgong@quicinc.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211125_004518_703419_5828A4DE 
X-CRM114-Status: UNSURE (   6.06  )
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

 drivers/net/wireless/ath/ath11k/core.c | 93 ++++++++++++++++++++++++--
 drivers/net/wireless/ath/ath11k/core.h | 11 +++
 drivers/net/wireless/ath/ath11k/qmi.c  |  4 ++
 3 files changed, 104 insertions(+), 4 deletions(-)

-- 
2.31.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
