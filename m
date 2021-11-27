Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 190DFC433FE
	for <ath11k@archiver.kernel.org>; Sat, 27 Nov 2021 01:18:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:MIME-Version:References:Subject:Cc
	:To:From:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	List-Owner; bh=s7kwZhj2kDktl6U77wU9o4TerMxeEalUk46QmwNZyh4=; b=AYzCDE5AN3zZiq
	i5yPcR0QGWN2nEYwGYSRKy7mAPvqIVMv8rJfVuOEVel+8qC4XGTY4rQdR1YqR9JnG3S7Nd29dSPiJ
	Es+5cK1oZY3ouZgObUiXeZ7gbepTucyeAk5cmWzoCth/eut+dTfFCDsGM9/3Xsxgr7oE7csj22j8Z
	U07kMYWqHekDfICLOt+xzB4muA4qbHCqfcgcjWRBPml2Mz3cpmef1ByvNn3WyLd8IPCC/ktnHJSqH
	4LrPlSKyApjQ0Ns7fMjXhXrlpnmITxf+VH8Vd8QPUexSzlciLiPoaRyI7LJ+NMuMf6PG7B/QvospK
	jxPQNaWOL5qY5uNgY1Nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mqmMe-00C7Rn-TL; Sat, 27 Nov 2021 01:18:52 +0000
Received: from galois.linutronix.de ([193.142.43.55])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mqmMZ-00C7JP-CM
 for ath11k@lists.infradead.org; Sat, 27 Nov 2021 01:18:50 +0000
Message-ID: <20211126223824.499448912@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1637975926;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 references:references; bh=+rP3SiVoHOK5Hyn2EAGrDg54y7+IEHUse42w3xFRuo4=;
 b=en2BVqplFMhJlJ/67iu0Edu2NrGl2YoL7tfUkBXuWGzeU2hxeKRsBezk52+o99rxhr3938
 TRs0SQYeEY0XTWyetTmz5VEY4LyU/pCwOfsvgmIpv0evVB0njacCp5HZd95Lk6yEtPp2qC
 d1p1yOFMjNpOmU2EZz/humF1AL+c2gchzbmiK8fKoyFQFRNZr0ge/HjuNEWf7dAqZ3u/dl
 ZGfz8C379X5x+ikPMgYdarUXfu9tN65dbvfK9I1hJFDQrDXnn2iLf1UCuWBh5HtK4Sw7VS
 fwKOlxrXeck+pJ2IkumMPe/8tucPvP0pUZ/lUZw7GXQSElER8i5i2Fkh/6Q4mA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1637975926;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 references:references; bh=+rP3SiVoHOK5Hyn2EAGrDg54y7+IEHUse42w3xFRuo4=;
 b=4hUVGqAr7Jj3KAwcapzMWVWkLocnYS1dwMuxMKLswtqj7uo9lVzO01+ZZON8j5/GAbX8Ix
 yWVdyyLvdQ59eaCw==
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Bjorn Helgaas <helgaas@kernel.org>, Marc Zygnier <maz@kernel.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 Kevin Tian <kevin.tian@intel.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Megha Dey <megha.dey@intel.com>, Ashok Raj <ashok.raj@intel.com>,
 linux-pci@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>,
 Paul Mackerras <paulus@samba.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 linuxppc-dev@lists.ozlabs.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 linux-mips@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 sparclinux@vger.kernel.org, x86@kernel.org, xen-devel@lists.xenproject.org,
 ath11k@lists.infradead.org, Wei Liu <wei.liu@kernel.org>,
 linux-hyperv@vger.kernel.org, Juergen Gross <jgross@suse.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>
Subject: [patch 07/22] PCI/MSI: Remove msi_desc_to_pci_sysdata()
References: <20211126222700.862407977@linutronix.de>
MIME-Version: 1.0
Date: Sat, 27 Nov 2021 02:18:45 +0100 (CET)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211126_171847_623569_459778C1 
X-CRM114-Status: UNSURE (   6.69  )
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

Last user is gone long ago.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
---
 drivers/pci/msi.c   |    8 --------
 include/linux/msi.h |    5 -----
 2 files changed, 13 deletions(-)

--- a/drivers/pci/msi.c
+++ b/drivers/pci/msi.c
@@ -1253,14 +1253,6 @@ struct pci_dev *msi_desc_to_pci_dev(stru
 }
 EXPORT_SYMBOL(msi_desc_to_pci_dev);
 
-void *msi_desc_to_pci_sysdata(struct msi_desc *desc)
-{
-	struct pci_dev *dev = msi_desc_to_pci_dev(desc);
-
-	return dev->bus->sysdata;
-}
-EXPORT_SYMBOL_GPL(msi_desc_to_pci_sysdata);
-
 #ifdef CONFIG_PCI_MSI_IRQ_DOMAIN
 /**
  * pci_msi_domain_write_msg - Helper to write MSI message to PCI config space
--- a/include/linux/msi.h
+++ b/include/linux/msi.h
@@ -217,13 +217,8 @@ static inline void msi_desc_set_iommu_co
 	for_each_msi_entry((desc), &(pdev)->dev)
 
 struct pci_dev *msi_desc_to_pci_dev(struct msi_desc *desc);
-void *msi_desc_to_pci_sysdata(struct msi_desc *desc);
 void pci_write_msi_msg(unsigned int irq, struct msi_msg *msg);
 #else /* CONFIG_PCI_MSI */
-static inline void *msi_desc_to_pci_sysdata(struct msi_desc *desc)
-{
-	return NULL;
-}
 static inline void pci_write_msi_msg(unsigned int irq, struct msi_msg *msg)
 {
 }


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
