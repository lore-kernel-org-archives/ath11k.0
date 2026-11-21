Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C536606A687
	for <ath11k@archiver.kernel.org>; Sat, 21 Nov 2026 23:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2DrdpocJ;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=wHvL350/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=N10Pu+rjXEwRh6rFEvXB74UrxCEUGq3zOsw8RXTnZyU=; b=2DrdpocJkUlkXJ
	kzmIgEJAfO4TGYZts2eDFo2TWUzQsQIEgG7M3HqRcAIoCLwEXzPf4H/X+nrdoU3doMm7bH9oX3nA0
	OHZiGccnbY0uEqSOz/ixuL0kD2S7OM52ZQzOeaVdUEsNirTyHinRne4yiLxDwbhNhpQvl2cCDFNU8
	LU0PyGWvYNklVTjoFk9n1ixP96F20sQ6YuzldT2hllwC13cirPv1/DuTVDmTRyHnvv42thWDFIfoo
	WRLpCW1C/1rtWcDNxubnzUpI5vQzFzJ2MM8I/3Zxiv56WPBJ/DO5uJxrUoAKWLQb/t2gSn1+kNMx7
	FnQsoEhRx0zTT9g1CdVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUuBy-00000000SgZ-0OOF;
	Sat, 21 Nov 2026 23:08:22 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUuBZ-00000000SFH-0Adk
	for ath11k@lists.infradead.org;
	Sat, 21 Nov 2026 23:08:20 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-6b8627e0eb2so2689869a12.2
        for <ath11k@lists.infradead.org>; Sat, 21 Nov 2026 15:07:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795302475; x=1795907275; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N10Pu+rjXEwRh6rFEvXB74UrxCEUGq3zOsw8RXTnZyU=;
        b=wHvL350/X8EvpwgRRnHJ6byrh+2cwGWYNHqFcHyJyhcipYO0ICeeqP79cD8TE1QF50
         jOZomQzdOCAIsA3dmmM59tyxMXeIa01hJKcLJsIM1M6/l2bgIcsDVNUFXwjsyxdjiNfk
         +PH87z05lumbQPeOhYA+FP0UjcLNN99cDfp5SN4/PsiKq7AYbr0PwpRIGAu3Ybv3d1As
         hNqUgttCtqbIR3RwnbJW2/GDJXvO6UuyqjzDtO1YmtI2BPYkWCoIq7YzOn1vNqs+FUGJ
         OjEObSGlSFc8Shh4qLUN3hFODqqzL6MuWtemcwyH+W/gSem2WCg62FgDHVfkrKonDebU
         Xxag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795302475; x=1795907275;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=N10Pu+rjXEwRh6rFEvXB74UrxCEUGq3zOsw8RXTnZyU=;
        b=in+tH0yhdX0MTlxVqJ3gt4OshuAYC+txjOjCFXHqIaq28+84qb6Ht74oZkwWQejbZK
         5kN9zn3nMidyLTp5k+iaL+d+Ew/e6YVIfV5ZLEwEmx9YA3ba9zQ2LAf/OQ3jdfBlmXb9
         /moxdJg+1aguerNAKUqBEziVTLbKwXVJx3vagS08bp3Mbp2vtU56p6bzIbq/SScgK1Mh
         7UZ9ykPe842u7QJXSqwlJ6YkL9YlDtt/y2hO4Y7Iu0v2gMtZ8zV6FCaqamb/o7i1Yvs3
         1II1h+0NGAgHYgh65N2i2RqmgzSxjagcA1MexzdfD+mqIyEQrh0JhRM2gmB5zlhuB3yJ
         a0Sw==
X-Gm-Message-State: APuU4Z/3GJokR1aWRD4eyyak+9NvWWTpRTzdsACMhE31brgueFp/VMtP
	/+8M319qsP6bvX/E/LEkes3OuLrP1Qr3PqaGhqVTm2OqneQI4kkYqUDE+V+t1MkFMA==
X-Gm-Gg: AZFdTZcdn8GXt+yxgn1cKMXfpFAvYWeHR5Y6xw2coa6ABG1Ju40qe2Pk6lFiEVmp/b7
	k6Ry725cZCBqexcfIfmv0saSET1pcR4/kG7Yvcr8taGnTKqsxGXFkrnYhbRE6npVj5SAwo+AHg1
	7GiETaMZxw/RHSR+qzakQnJnYPP5snmvjS1yCoVwjDBwADtm0bBkght15yEEQspuK8FG35IPI4z
	oSUgeH8NcI3OnMYIJBy5QrINxCgZaMjpeeyHHdMgzhLNf/vksYKxTesWAI+9cKG5ttkaxvuIABx
	5OHQLdypQsPAmbT8i5GdJNeKCdUrFFCN+eHDcQ08HwGBzRUdP0vIk+7M5/aAAOfdQPcnIgyO0Xj
	tos0YEIN8rhidSQ+k792y2gxpzMuE9zjim5FMqKgx8nGeO0vylAZzqFFznuYvQ0M8qgmxA4yGYY
	EovRk34PnYhcsHbP2P6xfXQKkZjlXK5oWBzLcX0saI55pAr+Z3gYvxn5gDG0u1QhCl+HxqMZ5wd
	wPXHzWWrPiJtsSAforHUiZ91QkgX0id83nx0ScqyxPxMvMM2jLbwqXuG7Sev2Yjsfs9EEkwjIUm
	/7qijOjS6e+rKt+3ASY2LFGj2IJH1Oh2UtjFRFFLYW5TxffSE4nfOJg+OCGHnpZQJJOtxIwnNba
	+1YyR7Rk6ThVcDn8C6SNf15G3ctpc3OQBGPd4MTUedWTktX1BsrISK4p/YpFCxYeDIGo1B4JVPX
	tQJL584ywFig91EIaG4LZcRW+cJcHzLyrKN+DfQKvfGoHiutFY+mKvE1N85mqdeLUR72/1CnaFx
	oauZIg3a9ZqzaiZMHxQ+icsndkJQqI3tCiPMAz5vfH+vEXHdKU9qOqV2wsAR3+ijLjkZz7oAd9k
	dUnyjLokUoWDUoBGgJnMCtP5a0Rz7RtP2QysVcRpByx4fLVDzfP1qLCBvYw5mz4c3jCUGl31yS8
	=
X-Received: by 2002:a17:907:c08:b0:c46:88ef:2e46 with SMTP id a640c23a62f3a-c513a433bf6mr703179366b.1.1795302474845;
        Sat, 21 Nov 2026 15:07:54 -0800 (PST)
Received: from Desktop.tail070c67.ts.net (p200300f2470edf0034412c7e8f5a5e7a.dip0.t-ipconnect.de. [2003:f2:470e:df00:3441:2c7e:8f5a:5e7a])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afc1b40sm242721466b.54.2026.11.21.15.07.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 15:07:54 -0800 (PST)
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
Subject: [PATCH ath-next v3 12/13] wifi: ath11k: stop the restart work before WCSS goes down
Date: Sun, 22 Nov 2026 00:07:30 +0100
Message-ID: <20261121230731.1206043-13-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261121230731.1206043-1-julius@bairaktaris.de>
References: <20261121230731.1206043-1-julius@bairaktaris.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261121_150758_010422_18870908 
X-CRM114-Status: GOOD (  37.21  )
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

When the firmware crashes again while the restart work of the previous
crash sets up the rings, remoteproc takes WCSS down while that work still
writes ring registers, which ends in an asynchronous SError:

  remoteproc remoteproc0: crash detected in q6wcss: type fatal error
  remoteproc remoteproc0: recovering q6wcss
  SError Interrupt on CPU3, code 0x00000000bf000002 -- SError
  Workqueue: ath11k_wq ath11k_core_restart [ath11k]
  pc : ath11k_dp_link_desc_setup+0x2f4/0x3c8 [ath11k]
  Kernel panic - not syncing: Asynchronous SError Interrupt
  Call trace:
   ath11k_dp_link_desc_setup+0x2f4/0x3c8 [ath11k] (P)
   ath11k_dp_alloc+0x9c/0x600 [ath11k]
   ath11k_core_qmi_firmware_ready+0xb0/0x5fc [ath11k]
   ath11k_core_restart+0xf4/0x180 [ath11k]

The previous patch stops new TX in the QCOM_SSR_BEFORE_SHUTDOWN
notification, but nothing stops the restart work. It keeps waiting for
the firmware that went down, up to 10 seconds for a QMI response and 5
seconds for the WMI service ready event, and when it gives up, its error
path writes the copy engine registers and sends the QMI mode OFF request
again, by then possibly to the next firmware instance before that has
been started. The restart work of the new crash only runs after it, as
both are the same work item. NAPI, the CE tasklets and the
rx_replenish_retry timer also keep updating ring pointers.

End all use of the firmware in the notification, before remoteproc stops
WCSS. ath11k_core_firmware_going_down() sets ATH11K_FLAG_FW_DOWN and ends
the waits of the start sequence: the QMI transactions waiting for a
response, the HTC control response, the WMI service ready and unified
ready events and the HTT version response, which are waited for with
ath11k_core_wait_for_fw() now, and the WMI send loops, which test the flag
on every try. While it is set, ath11k_qmi_firmware_start() and
ath11k_qmi_firmware_stop() return at once and every QMI request gets
-ESHUTDOWN instead of waiting for a response. It then flushes the QMI
event work and cancels the restart work, so a running restart unwinds
while WCSS is still accessible and a queued one does not run. The
completions can now be completed at any time, so initialise them once per
device.

