Return-Path: <SRS0=4fK3=PO=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 964EAC433F5
	for <ath11k@archiver.kernel.org>; Tue, 26 Oct 2021 04:17:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6101360D43
	for <ath11k@archiver.kernel.org>; Tue, 26 Oct 2021 04:17:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6101360D43
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=f5u1jrTN/bgwa0wJoWzGfBuCy2nUfgiH0vHks4hhTAI=; b=i6bwp5FbJjYPYF
	CwuUERVOkJgfi76cszKlV8K6oJww2+GpO3eQADHItTNG0tlkBc4/9T9AsTx0q7LwWi5LvsTUxg3Mg
	/oTFTNWwvKVbI8pfYGLU877wWgIYCki/QCEJ9PPg/r7dinj7FG3IWw2BjeetHiHKdhhe7Ddw08F4m
	6+ObY2xoUAe6FXz3KO9A1nvxkuWFMDExiz3olGtF1Buil5qTvW0AeeNYn4x+hWH8tPR9/INUPkLQm
	82xfqnD5ZOFez3a4uY8yxOP9iLCB8frE1HLz6o/kcDT182gvLLoYBdtdHWBriYhlcKzEIiK6/mZr3
	HhztGt77SFQe/BAi615Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mfDtl-000ZVa-Hg; Tue, 26 Oct 2021 04:17:17 +0000
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mfDti-000ZPi-3v
 for ath11k@lists.infradead.org; Tue, 26 Oct 2021 04:17:16 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1635221834; h=Content-Transfer-Encoding: MIME-Version:
 Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=YNq/jEnpZ5tU79QbNLDoH+nn3r4gPHuZl6+QoHWuiPk=;
 b=GCgMTIQNYjpPjqdWyTfO49I0t2OCJzKsAAom6U680eqknFl+yh40ahAbm7Vw56lsX7fArKXr
 XfyxZyU4uTLM/9sBzwQn2+AE6n1qmtnA1ptMyrcbquqXkA9VWzmmByZvSWYBYkiYZ8pvCZRs
 k3zffZ047pgLbz4rsW7saByweRQ=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 61778148fd91319f0fc34587 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 26 Oct 2021 04:17:12
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 39CDFC43460; Tue, 26 Oct 2021 04:17:12 +0000 (UTC)
Received: from bqiang-Celadon-RN.qca.qualcomm.com (unknown [180.166.53.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: bqiang)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 6A80BC4338F;
 Tue, 26 Oct 2021 04:17:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 6A80BC4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
From: Baochen Qiang <bqiang@codeaurora.org>
To: ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH 4/7] ath11k: refactor multiple MSI vector implementation
Date: Tue, 26 Oct 2021 12:17:05 +0800
Message-Id: <20211026041705.5167-1-bqiang@codeaurora.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211025_211714_778607_365E9999 
X-CRM114-Status: GOOD (  17.58  )
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

From: Carl Huang <cjhuang@codeaurora.org>

This is to prepare for one MSI vector support. IRQ enable and disable
of CE and DP are done only in case of multiple MSI vectors.

Tested-on: QCA6390 hw2.0 PCI WLAN.HST.1.0.1-01740-QCAHSTSWPLZ_V2_TO_X86-1

Signed-off-by: Carl Huang <cjhuang@codeaurora.org>
Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
Signed-off-by: Baochen Qiang <bqiang@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/pci.c | 48 ++++++++++++++++++++++-----
 drivers/net/wireless/ath/ath11k/pci.h |  3 ++
 2 files changed, 43 insertions(+), 8 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/pci.c b/drivers/net/wireless/ath/ath11k/pci.c
