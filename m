Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C11DEC5AE59
	for <ath11k@archiver.kernel.org>; Mon, 26 May 2025 11:48:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W7ZBYfJT3WXDepNqg9bCbBjG7Bk1UGBR3W1GBuMVihE=; b=AhieQN2aRVpK6QeJNze0LR6afh
	lVWFCulSaloPIA00twbOZk9bOLwPcuokhgMsiEOXv4/jcbzEIK65x8vR4qRqVS+V27PMykrbOZzNk
	+TMKJ8Lp1n57fPRhTPwxbBAIBtdHiD1Dfc02iSLh7PwaOn84HS+pxgWxtHx1HAj11xEyYV3RmRwGc
	k1fpR8IDblWzcRdFRzP6dJJtZw//OflrSSBD6Xhy6pmAiVFV7RqUiqaHLi1XlRGFkB2xhuTxnariW
	cOXIUluV8pc4bXPn75WtOqnWmZCVpbb/XY7+FuQCVwLjJWR3vZCPEUal22gHL3fjJItzxTzsk5ubS
	eyQZWBkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJWJg-00000008jVO-3yB5;
	Mon, 26 May 2025 11:48:28 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJWJd-00000008jRe-0pAm
	for ath11k@lists.infradead.org;
	Mon, 26 May 2025 11:48:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 387B74A3CA;
	Mon, 26 May 2025 11:48:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16835C4CEFE;
	Mon, 26 May 2025 11:48:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748260104;
	bh=GjZfpYND9lP/NheppZ2lHvUCIf1VyizdpRiD68UpiOI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XR4tx5/2x0yVOR3cjvylsRGD7k6Q8GxVxFExDUx+6osaICv6NL6PoaEEw9QeCmUqi
	 31dOHd1Q2vN0P8Wz1NaGGeu3JxBpAqaEyeHMVu+ueQ/dJK+Qm1CkKDWpyC+ZL8gxQX
	 HauUfCoxha2Q4FRxfrhwoS3gLN/I6ID65pibWoJK35I7hc8WKrrCkrM6FhF7/IzcTO
	 tqHm7+11nM1hVb+M9Nf6Blj+Ce2OrTm2CepLIaoOi93hWKgjekKCLnC2ZtuYRpg2/u
	 VE1ALIbicFD6M2IOK3hYeV496k+it1TbgK4Zw1sOFOqLKEi1mhMNJeuzWUydCsSkHZ
	 t0TjOOsIp5NHQ==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1uJWJd-000000000Yx-252S;
	Mon, 26 May 2025 13:48:25 +0200
From: Johan Hovold <johan+linaro@kernel.org>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: Miaoqing Pan <quic_miaoqing@quicinc.com>,
	linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH 3/3] wifi: ath11k: use plain accesses for monitor descriptor
Date: Mon, 26 May 2025 13:48:03 +0200
Message-ID: <20250526114803.2122-4-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250526114803.2122-1-johan+linaro@kernel.org>
References: <20250526114803.2122-1-johan+linaro@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250526_044825_276568_23AA798C 
X-CRM114-Status: UNSURE (   9.05  )
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

Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 drivers/net/wireless/ath/ath11k/dp_rx.c | 22 +++++++++-------------
 1 file changed, 9 insertions(+), 13 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index dfe2d889c20f..37deb78044c8 100644
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
@@ -2657,7 +2657,7 @@ int ath11k_dp_process_rx(struct ath11k_base *ab, int ring_id,
 	      (struct hal_reo_dest_ring *)ath11k_hal_srng_dst_get_next_entry(ab,
 									     srng))) {
 		cookie = FIELD_GET(BUFFER_ADDR_INFO1_SW_COOKIE,
-				   READ_ONCE(desc->buf_addr_info.info1));
+				   desc->buf_addr_info.info1);
 		buf_id = FIELD_GET(DP_RXDMA_BUF_COOKIE_BUF_ID,
 				   cookie);
 		mac_id = FIELD_GET(DP_RXDMA_BUF_COOKIE_PDEV_ID, cookie);
@@ -2686,9 +2686,8 @@ int ath11k_dp_process_rx(struct ath11k_base *ab, int ring_id,
 
 		num_buffs_reaped[mac_id]++;
 
-		info0 = READ_ONCE(desc->info0);
 		push_reason = FIELD_GET(HAL_REO_DEST_RING_INFO0_PUSH_REASON,
-					info0);
+					desc->info0);
 		if (unlikely(push_reason !=
 			     HAL_REO_DEST_RING_PUSH_REASON_ROUTING_INSTRUCTION)) {
 			dev_kfree_skb_any(msdu);
@@ -2696,21 +2695,18 @@ int ath11k_dp_process_rx(struct ath11k_base *ab, int ring_id,
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


