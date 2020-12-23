Return-Path: <SRS0=zJ/X=F3=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92CE1C433DB
	for <ath11k@archiver.kernel.org>; Wed, 23 Dec 2020 03:03:03 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3D53C206D6
	for <ath11k@archiver.kernel.org>; Wed, 23 Dec 2020 03:03:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3D53C206D6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rn8PBM/j88raIZ6eH364snR8DFZmppUJCs1r+WTnUn0=; b=q1nsu74v0lbhnzyq24840NfT/H
	g2rHtm2IAzePwI+LuGQPT4/ke+HKrv0+RIdCumJ/RRLjpa39Kp49NcwW0fkB0makZ7nOnKOAe0W7N
	cjZr/un3RH76JpbaadohrGzsS4Sq13smZtKe10f1RNtALDblXn4wDXyixEM9qWefoRtSm8fY28XlY
	o9/KxFkbCjIVJwA4PO/MhKSopB8sk3GKV6b/5wNqIcQrlO3LmpWV7QzU5xKXnVW3RKUTknD5IJ028
	O4BTCNu5NK+O09W/2eQAGRTwV50aKlcllAtIujinHU7dbIW+NoSUp68HTalcs+gm4ND+4Mlb2jogW
	ILUC3vmQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kruQW-0007RK-FV; Wed, 23 Dec 2020 03:03:00 +0000
Received: from m43-15.mailgun.net ([69.72.43.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kruQU-0007QE-Vf
 for ath11k@lists.infradead.org; Wed, 23 Dec 2020 03:02:59 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1608692578; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=Cp+v/hvvHuSsDUmrcryJLVqRnc77HgvUCu3B5wnD2ck=;
 b=e3xWbiEuIoazobC+9b4f9ovSCKmWH1qpnoGEtCqOhsmLCdU+rthaHk03VzBbNKsxpIXDfM93
 0AxaUJisz5zogORszUNu1HU6OORjqrJTqRHjaIMwqhDrjzC0PzIQHWvbdcG7j0KYWQqtqhvV
 fXuestLyIF36TyWP66vAM9O9Vzs=
X-Mailgun-Sending-Ip: 69.72.43.15
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 5fe2b34dcfd94dd328a97e04 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 23 Dec 2020 03:02:37
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 68FF6C433CA; Wed, 23 Dec 2020 03:02:37 +0000 (UTC)
Received: from cjhuang-Inspiron-7590.qca.qualcomm.com (unknown [180.166.53.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: cjhuang)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 53662C433ED;
 Wed, 23 Dec 2020 03:02:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 53662C433ED
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=cjhuang@codeaurora.org
From: Carl Huang <cjhuang@codeaurora.org>
To: ath11k@lists.infradead.org
Subject: [PATCH 3/6] ath11k: use ATH11K_PCI_IRQ_DP_OFFSET for dp irqx
Date: Tue, 22 Dec 2020 22:02:22 -0500
Message-Id: <20201223030225.2345-4-cjhuang@codeaurora.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201223030225.2345-1-cjhuang@codeaurora.org>
References: <20201223030225.2345-1-cjhuang@codeaurora.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201222_220259_050872_F19A8E8B 
X-CRM114-Status: GOOD (  13.75  )
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

Like ATH11K_PCI_IRQ_CE0_OFFSET, define ATH11K_PCI_IRQ_DP_OFFSET for
dp to save the irq instead of base_vector from msi config.

Tested-on: QCA6390 hw2.0 PCI WLAN.HST.1.0.1-01740-QCAHSTSWPLZ_V2_TO_X86-1

Signed-off-by: Carl Huang <cjhuang@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/pci.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/pci.c b/drivers/net/wireless/ath/ath11k/pci.c
index deb2d47..7ec2209 100644
--- a/drivers/net/wireless/ath/ath11k/pci.c
+++ b/drivers/net/wireless/ath/ath11k/pci.c
@@ -16,7 +16,8 @@
 #define ATH11K_PCI_BAR_NUM		0
 #define ATH11K_PCI_DMA_MASK		32
 
-#define ATH11K_PCI_IRQ_CE0_OFFSET		3
+#define ATH11K_PCI_IRQ_CE0_OFFSET	3
+#define ATH11K_PCI_IRQ_DP_OFFSET	14
 
 #define WINDOW_ENABLE_BIT		0x40000000
 #define WINDOW_REG_ADDRESS		0x310c
@@ -668,7 +669,7 @@ static int ath11k_pci_ext_irq_config(struct ath11k_base *ab)
 		}
 
 		irq_grp->num_irq = num_irq;
-		irq_grp->irqs[0] = base_vector + i;
+		irq_grp->irqs[0] = ATH11K_PCI_IRQ_DP_OFFSET + i;
 
 		for (j = 0; j < irq_grp->num_irq; j++) {
 			int irq_idx = irq_grp->irqs[j];
-- 
2.7.4


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
