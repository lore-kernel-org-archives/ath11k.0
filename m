Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC870606A326
	for <ath11k@archiver.kernel.org>; Sun,  1 Nov 2026 12:59:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wMniWSa0;
	dkim=pass (2048-bit key, unprotected) header.d=disroot.org header.i=@disroot.org header.a=rsa-sha256 header.s=mail header.b=glYxgGNt
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=oezvX4wVlPBCtdLJnzOOZGh58INnyDHTs19NjagDrWQ=; b=wMniWSa0hGc6wr
	3qxpn+PrOXJpewYtKxB0u5nTnxVd11bC9ev7gvtgR5zPn864cI7Ap2XMaj0CoiYfnzo1+7/HmjMNE
	ktQglmsHGz75UsIfTFLjmeNPfS2Di1/7Llgv3GUSMtwPe8+ZczvqOqDAVGUXjmkkXuleYKjpkNmXf
	7iQGAhf6attGIh5rLjOCeVVIsT+3hWVFXc7GRkv/3H6fK0cwUQbvp4C302wA0l2hgI1RHBSRhtobk
	ZUVSMhqMzsCm0L3wcQyYTowdKVu0tYaby+bxmUhGOPrywpStBWByFOAOGsUTywUNMEvabQiljwEsd
	rk1G7eNKW+XgDMdZ/RSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNV9X-0000000EE51-1ki4;
	Sun, 01 Nov 2026 12:59:15 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNV9U-0000000EE2U-0isZ
	for ath11k@lists.infradead.org;
	Sun, 01 Nov 2026 12:59:13 +0000
Received: from mail01.layka.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 63A02808FD;
	Sun, 01 Nov 2026 13:59:10 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Eia_lZS8kHqw; Sun,  1 Nov 2026 13:59:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1793537949; bh=t7EiQOFtNu0anEmbJYBpt9lRDtKGRLmScEKJ2mHier0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=glYxgGNt0kT2RYDcwmZOa8cNQF/V7b4iGsYpIaufSfL3ZkeEqYarT8ybS2SB8djHq
	 1HeN91g408rTgh7iT7iZpjVaAld36L9hWO4oKfe8nDcZ04BPzgBZZE8SI1+rAJ4ooo
	 pGUMD4XKOF0kjM8sS0gzGRTRniXMSZHTsNdpb+FUNSaY7kIel6r5llHZCcchMQ6796
	 ZZRrQA2s6pti/uVBWQd9rl50PuFIL/ivFsKYYzTRa90sfczR+hSgnmm/VosDQP4aR8
	 vsPSfeyeXEvuS/mJgEqqxrqIF3gqBO9w66FyohzjW8WJrbWdTTyz/nCb7T5QzzZbH/
	 ERDye7dwkbj9A==
From: Florian Maurer <fmaurer@disroot.org>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: Florian Maurer <fmaurer@disroot.org>,
	ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Julius Bairaktaris <julius@bairaktaris.de>,
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>,
	Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Subject: [PATCH ath-next 3/3] wifi: ath11k: ahb: stop TX before WCSS is reset on a firmware crash
Date: Sun,  1 Nov 2026 12:58:03 +0000
Message-ID: <1ae20599a69bfb6fac30bcc03e519bad26c78b1d.1793531790.git.fmaurer@disroot.org>
In-Reply-To: <cover.1793531790.git.fmaurer@disroot.org>
References: <cover.1793531790.git.fmaurer@disroot.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261101_045912_495530_6C55B27F 
X-CRM114-Status: GOOD (  25.95  )
X-Spam-Score: -2.1 (--)
X-BeenThere: ath11k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath11k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On IPQ8074 a firmware crash is handled by remoteproc, which stops the
remote processor and thereby resets WCSS. ath11k sets
ATH11K_FLAG_CRASH_FLUSH, which stops the TX paths, only when it handles
the QMI server exit event. That event results from the glink teardown
in rproc_stop() and is handled asynchronously, so it can be processed
after WCSS is already in reset. A TX in that window writes a ring head
pointer to the reset block, which ends in an asynchronous SError:

  remoteproc remoteproc0: stopped remote processor cd00000.q6v5_wcss
  SError Interrupt on CPU3, code 0x00000000bf000002 -- SError
  pc : ath11k_dp_tx+0x45c/0x878 [ath11k]
  Kernel panic - not syncing: Asynchronous SError Interrupt

