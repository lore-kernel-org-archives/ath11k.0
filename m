Return-Path: <SRS0=4fK3=PO=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 241FDC433EF
	for <ath11k@archiver.kernel.org>; Tue, 26 Oct 2021 04:17:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D472760D43
	for <ath11k@archiver.kernel.org>; Tue, 26 Oct 2021 04:17:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D472760D43
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=gyMdg+awItn6Q2lC1A1TUVuMXuL4Quts7JCl+fnmUSQ=; b=PSKfRT3+/04tJv
	qcIApXCB9iyn7JvPBAWLTnPvBTgHymy7KL2LHcTtBONGtC6/MWR7cLqppm2mb79iYCHp/ZA2C0Z3C
	qGDlsIDKQQ09sKcGwYSEG5pSiWCu3h7RZPr+qYyD1bdJ+0mPML48sNZ7c74E6Me5cvTsCLKgmWDXB
	lIQIwfYUdpG3NQYkkAyCMBZv2jfb4GXpDnR1ZZKC2FUTRoChfWi8/Cm7oKvBE+AlMfEtwUNno30TA
	lEmeaQL9vpx/+MgtAnsK9art7ervZ7GsOhtsyiFX+FSrgtwYyHmIAq6+As61IHvxFCDS7YPSpnS3F
	X/VyL7AVgRPHbAXUoXAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mfDtX-000ZR0-Uk; Tue, 26 Oct 2021 04:17:03 +0000
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mfDtV-000ZPi-3m
 for ath11k@lists.infradead.org; Tue, 26 Oct 2021 04:17:02 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1635221820; h=Content-Transfer-Encoding: MIME-Version:
 Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=27D10hZiVpDHr2tzdzyOU04mw3NAVnYAi7RyyhqSNWY=;
 b=RWsPXnxESvA7hsFc0v9LpACZHP6fRFcExEAhu3muIdZN10c8qlWua+hoYOIxCiSEoE0vSp10
 8Ohi7rMfu7NDq2ZxEQDi/j3x/Jey1BU9kNmTMShcgBaUIJC7rFVJo7Wmfd3cn/xFblOXaaEp
 YwFus19MA8fvjY6hmjU6fQy26lA=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 61778134b03398c06c262b4b (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 26 Oct 2021 04:16:52
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 42E07C4360C; Tue, 26 Oct 2021 04:16:52 +0000 (UTC)
Received: from bqiang-Celadon-RN.qca.qualcomm.com (unknown [180.166.53.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: bqiang)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 19C04C43460;
 Tue, 26 Oct 2021 04:16:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 19C04C43460
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
From: Baochen Qiang <bqiang@codeaurora.org>
To: ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH 2/7] ath11k: add CE and ext IRQ flag to indicate irq_handler
Date: Tue, 26 Oct 2021 12:16:46 +0800
Message-Id: <20211026041646.5060-1-bqiang@codeaurora.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211025_211701_253560_683C70F9 
X-CRM114-Status: GOOD (  15.45  )
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

This change adds two flags to indicate whether IRQ handler for CE
and DP can be called. This is because in one MSI vector case,
interrupt is not disabled in hif_stop and hif_irq_disable. Otherwise,
MHI interrupt is disabled too.

Tested-on: QCA6390 hw2.0 PCI WLAN.HST.1.0.1-01740-QCAHSTSWPLZ_V2_TO_X86-1

Signed-off-by: Carl Huang <cjhuang@codeaurora.org>
Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
Signed-off-by: Baochen Qiang <bqiang@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/core.h |  2 ++
 drivers/net/wireless/ath/ath11k/pci.c  | 16 ++++++++++++++++
 2 files changed, 18 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/core.h b/drivers/net/wireless/ath/ath11k/core.h
index 31d234a51c79..f2a08383d4ac 100644
--- a/drivers/net/wireless/ath/ath11k/core.h
+++ b/drivers/net/wireless/ath/ath11k/core.h
@@ -194,6 +194,8 @@ enum ath11k_dev_flags {
 	ATH11K_FLAG_REGISTERED,
 	ATH11K_FLAG_QMI_FAIL,
 	ATH11K_FLAG_HTC_SUSPEND_COMPLETE,
+	ATH11K_FLAG_CE_IRQ_ENABLED,
+	ATH11K_FLAG_EXT_IRQ_ENABLED,
 };
 
 enum ath11k_monitor_flags {
diff --git a/drivers/net/wireless/ath/ath11k/pci.c b/drivers/net/wireless/ath/ath11k/pci.c
index 8691e1649d6c..bf8d34bc5afa 100644
--- a/drivers/net/wireless/ath/ath11k/pci.c
+++ b/drivers/net/wireless/ath/ath11k/pci.c
@@ -574,6 +574,8 @@ static void ath11k_pci_ce_irqs_disable(struct ath11k_base *ab)
 {
 	int i;
 
+	clear_bit(ATH11K_FLAG_CE_IRQ_ENABLED, &ab->dev_flags);
+
 	for (i = 0; i < ab->hw_params.ce_count; i++) {
 		if (ath11k_ce_get_attr_flags(ab, i) & CE_ATTR_DIS_INTR)
 			continue;
@@ -607,6 +609,10 @@ static void ath11k_pci_ce_tasklet(struct tasklet_struct *t)
 static irqreturn_t ath11k_pci_ce_interrupt_handler(int irq, void *arg)
 {
 	struct ath11k_ce_pipe *ce_pipe = arg;
+	struct ath11k_base *ab = ce_pipe->ab;
+
+	if (!test_bit(ATH11K_FLAG_CE_IRQ_ENABLED, &ab->dev_flags))
+		return IRQ_HANDLED;
 
 	/* last interrupt received for this CE */
 	ce_pipe->timestamp = jiffies;
@@ -629,6 +635,8 @@ static void __ath11k_pci_ext_irq_disable(struct ath11k_base *sc)
 {
 	int i;
 
+	clear_bit(ATH11K_FLAG_EXT_IRQ_ENABLED, &sc->dev_flags);
+
 	for (i = 0; i < ATH11K_EXT_IRQ_GRP_NUM_MAX; i++) {
 		struct ath11k_ext_irq_grp *irq_grp = &sc->ext_irq_grp[i];
 
@@ -651,6 +659,8 @@ static void ath11k_pci_ext_irq_enable(struct ath11k_base *ab)
 {
 	int i;
 
+	set_bit(ATH11K_FLAG_EXT_IRQ_ENABLED, &ab->dev_flags);
+
 	for (i = 0; i < ATH11K_EXT_IRQ_GRP_NUM_MAX; i++) {
 		struct ath11k_ext_irq_grp *irq_grp = &ab->ext_irq_grp[i];
 
@@ -702,6 +712,10 @@ static int ath11k_pci_ext_grp_napi_poll(struct napi_struct *napi, int budget)
 static irqreturn_t ath11k_pci_ext_interrupt_handler(int irq, void *arg)
 {
 	struct ath11k_ext_irq_grp *irq_grp = arg;
+	struct ath11k_base *ab = irq_grp->ab;
+
+	if (!test_bit(ATH11K_FLAG_EXT_IRQ_ENABLED, &ab->dev_flags))
+		return IRQ_HANDLED;
 
 	ath11k_dbg(irq_grp->ab, ATH11K_DBG_PCI, "ext irq:%d\n", irq);
 
@@ -848,6 +862,8 @@ static void ath11k_pci_ce_irqs_enable(struct ath11k_base *ab)
 {
 	int i;
 
+	set_bit(ATH11K_FLAG_CE_IRQ_ENABLED, &ab->dev_flags);
+
 	for (i = 0; i < ab->hw_params.ce_count; i++) {
 		if (ath11k_ce_get_attr_flags(ab, i) & CE_ATTR_DIS_INTR)
 			continue;
-- 
2.25.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
