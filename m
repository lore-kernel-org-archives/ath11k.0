Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAFCAC433F5
	for <ath11k@archiver.kernel.org>; Mon,  6 Dec 2021 23:30:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:MIME-Version:References:Subject:Cc
	:To:From:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	List-Owner; bh=yaD0yzYN8YYeQkuBG3PO6ZuAMjSIqVCSUlhg3l2ai50=; b=bpn/TSaeydX1ad
	5AVYxZfbE675GrJhhQ7ttIw15NTKbxHwdkzpXWBv/ZnaFhg27EK9iBVH/uFKQTRSNRv4qUMfZ/Fqd
	W6OQR0rojfLssq5cZFXd1Wn0L7Dtkx6A8oVmvTR2d8C4+KfSflZzSXybGnrWFr0qtY1Ch4dVbb5sM
	CV/MhGTj4MQHjxekoimzp4np35o+dPtU60N6B2KlVwJBtDa37TMqDP55bDQjL+NpAR7zWNi0rG1wy
	NJtV694DKN3B01HnYEoJNzRnt9swX6nNBMThKvApxzQVxHl8BuJRUXzFH20ssWslrQe9/GTsxZvmw
	vClnvdMumF2/gRGC1r0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1muNR6-006VtA-OO; Mon, 06 Dec 2021 23:30:20 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1muMSY-006CwI-IC
 for ath11k@lists.infradead.org; Mon, 06 Dec 2021 22:27:52 +0000
Message-ID: <20211206210224.539281124@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1638829665;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 references:references; bh=fpyg7awX8dijQzBRp+WIS78Jmos3C/8mTMn+TSrhxD8=;
 b=pnGIDteYP84F0igC2k+ACUhibYQ3881OhRiiuaVIOBjTshXhjGeVdgZAA/lcK5sjvLEMoj
 ROvDFYYNJX0JhR2QOKUEjXyWb04lLq7PP9xV81Z0D1FytvGg8OABck9JmC/ylB+YU2AvRJ
 PZVaY5Ia3WuXqX49dyC//GQiLcA+5A6GZy5/1+M3d4XVPgxEHo1T/dGhvFuUZ1a4SJvQjn
 ICbirvZcyT0c9k1KJC4jGdKAhnGZprc4Xqsi6XNBDU2/0hwWf55EV2aY3VwLmgUvxv9n/d
 Nfe/m+FudbplubW4O/Khqp8m6T0J7JnGYcrRL/PejELQssL7PtUMHvHQVkjmhA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1638829665;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 references:references; bh=fpyg7awX8dijQzBRp+WIS78Jmos3C/8mTMn+TSrhxD8=;
 b=RuOHGkoAA1Vj7KuipSnVapOZhwsUvKElxjyliNOso5sc0g+RXjuUG8oJb8SOmIunMIh0Pt
 uWzxF181jxyPh3AQ==
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
Subject: [patch V2 13/23] PCI/MSI: Cleanup include zoo
References: <20211206210147.872865823@linutronix.de>
MIME-Version: 1.0
Date: Mon,  6 Dec 2021 23:27:44 +0100 (CET)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211206_142746_832676_E30B1DF6 
X-CRM114-Status: UNSURE (   6.93  )
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

Get rid of the pile of unneeded includes which accumulated over time.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Tested-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
---
V2: Address build fail on powerpc - Cedric
---
 drivers/pci/msi.c |   16 ++++------------
 1 file changed, 4 insertions(+), 12 deletions(-)

--- a/drivers/pci/msi.c
+++ b/drivers/pci/msi.c
@@ -7,22 +7,14 @@
  * Copyright (C) 2016 Christoph Hellwig.
  */
 
+#include <linux/acpi_iort.h>
 #include <linux/err.h>
-#include <linux/mm.h>
-#include <linux/irq.h>
-#include <linux/interrupt.h>
 #include <linux/export.h>
-#include <linux/ioport.h>
-#include <linux/pci.h>
-#include <linux/proc_fs.h>
-#include <linux/msi.h>
-#include <linux/smp.h>
-#include <linux/errno.h>
-#include <linux/io.h>
-#include <linux/acpi_iort.h>
-#include <linux/slab.h>
+#include <linux/irq.h>
 #include <linux/irqdomain.h>
+#include <linux/msi.h>
 #include <linux/of_irq.h>
+#include <linux/pci.h>
 
 #include "pci.h"
 


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