From then on the QMI event work handles only server exits. The QMI
client cannot tell a server arrival of the firmware that goes down from
one of the next firmware: the GLINK edge is still up during the
notification, and a NEW_SERVER of the old firmware can still be on its
way to the client. Only the QRTR name server orders them: the GLINK stop
unregisters the QRTR endpoint, which queues a BYE for the node to the
name server, and the name server removes the node's servers when it
handles the BYE, in the order of its socket. remoteproc sends
QCOM_SSR_AFTER_SHUTDOWN after that. There, start a new QMI client with a
new lookup, which reaches the name server after the BYE, then release
the old client, which reports the exit of a server it knew. Two clients
are used in turn, so that the old one is released only once the new one
exists. Events carry the number of the client that posted them. A server
exit is handled from any client: it sets CRASH_FLUSH and RECOVERY and
runs ath11k_core_pre_reconfigure_recovery(), which stop the host's use
of the firmware that is gone and wake its waiters without sending it
anything. Every other event is handled only from the current client, and
only its server arrival clears ATH11K_FLAG_FW_DOWN. Its FW_INIT_DONE
then queues the next restart work. The old client is never used for the
next firmware, as an arrival of the firmware that went down can still
reach it: the new client becomes current only once its lookup is sent,
so if it cannot be set up, events other than a server exit stay dropped
and ATH11K_FLAG_FW_DOWN stays set until a later shutdown notification
sets one up.

The notification can come before ath11k_qmi_init_service() and after
ath11k_qmi_deinit_service(), so the QMI locks, lists and event work are
now initialised in ath11k_core_alloc(), and the client is set up, torn
down and restarted under one lock. Without a client there is nothing to
restart, and a client set up later sends its lookup after the
notification.

The AHB notifier then disables the ext IRQs with NAPI and the CE IRQ
lines, kills the CE tasklets and deletes the replenish timer, and only
then sets ATH11K_FLAG_CRASH_FLUSH, which the restart work clears once the
rings are set up. The CE IRQ lines are now requested disabled and
ath11k_ahb_start() enables them, so that the notification also finds
them in a known state before the first start. This is done on every
shutdown, crashed or not, as WCSS goes down either way.

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.12-01460-QCAHKSWPL_SILICONZ-1

Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
v3: new.

 drivers/net/wireless/ath/ath11k/ahb.c   |  71 ++++-
 drivers/net/wireless/ath/ath11k/ahb.h   |   2 +
 drivers/net/wireless/ath/ath11k/core.c  |  75 +++++
 drivers/net/wireless/ath/ath11k/core.h  |   4 +
 drivers/net/wireless/ath/ath11k/dp_tx.c |  11 +-
 drivers/net/wireless/ath/ath11k/htc.c   |  22 +-
 drivers/net/wireless/ath/ath11k/qmi.c   | 380 ++++++++++++++++++++----
 drivers/net/wireless/ath/ath11k/qmi.h   |  38 ++-
 drivers/net/wireless/ath/ath11k/wmi.c   |  32 +-
 9 files changed, 535 insertions(+), 100 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/ahb.c b/drivers/net/wireless/ath/ath11k/ahb.c
index 736fd368f8c6..7fcf12a1e007 100644
--- a/drivers/net/wireless/ath/ath11k/ahb.c
+++ b/drivers/net/wireless/ath/ath11k/ahb.c
@@ -363,9 +363,32 @@ static void ath11k_ahb_ce_irqs_disable(struct ath11k_base *ab)
 	}
 }
 
+static void ath11k_ahb_ce_irq_lines(struct ath11k_base *ab, bool enable)
+{
+	struct ath11k_ahb *ab_ahb = ath11k_ahb_priv(ab);
+	int i, irq;
+
+	if (ab_ahb->ce_irqs_masked == !enable)
+		return;
+
+	for (i = 0; i < ab->hw_params.ce_count; i++) {
+		if (ath11k_ce_get_attr_flags(ab, i) & CE_ATTR_DIS_INTR)
+			continue;
+
+		irq = ab->irq_num[ATH11K_IRQ_CE0_OFFSET + i];
+		if (enable)
+			enable_irq(irq);
+		else
+			disable_irq(irq);
+	}
+
+	ab_ahb->ce_irqs_masked = !enable;
+}
+
 static int ath11k_ahb_start(struct ath11k_base *ab)
 {
 	ath11k_ahb_ce_irqs_enable(ab);
+	ath11k_ahb_ce_irq_lines(ab, true);
 	ath11k_ce_rx_post_buf(ab);
 
 	return 0;
@@ -656,8 +679,8 @@ static int ath11k_ahb_config_irq(struct ath11k_base *ab)
 		tasklet_setup(&ce_pipe->intr_tq, ath11k_ahb_ce_tasklet);
 		irq = platform_get_irq_byname(ab->pdev, irq_name[irq_idx]);
 		ret = request_irq(irq, ath11k_ahb_ce_interrupt_handler,
-				  IRQF_TRIGGER_RISING, irq_name[irq_idx],
-				  ce_pipe);
+				  IRQF_TRIGGER_RISING | IRQF_NO_AUTOEN,
+				  irq_name[irq_idx], ce_pipe);
 		if (ret) {
 			ath11k_err(ab, "failed request_irq for %d\n", irq);
 			ath11k_ahb_free_ce_irqs(ab, i);
@@ -841,15 +864,45 @@ static int ath11k_ahb_ssr_notifier(struct notifier_block *nb,
 					      drv_priv);
 	struct qcom_ssr_notify_data *notify = data;
 
-	if (action != QCOM_SSR_BEFORE_SHUTDOWN || !notify->crashed)
+	switch (action) {
+	case QCOM_SSR_BEFORE_SHUTDOWN:
+		break;
+	case QCOM_SSR_AFTER_SHUTDOWN:
+		/* The GLINK edge, and the QRTR node behind it, is gone now */
+		ath11k_qmi_firmware_went_down(ab);
+		return NOTIFY_OK;
+	default:
 		return NOTIFY_DONE;
+	}
+
+	/*
+	 * remoteproc takes WCSS down once this returns, crashed or not, and a
+	 * register access after that ends in an asynchronous SError. WCSS is
+	 * still accessible here: stop every user of it before returning.
+	 */
+	ath11k_dbg(ab, ATH11K_DBG_AHB, "firmware going down, crashed %d\n",
+		   notify->crashed);
+	ath11k_core_firmware_going_down(ab);
+
+	/*
+	 * The restart work is gone, so nothing enables the interrupts again
+	 * until the restart work of the next firmware calls
+	 * ath11k_ahb_start() and ath11k_hif_irq_enable(). disable_irq() keeps
+	 * a CE interrupt that is still pending from calling the handler.
+	 */
+	mutex_lock(&ab->core_lock);
+	ath11k_ahb_ext_irq_disable(ab);
+	ath11k_ahb_ce_irq_lines(ab, false);
+	ath11k_ahb_kill_tasklets(ab);
+	timer_delete_sync(&ab->rx_replenish_retry);
+	mutex_unlock(&ab->core_lock);
 
-	/* WCSS can be reset before the QMI server exit event sets the flag.
-	 * ath11k_dp_tx() runs in RCU read-side sections or with BHs disabled
-	 * and ath11k_ce_send() checks the flag under ce_lock, so after
-	 * synchronize_rcu() no new TX descriptors are queued.
+	/*
+	 * ath11k_dp_tx() runs in RCU read-side sections or with BHs disabled,
+	 * REO commands are sent with BHs disabled and ath11k_ce_send() checks
+	 * the flag under ce_lock, so after synchronize_rcu() nothing is queued
+	 * to the rings. Set it only now, as the restart work clears it.
 	 */
-	ath11k_dbg(ab, ATH11K_DBG_AHB, "firmware crashed, stopping tx\n");
 	set_bit(ATH11K_FLAG_CRASH_FLUSH, &ab->dev_flags);
 	synchronize_rcu();
 
@@ -1291,6 +1344,8 @@ static int ath11k_ahb_probe(struct platform_device *pdev)
 		goto err_ce_free;
 	}
 
+	/* requested with IRQF_NO_AUTOEN, enabled in ath11k_ahb_start() */
+	ath11k_ahb_priv(ab)->ce_irqs_masked = true;
 	ath11k_ahb_register_ssr_notifier(ab);
 
 	ret = ath11k_core_init(ab);
