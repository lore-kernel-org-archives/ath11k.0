Return-Path: <SRS0=S5NU=QD=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A2D6C433EF
	for <ath11k@archiver.kernel.org>; Tue, 16 Nov 2021 11:10:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 00DBD61BE5
	for <ath11k@archiver.kernel.org>; Tue, 16 Nov 2021 11:10:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 00DBD61BE5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=quicinc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Dmmr2cTw8Vxc47nX+Dwh/IYQ1g+ZktukOVN9vNTWbXc=; b=Nh2yU0mWFgucW3
	S2Ke/ZelVKhVStf6pdtp+qBggClsQvH3bOdZpLV0X/+B8anBKuW7pLzjfXfbfRHrCaJh2V3hVzIjz
	QW/9nqmX8px/g+QIMx8OHEIf9/PCtQK4Mhm6mXekCXlU977uSOAE1/R0ZBKdnek/PkeRX6X8xJsrV
	DUSQRkbpWkgvFGkjvxYkqPK12Lg12tf+WMaAQdPkhAqLhXH+77jHjnyfChYkb+rXLwW5xztCAD2AK
	MexEfZh4S4h0/8Qr/WRHHCWAmVqc6CqiyJcN1yjdzOayGsyWhrnlqLKHwkFotwp0qSoOQ2DwY5Aqr
	6xCSmjktnFAKty3H6cQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mmwM2-001LNI-F0; Tue, 16 Nov 2021 11:10:22 +0000
Received: from alexa-out.qualcomm.com ([129.46.98.28])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mmwLz-001LMi-LK
 for ath11k@lists.infradead.org; Tue, 16 Nov 2021 11:10:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1637061020; x=1668597020;
 h=from:to:cc:subject:date:message-id;
 bh=Byblo48bKcddKTlVQzm0QIaAC+nMiH+tXNfSmbq0aVY=;
 b=BJvgVdZd6+0lPP3upV3qh8WxaxUCBXY4BgHeMdUb33uc9medm4K0SUbj
 EM91DaOf/GlnSxQ6W8gG+9WRafoBLB3HXowRekPkYt7EJAQbfY54bV7R1
 JIcdDrJIXnH2zP3353N6g1JaJSq8kMiNnDNWjQSkYGkVruauO1OSOxf3U 8=;
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
 by alexa-out.qualcomm.com with ESMTP; 16 Nov 2021 03:10:18 -0800
X-QCInternal: smtphost
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
 by ironmsg08-lv.qualcomm.com with ESMTP/TLS/AES256-SHA;
 16 Nov 2021 03:10:17 -0800
X-QCInternal: smtphost
Received: from akalaise-linux.qualcomm.com ([10.201.26.157])
 by ironmsg02-blr.qualcomm.com with ESMTP; 16 Nov 2021 16:40:11 +0530
Received: by akalaise-linux.qualcomm.com (Postfix, from userid 2376239)
 id 2E24B221AE; Tue, 16 Nov 2021 16:40:10 +0530 (IST)
From: Karthikeyan Kathirvel <quic_kathirve@quicinc.com>
To: ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
 Karthikeyan Kathirvel <quic_kathirve@quicinc.com>
