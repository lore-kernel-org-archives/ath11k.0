Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85E1FC433F5
	for <ath11k@archiver.kernel.org>; Tue, 30 Nov 2021 22:41:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EVJ5iYMA0iW/jz6RBHqJy9HEKNvQPvbqPxzzWwB7cKA=; b=OroNNfEY3pkSxV
	4X1Rx4AhbSbqrpKKbNrw9FH+zww9wsPOoYfTDC9Ti1RSBoSrIpiLkbuvZWjpWalnEaTIWTrMweQ1I
	MJRhXwGFs4qNCYTfFs3Jv2mCFWSj01pzGwmGf3moOu8RqzxhZ0ZRTJjtwzzVRzHKxHHsxYSR6DQS2
	csEYqAY8PwZUcQW3HE2wN9Jk3Sbd9uivkdI/CdWjfT5uhrbVaNMd9RIvGKXaHFAkQMMtuJ4CcmiPQ
	2sENWiKKCiKVXKuHU23HecQ7z0uoiC65Tlh5bknIgcHdnxc5Q50WH88sl45Fln9VZQ5qzKNGty7qg
	2OYHR/DDCep1T9aOA+dQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1msBoc-0075u4-6e; Tue, 30 Nov 2021 22:41:34 +0000
Received: from galois.linutronix.de ([193.142.43.55])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1msBoZ-0075tC-UO
 for ath11k@lists.infradead.org; Tue, 30 Nov 2021 22:41:33 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1638312089;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1bOw8HEe7jHxyt1BTzbWx6wvk9iJpbF5Gn0Kg7y1Blo=;
 b=2IrmNv3Iea3b/0P87xEGqZAZmwL1onSUMGqd0zxtDIRJLTynmNSC7uxIH8L/l5dtLj/5OD
 JagFWx3aJMiS1LFIeYftEfo0Ur2kNjTtrOTkBnBmsBzvAxM9ucbFfqPVN5bViblbdfTyHh
 DmsunGG30VGceQJj3KLRF3KIyBTUwjdi6+cIFEZFOGwVLxR6/Qv+GDEs3kZsbO3Sb5vEY4
 CGDmi02z+2/4fP0CRSLAGmUXhnn/6DLG04oqIJtIelaVlS8RIp1r9e2Sxk09e7hCcOFzEs
 b9sVLSs/CWxPIfpw834x9ILDVWh3TWdsOj5JuMEeZ6q+sN/NVCvFkfOxPIzp8w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1638312089;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1bOw8HEe7jHxyt1BTzbWx6wvk9iJpbF5Gn0Kg7y1Blo=;
 b=wP+0RlPVEZMaKpggmpseYFDjn/awmzpDeY9BMit0WIgaUAvSVTefpWgNK6fro3P2SJv3Ar
 0+sa+FEk57SExTAA==
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
In-Reply-To: <87czmhb8gq.ffs@tglx>
References: <20211126222700.862407977@linutronix.de>
 <20211126223824.382273262@linutronix.de>
 <b1a6d267-c7b4-c4b9-ab0e-f5cc32bfe9bf@kaod.org> <87tufud4m3.ffs@tglx>
 <524d9b84-caa8-dd6f-bb5e-9fc906d279c0@kaod.org> <87czmhb8gq.ffs@tglx>
Date: Tue, 30 Nov 2021 23:41:28 +0100
Message-ID: <875ys9b71j.ffs@tglx>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211130_144132_143286_A8D8F98B 
X-CRM114-Status: GOOD (  10.40  )
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

T24gVHVlLCBOb3YgMzAgMjAyMSBhdCAyMzoxMCwgVGhvbWFzIEdsZWl4bmVyIHdyb3RlOgoKPiBP
biBUdWUsIE5vdiAzMCAyMDIxIGF0IDIyOjQ4LCBDw6lkcmljIExlIEdvYXRlciB3cm90ZToKPj4g
T24gMTEvMjkvMjEgMjI6MzgsIFRob21hcyBHbGVpeG5lciB3cm90ZToKPj4+IE9uIE1vbiwgTm92
IDI5IDIwMjEgYXQgMDg6MzMsIEPDqWRyaWMgTGUgR29hdGVyIHdyb3RlOgo+Pj4gdGhhbmtzIGZv
ciBoYXZpbmcgYSBsb29rLiBJIGZpeGVkIHVwIHRoaXMgYW5kIG90aGVyIGZhbGxvdXQgYW5kIHB1
c2hlZCBvdXQgYW4KPj4+IHVwZGF0ZWQgc2VyaWVzIChhbGwgNCBwYXJ0cykgdG86Cj4+PiAKPj4+
ICAgICAgICAgIGdpdDovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC90
Z2x4L2RldmVsIG1zaQo+Pgo+PiBwU2VyaWVzIGZhaWxzIHRvIGFsbG9jYXRlIE1TSXMgc3RhcnRp
bmcgd2l0aCB0aGlzIHBhdGNoIDoKPj4KPj4gICBbUEFUQ0ggMDQ5LzEwMV0gcG93ZXJwYy9wc2Vy
aWVzL21zaTogTGV0IGNvcmUgY29kZSBjaGVjayBmb3IgY29udGlndW91cyAuLi4KPj4KPj4gSSB3
aWxsIGRpZyBpbiBsYXRlciBvbi4KPgo+IExldCBtZSBzdGFyZSBhdCB0aGUgY29yZSBmdW5jdGlv
bi4uCgpJdCdzIG5vdCB0aGUgY29yZSBmdW5jdGlvbi4gSXQncyB0aGUgcGF0Y2ggYWJvdmUgYW5k
IEknbSBhIG1vcm9uLgoKLS0tIGEvYXJjaC9wb3dlcnBjL3BsYXRmb3Jtcy9wc2VyaWVzL21zaS5j
CisrKyBiL2FyY2gvcG93ZXJwYy9wbGF0Zm9ybXMvcHNlcmllcy9tc2kuYwpAQCAtMzU5LDkgKzM1
OSw2IEBAIHN0YXRpYyBpbnQgcnRhc19wcmVwYXJlX21zaV9pcnFzKHN0cnVjdAogCWlmIChxdW90
YSAmJiBxdW90YSA8IG52ZWMpCiAJCXJldHVybiBxdW90YTsKIAotCWlmICh0eXBlID09IFBDSV9D
QVBfSURfTVNJWCkKLQkJcmV0dXJuIC1FSU5WQUw7Ci0KIAkvKgogCSAqIEZpcm13YXJlIGN1cnJl
bnRseSByZWZ1c2UgYW55IG5vbiBwb3dlciBvZiB0d28gYWxsb2NhdGlvbgogCSAqIHNvIHdlIHJv
dW5kIHVwIGlmIHRoZSBxdW90YSB3aWxsIGFsbG93IGl0LgoKLS0gCmF0aDExayBtYWlsaW5nIGxp
c3QKYXRoMTFrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9hdGgxMWsK
