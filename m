Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 862D4C433FE
	for <ath11k@archiver.kernel.org>; Sat, 27 Nov 2021 01:18:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:MIME-Version:References:Subject:Cc
	:To:From:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	List-Owner; bh=gcgK4pY2FDJSSpFF9vDg98UWUpFAWiMgFqsB6n3R5SY=; b=PweOr63CtVrs9a
	eTVlDXMZZnL1+wTzbJvfUfX0IazNamAhAieFVPmdftVIBbjYmZn4xC8knzFb3JUJvuNJYemoALf8f
	zTQKrM0nWRRk2cFTZWmHIo2QheBqi+w4hrWTzYZBq1SA5mJ4RVeRU1JZ+gTOFk1eUTuXbPtkOXtI6
	bEZhi/nzIZQ6MLlbJKE46As/uWAta429ZmSwtWvpvjzw1tXpzjU3x8rf6r0HNi8Bg/8F6zEoXW1D8
	NfOpnlSNnx/yjka+l3RfHUkouTkgY+w2fungtxDNYGUojW3hD8GqPaZCQ4fCvC7816HFkh4xjLPsH
	xFsATopQk5qdwIqQ976Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mqmMc-00C7Nt-4I; Sat, 27 Nov 2021 01:18:50 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mqmMX-00C7HO-CS
 for ath11k@lists.infradead.org; Sat, 27 Nov 2021 01:18:46 +0000
Message-ID: <20211126223824.382273262@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1637975923;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 references:references; bh=w7GncdwHZHkuO6107A0BMJdTfScXy8O2W/1Ze2L1KBI=;
 b=hRvcWzJWtpS9cJpn6ec5XsiwdSt3GIjNt8ayewjD/eh9hwlgb1/xvVV4/GfDBq35j1JSY6
 gNTVVLRFiWOl7Q6g2U0XspYHK1Xz1zZq1uR0LfL+QCvBgAeGrkjmRzOPsB9pZC5q8eBLWi
 Miu93VAKW6OCnVvlthatKyfHJOAczWW28Jui0oK0HjaKvI8jyb2hTX5R3UwIS9y70AJTKu
 ksrfsAxNB2Jfxd1CcyojtkmzQjXjSymAoG5tn8yNmv84aIU9DMLljzKenOliB09zgVb8U6
 D7jbg1L0Rx8OI4T4ciQzpXUtVYdwdBkots+z+IuOV1rReP32BLWXVPUxWjzJiw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1637975923;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 references:references; bh=w7GncdwHZHkuO6107A0BMJdTfScXy8O2W/1Ze2L1KBI=;
 b=g1chgF1PPE1Vu9aoCMCQV96amhB0EJgwXDPy4IycnPsMua9xAiLx9zn0a6p/WZmfDz106b
 yo4Vc3VfVsFX/VCw==
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
Subject: [patch 05/22] genirq/msi: Fixup includes
References: <20211126222700.862407977@linutronix.de>
MIME-Version: 1.0
Date: Sat, 27 Nov 2021 02:18:42 +0100 (CET)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211126_171845_600547_7BD6B6EE 
X-CRM114-Status: UNSURE (   8.69  )
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

Remove the kobject.h include from msi.h as it's not required and add a
sysfs.h include to the core code instead.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
---
 include/linux/msi.h |    1 -
 kernel/irq/msi.c    |    1 +
 2 files changed, 1 insertion(+), 1 deletion(-)

--- a/include/linux/msi.h
+++ b/include/linux/msi.h
@@ -2,7 +2,6 @@
 #ifndef LINUX_MSI_H
 #define LINUX_MSI_H
 
-#include <linux/kobject.h>
 #include <linux/list.h>
 #include <asm/msi.h>
 
--- a/kernel/irq/msi.c
+++ b/kernel/irq/msi.c
@@ -14,6 +14,7 @@
 #include <linux/irqdomain.h>
 #include <linux/msi.h>
 #include <linux/slab.h>
+#include <linux/sysfs.h>
 #include <linux/pci.h>
 
 #include "internals.h"


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
