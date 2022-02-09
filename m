Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BA3BC433F5
	for <ath11k@archiver.kernel.org>; Wed,  9 Feb 2022 06:00:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9ve20S6uLghgHFGk0x4ItE5kbb8XOat4wUJ+3qQTE20=; b=AUD9qckgNtGS/m
	Iz1+AGtnX/Wuam8+sPfKo3w5XUsJ1db7Yk0FmBLpejU76b6+u0U5evnqntapYrfYL5OSSNpsgXC9N
	KgHS8zW1V/8qUyTVwESy/3JJuk53RVm5bwlMu4NIDWlRal5Ef3Npdt1567FotTneZceuOCi5QNLJU
	GjBMuR92ggi3VnZQVw0SuWubXGn6uiYV035AJAvhq14+0e4/XTxxeMrK7EQh+8K+2IVgiHQHTsn34
	3Vcb5MUB+wG+BoOLk7WpWT5lQObLO+S9WBoANZOYduTy5Vnc28Hr8UMgpsZZ8twpZWNPwEMOZHmE4
	RsaKOsby50xzSuq4/YKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nHg1s-00GIff-5w; Wed, 09 Feb 2022 06:00:36 +0000
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nHg1p-00GId7-7v
 for ath11k@lists.infradead.org; Wed, 09 Feb 2022 06:00:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1644386433; x=1675922433;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WGEjXkVGFhTU957zTolVhkouWPqy67tUlqjNpmOkYis=;
 b=hAKckWPleoe7gBG6B63b9Ht81IPWjeSGYZiioCpk0cuRLePIH7BTW4s9
 j2WesFjN/ICjQ4xarEMsGPXYHV2OuQopfNCmvFT1d/bGBDNbbWJJ4ycP2
 sn16gRJSSKsqmQyERqYJoNZu6332uScHDDTHptvntYBYEGvHjuHgZyhaC s=;
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 08 Feb 2022 22:00:33 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg04-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2022 22:00:33 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Tue, 8 Feb 2022 22:00:32 -0800
Received: from wgong-HP3-Z230-SFF-Workstation.qca.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Tue, 8 Feb 2022 22:00:31 -0800
From: Wen Gong <quic_wgong@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_wgong@quicinc.com>
Subject: [PATCH v6 3/6] ath11k: configure RDDM size to mhi for recovery by
 firmware
Date: Wed, 9 Feb 2022 01:00:09 -0500
Message-ID: <20220209060012.32478-4-quic_wgong@quicinc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220209060012.32478-1-quic_wgong@quicinc.com>
References: <20220209060012.32478-1-quic_wgong@quicinc.com>
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220208_220033_333565_E4541915 
X-CRM114-Status: UNSURE (   8.22  )
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

The rddm_size is needed by firmware while mhi enter RDDM state, add it
to support recovery when ath11k receive MHI_CB_EE_RDDM message.

Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03003-QCAHSPSWPL_V1_V2_SILICONZ_LITE-2

Signed-off-by: Wen Gong <quic_wgong@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/mhi.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/mhi.c b/drivers/net/wireless/ath/ath11k/mhi.c
index 8b2143802816..fc3524e83e52 100644
--- a/drivers/net/wireless/ath/ath11k/mhi.c
+++ b/drivers/net/wireless/ath/ath11k/mhi.c
@@ -13,6 +13,7 @@
 #include "pci.h"
 
 #define MHI_TIMEOUT_DEFAULT_MS	90000
+#define RDDM_DUMP_SIZE	0x420000
 
 static struct mhi_channel_config ath11k_mhi_channels_qca6390[] = {
 	{
@@ -382,6 +383,7 @@ int ath11k_mhi_register(struct ath11k_pci *ab_pci)
 		mhi_ctrl->iova_stop = 0xFFFFFFFF;
 	}
 
+	mhi_ctrl->rddm_size = RDDM_DUMP_SIZE;
 	mhi_ctrl->sbl_size = SZ_512K;
 	mhi_ctrl->seg_len = SZ_512K;
 	mhi_ctrl->fbc_download = true;
-- 
2.31.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
