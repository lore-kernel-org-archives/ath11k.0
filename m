Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4682C433EF
	for <ath11k@archiver.kernel.org>; Tue, 10 May 2022 03:11:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=pKc1Bfy4EdUNNh626WJ87nuiajBYrP1sT/WQeZj0oiE=; b=ruo3LtabR3FcWy
	/wVFnd25FPj5N+e7tq/zYKVHgFtNpT+vM8AMgxDWH4E4o01oI5vX5w14YCx6Gb0/4fk+nOsQgwkv7
	yqLZTXvh5Ce5waQTghk7idB8TxnOOLgg8iOoSMHHgCFeqzkPJ/LG7DYz5TQHcJIHlSMHfNgmNhagq
	Yc8oe50nNDZ/GEq9G/lT6k+pd6HOU6Cln1Kp2Zjcw7r10mbkNaz4PXaJ+pL1QetOP/gONOV02s2sQ
	lpob+Ubz0/fEbggBFTGhEnqXhWa/O5WUl/1dDyA1eJy1uAhHl06RIrQK051jEem3VQS52DQNHsK2l
	EE+xI81VjQ3FHeg7JqYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1noGHH-00HFaY-Hq; Tue, 10 May 2022 03:11:11 +0000
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1noGHD-00HFYQ-ME
 for ath11k@lists.infradead.org; Tue, 10 May 2022 03:11:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1652152266; x=1683688266;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=V7r9UDAF32Op6nQWPJgUB1GtZAZUSeIIpJjBWj7lUK0=;
 b=zPXQiPJnL3uKHzZrcUnfecfHJHm53HcFVsoPUJ8jGQu+Nsm+6FsGSxXd
 jpCuhWZHCpibmpFY0/vw9SIIwBEm+vGfErJUS5UMd8ZajjnwBOjTRFg6I
 frZ+w+dB6Khk/byZrC40eQRX2dvanZdSEl105cmQZ4AcQa3EuozaqtAzh 0=;
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 09 May 2022 20:10:56 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg-SD-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2022 20:10:57 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Mon, 9 May 2022 20:10:57 -0700
Received: from srirrama-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Mon, 9 May 2022 20:10:55 -0700
From: Sriram R <quic_srirrama@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, Sriram R <quic_srirrama@quicinc.com>
Subject: [PATCH] ath11k: update missing mumimo and ofdma stats
Date: Tue, 10 May 2022 08:40:36 +0530
Message-ID: <1652152236-12038-1-git-send-email-quic_srirrama@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220509_201107_802954_196536CE 
X-CRM114-Status: GOOD (  14.88  )
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

Update the missing MU-MIMO/OFDMA info in PDEV RX,
trigger and schedule stats. i.e HTT stats type 10, 12 and 17
respectively.

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.4-01209-QCAHKSWPL_SILICONZ-1

Signed-off-by: Sriram R <quic_srirrama@quicinc.com>
---
 .../net/wireless/ath/ath11k/debugfs_htt_stats.c    | 78 +++++++++++++++++++++-
 .../net/wireless/ath/ath11k/debugfs_htt_stats.h    | 36 ++++++++++
 2 files changed, 113 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/debugfs_htt_stats.c b/drivers/net/wireless/ath/ath11k/debugfs_htt_stats.c
