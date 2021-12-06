Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC2E5C41535
	for <ath11k@archiver.kernel.org>; Mon,  6 Dec 2021 22:27:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:MIME-Version:Subject:Cc:To:From:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=PsgnCRko6aJEH9CCb6qfBShvpH9YZoLZFLTXPsGZE1Y=; b=339HtMX7KAQen6
	MXO0VhAyCU+eq5jyhNXuzrhpFd8NTWrmnEuiDQVzQy86HWR3uFRd1nOoOBGaHekJA+TpqZC5zUPMR
	WZ7ZUvTpsraGfxr3D69hG0twB/tupufbNoMXll25H96gdfAEnB1WSDnhNWPcEfToapsZKA3UUUJAn
	c93dziGNOvHDFthPHcEz7o6By4h/8xzTjDHVxnDa4rQPAwrJbMkWOmwGdaq9xFfhJQYBvlCJVed+S
	SkE+6+WvMZpQskA9Ote/u0BM5y5ds4NIWXRYa3N0jxipfLKujkiRlz1ZJfEoi9HS9G9xFvtcLJcg7
	s2hVtrMOooWjVSiae4CQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1muMSJ-006Cck-As; Mon, 06 Dec 2021 22:27:31 +0000
Received: from galois.linutronix.de ([193.142.43.55])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1muMSF-006Ca0-T1
 for ath11k@lists.infradead.org; Mon, 06 Dec 2021 22:27:29 +0000
Message-ID: <20211206210147.872865823@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1638829644;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=TvVbtaLszVomfbTSaDkZ3Si83Q0PTUXmzyd/sxp3aOQ=;
 b=2PszHZiuiUTEj+gbLOwH5J07JyOXMbPmbCF5/f0ECB+TDx6fg7HRqd/7nSafRiLEh/tB2J
 I89obIOz4EfihV8wPu6DVbEqAjw/vu0lG3MVaBJQOCX84dIVCgJcpP/4YaTYj0DWyUOU+p
 QY7yu7nySNOGDJllJoRD8mO5pRKX6dZ+TpEE7VtehF+zj9YNKxWJrbFRJPs4IpnpV7iPLb
 eXidnoRUF/iI20Q4u50DI+RHcaKyBY/xpS4sXM1RqwV+zb/rkRAS11jus+lRlFQbQ+/IC4
 zfPKJkcA3/LscOUNOfG7uESwv6dj4mHkFlfcsQphYvz9RbwoDVZGHnz96iSF7w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1638829644;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=TvVbtaLszVomfbTSaDkZ3Si83Q0PTUXmzyd/sxp3aOQ=;
 b=dTYY6yq8X+q85zEA0MFqc5lmEol5cxwjMuFVu15JeS/3f+qTFpB+7//Ug3/O6D2uzzNFJo
 H/Ml5sGXok1eYqCQ==
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Bjorn Helgaas <helgaas@kernel.org>, Marc Zygnier <maz@kernel.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 Kevin Tian <kevin.tian@intel.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Megha Dey <megha.dey@intel.com>, Ashok Raj <ashok.raj@intel.com>,
 linux-pci@vger.kernel.org, Cedric Le Goater <clg@kaod.org>,
 Michael Ellerman <mpe@ellerman.id.au>, Paul Mackerras <paulus@samba.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 linuxppc-dev@lists.ozlabs.org, Juergen Gross <jgross@suse.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 linux-mips@vger.kernel.org, Kalle Valo <kvalo@codeaurora.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 sparclinux@vger.kernel.org, x86@kernel.org, xen-devel@lists.xenproject.org,
 ath11k@lists.infradead.org, Wei Liu <wei.liu@kernel.org>,
 linux-hyperv@vger.kernel.org,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>
Subject: [patch V2 00/23] genirq/msi, PCI/MSI: Spring cleaning - Part 1
MIME-Version: 1.0
Date: Mon,  6 Dec 2021 23:27:23 +0100 (CET)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211206_142728_278397_5004F44F 
X-CRM114-Status: GOOD (  17.83  )
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

   git://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git msi-v2-part-1

For the curious who can't wait for the next part to arrive the full series
is available via:

   git://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git msi-v2-part-3

V1 of this series can be found here:

   https://lore.kernel.org/r/20211126222700.862407977@linutronix.de

Changes versus V1:

  - Add missing includes and use correct variable name in legacy code - Cedric

  - Moved the MSI lock from struct device to struct pci_dev - New patch

    This is really PCI/MSI specific and there is no point to have it
    in every struct device. Neither does it make sense to hide it
    in msi_device_data as the V1 series part 2 did.

  - Picked up Reviewed/Tested/Acked-by tags as appropriate

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
 b/drivers/base/core.c                       |    1 
 b/drivers/irqchip/irq-gic-v2m.c             |    1 
 b/drivers/irqchip/irq-gic-v3-its-pci-msi.c  |    1 
 b/drivers/irqchip/irq-gic-v3-mbi.c          |    1 
 b/drivers/net/wireless/ath/ath11k/pci.c     |    2 
 b/drivers/pci/Makefile                      |    3 
 b/drivers/pci/msi/Makefile                  |    7 
 b/drivers/pci/msi/irqdomain.c               |  267 +++++++++++
 b/drivers/pci/msi/legacy.c                  |   79 +++
 b/drivers/pci/msi/msi.c                     |  647 ++++------------------------
 b/drivers/pci/msi/msi.h                     |   39 +
 b/drivers/pci/msi/pcidev_msi.c              |   43 +
 b/drivers/pci/pci-sysfs.c                   |    7 
 b/drivers/pci/probe.c                       |    4 
 b/drivers/pci/xen-pcifront.c                |    2 
 b/include/linux/device.h                    |    2 
 b/include/linux/msi.h                       |  136 ++---
 b/include/linux/pci.h                       |    2 
 b/kernel/irq/msi.c                          |   41 +
 35 files changed, 702 insertions(+), 1033 deletions(-)

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
