Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EE85C28D13
	for <ath11k@archiver.kernel.org>; Sat, 27 Nov 2021 01:21:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:MIME-Version:References:Subject:Cc
	:To:From:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	List-Owner; bh=IlHHkslWubHZgQ0596wHLYf4tKorHbmtqa36l4JoyH0=; b=UXx7Gd0WLAOes1
	OUfVR742Yej6LzlCW3Hll52p8CbyhHqZBdQ81/y2Sbb6iDWF2X9ZCMy9Iz7/OUKx0AG04PS90zc4a
	9jklIm1U/2JJ47tZqHuwKiNFNqpoAyXf4H2t7/PxiOnfhiG+8I2HW55EkKwHlwP/auihzoDal1ybe
	odeH6dwy0BERLKU5mJEzatPQYwuDlTL6fsnEPDEz9Zm3MdPf8aQedCLzmnoe06Wz1cedx9oEqxlnY
	Pjs8vUFskhJude1B8jG5pibZDWALxiV08zXjvIeAInjgski/3euODAmOEm/OhSSE7voCMuEybuhMJ
	i3F549aJNCXe6pB+BH3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mqmOm-00CA9H-JI; Sat, 27 Nov 2021 01:21:04 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mqmNh-00C8oF-5P
 for ath11k@lists.infradead.org; Sat, 27 Nov 2021 01:20:02 +0000
Message-ID: <20211126223825.375987680@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1637975995;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 references:references; bh=b2AUMZ8n+35cpll0aGngdLAswuTgfFiNP2Zkn1C/x7I=;
 b=ey9VYVwJMRVwcfksR95/YBZo1QlvbZYZfkgR7eb1Bag9qzNXJVS4jhzTRW9yLHvexEKDVG
 NdZfvT2UsBn5RL0J1M+rpZkuXtbS5nqVETijSbR74gN4IMGuh2X3TA+zCERUnJLGu6r7QS
 xejJUwLGFdc68/9VQGrA+Irdjq4KBqDAprh9jYxhOBi5rbMrlRWDhET/p4bI3lf3w6YD4h
 E9/b6kmGP1Gy0ecl+kxuinGZvO3BSkQDIvqLkXs3Q4djlmfg3lY4IS8xh0nFZuCKSVYsOi
 TM8bL2+caOtSm9X4D68tGdAABZpJEayGt8Qun72Z1DAX05A5ADO4k3hxbtYqrQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1637975995;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 references:references; bh=b2AUMZ8n+35cpll0aGngdLAswuTgfFiNP2Zkn1C/x7I=;
 b=esFpcWNsvZJ3Th+y6sturNxS1eWHYEkG46onG7uJo3BAZF4nhSHejJp0haubUPknhdF5iT
 ic49rCWGRUTIKJBw==
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
Subject: [patch 22/22] PCI/MSI: Move descriptor counting on allocation fail to
 the legacy code
References: <20211126222700.862407977@linutronix.de>
MIME-Version: 1.0
Date: Sat, 27 Nov 2021 02:19:55 +0100 (CET)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211126_171957_402161_63475D52 
X-CRM114-Status: GOOD (  13.14  )
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
Message-ID: <20211127011955.BefU86RBGS2xC1LDUCikMvVhdesJ4Mj1mvGgjgPRB-k@z>

The irqdomain code already returns the information. Move the loop to the
legacy code.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
---
 drivers/pci/msi/legacy.c |   20 +++++++++++++++++++-
 drivers/pci/msi/msi.c    |   19 +------------------
 2 files changed, 20 insertions(+), 19 deletions(-)

--- a/drivers/pci/msi/legacy.c
+++ b/drivers/pci/msi/legacy.c
@@ -50,9 +50,27 @@ void __weak arch_teardown_msi_irqs(struc
 	}
 }
 
+static int pci_msi_setup_check_result(struct pci_dev *dev, int type, int ret)
+{
+	struct msi_desc *entry;
+	int avail = 0;
+
+	if (type != PCI_CAP_ID_MSIX || ret >= 0)
+		return ret;
+
+	/* Scan the MSI descriptors for successfully allocated ones. */
+	for_each_pci_msi_entry(entry, dev) {
+		if (entry->irq != 0)
+			avail++;
+	}
+	return avail ? avail : ret;
+}
+
 int pci_msi_legacy_setup_msi_irqs(struct pci_dev *dev, int nvec, int type)
 {
-	return arch_setup_msi_irqs(dev, nvec, type);
+	int ret = arch_setup_msi_irqs(dev, nvec, type);
+
+	return pci_msi_setup_check_result(dev, type, ret);
 }
 
 void pci_msi_legacy_teardown_msi_irqs(struct pci_dev *dev)
--- a/drivers/pci/msi/msi.c
+++ b/drivers/pci/msi/msi.c
@@ -609,7 +609,7 @@ static int msix_capability_init(struct p
 
 	ret = pci_msi_setup_msi_irqs(dev, nvec, PCI_CAP_ID_MSIX);
 	if (ret)
-		goto out_avail;
+		goto out_free;
 
 	/* Check if all MSI entries honor device restrictions */
 	ret = msi_verify_entries(dev);
@@ -634,23 +634,6 @@ static int msix_capability_init(struct p
 	pcibios_free_irq(dev);
 	return 0;
 
-out_avail:
-	if (ret < 0) {
-		/*
-		 * If we had some success, report the number of IRQs
-		 * we succeeded in setting up.
-		 */
-		struct msi_desc *entry;
-		int avail = 0;
-
-		for_each_pci_msi_entry(entry, dev) {
-			if (entry->irq != 0)
-				avail++;
-		}
-		if (avail != 0)
-			ret = avail;
-	}
-
 out_free:
 	free_msi_irqs(dev);
 


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
