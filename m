Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2647D606A6B7
	for <ath11k@archiver.kernel.org>; Sat, 21 Nov 2026 23:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=F8SEuPEa;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=krzsU0f2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=tpQhoYWqRN3wyjl4/Pm/giPsZJPxZ0KHVMsW8Smmq8A=; b=F8SEuPEaud6QVV
	8uv5CO6fTMFoDuonuR7mYlysQ1VUwylwrEhB6VDDb5bg2yZ5rPNtQ4m0sQ2vZw/YvX8Cg8v0cxlSw
	ZdnpB+IdGYGOGvt35Tks1pWekNjvU/+it/v98FWRSWoyy8iJA9UZqQ7RllIrqTTLb4G/chcCj2g4u
	ilRYiZdpxJi3gr4U2y+FQLm/R8VQIsw1k8JKpEnl4/7UtVJKH3/w6oUnnLlSgsKkN4WlYAL10FR2g
	e61ijr+ieEQY7YJOW2c7D88wIPV/piCohyLdyVmZ1H9GJCYEgQzcmEbnQ9ObZIH54HhzJ/hlkp9tC
	7Ka7UHqLG5yPcBqm1pNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUuBU-00000000SDQ-3GMY;
	Sat, 21 Nov 2026 23:07:52 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUuBR-00000000S7D-46ME
	for ath11k@lists.infradead.org;
	Sat, 21 Nov 2026 23:07:51 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-c515319dd89so205415066b.1
        for <ath11k@lists.infradead.org>; Sat, 21 Nov 2026 15:07:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795302468; x=1795907268; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tpQhoYWqRN3wyjl4/Pm/giPsZJPxZ0KHVMsW8Smmq8A=;
        b=krzsU0f2DWf4y4ywYALYZUIwc/pwFgUINB81tTZMAF+wCPNi1wJ5Pm/2vG34NVaxUn
         L3xKRUZ3UBuU4swRE4asIRqNf1l2hu9mQmUktAK/NgoKsiAyFd/eUb/J8Cld139EgG6t
         zdGnOhv+ti9oNJPGZqB5fB0OZmsCfSuVxkRWFGlfpu08IWjTGe9aBe5YUJhRoe9h7Asa
         LKQKOJ2Jh8TQlDTNmoOYw0dJEShopmJbmGCJnD/xRar+7jVaLVfShRsnQyHCAwABt9ed
         2hT66XFDv4CGO/ST5xG+B0eYKcIsSYphz1qJYcvbO4F5vmh/8lH4JipiHk/Vtu1ekm4n
         8dYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795302468; x=1795907268;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tpQhoYWqRN3wyjl4/Pm/giPsZJPxZ0KHVMsW8Smmq8A=;
        b=xkF1a1+GkxbN7vbLmd5VXGHwFtL589ezgp3zLMjmUqiZMyzF4dkPdq0hyDhmlIVzbY
         /lUmtVY3iaLvtdl5UmIULk4WvrV4LbI9+VIfR0iWtvc9TDYbVrTCYV1oNAXUHVPEcYRP
         haUsCGCbZhZFnMiDKuXf8KS/V59S9nzWmHd9bfKfyKGNIxksfWVzSpk3i5m2bPmoIv8Z
         bOu8k1YuzkNawcq0S0KiZqnenPvetHbXsCWFdlk/SSKKQpGKfs4O/2zBc18F3QseLCZY
         V4T4rSnCYjvgFmd55NUPz8ct3n6WxmYrwJM663JaolB6TmDUYf29gokCIEOcBr1yMaWR
         ebOw==
X-Gm-Message-State: APuU4Z8M3g77do7tqX2xBcRtuIDIRsMGNyt6/XRP2S8SPn1w+iCBvFWU
	dSwpheHqOVoUo38xFeECH89imYFHN7a3VuhTBIx0G4OugVjx3X0slug6Uyx22aqJmw==
