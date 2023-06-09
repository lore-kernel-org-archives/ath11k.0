Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACA13C7EE29
	for <ath11k@archiver.kernel.org>; Fri,  9 Jun 2023 14:25:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I+T0YiJfL3uolOYEgDtUkKZZJKTG32eLxWfwPuwQh+w=; b=ngtMaxXlwlLzn0
	MYfEI71llvgcTkJpeZHFmM/kPL6I2jsgVhd1gYoXSvbW1Nn2ZROQ9TIrRi0xSQB4ANuZe4Pgg144N
	wDMti5MFnnDLLJ7Sz5I3HMVuU6EJIrTKMbME0iH1sMscMmSWtZ1AHCcYbHI6kJbSVvRFDogOz2Ccb
	BarkVv3iZamOmoo9UQs9ZfNIhYlIttb/0hCLgSTUVtB9ToWaaAQex9yg4VrusfN5YdmF/cVuN0+CD
	id67DYiCnNdtv9djZ4ZtECV5sLZU0V353AonUttrqb7hCaSNiV547kTpCoFDOq1JDUsG3KCkhIOKJ
	qFXQQK7MxtRYJuu36SjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q7d2y-00DFfz-13;
	Fri, 09 Jun 2023 14:25:00 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q7d2u-00DFXJ-0G
	for ath11k@lists.infradead.org;
	Fri, 09 Jun 2023 14:24:57 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E8043612E3
	for <ath11k@lists.infradead.org>; Fri,  9 Jun 2023 14:24:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEE7AC433D2;
	Fri,  9 Jun 2023 14:24:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686320695;
	bh=5i99cUkq1B4SGCP8fEXbgGBI5XY6g3CdaJyGemCE0UU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UjOW/rG8vT9TqHPUuRSOftFBa7OyA99Ik2YVych61dD8r39HRnyg5r9+JHIEMPoGI
	 S7umkhxZg/0j3YKyafPpz9hkN60Ti64LGFT0rrTLlf/HDxwU1AjeGetBgjEVimbbML
	 dBP4yDsGT+JVfX6LLTol4hFzjW/Y/EuGjdBOJOKB56JDn6HuIt6zwXSa/UrNhmZwu7
	 Fr1IZUlRNviSd33S++pSv7BAu87nXlKjSwLuwoAs5BjJn2qJvIjx7O2uCBCpUnRtHd
	 dUZEhhxlRSn5ne2j5HXDwaFcRW9tKZkTwDNzlPJSHtmQfPv8wMO6TlwV9AGsMKKKXz
	 EuP2tw0anTk4w==
From: Kalle Valo <kvalo@kernel.org>
To: ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH 11/15] wifi: ath11k: debug: use all upper case in ATH11k_DBG_HAL
Date: Fri,  9 Jun 2023 17:24:36 +0300
Message-Id: <20230609142440.24643-12-kvalo@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230609142440.24643-1-kvalo@kernel.org>
References: <20230609142440.24643-1-kvalo@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230609_072456_194580_A68D4743 
X-CRM114-Status: GOOD (  10.80  )
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

From: Kalle Valo <quic_kvalo@quicinc.com>

Somehow the character 'k' in ATH11k_DBG_HAL was in lower case. Change it to
upper case.

Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.23

Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/debug.h  |  4 ++--
 drivers/net/wireless/ath/ath11k/hal.c    |  6 +++---
 drivers/net/wireless/ath/ath11k/hal_rx.c | 24 ++++++++++++------------
 3 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/debug.h b/drivers/net/wireless/ath/ath11k/debug.h
