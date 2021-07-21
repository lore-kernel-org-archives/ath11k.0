Return-Path: <SRS0=H079=MN=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68EFCC6377A
	for <ath11k@archiver.kernel.org>; Wed, 21 Jul 2021 21:21:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 270B3611C1
	for <ath11k@archiver.kernel.org>; Wed, 21 Jul 2021 21:21:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 270B3611C1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Z4OSq9wePMaLqoVdxO5KGqgxr+9jBPndJhqmKi1LzAA=; b=HJmiyBCou6NP4q
	kvYFRtIm7oFizy3SuwXSGBjz4/92yiYBgZ2HlP15Dv9zc3aQNETZ9EP72oc+TKr0+JoDYOz7OSaxx
	5PA4L1U43juv9pwP4WrNjjStobs7/SBrSpDNRI143slyGqVLYGar4eJKo/g2TmPQv7KHnk/aklgPS
	A8kI+ClNFZsnOSTSGY1tbb8Pkzi0PWAWDXBH6WKzK1KM9BKcPjM2d+V4Lprq+FQNjFvQYlmq11AZy
	7Adlsi+RlIx69pplQwHC/iD4iY4hwcLti+vwfqpDQbiUlHwKK0+eL8NH0GpNJtYH1kuRHiQ1OOGSJ
	pjUNxxo383u43RUR3Plw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m6JeK-00HISf-Tm; Wed, 21 Jul 2021 21:21:04 +0000
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m6JeC-00HIMB-Jw
 for ath11k@lists.infradead.org; Wed, 21 Jul 2021 21:21:02 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1626902461; h=Content-Transfer-Encoding: MIME-Version:
 Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=KWg9ZuuvvwDV4zhFDhqdO+lo8gc2hESbPLL7uCQJQTM=;
 b=hro6X/bwFwSKfQoPIxwX/U/X8YgD4hPnGt9Wp9V78zbO214wxnVrg1ySu+dtvbO1PIFw2E06
 RuMZFGdhgBdpdeXIt6WzM1iSzemf8Rv8FJDN/vWZn04ZEvsPSMuk6NGANiax50FizXMIXVkx
 RGaZAD51cDHPyeak4RS+g0iDo+4=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 60f88faa290ea35ee64148ac (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 21 Jul 2021 21:20:42
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 5BF80C4338A; Wed, 21 Jul 2021 21:20:41 +0000 (UTC)
Received: from jouni.codeaurora.org (85-76-67-217-nat.elisa-mobile.fi
 [85.76.67.217])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: jouni)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id C2529C433D3;
 Wed, 21 Jul 2021 21:20:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org C2529C433D3
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=jouni@codeaurora.org
From: Jouni Malinen <jouni@codeaurora.org>
To: Kalle Valo <kvalo@codeaurora.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 Anilkumar Kolli <akolli@codeaurora.org>,
 Jouni Malinen <jouni@codeaurora.org>
Subject: [PATCH 01/12] ath11k: Fix pktlog lite rx events
Date: Thu, 22 Jul 2021 00:20:18 +0300
Message-Id: <20210721212029.142388-1-jouni@codeaurora.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210721_142101_281683_F9A0CB10 
X-CRM114-Status: GOOD (  18.19  )
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

From: Anilkumar Kolli <akolli@codeaurora.org>

Fix sending rx_buf_sz to ath11k_dp_tx_htt_rx_filter_setup()
to enable pktlog full or lite mode. Depending on mode update the
trace buffer with log type full/lite.

Pktlog lite is a lighter version of pktlog. This can be used to capture
PPDU stats. These are useful for firmware performance debugging.

pktlog lite dumps are enabled using,
  echo "0x0 1" > ath11k/IPQ8074 hw2.0/mac0/pktlog_filter

Tested On: IPQ8074 hw2.0 AHB WLAN.HK.2.1.0.1-01233-QCAHKSWPL_SILICONZ-1 v2

Signed-off-by: Anilkumar Kolli <akolli@codeaurora.org>
Signed-off-by: Jouni Malinen <jouni@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/debugfs.c | 25 +++++++++++++++++++----
 drivers/net/wireless/ath/ath11k/dp.h      |  1 +
 drivers/net/wireless/ath/ath11k/dp_rx.c   | 16 ++++++++++++---
 drivers/net/wireless/ath/ath11k/trace.h   | 11 ++++++----
 4 files changed, 42 insertions(+), 11 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/debugfs.c b/drivers/net/wireless/ath/ath11k/debugfs.c
