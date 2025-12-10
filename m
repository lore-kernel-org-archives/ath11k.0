Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2F46D3C520
	for <ath11k@archiver.kernel.org>; Wed, 10 Dec 2025 02:40:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=amAH0gLSu+BYXGT+9BRc7QAr8FyrlPyo3lKeFD7HEcs=; b=ack1Lv/tw4LHqBOBR6PpwQWhM0
	+gFX/1dTcZJG1oHYR6jwttOx4CveUyAB6BWA7lzciiubH80dWj5U8qEoNSXjs6hFWuGVQW1MYZAuf
	yz0Y9qaiJGv1lU+7co4kV55K0KLaqDQji4ZvTtUKdjxI7i8btn4WSwiLGU+opy6yY6qUKvpQJRnie
	Oi6G3SbxnM7kC+kMXtToEiK7djEW7XOaYw9ASxLCQaTs0lzM6ExoeccjupcsKrV/M3Ygxgjzb4vNR
	3uHXzDOXmnlqi0pXloulZPjwXnFVUdlfrdxCXQYY/Y0LfIGKoeCAY7EopdwqCyq2LTU2QrOYtLylP
	fD91kHYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTA8D-0000000F12L-1xJq;
	Wed, 10 Dec 2025 02:40:45 +0000
Received: from mail-ot1-x331.google.com ([2607:f8b0:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTA8B-0000000F120-1HAj
	for ath11k@lists.infradead.org;
	Wed, 10 Dec 2025 02:40:44 +0000
Received: by mail-ot1-x331.google.com with SMTP id 46e09a7af769-7c6ce4f65f7so5799031a34.0
        for <ath11k@lists.infradead.org>; Tue, 09 Dec 2025 18:40:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765334441; x=1765939241; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=amAH0gLSu+BYXGT+9BRc7QAr8FyrlPyo3lKeFD7HEcs=;
        b=EFqj5Gvs0QNXyysMULxdykqmOgZllBzvRkNdT5gHX26F20l+c4Y35thfstrAOWX6Ed
         WGggFyN7/iAfhh/cXsDzTbIG7AX2ucapZSYsfFexaGx/jb9zMkgN87x5xf/wM6PlCPPj
         Vtt4toaZIf1+MtKXZMnm4dQm7FOvACjbANefYCl2nHq1yiLlbDcm2h64CsvqzwYmfkdc
         ZcSHfBkYMtFS2abKEz8Q/AMve6ZCkarWjc0oYJXMn9ZFmoYtjWuhSEmb1eON5NaY0IQG
         TFzuLEVcWaxXY7ZS66woTl3QD8FpaOQ3esFTeCUIL78vD3+44chgW0KCNfWV+Pi9/LCS
         xF0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765334441; x=1765939241;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=amAH0gLSu+BYXGT+9BRc7QAr8FyrlPyo3lKeFD7HEcs=;
        b=HiV+k5GZp1CHC4SbNdTdLtFc4YtkmnhBhLu+L42I3ShkeRjaui1io7IZrXFgILBJr5
         Ikuw2xtOBHgeXNjTQw79kQPnG63H5a35x8lBC8K5j46XyjeazM1jdYl31XJB2TFU8epM
         VKZSQZGVWF+3Z/DCVh0GjcEp/NTRG7R0PlVREd6fWDXXML5f0C4hp0+cbh8+xTx40+XK
         DmuaxC9Aht7u0oGj52xYPpzFZSNDswTE2H5cTCbMYYTOzUL4Ac4JDXihzEDL58DReKS5
         8DcUlO7zDCXnNn3lw4QZI25ys6Exyv+bAtuPXzvEZj6zjqc+p1W5lsnscZ9kQ7xudhed
         KOEw==
X-Gm-Message-State: AOJu0YzQtize6ipwI+0DgR7kveiq1exmedl/LZ6USGlVR7iynHlH7i8m
	eM1EW8XVGOKJhYbWQkoh+62qb88Id5BKLekq/X/zoOxDbtmsvWeJRsk7g3Tmqw==
X-Gm-Gg: ASbGnct47VDYmV0YmxY44/XwkKg1f/5mXubW8EcwfIo5JmGeTna9cu/CWDCdz4dVmyq
	BtRywrUcX/Jl09k7RnrEqYYbCSbYE4vc9YgvjhO56TXGvEAVgzP+zi2DhTUXN/c+UxAW5DbyDhb
	IaYQyDIJvVga2cvW1U3/4TMwn6VbsW/VLG9BeisopjxhyAh4E/EFIzENGLjqo0KBrRchxCkleT9
	evRicG2Yaf1a1JycMEHbBazRwS7Yqjg2K6DUhkDXdqLVLL84eEYDjDCAaCUcjI06pJM7wSYgvig
	XRVAa0QMe2JIdlcbNA98c3mHSFbSIcIp1VxUZibI+Fbhft9jSw8JxrtKgQpGUxByxfHHKWBOxLZ
	pIpFE0qDumBIbXwMm9CvqAT/yuo7rNflo9p+Oy+Q6l+oIA+4sdHDSPoNhHCxPTM7+pThly4xjaQ
	PzYcOYyMW7nFiDttd31b7o0K9wpFWJPZw5Y25qmRGINakWA98i0Zw3ODQq+yR/7uGeFy7jFYAEQ
	t18EntCXyD+gg33h/7AHQewpSX3
X-Google-Smtp-Source: AGHT+IE/mi93bEIS6R0Cu/rhdqxwGtJefv5ZPIAO0tvdrlgx4QVGUUbORXorj8qoVmnmzBm4xRqffQ==
X-Received: by 2002:a05:6830:918:b0:78a:8b0d:cd54 with SMTP id 46e09a7af769-7cacebfadd9mr696324a34.34.1765334441165;
        Tue, 09 Dec 2025 18:40:41 -0800 (PST)
Received: from nukework.lan (c-98-57-15-22.hsd1.tx.comcast.net. [98.57.15.22])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7c95a8f8e37sm13351472a34.3.2025.12.09.18.40.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 18:40:40 -0800 (PST)
From: Alexandru Gagniuc <mr.nuke.me@gmail.com>
To: ath11k@lists.infradead.org,
	Jeff Johnson <jjohnson@kernel.org>
Cc: Alexandru Gagniuc <mr.nuke.me@gmail.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] wifi: ath11k: move .max_tx_ring to struct ath11k_hw_hal_params
Date: Tue,  9 Dec 2025 20:40:34 -0600
Message-ID: <20251210024036.3965135-1-mr.nuke.me@gmail.com>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251209_184043_409976_54DC09DB 
X-CRM114-Status: GOOD (  21.20  )
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

".max_tx_ring" is an upper bounds to indexing ".tcl2wbm_rbm_map". It
is initialized in, core.c, a different file than the array init. This
spaghetti-like relation is fragile and not obvious. Accidentally
setting ".max_tx_ring" too high leads to a hard to track out-of-
bounds access and memory corruption.

Clarify this dependency by moving ".max_tx_ring" adjacent to the array
".tcl2wbm_rbm_map". Use ARRAY_SIZE() instead of #defines to initialize
the length field. Remove DP_TCL_NUM_RING_MAX_QCA6390, as it is no
longer required.

The intent is to make the code easier to understand rather than fix
an existing bug.

Signed-off-by: Alexandru Gagniuc <mr.nuke.me@gmail.com>
---

I am trying to make ath11k work on IPQ9574. My device uses a IPQ9570
with a QCN5024 as the 2.4 GHz wifi.

I spent a few days tracking a memory corruption bug caused by
erroneously setting ".max_tx_ring" too high. I think I would not have
made this mistake if the initializations of .max_tx_ring and
.tcl2wbm_rbm_map were right next to each other.


 drivers/net/wireless/ath/ath11k/core.c  | 12 +-----------
 drivers/net/wireless/ath/ath11k/dp.c    | 12 ++++++------
 drivers/net/wireless/ath/ath11k/dp.h    |  1 -
 drivers/net/wireless/ath/ath11k/dp_tx.c |  9 +++++----
 drivers/net/wireless/ath/ath11k/hw.c    | 17 +++++++++++++++++
 drivers/net/wireless/ath/ath11k/hw.h    |  3 ++-
 drivers/net/wireless/ath/ath11k/mac.c   |  2 +-
 7 files changed, 32 insertions(+), 24 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
index 812686173ac8a..07199ceecbeb4 100644
--- a/drivers/net/wireless/ath/ath11k/core.c
+++ b/drivers/net/wireless/ath/ath11k/core.c
@@ -100,7 +100,6 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.supports_regdb = false,
 		.fix_l1ss = true,
 		.credit_flow = false,
-		.max_tx_ring = DP_TCL_NUM_RING_MAX,
 		.hal_params = &ath11k_hw_hal_params_ipq8074,
 		.supports_dynamic_smps_6ghz = false,
 		.alloc_cacheable_memory = true,
@@ -184,7 +183,6 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.supports_regdb = false,
 		.fix_l1ss = true,
 		.credit_flow = false,
-		.max_tx_ring = DP_TCL_NUM_RING_MAX,
 		.hal_params = &ath11k_hw_hal_params_ipq8074,
 		.supports_dynamic_smps_6ghz = false,
 		.alloc_cacheable_memory = true,
@@ -271,7 +269,6 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.supports_regdb = false,
 		.fix_l1ss = true,
 		.credit_flow = true,
-		.max_tx_ring = DP_TCL_NUM_RING_MAX_QCA6390,
 		.hal_params = &ath11k_hw_hal_params_qca6390,
 		.supports_dynamic_smps_6ghz = false,
 		.alloc_cacheable_memory = false,
@@ -358,7 +355,6 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.supports_regdb = false,
 		.fix_l1ss = true,
 		.credit_flow = false,
-		.max_tx_ring = DP_TCL_NUM_RING_MAX,
 		.hal_params = &ath11k_hw_hal_params_ipq8074,
 		.supports_dynamic_smps_6ghz = true,
 		.alloc_cacheable_memory = true,
@@ -445,7 +441,6 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.supports_regdb = true,
 		.fix_l1ss = false,
 		.credit_flow = true,
-		.max_tx_ring = DP_TCL_NUM_RING_MAX_QCA6390,
 		.hal_params = &ath11k_hw_hal_params_qca6390,
 		.supports_dynamic_smps_6ghz = false,
 		.alloc_cacheable_memory = false,
@@ -533,7 +528,6 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.supports_regdb = true,
 		.fix_l1ss = false,
 		.credit_flow = true,
-		.max_tx_ring = DP_TCL_NUM_RING_MAX_QCA6390,
 		.hal_params = &ath11k_hw_hal_params_qca6390,
 		.supports_dynamic_smps_6ghz = false,
 		.alloc_cacheable_memory = false,
@@ -619,7 +613,6 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.supports_regdb = true,
 		.fix_l1ss = false,
 		.credit_flow = true,
-		.max_tx_ring = DP_TCL_NUM_RING_MAX,
 		.hal_params = &ath11k_hw_hal_params_wcn6750,
 		.supports_dynamic_smps_6ghz = false,
 		.alloc_cacheable_memory = false,
@@ -662,7 +655,6 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.qmi_service_ins_id = ATH11K_QMI_WLFW_SERVICE_INS_ID_V01_IPQ8074,
 		.ring_mask = &ath11k_hw_ring_mask_ipq8074,
 		.credit_flow = false,
-		.max_tx_ring = 1,
 		.spectral = {
 			.fft_sz = 2,
 			.fft_pad_sz = 0,
@@ -698,7 +690,7 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.supports_regdb = false,
 		.idle_ps = false,
 		.supports_suspend = false,
-		.hal_params = &ath11k_hw_hal_params_ipq8074,
+		.hal_params = &ath11k_hw_hal_params_ipq5018,
 		.single_pdev_only = false,
 		.coldboot_cal_mm = true,
 		.coldboot_cal_ftm = true,
@@ -789,7 +781,6 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.supports_regdb = true,
 		.fix_l1ss = false,
 		.credit_flow = true,
-		.max_tx_ring = DP_TCL_NUM_RING_MAX_QCA6390,
 		.hal_params = &ath11k_hw_hal_params_qca6390,
 		.supports_dynamic_smps_6ghz = false,
 		.alloc_cacheable_memory = false,
@@ -876,7 +867,6 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.supports_regdb = true,
 		.fix_l1ss = false,
 		.credit_flow = true,
-		.max_tx_ring = DP_TCL_NUM_RING_MAX_QCA6390,
 		.hal_params = &ath11k_hw_hal_params_qca6390,
 		.supports_dynamic_smps_6ghz = false,
 		.alloc_cacheable_memory = false,
diff --git a/drivers/net/wireless/ath/ath11k/dp.c b/drivers/net/wireless/ath/ath11k/dp.c
index 56b1a657e0b0f..bd6778d357275 100644
--- a/drivers/net/wireless/ath/ath11k/dp.c
+++ b/drivers/net/wireless/ath/ath11k/dp.c
@@ -344,7 +344,7 @@ void ath11k_dp_stop_shadow_timers(struct ath11k_base *ab)
 	if (!ab->hw_params.supports_shadow_regs)
 		return;
 
-	for (i = 0; i < ab->hw_params.max_tx_ring; i++)
+	for (i = 0; i < ab->hw_params.hal_params->map_len; i++)
 		ath11k_dp_shadow_stop_timer(ab, &ab->dp.tx_ring_timer[i]);
 
 	ath11k_dp_shadow_stop_timer(ab, &ab->dp.reo_cmd_timer);
@@ -359,7 +359,7 @@ static void ath11k_dp_srng_common_cleanup(struct ath11k_base *ab)
 	ath11k_dp_srng_cleanup(ab, &dp->wbm_desc_rel_ring);
 	ath11k_dp_srng_cleanup(ab, &dp->tcl_cmd_ring);
 	ath11k_dp_srng_cleanup(ab, &dp->tcl_status_ring);
-	for (i = 0; i < ab->hw_params.max_tx_ring; i++) {
+	for (i = 0; i < ab->hw_params.hal_params->map_len; i++) {
 		ath11k_dp_srng_cleanup(ab, &dp->tx_ring[i].tcl_data_ring);
 		ath11k_dp_srng_cleanup(ab, &dp->tx_ring[i].tcl_comp_ring);
 	}
@@ -400,7 +400,7 @@ static int ath11k_dp_srng_common_setup(struct ath11k_base *ab)
 		goto err;
 	}
 
-	for (i = 0; i < ab->hw_params.max_tx_ring; i++) {
+	for (i = 0; i < ab->hw_params.hal_params->map_len; i++) {
 		tcl_num = ab->hw_params.hal_params->tcl2wbm_rbm_map[i].tcl_ring_num;
 		wbm_num = ab->hw_params.hal_params->tcl2wbm_rbm_map[i].wbm_ring_num;
 
@@ -782,7 +782,7 @@ int ath11k_dp_service_srng(struct ath11k_base *ab,
 	int i, j;
 	int tot_work_done = 0;
 
-	for (i = 0; i < ab->hw_params.max_tx_ring; i++) {
+	for (i = 0; i < ab->hw_params.hal_params->map_len; i++) {
 		if (BIT(ab->hw_params.hal_params->tcl2wbm_rbm_map[i].wbm_ring_num) &
 		    ab->hw_params.ring_mask->tx[grp_id])
 			ath11k_dp_tx_completion_handler(ab, i);
@@ -1035,7 +1035,7 @@ void ath11k_dp_free(struct ath11k_base *ab)
 
 	ath11k_dp_reo_cmd_list_cleanup(ab);
 
-	for (i = 0; i < ab->hw_params.max_tx_ring; i++) {
+	for (i = 0; i < ab->hw_params.hal_params->map_len; i++) {
 		spin_lock_bh(&dp->tx_ring[i].tx_idr_lock);
 		idr_for_each(&dp->tx_ring[i].txbuf_idr,
 			     ath11k_dp_tx_pending_cleanup, ab);
@@ -1086,7 +1086,7 @@ int ath11k_dp_alloc(struct ath11k_base *ab)
 
 	size = sizeof(struct hal_wbm_release_ring) * DP_TX_COMP_RING_SIZE;
 
-	for (i = 0; i < ab->hw_params.max_tx_ring; i++) {
+	for (i = 0; i < ab->hw_params.hal_params->map_len; i++) {
 		idr_init(&dp->tx_ring[i].txbuf_idr);
 		spin_lock_init(&dp->tx_ring[i].tx_idr_lock);
 		dp->tx_ring[i].tcl_data_ring_id = i;
diff --git a/drivers/net/wireless/ath/ath11k/dp.h b/drivers/net/wireless/ath/ath11k/dp.h
index 7a55afd33be82..1bd513f68a3c3 100644
--- a/drivers/net/wireless/ath/ath11k/dp.h
+++ b/drivers/net/wireless/ath/ath11k/dp.h
@@ -199,7 +199,6 @@ struct ath11k_pdev_dp {
 #define DP_BA_WIN_SZ_MAX	256
 
 #define DP_TCL_NUM_RING_MAX	3
-#define DP_TCL_NUM_RING_MAX_QCA6390	1
 
 #define DP_IDLE_SCATTER_BUFS_MAX 16
 
diff --git a/drivers/net/wireless/ath/ath11k/dp_tx.c b/drivers/net/wireless/ath/ath11k/dp_tx.c
index 562aba66582f3..53e34a2bea54e 100644
--- a/drivers/net/wireless/ath/ath11k/dp_tx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_tx.c
@@ -91,6 +91,7 @@ int ath11k_dp_tx(struct ath11k *ar, struct ath11k_vif *arvif,
 	struct hal_srng *tcl_ring;
 	struct ieee80211_hdr *hdr = (void *)skb->data;
 	struct dp_tx_ring *tx_ring;
+	size_t max_tx_ring = ab->hw_params.hal_params->map_len;
 	void *hal_tcl_desc;
 	u8 pool_id;
 	u8 hal_ring_id;
@@ -113,7 +114,7 @@ int ath11k_dp_tx(struct ath11k *ar, struct ath11k_vif *arvif,
 tcl_ring_sel:
 	tcl_ring_retry = false;
 
-	ti.ring_id = ring_selector % ab->hw_params.max_tx_ring;
+	ti.ring_id = ring_selector % max_tx_ring;
 	ti.rbm_id = ab->hw_params.hal_params->tcl2wbm_rbm_map[ti.ring_id].rbm_id;
 
 	ring_map |= BIT(ti.ring_id);
@@ -126,7 +127,7 @@ int ath11k_dp_tx(struct ath11k *ar, struct ath11k_vif *arvif,
 	spin_unlock_bh(&tx_ring->tx_idr_lock);
 
 	if (unlikely(ret < 0)) {
-		if (ring_map == (BIT(ab->hw_params.max_tx_ring) - 1) ||
+		if (ring_map == (BIT(max_tx_ring) - 1) ||
 		    !ab->hw_params.tcl_ring_retry) {
 			atomic_inc(&ab->soc_stats.tx_err.misc_fail);
 			return -ENOSPC;
@@ -244,8 +245,8 @@ int ath11k_dp_tx(struct ath11k *ar, struct ath11k_vif *arvif,
 		 * checking this ring earlier for each pkt tx.
 		 * Restart ring selection if some rings are not checked yet.
 		 */
-		if (unlikely(ring_map != (BIT(ab->hw_params.max_tx_ring)) - 1) &&
-		    ab->hw_params.tcl_ring_retry && ab->hw_params.max_tx_ring > 1) {
+		if (unlikely(ring_map != (BIT(max_tx_ring)) - 1) &&
+		    ab->hw_params.tcl_ring_retry && max_tx_ring > 1) {
 			tcl_ring_retry = true;
 			ring_selector++;
 		}
diff --git a/drivers/net/wireless/ath/ath11k/hw.c b/drivers/net/wireless/ath/ath11k/hw.c
index caa6dc12a790b..8b1aef7a536ec 100644
--- a/drivers/net/wireless/ath/ath11k/hw.c
+++ b/drivers/net/wireless/ath/ath11k/hw.c
@@ -2707,6 +2707,14 @@ const struct ath11k_hw_regs wcn6750_regs = {
 	.hal_reo1_misc_ctl = 0x000005d8,
 };
 
+static const struct ath11k_hw_tcl2wbm_rbm_map ath11k_hw_tcl2wbm_rbm_map_ipq5018[] = {
+	{
+		.tcl_ring_num = 0,
+		.wbm_ring_num = 0,
+		.rbm_id = HAL_RX_BUF_RBM_SW0_BM,
+	},
+};
+
 static const struct ath11k_hw_tcl2wbm_rbm_map ath11k_hw_tcl2wbm_rbm_map_ipq8074[] = {
 	{
 		.tcl_ring_num = 0,
@@ -2822,19 +2830,28 @@ const struct ath11k_hw_regs ipq5018_regs = {
 	.hal_wbm1_release_ring_base_lsb = 0x0000097c,
 };
 
+const struct ath11k_hw_hal_params ath11k_hw_hal_params_ipq5018 = {
+	.rx_buf_rbm = HAL_RX_BUF_RBM_SW3_BM,
+	.tcl2wbm_rbm_map = ath11k_hw_tcl2wbm_rbm_map_ipq5018,
+	.map_len = ARRAY_SIZE(ath11k_hw_tcl2wbm_rbm_map_ipq5018),
+};
+
 const struct ath11k_hw_hal_params ath11k_hw_hal_params_ipq8074 = {
 	.rx_buf_rbm = HAL_RX_BUF_RBM_SW3_BM,
 	.tcl2wbm_rbm_map = ath11k_hw_tcl2wbm_rbm_map_ipq8074,
+	.map_len = ARRAY_SIZE(ath11k_hw_tcl2wbm_rbm_map_ipq8074),
 };
 
 const struct ath11k_hw_hal_params ath11k_hw_hal_params_qca6390 = {
 	.rx_buf_rbm = HAL_RX_BUF_RBM_SW1_BM,
 	.tcl2wbm_rbm_map = ath11k_hw_tcl2wbm_rbm_map_ipq8074,
+	.map_len = ARRAY_SIZE(ath11k_hw_tcl2wbm_rbm_map_ipq8074),
 };
 
 const struct ath11k_hw_hal_params ath11k_hw_hal_params_wcn6750 = {
 	.rx_buf_rbm = HAL_RX_BUF_RBM_SW1_BM,
 	.tcl2wbm_rbm_map = ath11k_hw_tcl2wbm_rbm_map_wcn6750,
+	.map_len = ARRAY_SIZE(ath11k_hw_tcl2wbm_rbm_map_wcn6750),
 };
 
 static const struct cfg80211_sar_freq_ranges ath11k_hw_sar_freq_ranges_wcn6855[] = {
diff --git a/drivers/net/wireless/ath/ath11k/hw.h b/drivers/net/wireless/ath/ath11k/hw.h
index 52d9f4c13b136..e311c3541eb78 100644
--- a/drivers/net/wireless/ath/ath11k/hw.h
+++ b/drivers/net/wireless/ath/ath11k/hw.h
@@ -134,6 +134,7 @@ struct ath11k_hw_tcl2wbm_rbm_map {
 struct ath11k_hw_hal_params {
 	enum hal_rx_buf_return_buf_manager rx_buf_rbm;
 	const struct ath11k_hw_tcl2wbm_rbm_map *tcl2wbm_rbm_map;
+	size_t map_len;
 };
 
 struct ath11k_hw_params {
@@ -198,7 +199,6 @@ struct ath11k_hw_params {
 	bool supports_regdb;
 	bool fix_l1ss;
 	bool credit_flow;
-	u8 max_tx_ring;
 	const struct ath11k_hw_hal_params *hal_params;
 	bool supports_dynamic_smps_6ghz;
 	bool alloc_cacheable_memory;
@@ -291,6 +291,7 @@ extern const struct ce_ie_addr ath11k_ce_ie_addr_ipq5018;
 
 extern const struct ce_remap ath11k_ce_remap_ipq5018;
 
+extern const struct ath11k_hw_hal_params ath11k_hw_hal_params_ipq5018;
 extern const struct ath11k_hw_hal_params ath11k_hw_hal_params_ipq8074;
 extern const struct ath11k_hw_hal_params ath11k_hw_hal_params_qca6390;
 extern const struct ath11k_hw_hal_params ath11k_hw_hal_params_wcn6750;
diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 3276fe443502f..1c972e7bada8f 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -7392,7 +7392,7 @@ static void ath11k_mac_op_remove_interface(struct ieee80211_hw *hw,
 	idr_for_each(&ar->txmgmt_idr,
 		     ath11k_mac_vif_txmgmt_idr_remove, vif);
 
-	for (i = 0; i < ab->hw_params.max_tx_ring; i++) {
+	for (i = 0; i < ab->hw_params.hal_params->map_len; i++) {
 		spin_lock_bh(&ab->dp.tx_ring[i].tx_idr_lock);
 		idr_for_each(&ab->dp.tx_ring[i].txbuf_idr,
 			     ath11k_mac_vif_unref, vif);
-- 
2.45.1


