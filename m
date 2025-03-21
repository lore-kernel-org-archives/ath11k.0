Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A277C36000
	for <ath11k@archiver.kernel.org>; Fri, 21 Mar 2025 14:55:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fG/bMu1daC1RDFeF+BZYT4Nu1TtACugbEL3dk4kpAXk=; b=fhFA7fyRRgOKMRBnMoUQvXgvJi
	dd/JyVYVEV616uEH/WCQG9jdtnBouMMepQb91xNmsgkNDgTCyFT3+AEHwHH6BoSMhDjZbahs5t101
	SrMXUJW3hFBiNWmmLzk6553SHx86NdYmOHYBmKnu0et5nje2GBuGdiqds9lBO0rMxRsM6DNwOtIOx
	Rov8wJqBGfDq0Bx7q5rPI6Gml1KWbR1L9EYTKA08rQzFVuREvyIjvyNmP2slvtprnmTOZRAjMS9bZ
	CoG0CULreLqNM0gxVPne6ue5YakAUlYILi5lAJXI4wc+4Q2LXPrtAbWQCsF/FRTz5f4FbE7M40wCl
	McxIjaoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvdmX-0000000FDKA-2jiF;
	Fri, 21 Mar 2025 14:55:33 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvdmV-0000000FDJ5-0Y73
	for ath11k@lists.infradead.org;
	Fri, 21 Mar 2025 14:55:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 879DE5C5CE2;
	Fri, 21 Mar 2025 14:53:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26852C4CEE3;
	Fri, 21 Mar 2025 14:55:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742568930;
	bh=ZcznbrIAimjf3k62jvVeyb7mB0mKsIZKqhT19/qFcrU=;
	h=From:To:Cc:Subject:Date:From;
	b=fj1I1XTLpatdDoMn/FxSugWTyGK7E+FjNTLy4iZKkEMwiKi9c37fmNLq7tfYgKh6R
	 jpSBCM0etC4El4sFneH3ypiwPBBxk2Zpm+0/6jKv162xZRI+1Xv0NJ/ohFNQxkXrj7
	 bbJwwYLEM3OCnqatatjFMFp94Wnj3lBfGhdUA3bsMmfuGGesUFMFzUXvDGBiXo1fAV
	 ExTl2webDHgNPiR6bJ+u6gS7E1K3oj9Ka5ZXdElp1Dag4lViA1smoGsFtXWEVFlzLB
	 Putl9MXyEzh3pWVpEM2GxW66u1kb13LLjU9+WC2QU7gSLtSRNT7pso8qkPCo286Xji
	 Z1+cn+kq/Jmnw==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1tvdmW-000000001IG-2WDN;
	Fri, 21 Mar 2025 15:55:32 +0100
From: Johan Hovold <johan+linaro@kernel.org>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: Miaoqing Pan <quic_miaoqing@quicinc.com>,
	Steev Klimaszewski <steev@kali.org>,
	Clayton Craft <clayton@craftyguy.net>,
	Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
	ath11k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>,
	stable@vger.kernel.org
Subject: [PATCH] wifi: ath11k: fix rx completion meta data corruption
Date: Fri, 21 Mar 2025 15:53:02 +0100
Message-ID: <20250321145302.4775-1-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250321_075531_285791_1F1550D4 
X-CRM114-Status: GOOD (  13.29  )
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

Add the missing memory barrier to make sure that the REO dest ring
descriptor is read after the head pointer to avoid using stale data on
weakly ordered architectures like aarch64.

