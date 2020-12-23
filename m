Return-Path: <SRS0=zJ/X=F3=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2BBBC433E0
	for <ath11k@archiver.kernel.org>; Wed, 23 Dec 2020 03:02:49 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AA80E206F6
	for <ath11k@archiver.kernel.org>; Wed, 23 Dec 2020 03:02:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AA80E206F6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FKyDFJ/iHdl9a4mQsO47pnZNnP5bGfqmljv/PzUOw3Y=; b=g+B9Y0VmAmGIv1de3+MxtaqkrL
	cYgBDEMuQVMU42xWmJMPE/EGuRwBO5aJViGhqRvbYQ7FO3E+hGf23LLP8mHASgH3soGuXkAcCHxhb
	Ir441GyWLgWGFqZzXCwXRXfyIVo4Maa43nhgnr//fKhqOionGcklLIQ4b5rkNdJ6XaugM45Flw5hp
	hzryHe5Yr/KMp0abatHcQjRdknBLyzLIi+cUAzpSDXG6PAKAbLwsT9HphaRA5qa5KfxMNyaqh9gBB
	Etcy4cw8oEvm0/VLDAupMzVnyxdcdywmyRcQ8t4LBM8OEnrLoeU9zNQ7q7FbuS53r+CWcXdGojJ1X
	2mDllSZA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kruQH-0007PU-6b; Wed, 23 Dec 2020 03:02:45 +0000
