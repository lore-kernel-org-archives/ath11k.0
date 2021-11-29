Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 039AAC433EF
	for <ath11k@archiver.kernel.org>; Mon, 29 Nov 2021 09:52:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ELZqJ0h8qyJeqIJHipBvBw4fl8PtYvUdloYsu21nbmA=; b=sUOSsE9L7vizo3
	x7H01pb8m2aoZxVq6GYdtQ4Nm1jUBppYD28+WP0QW8EPNFPR1Z8Jwv+k0nkHWEyBkDz4rRS6O4xZ2
	bcazUz9M4MFDW0xcIboseook+kyQ7OH156TVIZCLArLM8DAZG1agIFiL3QCkao0Z1IRPYeHphVAeZ
	1bV9jWrdxj5ovBP9AofAthPx/8ZtdIasqHS5T5oGh0BOOV+tWXuGriC5s+Ui+UKPSBIY1FFwY2aIu
	Z5MBLF7TJjKMFgvyl/g5jsB3En668wUZiVE5PJysGk765msGdOEv1W8IWfgI/PG4eq0rQVaVGdwgV
	LAq8159tSidTxdL8q/oQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mrdKx-000JGd-Q3; Mon, 29 Nov 2021 09:52:39 +0000
Received: from 3.mo552.mail-out.ovh.net ([178.33.254.192])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mrdKu-000JFd-C3
 for ath11k@lists.infradead.org; Mon, 29 Nov 2021 09:52:38 +0000
Received: from mxplan5.mail.ovh.net (unknown [10.109.156.217])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 70F5120ADA;
 Mon, 29 Nov 2021 09:52:31 +0000 (UTC)
Received: from kaod.org (37.59.142.104) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Mon, 29 Nov
 2021 10:52:29 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-104R005f4bc25ac-e2d5-4f6a-8c28-ebe76ecd031f,
 3279756C2EB34864E332BB908A933B747C53BE44) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <ee815cd9-03f3-02f2-a269-ad79ca2af742@kaod.org>
Date: Mon, 29 Nov 2021 10:52:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [patch 00/22] genirq/msi, PCI/MSI: Spring cleaning - Part 1
Content-Language: en-US
To: Thomas Gleixner <tglx@linutronix.de>, LKML <linux-kernel@vger.kernel.org>
CC: <linux-hyperv@vger.kernel.org>, Paul Mackerras <paulus@samba.org>,
 <sparclinux@vger.kernel.org>, Wei Liu <wei.liu@kernel.org>, Ashok Raj
 <ashok.raj@intel.com>, Marc Zygnier <maz@kernel.org>, <x86@kernel.org>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Bjorn Helgaas
 <helgaas@kernel.org>, Jason Gunthorpe <jgg@nvidia.com>,
 <linux-pci@vger.kernel.org>, <xen-devel@lists.xenproject.org>,
 <ath11k@lists.infradead.org>, Kevin Tian <kevin.tian@intel.com>, Heiko
 Carstens <hca@linux.ibm.com>, Alex Williamson <alex.williamson@redhat.com>,
 Megha Dey <megha.dey@intel.com>, Juergen Gross <jgross@suse.com>, Thomas
 Bogendoerfer <tsbogend@alpha.franken.de>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, <linux-mips@vger.kernel.org>,
 <linuxppc-dev@lists.ozlabs.org>
