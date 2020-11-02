Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mout-p-101.mailbox.org ([80.241.56.151])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kZeO1-0008SR-0o
 for ath11k@lists.infradead.org; Mon, 02 Nov 2020 18:16:59 +0000
Received: from smtp2.mailbox.org (smtp2.mailbox.org [80.241.60.241])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4CQ1Mm6hmRzQjy2
 for <ath11k@lists.infradead.org>; Mon,  2 Nov 2020 19:16:52 +0100 (CET)
Received: from smtp2.mailbox.org ([80.241.60.241])
 by spamfilter06.heinlein-hosting.de (spamfilter06.heinlein-hosting.de
 [80.241.56.125]) (amavisd-new, port 10030)
 with ESMTP id PTLGW_DRdhtW for <ath11k@lists.infradead.org>;
 Mon,  2 Nov 2020 19:16:50 +0100 (CET)
From: Devin Bayer <dev@doubly.so>
Subject: QCA6391: failed to get 32 MSI vectors, only 1 available
Message-ID: <ea0f787e-e4f2-2ca1-a1a4-84c9a35f4af6@doubly.so>
Date: Mon, 2 Nov 2020 19:16:49 +0100
MIME-Version: 1.0
Content-Language: en-US
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
Errors-To: ath11k-bounces+kvalo=adurom.com@lists.infradead.org
To: ath11k@lists.infradead.org

Hello,

I am trying to get a QCA6391 card to work with the ath11k driver. It
recognizes the card since it has the same device ID as the QCA6390.
However it fails to initialize:

> [    4.241127] ath11k_pci 0000:03:00.0: WARNING: ath11k PCI support is experimental!
> [    4.258806] ath11k_pci 0000:03:00.0: BAR 0: assigned [mem 0xd0000000-0xd0ffffff 64bit]
> [    4.258838] ath11k_pci 0000:03:00.0: enabling device (0000 -> 0002)
> [    4.258987] ath11k_pci 0000:03:00.0: failed to get 32 MSI vectors, only 1 available
> [    4.258990] ath11k_pci 0000:03:00.0: failed to enable msi: -22

I've tried a few different kernel versions up to 5.10-rc2 and they all behave the same.

Does anyone know if there is anything I can do to get this to work?

Thanks,
Devin

Note: I applied a small patch to fix the debug output so it reports
the correct number of available vectors:

diff --git a/drivers/net/wireless/ath/ath11k/pci.c b/drivers/net/wireless/ath/ath11k/pci.c
index d7eb6b7160bb..afaacce5a5b6 100644
--- a/drivers/net/wireless/ath/ath11k/pci.c
+++ b/drivers/net/wireless/ath/ath11k/pci.c
@@ -638,7 +638,7 @@ static int ath11k_pci_enable_msi(struct ath11k_pci *ab_pci)
 	int ret;

 	num_vectors = pci_alloc_irq_vectors(ab_pci->pdev,
-					    msi_config.total_vectors,
+					    1,
 					    msi_config.total_vectors,
 					    PCI_IRQ_MSI);
 	if (num_vectors != msi_config.total_vectors) {

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
