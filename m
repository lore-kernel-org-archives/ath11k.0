Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC368C433F5
	for <ath11k@archiver.kernel.org>; Mon,  6 Dec 2021 22:27:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:MIME-Version:References:Subject:Cc
	:To:From:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	List-Owner; bh=7Dn96rDUCvxsHWOut1Qq0KZbOljHJYkYDIbUHoUC1Z4=; b=yoYAdDaf03UG7D
	I+MbHbrkicYPHO75QnPP/6/X85rQwZRrqd4VX5w5GVHUu3ewaCdvm5Tvw7IcXAoiobGTHgwky0Oww
	zKDfaSftEoFDaxiDTmoyAbG1Tzvv1oXC3acUpGE6/cVGb7vu6AxTd60lBwwdCnbWlyb/GR54MIyXa
	3CEKCj+Jt8bfN2gt+2aj2eWqJV8zfKVzyevfACgcPmMc0Y46RP7kpHgPT//+zdpv6ORrYEm/Fr+rm
	/NstcVwtNPwdHYny56VKIL34gy/GLAwo40mVKXGStkAZj6EMPTbSI9Zvqo89OaSoqw8B2DKhfxfag
	BKLQm0sQFT2yg/XgLXqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1muMST-006Cq4-Fw; Mon, 06 Dec 2021 22:27:41 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1muMSQ-006CkD-UB
 for ath11k@lists.infradead.org; Mon, 06 Dec 2021 22:27:40 +0000
Message-ID: <20211206210224.265589103@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1638829657;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 references:references; bh=OKsXQmZewVMh9C4veaPA025YU+pW4cMZqzIAn23b/9c=;
 b=vZzNCRO+uOrMt1rLYUlSjWHvY3GnOwXQ/odIk4OnimL55yM4E7H9Z+gKxR4cdWzJuc9jJT
 M0aZip9AGf/BRov7wd4DUsRP6NuHKtBNXayKEfTNAPYWG4mlPDCTJXpLfq+Eq2Q7uel0c0
 GCYlxK1amEskkZn0CPcuIPlwQANt3pdUSVU0mXb6Dh6glegghN2NwscVEl8RJS6xJpYmzr
 0oSjRQ0h7Lm4xi7TTTOAuPFvY1F1jeW22TqUuxURSvBD6YjS5m5HOdgSgSZmuNW7/hljHH
 0p6i/mhLMFw2u59Zr1gi+Goyq9OYh0ugIdb202nzF0CcX0f/aD/i2jlLaPiQJw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1638829657;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 references:references; bh=OKsXQmZewVMh9C4veaPA025YU+pW4cMZqzIAn23b/9c=;
 b=M/NxrnxGKVPLqAlsqI5UQ6dl9IZUEhUwGcQJKRyC/Ho89KfJQzOP0MU4EFQc7/B84xAAnW
 7QekxbEDbxz2NvAA==
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
Subject: [patch V2 08/23] PCI/sysfs: Use pci_irq_vector()
References: <20211206210147.872865823@linutronix.de>
MIME-Version: 1.0
Date: Mon,  6 Dec 2021 23:27:36 +0100 (CET)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211206_142739_149559_5F09E45B 
X-CRM114-Status: UNSURE (   8.04  )
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

instead of fiddling with msi descriptors.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Tested-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/pci/pci-sysfs.c |    7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

--- a/drivers/pci/pci-sysfs.c
+++ b/drivers/pci/pci-sysfs.c
@@ -62,11 +62,8 @@ static ssize_t irq_show(struct device *d
 	 * For MSI, show the first MSI IRQ; for all other cases including
 	 * MSI-X, show the legacy INTx IRQ.
 	 */
-	if (pdev->msi_enabled) {
-		struct msi_desc *desc = first_pci_msi_entry(pdev);
-
-		return sysfs_emit(buf, "%u\n", desc->irq);
-	}
+	if (pdev->msi_enabled)
+		return sysfs_emit(buf, "%u\n", pci_irq_vector(pdev, 0));
 #endif
 
 	return sysfs_emit(buf, "%u\n", pdev->irq);


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
