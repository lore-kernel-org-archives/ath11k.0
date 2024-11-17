Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 146ACD6DDFF
	for <ath11k@archiver.kernel.org>; Sun, 17 Nov 2024 16:07:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hTc0ddj3nC/Sfq6fL/at8xiAMbeSjUF1uVlEJ70b1wk=; b=Cr3iAKp5/67XkefAS8JqO+YnYc
	Ovy07EIXLBIEx3S0mISMT19bgD2MXBUhbQA79lMnz79+lypKiylHvUXh0y+O3Vw85LDkmNpnAs2Oh
	ICAPA86bfx51sSAUHd3y3PgYMF9ojO3RiPTbHuIzN7D8LTp3V1kKDr0U4keaWZzEZcIZeS2FS7SYl
	8AkOLLS27kQ6FGL8IMjdFCFSgqldxylh1FIdHicAr1hGab/lKU1qfH7AuM6mHdeRf/Bl/lZ6Tin0s
	t8oQPnmdiqZSGvu3d7FqOwo0L8s7MaZBsLSSmpMtw9cFWIcHJF7rviL2+CHk8MPHe5NJVLLDzeMJp
	kDaoQpzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tCho9-00000007XWj-3Ouy;
	Sun, 17 Nov 2024 16:07:29 +0000
Received: from ionic.de ([2001:41d0:700:3394:1::2] helo=mail.ionic.de)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tCho4-00000007XPL-0ITP
	for ath11k@lists.infradead.org;
	Sun, 17 Nov 2024 16:07:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ionic.de; s=default;
	t=1731859635; bh=xu/kRBrgxsp1+y+87+3Bp7+p2E3ufd26ix78nC4UwAw=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=jEsbD85t1aqf3UK/lxVGUx8mdezohhnJVdLf3Jn7qgESW1nVlngTgeUmHRm75fp7e
	 bt036SAInQzyOuLOIdf8qAgEYPmHIOxuuCpDthDaZay2Wev9D8wrUcbKOen9eK0pe7
	 iVg7AIGhmIkOzSC0Tpe/eryNEeN//UA7/qAcvjCI=
Received: from grml.local.home.ionic.de (unknown [IPv6:2a00:11:fb41:7a00:21b:21ff:fe5e:dddc])
	by mail.ionic.de (Postfix) with ESMTPSA id 59BF9148870D
	for <ath11k@lists.infradead.org>; Sun, 17 Nov 2024 17:07:15 +0100 (CET)
From: Mihai Moldovan <ionic@ionic.de>
To: ath11k@lists.infradead.org
Subject: [RFC] [PATCH 09/13] wifi: ath11k: implement QRTR endpoint ID fetching for PCI
Date: Sun, 17 Nov 2024 17:06:08 +0100
Message-ID: <565c099de4533c2aa0570986c970ef449b419f19.1731858975.git.ionic@ionic.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.1731858971.git.ionic@ionic.de>
References: <cover.1731858971.git.ionic@ionic.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241117_080724_256717_49925F10 
X-CRM114-Status: UNSURE (   9.36  )
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
 drivers/net/wireless/ath/ath11k/mhi.c | 19 +++++++++++++++++++
 drivers/net/wireless/ath/ath11k/mhi.h |  1 +
 drivers/net/wireless/ath/ath11k/pci.c |  1 +
 3 files changed, 21 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/mhi.c b/drivers/net/wireless/ath/ath11k/mhi.c
index 6974a551883f..46ee049f176b 100644
--- a/drivers/net/wireless/ath/ath11k/mhi.c
+++ b/drivers/net/wireless/ath/ath11k/mhi.c
@@ -11,6 +11,8 @@
 #include <linux/of_address.h>
 #include <linux/ioport.h>
 
+#include <net/qrtr.h>
+
 #include "core.h"
 #include "debug.h"
 #include "mhi.h"
@@ -490,3 +492,20 @@ int ath11k_mhi_resume(struct ath11k_pci *ab_pci)
 
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
+	ret = qrtr_endpoint_id_get_or_assign(ab_pci->mhi_ctrl, &qmi->handle.endpoint_id);
+	ath11k_dbg(ab, ATH11K_DBG_PCI, "queried mhi_ctrl QRTR endpoint ID: %u\n", qmi->handle.endpoint_id);
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