index 554feaf1ed5c..17f0bbbac7ae 100644
--- a/drivers/net/wireless/ath/ath11k/debugfs.c
+++ b/drivers/net/wireless/ath/ath11k/debugfs.c
@@ -902,7 +902,7 @@ static ssize_t ath11k_write_pktlog_filter(struct file *file,
 	struct htt_rx_ring_tlv_filter tlv_filter = {0};
 	u32 rx_filter = 0, ring_id, filter, mode;
 	u8 buf[128] = {0};
-	int i, ret;
+	int i, ret, rx_buf_sz = 0;
 	ssize_t rc;
 
 	mutex_lock(&ar->conf_mutex);
@@ -940,6 +940,17 @@ static ssize_t ath11k_write_pktlog_filter(struct file *file,
 		}
 	}
 
+	/* Clear rx filter set for monitor mode and rx status */
+	for (i = 0; i < ab->hw_params.num_rxmda_per_pdev; i++) {
+		ring_id = ar->dp.rx_mon_status_refill_ring[i].refill_buf_ring.ring_id;
+		ret = ath11k_dp_tx_htt_rx_filter_setup(ar->ab, ring_id, ar->dp.mac_id,
+						       HAL_RXDMA_MONITOR_STATUS,
+						       rx_buf_sz, &tlv_filter);
+		if (ret) {
+			ath11k_warn(ar->ab, "failed to set rx filter for monitor status ring\n");
+			goto out;
+		}
+	}
 #define HTT_RX_FILTER_TLV_LITE_MODE \
 			(HTT_RX_FILTER_TLV_FLAGS_PPDU_START | \
 			HTT_RX_FILTER_TLV_FLAGS_PPDU_END | \
@@ -955,6 +966,7 @@ static ssize_t ath11k_write_pktlog_filter(struct file *file,
 			    HTT_RX_FILTER_TLV_FLAGS_MPDU_END |
 			    HTT_RX_FILTER_TLV_FLAGS_PACKET_HEADER |
 			    HTT_RX_FILTER_TLV_FLAGS_ATTENTION;
+		rx_buf_sz = DP_RX_BUFFER_SIZE;
 	} else if (mode == ATH11K_PKTLOG_MODE_LITE) {
 		ret = ath11k_dp_tx_htt_h2t_ppdu_stats_req(ar,
 							  HTT_PPDU_STATS_TAG_PKTLOG);
@@ -964,7 +976,12 @@ static ssize_t ath11k_write_pktlog_filter(struct file *file,
 		}
 
 		rx_filter = HTT_RX_FILTER_TLV_LITE_MODE;
+		rx_buf_sz = DP_RX_BUFFER_SIZE_LITE;
 	} else {
+		rx_buf_sz = DP_RX_BUFFER_SIZE;
+		tlv_filter = ath11k_mac_mon_status_filter_default;
+		rx_filter = tlv_filter.rx_filter;
+
 		ret = ath11k_dp_tx_htt_h2t_ppdu_stats_req(ar,
 							  HTT_PPDU_STATS_TAG_DEFAULT);
 		if (ret) {
@@ -988,7 +1005,7 @@ static ssize_t ath11k_write_pktlog_filter(struct file *file,
 		ret = ath11k_dp_tx_htt_rx_filter_setup(ab, ring_id,
 						       ar->dp.mac_id + i,
 						       HAL_RXDMA_MONITOR_STATUS,
-						       DP_RX_BUFFER_SIZE, &tlv_filter);
+						       rx_buf_sz, &tlv_filter);
 
 		if (ret) {
 			ath11k_warn(ab, "failed to set rx filter for monitor status ring\n");
@@ -996,8 +1013,8 @@ static ssize_t ath11k_write_pktlog_filter(struct file *file,
 		}
 	}
 
-	ath11k_dbg(ab, ATH11K_DBG_WMI, "pktlog filter %d mode %s\n",
-		   filter, ((mode == ATH11K_PKTLOG_MODE_FULL) ? "full" : "lite"));
+	ath11k_info(ab, "pktlog mode %s\n",
+		    ((mode == ATH11K_PKTLOG_MODE_FULL) ? "full" : "lite"));
 
 	ar->debug.pktlog_filter = filter;
 	ar->debug.pktlog_mode = mode;
diff --git a/drivers/net/wireless/ath/ath11k/dp.h b/drivers/net/wireless/ath/ath11k/dp.h
index 69b75bc3312f..b2e7621969c5 100644
--- a/drivers/net/wireless/ath/ath11k/dp.h
+++ b/drivers/net/wireless/ath/ath11k/dp.h
@@ -218,6 +218,7 @@ struct ath11k_pdev_dp {
 #define DP_RXDMA_MONITOR_DESC_RING_SIZE	4096
 
 #define DP_RX_BUFFER_SIZE	2048
+#define	DP_RX_BUFFER_SIZE_LITE  1024
 #define DP_RX_BUFFER_ALIGN_SIZE	128
 
 #define DP_RXDMA_BUF_COOKIE_BUF_ID	GENMASK(17, 0)
diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index cc53432827e5..9d9af6d65afd 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -3080,6 +3080,8 @@ int ath11k_dp_rx_process_mon_status(struct ath11k_base *ab, int mac_id,
 	struct ath11k_peer *peer;
 	struct ath11k_sta *arsta;
 	int num_buffs_reaped = 0;
+	u32 rx_buf_sz;
+	u16 log_type = 0;
 
 	__skb_queue_head_init(&skb_list);
 
@@ -3092,8 +3094,16 @@ int ath11k_dp_rx_process_mon_status(struct ath11k_base *ab, int mac_id,
 		memset(&ppdu_info, 0, sizeof(ppdu_info));
 		ppdu_info.peer_id = HAL_INVALID_PEERID;
 
-		if (ath11k_debugfs_is_pktlog_rx_stats_enabled(ar))
-			trace_ath11k_htt_rxdesc(ar, skb->data, DP_RX_BUFFER_SIZE);
+		if (ath11k_debugfs_is_pktlog_lite_mode_enabled(ar)) {
+			log_type = ATH11K_PKTLOG_TYPE_LITE_RX;
+			rx_buf_sz = DP_RX_BUFFER_SIZE_LITE;
+		} else if (ath11k_debugfs_is_pktlog_rx_stats_enabled(ar)) {
+			log_type = ATH11K_PKTLOG_TYPE_RX_STATBUF;
+			rx_buf_sz = DP_RX_BUFFER_SIZE;
+		}
+
+		if (log_type)
+			trace_ath11k_htt_rxdesc(ar, skb->data, log_type, rx_buf_sz);
 
 		hal_status = ath11k_hal_rx_parse_mon_status(ab, &ppdu_info, skb);
 
@@ -3121,7 +3131,7 @@ int ath11k_dp_rx_process_mon_status(struct ath11k_base *ab, int mac_id,
 		ath11k_dp_rx_update_peer_stats(arsta, &ppdu_info);
 
 		if (ath11k_debugfs_is_pktlog_peer_valid(ar, peer->addr))
-			trace_ath11k_htt_rxdesc(ar, skb->data, DP_RX_BUFFER_SIZE);
+			trace_ath11k_htt_rxdesc(ar, skb->data, log_type, rx_buf_sz);
 
 		spin_unlock_bh(&ab->base_lock);
 		rcu_read_unlock();
diff --git a/drivers/net/wireless/ath/ath11k/trace.h b/drivers/net/wireless/ath/ath11k/trace.h
index d2d2a3cb0826..25d18e9d5b0b 100644
--- a/drivers/net/wireless/ath/ath11k/trace.h
+++ b/drivers/net/wireless/ath/ath11k/trace.h
@@ -79,14 +79,15 @@ TRACE_EVENT(ath11k_htt_ppdu_stats,
 );
 
 TRACE_EVENT(ath11k_htt_rxdesc,
-	    TP_PROTO(struct ath11k *ar, const void *data, size_t len),
+	    TP_PROTO(struct ath11k *ar, const void *data, size_t log_type, size_t len),
 
-	TP_ARGS(ar, data, len),
+	TP_ARGS(ar, data, log_type, len),
 
 	TP_STRUCT__entry(
 		__string(device, dev_name(ar->ab->dev))
 		__string(driver, dev_driver_string(ar->ab->dev))
 		__field(u16, len)
+		__field(u16, log_type)
 		__dynamic_array(u8, rxdesc, len)
 	),
 
@@ -94,14 +95,16 @@ TRACE_EVENT(ath11k_htt_rxdesc,
 		__assign_str(device, dev_name(ar->ab->dev));
 		__assign_str(driver, dev_driver_string(ar->ab->dev));
 		__entry->len = len;
+		__entry->log_type = log_type;
 		memcpy(__get_dynamic_array(rxdesc), data, len);
 	),
 
 	TP_printk(
-		"%s %s rxdesc len %d",
+		"%s %s rxdesc len %d type %d",
 		__get_str(driver),
 		__get_str(device),
-		__entry->len
+		__entry->len,
+		__entry->log_type
 	 )
 );
 
-- 
2.25.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
