Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAAE7CA5FC7
	for <ath11k@archiver.kernel.org>; Wed, 30 Sep 2026 16:51:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=YNHZ+7rGRAlI1tCmAXMpng03DJZ24AzCUirnUl7KIFE=; b=VbpiMYdmTFbLdpH0vv31i5fjF4
	v00H0YZtZneFjDoq6H4Xyl6M0+5sgc17umUJEksG1FOhivLeVef9+WA3R9WVbj3g0wkDYWIMf3saK
	1svjV4wWb1FAMJkQZLGupRWVW9un/XngoYayNN9aSLbparut2JrUqHRWSFuXQhmkYm5iVdJ6tXS2l
	5fmcC0s4y1ted8omxaRkNa/3uMMjTj7vip1VFhve5TPYIJlbhH/47wen/TFq69Rfv0O4vcv2AefIK
	jZ9GOqGzVOaxoth7z8sao5DJdgyTSwtKVU2CKmi87qSXMWS2nswiLeqMxAuTm/JuNdz6orhQGQty3
	XzBTusgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBxWM-00000006kEB-0Iqk;
	Wed, 30 Sep 2026 16:51:06 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBxWJ-00000006kCs-2Tqt
	for ath11k@bombadil.infradead.org;
	Wed, 30 Sep 2026 16:51:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=YNHZ+7rGRAlI1tCmAXMpng03DJZ24AzCUirnUl7KIFE=; b=NCoqCR7KkUSsEmmEgsCQ9mbVxS
	Sj4Yj8r9h8fA1xC/79k/MH3XVzd0c994AdBJtqakT+eAn87XD3B4i3tNVfVEjSw3thn8MhMwoU3JA
	aYMHOmxahtELSehgvkalLc3WvbiTNXfLVTeXUPwu2TFODov8esztykeld/i98uKFxVpcwDcjy7wZc
	2KFT4qf9p66Z1Xcm4mfwmLtKcAQ3TDv1LeC1eMLx9brds2Rg0YnKPzwGcTzoyGYifXYV9oCbcsW5g
	Avjwga23ebdekgUI9UAC6cEIMf0p+XoaA/FHaT2L70OPQHTZ5H6Wd6yKqvtdPIQ6SZTfqvVhiIPGs
	pAnDAKWw==;
Received: from smtp-42aa.mail.infomaniak.ch ([84.16.66.170])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBxWF-000000046IZ-2mSd
	for ath11k@lists.infradead.org;
	Wed, 30 Sep 2026 16:51:02 +0000
Received: from smtp-3-0001.mail.infomaniak.ch (smtp-3-0001.mail.infomaniak.ch [10.4.36.108])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4hw1JZ3bFDzQhC;
	Wed, 30 Sep 2026 18:50:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=etik.com;
	s=20210927; t=1790787054;
	bh=YNHZ+7rGRAlI1tCmAXMpng03DJZ24AzCUirnUl7KIFE=;
	h=From:To:Cc:Subject:Date:From;
	b=Uxad+iiOgt0IiU2xOiybn3VvgZidrIUdF8Ix2c3DgM3PfUR48bKA//ABmEZzoVdNg
	 5I5Ox2gPuwqedVePz1ebGPXN4PW7ZT6F+0N82WrRHI8n13tdp+Tl7dnnS17h/0W6VB
	 pRoDkmYeq7rOIHIsXiyO5b0c/wtNRUDYHIbOm7fo=
Received: from unknown by smtp-3-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4hw1JY5p51zcg4;
	Wed, 30 Sep 2026 18:50:53 +0200 (CEST)
From: Eduard Hart <eduard.hart@etik.com>
To: jjohnson@kernel.org
Cc: ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH ath-next] wifi: ath11k: use smaller DP rings on low-memory systems
Date: Wed, 30 Sep 2026 18:50:52 +0200
Message-ID: <20260930165052.4998-1-eduard.hart@etik.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Feedback-ID: :df975dad7d14b05:ham:e0a7e91052d2b43
X-Infomaniak-Routing: alpha
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_175059_868390_0EAB5208 
X-CRM114-Status: GOOD (  20.96  )
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

The data path rings are sized for systems with plenty of RAM. On
IPQ5018 boards with 256 MiB of RAM and a second radio (e.g. QCN6122),
the RX buffers and TX completion rings of both radios take so much
memory that the system runs out of memory shortly after bringing up
both interfaces.

Like ath12k does in ath12k_core_get_memory_mode(), look at the total
system RAM and pick a low-memory DP profile when it is below 256 MiB.
Reserved memory regions are not part of totalram, so boards with 512 MiB
stay well above the threshold and keep the current ring sizes.

