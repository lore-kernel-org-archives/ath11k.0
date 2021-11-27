Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC117C433F5
	for <ath11k@archiver.kernel.org>; Sat, 27 Nov 2021 01:19:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:MIME-Version:Subject:Cc:To:From:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=NjjbMEHR9h2HTVLljRK6kp92rMU6AePmO/gVIdV0hNY=; b=29U9FamklmhaE5
	Jfwc3KLB59MGZag2bOSZU+Y5GLYVKNNebNWcYPuPNOBNWm5yUyxd/2H20SGU+nVi6Xdd6/zSnfFlY
	vcmi6jOxwYH87jdOzlhRDco38lTumq+yagzbWkUZFyvPfj6pdt/BrfcOzGU/h9pCTSB7qNuCcV0K4
	KCneVYtX0uQPVGW2oq1kEP9cPhBXDvRRaZ3lbN4yPfKLu8D2okrLml/ScHJH3v1238ROkJUoUT3CG
	YtIiHsTvVrBIhEqqf5BURX7phkmEOPJ3GlXbZ43bW2fsenpqyl+mlMtSoF6+yV7m/pS9FiAj4HKij
	+i1laO1nN4wdNJqxmehg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mqmNE-00C8Ec-J6; Sat, 27 Nov 2021 01:19:28 +0000
Received: from galois.linutronix.de ([193.142.43.55])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mqmN8-00C84y-LR
 for ath11k@lists.infradead.org; Sat, 27 Nov 2021 01:19:24 +0000
Message-ID: <20211126222700.862407977@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1637975961;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=dz+OhqNvUr9qcj4hBHSmJm3StmH1ayKUMDsS7c1/nyo=;
 b=hN+4spS3TMXDkqfUqEmJ9Q/KMS5D3jtlbPyy5sFM0vzt9tJ3OucTlyqxTh7IuZUj2aDMLU
 ZDeZKf2CAQVkg9z9CU43DNWnFg3/7hrZysWDOJqScxW19/nlOEosiGVfhdaSnv61zNTAq3
 g8lkERFO5y4Qc+o4XLLxHi0GiCVc5ZuC7/w5ZICrpMqUWqvGnO0bJ0nL9cfQwryG/4zhht
 TimG/GUiuetxcX9A8Nd/BSKpP30RdpOJ9eS1hnRikPx67uOv2VP1PtM5IklK87WgluDjxQ
 Eo7Kjh8fdnYYl56I9o1wJZcBbTmg2/I87rdi9HCQOAll7+/Yqf8ukFR78eJhvw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1637975961;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=dz+OhqNvUr9qcj4hBHSmJm3StmH1ayKUMDsS7c1/nyo=;
 b=ioOSz9CwpOLy5rcIumddu0bfOCT14ff5PEJyDJRFQjcGIrrDsZc99q5ItizXds9+ZxdIaJ
 E+I1dFNX0j5JSrBg==
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
Date: Sat, 27 Nov 2021 02:19:20 +0100 (CET)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211126_171923_044741_718032BB 
X-CRM114-Status: GOOD (  14.34  )
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
Message-ID: <20211127011920.PigUD033y650VWOqZEPsUDP66bpieBP475sWKCUj0NM@z>

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

The series is based on 5.16-rc2 and also available via git:

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
