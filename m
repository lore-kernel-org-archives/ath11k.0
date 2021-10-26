Return-Path: <SRS0=4fK3=PO=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00575C433F5
	for <ath11k@archiver.kernel.org>; Tue, 26 Oct 2021 04:17:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B821E60D43
	for <ath11k@archiver.kernel.org>; Tue, 26 Oct 2021 04:17:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B821E60D43
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Pn23NXK0QtFtxaEaGvo1vw+M+4AErbB8lhEGHl4TkbM=; b=tqRwSbww+Cm4u7
	qwi910QxDS1B0QO9AiuFLx4+pumfo77AlnpmjPw2zNFVFQ7KFGsCCBc+/r5d/bO4Lq3OIrrHl1xPM
	7M+LNR4GlVSL5nW/gO24bmMOGZGx0qDr93H9Eag+4MWWjy0dTawiD+jOqR8FLE48clOOhlWARQcpO
	hNYWMjifDNIxlPmpiduZ0DioqaoPb+3J5pXF7i1Rq+pplwfKkaYhsjoTXLEf3yTwIL+j+5BlQDaX/
	4U5M6+lQcifnw8mCiv9yCTfP3oJEU3f29U42qdGdJeK9hMLrpvf3HiXtMHaodnY2fBsxpNE+XoQ7H
	kErKpGc1W/sigejCOL4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mfDuD-000Zi7-Ri; Tue, 26 Oct 2021 04:17:45 +0000
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mfDuA-000ZPi-A0
 for ath11k@lists.infradead.org; Tue, 26 Oct 2021 04:17:44 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1635221863; h=Content-Transfer-Encoding: MIME-Version:
 Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=SKLngKpFsur3nfUpF13GoxuU1+g7qBfwoE4jGMjLIqo=;
 b=IAcTaKlOOMQOzs3FyWgdcozJ18t0GhLFhFPGqZjGa4W2MBJMI+RQIyJO/DLPihguxX4ln3NM
 JhBvRst1Q6hCWQ/zVwiZoXvbPcpb7qoaBVLDpp/X/5tV4Qj/dZcaQpggYD/T9TKaX6iJSiAI
 NU/V9gdUm/FDxQENMsjbxPNzhrE=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 61778162b03398c06c26b5cc (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 26 Oct 2021 04:17:38
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 9DE79C4338F; Tue, 26 Oct 2021 04:17:37 +0000 (UTC)
Received: from bqiang-Celadon-RN.qca.qualcomm.com (unknown [180.166.53.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: bqiang)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 750C1C43460;
 Tue, 26 Oct 2021 04:17:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 750C1C43460
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
From: Baochen Qiang <bqiang@codeaurora.org>
To: ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH 7/7] ath11k: Set IRQ affinity to CPU0 in case of one MSI vector
Date: Tue, 26 Oct 2021 12:17:32 +0800
Message-Id: <20211026041732.5323-1-bqiang@codeaurora.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211025_211743_359968_FC3B370E 
X-CRM114-Status: GOOD (  16.80  )
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

With VT-d disabled on Intel platform, ath11k gets only one MSI
vector. In that case, ath11k does not free IRQ when doing suspend,
hence the kernel has to migrate it to CPU0 (if it was affine to
other CPUs) and allocates a new MSI vector. However, ath11k has
no chance to reconfig it to HW srngs during this phase, thus
ath11k fails to resume.

This issue can be fixed by setting IRQ affinity to CPU0 before
request_irq is called. With such affinity, migration will not
happen and thus the vector keeps unchanged during suspend/resume.

Tested-on: QCA6390 hw2.0 PCI WLAN.HST.1.0.1-01740-QCAHSTSWPLZ_V2_TO_X86-1

Signed-off-by: Baochen Qiang <bqiang@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/pci.c | 24 ++++++++++++++++++++++--
 1 file changed, 22 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/pci.c b/drivers/net/wireless/ath/ath11k/pci.c
index b450b4ed35d1..1cad7545ceb9 100644
--- a/drivers/net/wireless/ath/ath11k/pci.c
+++ b/drivers/net/wireless/ath/ath11k/pci.c
@@ -840,6 +840,14 @@ static int ath11k_pci_ext_irq_config(struct ath11k_base *ab)
 	return 0;
 }
 
+static int ath11k_pci_set_irq_affinity_hint(struct ath11k_pci *ab_pci, const struct cpumask *m)
+{
+	if (!test_bit(ATH11K_PCI_FLAG_MULTI_MSI_VECTORS, &ab_pci->flags))
+		return irq_set_affinity_hint(ab_pci->pdev->irq, m);
+
+	return 0;
+}
+
 static int ath11k_pci_config_irq(struct ath11k_base *ab)
 {
 	struct ath11k_pci *ab_pci = ath11k_pci_priv(ab);
@@ -856,6 +864,12 @@ static int ath11k_pci_config_irq(struct ath11k_base *ab)
 	if (ret)
 		return ret;
 
+	ret = ath11k_pci_set_irq_affinity_hint(ab_pci, cpumask_of(0));
+	if (ret) {
+		ath11k_err(ab, "failed to set irq affinity %d\n", ret);
+		return ret;
+	}
+
 	/* Configure CE irqs */
 	for (i = 0, msi_data_idx = 0; i < ab->hw_params.ce_count; i++) {
 		if (ath11k_ce_get_attr_flags(ab, i) & CE_ATTR_DIS_INTR)
@@ -875,7 +889,7 @@ static int ath11k_pci_config_irq(struct ath11k_base *ab)
 		if (ret) {
 			ath11k_err(ab, "failed to request irq %d: %d\n",
 				   irq_idx, ret);
-			return ret;
+			goto err_irq_affinity_cleanup;
 		}
 
 		ab->irq_num[irq_idx] = irq;
@@ -886,9 +900,13 @@ static int ath11k_pci_config_irq(struct ath11k_base *ab)
 
 	ret = ath11k_pci_ext_irq_config(ab);
 	if (ret)
-		return ret;
+		goto err_irq_affinity_cleanup;
 
 	return 0;
+
+err_irq_affinity_cleanup:
+	ath11k_pci_set_irq_affinity_hint(ab_pci, NULL);
+	return ret;
 }
 
 static void ath11k_pci_init_qmi_ce_config(struct ath11k_base *ab)
@@ -1475,6 +1493,8 @@ static void ath11k_pci_remove(struct pci_dev *pdev)
 	struct ath11k_base *ab = pci_get_drvdata(pdev);
 	struct ath11k_pci *ab_pci = ath11k_pci_priv(ab);
 
+	ath11k_pci_set_irq_affinity_hint(ab_pci, NULL);
+
 	if (test_bit(ATH11K_FLAG_QMI_FAIL, &ab->dev_flags)) {
 		ath11k_pci_power_down(ab);
 		ath11k_debugfs_soc_destroy(ab);
-- 
2.25.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
