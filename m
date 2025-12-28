Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63FCFE784BE
	for <ath11k@archiver.kernel.org>; Sun, 28 Dec 2025 15:14:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6DhkrKrnhAYglYBvdgmFTu35O+fBVWrb0itD+SYPa6M=; b=pjN8wnk2UZPI3cvR8Zq4LjQ5mF
	uO/0T2MN7+Je/NchgKMQ0H+WlBI9uZfY400Ia8KqQ3MociYjN4HVMokH943y4CRQvrUQA3b3K5ZKF
	kGGMiby3ow18dguDgMO31RuzvCpW7JpZRothqOEeVDvfrSxsnLZ0QkCwuHDSzPrDc3oNEkz2F+MmE
	bjrQoLjWlm744Noh1vZTkbQ4bhbXhtMwNUEZU7KmdgXOF9gzh5dcCCGxCCsnssLcwqdkCUIxCT7Yl
	bX++zudk0hVFFuFtnMX0F8Bh/riyV/O53jTyAw3l2yeKaqA2OccF4XMcEMM2S6VOvuxJ1+Xm8+gWy
	ewKRSF1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZsTN-00000002pgy-33FN;
	Sun, 28 Dec 2025 15:14:21 +0000
Received: from mail-oa1-x41.google.com ([2001:4860:4864:20::41])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZsTK-00000002pga-1KVl
	for ath11k@lists.infradead.org;
	Sun, 28 Dec 2025 15:14:19 +0000
Received: by mail-oa1-x41.google.com with SMTP id 586e51a60fabf-3fa139e5d90so2944434fac.3
        for <ath11k@lists.infradead.org>; Sun, 28 Dec 2025 07:14:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766934856; x=1767539656; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6DhkrKrnhAYglYBvdgmFTu35O+fBVWrb0itD+SYPa6M=;
        b=SJ7U2Vho8YkgHkUeTipyRYjDmN8gVX5E1sEC5dF3eFfqFzJGM6ZGSSzcKYPbYYesef
         q7IIV07Rmuq5sodF6rO/aPqAfXLIRuKQKcuXyQATEe3jyTz1wpXsLCEkJgA89OIaYlyY
         AjqV4PbKKU8EqL6C8/MKf+4XsuejNg8AKBwOB3j61mrbvh/Caw3Aw47wa1v9RAZDP9wq
         6PZyx1ezUQiyvI524sW+bczGmJO6eqOyVEhEsdCbhuUeb079kZQKwRJezsrmbdDv0aRl
         WLOw8wDJ8irm75qPgETRc9k7SGwLiN3z9btmvjxrzJzefxFXdkIH3r/rVBMZEJlJlSFz
         ss3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766934856; x=1767539656;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6DhkrKrnhAYglYBvdgmFTu35O+fBVWrb0itD+SYPa6M=;
        b=fZm41a25jyWRPSqVZdm6F1hYIzRNp8q8SNxaURg2LMzn/P4RDboODV0D3ceoDzMbIw
         6pDugRaVQnVc03uOFTEvnsA6c+tBE8HDg2JJJC/Y85YVPeIQKsV3e2voO5KlAcHdGurU
         e7FXRLQkmIvfMJd2VudEcVhQ+kMf4AfmhxVw9PBnyjg2nwKRW98YCNj7zhch7gusvphO
         vfJxVcQbmay0BX4J62FvZRkHqxRXdYvmKuOSA8hIsWSe8pEw257ucZnsGs7OuDKCm5s1
         J+VrffXTXeOOfQefN/eOFMABfsLE1oJIkx2b6rLolmcT0GaW1NRnnO058RLPOwMNpILy
         9v6g==