index 4484235..4517a3e 100644
--- a/drivers/net/wireless/ath/ath11k/debugfs_htt_stats.c
+++ b/drivers/net/wireless/ath/ath11k/debugfs_htt_stats.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: BSD-3-Clause-Clear
 /*
  * Copyright (c) 2018-2019 The Linux Foundation. All rights reserved.
+ * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
 #include <linux/vmalloc.h>
@@ -1403,6 +1404,8 @@ htt_print_tx_selfgen_ax_stats_tlv(const void *tag_buf,
 			 htt_stats_buf->ax_mu_mimo_brpoll_7);
 	len += scnprintf(buf + len, buf_len - len, "ax_basic_trigger = %u\n",
 			 htt_stats_buf->ax_basic_trigger);
+	len += scnprintf(buf + len, buf_len - len, "ax_ulmumimo_trigger = %u\n",
+			 htt_stats_buf->ax_ulmumimo_trigger);
 	len += scnprintf(buf + len, buf_len - len, "ax_bsr_trigger = %u\n",
 			 htt_stats_buf->ax_bsr_trigger);
 	len += scnprintf(buf + len, buf_len - len, "ax_mu_bar_trigger = %u\n",
@@ -1485,6 +1488,8 @@ htt_print_tx_selfgen_ax_err_stats_tlv(const void *tag_buf,
 			 htt_stats_buf->ax_mu_mimo_brp7_err);
 	len += scnprintf(buf + len, buf_len - len, "ax_basic_trigger_err = %u\n",
 			 htt_stats_buf->ax_basic_trigger_err);
+	len += scnprintf(buf + len, buf_len - len, "ax_ulmumimo_trigger_err = %u\n",
+			 htt_stats_buf->ax_ulmumimo_trigger_err);
 	len += scnprintf(buf + len, buf_len - len, "ax_bsr_trigger_err = %u\n",
 			 htt_stats_buf->ax_bsr_trigger_err);
 	len += scnprintf(buf + len, buf_len - len, "ax_mu_bar_trigger_err = %u\n",
@@ -1519,6 +1524,16 @@ htt_print_tx_pdev_mu_mimo_sch_stats_tlv(const void *tag_buf,
 	len += scnprintf(buf + len, buf_len - len, "mu_mimo_ppdu_posted = %u\n\n",
 			 htt_stats_buf->mu_mimo_ppdu_posted);
 
+	for (i = 0; i < HTT_TX_PDEV_STATS_NUM_AC_MUMIMO_USER_STATS; i++)
+		len += scnprintf(buf + len, buf_len - len,
+				 "ac_mu_mimo_sch_posted_per_group_index %u = %u\n",
+				 i, htt_stats_buf->ac_mu_mimo_sch_posted_per_grp_sz[i]);
+
+	for (i = 0; i < HTT_TX_PDEV_STATS_NUM_AX_MUMIMO_USER_STATS; i++)
+		len += scnprintf(buf + len, buf_len - len,
+				 "ax_mu_mimo_sch_posted_per_group_index %u = %u\n",
+				 i, htt_stats_buf->ax_mu_mimo_sch_posted_per_grp_sz[i]);
+
 	len += scnprintf(buf + len, buf_len - len, "11ac MU_MIMO SCH STATS:\n");
 
 	for (i = 0; i < HTT_TX_PDEV_STATS_NUM_AC_MUMIMO_USER_STATS; i++)
@@ -1535,10 +1550,34 @@ htt_print_tx_pdev_mu_mimo_sch_stats_tlv(const void *tag_buf,
 
 	len += scnprintf(buf + len, buf_len - len, "\n11ax OFDMA SCH STATS:\n");
 
-	for (i = 0; i < HTT_TX_PDEV_STATS_NUM_OFDMA_USER_STATS; i++)
+	for (i = 0; i < HTT_TX_PDEV_STATS_NUM_OFDMA_USER_STATS; i++) {
 		len += scnprintf(buf + len, buf_len - len,
 				 "ax_ofdma_sch_nusers_%u = %u\n",
 				 i, htt_stats_buf->ax_ofdma_sch_nusers[i]);
+		len += scnprintf(buf + len, buf_len - len,
+				 "ax_ul_ofdma_basic_sch_nusers_%u = %u\n",
+				 i, htt_stats_buf->ax_ul_ofdma_basic_sch_nusers[i]);
+		len += scnprintf(buf + len, buf_len - len,
+				 "ax_ul_ofdma_bsr_sch_nusers_%u = %u\n",
+				 i, htt_stats_buf->ax_ul_ofdma_bsr_sch_nusers[i]);
+		len += scnprintf(buf + len, buf_len - len,
+				 "ax_ul_ofdma_sch_bar_nusers_%u = %u\n",
+				 i, htt_stats_buf->ax_ul_ofdma_bar_sch_nusers[i]);
+		len += scnprintf(buf + len, buf_len - len,
+				 "ax_ul_ofdma_brp_sch_nusers_%u = %u\n",
+				 i, htt_stats_buf->ax_ul_ofdma_brp_sch_nusers[i]);
+	}
+
+	len += scnprintf(buf + len, buf_len - len, "\n11ax UL MUMIO SCH STATS:\n");
+
+	for (i = 0; i < HTT_TX_PDEV_STATS_NUM_UL_MUMIMO_USER_STATS; i++) {
+		len += scnprintf(buf + len, buf_len - len,
+				 "ax_ul_mumimo_basic_sch_nusers_%u = %u\n",
+				 i, htt_stats_buf->ax_ul_mumimo_basic_sch_nusers[i]);
+		len += scnprintf(buf + len, buf_len - len,
+				 "ax_ul_mumimo_brp_sch_nusers_%u = %u\n",
+				 i, htt_stats_buf->ax_ul_mumimo_brp_sch_nusers[i]);
+	}
 
 	if (len >= buf_len)
 		buf[buf_len - 1] = 0;
@@ -2933,6 +2972,19 @@ static inline void htt_print_rx_pdev_rate_stats_tlv(const void *tag_buf,
 	len += scnprintf(buf + len, buf_len - len, "txbf = %u\n",
 			 htt_stats_buf->txbf);
 
+	len += scnprintf(buf + len, buf_len - len, "\nrx_su_ndpa = %u",
+			 htt_stats_buf->rx_su_ndpa);
+	PRINT_ARRAY_TO_BUF(buf, len, htt_stats_buf->rx_11ax_su_txbf_mcs,
+			   "rx_11ax_su_txbf_mcs", HTT_RX_PDEV_STATS_NUM_MCS_COUNTERS, "\n");
+
+	len += scnprintf(buf + len, buf_len - len, "\nrx_mu_ndpa = %u",
+			 htt_stats_buf->rx_mu_ndpa);
+	PRINT_ARRAY_TO_BUF(buf, len, htt_stats_buf->rx_11ax_mu_txbf_mcs,
+			   "rx_11ax_mu_txbf_mcs", HTT_RX_PDEV_STATS_NUM_MCS_COUNTERS, "\n");
+
+	len += scnprintf(buf + len, buf_len - len, "\nrx_br_poll = %u",
+			 htt_stats_buf->rx_br_poll);
+
 	PRINT_ARRAY_TO_BUF(buf, len, htt_stats_buf->rx_legacy_cck_rate,
 			   "rx_legacy_cck_rate",
 			   HTT_RX_PDEV_STATS_NUM_LEGACY_CCK_STATS, "\n");
@@ -2995,6 +3047,30 @@ static inline void htt_print_rx_pdev_rate_stats_tlv(const void *tag_buf,
 		len += scnprintf(buf + len, buf_len - len, "\n");
 	}
 
+	PRINT_ARRAY_TO_BUF(buf, len, htt_stats_buf->rx_ulofdma_non_data_nusers,
+			   "rx_ulofdma_non_data_nusers", HTT_RX_PDEV_MAX_OFDMA_NUM_USER, "\n");
+
+	PRINT_ARRAY_TO_BUF(buf, len, htt_stats_buf->rx_ulofdma_data_nusers,
+			   "rx_ulofdma_data_nusers", HTT_RX_PDEV_MAX_OFDMA_NUM_USER, "\n");
+
+	PRINT_ARRAY_TO_BUF(buf, len, htt_stats_buf->rx_11ax_dl_ofdma_mcs,
+			   "rx_11ax_dl_ofdma_mcs", HTT_RX_PDEV_STATS_NUM_MCS_COUNTERS, "\n");
+
+	PRINT_ARRAY_TO_BUF(buf, len, htt_stats_buf->rx_11ax_dl_ofdma_ru,
+			   "rx_11ax_dl_ofdma_ru", HTT_RX_PDEV_STATS_NUM_RU_SIZE_COUNTERS, "\n");
+
+	PRINT_ARRAY_TO_BUF(buf, len, htt_stats_buf->rx_ulmumimo_non_data_ppdu,
+			   "rx_ulmumimo_non_data_ppdu", HTT_RX_PDEV_MAX_ULMUMIMO_NUM_USER, "\n");
+
+	PRINT_ARRAY_TO_BUF(buf, len, htt_stats_buf->rx_ulmumimo_data_ppdu,
+			   "rx_ulmumimo_data_ppdu", HTT_RX_PDEV_MAX_ULMUMIMO_NUM_USER, "\n");
+
+	PRINT_ARRAY_TO_BUF(buf, len, htt_stats_buf->rx_ulmumimo_mpdu_ok,
+			   "rx_ulmumimo_mpdu_ok", HTT_RX_PDEV_MAX_ULMUMIMO_NUM_USER, "\n");
+
+	PRINT_ARRAY_TO_BUF(buf, len, htt_stats_buf->rx_ulmumimo_mpdu_fail,
+			   "rx_ulmumimo_mpdu_fail", HTT_RX_PDEV_MAX_ULMUMIMO_NUM_USER, "\n");
+
 	len += scnprintf(buf + len, buf_len - len, "per_chain_rssi_pkt_type = %#x\n",
 			 htt_stats_buf->per_chain_rssi_pkt_type);
 
diff --git a/drivers/net/wireless/ath/ath11k/debugfs_htt_stats.h b/drivers/net/wireless/ath/ath11k/debugfs_htt_stats.h
index dc210c5..08f1493 100644
--- a/drivers/net/wireless/ath/ath11k/debugfs_htt_stats.h
+++ b/drivers/net/wireless/ath/ath11k/debugfs_htt_stats.h
@@ -1,6 +1,7 @@
 /* SPDX-License-Identifier: BSD-3-Clause-Clear */
 /*
  * Copyright (c) 2018-2019 The Linux Foundation. All rights reserved.
+ * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
 #ifndef DEBUG_HTT_STATS_H
@@ -682,6 +683,7 @@ struct htt_tx_selfgen_ax_stats_tlv {
 	u32 ax_bsr_trigger;
 	u32 ax_mu_bar_trigger;
 	u32 ax_mu_rts_trigger;
+	u32 ax_ulmumimo_trigger;
 };
 
 struct htt_tx_selfgen_ac_err_stats_tlv {
@@ -712,12 +714,14 @@ struct htt_tx_selfgen_ax_err_stats_tlv {
 	u32 ax_bsr_trigger_err;
 	u32 ax_mu_bar_trigger_err;
 	u32 ax_mu_rts_trigger_err;
+	u32 ax_ulmumimo_trigger_err;
 };
 
 /* == TX MU STATS == */
 #define HTT_TX_PDEV_STATS_NUM_AC_MUMIMO_USER_STATS 4
 #define HTT_TX_PDEV_STATS_NUM_AX_MUMIMO_USER_STATS 8
 #define HTT_TX_PDEV_STATS_NUM_OFDMA_USER_STATS    74