This may fix the ring-buffer corruption worked around by commit
f9fff67d2d7c ("wifi: ath11k: Fix SKB corruption in REO destination
ring") by silently discarding data, and may possibly also address user
reported errors like:

	ath11k_pci 0006:01:00.0: msdu_done bit in attention is not set

Tested-on: WCN6855 hw2.1 WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.41

Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
Cc: stable@vger.kernel.org	# 5.6
Link: https://bugzilla.kernel.org/show_bug.cgi?id=218005
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---

As I reported here:

	https://lore.kernel.org/lkml/Z9G5zEOcTdGKm7Ei@hovoldconsulting.com/

the ath11k and ath12k appear to be missing a number of memory barriers
that are required on weakly ordered architectures like aarch64 to avoid
memory corruption issues.

Here's a fix for one more such case which people already seem to be
hitting.

Note that I've seen one "msdu_done" bit not set warning also with this
patch so whether it helps with that at all remains to be seen. I'm CCing
Jens and Steev that see these warnings frequently and that may be able
to help out with testing.

Johan


 drivers/net/wireless/ath/ath11k/dp_rx.c | 25 ++++++++++++++++---------
 1 file changed, 16 insertions(+), 9 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index 029ecf51c9ef..0a57b337e4c6 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -2646,7 +2646,7 @@ int ath11k_dp_process_rx(struct ath11k_base *ab, int ring_id,
 	struct ath11k *ar;
 	struct hal_reo_dest_ring *desc;
 	enum hal_reo_dest_ring_push_reason push_reason;
-	u32 cookie;
+	u32 cookie, info0, rx_msdu_info0, rx_mpdu_info0;
 	int i;
 
 	for (i = 0; i < MAX_RADIOS; i++)
@@ -2659,11 +2659,14 @@ int ath11k_dp_process_rx(struct ath11k_base *ab, int ring_id,
 try_again:
 	ath11k_hal_srng_access_begin(ab, srng);
 
+	/* Make sure descriptor is read after the head pointer. */
+	dma_rmb();
+
 	while (likely(desc =
 	      (struct hal_reo_dest_ring *)ath11k_hal_srng_dst_get_next_entry(ab,
 									     srng))) {
 		cookie = FIELD_GET(BUFFER_ADDR_INFO1_SW_COOKIE,
-				   desc->buf_addr_info.info1);
+				   READ_ONCE(desc->buf_addr_info.info1));
 		buf_id = FIELD_GET(DP_RXDMA_BUF_COOKIE_BUF_ID,
 				   cookie);
 		mac_id = FIELD_GET(DP_RXDMA_BUF_COOKIE_PDEV_ID, cookie);
@@ -2692,8 +2695,9 @@ int ath11k_dp_process_rx(struct ath11k_base *ab, int ring_id,
 
 		num_buffs_reaped[mac_id]++;
 
+		info0 = READ_ONCE(desc->info0);
 		push_reason = FIELD_GET(HAL_REO_DEST_RING_INFO0_PUSH_REASON,
-					desc->info0);
+					info0);
 		if (unlikely(push_reason !=
 			     HAL_REO_DEST_RING_PUSH_REASON_ROUTING_INSTRUCTION)) {
 			dev_kfree_skb_any(msdu);
@@ -2701,18 +2705,21 @@ int ath11k_dp_process_rx(struct ath11k_base *ab, int ring_id,
 			continue;
 		}
 
-		rxcb->is_first_msdu = !!(desc->rx_msdu_info.info0 &
+		rx_msdu_info0 = READ_ONCE(desc->rx_msdu_info.info0);
+		rx_mpdu_info0 = READ_ONCE(desc->rx_mpdu_info.info0);
+
+		rxcb->is_first_msdu = !!(rx_msdu_info0 &
 					 RX_MSDU_DESC_INFO0_FIRST_MSDU_IN_MPDU);
-		rxcb->is_last_msdu = !!(desc->rx_msdu_info.info0 &
+		rxcb->is_last_msdu = !!(rx_msdu_info0 &
 					RX_MSDU_DESC_INFO0_LAST_MSDU_IN_MPDU);
-		rxcb->is_continuation = !!(desc->rx_msdu_info.info0 &
+		rxcb->is_continuation = !!(rx_msdu_info0 &
 					   RX_MSDU_DESC_INFO0_MSDU_CONTINUATION);
 		rxcb->peer_id = FIELD_GET(RX_MPDU_DESC_META_DATA_PEER_ID,
-					  desc->rx_mpdu_info.meta_data);
+					  READ_ONCE(desc->rx_mpdu_info.meta_data));
 		rxcb->seq_no = FIELD_GET(RX_MPDU_DESC_INFO0_SEQ_NUM,
-					 desc->rx_mpdu_info.info0);
+					 rx_mpdu_info0);
 		rxcb->tid = FIELD_GET(HAL_REO_DEST_RING_INFO0_RX_QUEUE_NUM,
-				      desc->info0);
+				      info0);
 
 		rxcb->mac_id = mac_id;
 		__skb_queue_tail(&msdu_list[mac_id], msdu);
-- 
2.48.1


