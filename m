Return-Path: <SRS0=zJ/X=F3=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA24AC433E6
	for <ath11k@archiver.kernel.org>; Wed, 23 Dec 2020 03:03:15 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5D8D1206D6
	for <ath11k@archiver.kernel.org>; Wed, 23 Dec 2020 03:03:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5D8D1206D6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F5PSpEBnwEKWVrVz1rSTIrvEgW2ZqzX7r6nmCu+qDuQ=; b=YzwgS+fGZS+kl6+A5tX2+1pBGp
	EZVlH8+/x1pc5pZmnCKWpZhOsAXtxRmZFKGyqLzUV4Ls27LIozm1wyqtHLPdrPbViNE1r2IK+lNv1
	Y0lCYTy98ozGIV+w73EjXX8TEGMsLNwFgZP04Aa4M4qjTboD8ZkiZjaCvrwkOgfatdnRgF0RIgnKs
	feP+P0yeNr3RE4aC452kQxAW/pWF+uIzAKZ/9vlosivqWFRHW0CkUC6GJwaC2hiSdn5h+POwebaBK
	ki6X+gfztHS0JAdBowUhbE8LYnt7NR5wdOqi50D8SQZdfyCdj7bCcLsEv/Qharhbw7yUlYRfrf51T
	dci0uGxA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kruQi-0007U7-Ie; Wed, 23 Dec 2020 03:03:12 +0000
Received: from so254-31.mailgun.net ([198.61.254.31])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kruQc-0007SK-RG
 for ath11k@lists.infradead.org; Wed, 23 Dec 2020 03:03:11 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1608692590; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=Ajak34ilWQmo6t8B5KqoUXLNg482jMWLLBB1xyigpZs=;
 b=k/PURcu9sjI7AYiM8FMPL4mU7kEt4z00aVXiYH/QqhztZ3DistIpEUApuEn1Tfixos5RbMA4
 PlKgzW2+mE23IZJpS1zd9ymVhr87xTDPeZh7wXclNnDMGpGK/qWHivLSfILEDRmDT1wfUvTA
 WX+HNlSOSElLurIu5rhpw/Vbd/s=
