Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 866F2C4321E
	for <ath11k@archiver.kernel.org>; Mon,  6 Dec 2021 22:27:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:MIME-Version:References:Subject:Cc
	:To:From:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	List-Owner; bh=OewYWa1Ao4Feb4Fz7GRC619WtqaYjWpIHoJwQ8HsXyE=; b=usLDzs/ApDDTHn
	37FQfVqzGu4lDCj37YSdKkLOvJmCTkXFRHwS7EwWE1pASfAXCbPbNvqe4H6y3bUmhDo8LTzF/rLMz
	01td6O00okgFpRWbnf+ssjiTK8psfDU4RG1rwBxuOqxf3mr+J8k03mXUn/m3AcMLi+m6FQRfKopj1
	J8MSpoqO7myu9n2tGia46h3AapFD2l3dXzMgsnyMjsDXDhYchnC+zCdnGxyLgRKTM2s8QsoAFQo+v
	8d/nXF1mH5H/Zvi7PON3ATk83jfuL+JpyrEykLzMrE4Yi7W8BlvLbhdUrKI+hp00LoAj7V2ZSdZ7t
	kxYcExtBFYpIs7hc8TkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1muMSP-006Cjk-Tm; Mon, 06 Dec 2021 22:27:37 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1muMSN-006CfK-1s
 for ath11k@lists.infradead.org; Mon, 06 Dec 2021 22:27:36 +0000
Message-ID: <20211206210224.157070464@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1638829653;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 references:references; bh=TDFYojyJUnT1Pr+HD2qBTTTO8BHHsqWcbvlgAiLi1mo=;
 b=faGOpwdXacJz+kDCBSBkEhVaO4tWIE9P4Qj5ETLfpZZFSN40Jc6KRKvtUjKqzbcgr/ztKa
 qbs3AQMJ5YqDzSZ/LBJnHdYuDtL3UTT2HjTS9uDFx0+ryP9JO6T8QJqki3Nd//oVR/X9VW
 e1FjY69NA0GKaGyYgqvsTrBfJX5lElCMCyT9FX6YoUuOuuEqqOc/GLtzdgl3zj7Vtoiv7E
 DlxF1pyTqCvYRbWG64ZI7oDzx/Ar7iOdm474EVal1taH8l1XMh6ZbffomzLXz0G5zILmHX
 sQC0TNZYbr8j+7dwqKqYgzrivx/aEdj/MXodn28TIjm3ZJ1lp6FCpndDXoNOSQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1638829653;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 references:references; bh=TDFYojyJUnT1Pr+HD2qBTTTO8BHHsqWcbvlgAiLi1mo=;
 b=KcSH+DBC8ml3AxFwN340Wlqo3YBI/t/phMRlVFFD4wwY62x/NNn0qh9e3mmURC/L3bKGnm
 CtUH2opZXJZR53Dw==
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Bjorn Helgaas <helgaas@kernel.org>, Marc Zygnier <maz@kernel.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 Kevin Tian <kevin.tian@intel.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Megha Dey <megha.dey@intel.com>, Ashok Raj <ashok.raj@intel.com>,
 linux-pci@vger.kernel.org, Cedric Le Goater <clg@kaod.org>,
 Juergen Gross <jgross@suse.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Paul Mackerras <paulus@samba.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 linuxppc-dev@lists.ozlabs.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 linux-mips@vger.kernel.org, Kalle Valo <kvalo@codeaurora.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 sparclinux@vger.kernel.org, x86@kernel.org, xen-devel@lists.xenproject.org,
 ath11k@lists.infradead.org, Wei Liu <wei.liu@kernel.org>,
 linux-hyperv@vger.kernel.org,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>
Subject: [patch V2 06/23] PCI/MSI: Make pci_msi_domain_write_msg() static
References: <20211206210147.872865823@linutronix.de>
MIME-Version: 1.0
Date: Mon,  6 Dec 2021 23:27:33 +0100 (CET)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211206_142735_272928_37CEC7B3 
X-CRM114-Status: GOOD (  10.83  )
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

There is no point to have this function public as it is set by the PCI core
anyway when a PCI/MSI irqdomain is created.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Tested-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/irqchip/irq-gic-v2m.c            |    1 -
 drivers/irqchip/irq-gic-v3-its-pci-msi.c |    1 -
 drivers/irqchip/irq-gic-v3-mbi.c         |    1 -
 drivers/pci/msi.c                        |    2 +-
 include/linux/msi.h                      |    1 -
 5 files changed, 1 insertion(+), 5 deletions(-)

--- a/drivers/irqchip/irq-gic-v2m.c
+++ b/drivers/irqchip/irq-gic-v2m.c
@@ -88,7 +88,6 @@ static struct irq_chip gicv2m_msi_irq_ch
 	.irq_mask		= gicv2m_mask_msi_irq,
 	.irq_unmask		= gicv2m_unmask_msi_irq,
 	.irq_eoi		= irq_chip_eoi_parent,
-	.irq_write_msi_msg	= pci_msi_domain_write_msg,
 };
 
 static struct msi_domain_info gicv2m_msi_domain_info = {
--- a/drivers/irqchip/irq-gic-v3-its-pci-msi.c
+++ b/drivers/irqchip/irq-gic-v3-its-pci-msi.c
@@ -28,7 +28,6 @@ static struct irq_chip its_msi_irq_chip
 	.irq_unmask		= its_unmask_msi_irq,
 	.irq_mask		= its_mask_msi_irq,
 	.irq_eoi		= irq_chip_eoi_parent,
-	.irq_write_msi_msg	= pci_msi_domain_write_msg,
 };
 
 static int its_pci_msi_vec_count(struct pci_dev *pdev, void *data)
--- a/drivers/irqchip/irq-gic-v3-mbi.c
+++ b/drivers/irqchip/irq-gic-v3-mbi.c
@@ -171,7 +171,6 @@ static struct irq_chip mbi_msi_irq_chip
 	.irq_unmask		= mbi_unmask_msi_irq,
 	.irq_eoi		= irq_chip_eoi_parent,
 	.irq_compose_msi_msg	= mbi_compose_msi_msg,
-	.irq_write_msi_msg	= pci_msi_domain_write_msg,
 };
 
 static struct msi_domain_info mbi_msi_domain_info = {
--- a/drivers/pci/msi.c
+++ b/drivers/pci/msi.c
@@ -1281,7 +1281,7 @@ EXPORT_SYMBOL_GPL(msi_desc_to_pci_sysdat
  * @irq_data:	Pointer to interrupt data of the MSI interrupt
  * @msg:	Pointer to the message
  */
-void pci_msi_domain_write_msg(struct irq_data *irq_data, struct msi_msg *msg)
+static void pci_msi_domain_write_msg(struct irq_data *irq_data, struct msi_msg *msg)
 {
 	struct msi_desc *desc = irq_data_get_msi_desc(irq_data);
 
--- a/include/linux/msi.h
+++ b/include/linux/msi.h
@@ -455,7 +455,6 @@ void *platform_msi_get_host_data(struct
 #endif /* CONFIG_GENERIC_MSI_IRQ_DOMAIN */
 
 #ifdef CONFIG_PCI_MSI_IRQ_DOMAIN
-void pci_msi_domain_write_msg(struct irq_data *irq_data, struct msi_msg *msg);
 struct irq_domain *pci_msi_create_irq_domain(struct fwnode_handle *fwnode,
 					     struct msi_domain_info *info,
 					     struct irq_domain *parent);


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
