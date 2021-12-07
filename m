Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D246EC433F5
	for <ath11k@archiver.kernel.org>; Tue,  7 Dec 2021 11:36:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/qLJ626/SQMxoXzp+nKREqHgKYOony36RjvF07Vaf7Q=; b=f9+0+XmJE4iEY2
	SzG1rb3l4fFTdpK2pAoMuyJWiqdhcOz5hA3vkidHT3EN1vmCPZnsbyMnG0v0eVfiS5K8lv8b+uOWn
	AUmO4/xBCtBtaf0BcvKKZP/0u45lH7qtb+wgpKIkFwCvcO/boE4pVyM2/Fy+BDBCujDTeHuCzBZPU
	9RpB220IacnlRYZHT/QpYrRKj4z8+LCGhX9fXGt3XyOG64zmDJU8fzB/4EdUfmQIYv0DYHoxT1X5c
	Z92Wx3Xg4iixtISupU/ZlPT/pWtL1IaDxT1JEZ1r/JBqCiDzHJhzTn1IY/SxMbIxv0b9BlEfzzLZe
	w/1+LZFJZpn0PjciQoyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1muYlc-008Guq-BI; Tue, 07 Dec 2021 11:36:16 +0000
Received: from gandalf.ozlabs.org ([150.107.74.76])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1muYlZ-008GtU-CN
 for ath11k@lists.infradead.org; Tue, 07 Dec 2021 11:36:15 +0000
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4J7dXf3dSsz4xYy;
 Tue,  7 Dec 2021 22:36:02 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1638876964;
 bh=lTsXMkBa68SdK2mCmwfpSshAWpT0dRMMMq4RDsTmMUc=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=BMwzDWkPEIYhXynBVAirAw4gLvuuvW+w979j7Yqtpl/UPXPORphUfbt+jK+l0pabP
 GTehyWDzuL/CjvtZ3vJKYoj5rsJPb1bnDWny7P2YlVPjCcML69cHmHBNG0AIDWe7Gz
 7IRiJMIJ4Kb9b5hGDoNDnHaxCTClNUWIJdKvD1WISOHxae57UeEHW0ELnQ3BY1ByPF
 1oPzO4gyeKDsiFe+zukx8HTbH7jtndcbjgt+u2Img9ev7FSfwZJM9PLRYWX7kshjFe
 JBwE+rXxecauzokxEZQ57uU9ynC6VsB3Nd14q1sEiH2ivRH0Hx8EhFL3DwxqA8pymw
 p3ZiZsIoOoIIQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>, Thomas Gleixner
 <tglx@linutronix.de>, LKML <linux-kernel@vger.kernel.org>
Cc: Bjorn Helgaas <helgaas@kernel.org>, Marc Zygnier <maz@kernel.org>, Alex
 Williamson <alex.williamson@redhat.com>, Kevin Tian
 <kevin.tian@intel.com>, Jason Gunthorpe <jgg@nvidia.com>, Megha Dey
 <megha.dey@intel.com>, Ashok Raj <ashok.raj@intel.com>,
 linux-pci@vger.kernel.org, Paul Mackerras <paulus@samba.org>, Benjamin
 Herrenschmidt <benh@kernel.crashing.org>, linuxppc-dev@lists.ozlabs.org,
 Juergen Gross <jgross@suse.com>, Thomas Bogendoerfer
 <tsbogend@alpha.franken.de>, linux-mips@vger.kernel.org, Kalle Valo
 <kvalo@codeaurora.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 sparclinux@vger.kernel.org, x86@kernel.org,
 xen-devel@lists.xenproject.org, ath11k@lists.infradead.org, Wei Liu
 <wei.liu@kernel.org>, linux-hyperv@vger.kernel.org, Christian Borntraeger
 <borntraeger@de.ibm.com>, Heiko Carstens <hca@linux.ibm.com>
Subject: Re: [patch V2 01/23] powerpc/4xx: Remove MSI support which never
 worked
In-Reply-To: <8d1e9d2b-fbe9-2e15-6df6-03028902791a@kaod.org>
References: <20211206210147.872865823@linutronix.de>
 <20211206210223.872249537@linutronix.de>
 <8d1e9d2b-fbe9-2e15-6df6-03028902791a@kaod.org>
Date: Tue, 07 Dec 2021 22:36:02 +1100
Message-ID: <87ilw0odel.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211207_033613_625411_F6A9B2CD 
X-CRM114-Status: GOOD (  12.76  )
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