remoteproc sends a QCOM_SSR_BEFORE_SHUTDOWN notification with crashed
set before it stops the processor. Register for it, like ath10k does on
SNOC, set ATH11K_FLAG_CRASH_FLUSH there and wait with synchronize_rcu()
for TX paths which have not seen the flag yet. ath11k_dp_tx() is called
by mac80211 within RCU read-side critical sections or with BHs
disabled. Check the flag in ath11k_ce_send() again under ce_lock, so
that this also covers WMI and HTC.

This stops new TX descriptors, for data and for everything sent through
CE. Ring pointer updates from the RX and TX completion paths (NAPI, CE
tasklets) are not stopped by this.

A crash during the restart work of an earlier crash, after the QMI
firmware start and before ath11k_core_qmi_firmware_ready() clears
ATH11K_FLAG_CRASH_FLUSH after ath11k_dp_alloc(), is not covered yet:
the flag set by the notifier is cleared again, and CE/HTC sends from
the restart work can still reach the reset WCSS. mac80211 data queues
are still stopped at that point. That window is a few milliseconds and
will be addressed separately.

The SSR subsystem name depends on the remoteproc driver, so add it to
hw_params. Only IPQ8074 sets it for now. qcom_register_ssr_notifier()
must be reachable from ath11k_ahb, so add the same Kconfig dependency
on QCOM_RPROC_COMMON as ath10k SNOC has.

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.9.0.1-02146-QCAHKSWPL_SILICONZ-1

Signed-off-by: Florian Maurer <fmaurer@disroot.org>
---
Depends on 4/5 of [1], which moved clearing ATH11K_FLAG_CRASH_FLUSH
into ath11k_core_qmi_firmware_ready(), and on patch 2 of this series for
the Kconfig dependency. For that reason there is no Fixes tag: without
patch 2 the Kconfig dependency added here is a recursive dependency
error, so this must not be backported on its own.

Hardware-tested on IPQ8074 with [1] backported to backports-6.18.55
(OpenWrt 25.12). The tested version also had a give-up path for a
crash during the restart work, which was never triggered in the tests
and is left out here; the remaining code is the same apart from a
shorter comment. Build-tested on ath-next with [1], including
ATH11K_AHB=y with QCOM_RPROC_COMMON=y.

[1] https://lore.kernel.org/linux-wireless/20261018210153.1925962-1-julius@bairaktaris.de/

 drivers/net/wireless/ath/ath11k/Kconfig |  1 +
 drivers/net/wireless/ath/ath11k/ahb.c   | 59 +++++++++++++++++++++++++
 drivers/net/wireless/ath/ath11k/ahb.h   |  2 +
 drivers/net/wireless/ath/ath11k/ce.c    |  7 +++
 drivers/net/wireless/ath/ath11k/core.c  |  1 +
 drivers/net/wireless/ath/ath11k/hw.h    |  1 +
 6 files changed, 71 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/Kconfig b/drivers/net/wireless/ath/ath11k/Kconfig
index 84b7eb5df253..a425da76934b 100644
--- a/drivers/net/wireless/ath/ath11k/Kconfig
+++ b/drivers/net/wireless/ath/ath11k/Kconfig
@@ -14,6 +14,7 @@ config ATH11K_AHB
 	tristate "Atheros ath11k AHB support"
 	depends on ATH11K
 	depends on REMOTEPROC