X-Gm-Gg: AZFdTZdYbjBybsEtwKfSr4cNxxyw1NYxeSKwpXk2Zv4FA+C3NTTa+E6I9MWc/+Wdeit
	Is0R4baDtrFjztCz55j84ejprJkHNwXT1GcosBQgmf5LQsjJYi3pGJbCECeM+wuY2Tqpb3r2hkQ
	20ahy5BxPBpPCGWUIvMxdjKaBAyZ6VjZvf6dOFDG9uiI2rt7lsuIhLCmDr3R31z51punUxdnqGD
	QD4hC8kLDTd+3x2R1NO6dgrbOfF1Zg6FN9nFzd4/npNvlvRBzIcFEuMKHTFiue6QiJ9BQT2izHT
	wf+A0RmLdaSMC2yuyNEmUQ9loqn7IdOjmeNNGOKe9EqQQx94zWnz/kokDXVN8XTCvioOeO5Db3W
	/BDCkVe4vI1PW+AFDFfbKln0p8QY0dVL8TPgcofqAV9DrAaj1NGHQy+proY0n26PZn4BqQIvylF
	Q34jWIVTozR6jBiHsb/9bO45NPb6jmT2fkdvpNjJtkTZDCWLRujZv/g1Gzs7IKigo0KLG7GEBbt
	4xCiGxSYoARVKk+ZdG713kfUMAss52rJkVtZ+EoTtRiBVJTseQcWUdfcqaCHc8fORHe7r7lmNUZ
	DQ1FYNM5VB+bwB5KrWVu802kQknjOeMNm6VmTYfCWmq6+3VAV3mcxAcRG+Cii1rk1KWh9kipLkT
	PRGXQKhMrbLFi5o0MLMZpJW5VCc7clNhl59q3uUBPpCdLDcr11Fpwhv8xclGwKApX/p2f5Tcgl/
	waIK4zZy5/s+Rq53VgxQPix1jrpw0dYS7eXqTttJokxm2BLSd6Dd4p+7CJeQtLYk7rE09PqUfAL
	itmDKoYtFMwipjHeFIdfir2Gwm1pKWDhn/Zel7+n3nkVrjW7Prs6Gcr1r84yjftPOSKFAURLeHN
	R1F549ByuTpq8l0YLzU+7cCmlKE6B2MLjqU7TDj6K4HswlOwFvgxz8/9Hiv+h1kYO+8qPMiRkTE
	=
X-Received: by 2002:a17:906:f8d2:b0:c50:bf14:8eb1 with SMTP id a640c23a62f3a-c513a84d84emr489568866b.14.1795302468046;
        Sat, 21 Nov 2026 15:07:48 -0800 (PST)
Received: from Desktop.tail070c67.ts.net (p200300f2470edf0034412c7e8f5a5e7a.dip0.t-ipconnect.de. [2003:f2:470e:df00:3441:2c7e:8f5a:5e7a])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afc1b40sm242721466b.54.2026.11.21.15.07.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 15:07:46 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Florian Maurer <fmaurer@disroot.org>,
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
	Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>,
	P Praneesh <praneesh.p@oss.qualcomm.com>,
	Kalle Valo <kvalo@kernel.org>,
	Muhammad Usama Anjum <usama.anjum@arm.com>,
	John Crispin <john@phrozen.org>,
	Sriram R <sriram.ramachandran@oss.qualcomm.com>,
	Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>,
	Karthikeyan Periyasamy <karthikeyan.periyasamy@oss.qualcomm.com>,
	Rosen Penev <rosenp@gmail.com>,
	Jiale Yao <yaojiale02@163.com>,
	Julia Lawall <julia.lawall@lip6.fr>,
	Anilkumar Kolli <quic_akolli@quicinc.com>,
	Manikanta Pubbisetty <quic_mpubbise@quicinc.com>,
	Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>,
	Sathishkumar Muruganandam <quic_murugana@quicinc.com>,
	Muna Sinada <quic_msinada@quicinc.com>
Subject: [PATCH ath-next v3 08/13] wifi: ath11k: ahb: stop TX before WCSS is reset on a firmware crash
Date: Sun, 22 Nov 2026 00:07:26 +0100
Message-ID: <20261121230731.1206043-9-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261121230731.1206043-1-julius@bairaktaris.de>
References: <20261121230731.1206043-1-julius@bairaktaris.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261121_150750_111707_93E9C680 
X-CRM114-Status: GOOD (  22.94  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Florian Maurer <fmaurer@disroot.org>

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
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
v3: new in this series, from Florian Maurer's series [1], unchanged.
[1] https://lore.kernel.org/r/cover.1793531790.git.fmaurer@disroot.org

 drivers/net/wireless/ath/ath11k/Kconfig |  1 +
 drivers/net/wireless/ath/ath11k/ahb.c   | 59 +++++++++++++++++++++++++
 drivers/net/wireless/ath/ath11k/ahb.h   |  2 +
 drivers/net/wireless/ath/ath11k/ce.c    |  7 +++
 drivers/net/wireless/ath/ath11k/core.c  |  1 +
 drivers/net/wireless/ath/ath11k/hw.h    |  1 +
 6 files changed, 71 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/Kconfig b/drivers/net/wireless/ath/ath11k/Kconfig
index 2b608d4ed263..7dcc2c3543eb 100644
--- a/drivers/net/wireless/ath/ath11k/Kconfig
+++ b/drivers/net/wireless/ath/ath11k/Kconfig
@@ -13,6 +13,7 @@ config ATH11K_AHB
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
index af08a2a24c6d..08fd0ab353e4 100644
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
index e8d245f1023a..d4845a1300d9 100644
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
2.53.0