Q8OpZHJpYyBMZSBHb2F0ZXIgPGNsZ0BrYW9kLm9yZz4gd3JpdGVzOgo+IEhlbGxvIFRob21hcywK
Pgo+IE9uIDEyLzYvMjEgMjM6MjcsIFRob21hcyBHbGVpeG5lciB3cm90ZToKPj4gVGhpcyBjb2Rl
IGlzIGJyb2tlbiBzaW5jZSBkYXkgb25lLiBwcGM0eHhfc2V0dXBfbXNpX2lycXMoKSBoYXMgdGhl
Cj4+IGZvbGxvd2luZyBnZW1zOgo+PiAKPj4gICAxKSBUaGUgaGFuZGxpbmcgb2YgdGhlIHJlc3Vs
dCBvZiBtc2lfYml0bWFwX2FsbG9jX2h3aXJxcygpIGlzIGNvbXBsZXRlbHkKPj4gICAgICBicm9r
ZW46Cj4+ICAgICAgCj4+ICAgICAgV2hlbiB0aGUgcmVzdWx0IGlzIGdyZWF0ZXIgdGhhbiBvciBl
cXVhbCAwIChiaXRtYXAgYWxsb2NhdGlvbgo+PiAgICAgIHN1Y2Nlc3NmdWwpIHRoZW4gdGhlIGxv
b3AgdGVybWluYXRlcyBhbmQgdGhlIGZ1bmN0aW9uIHJldHVybnMgMAo+PiAgICAgIChzdWNjZXNz
KSBkZXNwaXRlIG5vdCBoYXZpbmcgaW5zdGFsbGVkIGFuIGludGVycnVwdC4KPj4gCj4+ICAgICAg
V2hlbiB0aGUgcmVzdWx0IGlzIGxlc3MgdGhhbiAwIChiaXRtYXAgYWxsb2NhdGlvbiBmYWlscyks
IGl0IHByaW50cyBhbgo+PiAgICAgIGVycm9yIG1lc3NhZ2UgYW5kIGNvbnRpbnVlcyB0byAid29y
ayIgd2l0aCB0aGF0IGVycm9yIGNvZGUgd2hpY2ggd291bGQKPj4gICAgICBldmVudHVhbGx5IGVu
ZCB1cCBpbiB0aGUgTVNJIG1lc3NhZ2UgZGF0YS4KPj4gCj4+ICAgMikgT24gZXZlcnkgaW52b2Nh
dGlvbiB0aGUgZmlsZSBnbG9iYWwgcHA0eHhfbXNpOjptc2lfdmlycXMgYml0bWFwIGlzCj4+ICAg
ICAgYWxsb2NhdGVkIHRoZXJlYnkgbGVha2luZyB0aGUgcHJldmlvdXMgb25lLgo+PiAKPj4gSU9X
LCB0aGlzIGhhcyBuZXZlciB3b3JrZWQgYW5kIGZvciBtb3JlIHRoYW4gMTAgeWVhcnMgbm9ib2R5
IGNhcmVkLiBSZW1vdmUKPj4gdGhlIGd1bmsuCj4+IAo+PiBGaXhlczogM2ZiNzkzMzg1MGZhICgi
cG93ZXJwYy80eHg6IEFkZGluZyBQQ0llIE1TSSBzdXBwb3J0IikKPgo+IFNob3VsZG4ndCB3ZSBy
ZW1vdmUgYWxsIG9mIGl0ID8gaW5jbHVkaW5nIHRoZSB1cGRhdGVzIGluIHRoZSBkZXZpY2UgdHJl
ZXMKPiBhbmQgdGhlIEtjb25maWcgY2hhbmdlcyB1bmRlciA6Cj4KPiBhcmNoL3Bvd2VycGMvcGxh
dGZvcm1zLzQ0eC9LY29uZmlnOglzZWxlY3QgUFBDNHh4X01TSQo+IGFyY2gvcG93ZXJwYy9wbGF0
Zm9ybXMvNDR4L0tjb25maWc6CXNlbGVjdCBQUEM0eHhfTVNJCj4gYXJjaC9wb3dlcnBjL3BsYXRm
b3Jtcy80NHgvS2NvbmZpZzoJc2VsZWN0IFBQQzR4eF9NU0kKPiBhcmNoL3Bvd2VycGMvcGxhdGZv
cm1zLzQ0eC9LY29uZmlnOglzZWxlY3QgUFBDNHh4X01TSQo+IGFyY2gvcG93ZXJwYy9wbGF0Zm9y
bXMvNDB4L0tjb25maWc6CXNlbGVjdCBQUEM0eHhfTVNJCgpUaGlzIHBhdGNoIHNob3VsZCBkcm9w
IHRob3NlIHNlbGVjdHMgSSBndWVzcy4gQ2FuIHlvdSBzZW5kIGFuCmluY3JlbWVudGFsIGRpZmYg
Zm9yIFRob21hcyB0byBzcXVhc2ggaW4/CgpSZW1vdmluZyBhbGwgdGhlIHRlbmRyaWxzIGluIHZh
cmlvdXMgZGV2aWNlIHRyZWUgZmlsZXMgd2lsbCBwcm9iYWJseQpyZXF1aXJlIHNvbWUgYXJjaGFl
b2xvZ3ksIGFuZCBpdCBzaG91bGQgYmUgcGVyZmVjdGx5IHNhZmUgdG8gbGVhdmUgdGhvc2UKaW4g
dGhlIHRyZWUgd2l0aCB0aGUgZHJpdmVyIGdvbmUuIFNvIEkgdGhpbmsgd2UgY2FuIGRvIHRoYXQg
YXMgYQpzdWJzZXF1ZW50IHBhdGNoLCByYXRoZXIgdGhhbiBpbiB0aGlzIHNlcmllcy4KCmNoZWVy
cwoKLS0gCmF0aDExayBtYWlsaW5nIGxpc3QKYXRoMTFrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9hdGgxMWsK
