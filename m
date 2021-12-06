Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D5A9C433FE
	for <ath11k@archiver.kernel.org>; Mon,  6 Dec 2021 22:28:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:MIME-Version:References:Subject:Cc
	:To:From:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	List-Owner; bh=JOWjjtDglmb9Fe/MAJNAOLChDPMClL3/c+GLNaqGzSE=; b=slRS4O0tffGfHe
	DrL4SK0l2Ib6LSY5n1A8uz9zaKnAaTJpr6Ms3AMn0cCs+tAyyMbhwSe15ThjLXjtgC+NQuVKXcsl0
	w3e0e6dvV0jrVuQQUrTQy2du91V+14+yGkGGPOiiS0ky+wnB7FkM84CsKyIkMojUiSLfxg5kAiJzq
	d1Zzrren8WtmbdFSOaZhVPAdGZ0hE/LQJHAxyUyLlfAz3Q3ts7iohjKeo0HBohXZ4uCrhItSrcGcW
	c/X0rR/A5PCh3g+FK+Ds74mCOXZubSmkFkHb5Y7WrziDTE0sGBAay1/aH8ykT2k9HNZ0DaLu6dIso
	r4xSs7Ve26PTc2VvoI/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1muMT6-006DQQ-EE; Mon, 06 Dec 2021 22:28:20 +0000
Received: from galois.linutronix.de ([193.142.43.55])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1muMSl-006DD4-Im
 for ath11k@lists.infradead.org; Mon, 06 Dec 2021 22:28:06 +0000
Message-ID: <20211206210224.980989243@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1638829678;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 references:references; bh=YWBvF5zXcDfRUfEoyBk4Kk35zgLL7tyJ9PWeow343Hs=;
 b=jwThvHARsPXTlMHIlndJwa10LjHcshFU6NoML8SG2JGecBMWy4JPiHuWFnGcP7i4Q1Ibj9
 8/eowhkrx1wKGYm2Yxrw7xrDhLIewEAHBE8layal+21UsPmPoYAdbuy3jJUREs5PCuecye
 7m+VUQ/rPIgBX30eS2stYDrLVHUftcTe2LN/Q1eeUdPqRiMNfed020JM797KQYT7nPIA/z
 TmSwV/cB5rCcOQB4kL1Ge9QBNfhiTLnud2sKQVAEnQK9z3iC+nzZSzw4bFmLKQuIgKUo7a
 vIALLKQRlHw2SJH97tyJGigjR7KCwlJGJTEagLbQtpMSi36ZAkynmCJEolc1UQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1638829678;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 references:references; bh=YWBvF5zXcDfRUfEoyBk4Kk35zgLL7tyJ9PWeow343Hs=;
 b=WWO0wDP12OPjmI9cLbgeixKjE+ylewjJ4EqqGA8strpjub+l5CYlIKtxJmN+Pp2T3jnqE9
 pSxUKy0jh2EVgdBQ==
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
Subject: [patch V2 21/23] PCI/MSI: Make pci_msi_domain_check_cap() static
References: <20211206210147.872865823@linutronix.de>
MIME-Version: 1.0
Date: Mon,  6 Dec 2021 23:27:57 +0100 (CET)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211206_142759_806774_63662ED6 
X-CRM114-Status: UNSURE (   8.74  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

No users outside of that file.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Tested-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/pci/msi/irqdomain.c |    5 +++--
 include/linux/msi.h         |    2 --
 2 files changed, 3 insertions(+), 4 deletions(-)

--- a/drivers/pci/msi/irqdomain.c
+++ b/drivers/pci/msi/irqdomain.c
@@ -79,8 +79,9 @@ static inline bool pci_msi_desc_is_multi
  *  1 if Multi MSI is requested, but the domain does not support it
  *  -ENOTSUPP otherwise
  */
-int pci_msi_domain_check_cap(struct irq_domain *domain,
-			     struct msi_domain_info *info, struct device *dev)
+static int pci_msi_domain_check_cap(struct irq_domain *domain,
+				    struct msi_domain_info *info,
+				    struct device *dev)
 {
 	struct msi_desc *desc = first_pci_msi_entry(to_pci_dev(dev));
 
--- a/include/linux/msi.h
+++ b/include/linux/msi.h
@@ -439,8 +439,6 @@ void *platform_msi_get_host_data(struct
 struct irq_domain *pci_msi_create_irq_domain(struct fwnode_handle *fwnode,
 					     struct msi_domain_info *info,
 					     struct irq_domain *parent);
-int pci_msi_domain_check_cap(struct irq_domain *domain,
-			     struct msi_domain_info *info, struct device *dev);
 u32 pci_msi_domain_get_msi_rid(struct irq_domain *domain, struct pci_dev *pdev);
 struct irq_domain *pci_msi_get_device_domain(struct pci_dev *pdev);
 bool pci_dev_has_special_msi_domain(struct pci_dev *pdev);


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