diff --git a/drivers/net/wireless/ath/ath11k/ahb.h b/drivers/net/wireless/ath/ath11k/ahb.h
index d7ea47f42edf..4dee29f0c562 100644
--- a/drivers/net/wireless/ath/ath11k/ahb.h
+++ b/drivers/net/wireless/ath/ath11k/ahb.h
@@ -25,6 +25,8 @@ struct ath11k_ahb {
 	struct rproc *tgt_rproc;
 	struct notifier_block ssr_nb;
 	void *ssr_handle;
+	/* CE IRQ lines disabled by ath11k_ahb_ssr_notifier() */
+	bool ce_irqs_masked;
 	struct {
 		struct device *dev;
 		struct iommu_domain *iommu_domain;
diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
index d4845a1300d9..0795ba7e038c 100644
--- a/drivers/net/wireless/ath/ath11k/core.c
+++ b/drivers/net/wireless/ath/ath11k/core.c
@@ -2471,6 +2471,76 @@ void ath11k_core_pre_reconfigure_recovery(struct ath11k_base *ab)
 	reinit_completion(&ab->driver_recovery);
 }
 
+/**
+ * ath11k_core_wait_for_fw() - wait for an event of the firmware start sequence
+ * @ab: device
+ * @done: completion of the event, reinitialised by the caller before the
+ *	request that triggers the event is sent
+ * @timeout: timeout in jiffies
+ *
+ * Return: the remaining jiffies, 0 on timeout, or -ESHUTDOWN when the firmware
+ * is going down, see ath11k_core_firmware_going_down().
+ */
+long ath11k_core_wait_for_fw(struct ath11k_base *ab, struct completion *done,
+			     unsigned long timeout)
+{
+	long time_left;
+
+	/*
+	 * Pairs with smp_mb() in ath11k_core_firmware_going_down():
+	 * either the flag is seen here, or its complete_all() comes after the
+	 * caller reinitialised @done and ends the wait.
+	 */
+	smp_mb();
+	if (test_bit(ATH11K_FLAG_FW_DOWN, &ab->dev_flags))
+		return -ESHUTDOWN;
+
+	time_left = wait_for_completion_timeout(done, timeout);
+	if (test_bit(ATH11K_FLAG_FW_DOWN, &ab->dev_flags))
+		return -ESHUTDOWN;
+
+	return time_left;
+}
+
+/**
+ * ath11k_core_firmware_going_down() - stop using a firmware that goes down
+ * @ab: device
+ *
+ * Called by the bus before the firmware and the hardware it runs on are taken
+ * down, while the hardware is still accessible. Every wait of the firmware
+ * start sequence ends with -ESHUTDOWN, no WMI command is sent, and the
+ * function returns once the restart work and the QMI event work have
+ * finished, so neither of them accesses the hardware afterwards or talks to
+ * the next firmware. QMI events other than a server exit are dropped until
+ * the client started by ath11k_qmi_firmware_went_down() finds the server of
+ * the next firmware, which clears ATH11K_FLAG_FW_DOWN.
+ *
+ * Context: process context, not from the restart work or the QMI event work.
+ */
+void ath11k_core_firmware_going_down(struct ath11k_base *ab)
+{
+	int i;
+
+	ath11k_qmi_firmware_going_down(ab);
+	/* Pairs with smp_mb() in ath11k_core_wait_for_fw() */
+	smp_mb();
+
+	ath11k_qmi_abort_txns(ab);
+	complete_all(&ab->htc.ctl_resp);
+	complete_all(&ab->wmi_ab.service_ready);
+	complete_all(&ab->wmi_ab.unified_ready);
+	complete_all(&ab->dp.htt_tgt_version_received);
+	wake_up(&ab->wmi_ab.tx_credits_wq);
+	for (i = 0; i < ARRAY_SIZE(ab->wmi_ab.wmi); i++)
+		wake_up(&ab->wmi_ab.wmi[i].tx_ce_desc_wq);
+	wake_up(&ab->qmi.cold_boot_waitq);
+
+	/* The QMI event work queues the restart work, so flush it first */
+	flush_work(&ab->qmi.event_work);
+	cancel_work_sync(&ab->restart_work);
+}
+EXPORT_SYMBOL(ath11k_core_firmware_going_down);
+
 static void ath11k_core_post_reconfigure_recovery(struct ath11k_base *ab)
 {
 	struct ath11k *ar;
@@ -2783,6 +2853,11 @@ struct ath11k_base *ath11k_core_alloc(struct device *dev, size_t priv_size,
 		init_waitqueue_head(&ab->wmi_ab.wmi[i].tx_ce_desc_wq);
 
 	init_waitqueue_head(&ab->qmi.cold_boot_waitq);
+	ath11k_qmi_init_state(ab);
+	init_completion(&ab->htc.ctl_resp);
+	init_completion(&ab->wmi_ab.service_ready);
+	init_completion(&ab->wmi_ab.unified_ready);
+	init_completion(&ab->dp.htt_tgt_version_received);
 	INIT_WORK(&ab->restart_work, ath11k_core_restart);
 	INIT_WORK(&ab->update_11d_work, ath11k_update_11d);
 	INIT_WORK(&ab->reset_work, ath11k_core_reset);
diff --git a/drivers/net/wireless/ath/ath11k/core.h b/drivers/net/wireless/ath/ath11k/core.h
index 593e54c59737..232d9be475cc 100644
--- a/drivers/net/wireless/ath/ath11k/core.h
+++ b/drivers/net/wireless/ath/ath11k/core.h
@@ -289,6 +289,7 @@ enum ath11k_dev_flags {
 	ATH11K_FLAG_MULTI_MSI_VECTORS,
 	ATH11K_FLAG_FTM_SEGMENTED,
 	ATH11K_FLAG_CE_RINGS_SETUP,
+	ATH11K_FLAG_FW_DOWN,
 };
 
 enum ath11k_monitor_flags {
@@ -1289,6 +1290,9 @@ int ath11k_core_resume(struct ath11k_base *ab);
 int ath11k_core_suspend(struct ath11k_base *ab);
 int ath11k_core_suspend_late(struct ath11k_base *ab);
 void ath11k_core_pre_reconfigure_recovery(struct ath11k_base *ab);
+void ath11k_core_firmware_going_down(struct ath11k_base *ab);
+long ath11k_core_wait_for_fw(struct ath11k_base *ab, struct completion *done,
+			     unsigned long timeout);
 bool ath11k_core_coldboot_cal_support(struct ath11k_base *ab);
 
 const struct firmware *ath11k_core_firmware_request(struct ath11k_base *ab,
diff --git a/drivers/net/wireless/ath/ath11k/dp_tx.c b/drivers/net/wireless/ath/ath11k/dp_tx.c
index cac970c92806..01ef11a7a9a7 100644
--- a/drivers/net/wireless/ath/ath11k/dp_tx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_tx.c
@@ -998,9 +998,10 @@ int ath11k_dp_tx_htt_h2t_ver_req_msg(struct ath11k_base *ab)
 	struct sk_buff *skb;
 	struct htt_ver_req_cmd *cmd;
 	int len = sizeof(*cmd);
+	long time_left;
 	int ret;
 
-	init_completion(&dp->htt_tgt_version_received);
+	reinit_completion(&dp->htt_tgt_version_received);
 
 	skb = ath11k_htc_alloc_skb(ab, len);
 	if (!skb)
@@ -1017,9 +1018,11 @@ int ath11k_dp_tx_htt_h2t_ver_req_msg(struct ath11k_base *ab)
 		return ret;
 	}
 
-	ret = wait_for_completion_timeout(&dp->htt_tgt_version_received,
-					  HTT_TARGET_VERSION_TIMEOUT_HZ);
-	if (ret == 0) {
+	time_left = ath11k_core_wait_for_fw(ab, &dp->htt_tgt_version_received,
+					    HTT_TARGET_VERSION_TIMEOUT_HZ);
+	if (time_left < 0)
+		return time_left;
+	if (time_left == 0) {
 		ath11k_warn(ab, "htt target version request timed out\n");
 		return -ETIMEDOUT;
 	}
diff --git a/drivers/net/wireless/ath/ath11k/htc.c b/drivers/net/wireless/ath/ath11k/htc.c
index 07fc959ed74c..312002e19cac 100644
--- a/drivers/net/wireless/ath/ath11k/htc.c
+++ b/drivers/net/wireless/ath/ath11k/htc.c
@@ -522,28 +522,30 @@ int ath11k_htc_wait_target(struct ath11k_htc *htc)
 {
 	int i, status = 0;
 	struct ath11k_base *ab = htc->ab;
-	unsigned long time_left;
+	long time_left;
 	struct ath11k_htc_ready *ready;
 	u16 message_id;
 	u16 credit_count;
 	u16 credit_size;
 
-	time_left = wait_for_completion_timeout(&htc->ctl_resp,
-						ATH11K_HTC_WAIT_TIMEOUT_HZ);
+	time_left = ath11k_core_wait_for_fw(ab, &htc->ctl_resp,
+					    ATH11K_HTC_WAIT_TIMEOUT_HZ);
 	if (!time_left) {
 		ath11k_warn(ab, "failed to receive control response completion, polling..\n");
 
 		for (i = 0; i < ab->hw_params.ce_count; i++)
 			ath11k_ce_per_engine_service(htc->ab, i);
 
-		time_left =
-			wait_for_completion_timeout(&htc->ctl_resp,
+		time_left = ath11k_core_wait_for_fw(ab, &htc->ctl_resp,
 						    ATH11K_HTC_WAIT_TIMEOUT_HZ);
 
 		if (!time_left)
 			status = -ETIMEDOUT;
 	}
 
+	if (time_left < 0)
+		status = time_left;
+
 	if (status < 0) {
 		ath11k_warn(ab, "ctl_resp never came in (%d)\n", status);
 		return status;
@@ -603,7 +605,7 @@ int ath11k_htc_connect_service(struct ath11k_htc *htc,
 	struct sk_buff *skb;
 	unsigned int max_msg_size = 0;
 	int length, status;
-	unsigned long time_left;
+	long time_left;
 	bool disable_credit_flow_ctrl = false;
 	u16 message_id, service_id, flags = 0;
 	u8 tx_alloc = 0;
@@ -666,8 +668,10 @@ int ath11k_htc_connect_service(struct ath11k_htc *htc,
 	}
 
 	/* wait for response */
-	time_left = wait_for_completion_timeout(&htc->ctl_resp,
-						ATH11K_HTC_CONN_SVC_TIMEOUT_HZ);
+	time_left = ath11k_core_wait_for_fw(ab, &htc->ctl_resp,
+					    ATH11K_HTC_CONN_SVC_TIMEOUT_HZ);
+	if (time_left < 0)
+		return time_left;
 	if (!time_left) {
 		ath11k_err(ab, "Service connect timeout\n");
 		return -ETIMEDOUT;
@@ -836,7 +840,7 @@ int ath11k_htc_init(struct ath11k_base *ab)
 		return ret;
 	}
 
-	init_completion(&htc->ctl_resp);
+	reinit_completion(&htc->ctl_resp);
 
 	return 0;
 }
diff --git a/drivers/net/wireless/ath/ath11k/qmi.c b/drivers/net/wireless/ath/ath11k/qmi.c
index 4a3837958e01..232a2d4e8c85 100644
--- a/drivers/net/wireless/ath/ath11k/qmi.c
+++ b/drivers/net/wireless/ath/ath11k/qmi.c
@@ -1705,6 +1705,55 @@ static const struct qmi_elem_info qmi_wlfw_fw_init_done_ind_msg_v01_ei[] = {
 	},
 };
 
+struct ath11k_qmi_txn_waiter {
+	struct list_head list;
+	struct qmi_txn *txn;
+};
+
+static int ath11k_qmi_txn_wait(struct ath11k_base *ab, struct qmi_txn *txn)
+{
+	struct ath11k_qmi_txn_waiter waiter = { .txn = txn };
+	int ret;
+
+	spin_lock(&ab->qmi.txn_wait_lock);
+	if (test_bit(ATH11K_FLAG_FW_DOWN, &ab->dev_flags)) {
+		spin_unlock(&ab->qmi.txn_wait_lock);
+		qmi_txn_cancel(txn);
+		return -ESHUTDOWN;
+	}
+	list_add(&waiter.list, &ab->qmi.txn_waiters);
+	spin_unlock(&ab->qmi.txn_wait_lock);
+
+	ret = qmi_txn_wait(txn, msecs_to_jiffies(ATH11K_QMI_WLANFW_TIMEOUT_MS));
+
+	spin_lock(&ab->qmi.txn_wait_lock);
+	list_del(&waiter.list);
+	spin_unlock(&ab->qmi.txn_wait_lock);
+
+	/* ath11k_qmi_abort_txns() ends the wait without a response */
+	if (test_bit(ATH11K_FLAG_FW_DOWN, &ab->dev_flags))
+		return -ESHUTDOWN;
+
+	return ret;
+}
+
+/**
+ * ath11k_qmi_abort_txns() - end the waits for QMI responses
+ * @ab: device
+ *
+ * Called after ATH11K_FLAG_FW_DOWN is set. The waiters in
+ * ath11k_qmi_txn_wait() return -ESHUTDOWN, and new ones are not started.
+ */
+void ath11k_qmi_abort_txns(struct ath11k_base *ab)
+{
+	struct ath11k_qmi_txn_waiter *waiter;
+
+	spin_lock(&ab->qmi.txn_wait_lock);
+	list_for_each_entry(waiter, &ab->qmi.txn_waiters, list)
+		complete(&waiter->txn->completion);
+	spin_unlock(&ab->qmi.txn_wait_lock);
+}
+
 /* clang stack usage explodes if this is inlined */
 static noinline_for_stack
 int ath11k_qmi_host_cap_send(struct ath11k_base *ab)
@@ -1760,12 +1809,12 @@ int ath11k_qmi_host_cap_send(struct ath11k_base *ab)
 
 	ath11k_dbg(ab, ATH11K_DBG_QMI, "host cap request\n");
 
-	ret = qmi_txn_init(&ab->qmi.handle, &txn,
+	ret = qmi_txn_init(ab->qmi.handle, &txn,
 			   qmi_wlanfw_host_cap_resp_msg_v01_ei, &resp);
 	if (ret < 0)
 		goto out;
 
-	ret = qmi_send_request(&ab->qmi.handle, NULL, &txn,
+	ret = qmi_send_request(ab->qmi.handle, NULL, &txn,
 			       QMI_WLANFW_HOST_CAP_REQ_V01,
 			       QMI_WLANFW_HOST_CAP_REQ_MSG_V01_MAX_LEN,
 			       qmi_wlanfw_host_cap_req_msg_v01_ei, &req);
@@ -1775,7 +1824,7 @@ int ath11k_qmi_host_cap_send(struct ath11k_base *ab)
 		goto out;
 	}
 
-	ret = qmi_txn_wait(&txn, msecs_to_jiffies(ATH11K_QMI_WLANFW_TIMEOUT_MS));
+	ret = ath11k_qmi_txn_wait(ab, &txn);
 	if (ret < 0)
 		goto out;
 
@@ -1794,7 +1843,7 @@ static int ath11k_qmi_fw_ind_register_send(struct ath11k_base *ab)
 {
 	struct qmi_wlanfw_ind_register_req_msg_v01 *req;
 	struct qmi_wlanfw_ind_register_resp_msg_v01 *resp;
-	struct qmi_handle *handle = &ab->qmi.handle;
+	struct qmi_handle *handle = ab->qmi.handle;
 	struct qmi_txn txn;
 	int ret;
 
@@ -1838,7 +1887,7 @@ static int ath11k_qmi_fw_ind_register_send(struct ath11k_base *ab)
 
 	ath11k_dbg(ab, ATH11K_DBG_QMI, "indication register request\n");
 
-	ret = qmi_send_request(&ab->qmi.handle, NULL, &txn,
+	ret = qmi_send_request(ab->qmi.handle, NULL, &txn,
 			       QMI_WLANFW_IND_REGISTER_REQ_V01,
 			       QMI_WLANFW_IND_REGISTER_REQ_MSG_V01_MAX_LEN,
 			       qmi_wlanfw_ind_register_req_msg_v01_ei, req);
@@ -1849,7 +1898,7 @@ static int ath11k_qmi_fw_ind_register_send(struct ath11k_base *ab)
 		goto out;
 	}
 
-	ret = qmi_txn_wait(&txn, msecs_to_jiffies(ATH11K_QMI_WLANFW_TIMEOUT_MS));
+	ret = ath11k_qmi_txn_wait(ab, &txn);
 	if (ret < 0) {
 		ath11k_warn(ab, "failed to register fw indication: %d\n", ret);
 		goto out;
@@ -1911,7 +1960,7 @@ static int ath11k_qmi_respond_fw_mem_request(struct ath11k_base *ab)
 		}
 	}
 
-	ret = qmi_txn_init(&ab->qmi.handle, &txn,
+	ret = qmi_txn_init(ab->qmi.handle, &txn,
 			   qmi_wlanfw_respond_mem_resp_msg_v01_ei, &resp);
 	if (ret < 0)
 		goto out;
@@ -1919,7 +1968,7 @@ static int ath11k_qmi_respond_fw_mem_request(struct ath11k_base *ab)
 	ath11k_dbg(ab, ATH11K_DBG_QMI, "respond memory request delayed %i\n",
 		   delayed);
 
-	ret = qmi_send_request(&ab->qmi.handle, NULL, &txn,
+	ret = qmi_send_request(ab->qmi.handle, NULL, &txn,
 			       QMI_WLANFW_RESPOND_MEM_REQ_V01,
 			       QMI_WLANFW_RESPOND_MEM_REQ_MSG_V01_MAX_LEN,
 			       qmi_wlanfw_respond_mem_req_msg_v01_ei, req);
@@ -1930,7 +1979,7 @@ static int ath11k_qmi_respond_fw_mem_request(struct ath11k_base *ab)
 		goto out;
 	}
 
-	ret = qmi_txn_wait(&txn, msecs_to_jiffies(ATH11K_QMI_WLANFW_TIMEOUT_MS));
+	ret = ath11k_qmi_txn_wait(ab, &txn);
 	if (ret < 0) {
 		ath11k_warn(ab, "failed to wait qmi memory request: %d\n", ret);
 		goto out;
@@ -2129,12 +2178,12 @@ static int ath11k_qmi_request_device_info(struct ath11k_base *ab)
 	if (!ab->hw_params.hybrid_bus_type)
 		return 0;
 
-	ret = qmi_txn_init(&ab->qmi.handle, &txn,
+	ret = qmi_txn_init(ab->qmi.handle, &txn,
 			   qmi_wlfw_device_info_resp_msg_v01_ei, &resp);
 	if (ret < 0)
 		goto out;
 
-	ret = qmi_send_request(&ab->qmi.handle, NULL, &txn,
+	ret = qmi_send_request(ab->qmi.handle, NULL, &txn,
 			       QMI_WLANFW_DEVICE_INFO_REQ_V01,
 			       QMI_WLANFW_DEVICE_INFO_REQ_MSG_V01_MAX_LEN,
 			       qmi_wlanfw_device_info_req_msg_v01_ei, &req);
@@ -2145,7 +2194,7 @@ static int ath11k_qmi_request_device_info(struct ath11k_base *ab)
 		goto out;
 	}
 
-	ret = qmi_txn_wait(&txn, msecs_to_jiffies(ATH11K_QMI_WLANFW_TIMEOUT_MS));
+	ret = ath11k_qmi_txn_wait(ab, &txn);
 	if (ret < 0) {
 		ath11k_warn(ab, "failed to wait qmi target device info request: %d\n",
 			    ret);
@@ -2207,14 +2256,14 @@ static int ath11k_qmi_request_target_cap(struct ath11k_base *ab)
 	memset(&req, 0, sizeof(req));
 	memset(&resp, 0, sizeof(resp));
 
-	ret = qmi_txn_init(&ab->qmi.handle, &txn, qmi_wlanfw_cap_resp_msg_v01_ei,
+	ret = qmi_txn_init(ab->qmi.handle, &txn, qmi_wlanfw_cap_resp_msg_v01_ei,
 			   &resp);
 	if (ret < 0)
 		goto out;
 
 	ath11k_dbg(ab, ATH11K_DBG_QMI, "target cap request\n");
 
-	ret = qmi_send_request(&ab->qmi.handle, NULL, &txn,
+	ret = qmi_send_request(ab->qmi.handle, NULL, &txn,
 			       QMI_WLANFW_CAP_REQ_V01,
 			       QMI_WLANFW_CAP_REQ_MSG_V01_MAX_LEN,
 			       qmi_wlanfw_cap_req_msg_v01_ei, &req);
@@ -2225,7 +2274,7 @@ static int ath11k_qmi_request_target_cap(struct ath11k_base *ab)
 		goto out;
 	}
 
-	ret = qmi_txn_wait(&txn, msecs_to_jiffies(ATH11K_QMI_WLANFW_TIMEOUT_MS));
+	ret = ath11k_qmi_txn_wait(ab, &txn);
 	if (ret < 0) {
 		ath11k_warn(ab, "failed to wait qmi cap request: %d\n", ret);
 		goto out;
@@ -2356,7 +2405,7 @@ static int ath11k_qmi_load_file_target_mem(struct ath11k_base *ab,
 			memcpy_toio(bdf_addr, temp, len);
 		}
 
-		ret = qmi_txn_init(&ab->qmi.handle, &txn,
+		ret = qmi_txn_init(ab->qmi.handle, &txn,
 				   qmi_wlanfw_bdf_download_resp_msg_v01_ei,
 				   &resp);
 		if (ret < 0)
@@ -2365,7 +2414,7 @@ static int ath11k_qmi_load_file_target_mem(struct ath11k_base *ab,
 		ath11k_dbg(ab, ATH11K_DBG_QMI, "bdf download req fixed addr type %d\n",
 			   type);
 
-		ret = qmi_send_request(&ab->qmi.handle, NULL, &txn,
+		ret = qmi_send_request(ab->qmi.handle, NULL, &txn,
 				       QMI_WLANFW_BDF_DOWNLOAD_REQ_V01,
 				       QMI_WLANFW_BDF_DOWNLOAD_REQ_MSG_V01_MAX_LEN,
 				       qmi_wlanfw_bdf_download_req_msg_v01_ei, req);
@@ -2374,7 +2423,7 @@ static int ath11k_qmi_load_file_target_mem(struct ath11k_base *ab,
 			goto err_iounmap;
 		}
 
-		ret = qmi_txn_wait(&txn, msecs_to_jiffies(ATH11K_QMI_WLANFW_TIMEOUT_MS));
+		ret = ath11k_qmi_txn_wait(ab, &txn);
 		if (ret < 0) {
 			ath11k_warn(ab, "failed to wait board file download request: %d\n",
 				    ret);
@@ -2603,14 +2652,14 @@ int ath11k_qmi_wlanfw_m3_info_send(struct ath11k_base *ab)
 		req.size = 0;
 	}
 
-	ret = qmi_txn_init(&ab->qmi.handle, &txn,
+	ret = qmi_txn_init(ab->qmi.handle, &txn,
 			   qmi_wlanfw_m3_info_resp_msg_v01_ei, &resp);
 	if (ret < 0)
 		goto out;
 
 	ath11k_dbg(ab, ATH11K_DBG_QMI, "m3 info req\n");
 
-	ret = qmi_send_request(&ab->qmi.handle, NULL, &txn,
+	ret = qmi_send_request(ab->qmi.handle, NULL, &txn,
 			       QMI_WLANFW_M3_INFO_REQ_V01,
 			       QMI_WLANFW_M3_INFO_REQ_MSG_V01_MAX_MSG_LEN,
 			       qmi_wlanfw_m3_info_req_msg_v01_ei, &req);
@@ -2621,7 +2670,7 @@ int ath11k_qmi_wlanfw_m3_info_send(struct ath11k_base *ab)
 		goto out;
 	}
 
-	ret = qmi_txn_wait(&txn, msecs_to_jiffies(ATH11K_QMI_WLANFW_TIMEOUT_MS));
+	ret = ath11k_qmi_txn_wait(ab, &txn);
 	if (ret < 0) {
 		ath11k_warn(ab, "failed to wait m3 information request: %d\n", ret);
 		goto out;
@@ -2652,14 +2701,14 @@ static int ath11k_qmi_wlanfw_mode_send(struct ath11k_base *ab,
 	req.hw_debug_valid = 1;
 	req.hw_debug = 0;
 
-	ret = qmi_txn_init(&ab->qmi.handle, &txn,
+	ret = qmi_txn_init(ab->qmi.handle, &txn,
 			   qmi_wlanfw_wlan_mode_resp_msg_v01_ei, &resp);
 	if (ret < 0)
 		goto out;
 
 	ath11k_dbg(ab, ATH11K_DBG_QMI, "wlan mode req mode %d\n", mode);
 
-	ret = qmi_send_request(&ab->qmi.handle, NULL, &txn,
+	ret = qmi_send_request(ab->qmi.handle, NULL, &txn,
 			       QMI_WLANFW_WLAN_MODE_REQ_V01,
 			       QMI_WLANFW_WLAN_MODE_REQ_MSG_V01_MAX_LEN,
 			       qmi_wlanfw_wlan_mode_req_msg_v01_ei, &req);
@@ -2670,7 +2719,7 @@ static int ath11k_qmi_wlanfw_mode_send(struct ath11k_base *ab,
 		goto out;
 	}
 
-	ret = qmi_txn_wait(&txn, msecs_to_jiffies(ATH11K_QMI_WLANFW_TIMEOUT_MS));
+	ret = ath11k_qmi_txn_wait(ab, &txn);
 	if (ret < 0) {
 		if (mode == ATH11K_FIRMWARE_MODE_OFF && ret == -ENETRESET) {
 			ath11k_warn(ab, "WLFW service is dis-connected\n");
@@ -2747,14 +2796,14 @@ static int ath11k_qmi_wlanfw_wlan_cfg_send(struct ath11k_base *ab)
 		req->shadow_reg_v2_valid = 0;
 	}
 
-	ret = qmi_txn_init(&ab->qmi.handle, &txn,
+	ret = qmi_txn_init(ab->qmi.handle, &txn,
 			   qmi_wlanfw_wlan_cfg_resp_msg_v01_ei, &resp);
 	if (ret < 0)
 		goto out;
 
 	ath11k_dbg(ab, ATH11K_DBG_QMI, "wlan cfg req\n");
 
-	ret = qmi_send_request(&ab->qmi.handle, NULL, &txn,
+	ret = qmi_send_request(ab->qmi.handle, NULL, &txn,
 			       QMI_WLANFW_WLAN_CFG_REQ_V01,
 			       QMI_WLANFW_WLAN_CFG_REQ_MSG_V01_MAX_LEN,
 			       qmi_wlanfw_wlan_cfg_req_msg_v01_ei, req);
@@ -2765,7 +2814,7 @@ static int ath11k_qmi_wlanfw_wlan_cfg_send(struct ath11k_base *ab)
 		goto out;
 	}
 
-	ret = qmi_txn_wait(&txn, msecs_to_jiffies(ATH11K_QMI_WLANFW_TIMEOUT_MS));
+	ret = ath11k_qmi_txn_wait(ab, &txn);
 	if (ret < 0) {
 		ath11k_warn(ab, "failed to wait wlan config request: %d\n", ret);
 		goto out;
@@ -2793,12 +2842,12 @@ static int ath11k_qmi_wlanfw_wlan_ini_send(struct ath11k_base *ab, bool enable)
 	req.enablefwlog_valid = true;
 	req.enablefwlog = enable ? 1 : 0;
 
-	ret = qmi_txn_init(&ab->qmi.handle, &txn,
+	ret = qmi_txn_init(ab->qmi.handle, &txn,
 			   qmi_wlanfw_wlan_ini_resp_msg_v01_ei, &resp);
 	if (ret < 0)
 		goto out;
 
-	ret = qmi_send_request(&ab->qmi.handle, NULL, &txn,
+	ret = qmi_send_request(ab->qmi.handle, NULL, &txn,
 			       QMI_WLANFW_WLAN_INI_REQ_V01,
 			       QMI_WLANFW_WLAN_INI_REQ_MSG_V01_MAX_LEN,
 			       qmi_wlanfw_wlan_ini_req_msg_v01_ei, &req);
@@ -2809,7 +2858,7 @@ static int ath11k_qmi_wlanfw_wlan_ini_send(struct ath11k_base *ab, bool enable)
 		goto out;
 	}
 
-	ret = qmi_txn_wait(&txn, msecs_to_jiffies(ATH11K_QMI_WLANFW_TIMEOUT_MS));
+	ret = ath11k_qmi_txn_wait(ab, &txn);
 	if (ret < 0) {
 		ath11k_warn(ab, "qmi failed wlan ini request, err = %d\n", ret);
 		goto out;
@@ -2831,6 +2880,9 @@ void ath11k_qmi_firmware_stop(struct ath11k_base *ab)
 
 	ath11k_dbg(ab, ATH11K_DBG_QMI, "firmware stop\n");
 
+	if (test_bit(ATH11K_FLAG_FW_DOWN, &ab->dev_flags))
+		return;
+
 	ret = ath11k_qmi_wlanfw_mode_send(ab, ATH11K_FIRMWARE_MODE_OFF);
 	if (ret < 0) {
 		ath11k_warn(ab, "qmi failed to send wlan mode off: %d\n", ret);
@@ -2845,6 +2897,9 @@ int ath11k_qmi_firmware_start(struct ath11k_base *ab,
 
 	ath11k_dbg(ab, ATH11K_DBG_QMI, "firmware start\n");
 
+	if (test_bit(ATH11K_FLAG_FW_DOWN, &ab->dev_flags))
+		return -ESHUTDOWN;
+
 	if (ab->hw_params.fw_wmi_diag_event) {
 		ret = ath11k_qmi_wlanfw_wlan_ini_send(ab, true);
 		if (ret < 0) {
@@ -2909,7 +2964,8 @@ static int ath11k_qmi_process_coldboot_calibration(struct ath11k_base *ab)
 	ath11k_dbg(ab, ATH11K_DBG_QMI, "Coldboot calibration wait started\n");
 
 	time_left = wait_event_timeout(ab->qmi.cold_boot_waitq,
-				       (ab->qmi.cal_done  == 1),
+				       (ab->qmi.cal_done  == 1 ||
+					test_bit(ATH11K_FLAG_FW_DOWN, &ab->dev_flags)),
 				       ATH11K_COLD_BOOT_FW_RESET_DELAY);
 	if (time_left <= 0) {
 		ath11k_warn(ab, "coldboot calibration timed out\n");
@@ -2921,11 +2977,17 @@ static int ath11k_qmi_process_coldboot_calibration(struct ath11k_base *ab)
 	return 0;
 }
 
+static struct ath11k_qmi_client *ath11k_qmi_client(struct qmi_handle *qmi_hdl)
+{
+	return container_of(qmi_hdl, struct ath11k_qmi_client, handle);
+}
+
 static int
-ath11k_qmi_driver_event_post(struct ath11k_qmi *qmi,
+ath11k_qmi_driver_event_post(struct ath11k_qmi_client *client,
 			     enum ath11k_qmi_event_type type,
 			     void *data)
 {
+	struct ath11k_qmi *qmi = client->qmi;
 	struct ath11k_qmi_driver_event *event;
 
 	event = kzalloc_obj(*event, GFP_ATOMIC);
@@ -2936,6 +2998,7 @@ ath11k_qmi_driver_event_post(struct ath11k_qmi *qmi,
 	event->data = data;
 
 	spin_lock(&qmi->event_lock);
+	event->gen = client->gen;
 	list_add_tail(&event->list, &qmi->event_list);
 	spin_unlock(&qmi->event_lock);
 
@@ -3023,7 +3086,8 @@ static void ath11k_qmi_msg_mem_request_cb(struct qmi_handle *qmi_hdl,
 					  struct qmi_txn *txn,
 					  const void *data)
 {
-	struct ath11k_qmi *qmi = container_of(qmi_hdl, struct ath11k_qmi, handle);
+	struct ath11k_qmi_client *client = ath11k_qmi_client(qmi_hdl);
+	struct ath11k_qmi *qmi = client->qmi;
 	struct ath11k_base *ab = qmi->ab;
 	const struct qmi_wlanfw_request_mem_ind_msg_v01 *msg = data;
 	int i, ret;
@@ -3061,7 +3125,7 @@ static void ath11k_qmi_msg_mem_request_cb(struct qmi_handle *qmi_hdl,
 		}
 	}
 
-	ath11k_qmi_driver_event_post(qmi, ATH11K_QMI_EVENT_REQUEST_MEM, NULL);
+	ath11k_qmi_driver_event_post(client, ATH11K_QMI_EVENT_REQUEST_MEM, NULL);
 }
 
 static void ath11k_qmi_msg_mem_ready_cb(struct qmi_handle *qmi_hdl,
@@ -3069,11 +3133,12 @@ static void ath11k_qmi_msg_mem_ready_cb(struct qmi_handle *qmi_hdl,
 					struct qmi_txn *txn,
 					const void *decoded)
 {
-	struct ath11k_qmi *qmi = container_of(qmi_hdl, struct ath11k_qmi, handle);
+	struct ath11k_qmi_client *client = ath11k_qmi_client(qmi_hdl);
+	struct ath11k_qmi *qmi = client->qmi;
 	struct ath11k_base *ab = qmi->ab;
 
 	ath11k_dbg(ab, ATH11K_DBG_QMI, "firmware memory ready indication\n");
-	ath11k_qmi_driver_event_post(qmi, ATH11K_QMI_EVENT_FW_MEM_READY, NULL);
+	ath11k_qmi_driver_event_post(client, ATH11K_QMI_EVENT_FW_MEM_READY, NULL);
 }
 
 static void ath11k_qmi_msg_fw_ready_cb(struct qmi_handle *qmi_hdl,
@@ -3081,7 +3146,8 @@ static void ath11k_qmi_msg_fw_ready_cb(struct qmi_handle *qmi_hdl,
 				       struct qmi_txn *txn,
 				       const void *decoded)
 {
-	struct ath11k_qmi *qmi = container_of(qmi_hdl, struct ath11k_qmi, handle);
+	struct ath11k_qmi_client *client = ath11k_qmi_client(qmi_hdl);
+	struct ath11k_qmi *qmi = client->qmi;
 	struct ath11k_base *ab = qmi->ab;
 
 	ath11k_dbg(ab, ATH11K_DBG_QMI, "firmware ready\n");
@@ -3091,7 +3157,7 @@ static void ath11k_qmi_msg_fw_ready_cb(struct qmi_handle *qmi_hdl,
 		wake_up(&ab->qmi.cold_boot_waitq);
 	}
 
-	ath11k_qmi_driver_event_post(qmi, ATH11K_QMI_EVENT_FW_READY, NULL);
+	ath11k_qmi_driver_event_post(client, ATH11K_QMI_EVENT_FW_READY, NULL);
 }
 
 static void ath11k_qmi_msg_cold_boot_cal_done_cb(struct qmi_handle *qmi_hdl,
@@ -3099,8 +3165,8 @@ static void ath11k_qmi_msg_cold_boot_cal_done_cb(struct qmi_handle *qmi_hdl,
 						 struct qmi_txn *txn,
 						 const void *decoded)
 {
-	struct ath11k_qmi *qmi = container_of(qmi_hdl,
-					      struct ath11k_qmi, handle);
+	struct ath11k_qmi_client *client = ath11k_qmi_client(qmi_hdl);
+	struct ath11k_qmi *qmi = client->qmi;
 	struct ath11k_base *ab = qmi->ab;
 
 	ab->qmi.cal_done = 1;
@@ -3113,11 +3179,11 @@ static void ath11k_qmi_msg_fw_init_done_cb(struct qmi_handle *qmi_hdl,
 					   struct qmi_txn *txn,
 					   const void *decoded)
 {
-	struct ath11k_qmi *qmi = container_of(qmi_hdl,
-					      struct ath11k_qmi, handle);
+	struct ath11k_qmi_client *client = ath11k_qmi_client(qmi_hdl);
+	struct ath11k_qmi *qmi = client->qmi;
 	struct ath11k_base *ab = qmi->ab;
 
-	ath11k_qmi_driver_event_post(qmi, ATH11K_QMI_EVENT_FW_INIT_DONE, NULL);
+	ath11k_qmi_driver_event_post(client, ATH11K_QMI_EVENT_FW_INIT_DONE, NULL);
 	ath11k_dbg(ab, ATH11K_DBG_QMI, "firmware init done\n");
 }
 
@@ -3167,7 +3233,8 @@ static const struct qmi_msg_handler ath11k_qmi_msg_handlers[] = {
 static int ath11k_qmi_ops_new_server(struct qmi_handle *qmi_hdl,
 				     struct qmi_service *service)
 {
-	struct ath11k_qmi *qmi = container_of(qmi_hdl, struct ath11k_qmi, handle);
+	struct ath11k_qmi_client *client = ath11k_qmi_client(qmi_hdl);
+	struct ath11k_qmi *qmi = client->qmi;
 	struct ath11k_base *ab = qmi->ab;
 	struct sockaddr_qrtr *sq = &qmi->sq;
 	int ret;
@@ -3184,7 +3251,7 @@ static int ath11k_qmi_ops_new_server(struct qmi_handle *qmi_hdl,
 	}
 
 	ath11k_dbg(ab, ATH11K_DBG_QMI, "wifi fw qmi service connected\n");
-	ath11k_qmi_driver_event_post(qmi, ATH11K_QMI_EVENT_SERVER_ARRIVE, NULL);
+	ath11k_qmi_driver_event_post(client, ATH11K_QMI_EVENT_SERVER_ARRIVE, NULL);
 
 	return ret;
 }
@@ -3192,11 +3259,12 @@ static int ath11k_qmi_ops_new_server(struct qmi_handle *qmi_hdl,
 static void ath11k_qmi_ops_del_server(struct qmi_handle *qmi_hdl,
 				      struct qmi_service *service)
 {
-	struct ath11k_qmi *qmi = container_of(qmi_hdl, struct ath11k_qmi, handle);
+	struct ath11k_qmi_client *client = ath11k_qmi_client(qmi_hdl);
+	struct ath11k_qmi *qmi = client->qmi;
 	struct ath11k_base *ab = qmi->ab;
 
 	ath11k_dbg(ab, ATH11K_DBG_QMI, "wifi fw del server\n");
-	ath11k_qmi_driver_event_post(qmi, ATH11K_QMI_EVENT_SERVER_EXIT, NULL);
+	ath11k_qmi_driver_event_post(client, ATH11K_QMI_EVENT_SERVER_EXIT, NULL);
 }
 
 static const struct qmi_ops ath11k_qmi_ops = {
@@ -3204,12 +3272,42 @@ static const struct qmi_ops ath11k_qmi_ops = {
 	.del_server = ath11k_qmi_ops_del_server,
 };
 
+/*
+ * A firmware that goes down is not talked to any more, see
+ * ath11k_qmi_firmware_going_down(). A server exit is handled from any
+ * client: it reports a firmware that is gone, and its handling sets
+ * CRASH_FLUSH and RECOVERY and runs ath11k_core_pre_reconfigure_recovery(),
+ * which stop the host's use of that firmware and wake its waiters without
+ * sending anything to a firmware. Only a server found by the client that
+ * ath11k_qmi_firmware_went_down() started afterwards belongs to the next
+ * firmware, and its arrival ends ATH11K_FLAG_FW_DOWN.
+ */
+static bool ath11k_qmi_event_stale(struct ath11k_qmi *qmi,
+				   struct ath11k_qmi_driver_event *event)
+{
+	struct ath11k_base *ab = qmi->ab;
+
+	lockdep_assert_held(&qmi->event_lock);
+
+	if (event->type == ATH11K_QMI_EVENT_SERVER_EXIT)
+		return false;
+
+	if (qmi->stopping || event->gen != qmi->gen)
+		return true;
+
+	if (event->type == ATH11K_QMI_EVENT_SERVER_ARRIVE)
+		clear_bit(ATH11K_FLAG_FW_DOWN, &ab->dev_flags);
+
+	return test_bit(ATH11K_FLAG_FW_DOWN, &ab->dev_flags);
+}
+
 static void ath11k_qmi_driver_event_work(struct work_struct *work)
 {
 	struct ath11k_qmi *qmi = container_of(work, struct ath11k_qmi,
 					      event_work);
 	struct ath11k_qmi_driver_event *event;
 	struct ath11k_base *ab = qmi->ab;
+	bool stale;
 	int ret;
 
 	spin_lock(&qmi->event_lock);
@@ -3217,6 +3315,7 @@ static void ath11k_qmi_driver_event_work(struct work_struct *work)
 		event = list_first_entry(&qmi->event_list,
 					 struct ath11k_qmi_driver_event, list);
 		list_del(&event->list);
+		stale = ath11k_qmi_event_stale(qmi, event);
 		spin_unlock(&qmi->event_lock);
 
 		if (test_bit(ATH11K_FLAG_UNREGISTERING, &ab->dev_flags)) {
@@ -3224,6 +3323,13 @@ static void ath11k_qmi_driver_event_work(struct work_struct *work)
 			return;
 		}
 
+		if (stale) {
+			ath11k_dbg(ab, ATH11K_DBG_QMI,
+				   "drop event %d of a firmware that went down\n",
+				   event->type);
+			goto next;
+		}
+
 		switch (event->type) {
 		case ATH11K_QMI_EVENT_SERVER_ARRIVE:
 			ret = ath11k_qmi_event_server_arrive(qmi);
@@ -3309,14 +3415,52 @@ static void ath11k_qmi_driver_event_work(struct work_struct *work)
 			ath11k_warn(ab, "invalid qmi event type: %d", event->type);
 			break;
 		}
+next:
 		kfree(event);
 		spin_lock(&qmi->event_lock);
 	}
 	spin_unlock(&qmi->event_lock);
 }
 
+/*
+ * Makes @client current. stopping is left as it is: only
+ * ath11k_qmi_firmware_going_down() and ath11k_qmi_firmware_went_down()
+ * change it, under event_lock.
+ */
+static void ath11k_qmi_set_client(struct ath11k_qmi *qmi,
+				  struct ath11k_qmi_client *client,
+				  bool clear_stopping)
+{
+	lockdep_assert_held(&qmi->client_lock);
+
+	spin_lock(&qmi->event_lock);
+	qmi->handle = &client->handle;
+	qmi->gen = client->gen;
+	if (clear_stopping)
+		qmi->stopping = false;
+	spin_unlock(&qmi->event_lock);
+}
+
+/**
+ * ath11k_qmi_init_state() - initialise the QMI state used by the bus
+ * @ab: device
+ *
+ * Sets up the locks, lists and works that ath11k_qmi_firmware_going_down() and
+ * ath11k_qmi_firmware_went_down() use, before the bus can call them.
+ */
+void ath11k_qmi_init_state(struct ath11k_base *ab)
+{
+	INIT_LIST_HEAD(&ab->qmi.event_list);
+	spin_lock_init(&ab->qmi.event_lock);
+	INIT_WORK(&ab->qmi.event_work, ath11k_qmi_driver_event_work);
+	spin_lock_init(&ab->qmi.txn_wait_lock);
+	INIT_LIST_HEAD(&ab->qmi.txn_waiters);
+	mutex_init(&ab->qmi.client_lock);
+}
+
 int ath11k_qmi_init_service(struct ath11k_base *ab)
 {
+	struct ath11k_qmi_client *client = &ab->qmi.clients[0];
 	int ret;
 
 	memset(&ab->qmi.target, 0, sizeof(struct target_info));
@@ -3324,46 +3468,152 @@ int ath11k_qmi_init_service(struct ath11k_base *ab)
 	ab->qmi.ab = ab;
 
 	ab->qmi.target_mem_mode = ab->hw_params.fw_mem_mode;
-	ret = qmi_handle_init(&ab->qmi.handle, ATH11K_QMI_RESP_LEN_MAX,
-			      &ath11k_qmi_ops, ath11k_qmi_msg_handlers);
-	if (ret < 0) {
-		ath11k_warn(ab, "failed to initialize qmi handle: %d\n", ret);
-		return ret;
-	}
 
 	ab->qmi.event_wq = alloc_ordered_workqueue("ath11k_qmi_driver_event", 0);
 	if (!ab->qmi.event_wq) {
 		ath11k_err(ab, "failed to allocate workqueue\n");
-		ret = -EFAULT;
-		goto err_release_handle;
+		return -EFAULT;
 	}
 
-	INIT_LIST_HEAD(&ab->qmi.event_list);
-	spin_lock_init(&ab->qmi.event_lock);
-	INIT_WORK(&ab->qmi.event_work, ath11k_qmi_driver_event_work);
+	mutex_lock(&ab->qmi.client_lock);
 
-	ret = qmi_add_lookup(&ab->qmi.handle, QMI_SERVICE_ID_WLFW,
+	client->qmi = &ab->qmi;
+	client->gen = ab->qmi.last_gen;
+	ret = qmi_handle_init(&client->handle, ATH11K_QMI_RESP_LEN_MAX,
+			      &ath11k_qmi_ops, ath11k_qmi_msg_handlers);
+	if (ret < 0) {
+		ath11k_warn(ab, "failed to initialize qmi handle: %d\n", ret);
+		goto err_unlock;
+	}
+
+	/*
+	 * The lookup is sent under client_lock: if a shutdown notification
+	 * started before it, ath11k_qmi_firmware_went_down() takes the lock
+	 * after it and restarts this client; stopping, set under event_lock,
+	 * keeps the client's events dropped until then.
+	 */
+	ath11k_qmi_set_client(&ab->qmi, client, false);
+
+	ret = qmi_add_lookup(&client->handle, QMI_SERVICE_ID_WLFW,
 			     ATH11K_QMI_WLFW_SERVICE_VERS_V01,
 			     ab->qmi.service_ins_id);
 	if (ret < 0) {
 		ath11k_warn(ab, "failed to add qmi lookup: %d\n", ret);
-		destroy_workqueue(ab->qmi.event_wq);
-		goto err_release_handle;
+		qmi_handle_release(&client->handle);
+		goto err_unlock;
 	}
 
-	return ret;
+	ab->qmi.client_live = true;
+	mutex_unlock(&ab->qmi.client_lock);
 
-err_release_handle:
-	qmi_handle_release(&ab->qmi.handle);
+	return 0;
+
+err_unlock:
+	mutex_unlock(&ab->qmi.client_lock);
+	destroy_workqueue(ab->qmi.event_wq);
 
 	return ret;
 }
 
+/**
+ * ath11k_qmi_firmware_going_down() - stop handling events of the firmware
+ * @ab: device
+ *
+ * Sets ATH11K_FLAG_FW_DOWN. From now on only server exits are handled, until
+ * ath11k_qmi_firmware_went_down() started a new client and that client found
+ * the server of the next firmware.
+ */
+void ath11k_qmi_firmware_going_down(struct ath11k_base *ab)
+{
+	spin_lock(&ab->qmi.event_lock);
+	ab->qmi.stopping = true;
+	set_bit(ATH11K_FLAG_FW_DOWN, &ab->dev_flags);
+	spin_unlock(&ab->qmi.event_lock);
+}
+
+/**
+ * ath11k_qmi_firmware_went_down() - start the QMI client for the next firmware
+ * @ab: device
+ *
+ * Called after ath11k_qmi_firmware_going_down(), once the transport of the
+ * firmware is gone. The QRTR name server has then been told that the node of
+ * that firmware is gone before the lookup of the new client reaches it, so
+ * the new client only finds servers of a firmware started later. Releasing
+ * the old client afterwards reports the exit of a server it knew.
+ *
+ * The old client can still receive an arrival of the firmware that went
+ * down, so it is never used for the next firmware: if the new client cannot
+ * be set up, every event other than a server exit stays dropped and
+ * ATH11K_FLAG_FW_DOWN stays set until a later shutdown notification sets one
+ * up. Without any client, before
+ * ath11k_qmi_init_service() or after ath11k_qmi_deinit_service(), there is
+ * nothing to restart; a client set up later sends its lookup after this.
+ *
+ * Context: process context, not from the QMI event work.
+ */
+void ath11k_qmi_firmware_went_down(struct ath11k_base *ab)
+{
+	struct ath11k_qmi *qmi = &ab->qmi;
+	struct ath11k_qmi_client *old, *next;
+	bool stopping;
+	int ret;
+
+	mutex_lock(&qmi->client_lock);
+
+	spin_lock(&qmi->event_lock);
+	stopping = qmi->stopping;
+	if (!qmi->client_live)
+		qmi->stopping = false;
+	spin_unlock(&qmi->event_lock);
+
+	if (!stopping || !qmi->client_live)
+		goto unlock;
+
+	old = ath11k_qmi_client(qmi->handle);
+	next = old == &qmi->clients[0] ? &qmi->clients[1] : &qmi->clients[0];
+	next->qmi = qmi;
+	next->gen = ++qmi->last_gen;
+
+	ret = qmi_handle_init(&next->handle, ATH11K_QMI_RESP_LEN_MAX,
+			      &ath11k_qmi_ops, ath11k_qmi_msg_handlers);
+	if (ret < 0) {
+		ath11k_err(ab, "failed to initialize qmi handle, staying down: %d\n",
+			   ret);
+		goto unlock;
+	}
+
+	ret = qmi_add_lookup(&next->handle, QMI_SERVICE_ID_WLFW,
+			     ATH11K_QMI_WLFW_SERVICE_VERS_V01,
+			     qmi->service_ins_id);
+	if (ret < 0) {
+		ath11k_err(ab, "failed to add qmi lookup, staying down: %d\n",
+			   ret);
+		qmi_handle_release(&next->handle);
+		goto unlock;
+	}
+
+	/*
+	 * The next firmware is started only after this notification returns,
+	 * so no event of the new client is posted before it is current.
+	 */
+	ath11k_qmi_set_client(qmi, next, true);
+	qmi_handle_release(&old->handle);
+
+unlock:
+	mutex_unlock(&qmi->client_lock);
+}
+EXPORT_SYMBOL(ath11k_qmi_firmware_went_down);
+
 void ath11k_qmi_deinit_service(struct ath11k_base *ab)
 {
 	struct ath11k_qmi_driver_event *event, *tmp;
 
-	qmi_handle_release(&ab->qmi.handle);
+	/* No client is started after this one is released */
+	mutex_lock(&ab->qmi.client_lock);
+	ab->qmi.client_live = false;
+	qmi_handle_release(ab->qmi.handle);
+	mutex_unlock(&ab->qmi.client_lock);
+
 	cancel_work_sync(&ab->qmi.event_work);
 	destroy_workqueue(ab->qmi.event_wq);
 
diff --git a/drivers/net/wireless/ath/ath11k/qmi.h b/drivers/net/wireless/ath/ath11k/qmi.h
index 350816c81ee5..fac40fa6b5b0 100644
--- a/drivers/net/wireless/ath/ath11k/qmi.h
+++ b/drivers/net/wireless/ath/ath11k/qmi.h
@@ -77,6 +77,8 @@ struct ath11k_qmi_driver_event {
 	struct list_head list;
 	enum ath11k_qmi_event_type type;
 	void *data;
+	/* ath11k_qmi::gen when the event was posted */
+	u32 gen;
 };
 
 struct ath11k_qmi_ce_cfg {
@@ -126,9 +128,21 @@ struct m3_mem_region {
 	void *vaddr;
 };
 
+struct ath11k_qmi;
+
+/* A QMI client, see ath11k_qmi_firmware_went_down() */
+struct ath11k_qmi_client {
+	struct qmi_handle handle;
+	struct ath11k_qmi *qmi;
+	/* stamped into the events the client posts */
+	u32 gen;
+};
+
 struct ath11k_qmi {
 	struct ath11k_base *ab;
-	struct qmi_handle handle;
+	/* handle of the current client */
+	struct qmi_handle *handle;
+	struct ath11k_qmi_client clients[2];
 	struct sockaddr_qrtr sq;
 	struct work_struct event_work;
 	struct workqueue_struct *event_wq;
@@ -144,6 +158,24 @@ struct ath11k_qmi {
 	struct m3_mem_region m3_mem;
 	unsigned int service_ins_id;
 	wait_queue_head_t cold_boot_waitq;
+	/*
+	 * Under event_lock: gen of the current client, and stopping from
+	 * ath11k_qmi_firmware_going_down() until ath11k_qmi_firmware_went_down()
+	 * set the client for the next firmware.
+	 */
+	u32 gen;
+	bool stopping;
+	/*
+	 * client_lock serialises ath11k_qmi_init_service(),
+	 * ath11k_qmi_firmware_went_down() and ath11k_qmi_deinit_service();
+	 * client_live is set while a client exists.
+	 */
+	struct mutex client_lock;
+	u32 last_gen;
+	bool client_live;
+	/* protects txn_waiters, see ath11k_qmi_abort_txns() */
+	spinlock_t txn_wait_lock;
+	struct list_head txn_waiters;
 };
 
 #define QMI_WLANFW_HOST_CAP_REQ_MSG_V01_MAX_LEN		261
@@ -517,6 +549,10 @@ struct qmi_wlanfw_wlan_ini_resp_msg_v01 {
 int ath11k_qmi_firmware_start(struct ath11k_base *ab,
 			      u32 mode);
 void ath11k_qmi_firmware_stop(struct ath11k_base *ab);
+void ath11k_qmi_abort_txns(struct ath11k_base *ab);
+void ath11k_qmi_init_state(struct ath11k_base *ab);
+void ath11k_qmi_firmware_going_down(struct ath11k_base *ab);
+void ath11k_qmi_firmware_went_down(struct ath11k_base *ab);
 void ath11k_qmi_deinit_service(struct ath11k_base *ab);
 int ath11k_qmi_init_service(struct ath11k_base *ab);
 void ath11k_qmi_free_resource(struct ath11k_base *ab);
diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index 82b8481ba818..467def051155 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -304,14 +304,16 @@ static int ath11k_wmi_cmd_send_nowait(struct ath11k_pdev_wmi *wmi, struct sk_buf
 }
 
 /*
- * While the firmware restarts, only the restart work talks to it.
- * Tested on every try, so that a sender which already waits for a
- * credit or a CE descriptor when the firmware crashes is held back too.
+ * While the firmware restarts, only the restart work talks to it, and
+ * nobody talks to a firmware that is going down. Tested on every try, so
+ * that a sender which already waits for a credit or a CE descriptor when
+ * the firmware crashes is held back too.
  */
 static bool ath11k_wmi_cmd_held_back(struct ath11k_base *ab)
 {
-	return test_bit(ATH11K_FLAG_RECOVERY, &ab->dev_flags) &&
-	       current_work() != &ab->restart_work;
+	return test_bit(ATH11K_FLAG_FW_DOWN, &ab->dev_flags) ||
+	       (test_bit(ATH11K_FLAG_RECOVERY, &ab->dev_flags) &&
+		current_work() != &ab->restart_work);
 }
 
 int ath11k_wmi_cmd_send(struct ath11k_pdev_wmi *wmi, struct sk_buff *skb,
@@ -4426,10 +4428,12 @@ int ath11k_wmi_pdev_lro_cfg(struct ath11k *ar,
 
 int ath11k_wmi_wait_for_service_ready(struct ath11k_base *ab)
 {
-	unsigned long time_left;
+	long time_left;
 
-	time_left = wait_for_completion_timeout(&ab->wmi_ab.service_ready,
-						WMI_SERVICE_READY_TIMEOUT_HZ);
+	time_left = ath11k_core_wait_for_fw(ab, &ab->wmi_ab.service_ready,
+					    WMI_SERVICE_READY_TIMEOUT_HZ);
+	if (time_left < 0)
+		return time_left;
 	if (!time_left)
 		return -ETIMEDOUT;
 
@@ -4438,10 +4442,12 @@ int ath11k_wmi_wait_for_service_ready(struct ath11k_base *ab)
 
 int ath11k_wmi_wait_for_unified_ready(struct ath11k_base *ab)
 {
-	unsigned long time_left;
+	long time_left;
 
-	time_left = wait_for_completion_timeout(&ab->wmi_ab.unified_ready,
-						WMI_SERVICE_READY_TIMEOUT_HZ);
+	time_left = ath11k_core_wait_for_fw(ab, &ab->wmi_ab.unified_ready,
+					    WMI_SERVICE_READY_TIMEOUT_HZ);
+	if (time_left < 0)
+		return time_left;
 	if (!time_left)
 		return -ETIMEDOUT;
 
@@ -9330,8 +9336,8 @@ int ath11k_wmi_attach(struct ath11k_base *ab)
 		ab->wmi_ab.preferred_hw_mode = WMI_HOST_HW_MODE_SINGLE;
 
 	/* TODO: Init remaining wmi soc resources required */
-	init_completion(&ab->wmi_ab.service_ready);
-	init_completion(&ab->wmi_ab.unified_ready);
+	reinit_completion(&ab->wmi_ab.service_ready);
+	reinit_completion(&ab->wmi_ab.unified_ready);
 
 	return 0;
 }
-- 
2.53.0