The low-memory profile uses:
  TX completion ring:     32768 -> 2048
  RXDMA buffer ring:       4096 -> 1024
  RXDMA monitor status:    1024 ->  512
  RXDMA monitor buffer:    4096 ->  128
  RXDMA monitor dest:      2048 ->  128

The TX completion ring size is also used for the tx_status FIFO and the
IDR range of outstanding TX buffers, so ATH11K_TX_COMPL_NEXT() now wraps
at the selected ring size instead of the compile-time constant.

With this, both radios of a TP-Link RE700X (IPQ5018 + QCN6122, 256 MiB)
stay up under load (4-6 clients) with 14-37 MiB of RAM available and no
OOM, about the same as a 256 MiB build that shrinks the rings at compile
time.

Tested-on: IPQ5018 hw1.0 AHB WLAN.HK.2.7.0.1-01744-QCAHKSWPL_SILICONZ-1
Tested-on: QCN6122 hw1.0 AHB WLAN.HK.2.7.0.1-01744-QCAHKSWPL_SILICONZ-1

Signed-off-by: Eduard Hart <eduard.hart@etik.com>
---
 drivers/net/wireless/ath/ath11k/dp.c    | 50 +++++++++++++++++++++++--
 drivers/net/wireless/ath/ath11k/dp.h    | 13 ++++++-
 drivers/net/wireless/ath/ath11k/dp_rx.c |  9 +++--
 drivers/net/wireless/ath/ath11k/dp_tx.c | 12 +++---
 4 files changed, 69 insertions(+), 15 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/dp.c b/drivers/net/wireless/ath/ath11k/dp.c
index be65d73b904b..2db4f98ed446 100644
--- a/drivers/net/wireless/ath/ath11k/dp.c
+++ b/drivers/net/wireless/ath/ath11k/dp.c
@@ -5,6 +5,8 @@
  */
 
 #include <linux/export.h>
+#include <linux/mm.h>
+#include <linux/sizes.h>
 #include "core.h"
 #include "dp_tx.h"
 #include "hal_tx.h"
@@ -414,7 +416,7 @@ static int ath11k_dp_srng_common_setup(struct ath11k_base *ab)
 
 		ret = ath11k_dp_srng_setup(ab, &dp->tx_ring[i].tcl_comp_ring,
 					   HAL_WBM2SW_RELEASE, wbm_num, 0,
-					   DP_TX_COMP_RING_SIZE);
+					   dp->profile->tx_comp_ring_size);
 		if (ret) {
 			ath11k_warn(ab, "failed to set up tcl_comp ring (%d) :%d\n",
 				    i, ret);
@@ -1047,6 +1049,45 @@ void ath11k_dp_free(struct ath11k_base *ab)
 	/* Deinit any SOC level resource */
 }
 
