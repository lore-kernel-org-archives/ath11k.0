Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD8C2C43334
	for <ath11k@archiver.kernel.org>; Wed, 20 Jul 2022 13:49:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=FdaJkpjzV07iwKVa5GrS6bmY7BRe7cRTz08zPZ53z7k=; b=J7QM+Wa+qcTUDw
	BP10JGOweAS38rOpUBG7hSJRbUaDGHkjWs1QbcUFhX0ABQccbPFpDu/iMPZkfz2oELrHtGKoOPVhk
	6CjZv1V+iaU3rUXfbXBT8Rf+IAQzuq3Gf5Aac0LfiWxxC72tJznU5lSApwFTUt1NsBSJ+CJQS6job
	ai786NWmNShUArJjZxbfcbzmNn7rI70bfXqlWt3R1qeupiNava522cJ/n/MLQrfs54r6fJ/HjKbLF
	Zl4tQQfekV6sBIb30j9iHuivLyYVNcDod/9YMAGf2nLsAZpFArHU4nBFDuWUlhYQ2tZ5irIplzJ0m
	ldfTUbpMU7xHrIOWmnew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEA4w-006H4e-5j; Wed, 20 Jul 2022 13:49:30 +0000
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEA4s-006H2p-LD
	for ath11k@lists.infradead.org; Wed, 20 Jul 2022 13:49:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1658324966; x=1689860966;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=vqA6yuZJGho6dyZAsEPsu/n0tS5Hu+VCVfK2to0aRps=;
  b=lmZuwAyzUb8ri9QTLyK+rzbg2gAhpTrN4FoAJxtEiPRdjh2ZWmkwPVGz
   dryA0KzXkT5N96RLxWxWeMKw1/ZNz9b29/bFT+uwiHbLaPBG/MQvhfL58
   GdoMK7AaakmgtZsHT0YLCyETn5+NddFdOKa5xxph8DBl0NDH0xuw2VQH3
   w=;
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
  by alexa-out-sd-02.qualcomm.com with ESMTP; 20 Jul 2022 06:49:26 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg-SD-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2022 06:49:26 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 20 Jul 2022 06:49:25 -0700
Received: from mpubbise-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 20 Jul 2022 06:49:24 -0700
From: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, Manikanta Pubbisetty
	<quic_mpubbise@quicinc.com>
Subject: [PATCH 0/2] Add cold boot calibration support on WCN6750
Date: Wed, 20 Jul 2022 19:19:07 +0530
Message-ID: <20220720134909.15626-1-quic_mpubbise@quicinc.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220720_064926_736822_5E4D7A9E 
X-CRM114-Status: UNSURE (   6.28  )
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

Add cold boot calibration support on WCN6750.

Tested-on: WCN6750 hw1.0 AHB WLAN.MSL.1.0.1-00887-QCAMSLSWPLZ-1

Manikanta Pubbisetty (2):
  ath11k: Fix incorrect QMI message ID mappings
  ath11k: Add cold boot calibration support on WCN6750

 drivers/net/wireless/ath/ath11k/ahb.c  |  3 +-
 drivers/net/wireless/ath/ath11k/core.c |  9 ++++-
 drivers/net/wireless/ath/ath11k/hw.h   |  1 +
 drivers/net/wireless/ath/ath11k/qmi.c  | 52 +++++++++++++++++++++++++-
 drivers/net/wireless/ath/ath11k/qmi.h  | 10 ++++-
 5 files changed, 70 insertions(+), 5 deletions(-)

-- 
2.35.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
