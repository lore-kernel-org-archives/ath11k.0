Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8642C54FB3
	for <ath11k@archiver.kernel.org>; Mon, 26 May 2025 11:48:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BZimKoe92ofXgdI6rsMsIEKe04+8unaTT2Eh6+E69qk=; b=ewlpp6bMaj6jvodU61/uWHyb0C
	nICJUZzqufKFY7ddTZlnpwyJ8T2c+flX+mFDpyDhZs3A452gIo+O3tvuo5Hjt5iqSgMkRkLUWA/WY
	DR+q7wIJt1RW10mEXsmNrj7Dsakx1JUz/3XcQW3HxwjtUoHq8YpC+0XPBqlJaSpmdakUbobPXA/RD
	f0wQLqyRmwfCTcCc3kTDWkN0mWOm5PB9tWiiJkGgNHffmsx9dNZQ5g2qe0zbSBx2vXC3D0sP4ebKo
	jIsFjrBw5cQtLH2mQjCCejlRV+9JJ9AaXIBjDmr/bg0tYdQiNLVn0nqj3hxQs98EMu5F7OtBwUjtn
	/cioE9tQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJWJh-00000008jVn-1R5C;
	Mon, 26 May 2025 11:48:29 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJWJd-00000008jRh-0f4V
	for ath11k@lists.infradead.org;
	Mon, 26 May 2025 11:48:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 3F52CA4ED17;
	Mon, 26 May 2025 11:48:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2A2BC4CEF2;
	Mon, 26 May 2025 11:48:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748260103;
	bh=QrLLMqTyR7YAQGK5tv4IbrNqrw7xUDpHrWfnkyxz8Jk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=q0Yv09b1t3/ZqYFbSGFyWxqb4yX1hzYNHC6UhOKAH0c8RoDKbXWE88Rx5pbWmGjWf
	 WhvmkZCFNUsyr6AjaVxxi/SmlASjcdk/Zog4xv2na2waXB6kMHGcrISziYu1xvdC2x
	 nu/PtKEJ7sAXCAREZSWoQoQBzS+Ea2dExfKJdxJNOBIYb8KzRdC0Oz+5H6Lwo5NN/V
	 3shvvaiJ0eZmGhFVbw/T4KmlqjZr6EboW+ouyVzDGoqKWLa9P/vzEX73MHRDl8Wu+4
	 scIvfvLn+duOjrB/beWDW7I1mkDn+GGsESp4adlsjzCfW80OAQTA+Nd916TUW7VTuL
	 Mld4ZEL+Axdnw==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1uJWJd-000000000Ys-1KI0;
	Mon, 26 May 2025 13:48:25 +0200
From: Johan Hovold <johan+linaro@kernel.org>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: Miaoqing Pan <quic_miaoqing@quicinc.com>,
	linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>,
	stable@vger.kernel.org
Subject: [PATCH 1/3] wifi: ath11k: fix dest ring-buffer corruption
Date: Mon, 26 May 2025 13:48:01 +0200
Message-ID: <20250526114803.2122-2-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250526114803.2122-1-johan+linaro@kernel.org>
References: <20250526114803.2122-1-johan+linaro@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250526_044825_329015_85EBEDC8 
X-CRM114-Status: GOOD (  10.07  )
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

Add the missing memory barriers to make sure that destination ring
descriptors are read after the head pointers to avoid using stale data
on weakly ordered architectures like aarch64.

Tested-on: WCN6855 hw2.1 WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.41

Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
Cc: stable@vger.kernel.org	# 5.6
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 drivers/net/wireless/ath/ath11k/dp_rx.c | 19 +++++++++++++++++++
 drivers/net/wireless/ath/ath11k/dp_tx.c |  3 +++
 2 files changed, 22 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index ea2959305dec..dfe2d889c20f 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -3851,6 +3851,9 @@ int ath11k_dp_process_rx_err(struct ath11k_base *ab, struct napi_struct *napi,
 
 	ath11k_hal_srng_access_begin(ab, srng);
 
+	/* Make sure descriptor is read after the head pointer. */
+	dma_rmb();
+
 	while (budget &&
 	       (desc = ath11k_hal_srng_dst_get_next_entry(ab, srng))) {
 		struct hal_reo_dest_ring *reo_desc = (struct hal_reo_dest_ring *)desc;
@@ -4154,6 +4157,9 @@ int ath11k_dp_rx_process_wbm_err(struct ath11k_base *ab,
 
 	ath11k_hal_srng_access_begin(ab, srng);
 
+	/* Make sure descriptor is read after the head pointer. */
+	dma_rmb();
+
 	while (budget) {
 		rx_desc = ath11k_hal_srng_dst_get_next_entry(ab, srng);
 		if (!rx_desc)
@@ -4280,6 +4286,9 @@ int ath11k_dp_process_rxdma_err(struct ath11k_base *ab, int mac_id, int budget)
 
 	ath11k_hal_srng_access_begin(ab, srng);
 
+	/* Make sure descriptor is read after the head pointer. */
+	dma_rmb();
+
 	while (quota-- &&
 	       (desc = ath11k_hal_srng_dst_get_next_entry(ab, srng))) {
 		ath11k_hal_rx_reo_ent_paddr_get(ab, desc, &paddr, &desc_bank);
@@ -4353,6 +4362,9 @@ void ath11k_dp_process_reo_status(struct ath11k_base *ab)
 
 	ath11k_hal_srng_access_begin(ab, srng);
 
+	/* Make sure descriptor is read after the head pointer. */
+	dma_rmb();
+
 	while ((reo_desc = ath11k_hal_srng_dst_get_next_entry(ab, srng))) {
 		tag = FIELD_GET(HAL_SRNG_TLV_HDR_TAG, *reo_desc);
 
@@ -5168,6 +5180,9 @@ static void ath11k_dp_rx_mon_dest_process(struct ath11k *ar, int mac_id,
 	rx_bufs_used = 0;
 	rx_mon_stats = &pmon->rx_mon_stats;
 
+	/* Make sure descriptor is read after the head pointer. */
+	dma_rmb();
+
 	while ((ring_entry = ath11k_hal_srng_dst_peek(ar->ab, mon_dst_srng))) {
 		struct sk_buff *head_msdu, *tail_msdu;
 
@@ -5630,6 +5645,10 @@ static int ath11k_dp_full_mon_process_rx(struct ath11k_base *ab, int mac_id,
 	spin_lock_bh(&mon_dst_srng->lock);
 
 	ath11k_hal_srng_access_begin(ar->ab, mon_dst_srng);
+
+	/* Make sure descriptor is read after the head pointer. */
+	dma_rmb();
+
 	while ((ring_entry = ath11k_hal_srng_dst_peek(ar->ab, mon_dst_srng))) {
 		head_msdu = NULL;
 		tail_msdu = NULL;
diff --git a/drivers/net/wireless/ath/ath11k/dp_tx.c b/drivers/net/wireless/ath/ath11k/dp_tx.c
index 8522c67baabf..549d17d90503 100644
--- a/drivers/net/wireless/ath/ath11k/dp_tx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_tx.c
@@ -700,6 +700,9 @@ void ath11k_dp_tx_completion_handler(struct ath11k_base *ab, int ring_id)
 
 	ath11k_hal_srng_access_begin(ab, status_ring);
 
+	/* Make sure descriptor is read after the head pointer. */
+	dma_rmb();
+
 	while ((ATH11K_TX_COMPL_NEXT(tx_ring->tx_status_head) !=
 		tx_ring->tx_status_tail) &&
 	       (desc = ath11k_hal_srng_dst_get_next_entry(ab, status_ring))) {
-- 
2.49.0


