Return-Path: <SRS0=aNMw=OE=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D76BEC433F5
	for <ath11k@archiver.kernel.org>; Tue, 14 Sep 2021 16:37:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A569D61155
	for <ath11k@archiver.kernel.org>; Tue, 14 Sep 2021 16:37:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A569D61155
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=p28I8y16fwf/Q4a/e7fNs3Fn2Ik2+XSRh0XXelmg//k=; b=PCxA1xs24MvLD1
	E/vv9T/jLME4jw6BZ6g8dK8spDZQS7ZCPXWH1CTVQht50lD6aQV2jDKT8SvPq1tyaULJeb41gXlsw
	CpX/tD4zGEvJE/D17d4et6ah/GU1ElYw4hDiQdGKCiXOUS3wFTDnPGli0kwwmIZgC9VpY4NiTHJ+f
	jN9TBG09/TivL7yZ01Bgj1oRpFblO3sbN9PjT1Q8HaeonE4+gEo0lElmABpRfnON07YItrki/AFV7
	Z3xzX3jdfGPFC1AUxdQfrMeHAjzEgQKQkEAdUp+GM7ux10qEQ3i5gf40NgaHiB+pz53ren0rpH+WE
	ZfkOFEg59i+ouTIZtkNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mQBRP-006TZz-QB; Tue, 14 Sep 2021 16:37:51 +0000
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mQBRM-006TZP-Nh
 for ath11k@lists.infradead.org; Tue, 14 Sep 2021 16:37:50 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1631637462; h=Content-Transfer-Encoding: MIME-Version:
 Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=sLaQzkNRo7oJJ9nFi+ZgDsCCfbqUKv/mSo110VKOCkk=;
 b=lJonCJoynzmzVAuFhOowJQ4Vfn8jQPSRCstXAHNo+LNpKqMPVx9RNmfszwhMDqloIhAYyv/9
 SswpPjLC6NhRGGEUpDwoxiWiAA4czTGzY36a2CVqkolR+pAUJHwQuX0r1RrSWaeu2naVDHWK
 tt2qpkkg3Q+VnQlSZ9dGirYMfdQ=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 6140cfcfb585cc7d24441293 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 14 Sep 2021 16:37:35
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 62656C43618; Tue, 14 Sep 2021 16:37:35 +0000 (UTC)
Received: from jouni.codeaurora.org (85-76-72-211-nat.elisa-mobile.fi
 [85.76.72.211])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: jouni)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 8D69BC43618;
 Tue, 14 Sep 2021 16:37:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 8D69BC43618
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
From: Jouni Malinen <jouni@codeaurora.org>
To: Kalle Valo <kvalo@codeaurora.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 Baochen Qiang <bqiang@codeaurora.org>, Jouni Malinen <jouni@codeaurora.org>
Subject: [PATCH 1/3] ath11k: Change number of TCL rings to one for QCA6390
Date: Tue, 14 Sep 2021 19:37:24 +0300
Message-Id: <20210914163726.38604-1-jouni@codeaurora.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210914_093748_891291_B8836F46 
X-CRM114-Status: GOOD (  22.45  )
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

From: Baochen Qiang <bqiang@codeaurora.org>

Some targets, QCA6390 for example, use only one TCL ring,
it is better to initialize only one ring and leave others
untouched for such targets.

Tested-on: QCA6390 hw2.0 PCI WLAN.HST.1.0.1-01740-QCAHSTSWPLZ_V2_TO_X86-1

Signed-off-by: Baochen Qiang <bqiang@codeaurora.org>
Signed-off-by: Jouni Malinen <jouni@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/core.c    | 10 +++++-----
 drivers/net/wireless/ath/ath11k/debugfs.c |  2 +-
 drivers/net/wireless/ath/ath11k/dp.c      | 10 +++++-----
 drivers/net/wireless/ath/ath11k/dp.h      |  1 +
 drivers/net/wireless/ath/ath11k/dp_tx.c   | 13 +++++--------
 drivers/net/wireless/ath/ath11k/hw.h      |  2 +-
 drivers/net/wireless/ath/ath11k/mac.c     |  2 +-
 7 files changed, 19 insertions(+), 21 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
