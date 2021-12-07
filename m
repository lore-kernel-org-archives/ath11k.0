Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3440C433EF
	for <ath11k@archiver.kernel.org>; Tue,  7 Dec 2021 20:42:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SpniwaQpg7aCzcypaRdGO3EgwODHGNpMqhoTX0rz/Ig=; b=Y2JWNXekyiH4nQ
	eD5YsQ8KI+8RRg1VzqAZCuwAgdCzkROEw3jjI8QKqjEoagyuOTFkSVZqC6o8HIpW6f2dFs4AQCgrJ
	XoFL4k8kcmVllxZO9QHaTUHIteNQlB3xE8l/drd6s3lo8VzBtVtJV4xNOdo08HcxH6ZOC4u2D13iG
	GAPDijJOQWts6yw/wQpcEjuYFjxD1VMTEZdvYLUuKlk6o2tN6hGOsXoVOwZLoLtUD6HCtUOspv+68
	bS/f0VXbpS/h/49QuXBvfbsMb790yAB857InAm1FbCXi0b94M8+87Np30pnr1gZfusvZ4U/SrrNUU
	4M2s0gelKBt5FKEUbB5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1muhIC-00A39t-Fi; Tue, 07 Dec 2021 20:42:28 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1muhI9-00A38n-70
 for ath11k@lists.infradead.org; Tue, 07 Dec 2021 20:42:26 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1638909743;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8kdDUloupcZ7zsHm8ipSzMG1KhDz+bCCecRfNXSnpkg=;
 b=myOlC5dgE3khI7L8VZJuvb0AqNwW72GyeFELcD1PBbXUtZ68+3HHkLJ6B3AHqyMzsf2WT8
 +ujqWMGHpaY4rsmjld2a82Vj5AIv9LECzrGlZmnD/32El3mdYogpJBXD830FzxpM64lfFA
 4umcD+gxjhc1TVxDz7X7+HSKF/BzRb/G2QPcgdTOuekTL5TVuB7tk2FDJgZvBY12rIApXt
 6/cKg45LVQbCHkJ50Jh/VwMaNydeam+MMtnO87aLsvswM8Dg0b8u1s2wEbGXeG0S5d8b8M
 gpLncVriJOZxdr/S+hNQBS9u1GXShwEAVsplRx5hkczW+cMOAp/ZAeGaDzJRnQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1638909743;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8kdDUloupcZ7zsHm8ipSzMG1KhDz+bCCecRfNXSnpkg=;
 b=0V4XVUsOsvnU+9Fv3Fb95pdvdCgo/+dE0Mo+fVtsflMeNE/VXjrD4Tr1l/AitQqcrCl0wJ
 KhJ9aDeINWrmG3AA==
To: =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>, Michael Ellerman
 <mpe@ellerman.id.au>, LKML <linux-kernel@vger.kernel.org>
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
In-Reply-To: <27f22e0e-8f84-a6d7-704b-d9eddc642d74@kaod.org>
References: <20211206210147.872865823@linutronix.de>
 <20211206210223.872249537@linutronix.de>
 <8d1e9d2b-fbe9-2e15-6df6-03028902791a@kaod.org>
 <87ilw0odel.fsf@mpe.ellerman.id.au>
 <27f22e0e-8f84-a6d7-704b-d9eddc642d74@kaod.org>
Date: Tue, 07 Dec 2021 21:42:22 +0100
Message-ID: <8735n42lld.ffs@tglx>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211207_124225_424561_028DAEEB 
X-CRM114-Status: GOOD (  13.49  )
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

Q2VkcmljLAoKT24gVHVlLCBEZWMgMDcgMjAyMSBhdCAxNjo1MCwgQ8OpZHJpYyBMZSBHb2F0ZXIg
d3JvdGU6Cj4gT24gMTIvNy8yMSAxMjozNiwgTWljaGFlbCBFbGxlcm1hbiB3cm90ZToKPj4gCj4+
IFRoaXMgcGF0Y2ggc2hvdWxkIGRyb3AgdGhvc2Ugc2VsZWN0cyBJIGd1ZXNzLiBDYW4geW91IHNl
bmQgYW4KPj4gaW5jcmVtZW50YWwgZGlmZiBmb3IgVGhvbWFzIHRvIHNxdWFzaCBpbj8KPgo+IFN1
cmUuCj4KPj4gUmVtb3ZpbmcgYWxsIHRoZSB0ZW5kcmlscyBpbiB2YXJpb3VzIGRldmljZSB0cmVl
IGZpbGVzIHdpbGwgcHJvYmFibHkKPj4gcmVxdWlyZSBzb21lIGFyY2hhZW9sb2d5LCBhbmQgaXQg
c2hvdWxkIGJlIHBlcmZlY3RseSBzYWZlIHRvIGxlYXZlIHRob3NlCj4+IGluIHRoZSB0cmVlIHdp
dGggdGhlIGRyaXZlciBnb25lLiBTbyBJIHRoaW5rIHdlIGNhbiBkbyB0aGF0IGFzIGEKPj4gc3Vi
c2VxdWVudCBwYXRjaCwgcmF0aGVyIHRoYW4gaW4gdGhpcyBzZXJpZXMuCj4KPiBIZXJlIGFyZSB0
aGUgY2hhbmdlcy4gQ29tcGlsZWQgdGVzdGVkIHdpdGggcHBjNDB4IGFuZCBwcGM0NHggZGVmY29u
Zmlncy4KCjwgTG90cyBvZiBwYXRjaCBza2lwcGVkIC8+Cj4gQEAgLTE0MSw3ICsxMzgsNiBAQCBj
b25maWcgUkVEV09PRAo+ICAgCXNlbGVjdCBGT1JDRV9QQ0kKPiAgIAlzZWxlY3QgUFBDNHh4X1BD
SV9FWFBSRVNTCj4gICAJc2VsZWN0IFBDSV9NU0kKPiAtCXNlbGVjdCBQUEM0eHhfTVNJCj4gICAJ
aGVscAo+ICAgCSAgVGhpcyBvcHRpb24gZW5hYmxlcyBzdXBwb3J0IGZvciB0aGUgQU1DQyBQUEM0
NjBTWCBSZWR3b29kIGJvYXJkLgoKV2hpbGUgdGhhdCBpcyBpbmNyZW1lbnRhbCBpdCBjZXJ0YWlu
bHkgaXMgd29ydGggYSBwYXRjaCBvbiBpdCdzCm93bi4gQ291bGQgeW91IGFkZCBhIHByb3BlciBj
aGFuZ2Vsb2cgYW5kIGFuIFNPQiBwbGVhc2U/CgpUaGFua3MsCgogICAgICAgIHRnbHgKCi0tIAph
dGgxMWsgbWFpbGluZyBsaXN0CmF0aDExa0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vYXRoMTFrCg==