X-Mailgun-Sending-Ip: 198.61.254.31
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 5fe2b34fb00c0d7ad4a76c58 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 23 Dec 2020 03:02:39
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id EAF0EC43466; Wed, 23 Dec 2020 03:02:38 +0000 (UTC)
Received: from cjhuang-Inspiron-7590.qca.qualcomm.com (unknown [180.166.53.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: cjhuang)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 8F60FC43461;
 Wed, 23 Dec 2020 03:02:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 8F60FC43461
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=cjhuang@codeaurora.org
From: Carl Huang <cjhuang@codeaurora.org>
To: ath11k@lists.infradead.org
Subject: [PATCH 4/6] ath11k: refactor mulitple msi vector implementation
Date: Tue, 22 Dec 2020 22:02:23 -0500
Message-Id: <20201223030225.2345-5-cjhuang@codeaurora.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201223030225.2345-1-cjhuang@codeaurora.org>
References: <20201223030225.2345-1-cjhuang@codeaurora.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201222_220310_493375_A5D71DAE 
X-CRM114-Status: GOOD (  19.02  )
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

This is to prepare for one msi vector support.
Irq enable and disable functions of ce and dp are wrapped.

Tested-on: QCA6390 hw2.0 PCI WLAN.HST.1.0.1-01740-QCAHSTSWPLZ_V2_TO_X86-1

Signed-off-by: Carl Huang <cjhuang@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/pci.c | 86 +++++++++++++++++++++++++++--------
 drivers/net/wireless/ath/ath11k/pci.h |  8 ++++
 2 files changed, 75 insertions(+), 19 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/pci.c b/drivers/net/wireless/ath/ath11k/pci.c
index 7ec2209..5fdfc72 100644
--- a/drivers/net/wireless/ath/ath11k/pci.c
+++ b/drivers/net/wireless/ath/ath11k/pci.c
@@ -406,17 +406,18 @@ int ath11k_pci_get_user_msi_assignment(struct ath11k_pci *ab_pci, char *user_nam
 				       int *num_vectors, u32 *user_base_data,
 				       u32 *base_vector)
 {
+	const struct ath11k_msi_config *msi_config = ab_pci->msi_config;
 	struct ath11k_base *ab = ab_pci->ab;
 	int idx;
 
-	for (idx = 0; idx < msi_config.total_users; idx++) {
-		if (strcmp(user_name, msi_config.users[idx].name) == 0) {
-			*num_vectors = msi_config.users[idx].num_vectors;
-			*user_base_data = msi_config.users[idx].base_vector
-				+ ab_pci->msi_ep_base_data;
-			*base_vector = msi_config.users[idx].base_vector;
+	for (idx = 0; idx < msi_config->total_users; idx++) {
+		if (strcmp(user_name, msi_config->users[idx].name) == 0) {
+			*num_vectors = msi_config->users[idx].num_vectors;
+			*base_vector =  msi_config->users[idx].base_vector;
+			*user_base_data = *base_vector + ab_pci->msi_ep_base_data;
 
-			ath11k_dbg(ab, ATH11K_DBG_PCI, "Assign MSI to user: %s, num_vectors: %d, user_base_data: %u, base_vector: %u\n",
+			ath11k_dbg(ab, ATH11K_DBG_PCI,
+				   "Assign MSI to user: %s, num_vectors: %d, user_base_data: %u, base_vector: %u\n",
 				   user_name, *num_vectors, *user_base_data,
 				   *base_vector);
 
@@ -468,7 +469,7 @@ static void ath11k_pci_free_irq(struct ath11k_base *ab)
 	ath11k_pci_free_ext_irq(ab);
 }
 
-static void ath11k_pci_ce_irq_enable(struct ath11k_base *ab, u16 ce_id)
+static void ath11k_pci_ce_irq_enable_multiple_msi(struct ath11k_base *ab, u16 ce_id)
 {
 	u32 irq_idx;
 
@@ -476,7 +477,15 @@ static void ath11k_pci_ce_irq_enable(struct ath11k_base *ab, u16 ce_id)
 	enable_irq(ab->irq_num[irq_idx]);
 }
 
-static void ath11k_pci_ce_irq_disable(struct ath11k_base *ab, u16 ce_id)
+static void ath11k_pci_ce_irq_enable(struct ath11k_base *ab, u16 ce_id)
+{
+	struct ath11k_pci *ab_pci = ath11k_pci_priv(ab);
+
+	if (ab_pci->ce_irq_enable)
+		ab_pci->ce_irq_enable(ab, ce_id);
+}
+
+static void ath11k_pci_ce_irq_disable_multiple_msi(struct ath11k_base *ab, u16 ce_id)
 {
 	u32 irq_idx;
 
@@ -484,12 +493,19 @@ static void ath11k_pci_ce_irq_disable(struct ath11k_base *ab, u16 ce_id)
 	disable_irq_nosync(ab->irq_num[irq_idx]);
 }
 
+static void ath11k_pci_ce_irq_disable(struct ath11k_base *ab, u16 ce_id)
+{
+	struct ath11k_pci *ab_pci = ath11k_pci_priv(ab);
+
+	if (ab_pci->ce_irq_disable)
+		ab_pci->ce_irq_disable(ab, ce_id);
+}
+
 static void ath11k_pci_ce_irqs_disable(struct ath11k_base *ab)
 {
 	int i;
 
 	ab->ce_irq_enabled_flag = false;
-
 	for (i = 0; i < ab->hw_params.ce_count; i++) {
 		if (ath11k_ce_get_attr_flags(ab, i) & CE_ATTR_DIS_INTR)
 			continue;
@@ -523,6 +539,7 @@ static void ath11k_pci_ce_tasklet(struct tasklet_struct *t)
 static irqreturn_t ath11k_pci_ce_interrupt_handler(int irq, void *arg)
 {
 	struct ath11k_ce_pipe *ce_pipe = arg;
+	struct ath11k_base *ab = ce_pipe->ab;
 
 	if (!ab->ce_irq_enabled_flag)
 		return IRQ_HANDLED;
@@ -533,7 +550,7 @@ static irqreturn_t ath11k_pci_ce_interrupt_handler(int irq, void *arg)
 	return IRQ_HANDLED;
 }
 
-static void ath11k_pci_ext_grp_disable(struct ath11k_ext_irq_grp *irq_grp)
+static void ath11k_pci_ext_grp_disable_multiple_msi(struct ath11k_ext_irq_grp *irq_grp)
 {
 	int i;
 
@@ -541,14 +558,21 @@ static void ath11k_pci_ext_grp_disable(struct ath11k_ext_irq_grp *irq_grp)
 		disable_irq_nosync(irq_grp->ab->irq_num[irq_grp->irqs[i]]);
 }
 
-static void __ath11k_pci_ext_irq_disable(struct ath11k_base *sc)
+static void ath11k_pci_ext_grp_disable(struct ath11k_ext_irq_grp *irq_grp)
+{
+	struct ath11k_pci *ab_pci = ath11k_pci_priv(irq_grp->ab);
+
+	if (ab_pci->ext_grp_disable)
+		ab_pci->ext_grp_disable(irq_grp);
+}
+
+static void __ath11k_pci_ext_irq_disable(struct ath11k_base *ab)
 {
 	int i;
 
 	ab->ext_irq_enabled_flag = false;
-
 	for (i = 0; i < ATH11K_EXT_IRQ_GRP_NUM_MAX; i++) {
-		struct ath11k_ext_irq_grp *irq_grp = &sc->ext_irq_grp[i];
+		struct ath11k_ext_irq_grp *irq_grp = &ab->ext_irq_grp[i];
 
 		ath11k_pci_ext_grp_disable(irq_grp);
 
@@ -557,7 +581,7 @@ static void __ath11k_pci_ext_irq_disable(struct ath11k_base *sc)
 	}
 }
 
-static void ath11k_pci_ext_grp_enable(struct ath11k_ext_irq_grp *irq_grp)
+static void ath11k_pci_ext_grp_enable_multiple_msi(struct ath11k_ext_irq_grp *irq_grp)
 {
 	int i;
 
@@ -565,6 +589,14 @@ static void ath11k_pci_ext_grp_enable(struct ath11k_ext_irq_grp *irq_grp)
 		enable_irq(irq_grp->ab->irq_num[irq_grp->irqs[i]]);
 }
 
+static void ath11k_pci_ext_grp_enable(struct ath11k_ext_irq_grp *irq_grp)
+{
+	struct ath11k_pci *ab_pci = ath11k_pci_priv(irq_grp->ab);
+
+	if (ab_pci->ext_grp_enable)
+		ab_pci->ext_grp_enable(irq_grp);
+}
+
 static void ath11k_pci_ext_irq_enable(struct ath11k_base *ab)
 {
 	int i;
@@ -637,6 +669,7 @@ static irqreturn_t ath11k_pci_ext_interrupt_handler(int irq, void *arg)
 
 static int ath11k_pci_ext_irq_config(struct ath11k_base *ab)
 {
+	struct ath11k_pci *ab_pci = ath11k_pci_priv(ab);
 	int i, j, ret, num_vectors = 0;
 	u32 user_base_data = 0, base_vector = 0;
 
@@ -681,16 +714,15 @@ static int ath11k_pci_ext_irq_config(struct ath11k_base *ab)
 			ath11k_dbg(ab, ATH11K_DBG_PCI,
 				   "irq:%d group:%d\n", irq, i);
 			ret = request_irq(irq, ath11k_pci_ext_interrupt_handler,
-					  IRQF_SHARED,
+					  ab_pci->irq_flags,
 					  "DP_EXT_IRQ", irq_grp);
 			if (ret) {
 				ath11k_err(ab, "failed request irq %d: %d\n",
 					   vector, ret);
 				return ret;
 			}
-
-			disable_irq_nosync(ab->irq_num[irq_idx]);
 		}
+		ath11k_pci_ext_grp_disable(irq_grp);
 	}
 
 	return 0;
@@ -698,6 +730,7 @@ static int ath11k_pci_ext_irq_config(struct ath11k_base *ab)
 
 static int ath11k_pci_config_irq(struct ath11k_base *ab)
 {
+	struct ath11k_pci *ab_pci = ath11k_pci_priv(ab);
 	struct ath11k_ce_pipe *ce_pipe;
 	u32 msi_data_start;
 	u32 msi_data_count;
@@ -725,7 +758,7 @@ static int ath11k_pci_config_irq(struct ath11k_base *ab)
 		tasklet_setup(&ce_pipe->intr_tq, ath11k_pci_ce_tasklet);
 
 		ret = request_irq(irq, ath11k_pci_ce_interrupt_handler,
-				  IRQF_SHARED, irq_name[irq_idx],
+				  ab_pci->irq_flags, irq_name[irq_idx],
 				  ce_pipe);
 		if (ret) {
 			ath11k_err(ab, "failed to request irq %d: %d\n",
@@ -770,6 +803,19 @@ static void ath11k_pci_ce_irqs_enable(struct ath11k_base *ab)
 	}
 }
 
+static void ath11k_pci_init_irq_handlers(struct ath11k_pci *ab_pci, bool multiple_msi)
+{
+	if (multiple_msi) {
+		ab_pci->vectors_32_capability = true;
+		ab_pci->ext_grp_enable = ath11k_pci_ext_grp_enable_multiple_msi;
+		ab_pci->ext_grp_disable = ath11k_pci_ext_grp_disable_multiple_msi;
+		ab_pci->ce_irq_enable = ath11k_pci_ce_irq_enable_multiple_msi;
+		ab_pci->ce_irq_disable = ath11k_pci_ce_irq_disable_multiple_msi;
+		ab_pci->msi_config = &msi_config;
+		ab_pci->irq_flags = IRQF_SHARED;
+	}
+}
+
 static int ath11k_pci_enable_msi(struct ath11k_pci *ab_pci)
 {
 	struct ath11k_base *ab = ab_pci->ab;
@@ -789,6 +835,8 @@ static int ath11k_pci_enable_msi(struct ath11k_pci *ab_pci)
 			return -EINVAL;
 		else
 			return num_vectors;
+	} else {
+		ath11k_pci_init_irq_handlers(ab_pci, true);
 	}
 
 	msi_desc = irq_get_msi_desc(ab_pci->pdev->irq);
diff --git a/drivers/net/wireless/ath/ath11k/pci.h b/drivers/net/wireless/ath/ath11k/pci.h
index fe44d0d..2097466 100644
--- a/drivers/net/wireless/ath/ath11k/pci.h
+++ b/drivers/net/wireless/ath/ath11k/pci.h
@@ -72,6 +72,7 @@ struct ath11k_pci {
 	u16 dev_id;
 	char amss_path[100];
 	u32 msi_ep_base_data;
+	bool vectors_32_capability;
 	struct mhi_controller *mhi_ctrl;
 	unsigned long mhi_state;
 	u32 register_window;
@@ -82,6 +83,13 @@ struct ath11k_pci {
 	/* enum ath11k_pci_flags */
 	unsigned long flags;
 	u16 link_ctl;
+
+	const struct ath11k_msi_config *msi_config;
+	unsigned long irq_flags;
+	void (*ext_grp_disable)(struct ath11k_ext_irq_grp *irq_grp);
+	void (*ext_grp_enable)(struct ath11k_ext_irq_grp *irq_grp);
+	void (*ce_irq_enable)(struct ath11k_base *ab, u16 ce_id);
+	void (*ce_irq_disable)(struct ath11k_base *ab, u16 ce_id);
 };
 
 static inline struct ath11k_pci *ath11k_pci_priv(struct ath11k_base *ab)
-- 
2.7.4


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