index a8c6f7cf33d5..af76e37d11ae 100644
--- a/drivers/net/wireless/ath/ath11k/core.c
+++ b/drivers/net/wireless/ath/ath11k/core.c
@@ -58,7 +58,6 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.rx_mac_buf_ring = false,
 		.vdev_start_delay = false,
 		.htt_peer_map_v2 = true,
-		.tcl_0_only = false,
 		.spectral = {
 			.fft_sz = 2,
 			/* HW bug, expected BIN size is 2 bytes but HW report as 4 bytes.
@@ -82,6 +81,7 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.hal_desc_sz = sizeof(struct hal_rx_desc_ipq8074),
 		.fix_l1ss = true,
 		.sram_dump = NULL,
+		.max_tx_ring = DP_TCL_NUM_RING_MAX,
 	},
 	{
 		.hw_rev = ATH11K_HW_IPQ6018_HW10,
@@ -110,7 +110,6 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.rx_mac_buf_ring = false,
 		.vdev_start_delay = false,
 		.htt_peer_map_v2 = true,
-		.tcl_0_only = false,
 		.spectral = {
 			.fft_sz = 4,
 			.fft_pad_sz = 0,
@@ -131,6 +130,7 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.hal_desc_sz = sizeof(struct hal_rx_desc_ipq8074),
 		.fix_l1ss = true,
 		.sram_dump = NULL,
+		.max_tx_ring = DP_TCL_NUM_RING_MAX,
 	},
 	{
 		.name = "qca6390 hw2.0",
@@ -159,7 +159,6 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.rx_mac_buf_ring = true,
 		.vdev_start_delay = true,
 		.htt_peer_map_v2 = false,
-		.tcl_0_only = true,
 		.spectral = {
 			.fft_sz = 0,
 			.fft_pad_sz = 0,
@@ -179,6 +178,7 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.hal_desc_sz = sizeof(struct hal_rx_desc_ipq8074),
 		.fix_l1ss = true,
 		.sram_dump = &sram_dump_qca6390,
+		.max_tx_ring = DP_TCL_NUM_RING_MAX_QCA6390,
 	},
 	{
 		.name = "qcn9074 hw1.0",
@@ -206,7 +206,6 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.rx_mac_buf_ring = false,
 		.vdev_start_delay = false,
 		.htt_peer_map_v2 = true,
-		.tcl_0_only = false,
 		.spectral = {
 			.fft_sz = 2,
 			.fft_pad_sz = 0,
@@ -227,6 +226,7 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.hal_desc_sz = sizeof(struct hal_rx_desc_qcn9074),
 		.fix_l1ss = true,
 		.sram_dump = NULL,
+		.max_tx_ring = DP_TCL_NUM_RING_MAX,
 	},
 	{
 		.name = "wcn6855 hw2.0",
@@ -255,7 +255,6 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.rx_mac_buf_ring = true,
 		.vdev_start_delay = true,
 		.htt_peer_map_v2 = false,
-		.tcl_0_only = true,
 		.spectral = {
 			.fft_sz = 0,
 			.fft_pad_sz = 0,
@@ -274,6 +273,7 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.hal_desc_sz = sizeof(struct hal_rx_desc_wcn6855),
 		.fix_l1ss = false,
 		.sram_dump = &sram_dump_wcn6855,
+		.max_tx_ring = DP_TCL_NUM_RING_MAX_QCA6390,
 	},
 };
 
diff --git a/drivers/net/wireless/ath/ath11k/debugfs.c b/drivers/net/wireless/ath/ath11k/debugfs.c
index 871445f4e96a..0b42df65e4dc 100644
--- a/drivers/net/wireless/ath/ath11k/debugfs.c
+++ b/drivers/net/wireless/ath/ath11k/debugfs.c
@@ -807,7 +807,7 @@ static ssize_t ath11k_debugfs_dump_soc_dp_stats(struct file *file,
 	len += scnprintf(buf + len, size - len, "\nSOC TX STATS:\n");
 	len += scnprintf(buf + len, size - len, "\nTCL Ring Full Failures:\n");
 
-	for (i = 0; i < DP_TCL_NUM_RING_MAX; i++)
+	for (i = 0; i < ab->hw_params.max_tx_ring; i++)
 		len += scnprintf(buf + len, size - len, "ring%d: %u\n",
 				 i, soc_stats->tx_err.desc_na[i]);
 
diff --git a/drivers/net/wireless/ath/ath11k/dp.c b/drivers/net/wireless/ath/ath11k/dp.c
index dd69ba8f7d80..f7049a13973d 100644
--- a/drivers/net/wireless/ath/ath11k/dp.c
+++ b/drivers/net/wireless/ath/ath11k/dp.c
@@ -311,7 +311,7 @@ void ath11k_dp_stop_shadow_timers(struct ath11k_base *ab)
 	if (!ab->hw_params.supports_shadow_regs)
 		return;
 
-	for (i = 0; i < DP_TCL_NUM_RING_MAX; i++)
+	for (i = 0; i < ab->hw_params.max_tx_ring; i++)
 		ath11k_dp_shadow_stop_timer(ab, &ab->dp.tx_ring_timer[i]);
 
 	ath11k_dp_shadow_stop_timer(ab, &ab->dp.reo_cmd_timer);
@@ -326,7 +326,7 @@ static void ath11k_dp_srng_common_cleanup(struct ath11k_base *ab)
 	ath11k_dp_srng_cleanup(ab, &dp->wbm_desc_rel_ring);
 	ath11k_dp_srng_cleanup(ab, &dp->tcl_cmd_ring);
 	ath11k_dp_srng_cleanup(ab, &dp->tcl_status_ring);
-	for (i = 0; i < DP_TCL_NUM_RING_MAX; i++) {
+	for (i = 0; i < ab->hw_params.max_tx_ring; i++) {
 		ath11k_dp_srng_cleanup(ab, &dp->tx_ring[i].tcl_data_ring);
 		ath11k_dp_srng_cleanup(ab, &dp->tx_ring[i].tcl_comp_ring);
 	}
@@ -366,7 +366,7 @@ static int ath11k_dp_srng_common_setup(struct ath11k_base *ab)
 		goto err;
 	}
 
-	for (i = 0; i < DP_TCL_NUM_RING_MAX; i++) {
+	for (i = 0; i < ab->hw_params.max_tx_ring; i++) {
 		ret = ath11k_dp_srng_setup(ab, &dp->tx_ring[i].tcl_data_ring,
 					   HAL_TCL_DATA, i, 0,
 					   DP_TCL_DATA_RING_SIZE);
@@ -996,7 +996,7 @@ void ath11k_dp_free(struct ath11k_base *ab)
 
 	ath11k_dp_reo_cmd_list_cleanup(ab);
 
-	for (i = 0; i < DP_TCL_NUM_RING_MAX; i++) {
+	for (i = 0; i < ab->hw_params.max_tx_ring; i++) {
 		spin_lock_bh(&dp->tx_ring[i].tx_idr_lock);
 		idr_for_each(&dp->tx_ring[i].txbuf_idr,
 			     ath11k_dp_tx_pending_cleanup, ab);
@@ -1047,7 +1047,7 @@ int ath11k_dp_alloc(struct ath11k_base *ab)
 
 	size = sizeof(struct hal_wbm_release_ring) * DP_TX_COMP_RING_SIZE;
 
-	for (i = 0; i < DP_TCL_NUM_RING_MAX; i++) {
+	for (i = 0; i < ab->hw_params.max_tx_ring; i++) {
 		idr_init(&dp->tx_ring[i].txbuf_idr);
 		spin_lock_init(&dp->tx_ring[i].tx_idr_lock);
 		dp->tx_ring[i].tcl_data_ring_id = i;
diff --git a/drivers/net/wireless/ath/ath11k/dp.h b/drivers/net/wireless/ath/ath11k/dp.h
index 36ef85e9515a..64c90cfd9c38 100644
--- a/drivers/net/wireless/ath/ath11k/dp.h
+++ b/drivers/net/wireless/ath/ath11k/dp.h
@@ -193,6 +193,7 @@ struct ath11k_pdev_dp {
 #define DP_BA_WIN_SZ_MAX	256
 
 #define DP_TCL_NUM_RING_MAX	3
+#define DP_TCL_NUM_RING_MAX_QCA6390	1
 
 #define DP_IDLE_SCATTER_BUFS_MAX 16
 
diff --git a/drivers/net/wireless/ath/ath11k/dp_tx.c b/drivers/net/wireless/ath/ath11k/dp_tx.c
index 125a9a8a5b0a..6ef9b5d0b11a 100644
--- a/drivers/net/wireless/ath/ath11k/dp_tx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_tx.c
@@ -115,11 +115,8 @@ int ath11k_dp_tx(struct ath11k *ar, struct ath11k_vif *arvif,
 
 tcl_ring_sel:
 	tcl_ring_retry = false;
-	/* For some chip, it can only use tcl0 to tx */
-	if (ar->ab->hw_params.tcl_0_only)
-		ti.ring_id = 0;
-	else
-		ti.ring_id = ring_selector % DP_TCL_NUM_RING_MAX;
+
+	ti.ring_id = ring_selector % ab->hw_params.max_tx_ring;
 
 	ring_map |= BIT(ti.ring_id);
 
@@ -131,7 +128,7 @@ int ath11k_dp_tx(struct ath11k *ar, struct ath11k_vif *arvif,
 	spin_unlock_bh(&tx_ring->tx_idr_lock);
 
 	if (ret < 0) {
-		if (ring_map == (BIT(DP_TCL_NUM_RING_MAX) - 1)) {
+		if (ring_map == (BIT(ab->hw_params.max_tx_ring) - 1)) {
 			atomic_inc(&ab->soc_stats.tx_err.misc_fail);
 			return -ENOSPC;
 		}
@@ -248,8 +245,8 @@ int ath11k_dp_tx(struct ath11k *ar, struct ath11k_vif *arvif,
 		 * checking this ring earlier for each pkt tx.
 		 * Restart ring selection if some rings are not checked yet.
 		 */
-		if (ring_map != (BIT(DP_TCL_NUM_RING_MAX) - 1) &&
-		    !ar->ab->hw_params.tcl_0_only) {
+		if (ring_map != (BIT(ab->hw_params.max_tx_ring) - 1) &&
+		    ab->hw_params.max_tx_ring > 1) {
 			tcl_ring_retry = true;
 			ring_selector++;
 		}
diff --git a/drivers/net/wireless/ath/ath11k/hw.h b/drivers/net/wireless/ath/ath11k/hw.h
index 484c0bcec86d..6e68c5b60eaa 100644
--- a/drivers/net/wireless/ath/ath11k/hw.h
+++ b/drivers/net/wireless/ath/ath11k/hw.h
@@ -158,7 +158,6 @@ struct ath11k_hw_params {
 	bool rx_mac_buf_ring;
 	bool vdev_start_delay;
 	bool htt_peer_map_v2;
-	bool tcl_0_only;
 
 	struct {
 		u8 fft_sz;
@@ -179,6 +178,7 @@ struct ath11k_hw_params {
 	u32 hal_desc_sz;
 	bool fix_l1ss;
 	const struct ath11k_hw_sram_dump *sram_dump;
+	u8 max_tx_ring;
 };
 
 struct ath11k_hw_ops {
diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 155ca6af1b45..1f4765e43546 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -5731,7 +5731,7 @@ static void ath11k_mac_op_remove_interface(struct ieee80211_hw *hw,
 	idr_for_each(&ar->txmgmt_idr,
 		     ath11k_mac_vif_txmgmt_idr_remove, vif);
 
-	for (i = 0; i < DP_TCL_NUM_RING_MAX; i++) {
+	for (i = 0; i < ab->hw_params.max_tx_ring; i++) {
 		spin_lock_bh(&ab->dp.tx_ring[i].tx_idr_lock);
 		idr_for_each(&ab->dp.tx_ring[i].txbuf_idr,
 			     ath11k_mac_vif_unref, vif);
-- 
2.25.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