References: <20211126222700.862407977@linutronix.de>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20211126222700.862407977@linutronix.de>
X-Originating-IP: [37.59.142.104]
X-ClientProxiedBy: DAG4EX1.mxp5.local (172.16.2.31) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 03ae1f15-2efb-4469-b086-6ab00679dc25
X-Ovh-Tracer-Id: 11736099157494238108
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrheelgddtlecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthejredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpefgtdehvdejkefhudevkeekffekleetfeeftdekudeliedujeeftdeikeffvefgfeenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtoheplhhinhhugihpphgtqdguvghvsehlihhsthhsrdhoiihlrggsshdrohhrgh
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211129_015236_741615_DA164B9C 
X-CRM114-Status: GOOD (  26.21  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

On 11/27/21 02:18, Thomas Gleixner wrote:
> The [PCI] MSI code has gained quite some warts over time. A recent
> discussion unearthed a shortcoming: the lack of support for expanding
> PCI/MSI-X vectors after initialization of MSI-X.
> 
> PCI/MSI-X has no requirement to setup all vectors when MSI-X is enabled in
> the device. The non-used vectors have just to be masked in the vector
> table. For PCI/MSI this is not possible because the number of vectors
> cannot be changed after initialization.
> 
> The PCI/MSI code, but also the core MSI irq domain code are built around
> the assumption that all required vectors are installed at initialization
> time and freed when the device is shut down by the driver.
>
> Supporting dynamic expansion at least for MSI-X is important for VFIO so
> that the host side interrupts for passthrough devices can be installed on
> demand.
> 
> This is the first part of a large (total 101 patches) series which
> refactors the [PCI]MSI infrastructure to make runtime expansion of MSI-X
> vectors possible. The last part (10 patches) provide this functionality.
> 
> The first part is mostly a cleanup which consolidates code, moves the PCI
> MSI code into a separate directory and splits it up into several parts.
> 
> No functional change intended except for patch 2/N which changes the
> behaviour of pci_get_vector()/affinity() to get rid of the assumption that
> the provided index is the "index" into the descriptor list instead of using
> it as the actual MSI[X] index as seen by the hardware. This would break
> users of sparse allocated MSI-X entries, but non of them use these
> functions.
> 
> This series is based on 5.16-rc2 and also available via git:
> 
>       git://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git msi-v1-part-1
> 
> For the curious who can't wait for the next part to arrive the full series
> is available via:
> 
>       git://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git msi-v1-part-4

After fixing the compile failures, I didn't see any regressions on
these platforms :

   PowerNV, pSeries under KVM and PowerVM, using POWER8/9 processors.

Thanks,

C.

> Thanks,
> 
> 	tglx
> ---
>   arch/powerpc/platforms/4xx/msi.c            |  281 ------------
>   b/Documentation/driver-api/pci/pci.rst      |    2
>   b/arch/mips/pci/msi-octeon.c                |   32 -
>   b/arch/powerpc/platforms/4xx/Makefile       |    1
>   b/arch/powerpc/platforms/cell/axon_msi.c    |    2
>   b/arch/powerpc/platforms/powernv/pci-ioda.c |    4
>   b/arch/powerpc/platforms/pseries/msi.c      |    6
>   b/arch/powerpc/sysdev/Kconfig               |    6
>   b/arch/s390/pci/pci_irq.c                   |    4
>   b/arch/sparc/kernel/pci_msi.c               |    4
>   b/arch/x86/hyperv/irqdomain.c               |   55 --
>   b/arch/x86/include/asm/x86_init.h           |    6
>   b/arch/x86/include/asm/xen/hypervisor.h     |    8
>   b/arch/x86/kernel/apic/msi.c                |    8
>   b/arch/x86/kernel/x86_init.c                |   12
>   b/arch/x86/pci/xen.c                        |   19
>   b/drivers/irqchip/irq-gic-v2m.c             |    1
>   b/drivers/irqchip/irq-gic-v3-its-pci-msi.c  |    1
>   b/drivers/irqchip/irq-gic-v3-mbi.c          |    1
>   b/drivers/net/wireless/ath/ath11k/pci.c     |    2
>   b/drivers/pci/Makefile                      |    3
>   b/drivers/pci/msi/Makefile                  |    7
>   b/drivers/pci/msi/irqdomain.c               |  267 +++++++++++
>   b/drivers/pci/msi/legacy.c                  |   79 +++
>   b/drivers/pci/msi/msi.c                     |  645 ++++------------------------
>   b/drivers/pci/msi/msi.h                     |   39 +
>   b/drivers/pci/msi/pcidev_msi.c              |   43 +
>   b/drivers/pci/pci-sysfs.c                   |    7
>   b/drivers/pci/xen-pcifront.c                |    2
>   b/include/linux/msi.h                       |  135 ++---
>   b/include/linux/pci.h                       |    1
>   b/kernel/irq/msi.c                          |   41 +
>   32 files changed, 696 insertions(+), 1028 deletions(-)
> 


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