index ed610e56c160..c4d726f492dc 100644
--- a/drivers/net/wireless/ath/ath11k/pci.c
+++ b/drivers/net/wireless/ath/ath11k/pci.c
@@ -482,11 +482,11 @@ int ath11k_pci_get_user_msi_assignment(struct ath11k_pci *ab_pci, char *user_nam
 	for (idx = 0; idx < msi_config->total_users; idx++) {
 		if (strcmp(user_name, msi_config->users[idx].name) == 0) {
 			*num_vectors = msi_config->users[idx].num_vectors;
-			*user_base_data = msi_config->users[idx].base_vector
-				+ ab_pci->msi_ep_base_data;
-			*base_vector = msi_config->users[idx].base_vector;
+			*base_vector =  msi_config->users[idx].base_vector;
+			*user_base_data = *base_vector + ab_pci->msi_ep_base_data;
 
-			ath11k_dbg(ab, ATH11K_DBG_PCI, "Assign MSI to user: %s, num_vectors: %d, user_base_data: %u, base_vector: %u\n",
+			ath11k_dbg(ab, ATH11K_DBG_PCI,
+				   "Assign MSI to user: %s, num_vectors: %d, user_base_data: %u, base_vector: %u\n",
 				   user_name, *num_vectors, *user_base_data,
 				   *base_vector);
 
@@ -558,6 +558,13 @@ static void ath11k_pci_free_irq(struct ath11k_base *ab)
 static void ath11k_pci_ce_irq_enable(struct ath11k_base *ab, u16 ce_id)
 {
 	u32 irq_idx;
+	struct ath11k_pci *ab_pci = ath11k_pci_priv(ab);
+
+	/*In case of one MSI vector, we handle irq enable/disable
+	 *in a uniform way since we only have one irq
+	 */
+	if (!test_bit(ATH11K_PCI_FLAG_MULTI_MSI_VECTORS, &ab_pci->flags))
+		return;
 
 	irq_idx = ATH11K_PCI_IRQ_CE0_OFFSET + ce_id;
 	enable_irq(ab->irq_num[irq_idx]);
@@ -566,6 +573,13 @@ static void ath11k_pci_ce_irq_enable(struct ath11k_base *ab, u16 ce_id)
 static void ath11k_pci_ce_irq_disable(struct ath11k_base *ab, u16 ce_id)
 {
 	u32 irq_idx;
+	struct ath11k_pci *ab_pci = ath11k_pci_priv(ab);
+
+	/*In case of one MSI vector, we handle irq enable/disable
+	 *in a uniform way since we only have one irq
+	 */
+	if (!test_bit(ATH11K_PCI_FLAG_MULTI_MSI_VECTORS, &ab_pci->flags))
+		return;
 
 	irq_idx = ATH11K_PCI_IRQ_CE0_OFFSET + ce_id;
 	disable_irq_nosync(ab->irq_num[irq_idx]);
@@ -627,6 +641,13 @@ static irqreturn_t ath11k_pci_ce_interrupt_handler(int irq, void *arg)
 static void ath11k_pci_ext_grp_disable(struct ath11k_ext_irq_grp *irq_grp)
 {
 	int i;
+	struct ath11k_pci *ab_pci = ath11k_pci_priv(irq_grp->ab);
+
+	/*In case of one MSI vector, we handle irq enable/disable
+	 *in a uniform way since we only have one irq
+	 */
+	if (!test_bit(ATH11K_PCI_FLAG_MULTI_MSI_VECTORS, &ab_pci->flags))
+		return;
 
 	for (i = 0; i < irq_grp->num_irq; i++)
 		disable_irq_nosync(irq_grp->ab->irq_num[irq_grp->irqs[i]]);
@@ -651,6 +672,13 @@ static void __ath11k_pci_ext_irq_disable(struct ath11k_base *sc)
 static void ath11k_pci_ext_grp_enable(struct ath11k_ext_irq_grp *irq_grp)
 {
 	int i;
+	struct ath11k_pci *ab_pci = ath11k_pci_priv(irq_grp->ab);
+
+	/*In case of one MSI vector, we handle irq enable/disable
+	 *in a uniform way since we only have one irq
+	 */
+	if (!test_bit(ATH11K_PCI_FLAG_MULTI_MSI_VECTORS, &ab_pci->flags))
+		return;
 
 	for (i = 0; i < irq_grp->num_irq; i++)
 		enable_irq(irq_grp->ab->irq_num[irq_grp->irqs[i]]);
@@ -732,6 +760,7 @@ static irqreturn_t ath11k_pci_ext_interrupt_handler(int irq, void *arg)
 
 static int ath11k_pci_ext_irq_config(struct ath11k_base *ab)
 {
+	struct ath11k_pci *ab_pci = ath11k_pci_priv(ab);
 	int i, j, ret, num_vectors = 0;
 	u32 user_base_data = 0, base_vector = 0, base_idx;
 
@@ -779,16 +808,15 @@ static int ath11k_pci_ext_irq_config(struct ath11k_base *ab)
 
 			irq_set_status_flags(irq, IRQ_DISABLE_UNLAZY);
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
@@ -796,6 +824,7 @@ static int ath11k_pci_ext_irq_config(struct ath11k_base *ab)
 
 static int ath11k_pci_config_irq(struct ath11k_base *ab)
 {
+	struct ath11k_pci *ab_pci = ath11k_pci_priv(ab);
 	struct ath11k_ce_pipe *ce_pipe;
 	u32 msi_data_start;
 	u32 msi_data_count, msi_data_idx;
@@ -823,7 +852,7 @@ static int ath11k_pci_config_irq(struct ath11k_base *ab)
 		tasklet_setup(&ce_pipe->intr_tq, ath11k_pci_ce_tasklet);
 
 		ret = request_irq(irq, ath11k_pci_ce_interrupt_handler,
-				  IRQF_SHARED, irq_name[irq_idx],
+				  ab_pci->irq_flags, irq_name[irq_idx],
 				  ce_pipe);
 		if (ret) {
 			ath11k_err(ab, "failed to request irq %d: %d\n",
@@ -917,6 +946,9 @@ static int ath11k_pci_alloc_msi(struct ath11k_pci *ab_pci)
 			return -EINVAL;
 		else
 			return num_vectors;
+	} else {
+		set_bit(ATH11K_PCI_FLAG_MULTI_MSI_VECTORS, &ab_pci->flags);
+		ab_pci->irq_flags = IRQF_SHARED;
 	}
 	ath11k_pci_msi_disable(ab_pci);
 
diff --git a/drivers/net/wireless/ath/ath11k/pci.h b/drivers/net/wireless/ath/ath11k/pci.h
index f3e645891d19..61d67b20a0eb 100644
--- a/drivers/net/wireless/ath/ath11k/pci.h
+++ b/drivers/net/wireless/ath/ath11k/pci.h
@@ -68,6 +68,7 @@ enum ath11k_pci_flags {
 	ATH11K_PCI_FLAG_INIT_DONE,
 	ATH11K_PCI_FLAG_IS_MSI_64,
 	ATH11K_PCI_ASPM_RESTORE,
+	ATH11K_PCI_FLAG_MULTI_MSI_VECTORS,
 };
 
 struct ath11k_pci {
@@ -87,6 +88,8 @@ struct ath11k_pci {
 	/* enum ath11k_pci_flags */
 	unsigned long flags;
 	u16 link_ctl;
+
+	unsigned long irq_flags;
 };
 
 static inline struct ath11k_pci *ath11k_pci_priv(struct ath11k_base *ab)
-- 
2.25.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