index 2dd84d8ed5a5..f0dddd188ef0 100644
--- a/drivers/net/wireless/ath/ath11k/debug.h
+++ b/drivers/net/wireless/ath/ath11k/debug.h
@@ -22,7 +22,7 @@ enum ath11k_debug_mask {
 	ATH11K_DBG_MGMT		= 0x00000100,
 	ATH11K_DBG_REG		= 0x00000200,
 	ATH11K_DBG_TESTMODE	= 0x00000400,
-	ATH11k_DBG_HAL		= 0x00000800,
+	ATH11K_DBG_HAL		= 0x00000800,
 	ATH11K_DBG_PCI		= 0x00001000,
 	ATH11K_DBG_DP_TX	= 0x00002000,
 	ATH11K_DBG_DP_RX	= 0x00004000,
@@ -53,7 +53,7 @@ static inline const char *ath11k_dbg_str(enum ath11k_debug_mask mask)
 		return "reg";
 	case ATH11K_DBG_TESTMODE:
 		return "testmode";
-	case ATH11k_DBG_HAL:
+	case ATH11K_DBG_HAL:
 		return "hal";
 	case ATH11K_DBG_PCI:
 		return "pci";
diff --git a/drivers/net/wireless/ath/ath11k/hal.c b/drivers/net/wireless/ath/ath11k/hal.c
index 2cdc8478d253..148eeb06a906 100644
--- a/drivers/net/wireless/ath/ath11k/hal.c
+++ b/drivers/net/wireless/ath/ath11k/hal.c
@@ -1009,7 +1009,7 @@ int ath11k_hal_srng_setup(struct ath11k_base *ab, enum hal_ring_type type,
 				srng->u.src_ring.hp_addr =
 				(u32 *)((unsigned long)ab->mem + reg_base);
 			else
-				ath11k_dbg(ab, ATH11k_DBG_HAL,
+				ath11k_dbg(ab, ATH11K_DBG_HAL,
 					   "type %d ring_num %d reg_base 0x%x shadow 0x%lx\n",
 					   type, ring_num,
 					   reg_base,
@@ -1043,7 +1043,7 @@ int ath11k_hal_srng_setup(struct ath11k_base *ab, enum hal_ring_type type,
 				(u32 *)((unsigned long)ab->mem + reg_base +
 					(HAL_REO1_RING_TP(ab) - HAL_REO1_RING_HP(ab)));
 			else
-				ath11k_dbg(ab, ATH11k_DBG_HAL,
+				ath11k_dbg(ab, ATH11K_DBG_HAL,
 					   "type %d ring_num %d target_reg 0x%x shadow 0x%lx\n",
 					   type, ring_num,
 					   reg_base + (HAL_REO1_RING_TP(ab) -
@@ -1118,7 +1118,7 @@ int ath11k_hal_srng_update_shadow_config(struct ath11k_base *ab,
 	ath11k_hal_srng_update_hp_tp_addr(ab, shadow_cfg_idx, ring_type,
 					  ring_num);
 
-	ath11k_dbg(ab, ATH11k_DBG_HAL,
+	ath11k_dbg(ab, ATH11K_DBG_HAL,
 		   "target_reg %x, shadow reg 0x%x shadow_idx 0x%x, ring_type %d, ring num %d",
 		  target_reg,
 		  HAL_SHADOW_REG(ab, shadow_cfg_idx),
diff --git a/drivers/net/wireless/ath/ath11k/hal_rx.c b/drivers/net/wireless/ath/ath11k/hal_rx.c
index bb1d40034aa8..e5ed5efb139e 100644
--- a/drivers/net/wireless/ath/ath11k/hal_rx.c
+++ b/drivers/net/wireless/ath/ath11k/hal_rx.c
@@ -442,54 +442,54 @@ void ath11k_hal_reo_status_queue_stats(struct ath11k_base *ab, u32 *reo_desc,
 				FIELD_GET(HAL_REO_STATUS_HDR_INFO0_EXEC_STATUS,
 					  desc->hdr.info0);
 
-	ath11k_dbg(ab, ATH11k_DBG_HAL, "Queue stats status:\n");
-	ath11k_dbg(ab, ATH11k_DBG_HAL, "header: cmd_num %d status %d\n",
+	ath11k_dbg(ab, ATH11K_DBG_HAL, "Queue stats status:\n");
+	ath11k_dbg(ab, ATH11K_DBG_HAL, "header: cmd_num %d status %d\n",
 		   status->uniform_hdr.cmd_num,
 		   status->uniform_hdr.cmd_status);
-	ath11k_dbg(ab, ATH11k_DBG_HAL, "ssn %ld cur_idx %ld\n",
+	ath11k_dbg(ab, ATH11K_DBG_HAL, "ssn %ld cur_idx %ld\n",
 		   FIELD_GET(HAL_REO_GET_QUEUE_STATS_STATUS_INFO0_SSN,
 			     desc->info0),
 		   FIELD_GET(HAL_REO_GET_QUEUE_STATS_STATUS_INFO0_CUR_IDX,
 			     desc->info0));
-	ath11k_dbg(ab, ATH11k_DBG_HAL, "pn = [%08x, %08x, %08x, %08x]\n",
+	ath11k_dbg(ab, ATH11K_DBG_HAL, "pn = [%08x, %08x, %08x, %08x]\n",
 		   desc->pn[0], desc->pn[1], desc->pn[2], desc->pn[3]);
-	ath11k_dbg(ab, ATH11k_DBG_HAL,
+	ath11k_dbg(ab, ATH11K_DBG_HAL,
 		   "last_rx: enqueue_tstamp %08x dequeue_tstamp %08x\n",
 		   desc->last_rx_enqueue_timestamp,
 		   desc->last_rx_dequeue_timestamp);
-	ath11k_dbg(ab, ATH11k_DBG_HAL,
+	ath11k_dbg(ab, ATH11K_DBG_HAL,
 		   "rx_bitmap [%08x %08x %08x %08x %08x %08x %08x %08x]\n",
 		   desc->rx_bitmap[0], desc->rx_bitmap[1], desc->rx_bitmap[2],
 		   desc->rx_bitmap[3], desc->rx_bitmap[4], desc->rx_bitmap[5],
 		   desc->rx_bitmap[6], desc->rx_bitmap[7]);
-	ath11k_dbg(ab, ATH11k_DBG_HAL, "count: cur_mpdu %ld cur_msdu %ld\n",
+	ath11k_dbg(ab, ATH11K_DBG_HAL, "count: cur_mpdu %ld cur_msdu %ld\n",
 		   FIELD_GET(HAL_REO_GET_QUEUE_STATS_STATUS_INFO1_MPDU_COUNT,
 			     desc->info1),
 		   FIELD_GET(HAL_REO_GET_QUEUE_STATS_STATUS_INFO1_MSDU_COUNT,
 			     desc->info1));
-	ath11k_dbg(ab, ATH11k_DBG_HAL, "fwd_timeout %ld fwd_bar %ld dup_count %ld\n",
+	ath11k_dbg(ab, ATH11K_DBG_HAL, "fwd_timeout %ld fwd_bar %ld dup_count %ld\n",
 		   FIELD_GET(HAL_REO_GET_QUEUE_STATS_STATUS_INFO2_TIMEOUT_COUNT,
 			     desc->info2),
 		   FIELD_GET(HAL_REO_GET_QUEUE_STATS_STATUS_INFO2_FDTB_COUNT,
 			     desc->info2),
 		   FIELD_GET(HAL_REO_GET_QUEUE_STATS_STATUS_INFO2_DUPLICATE_COUNT,
 			     desc->info2));
-	ath11k_dbg(ab, ATH11k_DBG_HAL, "frames_in_order %ld bar_rcvd %ld\n",
+	ath11k_dbg(ab, ATH11K_DBG_HAL, "frames_in_order %ld bar_rcvd %ld\n",
 		   FIELD_GET(HAL_REO_GET_QUEUE_STATS_STATUS_INFO3_FIO_COUNT,
 			     desc->info3),
 		   FIELD_GET(HAL_REO_GET_QUEUE_STATS_STATUS_INFO3_BAR_RCVD_CNT,
 			     desc->info3));
-	ath11k_dbg(ab, ATH11k_DBG_HAL, "num_mpdus %d num_msdus %d total_bytes %d\n",
+	ath11k_dbg(ab, ATH11K_DBG_HAL, "num_mpdus %d num_msdus %d total_bytes %d\n",
 		   desc->num_mpdu_frames, desc->num_msdu_frames,
 		   desc->total_bytes);
-	ath11k_dbg(ab, ATH11k_DBG_HAL, "late_rcvd %ld win_jump_2k %ld hole_cnt %ld\n",
+	ath11k_dbg(ab, ATH11K_DBG_HAL, "late_rcvd %ld win_jump_2k %ld hole_cnt %ld\n",
 		   FIELD_GET(HAL_REO_GET_QUEUE_STATS_STATUS_INFO4_LATE_RX_MPDU,
 			     desc->info4),
 		   FIELD_GET(HAL_REO_GET_QUEUE_STATS_STATUS_INFO4_WINDOW_JMP2K,
 			     desc->info4),
 		   FIELD_GET(HAL_REO_GET_QUEUE_STATS_STATUS_INFO4_HOLE_COUNT,
 			     desc->info4));
-	ath11k_dbg(ab, ATH11k_DBG_HAL, "looping count %ld\n",
+	ath11k_dbg(ab, ATH11K_DBG_HAL, "looping count %ld\n",
 		   FIELD_GET(HAL_REO_GET_QUEUE_STATS_STATUS_INFO5_LOOPING_CNT,
 			     desc->info5));
 }
-- 
2.30.2


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