+	depends on QCOM_RPROC_COMMON || QCOM_RPROC_COMMON=n
 	depends on RPMSG
 	select QRTR
 	select QRTR_SMD
diff --git a/drivers/net/wireless/ath/ath11k/ahb.c b/drivers/net/wireless/ath/ath11k/ahb.c
index 3ff7d5f27f5e..893a3270394e 100644
--- a/drivers/net/wireless/ath/ath11k/ahb.c
+++ b/drivers/net/wireless/ath/ath11k/ahb.c
@@ -20,6 +20,7 @@
 #include "pcic.h"
 #include <linux/soc/qcom/smem.h>
 #include <linux/soc/qcom/smem_state.h>
+#include <linux/remoteproc/qcom_rproc.h>
 
 static const struct of_device_id ath11k_ahb_of_match[] = {
 	/* TODO: Should we change the compatible string to something similar
@@ -832,6 +833,60 @@ static const struct ath11k_hif_ops ath11k_ahb_hif_ops_wcn6750 = {
 	.ce_irq_disable = ath11k_pci_disable_ce_irqs_except_wake_irq,
 };
 
+static int ath11k_ahb_ssr_notifier(struct notifier_block *nb,
+				   unsigned long action, void *data)
+{
+	struct ath11k_ahb *ab_ahb = container_of(nb, struct ath11k_ahb, ssr_nb);
+	struct ath11k_base *ab = container_of((void *)ab_ahb, struct ath11k_base,
+					      drv_priv);
+	struct qcom_ssr_notify_data *notify = data;
+
+	if (action != QCOM_SSR_BEFORE_SHUTDOWN || !notify->crashed)
+		return NOTIFY_DONE;
+
+	/* WCSS can be reset before the QMI server exit event sets the flag.
+	 * ath11k_dp_tx() runs in RCU read-side sections or with BHs disabled
+	 * and ath11k_ce_send() checks the flag under ce_lock, so after
+	 * synchronize_rcu() no new TX descriptors are queued.
+	 */
+	ath11k_dbg(ab, ATH11K_DBG_AHB, "firmware crashed, stopping tx\n");
+	set_bit(ATH11K_FLAG_CRASH_FLUSH, &ab->dev_flags);
+	synchronize_rcu();
+
+	return NOTIFY_OK;
+}
+
+static void ath11k_ahb_register_ssr_notifier(struct ath11k_base *ab)
+{
+	struct ath11k_ahb *ab_ahb = ath11k_ahb_priv(ab);
+	void *handle;
+
+	if (!ab->hw_params.ssr_name)
+		return;
+
+	ab_ahb->ssr_nb.notifier_call = ath11k_ahb_ssr_notifier;
+	handle = qcom_register_ssr_notifier(ab->hw_params.ssr_name,
+					    &ab_ahb->ssr_nb);
+	if (IS_ERR(handle)) {
+		ath11k_warn(ab, "failed to register ssr notifier: %ld\n",
+			    PTR_ERR(handle));
+		return;
+	}
+
+	ab_ahb->ssr_handle = handle;
+}
+
+static void ath11k_ahb_unregister_ssr_notifier(struct ath11k_base *ab)
+{
+	struct ath11k_ahb *ab_ahb = ath11k_ahb_priv(ab);
+
+	if (!ab_ahb->ssr_handle)
+		return;
+
+	qcom_unregister_ssr_notifier(ab_ahb->ssr_handle, &ab_ahb->ssr_nb);
+	ab_ahb->ssr_handle = NULL;
+}
+
 static int ath11k_core_get_rproc(struct ath11k_base *ab)
 {
 	struct ath11k_ahb *ab_ahb = ath11k_ahb_priv(ab);
@@ -1230,6 +1285,8 @@ static int ath11k_ahb_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_ce_free;
 
+	ath11k_ahb_register_ssr_notifier(ab);
+
 	ret = ath11k_core_init(ab);
 	if (ret) {
 		ath11k_err(ab, "failed to init core: %d\n", ret);
@@ -1247,6 +1304,7 @@ static int ath11k_ahb_probe(struct platform_device *pdev)
 	return 0;
 
 err_ce_free:
+	ath11k_ahb_unregister_ssr_notifier(ab);
 	ath11k_ce_free_pipes(ab);
 
 err_hal_srng_deinit:
@@ -1288,6 +1346,7 @@ static void ath11k_ahb_free_resources(struct ath11k_base *ab)
 {
 	struct platform_device *pdev = ab->pdev;
 
+	ath11k_ahb_unregister_ssr_notifier(ab);
 	ath11k_ahb_free_irq(ab);
 	ath11k_hal_srng_deinit(ab);
 	ath11k_ahb_release_smp2p_handle(ab);
diff --git a/drivers/net/wireless/ath/ath11k/ahb.h b/drivers/net/wireless/ath/ath11k/ahb.h
index 8c1eb1e8e6b1..d7ea47f42edf 100644
--- a/drivers/net/wireless/ath/ath11k/ahb.h
+++ b/drivers/net/wireless/ath/ath11k/ahb.h
@@ -23,6 +23,8 @@ struct ath11k_base;
 
 struct ath11k_ahb {
 	struct rproc *tgt_rproc;
+	struct notifier_block ssr_nb;
+	void *ssr_handle;
 	struct {
 		struct device *dev;
 		struct iommu_domain *iommu_domain;
diff --git a/drivers/net/wireless/ath/ath11k/ce.c b/drivers/net/wireless/ath/ath11k/ce.c
index 1e08b0970b14..895648687d99 100644
--- a/drivers/net/wireless/ath/ath11k/ce.c
+++ b/drivers/net/wireless/ath/ath11k/ce.c
@@ -745,6 +745,12 @@ int ath11k_ce_send(struct ath11k_base *ab, struct sk_buff *skb, u8 pipe_id,
 
 	spin_lock_bh(&ab->ce.ce_lock);
 
+	/* Check again with BHs disabled, see ath11k_ahb_ssr_notifier() */
+	if (test_bit(ATH11K_FLAG_CRASH_FLUSH, &ab->dev_flags)) {
+		ret = -ESHUTDOWN;
+		goto err_ce_unlock;
+	}
+
 	write_index = pipe->src_ring->write_index;
 	nentries_mask = pipe->src_ring->nentries_mask;
 
@@ -791,6 +797,7 @@ int ath11k_ce_send(struct ath11k_base *ab, struct sk_buff *skb, u8 pipe_id,
 err_unlock:
 	spin_unlock_bh(&srng->lock);
 
+err_ce_unlock:
 	spin_unlock_bh(&ab->ce.ce_lock);
 
 	return ret;
diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
index 4666245aee36..7ba05c63ede6 100644
--- a/drivers/net/wireless/ath/ath11k/core.c
+++ b/drivers/net/wireless/ath/ath11k/core.c
@@ -91,6 +91,7 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.coldboot_cal_mm = true,
 		.coldboot_cal_ftm = true,
 		.cbcal_restart_fw = true,
+		.ssr_name = "q6wcss",
 		.fw_mem_mode = 0,
 		.num_vdevs = 16 + 1,
 		.num_peers = 512,
diff --git a/drivers/net/wireless/ath/ath11k/hw.h b/drivers/net/wireless/ath/ath11k/hw.h
index 4996536fbd14..ce52c61d661d 100644
--- a/drivers/net/wireless/ath/ath11k/hw.h
+++ b/drivers/net/wireless/ath/ath11k/hw.h
@@ -191,6 +191,7 @@ struct ath11k_hw_params {
 	bool coldboot_cal_mm;
 	bool coldboot_cal_ftm;
 	bool cbcal_restart_fw;
+	const char *ssr_name;
 	int fw_mem_mode;
 	u32 num_vdevs;
 	u32 num_peers;
-- 
2.47.3