+#define HTT_TX_PDEV_STATS_NUM_UL_MUMIMO_USER_STATS 8
 
 struct htt_tx_pdev_mu_mimo_sch_stats_tlv {
 	/* mu-mimo sw sched cmd stats */
@@ -734,6 +738,21 @@ struct htt_tx_pdev_mu_mimo_sch_stats_tlv {
 	u32 ac_mu_mimo_sch_nusers[HTT_TX_PDEV_STATS_NUM_AC_MUMIMO_USER_STATS];
 	u32 ax_mu_mimo_sch_nusers[HTT_TX_PDEV_STATS_NUM_AX_MUMIMO_USER_STATS];
 	u32 ax_ofdma_sch_nusers[HTT_TX_PDEV_STATS_NUM_OFDMA_USER_STATS];
+	u32 ax_ul_ofdma_basic_sch_nusers[HTT_TX_PDEV_STATS_NUM_OFDMA_USER_STATS];
+	u32 ax_ul_ofdma_bsr_sch_nusers[HTT_TX_PDEV_STATS_NUM_OFDMA_USER_STATS];
+	u32 ax_ul_ofdma_bar_sch_nusers[HTT_TX_PDEV_STATS_NUM_OFDMA_USER_STATS];
+	u32 ax_ul_ofdma_brp_sch_nusers[HTT_TX_PDEV_STATS_NUM_OFDMA_USER_STATS];
+	/* UL MUMIMO */
+	/* ax_ul_mumimo_basic_sch_nusers[i] is the number of basic triggers sent
+	 * for (i+1) users
+	 */
+	u32 ax_ul_mumimo_basic_sch_nusers[HTT_TX_PDEV_STATS_NUM_UL_MUMIMO_USER_STATS];
+	/* ax_ul_mumimo_brp_sch_nusers[i] is the number of brp triggers sent
+	 * for (i+1) users
+	 */
+	u32 ax_ul_mumimo_brp_sch_nusers[HTT_TX_PDEV_STATS_NUM_UL_MUMIMO_USER_STATS];
+	u32 ac_mu_mimo_sch_posted_per_grp_sz[HTT_TX_PDEV_STATS_NUM_AC_MUMIMO_USER_STATS];
+	u32 ax_mu_mimo_sch_posted_per_grp_sz[HTT_TX_PDEV_STATS_NUM_AX_MUMIMO_USER_STATS];
 };
 
 struct htt_tx_pdev_mu_mimo_mpdu_stats_tlv {
@@ -1297,6 +1316,8 @@ struct htt_tx_pdev_rate_stats_tlv {
 #define HTT_RX_PDEV_STATS_NUM_PREAMBLE_TYPES       HTT_STATS_PREAM_COUNT
 #define HTT_RX_PDEV_MAX_OFDMA_NUM_USER             8
 #define HTT_RX_PDEV_STATS_RXEVM_MAX_PILOTS_PER_NSS 16
+#define HTT_RX_PDEV_STATS_NUM_RU_SIZE_COUNTERS     6
+#define HTT_RX_PDEV_MAX_ULMUMIMO_NUM_USER          8
 
 struct htt_rx_pdev_rate_stats_tlv {
 	u32 mac_id__word;
@@ -1375,6 +1396,21 @@ struct htt_rx_pdev_rate_stats_tlv {
 	u32 per_chain_rssi_pkt_type;
 	s8 rx_per_chain_rssi_in_dbm[HTT_RX_PDEV_STATS_NUM_SPATIAL_STREAMS]
 				   [HTT_RX_PDEV_STATS_NUM_BW_COUNTERS];
+
+	u32 rx_su_ndpa;
+	u32 rx_11ax_su_txbf_mcs[HTT_RX_PDEV_STATS_NUM_MCS_COUNTERS];
+	u32 rx_mu_ndpa;
+	u32 rx_11ax_mu_txbf_mcs[HTT_RX_PDEV_STATS_NUM_MCS_COUNTERS];
+	u32 rx_br_poll;
+	u32 rx_11ax_dl_ofdma_mcs[HTT_RX_PDEV_STATS_NUM_MCS_COUNTERS];
+	u32 rx_11ax_dl_ofdma_ru[HTT_RX_PDEV_STATS_NUM_RU_SIZE_COUNTERS];
+
+	u32 rx_ulmumimo_non_data_ppdu[HTT_RX_PDEV_MAX_ULMUMIMO_NUM_USER]; /* ppdu level */
+	u32 rx_ulmumimo_data_ppdu[HTT_RX_PDEV_MAX_ULMUMIMO_NUM_USER];     /* ppdu level */
+	u32 rx_ulmumimo_mpdu_ok[HTT_RX_PDEV_MAX_ULMUMIMO_NUM_USER];       /* mpdu level */
+	u32 rx_ulmumimo_mpdu_fail[HTT_RX_PDEV_MAX_ULMUMIMO_NUM_USER];     /* mpdu level */
+	u32 rx_ulofdma_non_data_nusers[HTT_RX_PDEV_MAX_OFDMA_NUM_USER];
+	u32 rx_ulofdma_data_nusers[HTT_RX_PDEV_MAX_OFDMA_NUM_USER];
 };
 
 /* == RX PDEV/SOC STATS == */
-- 
2.7.4


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
