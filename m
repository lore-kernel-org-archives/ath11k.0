Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE16EC41535
	for <ath11k@archiver.kernel.org>; Mon,  6 Dec 2021 22:27:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:MIME-Version:References:Subject:Cc
	:To:From:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	List-Owner; bh=MqgjeCYoE70UrAvpQs9S3/ly7m16/Ggus7oSkH/zePc=; b=vs/4i3vBLsrz2H
	PhaWb9ShYN8CeAcZiVkfCdrtM60A697ONApy2MrAAeJqcxJCfLaguRwXA7XGbJfAD31IPXPlTuoT9
	GbD4iqCzkpYlPejlfhSliv4o75XzhT5zkGnp7Cqzb1W2eNWoULv3cLOlTMLbupZL20cSFmFWCYTrV
	aiKo/Ud+Y4Tg/JoLsa1tCEJitR6dTTyy2UhXkFSOHEcFeV9vDJQMzNtgEOA5ati2cBUgzAFFXNu09
	ISEI7imVCY1g+huyc46bLr/gN5svo/NO87yirQ0CrODYZ4gTzVKU0Diq4JbEAYLzSt9a5MyjDcLUG
	Lej/sGF0EXC5+0ZkWJ6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1muMSO-006Ci1-NH; Mon, 06 Dec 2021 22:27:36 +0000
Received: from galois.linutronix.de ([193.142.43.55])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1muMSJ-006Cc6-N6
 for ath11k@lists.infradead.org; Mon, 06 Dec 2021 22:27:33 +0000
Message-ID: <20211206210224.041777889@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1638829650;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 references:references; bh=tZSxCAPD1C/72AGbeyH6kqtxyoXqz8oMI6L3bIBgwo8=;
 b=VUkO3W8Pm9/sA/VUkP33Z1m5XdVqjjFScjNp9xzbJHH6VrzKV611tW5ns/aEvdBtDB5hhY
 4sUYsRTR30anXGxzbOb0K9PMdNFmLOz3BtlIbLryJFmRON/QnRUAVR/tUTC6oCBXwHrZNU
 z+uQJjknPy98RzoGlyywBCTzDA5LQQ/GGEJBDUQgMdOGLnUvWgS3MwvOzMBbN3MyH24wyE
 wloaWdPwNovCCcXh3rks0tF7L7gx6H5HzNZzGmXGzeG4yaX/ZJz5jQYq+o9N1e9u0u4iqL
 y3XBSQqFZdf+aTZPjClD1dgm+ky3LS8iWYvusLGtZCCQqQWdojsreK8LMBSkSg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1638829650;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 references:references; bh=tZSxCAPD1C/72AGbeyH6kqtxyoXqz8oMI6L3bIBgwo8=;
 b=kAM4q1j8ks4DVQFHaEciD0kyWWmX1az4hnbSd/G606ypPv2fKA8RKlEiRFpQ/EsaY+4iOs
 9cLVCE7hHJDUqHDA==
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
Subject: [patch V2 04/23] genirq/msi: Remove unused domain callbacks
References: <20211206210147.872865823@linutronix.de>
MIME-Version: 1.0
Date: Mon,  6 Dec 2021 23:27:29 +0100 (CET)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211206_142731_947106_44FF6B07 
X-CRM114-Status: UNSURE (   9.90  )
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

No users and there is no need to grow them.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Tested-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Link: https://lore.kernel.org/r/20211126223824.322987915@linutronix.de
---
 include/linux/msi.h |   11 ++++-------
 kernel/irq/msi.c    |    5 -----
 2 files changed, 4 insertions(+), 12 deletions(-)

--- a/include/linux/msi.h
+++ b/include/linux/msi.h
@@ -304,7 +304,6 @@ struct msi_domain_info;
  * @msi_free:		Domain specific function to free a MSI interrupts
  * @msi_check:		Callback for verification of the domain/info/dev data
  * @msi_prepare:	Prepare the allocation of the interrupts in the domain
- * @msi_finish:		Optional callback to finalize the allocation
  * @set_desc:		Set the msi descriptor for an interrupt
  * @handle_error:	Optional error handler if the allocation fails
  * @domain_alloc_irqs:	Optional function to override the default allocation
@@ -312,12 +311,11 @@ struct msi_domain_info;
  * @domain_free_irqs:	Optional function to override the default free
  *			function.
  *
- * @get_hwirq, @msi_init and @msi_free are callbacks used by
- * msi_create_irq_domain() and related interfaces
+ * @get_hwirq, @msi_init and @msi_free are callbacks used by the underlying
+ * irqdomain.
  *
- * @msi_check, @msi_prepare, @msi_finish, @set_desc and @handle_error
- * are callbacks used by msi_domain_alloc_irqs() and related
- * interfaces which are based on msi_desc.
+ * @msi_check, @msi_prepare, @handle_error and @set_desc are callbacks used by
+ * msi_domain_alloc/free_irqs().
  *
  * @domain_alloc_irqs, @domain_free_irqs can be used to override the
  * default allocation/free functions (__msi_domain_alloc/free_irqs). This
@@ -351,7 +349,6 @@ struct msi_domain_ops {
 	int		(*msi_prepare)(struct irq_domain *domain,
 				       struct device *dev, int nvec,
 				       msi_alloc_info_t *arg);
-	void		(*msi_finish)(msi_alloc_info_t *arg, int retval);
 	void		(*set_desc)(msi_alloc_info_t *arg,
 				    struct msi_desc *desc);
 	int		(*handle_error)(struct irq_domain *domain,
--- a/kernel/irq/msi.c
+++ b/kernel/irq/msi.c
@@ -562,8 +562,6 @@ int __msi_domain_alloc_irqs(struct irq_d
 			ret = -ENOSPC;
 			if (ops->handle_error)
 				ret = ops->handle_error(domain, desc, ret);
-			if (ops->msi_finish)
-				ops->msi_finish(&arg, ret);
 			return ret;
 		}
 
@@ -573,9 +571,6 @@ int __msi_domain_alloc_irqs(struct irq_d
 		}
 	}
 
-	if (ops->msi_finish)
-		ops->msi_finish(&arg, 0);
-
 	can_reserve = msi_check_reservation_mode(domain, info, dev);
 
 	/*


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
