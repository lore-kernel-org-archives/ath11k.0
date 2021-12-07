Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F400BC433EF
	for <ath11k@archiver.kernel.org>; Tue,  7 Dec 2021 07:43:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B3XAo9IjN26anquDhM33HSuYE5WsnK8hnz5vGmxL1sA=; b=dZtVfwbF3156VK
	pzvJSE0zfiGMgL1hDbZhaoBMfdj/h3YQU/tnqXQlh6ZLT8nKtONoWTx5G4FXv6z/YmQEfX/swtCKK
	w20CMIpA30Ak/+w5JPHuKSd4NxcwgbOeSNhAPhMwDq8BjOxF9nZqNnvz9OWpUU+pSj+VyOAtAalKw
	z8qt9hhNis70t7W6F320a/asCu5hlUkDOPzWh9aV9nfLTVlqCnIFVo5+Eqwq46kZQfbCAweUHEa2/
	+MVjlpmuGIQECBLkdvrRGCxNF+pgcbD7HFkQ0B1WN5F7769DSxiFR9y7k2jcmbXXfZmua5vdyCp90
	ia/JvAB6kU6Mj0sOP+rA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1muV7t-007FZ1-1C; Tue, 07 Dec 2021 07:43:01 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1muV7q-007FXb-O8
 for ath11k@lists.infradead.org; Tue, 07 Dec 2021 07:43:00 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id DBD2CCE19EC;
 Tue,  7 Dec 2021 07:42:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D81AC341C1;
 Tue,  7 Dec 2021 07:42:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1638862974;
 bh=2qIgL0JBG4vV/MINd0ETzL6k1r509RSkk45xSKKLJ7I=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rEqXyxtMWZFlcF8r3yxH1/TtAEbDHBaUwIDAPsv9sHOOC0Rmzi+lrDEkr6FW8lcZr
 /vMFQ/81Tv7pxgdvjTeFJkR4e1RX4olYyYFOA3hLqZw2/Xn7l2GFzYB4NYCzFkanis
 14vBaVGOTC4Y8SHo20NGaCX7CBAe2IriKWHo0K/0=
Date: Tue, 7 Dec 2021 08:42:51 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>, Bjorn Helgaas <helgaas@kernel.org>,
 Marc Zygnier <maz@kernel.org>,
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
 sparclinux@vger.kernel.org, x86@kernel.org,
 xen-devel@lists.xenproject.org, ath11k@lists.infradead.org,
 Wei Liu <wei.liu@kernel.org>, linux-hyperv@vger.kernel.org,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>
Subject: Re: [patch V2 03/23] genirq/msi: Guard sysfs code
Message-ID: <Ya8Qe7Mol8STLvkd@kroah.com>
References: <20211206210147.872865823@linutronix.de>
 <20211206210223.985907940@linutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211206210223.985907940@linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211206_234258_983180_43D735B1 
X-CRM114-Status: UNSURE (   8.25  )
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

On Mon, Dec 06, 2021 at 11:27:28PM +0100, Thomas Gleixner wrote:
> No point in building unused code when CONFIG_SYSFS=n.
> 
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> Tested-by: Juergen Gross <jgross@suse.com>
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
