Return-Path: <SRS0=uMcA=P6=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A820FC433F5
	for <ath11k@archiver.kernel.org>; Thu, 11 Nov 2021 05:53:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6F32D61053
	for <ath11k@archiver.kernel.org>; Thu, 11 Nov 2021 05:53:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6F32D61053
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=quicinc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ihIEwJqfqp6ZimSxcMGLHDJzBccpge6IhWFC5nmDk8U=; b=frwj2XgAG/IGan
	PsNN+lNpV66oUnA2YAp0Zkk0awL3LUBBn5+agGqeQRq9fnGxpJwz0jQgalxpNpQiwL3Ze5aLUms2p
	skT+O57ZhogYE8x/42X3kSaJrRHl1ZG5brbsfMSyAeeWZ0axPaNNDREbcN/CRDxZ0gISKJyJ90KHw
	2Aoy/Jr7VAcJ+ioAY6xntGlDfHo3DDb/91tpQnp4+6ySSLtgyDBbGxhmKrQRTJ7Vmox0H9rahu/xt
	VQmywDqwnAP03jbHIW+Zplb/IddnIsQ0YD/U5y3kAr+XWRz/gigM8SfMcpVpt2jETvQRuTWZ/Uo+Y
	Otfg7djGPSOLiNywe0zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ml31F-007HVE-Gw; Thu, 11 Nov 2021 05:53:05 +0000
Received: from alexa-out.qualcomm.com ([129.46.98.28])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ml31D-007HUq-3F
 for ath11k@lists.infradead.org; Thu, 11 Nov 2021 05:53:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1636609983; x=1668145983;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=kdcG9M1jEfEUbVcHne7k0qgSUkqp4rnMdn+E//9zTcU=;
 b=gbvZHqQMIyciYA+L8p1+T0iV7BCb07uHJdkRaeUdTJWGMTc+Z/EsfQ9C
 cejcT5OWk2+ZOzDfsJc9zu9KEY2vy+F5O1U2Hhq78Uwb/5JSc9QAvJrVt
 b2DeM+owwT+LraQlaoZT4WWBpLhjPul9TCvkVReNPaigNrCF7VJTbtzkp U=;
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
 by alexa-out.qualcomm.com with ESMTP; 10 Nov 2021 21:53:00 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg09-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2021 21:53:00 -0800
Received: from nalasex01b.na.qualcomm.com (10.47.209.197) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.7; 
 Wed, 10 Nov 2021 21:53:00 -0800
Received: from seevalam-linux.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.7; 
 Wed, 10 Nov 2021 21:52:58 -0800
From: Seevalamuthu Mariappan <quic_seevalam@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, Seevalamuthu Mariappan
 <quic_seevalam@quicinc.com>
Subject: [PATCH] ath11k: Fix 'unused-but-set-parameter' error
Date: Thu, 11 Nov 2021 11:22:47 +0530
Message-ID: <1636609967-5114-1-git-send-email-quic_seevalam@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211110_215303_242407_B66E2327 
X-CRM114-Status: UNSURE (   8.59  )
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

Below compilation error is reported when built with W=1,

drivers/net/wireless/ath/ath11k/mac.c:5408:22: error: parameter 'changed_flags' set but not used [-Werror,-Wunused-but-set-parameter]

changed_flags is set, but left unused. So, remove unnecessary set.
Compile tested only.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Seevalamuthu Mariappan <quic_seevalam@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/mac.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 89810b2..6f3130d 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -5919,7 +5919,6 @@ static void ath11k_mac_op_configure_filter(struct ieee80211_hw *hw,
 
 	mutex_lock(&ar->conf_mutex);
 
-	changed_flags &= SUPPORTED_FILTERS;
 	*total_flags &= SUPPORTED_FILTERS;
 	ar->filter_flags = *total_flags;
 
-- 
2.7.4


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
