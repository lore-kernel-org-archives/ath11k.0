Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 275CBC433FE
	for <ath11k@archiver.kernel.org>; Sat, 27 Nov 2021 01:18:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:MIME-Version:References:Subject:Cc
	:To:From:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	List-Owner; bh=xlqPpLanh5vvxKR2ZfUXZUTker4Sy+8H/1Q/SehXILs=; b=cC1tuxGJOF1+wu
	0tjdOPrTRBq6fKqzLo/LiIJqVIUied+TmVTIRz2SLbMnQBCg1hbyFxrMTxq55Sp6id/aM/JUrd8Bi
	BaTBn5pOp62wtZqD4GZHTeVLiUGR0s6IwbNGE8hdkw8xqhfVH2L+mfnV/1SJzw0Vwkm/OK7fUKbqB
	EOWj2QBLyApnn4TWTDo3dy/QAkOfdSy9Slpb8oO8nkFnhjOERlvpg1fp0xfYRHXrwuV9JYcL5OyV2
	p7cG9AhcG4EVfYFomzYoSKxNE+VzFwpYXgzCFAxyED5ZYWh3BIaqL7z3jTniZG9WnQwMtCyOBfCA9
	XsWhHSTKXstNJR1ci2oA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mqmMW-00C7H4-1M; Sat, 27 Nov 2021 01:18:44 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mqmMT-00C7Fu-3K
 for ath11k@lists.infradead.org; Sat, 27 Nov 2021 01:18:42 +0000
Message-ID: <20211126223824.263656943@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1637975919;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 references:references; bh=7H7+YC/Q3X3DUjW7OFUmpmZxFX8YbEmXXunUPCxWTOo=;
 b=Q/BWnFgpqlk/Xfzvk8Enumd9Tv9t7JEEp0DHi4rSBSx9/fQFTFOMhfhrRh+HvFyTryJZg6
 2H6cR7D0a+EEDQ8oQg0OU7d/nbqiZhQyNFyo4bhXjmQLINx5jNITNbKUROyMi6k5AylsFk
 GuHYww9m3gcDcaQkDt89XO76miQ2YMD954fX/YwE6Q6bHL3HhsHaFps2ULrwJQWThfnBPG
 3yUvPsmNh5MonSc8cW1Dzr6keAHLf3o1bfK6y28a4Y/W5AQZNjHBs9tfcg+nJDTYJSjRF0
 mmE0bpwDggg4+Lb75ngYAkUXqkaFYQLfA0sUdXi6vjtaa9R6ZCz5sQ03QYCLSg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1637975919;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 references:references; bh=7H7+YC/Q3X3DUjW7OFUmpmZxFX8YbEmXXunUPCxWTOo=;
 b=lOPEaRrjbm3G3ojV4Pxdg64aaahnAv+fh0zcGZd7hniH2wr2smlEjYaa9TlnTbAnZ42z1s
 Y9bOJ0tKC/T204Cg==
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
Subject: [patch 03/22] genirq/msi: Guard sysfs code
References: <20211126222700.862407977@linutronix.de>
MIME-Version: 1.0
Date: Sat, 27 Nov 2021 02:18:39 +0100 (CET)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211126_171841_519228_3962DD74 
X-CRM114-Status: UNSURE (   6.99  )
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

No point in building unused code when CONFIG_SYSFS=n.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
---
 include/linux/msi.h |   10 ++++++++++
 kernel/irq/msi.c    |    2 ++
 2 files changed, 12 insertions(+)

--- a/include/linux/msi.h
+++ b/include/linux/msi.h
@@ -239,9 +239,19 @@ void __pci_write_msi_msg(struct msi_desc
 void pci_msi_mask_irq(struct irq_data *data);
 void pci_msi_unmask_irq(struct irq_data *data);
 
+#ifdef CONFIG_SYSFS
 const struct attribute_group **msi_populate_sysfs(struct device *dev);
 void msi_destroy_sysfs(struct device *dev,
 		       const struct attribute_group **msi_irq_groups);
+#else
+static inline const struct attribute_group **msi_populate_sysfs(struct device *dev)
+{
+	return NULL;
+}
+static inline void msi_destroy_sysfs(struct device *dev, const struct attribute_group **msi_irq_groups)
+{
+}
+#endif
 
 /*
  * The arch hooks to setup up msi irqs. Default functions are implemented
--- a/kernel/irq/msi.c
+++ b/kernel/irq/msi.c
@@ -72,6 +72,7 @@ void get_cached_msi_msg(unsigned int irq
 }
 EXPORT_SYMBOL_GPL(get_cached_msi_msg);
 
+#ifdef CONFIG_SYSFS
 static ssize_t msi_mode_show(struct device *dev, struct device_attribute *attr,
 			     char *buf)
 {
@@ -204,6 +205,7 @@ void msi_destroy_sysfs(struct device *de
 		kfree(msi_irq_groups);
 	}
 }
+#endif
 
 #ifdef CONFIG_GENERIC_MSI_IRQ_DOMAIN
 static inline void irq_chip_write_msi_msg(struct irq_data *data,


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
