Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F2ACC433F5
	for <ath11k@archiver.kernel.org>; Tue,  8 Feb 2022 10:50:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yTbsI6eNoJ8kZ/QGmST/MrJJVrihKpWN96Ei6mm1h+w=; b=JyXwF34nqqQ0w2
	J965sZ3ccEqTjl2ifHb+lFBcCzJNAFjLpgEgmROvAMiPpKjtio6qKghx3EdH4FSi1xnwWA7JXbY94
	AF7/O9MsQKDthDPgLcO+hbJ/zBV76oFQf2VzNMIagvtSUkPHmojYxLNc27+Ee6SBDdo3P0OAOKKmr
	2PTuE4gpnbOKI1Zo3OFuQADvNb0qaYY5odJ+LAI4t33lSBfLop2354YYQmTMNzEKDNZRk+tbs3KpS
	Dmqq6zSskAY7jNT/R1wBFXbo2mzHuWg7mGJ3E5yK00zrg5m/QLsATDPLJgsolh8sSBZ+fP+729+Ez
	j9Qh0F/S1zVsBMeXaP9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nHO4Y-00DSE3-TU; Tue, 08 Feb 2022 10:50:10 +0000
Received: from alexa-out.qualcomm.com ([129.46.98.28])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nHO4V-00DSBL-C6
 for ath11k@lists.infradead.org; Tue, 08 Feb 2022 10:50:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1644317407; x=1675853407;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8sFRowBrZUQbuQBPU+58EtVEn7T1f3V+S81NPUd/CV0=;
 b=giOTock8PTbiAr2JwCRl0w/oTqFwB/YR6S00fFOgaaCy7UNvl0MlNTz+
 dueUHQrWfR0DWH//Sj8qRxauvVBAWVZQ1lRqTYGUDJQfHOt12T+nq5z+h
 qn2omJ4aHZL29i5k8AaYJ/dJnbhgo5+Tbx8lF7fXDT26cwpAoDs8C3J0Y A=;
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
 by alexa-out.qualcomm.com with ESMTP; 08 Feb 2022 02:50:06 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg08-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2022 02:50:06 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Tue, 8 Feb 2022 02:50:05 -0800
Received: from wgong-HP3-Z230-SFF-Workstation.qca.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Tue, 8 Feb 2022 02:50:04 -0800
From: Wen Gong <quic_wgong@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_wgong@quicinc.com>
Subject: [PATCH v5 2/5] ath11k: fix invalid m3 buffer address
Date: Tue, 8 Feb 2022 05:49:44 -0500
Message-ID: <20220208104947.25791-3-quic_wgong@quicinc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220208104947.25791-1-quic_wgong@quicinc.com>
References: <20220208104947.25791-1-quic_wgong@quicinc.com>
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220208_025007_493962_C8F2C170 
X-CRM114-Status: UNSURE (   7.64  )
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

From: Carl Huang <quic_cjhuang@quicinc.com>

This is to fix m3 buffer reuse issue as m3_mem->size isn't set to
ZERO in free function, which leads invalid m3 downloading to
firmware and firmware crashed.

Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03003-QCAHSPSWPL_V1_V2_SILICONZ_LITE-2

Signed-off-by: Carl Huang <quic_cjhuang@quicinc.com>
Signed-off-by: Wen Gong <quic_wgong@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/qmi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/ath/ath11k/qmi.c b/drivers/net/wireless/ath/ath11k/qmi.c
index 1144e828cf5c..d4d831566a89 100644
--- a/drivers/net/wireless/ath/ath11k/qmi.c
+++ b/drivers/net/wireless/ath/ath11k/qmi.c
@@ -2342,6 +2342,7 @@ static void ath11k_qmi_m3_free(struct ath11k_base *ab)
 	dma_free_coherent(ab->dev, m3_mem->size,
 			  m3_mem->vaddr, m3_mem->paddr);
 	m3_mem->vaddr = NULL;
+	m3_mem->size = 0;
 }
 
 static int ath11k_qmi_wlanfw_m3_info_send(struct ath11k_base *ab)
-- 
2.31.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
