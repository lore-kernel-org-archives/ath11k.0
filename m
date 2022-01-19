Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08732C433F5
	for <ath11k@archiver.kernel.org>; Wed, 19 Jan 2022 15:23:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=iewBh2s1PZeIbRsTrfVxlzmzkK5+arQltq3/B5uMckY=; b=UV4MxSrXz+doej
	px5RR2NiL67zGcTkShZgelnbODNUkbjq7yGIGc3GDqz8nYff1dOKLTEfudDgq9WdIw/4JbRR4rJUF
	OGUY+YcOmz+VHoiXA5CAywiu/Urn8ERIg69NzdHxFavx4mY9W/Ty7R7ztBz5Nstnl17nLq9gW/q48
	9G1Od3EG0DENVdAK2IZqS0VPGT4WuJ/nH+WcIdah38AxB84fw3Vm+K82p7nupq6ZJF9vxs+WnytgU
	/KfhWAimWm9CICpaJkyOlkR/tMOMUHVe8kC6L9fw94EjIWFYJBIgcV8Vo/2PNdxaXfVVHhyVSWe+r
	tW1HhOZsrlIKcg+23+uQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nACoE-0067uZ-A2; Wed, 19 Jan 2022 15:23:38 +0000
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nACoB-0067sS-CI
 for ath11k@lists.infradead.org; Wed, 19 Jan 2022 15:23:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1642605815; x=1674141815;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=WSAhAGkz0RGiwr+44Zh5fWkCgOy3QtsalCwavtqWhpk=;
 b=qwos2jSQkTqr2U+j+LQHUp7CLcdTpxX27aDKmsSna77bAuzsBnWgWn9o
 V6SdyYjZU0eGRsVskHvXl4i649UNbzqnSATGfMVoYSyLKJhgdYooGa8Aq
 uPgu9W+uDbbi3nrBieZEQ5yGnailBuMXdUnHJk20qliqWRqgNo4BdzFOk E=;
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 19 Jan 2022 07:23:33 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg04-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2022 07:23:33 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Wed, 19 Jan 2022 07:23:32 -0800
Received: from akolli-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Wed, 19 Jan 2022 07:23:30 -0800
From: Anilkumar Kolli <quic_akolli@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, Anilkumar Kolli <quic_akolli@quicinc.com>
Subject: [PATCH] ath11k: Fix uninitialized symbol 'rx_buf_sz'
Date: Wed, 19 Jan 2022 20:53:13 +0530
Message-ID: <1642605793-13518-1-git-send-email-quic_akolli@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220119_072335_492474_45A7DE55 
X-CRM114-Status: GOOD (  11.87  )
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

Add missing else statement in ath11k_dp_rx_process_mon_status()
to fix below smatch warnings,
    drivers/net/wireless/ath/ath11k/dp_rx.c:3105
    ath11k_dp_rx_process_mon_status()
    error: uninitialized symbol 'rx_buf_sz'.

Fixes: ab18e3bc1c13 ("ath11k: Fix pktlog lite rx events")

Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Anilkumar Kolli <quic_akolli@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/debugfs.h | 1 +
 drivers/net/wireless/ath/ath11k/dp_rx.c   | 7 +++++--
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/debugfs.h b/drivers/net/wireless/ath/ath11k/debugfs.h
index 4c0740394c95..71525d786bdf 100644
--- a/drivers/net/wireless/ath/ath11k/debugfs.h
+++ b/drivers/net/wireless/ath/ath11k/debugfs.h
@@ -88,6 +88,7 @@ enum ath11k_pktlog_mode {
 };
 
 enum ath11k_pktlog_enum {
+	ATH11K_PKTLOG_TYPE_INVALID      = 0,
 	ATH11K_PKTLOG_TYPE_TX_CTRL      = 1,
 	ATH11K_PKTLOG_TYPE_TX_STAT      = 2,
 	ATH11K_PKTLOG_TYPE_TX_MSDU_ID   = 3,
diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index 89b77b94bb20..99dc9b5bbf4b 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -5054,7 +5054,7 @@ int ath11k_dp_rx_process_mon_status(struct ath11k_base *ab, int mac_id,
 	struct ath11k_sta *arsta;
 	int num_buffs_reaped = 0;
 	u32 rx_buf_sz;
-	u16 log_type = 0;
+	u16 log_type;
 	struct ath11k_mon_data *pmon = (struct ath11k_mon_data *)&ar->dp.mon_data;
 	struct ath11k_pdev_mon_stats *rx_mon_stats = &pmon->rx_mon_stats;
 	struct hal_rx_mon_ppdu_info *ppdu_info = &pmon->mon_ppdu_info;
@@ -5076,9 +5076,12 @@ int ath11k_dp_rx_process_mon_status(struct ath11k_base *ab, int mac_id,
 		} else if (ath11k_debugfs_is_pktlog_rx_stats_enabled(ar)) {
 			log_type = ATH11K_PKTLOG_TYPE_RX_STATBUF;
 			rx_buf_sz = DP_RX_BUFFER_SIZE;
+		} else {
+			log_type = ATH11K_PKTLOG_TYPE_INVALID;
+			rx_buf_sz = 0;
 		}
 
-		if (log_type)
+		if (log_type != ATH11K_PKTLOG_TYPE_INVALID)
 			trace_ath11k_htt_rxdesc(ar, skb->data, log_type, rx_buf_sz);
 
 		hal_status = ath11k_hal_rx_parse_mon_status(ab, ppdu_info, skb);
-- 
2.7.4


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