Subject: [PATCH v2] ath11k: fix destination monitor ring out of sync
Date: Tue, 16 Nov 2021 16:40:07 +0530
Message-Id: <1637061007-28663-1-git-send-email-quic_kathirve@quicinc.com>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211116_031019_786138_27F9AF2E 
X-CRM114-Status: GOOD (  15.42  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

More than 20000 PPDU id jumping causing status ring and destination
ring processing not sync. The status ring is processed and the
destination ring is not processed. Since destination is not reaped for
so long, backpressure occurs at the destination ring.

To address this issue update the PPDU id with the latest PPDU, this
will allow the destination ring to be reaped and will prevent the
rings from getting out of sync.

Signed-off-by: Karthikeyan Kathirvel <quic_kathirve@quicinc.com>
---
v2:
	Corrected the signed off details

 drivers/net/wireless/ath/ath11k/dp.h    |  3 +++
 drivers/net/wireless/ath/ath11k/dp_rx.c | 42 ++++++++++++++++++++++++++++-----
 2 files changed, 39 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/dp.h b/drivers/net/wireless/ath/ath11k/dp.h
index b0d0e7b..cc36b57 100644
--- a/drivers/net/wireless/ath/ath11k/dp.h
+++ b/drivers/net/wireless/ath/ath11k/dp.h
@@ -101,6 +101,8 @@ struct ath11k_pdev_mon_stats {
 	u32 dest_mpdu_drop;
 	u32 dup_mon_linkdesc_cnt;
 	u32 dup_mon_buf_cnt;
+	u32 dest_mon_stuck;
+	u32 dest_mon_not_reaped;
 };
 
 struct dp_link_desc_bank {
@@ -143,6 +145,7 @@ struct ath11k_mon_data {
 
 struct ath11k_pdev_dp {
 	u32 mac_id;
+	u32 mon_dest_ring_stuck_cnt;
 	atomic_t num_tx_pending;
 	wait_queue_head_t tx_empty_waitq;
 	struct dp_rxdma_ring rx_refill_buf_ring;
diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index 3a9c362..d0b8829 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -4939,6 +4939,12 @@ static int ath11k_dp_rx_mon_deliver(struct ath11k *ar, u32 mac_id,
 	return -EINVAL;
 }
 
+/* The destination ring processing is stuck if the destination is not
+ * moving while status ring moves 16 PPDU. The destination ring processing
+ * skips this destination ring PPDU as a workaround.
+ */
+#define MON_DEST_RING_STUCK_MAX_CNT 16
+
 static void ath11k_dp_rx_mon_dest_process(struct ath11k *ar, int mac_id,
 					  u32 quota, struct napi_struct *napi)
 {
@@ -4951,6 +4957,7 @@ static void ath11k_dp_rx_mon_dest_process(struct ath11k *ar, int mac_id,
 	u32 ring_id;
 	struct ath11k_pdev_mon_stats *rx_mon_stats;
 	u32	 npackets = 0;
+	u32 mpdu_rx_bufs_used;
 
 	if (ar->ab->hw_params.rxdma1_enable)
 		ring_id = dp->rxdma_mon_dst_ring.ring_id;
@@ -4980,16 +4987,39 @@ static void ath11k_dp_rx_mon_dest_process(struct ath11k *ar, int mac_id,
 		head_msdu = NULL;
 		tail_msdu = NULL;
 
-		rx_bufs_used += ath11k_dp_rx_mon_mpdu_pop(ar, mac_id, ring_entry,
-							  &head_msdu,
-							  &tail_msdu,
-							  &npackets, &ppdu_id);
+		mpdu_rx_bufs_used = ath11k_dp_rx_mon_mpdu_pop(ar, mac_id, ring_entry,
+							      &head_msdu,
+							      &tail_msdu,
+							      &npackets, &ppdu_id);
+
+		rx_bufs_used += mpdu_rx_bufs_used;
+
+		if (mpdu_rx_bufs_used) {
+			dp->mon_dest_ring_stuck_cnt = 0;
+		} else {
+			dp->mon_dest_ring_stuck_cnt++;
+			rx_mon_stats->dest_mon_not_reaped++;
+		}
+
+		if (dp->mon_dest_ring_stuck_cnt > MON_DEST_RING_STUCK_MAX_CNT) {
+			rx_mon_stats->dest_mon_stuck++;
+			ath11k_dbg(ar->ab, ATH11K_DBG_DATA,
+				   "status ring ppdu_id=%d dest ring ppdu_id=%d mon_dest_ring_stuck_cnt=%d dest_mon_not_reaped=%u dest_mon_stuck=%u\n",
+				   pmon->mon_ppdu_info.ppdu_id, ppdu_id,
+				   dp->mon_dest_ring_stuck_cnt,
+				   rx_mon_stats->dest_mon_not_reaped,
+				   rx_mon_stats->dest_mon_stuck);
+			pmon->mon_ppdu_info.ppdu_id = ppdu_id;
+			continue;
+		}
 
 		if (ppdu_id != pmon->mon_ppdu_info.ppdu_id) {
 			pmon->mon_ppdu_status = DP_PPDU_STATUS_START;
 			ath11k_dbg(ar->ab, ATH11K_DBG_DATA,
-				   "dest_rx: new ppdu_id %x != status ppdu_id %x",
-				   ppdu_id, pmon->mon_ppdu_info.ppdu_id);
+				   "dest_rx: new ppdu_id %x != status ppdu_id %x dest_mon_not_reaped = %u dest_mon_stuck = %u\n",
+				   ppdu_id, pmon->mon_ppdu_info.ppdu_id,
+				   rx_mon_stats->dest_mon_not_reaped,
+				   rx_mon_stats->dest_mon_stuck);
 			break;
 		}
 		if (head_msdu && tail_msdu) {
-- 
2.7.4


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
