Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A617C5B549
	for <ath11k@archiver.kernel.org>; Wed,  4 Jun 2025 14:38:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cyLCfwzcP2yoGTytb4szvWXzmZL8hVGG4jBFU8ibaoE=; b=XZqNJtxK1Bvef7NY946VtZm2NK
	V9ZGeqrJe+MYauHdFlqaVVtxsRYzxkoW46bEcRHMAfMpC4RH2t7QetSberjol6//92HjXOEFKU22l
	xQ75jmOcAb4GwkzFzFMso3TgjsbLj6bCsj9FxeSDGBoBeDE43F7nHgy5XeAIERNrwpNqWq1/ZkTkB
	89M7d351oSYFn9WjRDvbg3L+sAXXmaR9Jdz0lv1d2eMNtPA6ub70+KQYyUGiObfwexa0ih4DFGYAb
	xhQu8uXhuQ/3F3IM3EoUGX8lJJ10EfGzBcedbC4IkALc+tD7LHGTHQRIfFHCdDOtDvpliWP2cj66O
	9ge7IgVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMpFl-0000000DauN-30St;
	Wed, 04 Jun 2025 14:38:05 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMpDx-0000000Dab1-0FRE
	for ath11k@lists.infradead.org;
	Wed, 04 Jun 2025 14:36:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 13DC7A5044C;
	Wed,  4 Jun 2025 14:36:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AEDFBC4CEEF;
	Wed,  4 Jun 2025 14:36:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749047771;
	bh=DW6mEbuQyQES+wh95ZJKakXUt1S6KLMtCRzsr6ZDdtA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Lysf+n/azHWgbuQ9uSkAK1Ifb5SCGPn0sQRiTUEsGntJDK+/eR/FK+4ryOoOv8nF5
	 W2LwOSRVIVOTcBh15tVq9WbKcZpPs5T52PzF2jURQEa7BQv3qtrSO6bjtmahKRKKxT
	 HW/ZIejZ5o3qUM6q/W4gokOA+fZ/+7fqqhpKT+iBFIrOYJKmCngyiQOc0fuB0g8Nug
	 OXZ/WlBw9KUMdM5d1Sb0AHa7U8QWbOeoifl1K1qohgJhb5vrvYwAOaF1Y63tC2RXg5
	 bkk30pDpznPgDj9O2xbskVOoicVLeT9akWs7Vl2BMamTTZyp6i1u3YjY+tNQSWCCym
	 UEb76AQbavP4w==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1uMpDt-000000006nM-38jX;
	Wed, 04 Jun 2025 16:36:09 +0200
From: Johan Hovold <johan+linaro@kernel.org>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: Miaoqing Pan <quic_miaoqing@quicinc.com>,
	Baochen Qiang <quic_bqiang@quicinc.com>,
	linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH v2 3/5] wifi: ath11k: use plain accesses for monitor descriptor
Date: Wed,  4 Jun 2025 16:34:55 +0200
Message-ID: <20250604143457.26032-4-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250604143457.26032-1-johan+linaro@kernel.org>
References: <20250604143457.26032-1-johan+linaro@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250604_073613_228353_F35D5263 
X-CRM114-Status: UNSURE (   9.16  )
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
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

The read memory barrier added by commit ab52e3e44fe9 ("wifi: ath11k: fix
rx completion meta data corruption") is enough to guarantee ordering
also for plain descriptor accesses so drop the unnecessary READ_ONCE().

Tested-on: WCN6855 hw2.1 WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.41

Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 drivers/net/wireless/ath/ath11k/dp_rx.c | 22 +++++++++-------------
 1 file changed, 9 insertions(+), 13 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index d8dab182a9af..218ab41c0f3c 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -2637,7 +2637,7 @@ int ath11k_dp_process_rx(struct ath11k_base *ab, int ring_id,
 	struct ath11k *ar;
 	struct hal_reo_dest_ring *desc;
 	enum hal_reo_dest_ring_push_reason push_reason;
-	u32 cookie, info0, rx_msdu_info0, rx_mpdu_info0;
+	u32 cookie;
 	int i;
 
 	for (i = 0; i < MAX_RADIOS; i++)
@@ -2654,7 +2654,7 @@ int ath11k_dp_process_rx(struct ath11k_base *ab, int ring_id,
 	      (struct hal_reo_dest_ring *)ath11k_hal_srng_dst_get_next_entry(ab,
 									     srng))) {
 		cookie = FIELD_GET(BUFFER_ADDR_INFO1_SW_COOKIE,
-				   READ_ONCE(desc->buf_addr_info.info1));
+				   desc->buf_addr_info.info1);
 		buf_id = FIELD_GET(DP_RXDMA_BUF_COOKIE_BUF_ID,
 				   cookie);
 		mac_id = FIELD_GET(DP_RXDMA_BUF_COOKIE_PDEV_ID, cookie);
@@ -2683,9 +2683,8 @@ int ath11k_dp_process_rx(struct ath11k_base *ab, int ring_id,
 
 		num_buffs_reaped[mac_id]++;
 
-		info0 = READ_ONCE(desc->info0);
 		push_reason = FIELD_GET(HAL_REO_DEST_RING_INFO0_PUSH_REASON,
-					info0);
+					desc->info0);
 		if (unlikely(push_reason !=
 			     HAL_REO_DEST_RING_PUSH_REASON_ROUTING_INSTRUCTION)) {
 			dev_kfree_skb_any(msdu);
@@ -2693,21 +2692,18 @@ int ath11k_dp_process_rx(struct ath11k_base *ab, int ring_id,
 			continue;
 		}
 
-		rx_msdu_info0 = READ_ONCE(desc->rx_msdu_info.info0);
-		rx_mpdu_info0 = READ_ONCE(desc->rx_mpdu_info.info0);
-
-		rxcb->is_first_msdu = !!(rx_msdu_info0 &
+		rxcb->is_first_msdu = !!(desc->rx_msdu_info.info0 &
 					 RX_MSDU_DESC_INFO0_FIRST_MSDU_IN_MPDU);
-		rxcb->is_last_msdu = !!(rx_msdu_info0 &
+		rxcb->is_last_msdu = !!(desc->rx_msdu_info.info0 &
 					RX_MSDU_DESC_INFO0_LAST_MSDU_IN_MPDU);
-		rxcb->is_continuation = !!(rx_msdu_info0 &
+		rxcb->is_continuation = !!(desc->rx_msdu_info.info0 &
 					   RX_MSDU_DESC_INFO0_MSDU_CONTINUATION);
 		rxcb->peer_id = FIELD_GET(RX_MPDU_DESC_META_DATA_PEER_ID,
-					  READ_ONCE(desc->rx_mpdu_info.meta_data));
+					  desc->rx_mpdu_info.meta_data);
 		rxcb->seq_no = FIELD_GET(RX_MPDU_DESC_INFO0_SEQ_NUM,
-					 rx_mpdu_info0);
+					 desc->rx_mpdu_info.info0);
 		rxcb->tid = FIELD_GET(HAL_REO_DEST_RING_INFO0_RX_QUEUE_NUM,
-				      info0);
+				      desc->info0);
 
 		rxcb->mac_id = mac_id;
 		__skb_queue_tail(&msdu_list[mac_id], msdu);
-- 
2.49.0


