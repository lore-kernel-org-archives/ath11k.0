Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E02D8C4167D
	for <ath11k@archiver.kernel.org>; Sat, 27 Nov 2021 01:18:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:MIME-Version:References:Subject:Cc
	:To:From:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	List-Owner; bh=qKqJN7bvQ07wRhFIC9kp4JESkZFQar0GvJBdbNHPWSE=; b=qTynLUFM2k8XgZ
	8ScugHZXu1lwm410kl1dqdVmMsS038HfyjgMkErHRFS9b2P4O8RWsGYisBJ03O5vl8oO44+laiQ7y
	zSHOM23wrC+AhEBMCbtpjxWvaqWn6pEN4hxDho7vryuMrNvGzUAgA0IKsrhHHliCmsXTfFAPO4UcX
	yvErn2Af+BMopcEybT/VvmBkRlMgxV15xdRMgoaTCoV4/ZYxS3ZhzwUPa6KMRPGLVZQR2CRP1hysX
	ZVtDnwn734MKnuTDakaDCM9gLzsv3P44/TnxSZ33WHLBOG22bvqCwpOxOg2U5bv+Th/RpgPO2lpWi
	WzMdZNjO5rRJXNNmEFMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mqmMi-00C7WG-Cl; Sat, 27 Nov 2021 01:18:56 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mqmMc-00C7NT-VA
 for ath11k@lists.infradead.org; Sat, 27 Nov 2021 01:18:53 +0000
Message-ID: <20211126223824.618089023@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1637975929;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 references:references; bh=AC2FZ3NgPgtEmYfcPESal194oN272JgZRDrbkWg3jyI=;
 b=fY2o7bDZAUVc/zoI1x+1iRosxr2o2nOfaSNbzN7bFTNRKIq0WzWEHfq/yLnAGd6hff0U9n
 oSfclkWuqUl8kL0RsAjXx/6ZF/8AgYMW392ffBX68wjqMTfc9LsyqwphWk32oKADWGFmZg
 LMS75NESl6jj6lfsrSs7STcgr/rqRpvCNcjveF5FEEZ4BXGz1QOfOXz8p2PLkQcGAi8DL8
 13N+zlDE0Y8kK2uM6gcnpAN4PSK+XxyxqfhISdV6PVrTMh8xtSBavQThj6ET55FLZP/Xtv
 T9/pwLYQjtVROBa4RukaM2jD0Mspyu8Aj1dW+31SqK2OwIpA+qBnfuXpm68ZZQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1637975929;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 references:references; bh=AC2FZ3NgPgtEmYfcPESal194oN272JgZRDrbkWg3jyI=;
 b=IYYLi9B8sK3zKuIQC8Azf7fN1Zp2VtQ/UXo2UA05k/m9XK5bwyWcY9FFuGj7In2IEZpvp6
 C+cyGGYnlNvmfcCQ==
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Bjorn Helgaas <helgaas@kernel.org>, Marc Zygnier <maz@kernel.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 Kevin Tian <kevin.tian@intel.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Megha Dey <megha.dey@intel.com>, Ashok Raj <ashok.raj@intel.com>,
 linux-pci@vger.kernel.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 linux-mips@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>,
 Paul Mackerras <paulus@samba.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 linuxppc-dev@lists.ozlabs.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 sparclinux@vger.kernel.org, x86@kernel.org, xen-devel@lists.xenproject.org,
 ath11k@lists.infradead.org, Wei Liu <wei.liu@kernel.org>,
 linux-hyperv@vger.kernel.org, Juergen Gross <jgross@suse.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>
Subject: [patch 09/22] MIPS: Octeon: Use arch_setup_msi_irq()
References: <20211126222700.862407977@linutronix.de>
MIME-Version: 1.0
Date: Sat, 27 Nov 2021 02:18:48 +0100 (CET)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211126_171851_227237_B81374CC 
X-CRM114-Status: GOOD (  11.66  )
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

The core code provides the same loop code except for the MSI-X reject. Move
that to arch_setup_msi_irq() and remove the duplicated code.

No functional change.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org
---
 arch/mips/pci/msi-octeon.c |   32 +++-----------------------------
 1 file changed, 3 insertions(+), 29 deletions(-)

--- a/arch/mips/pci/msi-octeon.c
+++ b/arch/mips/pci/msi-octeon.c
@@ -68,6 +68,9 @@ int arch_setup_msi_irq(struct pci_dev *d
 	u64 search_mask;
 	int index;
 
+	if (desc->pci.msi_attrib.is_msix)
+		return -EINVAL;
+
 	/*
 	 * Read the MSI config to figure out how many IRQs this device
 	 * wants.  Most devices only want 1, which will give
@@ -182,35 +185,6 @@ int arch_setup_msi_irq(struct pci_dev *d
 	return 0;
 }
 
-int arch_setup_msi_irqs(struct pci_dev *dev, int nvec, int type)
-{
-	struct msi_desc *entry;
-	int ret;
-
-	/*
-	 * MSI-X is not supported.
-	 */
-	if (type == PCI_CAP_ID_MSIX)
-		return -EINVAL;
-
-	/*
-	 * If an architecture wants to support multiple MSI, it needs to
-	 * override arch_setup_msi_irqs()
-	 */
-	if (type == PCI_CAP_ID_MSI && nvec > 1)
-		return 1;
-
-	for_each_pci_msi_entry(entry, dev) {
-		ret = arch_setup_msi_irq(dev, entry);
-		if (ret < 0)
-			return ret;
-		if (ret > 0)
-			return -ENOSPC;
-	}
-
-	return 0;
-}
-
 /**
  * Called when a device no longer needs its MSI interrupts. All
  * MSI interrupts for the device are freed.


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
