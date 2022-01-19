Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F11E6C433EF
	for <ath11k@archiver.kernel.org>; Wed, 19 Jan 2022 09:18:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=8FcoUchsSs4zrESKY/kz6WEiCte0e1dQ2dbEcfBVEF0=; b=UHUkVwSkvJlQMF
	m1b2AvN6Rjrl4UIlEm4rqnzaygUD3BXzquQzimEmLT8UtgoHFICNekPeL4p5GRizZ3iRBEeT4sWn+
	Io1NzbUVcTl7yT3spUqKCVp+8XhTTuVK612lTSGHC4PiTZzM541ObItdoAY46tSzzx6gD1aEF8JN5
	1qVTbEE37RIa5PCk75hsXn+EfjCveHQ/EGO5LdyubBBc9MNJqr+12kCiglXsoUI2a1d9yBQWpiRuQ
	rxeCiD9VnATNP8t2skgL7IbuMS6ICCd8OLuJ8mIGAyT+AZ5Hm01bpWchiJeRMC9gQoj+srQzFVnbd
	xSkRPZ1Gd0S4PTiOM9Gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nA771-004WzK-1F; Wed, 19 Jan 2022 09:18:39 +0000
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nA76x-004Wy8-NC
 for ath11k@lists.infradead.org; Wed, 19 Jan 2022 09:18:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1642583915; x=1674119915;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=Yl1IAdxTibpox69ABhbYjQVyClR+0xgOoYkTwSrAyV4=;
 b=YuO3h7Q5HVFS1JFoWmwY0iLvqLD1buyjr6KUuf8WJYONH0gpeYuxm9OS
 1bRCS+KBOxR0225Z9Ydr4NL+DApbYGB6+ih6m7xGbLSTBsAlZ6zMGpB1E
 U90vEmYdjACy1SR0Clp5FBbidjSUnacPdu5WdTdC7Ofy/a1+2Ih74YKUL M=;
Received: from unknown (HELO ironmsg02-sd.qualcomm.com) ([10.53.140.142])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 19 Jan 2022 01:18:32 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg02-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2022 01:18:32 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Wed, 19 Jan 2022 01:18:32 -0800
Received: from vnaralas-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Wed, 19 Jan 2022 01:18:30 -0800
From: Venkateswara Naralasetty <quic_vnaralas@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, Venkateswara Naralasetty
 <quic_vnaralas@quicinc.com>
Subject: [PATCH] ath11k: Rename ath11k_ahb_ext_irq_config
Date: Wed, 19 Jan 2022 14:48:13 +0530
Message-ID: <1642583893-21485-1-git-send-email-quic_vnaralas@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220119_011835_831523_08D6C69D 
X-CRM114-Status: GOOD (  11.07  )
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

Rename ath11k_ahb_ext_irq_config() to ath11k_ahb_config_ext_irq()
for just symmetry with ath11k_ahb_free_ext_irq().

Signed-off-by: Venkateswara Naralasetty <quic_vnaralas@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/ahb.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/ahb.c b/drivers/net/wireless/ath/ath11k/ahb.c
index 3fb0aa0..3fcec42 100644
--- a/drivers/net/wireless/ath/ath11k/ahb.c
+++ b/drivers/net/wireless/ath/ath11k/ahb.c
@@ -466,7 +466,7 @@ static irqreturn_t ath11k_ahb_ext_interrupt_handler(int irq, void *arg)
 	return IRQ_HANDLED;
 }
 
-static int ath11k_ahb_ext_irq_config(struct ath11k_base *ab)
+static int ath11k_ahb_config_ext_irq(struct ath11k_base *ab)
 {
 	struct ath11k_hw_params *hw = &ab->hw_params;
 	int i, j;
@@ -574,7 +574,7 @@ static int ath11k_ahb_config_irq(struct ath11k_base *ab)
 	}
 
 	/* Configure external interrupts */
-	ret = ath11k_ahb_ext_irq_config(ab);
+	ret = ath11k_ahb_config_ext_irq(ab);
 
 	return ret;
 }
-- 
2.7.4


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
