Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37879D12668
	for <ath11k@archiver.kernel.org>; Tue,  5 Nov 2024 08:16:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RM5biMObg17s5oyPQ3Ze9AjLtJ0IB1jSZmeTPByD168=; b=tbBLEsOG2wY8QCIzIkptoOepdJ
	IMa6Y9GwFMnLatL8/BfZ1iaGdQSc6ZBWhrEZQM7mRt18780rT2RHbNeOrszSDJQVnxbSJw2arYooV
	kfkQ85tgnKqBFkw4ZXlfdjiI1YWuaCR/kNiwMRcV5DFwOyUaqi5sNNN4xm0WEBgkFgOD+MdURX+5S
	TKBZGiEoGOZcHZ3gRp0w7r23FvXVcPWX6W/SENC9gBZt1sVgsx7PgMeQWeBVGvHydS9V2or74w+5k
	ABkDwjmcdI/EPDYMMdbLJNvHaSCi+QdGxMgp1rEfRkd0HmkeN7QDxsfAwOSabuFgIDfuht4sIYRgb
	8HDclj8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8Eja-0000000GJ00-3RrP;
	Tue, 05 Nov 2024 08:16:18 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8DfQ-0000000G9dF-2s3x
	for ath11k@bombadil.infradead.org;
	Tue, 05 Nov 2024 07:07:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=RM5biMObg17s5oyPQ3Ze9AjLtJ0IB1jSZmeTPByD168=; b=Q1+EMejQW/be8GQQkEzvN6K0Js
	Ij1ziRep8A+uom4xPE3hH42Cg41Ru+odz7eex3PTPt6W1C58dnmvfKrCQZdUwcaa8sULwdwHKFidm
	gmwfSZ18YjwvN4EoMcaMVOJWsrr2PJ07Sczzm9u14LB8uEgtlnh3WIAePf8rPVeZ+AlK3i7khVMPt
	gKuwlhj0BPkZK1CtwQUszy7u4/M5B7u6DCU9TJz19gRhWvXdK3EEIOe/AhugK08QSXiKfPHxscaTw
	zW9gdIuebJJWr7D/f0hE2znfqjkuo2+Ai/eSFiAoTTolF3h17X3vsjaG/pIiaLCwWEmUAz5zdQclN
	Ws9t+Faw==;
Received: from ionic.de ([145.239.234.145] helo=mail.ionic.de)
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8DfM-0000000BgbO-0D6a
	for ath11k@lists.infradead.org;
	Tue, 05 Nov 2024 07:07:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ionic.de; s=default;
	t=1730790463; bh=aoYFjiFcptCKlrXi3lpbxCEj7qZAedA+DI8bIDwwvjY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Ec2KaaigqhiA5CE+LMQbPAnd7mQj8gTfaoK46mgpkvEQMxtJcIW4TXsJXc+2Tq7oX
	 ptIYbvjPEEDd1m+cAJP5yzXe0YpmYmdPyySl0miTkFLrt2wilL70xPUexTM02jR0Ti
	 vGXkAAt++7eE/GtOKNJcFqz7Lsyib4ccJ7e2jCdQ=
Received: from grml.local.home.ionic.de (unknown [IPv6:2a00:11:fb41:7a00:21b:21ff:fe5e:dddc])
	by mail.ionic.de (Postfix) with ESMTPSA id 73E9B1488DDA;
	Tue, 05 Nov 2024 08:07:43 +0100 (CET)
From: Mihai Moldovan <ionic@ionic.de>
To: ath11k@lists.infradead.org
Cc: Mihai Moldovan <ionic@ionic.de>
Subject: [DONOTMERGE] [NOTEVENRFC] [PATCH 07/11] wifi: ath11k: implement QRTR endpoint ID fetching for PCI
Date: Tue,  5 Nov 2024 08:06:21 +0100
Message-ID: <51978d847d5b9e966039bb2fd5fbdb28fa3c94d1.1730790062.git.ionic@ionic.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.1730790058.git.ionic@ionic.de>
References: <cover.1730790058.git.ionic@ionic.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241105_070753_876997_90806B30 
X-CRM114-Status: UNSURE (   9.15  )
X-CRM114-Notice: Please train this message.
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
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

QRTR endpoint ID fetching for PCIe devices will use MHI.

Signed-off-by: Mihai Moldovan <ionic@ionic.de>
---
 drivers/net/wireless/ath/ath11k/mhi.c | 17 +++++++++++++++++
 drivers/net/wireless/ath/ath11k/mhi.h |  1 +
 drivers/net/wireless/ath/ath11k/pci.c |  1 +
 3 files changed, 19 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/mhi.c b/drivers/net/wireless/ath/ath11k/mhi.c
index 6974a551883f..5af02802c3b0 100644
--- a/drivers/net/wireless/ath/ath11k/mhi.c
+++ b/drivers/net/wireless/ath/ath11k/mhi.c
@@ -490,3 +490,20 @@ int ath11k_mhi_resume(struct ath11k_pci *ab_pci)
 
 	return 0;
 }
+
+int ath11k_mhi_set_qrtr_endpoint_id(struct ath11k_base *ab)
+{
+	struct ath11k_pci *ab_pci = ath11k_pci_priv(ab);
+	struct ath11k_qmi *qmi = &ab->qmi;
+	int ret;
+
+	/* Pass endpoint ID up for QMI usage. */
+	ret = mhi_get_qrtr_endpoint_id(ab_pci->mhi_ctrl->mhi_dev, &qmi->handle.endpoint_id);
+	ath11k_dbg(ab, ATH11K_DBG_PCI, "queried mhi_device QRTR endpoint ID: %u\n", qmi->handle.endpoint_id);
+	if (ret) {
+		ath11k_warn(ab, "failed to query QRTR endpoint ID: %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
diff --git a/drivers/net/wireless/ath/ath11k/mhi.h b/drivers/net/wireless/ath/ath11k/mhi.h
index a682aad52fc5..84465fb5d5da 100644
--- a/drivers/net/wireless/ath/ath11k/mhi.h
+++ b/drivers/net/wireless/ath/ath11k/mhi.h
@@ -27,4 +27,5 @@ void ath11k_mhi_clear_vector(struct ath11k_base *ab);
 int ath11k_mhi_suspend(struct ath11k_pci *ar_pci);
 int ath11k_mhi_resume(struct ath11k_pci *ar_pci);
 
+int ath11k_mhi_set_qrtr_endpoint_id(struct ath11k_base *ab);
 #endif
diff --git a/drivers/net/wireless/ath/ath11k/pci.c b/drivers/net/wireless/ath/ath11k/pci.c
index 18248b8e5b93..fd3664c8ff8b 100644
--- a/drivers/net/wireless/ath/ath11k/pci.c
+++ b/drivers/net/wireless/ath/ath11k/pci.c
@@ -744,6 +744,7 @@ static const struct ath11k_hif_ops ath11k_pci_hif_ops = {
 	.ce_irq_enable = ath11k_pci_hif_ce_irq_enable,
 	.ce_irq_disable = ath11k_pci_hif_ce_irq_disable,
 	.get_ce_msi_idx = ath11k_pcic_get_ce_msi_idx,
+	.set_qrtr_endpoint_id = ath11k_mhi_set_qrtr_endpoint_id,
 };
 
 static void ath11k_pci_read_hw_version(struct ath11k_base *ab, u32 *major, u32 *minor)
-- 
2.45.2


