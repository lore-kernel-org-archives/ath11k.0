Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6D79C433EF
	for <ath11k@archiver.kernel.org>; Sat, 27 Nov 2021 01:18:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:MIME-Version:References:Subject:Cc
	:To:From:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	List-Owner; bh=fglefE8C6GvMW/k2n5QNbgH6kzFie+PZsZL6Vywq+T8=; b=Whf8/XCXhs+Npz
	BmhAce43i9vubpOmKabJlC/N7mkQtmk1GBrT/O+JJZOJcUNQMRWZwhYy5oJPV8DF9amDJhsFxrTAs
	GXq8ndnlKl84T4zuSURt5AbueCoLZX1aAAXt36tnKIq7ZG2UO+o7jjEigWSkZf/EqHoUKiMB7GvaM
	0gA467CcHvbnLlrFdHXT9ITdFeVqSmo6VdW+nrYnj7ggMD9P4zJ5MWeI1vriuTVhIGv9i1zDOu+XV
	EmfRo7dDmo6C6PLooH3IGWE7u2GVpNJFxxru/ozWIUxloWf7bw2du8JL8yVVtO9SaUbcd6g7+eERE
	Ix+6+1Zn330nB0MDH+Lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mqmMb-00C7MW-CB; Sat, 27 Nov 2021 01:18:49 +0000
Received: from galois.linutronix.de ([193.142.43.55])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mqmMX-00C7HN-Ay
 for ath11k@lists.infradead.org; Sat, 27 Nov 2021 01:18:46 +0000
Message-ID: <20211126223824.322987915@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1637975922;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 references:references; bh=AwO21SR5HwD8yhhWfgGPPa41s/dLuMAByqtyG5X5FJI=;
 b=j5FW789Ucan2sEhmMHex1zEIGRCewybYb0k8vFZpAesryvACIyGEZCuW6OE6nyhgwYWoBs
 36GH4PXQIVsT3wfXMUdaH4udB5laQh8tV+NIjXJzIPMPqTd6t644l6MErYfjYLAjwAjp+o
 ydn+khroLUbvItgILdwESI8UiLnPxM+QMi0iHL5UhqTaJghKxNN4F0JRsvhGpzMnBv1oBf
 COAwREGWqZiLc9GjyMnAPCNjOCorYHSzdauf6MnqLvmW4HHJgkWBLQO4I1iZcfOoWX9kgu
 gehHU66uY7Fvy97lhtsmfTJEYw48j8MwFpuqfKGK9JGha/E+Q0NJD/5BY0epqA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1637975922;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 references:references; bh=AwO21SR5HwD8yhhWfgGPPa41s/dLuMAByqtyG5X5FJI=;
 b=dNlMdV5dyz9a7jSmk6oMvSOh4AQ8w3oaFI11LvuPRDM7Ktke1mADQwNnAcmbrjJhHto0ik
 tApE8jduCqPTMQDA==
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
Subject: [patch 04/22] genirq/msi: Remove unused domain callbacks
References: <20211126222700.862407977@linutronix.de>
MIME-Version: 1.0
Date: Sat, 27 Nov 2021 02:18:40 +0100 (CET)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211126_171845_550753_88A8DA03 
X-CRM114-Status: GOOD (  10.06  )
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
