Return-Path: <SRS0=zJ/X=F3=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 349FBC433E0
	for <ath11k@archiver.kernel.org>; Wed, 23 Dec 2020 03:03:03 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EEF51206D6
	for <ath11k@archiver.kernel.org>; Wed, 23 Dec 2020 03:03:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EEF51206D6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oeQR/c9VbES7fqSw54HPnm0q53Y0/GxcNBsES/+mMOE=; b=n8Itds6tyCOPpcvoL4aFpq9mei
	n3zD4XY2IhR/ocWbEGqgOlc6ARAEJ3WEQp2t0l6d7X3pr99sk+4o54TvBIuTGKwM4Cqth0dLCOWXc
	72xNuruWs/qL/12HnkuvuPjWXEgkY8fIynBtOlXlfw0skfLNterg2/WI5urU4N8y9LaUbApXIUjKI
	/Zt9uI96NZm5nokyr0BLlby+cn9fCHLyQz3byxblWTjnNNvy1nC6dq6aJRzCV/9r/yVJgHsjmRfiG
	P310IPdN2ztNeLOWFVkSJisRG1AFmFVyrmDffHTwjTno5ojpMSFGIlWByjYlptGGFr366n32YpV+D
	SYGzhQJA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kruQW-0007RB-3T; Wed, 23 Dec 2020 03:03:00 +0000
Received: from m43-15.mailgun.net ([69.72.43.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kruQT-0007Oz-NW
 for ath11k@lists.infradead.org; Wed, 23 Dec 2020 03:02:59 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1608692578; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=ot/0oZtbqe97y4llOrqDK7mhoYrcCMKkAUi3OEmnWu8=;
 b=ROzNPS8BLndUbCTb15xtAkEy/VLKp1otL8uC7Xb6kl0rBB+PVdqtiiGO5vPuUzBpQV+aKibr
 HuOgSk/yzdjQG9fsIn5+4og05Fjrv4uGQSH2/n1LAEou+MzgeZUkFyCLEFLq+qt9FuTUmbIO
 y8oEdmTbgi3ljwXRZNA2AGwI82o=
X-Mailgun-Sending-Ip: 69.72.43.15
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 5fe2b34ccfd94dd328a97a42 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 23 Dec 2020 03:02:36
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 3C313C433CA; Wed, 23 Dec 2020 03:02:36 +0000 (UTC)
Received: from cjhuang-Inspiron-7590.qca.qualcomm.com (unknown [180.166.53.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: cjhuang)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 0FBB0C43461;
 Wed, 23 Dec 2020 03:02:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 0FBB0C43461
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=cjhuang@codeaurora.org
From: Carl Huang <cjhuang@codeaurora.org>
To: ath11k@lists.infradead.org
Subject: [PATCH 2/6] ath11k: add ce and ext irq flag to indicate irq_handler
Date: Tue, 22 Dec 2020 22:02:21 -0500
Message-Id: <20201223030225.2345-3-cjhuang@codeaurora.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201223030225.2345-1-cjhuang@codeaurora.org>
References: <20201223030225.2345-1-cjhuang@codeaurora.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201222_220258_495000_9CD1DA64 
X-CRM114-Status: GOOD (  15.54  )
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

This change adds two flags to indicate whether irq handler for CE
and dp can be called. This is because in one MSI vector case,
interrupt is not disabled in hif_stop and hif_irq_disable. Otherwise,
MHI interrupt is disabled too.

Tested-on: QCA6390 hw2.0 PCI WLAN.HST.1.0.1-01740-QCAHSTSWPLZ_V2_TO_X86-1

Signed-off-by: Carl Huang <cjhuang@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/core.h |  2 ++
 drivers/net/wireless/ath/ath11k/pci.c  | 13 +++++++++++++
 2 files changed, 15 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/core.h b/drivers/net/wireless/ath/ath11k/core.h
index 799bf3d..3dacca5 100644
--- a/drivers/net/wireless/ath/ath11k/core.h
+++ b/drivers/net/wireless/ath/ath11k/core.h
@@ -741,6 +741,8 @@ struct ath11k_base {
 
 	struct completion htc_suspend;
 
+	bool ce_irq_enabled_flag;
+	bool ext_irq_enabled_flag;
 	/* must be last */
 	u8 drv_priv[0] __aligned(sizeof(void *));
 };
diff --git a/drivers/net/wireless/ath/ath11k/pci.c b/drivers/net/wireless/ath/ath11k/pci.c
index c1ae1df..deb2d47 100644
--- a/drivers/net/wireless/ath/ath11k/pci.c
+++ b/drivers/net/wireless/ath/ath11k/pci.c
@@ -487,6 +487,8 @@ static void ath11k_pci_ce_irqs_disable(struct ath11k_base *ab)
 {
 	int i;
 
+	ab->ce_irq_enabled_flag = false;
+
 	for (i = 0; i < ab->hw_params.ce_count; i++) {
 		if (ath11k_ce_get_attr_flags(ab, i) & CE_ATTR_DIS_INTR)
 			continue;
@@ -521,6 +523,9 @@ static irqreturn_t ath11k_pci_ce_interrupt_handler(int irq, void *arg)
 {
 	struct ath11k_ce_pipe *ce_pipe = arg;
 
+	if (!ab->ce_irq_enabled_flag)
+		return IRQ_HANDLED;
+
 	ath11k_pci_ce_irq_disable(ce_pipe->ab, ce_pipe->pipe_num);
 	tasklet_schedule(&ce_pipe->intr_tq);
 
@@ -539,6 +544,8 @@ static void __ath11k_pci_ext_irq_disable(struct ath11k_base *sc)
 {
 	int i;
 
+	ab->ext_irq_enabled_flag = false;
+
 	for (i = 0; i < ATH11K_EXT_IRQ_GRP_NUM_MAX; i++) {
 		struct ath11k_ext_irq_grp *irq_grp = &sc->ext_irq_grp[i];
 
@@ -561,6 +568,8 @@ static void ath11k_pci_ext_irq_enable(struct ath11k_base *ab)
 {
 	int i;
 
+	ab->ext_irq_enabled_flag = true;
+
 	for (i = 0; i < ATH11K_EXT_IRQ_GRP_NUM_MAX; i++) {
 		struct ath11k_ext_irq_grp *irq_grp = &ab->ext_irq_grp[i];
 
@@ -613,6 +622,9 @@ static irqreturn_t ath11k_pci_ext_interrupt_handler(int irq, void *arg)
 {
 	struct ath11k_ext_irq_grp *irq_grp = arg;
 
+	if (!irq_grp->ab->ext_irq_enabled_flag)
+		return IRQ_HANDLED;
+
 	ath11k_dbg(irq_grp->ab, ATH11K_DBG_PCI, "ext irq:%d\n", irq);
 
 	ath11k_pci_ext_grp_disable(irq_grp);
@@ -1026,6 +1038,7 @@ static int ath11k_pci_start(struct ath11k_base *ab)
 	set_bit(ATH11K_PCI_FLAG_INIT_DONE, &ab_pci->flags);
 
 	ath11k_pci_aspm_restore(ab_pci);
+	ab->ce_irq_enabled_flag = true;
 
 	ath11k_pci_ce_irqs_enable(ab);
 	ath11k_ce_rx_post_buf(ab);
-- 
2.7.4


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