X-Forwarded-Encrypted: i=1; AJvYcCXwP3SYRzaj+j4lXx4Y6gkuK700y4Ncy4cMj+My92+OfC/UgqjgMqs9riOb5wXgjSX2h8EU4v4=@lists.infradead.org
X-Gm-Message-State: AOJu0Yyer6UAb6ohKecei9+3Eg+h22Ix6rSe7MSjTSY8Vg9IAnIKitzZ
	21Tf6dMio6LNLbfTKw4+WJESW9ULdz+APvenM+CzkLixtpNTtMMSpcBx
X-Gm-Gg: AY/fxX43saOhfw1D6uorpAyysHLALQ7GZrtc1xwWnJyQt8uN62AtfzC+z8ZSFUdtvY4
	+p0QAF2PafBPwswXLMj10udeMdBFnMVUDJRynayiBoWXvZOwzb4Htdq+EOfCzxeiGJT7PlEt2tA
	IQWYNPrz3EBt4/SHGF1Ya3XFA2owQT3r/9HZ5x2FKReh4Q7+LxLROACf9y3XS7I0CtjHcn8yaVe
	FFC3exPgaxwoCO4OjM6WR/dFhktdEz/QVKw9LxsriQoYVXPeqqp7RMuuhEOj5IX63ne0lec0exo
	j4diQ5SgtalPfiDzxZaogBz6zR9NOVzl7SToQ0d5QYEf5d0G1Q29hx619dQukS6A6uO8Po3zJgj
	W4sdmveJQPzKku/7aQAiziuIV00ka4Yyhq44KlNtvqHaP89vVk5elKwah5Fy7A4jlmU4SwOeP7M
	fpDYnqCs1z8tP00IU5Sck6YFavs7+dbuN3hmLzXBnx+p4U4YoDRjLGs4v3azzLdEdYuwnKFfHDs
	xF203Z2vUc2j7HcriMPI2vu5VdQ
X-Google-Smtp-Source: AGHT+IECc+U3TVNXp3czTIzSO9Z76x2G0HYELfxJXcOGQhylpsHroDwr7oZCfOdlfaVh0fuMa8pTKA==
X-Received: by 2002:a05:6871:546:b0:3c9:415b:a282 with SMTP id 586e51a60fabf-3fda55f32fbmr13567686fac.1.1766934856314;
        Sun, 28 Dec 2025 07:14:16 -0800 (PST)
Received: from nukework.lan (c-98-57-15-22.hsd1.tx.comcast.net. [98.57.15.22])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-3fdaabbadacsm17461426fac.15.2025.12.28.07.14.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Dec 2025 07:14:14 -0800 (PST)
From: Alexandru Gagniuc <mr.nuke.me@gmail.com>
To: jjohnson@kernel.org,
	ath11k@lists.infradead.org
Cc: baochen.qiang@oss.qualcomm.com,
	Alexandru Gagniuc <mr.nuke.me@gmail.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] wifi: ath11k: move .max_tx_ring to struct ath11k_hw_hal_params
Date: Sun, 28 Dec 2025 09:14:05 -0600
Message-ID: <20251228151408.2116108-1-mr.nuke.me@gmail.com>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251228_071418_428679_03DC55E3 
X-CRM114-Status: GOOD (  23.12  )
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
is initialized in, core.c, a different file than the array. This
spaghetti-like relation is fragile and not obvious. Accidentally
setting ".max_tx_ring" too high leads to a hard to track out-of-
bounds access and memory corruption.

There is a small ambiguity on the meaning of "max_tx_ring":
 - The highest ring, max=3 implies there are 4 rings (0, 1, 2, 3)
 - The highest number to use for array indexing (there are 3 rings)

Clarify this dependency by moving ".max_tx_ring" adjacent to the array
".tcl2wbm_rbm_map", and name it "num_tx_rings". Use ARRAY_SIZE()
instead of #defines to initialize the length field.

The ath11k_hw_hal_params_qca6390 uses fewer num_tx_rings than its map,
so use a constant to express the correct value. Add a static_assert()
to fail compilation if the constant is accidentally set too high.

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

