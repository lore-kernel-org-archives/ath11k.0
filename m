Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CF69C433F5
	for <ath11k@archiver.kernel.org>; Sat, 27 Nov 2021 01:20:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:MIME-Version:References:Subject:Cc
	:To:From:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	List-Owner; bh=QA1mhyNHH8afOpoUP97418XJ7Ja82hAV1d0OCy018BQ=; b=E0dXZuDeN6OYm1
	OflQgMjawtZrit6dc/nqB223q3SutXsth/GzHgz1hPTQfT704lgWm1cMbwBoZ3dqUmJgyv6WCJ5AP
	XqDhKqtR7NH1ew5DxtKNRSSn2hzVZ9wkvWNU3AF734A8jge6UD+16ew0gEwuCwT+5tNUY2OdjqZhy
	IWKvrXsnSUiZdyg+RuufjcSsJ2LNCrdFbVD3s0sP84Zen1fC0PWtPVPHclVT3jSwaY94xdIaY9MGJ
	kqE5k6A6lgXEPOtm/QyyVroM6oE1GEjK9s5L2E5EIMRR/ZDnD1NxtXx7vnaBwriI/JHY91jNsCDcM
	Nl6M6+Mck8rnrLJ5DgOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mqmO3-00C9Ay-7o; Sat, 27 Nov 2021 01:20:19 +0000
Received: from galois.linutronix.de ([193.142.43.55])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mqmNU-00C8af-Rp
 for ath11k@lists.infradead.org; Sat, 27 Nov 2021 01:19:47 +0000
Message-ID: <20211126223824.914161382@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1637975983;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 references:references; bh=HvFnLhSNQWkY7FyV6dqkmiDpk27hPnt+iT7sMKioVYY=;
 b=nLVAIHxU7zzvZDcgNYXA194SYdMrO6dCVMw9y6HDD/le7JD9C2QCF1wk/oqJx43iUEDnY1
 pgFSlnrN/ssoMHCXM1uIFRYGaPp1xqbZEnupYzQc1IY8qVYeNbHLiAjPWJl+M4yhP2RdYQ
 cCvlNNeLa1fK+j1OQO1an1R2IQT5f2TQuSGwBcLKRc/fbex/njb0MW28/CMYhqJTqy9tUY
 CVHodIwjaxn70G+E6gtde2Lz44MuDnM9t8twCu61Q+gLHHsjI5TqsEgLxYzGmGm3HlcIN3
 BEj3sWmPgxXgXz1yJGmpdxUJULqvf5Szc7KHc+NFChP1uqJQYAlM8cHG8IC6NA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1637975983;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 references:references; bh=HvFnLhSNQWkY7FyV6dqkmiDpk27hPnt+iT7sMKioVYY=;
 b=1oZXQ7KMDPa4UCKNRSuXOGmdL7VQAHRxAH7SeUCdr1ZzVhtYvvJdA6oJ2iJPmpT4hzHWhx
 P5LB3i92rxk9FGCg==
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
Subject: [patch 14/22] PCI/MSI: Make msix_update_entries() smarter
References: <20211126222700.862407977@linutronix.de>
MIME-Version: 1.0
Date: Sat, 27 Nov 2021 02:19:42 +0100 (CET)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211126_171945_073151_34EFFA41 
X-CRM114-Status: UNSURE (   9.09  )
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
Message-ID: <20211127011942.O-d4f58FIvcMGo956PT9BsWA-pjG8pX6k6ZMqyzQxiQ@z>

No need to walk the descriptors and check for each one whether the entries
pointer function argument is NULL. Do it once.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
---
 drivers/pci/msi.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

--- a/drivers/pci/msi.c
+++ b/drivers/pci/msi.c
@@ -642,8 +642,8 @@ static void msix_update_entries(struct p
 {
 	struct msi_desc *entry;
 
-	for_each_pci_msi_entry(entry, dev) {
-		if (entries) {
+	if (entries) {
+		for_each_pci_msi_entry(entry, dev) {
 			entries->vector = entry->irq;
 			entries++;
 		}


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
