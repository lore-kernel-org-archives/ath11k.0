Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71C13C433EF
	for <ath11k@archiver.kernel.org>; Wed,  8 Dec 2021 10:45:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cYomiruLuiJJL+bys1Es7+CW8luIq+r/k36fylnlbow=; b=ZGrBXhu8AW8J3q
	eeuuRwkYoPq12qRxdkFxlRXMfwirR3G5t5MPYWyqw1YK7jM14Db28GMzdcJV/yP8Vbq1rQzt9LIuR
	MYluGyarvRZTilQHa7mplWoFXHT7/FnddxY/p5QGDZoyIjVik7jxtq9/5hv95Ftpn8epDkYp+dFm/
	Ub6qfENBXIbOjZzG+V3odZ24spUGMoPwRGcy2t2ZAMRfLKvuEerLJ3M5hZdR5lgejIYZYdQBO2UED
	BMgZJZVznhm+k1rpQmXRKUrT9AZx1DoOhQX2ZLQcCVtLHOEE6bNFSmjq/ETXLrsyC1lXBr10jaF3D
	lxxxacGyJeZcmY3s7Q7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1muuRW-00CAOn-Cc; Wed, 08 Dec 2021 10:44:58 +0000
Received: from smtpout4.mo529.mail-out.ovh.net ([217.182.185.173])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1muuRT-00CAMF-DC
 for ath11k@lists.infradead.org; Wed, 08 Dec 2021 10:44:57 +0000
Received: from mxplan5.mail.ovh.net (unknown [10.109.156.35])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 4A0F4D092F09;
 Wed,  8 Dec 2021 11:44:42 +0100 (CET)
Received: from kaod.org (37.59.142.96) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Wed, 8 Dec
 2021 11:44:40 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-96R001f5056120-68a4-4c0a-bc06-f617410d6d7e,
 EB01F339838E5AA67C986A6C3251B49097B81903) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 86.201.172.254
Message-ID: <e92f2bb3-b5e1-c870-8151-3917a789a640@kaod.org>
Date: Wed, 8 Dec 2021 11:44:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [patch V2 01/23] powerpc/4xx: Remove MSI support which never
 worked
Content-Language: en-US
To: Thomas Gleixner <tglx@linutronix.de>, Michael Ellerman
 <mpe@ellerman.id.au>, LKML <linux-kernel@vger.kernel.org>
CC: Bjorn Helgaas <helgaas@kernel.org>, Marc Zygnier <maz@kernel.org>, Alex
 Williamson <alex.williamson@redhat.com>, Kevin Tian <kevin.tian@intel.com>,
 Jason Gunthorpe <jgg@nvidia.com>, Megha Dey <megha.dey@intel.com>, Ashok Raj
 <ashok.raj@intel.com>, <linux-pci@vger.kernel.org>, Paul Mackerras
 <paulus@samba.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 <linuxppc-dev@lists.ozlabs.org>, Juergen Gross <jgross@suse.com>, Thomas
 Bogendoerfer <tsbogend@alpha.franken.de>, <linux-mips@vger.kernel.org>, Kalle
 Valo <kvalo@codeaurora.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 <sparclinux@vger.kernel.org>, <x86@kernel.org>,
 <xen-devel@lists.xenproject.org>, <ath11k@lists.infradead.org>, Wei Liu
 <wei.liu@kernel.org>, <linux-hyperv@vger.kernel.org>, Christian Borntraeger
 <borntraeger@de.ibm.com>, Heiko Carstens <hca@linux.ibm.com>
References: <20211206210147.872865823@linutronix.de>
 <20211206210223.872249537@linutronix.de>
 <8d1e9d2b-fbe9-2e15-6df6-03028902791a@kaod.org>
 <87ilw0odel.fsf@mpe.ellerman.id.au>
 <27f22e0e-8f84-a6d7-704b-d9eddc642d74@kaod.org> <8735n42lld.ffs@tglx>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <8735n42lld.ffs@tglx>
