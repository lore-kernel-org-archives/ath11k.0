Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C8A3C433F5
	for <ath11k@archiver.kernel.org>; Tue, 30 Nov 2021 22:26:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3LtXhw3Y06ECXvIuK2i09Rf35rD97zCBC/16rRYjI+0=; b=cbh8nzScx4yPZO
	V6TM7MHCKNVstQgIZsllASvycoIxCCvdq1ih5Ibd7FMpSDPKWMcM27RXEtQD5hYXcmCGNZm9kAEgZ
	g0PBrDrohj3nqXvlfUB/1VZjoodf00Yug0huuBsX5KWiFNeVFfhZuHL9DaDYs4VmCvLwxT3SUaDIG
	8lRzyEbtK2wD9NTZIW2rw6/p8/gSZek8KTUdYjlf+/GXaaYGuSvN38IXWsOo5hyDLrFIKT1KjzsXm
	SGYiEE4lfzwHbCstfukZk7WLPU773Cqnxdj359+tfW9JxoUbbC0KOSvJyBs/0Feq4I3A4uxX8pW8o
	HfwKVCNWDm+EmoRZQtoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1msBaQ-0071pT-GZ; Tue, 30 Nov 2021 22:26:54 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1msBKp-006vmn-Bq
 for ath11k@lists.infradead.org; Tue, 30 Nov 2021 22:10:48 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1638310245;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iQwNm3evMDmCqqNj6SOBSL2raZeNEDMRyVYLWo7plsQ=;
 b=cfCUOIaPomiZCO9d79k8QaTA54iAEZbQY4lmYzVXbCZ99fBBPE+xqpOo1m4nSfa3KPq6+6
 pI8jqClQqAQ6e9xEzGMdMDMlM7PO3wO+IzFhUB7wl4w2H81v2euyyU8OpSzUxgKY+0HqOn
 tbRxYHYo0OtQnM7fMd/Q2RflLcOK0WEbJRcLaARC9aG5kGkie13cZuSuCFIva1m+TA616i
 dV35DJLlXGyNBE5vTnPj0hgLjo4pBUrYZ1WEUXNY8Y4DNEBT5I7kTI7Vt9Tc5Lg2J+Di+B
 X84UlqMbc2Q4lC6o9mfXgbNv2vVK1HCIjDj9nJ/ptp3y+rYMnW5ZpEnm9xcPOg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1638310245;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iQwNm3evMDmCqqNj6SOBSL2raZeNEDMRyVYLWo7plsQ=;
 b=OS4mhIe7yFZLurVEyelXc9LbdOQ2hxFAIJTEo5kZyIy2QO7wrWZZMF3x6KmDym+n1S953w
 D2cPy3zCOhdCl9Bg==
To: =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>, LKML
 <linux-kernel@vger.kernel.org>
Cc: linux-hyperv@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 sparclinux@vger.kernel.org, Wei Liu <wei.liu@kernel.org>, Ashok Raj
 <ashok.raj@intel.com>, Marc Zygnier <maz@kernel.org>, x86@kernel.org,
 Christian Borntraeger <borntraeger@de.ibm.com>, Bjorn Helgaas
 <helgaas@kernel.org>, Jason Gunthorpe <jgg@nvidia.com>,
 linux-pci@vger.kernel.org, xen-devel@lists.xenproject.org,
 ath11k@lists.infradead.org, Kevin Tian <kevin.tian@intel.com>, Heiko
 Carstens <hca@linux.ibm.com>, Alex Williamson <alex.williamson@redhat.com>,
 Megha Dey <megha.dey@intel.com>, Juergen Gross <jgross@suse.com>, Thomas
 Bogendoerfer <tsbogend@alpha.franken.de>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, linux-mips@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Subject: Re: [patch 05/22] genirq/msi: Fixup includes
In-Reply-To: <524d9b84-caa8-dd6f-bb5e-9fc906d279c0@kaod.org>
References: <20211126222700.862407977@linutronix.de>
 <20211126223824.382273262@linutronix.de>
 <b1a6d267-c7b4-c4b9-ab0e-f5cc32bfe9bf@kaod.org> <87tufud4m3.ffs@tglx>
 <524d9b84-caa8-dd6f-bb5e-9fc906d279c0@kaod.org>
Date: Tue, 30 Nov 2021 23:10:45 +0100
Message-ID: <87czmhb8gq.ffs@tglx>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211130_141047_604296_E33668FC 
X-CRM114-Status: UNSURE (   8.42  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

T24gVHVlLCBOb3YgMzAgMjAyMSBhdCAyMjo0OCwgQ8OpZHJpYyBMZSBHb2F0ZXIgd3JvdGU6Cj4g
T24gMTEvMjkvMjEgMjI6MzgsIFRob21hcyBHbGVpeG5lciB3cm90ZToKPj4gT24gTW9uLCBOb3Yg
MjkgMjAyMSBhdCAwODozMywgQ8OpZHJpYyBMZSBHb2F0ZXIgd3JvdGU6Cj4+IHRoYW5rcyBmb3Ig
aGF2aW5nIGEgbG9vay4gSSBmaXhlZCB1cCB0aGlzIGFuZCBvdGhlciBmYWxsb3V0IGFuZCBwdXNo
ZWQgb3V0IGFuCj4+IHVwZGF0ZWQgc2VyaWVzIChhbGwgNCBwYXJ0cykgdG86Cj4+IAo+PiAgICAg
ICAgICBnaXQ6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvdGdseC9k
ZXZlbCBtc2kKPgo+IHBTZXJpZXMgZmFpbHMgdG8gYWxsb2NhdGUgTVNJcyBzdGFydGluZyB3aXRo
IHRoaXMgcGF0Y2ggOgo+Cj4gICBbUEFUQ0ggMDQ5LzEwMV0gcG93ZXJwYy9wc2VyaWVzL21zaTog
TGV0IGNvcmUgY29kZSBjaGVjayBmb3IgY29udGlndW91cyAuLi4KPgo+IEkgd2lsbCBkaWcgaW4g
bGF0ZXIgb24uCgpMZXQgbWUgc3RhcmUgYXQgdGhlIGNvcmUgZnVuY3Rpb24uLgoKLS0gCmF0aDEx
ayBtYWlsaW5nIGxpc3QKYXRoMTFrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9hdGgxMWsK