+static const struct ath11k_dp_profile_params ath11k_dp_profile_default = {
+	.tx_comp_ring_size = DP_TX_COMP_RING_SIZE,
+	.rxdma_buf_ring_size = DP_RXDMA_BUF_RING_SIZE,
+	.rxdma_mon_status_ring_size = DP_RXDMA_MON_STATUS_RING_SIZE,
+	.rxdma_monitor_buf_ring_size = DP_RXDMA_MONITOR_BUF_RING_SIZE,
+	.rxdma_monitor_dst_ring_size = DP_RXDMA_MONITOR_DST_RING_SIZE,
+};
+
+static const struct ath11k_dp_profile_params ath11k_dp_profile_low_mem = {
+	.tx_comp_ring_size = 2048,
+	.rxdma_buf_ring_size = 1024,
+	.rxdma_mon_status_ring_size = 512,
+	.rxdma_monitor_buf_ring_size = 128,
+	.rxdma_monitor_dst_ring_size = 128,
+};
+
+static const struct ath11k_dp_profile_params *
+ath11k_dp_get_profile(struct ath11k_base *ab)
+{
+	struct sysinfo si;
+	u64 total_ram;
+
+	si_meminfo(&si);
+	total_ram = (u64)si.totalram * si.mem_unit;
+
+	/* Reserved memory (firmware, TZ, ...) is not part of totalram, so a
+	 * 512 MiB board reports well above 256 MiB while a 256 MiB board with
+	 * two radios does not have enough memory for the default rings.
+	 */
+	if (total_ram < SZ_256M) {
+		ath11k_dbg(ab, ATH11K_DBG_BOOT,
+			   "using low memory DP ring sizes (%llu MiB RAM)\n",
+			   total_ram / SZ_1M);
+		return &ath11k_dp_profile_low_mem;
+	}
+
+	return &ath11k_dp_profile_default;
+}
+
 int ath11k_dp_alloc(struct ath11k_base *ab)
 {
 	struct ath11k_dp *dp = &ab->dp;
@@ -1057,6 +1098,7 @@ int ath11k_dp_alloc(struct ath11k_base *ab)
 	int i;
 
 	dp->ab = ab;
+	dp->profile = ath11k_dp_get_profile(ab);
 
 	INIT_LIST_HEAD(&dp->reo_cmd_list);
 	INIT_LIST_HEAD(&dp->reo_cmd_cache_flush_list);
@@ -1084,7 +1126,8 @@ int ath11k_dp_alloc(struct ath11k_base *ab)
 	if (ret)
 		goto fail_link_desc_cleanup;
 
-	size = sizeof(struct hal_wbm_release_ring) * DP_TX_COMP_RING_SIZE;
+	size = sizeof(struct hal_wbm_release_ring) *
+	       dp->profile->tx_comp_ring_size;
 
 	for (i = 0; i < ab->hw_params.hal_params->num_tx_rings; i++) {
 		idr_init(&dp->tx_ring[i].txbuf_idr);
@@ -1092,7 +1135,8 @@ int ath11k_dp_alloc(struct ath11k_base *ab)
 		dp->tx_ring[i].tcl_data_ring_id = i;
 
 		dp->tx_ring[i].tx_status_head = 0;
-		dp->tx_ring[i].tx_status_tail = DP_TX_COMP_RING_SIZE - 1;
+		dp->tx_ring[i].tx_status_tail =
+			dp->profile->tx_comp_ring_size - 1;
 		dp->tx_ring[i].tx_status = kmalloc(size, GFP_KERNEL);
 		if (!dp->tx_ring[i].tx_status) {
 			ret = -ENOMEM;
diff --git a/drivers/net/wireless/ath/ath11k/dp.h b/drivers/net/wireless/ath/ath11k/dp.h
index 84f66839f0c6..62e2c43da407 100644
--- a/drivers/net/wireless/ath/ath11k/dp.h
+++ b/drivers/net/wireless/ath/ath11k/dp.h
@@ -78,7 +78,7 @@ struct dp_rxdma_ring {
 	int bufs_max;
 };
 
-#define ATH11K_TX_COMPL_NEXT(x)	(((x) + 1) % DP_TX_COMP_RING_SIZE)
+#define ATH11K_TX_COMPL_NEXT(dp, x)	(((x) + 1) % (dp)->profile->tx_comp_ring_size)
 
 struct dp_tx_ring {
 	u8 tcl_data_ring_id;
@@ -206,7 +206,6 @@ struct ath11k_pdev_dp {
 #define DP_TCL_DATA_RING_SIZE		512
 #define DP_TCL_DATA_RING_SIZE_WCN6750	2048
 #define DP_TX_COMP_RING_SIZE		32768
-#define DP_TX_IDR_SIZE			DP_TX_COMP_RING_SIZE
 #define DP_TCL_CMD_RING_SIZE		32
 #define DP_TCL_STATUS_RING_SIZE		32
 #define DP_REO_DST_RING_MAX		4
@@ -254,8 +253,18 @@ struct ath11k_hp_update_timer {
 	struct ath11k_base *ab;
 };
 
+/* DP ring sizes that depend on the available system memory */
+struct ath11k_dp_profile_params {
+	u32 tx_comp_ring_size;
+	u32 rxdma_buf_ring_size;
+	u32 rxdma_mon_status_ring_size;
+	u32 rxdma_monitor_buf_ring_size;
+	u32 rxdma_monitor_dst_ring_size;
+};
+
 struct ath11k_dp {
 	struct ath11k_base *ab;
+	const struct ath11k_dp_profile_params *profile;
 	enum ath11k_htc_ep_id eid;
 	struct completion htt_tgt_version_received;
 	u8 htt_tgt_ver_major;
diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index 6d95f7b343a5..64063c3f1983 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -578,7 +578,8 @@ static int ath11k_dp_rx_pdev_srng_alloc(struct ath11k *ar)
 	ret = ath11k_dp_srng_setup(ar->ab,
 				   &dp->rx_refill_buf_ring.refill_buf_ring,
 				   HAL_RXDMA_BUF, 0,
-				   dp->mac_id, DP_RXDMA_BUF_RING_SIZE);
+				   dp->mac_id,
+				   ab->dp.profile->rxdma_buf_ring_size);
 	if (ret) {
 		ath11k_warn(ar->ab, "failed to setup rx_refill_buf_ring\n");
 		return ret;
@@ -613,7 +614,7 @@ static int ath11k_dp_rx_pdev_srng_alloc(struct ath11k *ar)
 		ret = ath11k_dp_srng_setup(ar->ab,
 					   srng,
 					   HAL_RXDMA_MONITOR_STATUS, 0, dp->mac_id + i,
-					   DP_RXDMA_MON_STATUS_RING_SIZE);
+					   ab->dp.profile->rxdma_mon_status_ring_size);
 		if (ret) {
 			ath11k_warn(ar->ab,
 				    "failed to setup rx_mon_status_refill_ring %d\n", i);
@@ -636,7 +637,7 @@ static int ath11k_dp_rx_pdev_srng_alloc(struct ath11k *ar)
 	ret = ath11k_dp_srng_setup(ar->ab,
 				   &dp->rxdma_mon_buf_ring.refill_buf_ring,
 				   HAL_RXDMA_MONITOR_BUF, 0, dp->mac_id,
-				   DP_RXDMA_MONITOR_BUF_RING_SIZE);
+				   ab->dp.profile->rxdma_monitor_buf_ring_size);
 	if (ret) {
 		ath11k_warn(ar->ab,
 			    "failed to setup HAL_RXDMA_MONITOR_BUF\n");
@@ -645,7 +646,7 @@ static int ath11k_dp_rx_pdev_srng_alloc(struct ath11k *ar)
 
 	ret = ath11k_dp_srng_setup(ar->ab, &dp->rxdma_mon_dst_ring,
 				   HAL_RXDMA_MONITOR_DST, 0, dp->mac_id,
-				   DP_RXDMA_MONITOR_DST_RING_SIZE);
+				   ab->dp.profile->rxdma_monitor_dst_ring_size);
 	if (ret) {
 		ath11k_warn(ar->ab,
 			    "failed to setup HAL_RXDMA_MONITOR_DST\n");
diff --git a/drivers/net/wireless/ath/ath11k/dp_tx.c b/drivers/net/wireless/ath/ath11k/dp_tx.c
index cac970c92806..a67aea979f8c 100644
--- a/drivers/net/wireless/ath/ath11k/dp_tx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_tx.c
@@ -122,7 +122,7 @@ int ath11k_dp_tx(struct ath11k *ar, struct ath11k_vif *arvif,
 
 	spin_lock_bh(&tx_ring->tx_idr_lock);
 	ret = idr_alloc(&tx_ring->txbuf_idr, skb, 0,
-			DP_TX_IDR_SIZE - 1, GFP_ATOMIC);
+			dp->profile->tx_comp_ring_size - 1, GFP_ATOMIC);
 	spin_unlock_bh(&tx_ring->tx_idr_lock);
 
 	if (unlikely(ret < 0)) {
@@ -701,17 +701,17 @@ void ath11k_dp_tx_completion_handler(struct ath11k_base *ab, int ring_id)
 
 	ath11k_hal_srng_access_begin(ab, status_ring);
 
-	while ((ATH11K_TX_COMPL_NEXT(tx_ring->tx_status_head) !=
+	while ((ATH11K_TX_COMPL_NEXT(dp, tx_ring->tx_status_head) !=
 		tx_ring->tx_status_tail) &&
 	       (desc = ath11k_hal_srng_dst_get_next_entry(ab, status_ring))) {
 		memcpy(&tx_ring->tx_status[tx_ring->tx_status_head],
 		       desc, sizeof(struct hal_wbm_release_ring));
 		tx_ring->tx_status_head =
-			ATH11K_TX_COMPL_NEXT(tx_ring->tx_status_head);
+			ATH11K_TX_COMPL_NEXT(dp, tx_ring->tx_status_head);
 	}
 
 	if (unlikely((ath11k_hal_srng_dst_peek(ab, status_ring) != NULL) &&
-		     (ATH11K_TX_COMPL_NEXT(tx_ring->tx_status_head) ==
+		     (ATH11K_TX_COMPL_NEXT(dp, tx_ring->tx_status_head) ==
 		      tx_ring->tx_status_tail))) {
 		/* TODO: Process pending tx_status messages when kfifo_is_full() */
 		ath11k_warn(ab, "Unable to process some of the tx_status ring desc because status_fifo is full\n");
@@ -721,12 +721,12 @@ void ath11k_dp_tx_completion_handler(struct ath11k_base *ab, int ring_id)
 
 	spin_unlock_bh(&status_ring->lock);
 
-	while (ATH11K_TX_COMPL_NEXT(tx_ring->tx_status_tail) != tx_ring->tx_status_head) {
+	while (ATH11K_TX_COMPL_NEXT(dp, tx_ring->tx_status_tail) != tx_ring->tx_status_head) {
 		struct hal_wbm_release_ring *tx_status;
 		u32 desc_id;
 
 		tx_ring->tx_status_tail =
-			ATH11K_TX_COMPL_NEXT(tx_ring->tx_status_tail);
+			ATH11K_TX_COMPL_NEXT(dp, tx_ring->tx_status_tail);
 		tx_status = &tx_ring->tx_status[tx_ring->tx_status_tail];
 		ath11k_dp_tx_status_parse(ab, tx_status, &ts);
 
-- 
2.54.0 (Apple Git-157)


