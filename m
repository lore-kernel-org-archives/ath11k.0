Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7071D10F21
	for <ath11k@archiver.kernel.org>; Sun, 17 Nov 2024 16:07:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FGdEjr/F6yZckacrImVZNVs15PDqJUVdjXmFvi0BFno=; b=i4NvMke5kaHb1hSwZiEc12Mc++
	r8PCgc1I3nJBw8bAp4m7mHzIfLjrkeXDhuzvnm2aPaF+UIAhcI8iaBQPMSiBiriOUofaKRCHNyO0d
	wfE0byxgiwRgg+iV7sf/f49RdgcjbHAdIG5/KRIYDRmsK6kEuYrXTRzBnPVZr30Rsz7cZzBLDbGCG
	bFA22zTFfhWvtIBggdAeTij7dOsrBfQJ9En1pRTrxtoNZLXBr7ik64sE/Gu0ItUqPoEWd3eTi8lDA
	HMwV95rTptHSo2NZz+hccpFxrYOPdqImDa4U/4oWUDpLHlNLJN50/Xb++rOvcqtpUZMFivGKR6faw
	+6NBfwVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tChoB-00000007XYu-13TA;
	Sun, 17 Nov 2024 16:07:31 +0000
Received: from ionic.de ([145.239.234.145] helo=mail.ionic.de)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tCho4-00000007XQU-2Jcf
	for ath11k@lists.infradead.org;
	Sun, 17 Nov 2024 16:07:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ionic.de; s=default;
	t=1731859635; bh=UkXcOOdlHLSZ0nC++19Ug9ZfAU65+/9UFt9r57nfXiM=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=iTrEI2dkWb+U4OelhVx34jg9mJB2GPv6ZS55Mtm5bd9e1QGblpeT/xk7DpEU45xBS
	 zxmNsN2no1mwxVji7DeSmaqQrf3eAjXfq7NO92SN79DyZal50XRf8eGmUt/iWaKnh2
	 WqVoUD4eqGryZifN7VgSeE+l6doiYbWgZ8QE/hTk=
Received: from grml.local.home.ionic.de (unknown [IPv6:2a00:11:fb41:7a00:21b:21ff:fe5e:dddc])
	by mail.ionic.de (Postfix) with ESMTPSA id AE41D14892A5
	for <ath11k@lists.infradead.org>; Sun, 17 Nov 2024 17:07:15 +0100 (CET)
From: Mihai Moldovan <ionic@ionic.de>
To: ath11k@lists.infradead.org
Subject: [RFC] [PATCH 12/13] wifi: ath12k: implement QRTR endpoint ID fetching for PCI
Date: Sun, 17 Nov 2024 17:06:11 +0100
Message-ID: <f3156ea7c4205101ec08ca66307a4f7ac06aee70.1731858975.git.ionic@ionic.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.1731858971.git.ionic@ionic.de>
References: <cover.1731858971.git.ionic@ionic.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241117_080724_797393_4CC3B8BB 
X-CRM114-Status: UNSURE (   9.34  )
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
 drivers/net/wireless/ath/ath12k/mhi.c | 19 +++++++++++++++++++
 drivers/net/wireless/ath/ath12k/mhi.h |  2 ++
 drivers/net/wireless/ath/ath12k/pci.c |  1 +
 3 files changed, 22 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/mhi.c b/drivers/net/wireless/ath/ath12k/mhi.c
index 2f6d14382ed7..e92ef20826bc 100644
--- a/drivers/net/wireless/ath/ath12k/mhi.c
+++ b/drivers/net/wireless/ath/ath12k/mhi.c
@@ -8,6 +8,8 @@
 #include <linux/pci.h>
 #include <linux/firmware.h>
 
+#include <net/qrtr.h>
+
 #include "core.h"
 #include "debug.h"
 #include "mhi.h"
@@ -654,3 +656,20 @@ void ath12k_mhi_coredump(struct mhi_controller *mhi_ctrl, bool in_panic)
 {
 	mhi_download_rddm_image(mhi_ctrl, in_panic);
 }
+
+int ath12k_mhi_set_qrtr_endpoint_id(struct ath12k_base *ab)
+{
+	struct ath12k_pci *ab_pci = ath12k_pci_priv(ab);
+	struct ath12k_qmi *qmi = &ab->qmi;
+	int ret;
+
+	/* Pass endpoint ID up for QMI usage. */
+	ret = qrtr_endpoint_id_get_or_assign(ab_pci->mhi_ctrl, &qmi->handle.endpoint_id);
+	ath12k_dbg(ab, ATH12K_DBG_PCI, "queried mhi_ctrl QRTR endpoint ID: %u\n", qmi->handle.endpoint_id);
+	if (ret) {
+		ath12k_warn(ab, "failed to query QRTR endpoint ID: %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
diff --git a/drivers/net/wireless/ath/ath12k/mhi.h b/drivers/net/wireless/ath/ath12k/mhi.h
index 7358b8477536..c4e00c1747c8 100644
--- a/drivers/net/wireless/ath/ath12k/mhi.h
+++ b/drivers/net/wireless/ath/ath12k/mhi.h
@@ -44,4 +44,6 @@ void ath12k_mhi_clear_vector(struct ath12k_base *ab);
 void ath12k_mhi_suspend(struct ath12k_pci *ar_pci);
 void ath12k_mhi_resume(struct ath12k_pci *ar_pci);
 void ath12k_mhi_coredump(struct mhi_controller *mhi_ctrl, bool in_panic);
+
+int ath12k_mhi_set_qrtr_endpoint_id(struct ath12k_base *ab);
 #endif
diff --git a/drivers/net/wireless/ath/ath12k/pci.c b/drivers/net/wireless/ath/ath12k/pci.c
index cf907550e6a4..3d65c64d1b31 100644
--- a/drivers/net/wireless/ath/ath12k/pci.c
+++ b/drivers/net/wireless/ath/ath12k/pci.c
@@ -1514,6 +1514,7 @@ static const struct ath12k_hif_ops ath12k_pci_hif_ops = {
 #ifdef CONFIG_ATH12K_COREDUMP
 	.coredump_download = ath12k_pci_coredump_download,
 #endif
+	.set_qrtr_endpoint_id = ath12k_mhi_set_qrtr_endpoint_id,
 };
 
 static
-- 
2.45.2


