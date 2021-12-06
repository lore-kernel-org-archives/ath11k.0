Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B681DC433EF
	for <ath11k@archiver.kernel.org>; Mon,  6 Dec 2021 22:28:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:MIME-Version:References:Subject:Cc
	:To:From:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	List-Owner; bh=mRPYUg4Z8+hz0Yhx0OyzDr85VTeGtNHD2E3VaZo8A3A=; b=mrvZvQDeHH68te
	dSmPqQx6IQsVF0YcvZfR2vl11v5+6ZnZXEKyxHjBwIYmdJLFH2kp9edbNB29K9qQ2ErTXvECtsI8E
	t9c8cNJodC5v6lgcJbj+IGkWliPNh19hKiA/+9XW+vVV8VTFSEN4RgDCIE81fHdnijUwTaHxg//Ei
	H3JrmpZNhoaSDSXTDyjT/OwPvqN3nSd3ULCt67aqm+QOrPQ7xNtlj+hmga17HUjEJqGigGyNaHy3N
	qyzcAeN3bqmlOuqsOA45aVukxIkPTc61CdrbB9jF5vhV7W6RVRpfdIGMcMZL+4fmVk3JnETDc/nxt
	RfcYdWV02lp30GTWe2Vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1muMT8-006DT2-BF; Mon, 06 Dec 2021 22:28:22 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1muMSo-006DGM-O2
 for ath11k@lists.infradead.org; Mon, 06 Dec 2021 22:28:09 +0000
Message-ID: <20211206210225.101336873@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1638829681;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 references:references; bh=DA21nVmLDiBI7abTCMjgj20KY6xV+oZ7nL3Tb95GpzU=;
 b=tUgqDZDZ/EiCdKplAETvDx9zP2J7lXVbAOyLOoBuYDH6TGhvuPG60E8xxxj2easlDQNPkn
 zTUdmJbnIRjdW2jZn22BV2YC4f0v6JUg4B85PNY0gmnqpQ/sN1zmKIaFOZKwqGTNC8Cwta
 Zuzg0fNd26HEMDHArMjtG0lzJFq888jFDvle1JTBYdcc+inM3sPjBJytAfcyCtrn23O2UA
 KEo+a2AtJrT7M4ZyZw3GWFzmCrk8w7SJ8if/eriSWmpCeXjmWpgB3652GOnCNeZesHt7bK
 srYzZDxpjI6VQFY1vaT/mjtrbyNnxnAjKtFj8+UQL1Hs+wIUbfpLlFZD9d5QMQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1638829681;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 references:references; bh=DA21nVmLDiBI7abTCMjgj20KY6xV+oZ7nL3Tb95GpzU=;
 b=MCrfZbg73639x4t4CYmepEMeEst8qlRnGzxNB/5IvDcEPSsvluAaurSvCLQW1KB8HRZ02F
 1dXwMChHv9TjP5Cw==
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
Subject: [patch V2 23/23] PCI/MSI: Move descriptor counting on allocation fail
 to the legacy code
References: <20211206210147.872865823@linutronix.de>
MIME-Version: 1.0
Date: Mon,  6 Dec 2021 23:28:00 +0100 (CET)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211206_142803_002030_6F05D0C6 
X-CRM114-Status: GOOD (  12.98  )
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

The irqdomain code already returns the information. Move the loop to the
legacy code.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Tested-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
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
