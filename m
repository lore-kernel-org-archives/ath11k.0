Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E49C9C433EF
	for <ath11k@archiver.kernel.org>; Thu,  2 Jun 2022 11:57:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=WxbVtRs/rKIA95CVBIptSxP+czv5wL39ZCZMDBrEo5c=; b=XOa/uhrzQ2HmAi
	SNKOIdY4x1vqqhFfkbkqLbRbur2f8omPyraU9QY4vjKAj0YqAIuw1PPuAmm3jzjc0w5msQZ3CbdK/
	CJIO4WCbCaHe8vBQgkVqiZaODuV5QtpMOymDAo5W15LNXgA6vmH4yHxoaupGqtCuSnqV5vX5/rmDc
	itIR/bBXQjwOpT5bdCKlrvkGVdXhIHogmovcEcLjAHmFPCOcrSEQ4dBtU9hlBl/Cp6ol4VOVRmAyH
	42AdJ6Dj/d91qFTHGOKziJVroWa5HbCUtop7+KVy0EH/5ho+IbnoDTYdlZL4yApqJP+TCNo4KBKq/
	c+DNmd59vtspDpGqZtnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwjRv-0034A8-Je; Thu, 02 Jun 2022 11:57:11 +0000
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwjRY-0033zY-QW
	for ath11k@lists.infradead.org; Thu, 02 Jun 2022 11:56:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1654171008; x=1685707008;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=JNT6fGFfjvEGnyGfBhVmqpEQJlxF7qvszVyjGUy0bOc=;
  b=Z4nlriUMo8K94UZ+3x6JKkTPDJ3+ngazh/hsOMQuv/2whxwsIx2sY5nC
   Hk7po+S30u7udJCEQRBgQXVPYT9yN+DXrAZND7U7I7heyOm2JU0JQ3kN2
   dTfq5jo/N7M1E2mNyiQB+WbD2TomfJLMDyM62Q0hWqGDLj2RLxdMEcfeW
   A=;
Received: from unknown (HELO ironmsg02-sd.qualcomm.com) ([10.53.140.142])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 02 Jun 2022 04:56:44 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg02-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2022 04:56:44 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Thu, 2 Jun 2022 04:56:44 -0700
Received: from mpubbise-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Thu, 2 Jun 2022 04:56:42 -0700
From: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, Manikanta Pubbisetty
	<quic_mpubbise@quicinc.com>
Subject: [PATCH] ath11k: Fix incorrect debug_mask mappings
Date: Thu, 2 Jun 2022 17:26:21 +0530
Message-ID: <20220602115621.15339-1-quic_mpubbise@quicinc.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220602_045648_942232_7F9FD87F 
X-CRM114-Status: UNSURE (   9.77  )
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

Currently a couple of debug_mask entries are mapped to the same value,
this could enable unintended driver logging. If enabling DP_TX logs was
the intention, then this could also enable PCI logs flooding the dmesg
buffer or vice versa. Fix this by correctly assigning the debug masks.

Found during code review.

Tested-on: WCN6750 hw1.0 AHB WLAN.MSL.1.0.1-00887-QCAMSLSWPLZ-1

Fixes: aa2092a9bab3f ("ath11k: add raw mode and software crypto support")
Signed-off-by: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/debug.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/debug.h b/drivers/net/wireless/ath/ath11k/debug.h
index fbbd5fe02aa8..91545640c47b 100644
--- a/drivers/net/wireless/ath/ath11k/debug.h
+++ b/drivers/net/wireless/ath/ath11k/debug.h
@@ -23,8 +23,8 @@ enum ath11k_debug_mask {
 	ATH11K_DBG_TESTMODE	= 0x00000400,
 	ATH11k_DBG_HAL		= 0x00000800,
 	ATH11K_DBG_PCI		= 0x00001000,
-	ATH11K_DBG_DP_TX	= 0x00001000,
-	ATH11K_DBG_DP_RX	= 0x00002000,
+	ATH11K_DBG_DP_TX	= 0x00002000,
+	ATH11K_DBG_DP_RX	= 0x00004000,
 	ATH11K_DBG_ANY		= 0xffffffff,
 };
 
-- 
2.35.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