X-Originating-IP: [37.59.142.96]
X-ClientProxiedBy: DAG4EX1.mxp5.local (172.16.2.31) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: d54a9dd7-eba7-4e7f-a7a0-0dc7c43fc796
X-Ovh-Tracer-Id: 10131410315672259365
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrjeekgddulecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeeuveelvdejteegteefieevfeetffefvddvieekteevleefgeelgfeutedvfedvfeenucffohhmrghinhepghhithhhuhgsrdgtohhmnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdelieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehhtggrsehlihhnuhigrdhisghmrdgtohhm
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211208_024455_635263_AFA08EDC 
X-CRM114-Status: GOOD (  13.98  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

T24gMTIvNy8yMSAyMTo0MiwgVGhvbWFzIEdsZWl4bmVyIHdyb3RlOgo+IENlZHJpYywKPiAKPiBP
biBUdWUsIERlYyAwNyAyMDIxIGF0IDE2OjUwLCBDw6lkcmljIExlIEdvYXRlciB3cm90ZToKPj4g
T24gMTIvNy8yMSAxMjozNiwgTWljaGFlbCBFbGxlcm1hbiB3cm90ZToKPj4+Cj4+PiBUaGlzIHBh
dGNoIHNob3VsZCBkcm9wIHRob3NlIHNlbGVjdHMgSSBndWVzcy4gQ2FuIHlvdSBzZW5kIGFuCj4+
PiBpbmNyZW1lbnRhbCBkaWZmIGZvciBUaG9tYXMgdG8gc3F1YXNoIGluPwo+Pgo+PiBTdXJlLgo+
Pgo+Pj4gUmVtb3ZpbmcgYWxsIHRoZSB0ZW5kcmlscyBpbiB2YXJpb3VzIGRldmljZSB0cmVlIGZp
bGVzIHdpbGwgcHJvYmFibHkKPj4+IHJlcXVpcmUgc29tZSBhcmNoYWVvbG9neSwgYW5kIGl0IHNo
b3VsZCBiZSBwZXJmZWN0bHkgc2FmZSB0byBsZWF2ZSB0aG9zZQo+Pj4gaW4gdGhlIHRyZWUgd2l0
aCB0aGUgZHJpdmVyIGdvbmUuIFNvIEkgdGhpbmsgd2UgY2FuIGRvIHRoYXQgYXMgYQo+Pj4gc3Vi
c2VxdWVudCBwYXRjaCwgcmF0aGVyIHRoYW4gaW4gdGhpcyBzZXJpZXMuCj4+Cj4+IEhlcmUgYXJl
IHRoZSBjaGFuZ2VzLiBDb21waWxlZCB0ZXN0ZWQgd2l0aCBwcGM0MHggYW5kIHBwYzQ0eCBkZWZj
b25maWdzLgo+IAo+IDwgTG90cyBvZiBwYXRjaCBza2lwcGVkIC8+Cj4+IEBAIC0xNDEsNyArMTM4
LDYgQEAgY29uZmlnIFJFRFdPT0QKPj4gICAgCXNlbGVjdCBGT1JDRV9QQ0kKPj4gICAgCXNlbGVj
dCBQUEM0eHhfUENJX0VYUFJFU1MKPj4gICAgCXNlbGVjdCBQQ0lfTVNJCj4+IC0Jc2VsZWN0IFBQ
QzR4eF9NU0kKPj4gICAgCWhlbHAKPj4gICAgCSAgVGhpcyBvcHRpb24gZW5hYmxlcyBzdXBwb3J0
IGZvciB0aGUgQU1DQyBQUEM0NjBTWCBSZWR3b29kIGJvYXJkLgo+IAo+IFdoaWxlIHRoYXQgaXMg
aW5jcmVtZW50YWwgaXQgY2VydGFpbmx5IGlzIHdvcnRoIGEgcGF0Y2ggb24gaXQncwo+IG93bi4g
Q291bGQgeW91IGFkZCBhIHByb3BlciBjaGFuZ2Vsb2cgYW5kIGFuIFNPQiBwbGVhc2U/CgpIZXJl
IHlvdSBhcmUuCgogIGh0dHBzOi8vZ2l0aHViLmNvbS9sZWdvYXRlci9saW51eC9jb21taXQvNzVk
Mjc2NGIxMWZlOGY2ZDhiZjUwZDYwYTNmZWI1OTljZTI3YjE2ZAoKVGhhbmtzLAoKQy4KCi0tIAph
dGgxMWsgbWFpbGluZyBsaXN0CmF0aDExa0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vYXRoMTFrCg==
