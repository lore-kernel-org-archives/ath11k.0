Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 782EFC433F5
	for <ath11k@archiver.kernel.org>; Wed,  9 Feb 2022 06:09:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=IsYpRdi7BkIY75NrOjK9WEmTr6n6vmGy9En2tHFKDWs=; b=4aTwwRa7wDE7Nj
	hwGuxsaxr/QCODTS0cgq7UhHgyRONnubcEd7XBJ1Fy/bruV+Ot9OPdaTluLdccbXkHDNRQ+uqUPv7
	STInEArODZ48A4w8tY9tV0Ce/XlkiAft4dQaDEi0xg9V9IMQ6ulBDFo6HshFTPDsnZNEPwy6rybKR
	vgU3wjhM2g3n4mBeUQyQxuhy6fGaLRNYQRLIfC6BvWftHAjk+AJfbNiWsFwuOySDQ+Eg/h0QJVYD/
	2CcqrQ9Nz1JoIJ4N2Z1d2bieemIYNLgtlFHNEHMsB0Nyn1lJBTcnHQTmiJc69nfc/Y69Eno4DgLfW
	tSBQScS8vghI/mAnPrzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nHg9y-00GJmB-EA; Wed, 09 Feb 2022 06:08:58 +0000
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nHg9w-00GJls-Li
 for ath11k@lists.infradead.org; Wed, 09 Feb 2022 06:08:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1644386936; x=1675922936;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=a8LUtAfdXN4uBXEVf7VF4kSObYsPKpz31Px0X8lqd4c=;
 b=M0vX9fk1S6Nq5kvlSEJU+cKVpv5KL8exeCeaKMENRCHSl7B5W8+R1Nfu
 z39iMQ0YlN0H/8NvEqjqvArQiSesgZkse40MFZLLxD8vVIZdiVqFi6CVE
 LzDKocCLkWQ1/k2AP+KXvpafxbVOtFlBVll9kPR8YY6vIn2NecqpKNgMr E=;
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 08 Feb 2022 22:08:56 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg-SD-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2022 22:08:56 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Tue, 8 Feb 2022 22:08:35 -0800
Received: from wgong-HP3-Z230-SFF-Workstation.qca.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Tue, 8 Feb 2022 22:08:34 -0800
From: Wen Gong <quic_wgong@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_wgong@quicinc.com>
Subject: [PATCH] ath11k: fix uninitialized rate_idx in
 ath11k_dp_tx_update_txcompl()
Date: Wed, 9 Feb 2022 01:08:16 -0500
Message-ID: <20220209060816.423-1-quic_wgong@quicinc.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220208_220856_762385_3993A8CE 
X-CRM114-Status: UNSURE (   8.70  )
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

The rate_idx which passed to ath11k_debugfs_sta_add_tx_stats() by
ath11k_dp_tx_update_txcompl() is not initialized, add initialization
for it.

Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03003-QCAHSPSWPL_V1_V2_SILICONZ_LITE-2

Fixes: 1b8bb94c0612 ("ath11k: report tx bitrate for iw wlan station dump")
Signed-off-by: Wen Gong <quic_wgong@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/dp_tx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/dp_tx.c b/drivers/net/wireless/ath/ath11k/dp_tx.c
index 91d6244b6543..8402961c6688 100644
--- a/drivers/net/wireless/ath/ath11k/dp_tx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_tx.c
@@ -426,7 +426,7 @@ void ath11k_dp_tx_update_txcompl(struct ath11k *ar, struct hal_tx_status *ts)
 	struct ath11k_sta *arsta;
 	struct ieee80211_sta *sta;
 	u16 rate, ru_tones;
-	u8 mcs, rate_idx, ofdma;
+	u8 mcs, rate_idx = 0, ofdma;
 	int ret;
 
 	spin_lock_bh(&ab->base_lock);

base-commit: 76680d49b5e0e661bc4abcdaf13fb7e124b4ca08
-- 
2.31.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