Changes since v2:
 - Use ipq5018 rbm_map for ath11k_hw_hal_params_qca6390
 - Drop unecessarry static_assert

Changes since v1:
 - use "num_tx_rings" name instead of "map_len"
 - make sure debugfs.c is correctly updated
 - add a static_assert for ath11k_hw_hal_params_qca6390 special case
---
 drivers/net/wireless/ath/ath11k/core.c    | 12 +-----------
 drivers/net/wireless/ath/ath11k/debugfs.c |  2 +-
 drivers/net/wireless/ath/ath11k/dp.c      | 12 ++++++------
 drivers/net/wireless/ath/ath11k/dp.h      |  1 -
 drivers/net/wireless/ath/ath11k/dp_tx.c   |  9 +++++----
 drivers/net/wireless/ath/ath11k/hw.c      | 19 ++++++++++++++++++-
 drivers/net/wireless/ath/ath11k/hw.h      |  3 ++-
 drivers/net/wireless/ath/ath11k/mac.c     |  2 +-
 8 files changed, 34 insertions(+), 26 deletions(-)

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
diff --git a/drivers/net/wireless/ath/ath11k/debugfs.c b/drivers/net/wireless/ath/ath11k/debugfs.c
index 977f945b6e669..50f344803e8fd 100644
--- a/drivers/net/wireless/ath/ath11k/debugfs.c
+++ b/drivers/net/wireless/ath/ath11k/debugfs.c
@@ -707,7 +707,7 @@ static ssize_t ath11k_debugfs_dump_soc_dp_stats(struct file *file,
 	len += scnprintf(buf + len, size - len, "\nSOC TX STATS:\n");
 	len += scnprintf(buf + len, size - len, "\nTCL Ring Full Failures:\n");
 
-	for (i = 0; i < ab->hw_params.max_tx_ring; i++)
+	for (i = 0; i < ab->hw_params.hal_params->num_tx_rings; i++)
 		len += scnprintf(buf + len, size - len, "ring%d: %u\n",
 				 i, soc_stats->tx_err.desc_na[i]);
 
diff --git a/drivers/net/wireless/ath/ath11k/dp.c b/drivers/net/wireless/ath/ath11k/dp.c
index 56b1a657e0b0f..c940de285276d 100644
--- a/drivers/net/wireless/ath/ath11k/dp.c
+++ b/drivers/net/wireless/ath/ath11k/dp.c
@@ -344,7 +344,7 @@ void ath11k_dp_stop_shadow_timers(struct ath11k_base *ab)
 	if (!ab->hw_params.supports_shadow_regs)
 		return;
 
-	for (i = 0; i < ab->hw_params.max_tx_ring; i++)
+	for (i = 0; i < ab->hw_params.hal_params->num_tx_rings; i++)
 		ath11k_dp_shadow_stop_timer(ab, &ab->dp.tx_ring_timer[i]);
 
 	ath11k_dp_shadow_stop_timer(ab, &ab->dp.reo_cmd_timer);
@@ -359,7 +359,7 @@ static void ath11k_dp_srng_common_cleanup(struct ath11k_base *ab)
 	ath11k_dp_srng_cleanup(ab, &dp->wbm_desc_rel_ring);
 	ath11k_dp_srng_cleanup(ab, &dp->tcl_cmd_ring);
 	ath11k_dp_srng_cleanup(ab, &dp->tcl_status_ring);
-	for (i = 0; i < ab->hw_params.max_tx_ring; i++) {
+	for (i = 0; i < ab->hw_params.hal_params->num_tx_rings; i++) {
 		ath11k_dp_srng_cleanup(ab, &dp->tx_ring[i].tcl_data_ring);
 		ath11k_dp_srng_cleanup(ab, &dp->tx_ring[i].tcl_comp_ring);
 	}
@@ -400,7 +400,7 @@ static int ath11k_dp_srng_common_setup(struct ath11k_base *ab)
 		goto err;
 	}
 
-	for (i = 0; i < ab->hw_params.max_tx_ring; i++) {
+	for (i = 0; i < ab->hw_params.hal_params->num_tx_rings; i++) {
 		tcl_num = ab->hw_params.hal_params->tcl2wbm_rbm_map[i].tcl_ring_num;
 		wbm_num = ab->hw_params.hal_params->tcl2wbm_rbm_map[i].wbm_ring_num;
 
@@ -782,7 +782,7 @@ int ath11k_dp_service_srng(struct ath11k_base *ab,
 	int i, j;
 	int tot_work_done = 0;
 
-	for (i = 0; i < ab->hw_params.max_tx_ring; i++) {
+	for (i = 0; i < ab->hw_params.hal_params->num_tx_rings; i++) {
 		if (BIT(ab->hw_params.hal_params->tcl2wbm_rbm_map[i].wbm_ring_num) &
 		    ab->hw_params.ring_mask->tx[grp_id])
 			ath11k_dp_tx_completion_handler(ab, i);
@@ -1035,7 +1035,7 @@ void ath11k_dp_free(struct ath11k_base *ab)
 
 	ath11k_dp_reo_cmd_list_cleanup(ab);
 
-	for (i = 0; i < ab->hw_params.max_tx_ring; i++) {
+	for (i = 0; i < ab->hw_params.hal_params->num_tx_rings; i++) {
 		spin_lock_bh(&dp->tx_ring[i].tx_idr_lock);
 		idr_for_each(&dp->tx_ring[i].txbuf_idr,
 			     ath11k_dp_tx_pending_cleanup, ab);
@@ -1086,7 +1086,7 @@ int ath11k_dp_alloc(struct ath11k_base *ab)
 
 	size = sizeof(struct hal_wbm_release_ring) * DP_TX_COMP_RING_SIZE;
 
-	for (i = 0; i < ab->hw_params.max_tx_ring; i++) {
+	for (i = 0; i < ab->hw_params.hal_params->num_tx_rings; i++) {
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
index 562aba66582f3..86e1e6c27b36c 100644
--- a/drivers/net/wireless/ath/ath11k/dp_tx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_tx.c
@@ -91,6 +91,7 @@ int ath11k_dp_tx(struct ath11k *ar, struct ath11k_vif *arvif,
 	struct hal_srng *tcl_ring;
 	struct ieee80211_hdr *hdr = (void *)skb->data;
 	struct dp_tx_ring *tx_ring;
+	size_t num_tx_rings = ab->hw_params.hal_params->num_tx_rings;
 	void *hal_tcl_desc;
 	u8 pool_id;
 	u8 hal_ring_id;
@@ -113,7 +114,7 @@ int ath11k_dp_tx(struct ath11k *ar, struct ath11k_vif *arvif,
 tcl_ring_sel:
 	tcl_ring_retry = false;
 
-	ti.ring_id = ring_selector % ab->hw_params.max_tx_ring;
+	ti.ring_id = ring_selector % num_tx_rings;
 	ti.rbm_id = ab->hw_params.hal_params->tcl2wbm_rbm_map[ti.ring_id].rbm_id;
 
 	ring_map |= BIT(ti.ring_id);
@@ -126,7 +127,7 @@ int ath11k_dp_tx(struct ath11k *ar, struct ath11k_vif *arvif,
 	spin_unlock_bh(&tx_ring->tx_idr_lock);
 
 	if (unlikely(ret < 0)) {
-		if (ring_map == (BIT(ab->hw_params.max_tx_ring) - 1) ||
+		if (ring_map == (BIT(num_tx_rings) - 1) ||
 		    !ab->hw_params.tcl_ring_retry) {
 			atomic_inc(&ab->soc_stats.tx_err.misc_fail);
 			return -ENOSPC;
@@ -244,8 +245,8 @@ int ath11k_dp_tx(struct ath11k *ar, struct ath11k_vif *arvif,
 		 * checking this ring earlier for each pkt tx.
 		 * Restart ring selection if some rings are not checked yet.
 		 */
-		if (unlikely(ring_map != (BIT(ab->hw_params.max_tx_ring)) - 1) &&
-		    ab->hw_params.tcl_ring_retry && ab->hw_params.max_tx_ring > 1) {
+		if (unlikely(ring_map != (BIT(num_tx_rings)) - 1) &&
+		    ab->hw_params.tcl_ring_retry && num_tx_rings > 1) {
 			tcl_ring_retry = true;
 			ring_selector++;
 		}
diff --git a/drivers/net/wireless/ath/ath11k/hw.c b/drivers/net/wireless/ath/ath11k/hw.c
index caa6dc12a790b..d19c4b372a2aa 100644
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
+	.num_tx_rings = ARRAY_SIZE(ath11k_hw_tcl2wbm_rbm_map_ipq5018),
+};
+
 const struct ath11k_hw_hal_params ath11k_hw_hal_params_ipq8074 = {
 	.rx_buf_rbm = HAL_RX_BUF_RBM_SW3_BM,
 	.tcl2wbm_rbm_map = ath11k_hw_tcl2wbm_rbm_map_ipq8074,
+	.num_tx_rings = ARRAY_SIZE(ath11k_hw_tcl2wbm_rbm_map_ipq8074),
 };
 
 const struct ath11k_hw_hal_params ath11k_hw_hal_params_qca6390 = {
 	.rx_buf_rbm = HAL_RX_BUF_RBM_SW1_BM,
-	.tcl2wbm_rbm_map = ath11k_hw_tcl2wbm_rbm_map_ipq8074,
+	.tcl2wbm_rbm_map = ath11k_hw_tcl2wbm_rbm_map_ipq5018,
+	.num_tx_rings = ARRAY_SIZE(ath11k_hw_tcl2wbm_rbm_map_ipq5018),
 };
 
 const struct ath11k_hw_hal_params ath11k_hw_hal_params_wcn6750 = {
 	.rx_buf_rbm = HAL_RX_BUF_RBM_SW1_BM,
 	.tcl2wbm_rbm_map = ath11k_hw_tcl2wbm_rbm_map_wcn6750,
+	.num_tx_rings = ARRAY_SIZE(ath11k_hw_tcl2wbm_rbm_map_wcn6750),
 };
 
 static const struct cfg80211_sar_freq_ranges ath11k_hw_sar_freq_ranges_wcn6855[] = {
diff --git a/drivers/net/wireless/ath/ath11k/hw.h b/drivers/net/wireless/ath/ath11k/hw.h
index 52d9f4c13b136..9db984ac4321c 100644
--- a/drivers/net/wireless/ath/ath11k/hw.h
+++ b/drivers/net/wireless/ath/ath11k/hw.h
@@ -134,6 +134,7 @@ struct ath11k_hw_tcl2wbm_rbm_map {
 struct ath11k_hw_hal_params {
 	enum hal_rx_buf_return_buf_manager rx_buf_rbm;
 	const struct ath11k_hw_tcl2wbm_rbm_map *tcl2wbm_rbm_map;
+	size_t num_tx_rings;
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
index 3276fe443502f..33ebe03380114 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -7392,7 +7392,7 @@ static void ath11k_mac_op_remove_interface(struct ieee80211_hw *hw,
 	idr_for_each(&ar->txmgmt_idr,
 		     ath11k_mac_vif_txmgmt_idr_remove, vif);
 
-	for (i = 0; i < ab->hw_params.max_tx_ring; i++) {
+	for (i = 0; i < ab->hw_params.hal_params->num_tx_rings; i++) {
 		spin_lock_bh(&ab->dp.tx_ring[i].tx_idr_lock);
 		idr_for_each(&ab->dp.tx_ring[i].txbuf_idr,
 			     ath11k_mac_vif_unref, vif);
-- 
2.45.1