Received: from m43-15.mailgun.net ([69.72.43.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kruQF-0007Oz-3V
 for ath11k@lists.infradead.org; Wed, 23 Dec 2020 03:02:44 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1608692561; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=D//0rv0+DTFzCHUv53O05xsa9znVG9Zb94F5OfTUhIc=;
 b=JA+gqwdPdX0KhENefvfYSlOB5QSpN9eG/p1V2r6rXrPGUUNH1whk3MuItbWyAHBprhTt1iOr
 vifImNl+ZYTI7nGCfGEzlE8oZ5gcLdl5exm8DjdyFjcgb3Cgfr5DGD4iUfmdVyecfHPa8meb
 lhUB6ljQzWeFO7r70Y8B+II8IfM=
X-Mailgun-Sending-Ip: 69.72.43.15
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 5fe2b351120d248bb5206fbc (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 23 Dec 2020 03:02:40
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 34188C43461; Wed, 23 Dec 2020 03:02:40 +0000 (UTC)
Received: from cjhuang-Inspiron-7590.qca.qualcomm.com (unknown [180.166.53.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: cjhuang)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id D0B4CC433CA;
 Wed, 23 Dec 2020 03:02:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org D0B4CC433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=cjhuang@codeaurora.org
From: Carl Huang <cjhuang@codeaurora.org>
To: ath11k@lists.infradead.org
Subject: [PATCH 5/6] ath11k: supports one MSI vector
Date: Tue, 22 Dec 2020 22:02:24 -0500
Message-Id: <20201223030225.2345-6-cjhuang@codeaurora.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201223030225.2345-1-cjhuang@codeaurora.org>
References: <20201223030225.2345-1-cjhuang@codeaurora.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201222_220243_192021_79367D8A 
X-CRM114-Status: GOOD (  22.59  )
X-BeenThere: ath11k@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Cc: linux-wireless@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Some platforms can't allocate 32 MSI vectors to QCA6390, and QCA6390
will request one MSI vector instead.

In case of one MSI vector, interrupt migration needs to be disabled.
This is because when interrupt migration happens, the msi_data may
change. However, msi_data is already programmed to rings during
initial phase and ath11k has no way to know that msi_data is changed
during run time and reprogram again.

In case of one MSI vector, MHI subsystem should not use IRQF_NO_SUSPEND
as QCA6390 doesn't set this flag too. Ath11k doesn't need to leave
IRQ enabled in suspend state.

Tested-on: QCA6390 hw2.0 PCI WLAN.HST.1.0.1-01740-QCAHSTSWPLZ_V2_TO_X86-1

Signed-off-by: Carl Huang <cjhuang@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/mhi.c | 13 ++++++--
 drivers/net/wireless/ath/ath11k/pci.c | 59 +++++++++++++++++++++++++++--------
 2 files changed, 57 insertions(+), 15 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/mhi.c b/drivers/net/wireless/ath/ath11k/mhi.c
index 09858e5..2d35309 100644
--- a/drivers/net/wireless/ath/ath11k/mhi.c
+++ b/drivers/net/wireless/ath/ath11k/mhi.c
@@ -152,14 +152,17 @@ static int ath11k_mhi_get_msi(struct ath11k_pci *ab_pci)
 {
 	struct ath11k_base *ab = ab_pci->ab;
 	u32 user_base_data, base_vector;
+	u32 vectors_32_capability;
 	int ret, num_vectors, i;
 	int *irq;
+	unsigned int msi_data;
 
 	ret = ath11k_pci_get_user_msi_assignment(ab_pci,
 						 "MHI", &num_vectors,
 						 &user_base_data, &base_vector);
 	if (ret)
 		return ret;
+	vectors_32_capability = ab_pci->vectors_32_capability;
 
 	ath11k_dbg(ab, ATH11K_DBG_PCI, "Number of assigned MSI for MHI is %d, base vector is %d\n",
 		   num_vectors, base_vector);
@@ -168,9 +171,13 @@ static int ath11k_mhi_get_msi(struct ath11k_pci *ab_pci)
 	if (!irq)
 		return -ENOMEM;
 
-	for (i = 0; i < num_vectors; i++)
+	for (i = 0; i < num_vectors; i++) {
+		msi_data = vectors_32_capability ?
+			   i + base_vector : base_vector;
+
 		irq[i] = ath11k_pci_get_msi_irq(ab->dev,
-						base_vector + i);
+						msi_data);
+	}
 
 	ab_pci->mhi_ctrl->irq = irq;
 	ab_pci->mhi_ctrl->nr_irqs = num_vectors;
@@ -243,6 +250,8 @@ int ath11k_mhi_register(struct ath11k_pci *ab_pci)
 		return ret;
 	}
 
+	if (!ab_pci->vectors_32_capability)
+		mhi_ctrl->irq_flags = IRQF_SHARED | IRQF_NOBALANCING;
 	mhi_ctrl->iova_start = 0;
 	mhi_ctrl->iova_stop = 0xffffffff;
 	mhi_ctrl->sbl_size = SZ_512K;
diff --git a/drivers/net/wireless/ath/ath11k/pci.c b/drivers/net/wireless/ath/ath11k/pci.c
index 5fdfc72..a120d7c 100644
--- a/drivers/net/wireless/ath/ath11k/pci.c
+++ b/drivers/net/wireless/ath/ath11k/pci.c
@@ -62,6 +62,17 @@ static const struct ath11k_msi_config msi_config = {
 	},
 };
 
+static const struct ath11k_msi_config msi_config_one_msi = {
+	.total_vectors = 1,
+	.total_users = 4,
+	.users = (struct ath11k_msi_user[]) {
+		{ .name = "MHI", .num_vectors = 3, .base_vector = 0 },
+		{ .name = "CE", .num_vectors = 1, .base_vector = 0 },
+		{ .name = "WAKE", .num_vectors = 1, .base_vector = 0 },
+		{ .name = "DP", .num_vectors = 1, .base_vector = 0 },
+	},
+};
+
 static const char *irq_name[ATH11K_IRQ_NUM_MAX] = {
 	"bhi",
 	"mhi-er0",
@@ -530,10 +541,11 @@ static void ath11k_pci_sync_ce_irqs(struct ath11k_base *ab)
 static void ath11k_pci_ce_tasklet(struct tasklet_struct *t)
 {
 	struct ath11k_ce_pipe *ce_pipe = from_tasklet(ce_pipe, t, intr_tq);
+	int irq_idx = ATH11K_PCI_IRQ_CE0_OFFSET + ce_pipe->pipe_num;
 
 	ath11k_ce_per_engine_service(ce_pipe->ab, ce_pipe->pipe_num);
 
-	ath11k_pci_ce_irq_enable(ce_pipe->ab, ce_pipe->pipe_num);
+	enable_irq(ce_pipe->ab->irq_num[irq_idx]);
 }
 
 static irqreturn_t ath11k_pci_ce_interrupt_handler(int irq, void *arg)
@@ -541,10 +553,13 @@ static irqreturn_t ath11k_pci_ce_interrupt_handler(int irq, void *arg)
 	struct ath11k_ce_pipe *ce_pipe = arg;
 	struct ath11k_base *ab = ce_pipe->ab;
 
+	int irq_idx = ATH11K_PCI_IRQ_CE0_OFFSET + ce_pipe->pipe_num;
+
 	if (!ab->ce_irq_enabled_flag)
 		return IRQ_HANDLED;
 
-	ath11k_pci_ce_irq_disable(ce_pipe->ab, ce_pipe->pipe_num);
+	disable_irq_nosync(ab->irq_num[irq_idx]);
+
 	tasklet_schedule(&ce_pipe->intr_tq);
 
 	return IRQ_HANDLED;
@@ -638,11 +653,13 @@ static int ath11k_pci_ext_grp_napi_poll(struct napi_struct *napi, int budget)
 						napi);
 	struct ath11k_base *ab = irq_grp->ab;
 	int work_done;
+	int i;
 
 	work_done = ath11k_dp_service_srng(ab, irq_grp, budget);
 	if (work_done < budget) {
 		napi_complete_done(napi, work_done);
-		ath11k_pci_ext_grp_enable(irq_grp);
+		for (i = 0; i < irq_grp->num_irq; i++)
+			enable_irq(irq_grp->ab->irq_num[irq_grp->irqs[i]]);
 	}
 
 	if (work_done > budget)
@@ -654,13 +671,15 @@ static int ath11k_pci_ext_grp_napi_poll(struct napi_struct *napi, int budget)
 static irqreturn_t ath11k_pci_ext_interrupt_handler(int irq, void *arg)
 {
 	struct ath11k_ext_irq_grp *irq_grp = arg;
+	int i;
 
 	if (!irq_grp->ab->ext_irq_enabled_flag)
 		return IRQ_HANDLED;
 
 	ath11k_dbg(irq_grp->ab, ATH11K_DBG_PCI, "ext irq:%d\n", irq);
 
-	ath11k_pci_ext_grp_disable(irq_grp);
+	for (i = 0; i < irq_grp->num_irq; i++)
+		disable_irq_nosync(irq_grp->ab->irq_num[irq_grp->irqs[i]]);
 
 	napi_schedule(&irq_grp->napi);
 
@@ -747,6 +766,7 @@ static int ath11k_pci_config_irq(struct ath11k_base *ab)
 	/* Configure CE irqs */
 	for (i = 0; i < ab->hw_params.ce_count; i++) {
 		msi_data = (i % msi_data_count) + msi_irq_start;
+
 		irq = ath11k_pci_get_msi_irq(ab->dev, msi_data);
 		ce_pipe = &ab->ce.ce_pipe[i];
 
@@ -813,6 +833,14 @@ static void ath11k_pci_init_irq_handlers(struct ath11k_pci *ab_pci, bool multipl
 		ab_pci->ce_irq_disable = ath11k_pci_ce_irq_disable_multiple_msi;
 		ab_pci->msi_config = &msi_config;
 		ab_pci->irq_flags = IRQF_SHARED;
+	} else {
+		ab_pci->vectors_32_capability = false;
+		ab_pci->ext_grp_enable = NULL;
+		ab_pci->ext_grp_disable = NULL;
+		ab_pci->ce_irq_enable = NULL;
+		ab_pci->ce_irq_disable = NULL;
+		ab_pci->msi_config = &msi_config_one_msi;
+		ab_pci->irq_flags = IRQF_SHARED | IRQF_NOBALANCING;
 	}
 }
 
@@ -827,16 +855,20 @@ static int ath11k_pci_enable_msi(struct ath11k_pci *ab_pci)
 					    msi_config.total_vectors,
 					    msi_config.total_vectors,
 					    PCI_IRQ_MSI);
-	if (num_vectors != msi_config.total_vectors) {
-		ath11k_err(ab, "failed to get %d MSI vectors, only %d available",
-			   msi_config.total_vectors, num_vectors);
-
-		if (num_vectors >= 0)
-			return -EINVAL;
-		else
-			return num_vectors;
-	} else {
+
+	if (num_vectors == msi_config.total_vectors) {
 		ath11k_pci_init_irq_handlers(ab_pci, true);
+	} else {
+		num_vectors = pci_alloc_irq_vectors(ab_pci->pdev,
+						    1,
+						    1,
+						    PCI_IRQ_MSI);
+		if (num_vectors < 0) {
+			ret = -EINVAL;
+			goto reset_msi_config;
+		}
+		ath11k_pci_init_irq_handlers(ab_pci, false);
+		ath11k_dbg(ab, ATH11K_DBG_PCI, "request MSI one vector\n");
 	}
 
 	msi_desc = irq_get_msi_desc(ab_pci->pdev->irq);
@@ -857,6 +889,7 @@ static int ath11k_pci_enable_msi(struct ath11k_pci *ab_pci)
 free_msi_vector:
 	pci_free_irq_vectors(ab_pci->pdev);
 
+reset_msi_config:
 	return ret;
 }
 
-- 
2.7.4


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
