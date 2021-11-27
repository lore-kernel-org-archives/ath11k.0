Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A03C4C4332F
	for <ath11k@archiver.kernel.org>; Sat, 27 Nov 2021 01:18:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:MIME-Version:Subject:Cc:To:From:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Sms0LjqMVo4iZ3r8mFFY84+lw6Qt/U+78e4vT11glK0=; b=vhM71xCwVes8yt
	4F2SVjI4Z4LKlJ/Kx8tM0VYyvzlSLTvxvViFM8YDY4dwuhb785YMBuhXUkRWNOV5Dk/KPcLmI94h2
	Swq+M/eXd/yAfogJcVq4nDrFQDYpRM57sOphQnRW00Snok8oUhBRcWeGcDKI8/FQ6e2e/OXTA8nJO
	D2TenJuBcJSRFUF5FgvP05m3C9xjPn6TIg7O9xB5ix0HyaeysG7WwyGKuKUlhQK//J24qk5CMqCPF
	wzyiFwHur30RJBcDLcjqaM7wuNJV2Wq6GFGieZI/PS+bRfvsV2I0rnt3oR64rwcP/+Qa50U+OikS2
	nki2EI84HQUNfuXWU5tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mqmMY-00C7JO-DA; Sat, 27 Nov 2021 01:18:46 +0000
Received: from galois.linutronix.de ([193.142.43.55])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mqmMT-00C7Fc-6r
 for ath11k@lists.infradead.org; Sat, 27 Nov 2021 01:18:44 +0000
Message-ID: <20211126222700.862407977@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1637975915;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=yycwdrBPyffnUpJMIEsWOSM4kLQ6cxBvXzwUm35xG8E=;
 b=DCccYnZ0yiKVC0u4+n9H7FGmyRWRAGxhw5lrXeLif2IGAZr2rY9i+43Gc7Jsnud/oidZaZ
 LrE05UjXTCVSyDbmgOY0HxqDRbgAp4/y2qAPiBbi9Kif3xh1IRuv+y3cBqvYsowoPm/WUk
 on0YrcUZq1Cix85vFTL/gxX7VMgOIB65lC5o4RFDq43U76Ck4A4DQQ8l0aK00NPb8MNzf1
 +R+QnmSKpPY5SIbzSJT2d2nsAUVEpzoB+W6mglKPZfD5NcRonwy3W9aAXRIOuuFkxKApoo
 q69j8LzAaUKTG+q9KEnL6HEfmmniRk/WIf4JJGwI6N1sJcqzmoeXfX/O3IGlFA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1637975915;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=yycwdrBPyffnUpJMIEsWOSM4kLQ6cxBvXzwUm35xG8E=;
 b=l69jhsGH0nQzlU5HDD675NHbpXuRhbgyrkanFSndKRF1Uq0JyAqp7+zU1xeEBSXpgtUx6d
 EqGASFw1EGmh4PDQ==
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
Subject: [patch 00/22] genirq/msi, PCI/MSI: Spring cleaning - Part 1
MIME-Version: 1.0
Date: Sat, 27 Nov 2021 02:18:34 +0100 (CET)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211126_171841_572156_34FCB9F8 
X-CRM114-Status: GOOD (  14.56  )
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

The [PCI] MSI code has gained quite some warts over time. A recent
discussion unearthed a shortcoming: the lack of support for expanding
PCI/MSI-X vectors after initialization of MSI-X.

PCI/MSI-X has no requirement to setup all vectors when MSI-X is enabled in
the device. The non-used vectors have just to be masked in the vector
table. For PCI/MSI this is not possible because the number of vectors
cannot be changed after initialization.

The PCI/MSI code, but also the core MSI irq domain code are built around
the assumption that all required vectors are installed at initialization
time and freed when the device is shut down by the driver.

Supporting dynamic expansion at least for MSI-X is important for VFIO so
that the host side interrupts for passthrough devices can be installed on
demand.

This is the first part of a large (total 101 patches) series which
refactors the [PCI]MSI infrastructure to make runtime expansion of MSI-X
vectors possible. The last part (10 patches) provide this functionality.

The first part is mostly a cleanup which consolidates code, moves the PCI
MSI code into a separate directory and splits it up into several parts.

No functional change intended except for patch 2/N which changes the
behaviour of pci_get_vector()/affinity() to get rid of the assumption that
the provided index is the "index" into the descriptor list instead of using
it as the actual MSI[X] index as seen by the hardware. This would break
users of sparse allocated MSI-X entries, but non of them use these
functions.

This series is based on 5.16-rc2 and also available via git:

     git://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git msi-v1-part-1

For the curious who can't wait for the next part to arrive the full series
is available via:

     git://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git msi-v1-part-4

Thanks,

	tglx
---
 arch/powerpc/platforms/4xx/msi.c            |  281 ------------
 b/Documentation/driver-api/pci/pci.rst      |    2 
 b/arch/mips/pci/msi-octeon.c                |   32 -
 b/arch/powerpc/platforms/4xx/Makefile       |    1 
 b/arch/powerpc/platforms/cell/axon_msi.c    |    2 
 b/arch/powerpc/platforms/powernv/pci-ioda.c |    4 
 b/arch/powerpc/platforms/pseries/msi.c      |    6 
 b/arch/powerpc/sysdev/Kconfig               |    6 
 b/arch/s390/pci/pci_irq.c                   |    4 
 b/arch/sparc/kernel/pci_msi.c               |    4 
 b/arch/x86/hyperv/irqdomain.c               |   55 --
 b/arch/x86/include/asm/x86_init.h           |    6 
 b/arch/x86/include/asm/xen/hypervisor.h     |    8 
 b/arch/x86/kernel/apic/msi.c                |    8 
 b/arch/x86/kernel/x86_init.c                |   12 
 b/arch/x86/pci/xen.c                        |   19 
 b/drivers/irqchip/irq-gic-v2m.c             |    1 
 b/drivers/irqchip/irq-gic-v3-its-pci-msi.c  |    1 
 b/drivers/irqchip/irq-gic-v3-mbi.c          |    1 
 b/drivers/net/wireless/ath/ath11k/pci.c     |    2 
 b/drivers/pci/Makefile                      |    3 
 b/drivers/pci/msi/Makefile                  |    7 
 b/drivers/pci/msi/irqdomain.c               |  267 +++++++++++
 b/drivers/pci/msi/legacy.c                  |   79 +++
 b/drivers/pci/msi/msi.c                     |  645 ++++------------------------
 b/drivers/pci/msi/msi.h                     |   39 +
 b/drivers/pci/msi/pcidev_msi.c              |   43 +
 b/drivers/pci/pci-sysfs.c                   |    7 
 b/drivers/pci/xen-pcifront.c                |    2 
 b/include/linux/msi.h                       |  135 ++---
 b/include/linux/pci.h                       |    1 
 b/kernel/irq/msi.c                          |   41 +
 32 files changed, 696 insertions(+), 1028 deletions(-)
-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
