Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AC78C433EF
	for <ath11k@archiver.kernel.org>; Wed,  1 Dec 2021 07:14:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o/TBi81Ezj5W1mkzLz+i+wwkbJ/1D9lRygoOHAoL0vA=; b=rVrA9bNL6rfyzR
	vcnHWa0ONjh4ZOUQxdYCKXDfg1uXeA/BIHQXowyACWJmgxEJwsSk79bMLRYUfqJhP6Cp0aH2s+QRY
	+l3BVa4kGy+WA2jCs58bcjusMcETL1xngUC2HOpewjGE5tESPZC6wTCo0bFt+xGjxTM838uhYJBjv
	4RTv5sQ92VQgtE14xXSll9ZbvgbYu+RA9ptjmS6E8VZHxQ31SGzSPgHa1S9kY4e8nZXhdlxDSqLkt
	ETdl83Hve/eOaexeTwzlf2bU3zjdCBeLWkkE9FucB364pAls8hQdtPL1+6Wp3ClpW9/LFMm+W0I+s
	beTsIHbWkBX6UcRntwLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1msJom-007cSq-7Y; Wed, 01 Dec 2021 07:14:16 +0000
Received: from 1.mo552.mail-out.ovh.net ([178.32.96.117])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1msJoi-007cRE-Jy
 for ath11k@lists.infradead.org; Wed, 01 Dec 2021 07:14:14 +0000
Received: from mxplan5.mail.ovh.net (unknown [10.108.1.125])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id B6B2D217F7;
 Wed,  1 Dec 2021 07:14:07 +0000 (UTC)
Received: from kaod.org (37.59.142.105) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Wed, 1 Dec
 2021 08:14:05 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-105G00686e3cafe-0521-4f42-aedc-fcaeb2775d24,
 A214034E9EDAB49BEA2160BF49F8C38F118F2259) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 90.11.56.15
Message-ID: <39556bdc-f48c-68b2-6bec-5975b92e02e2@kaod.org>
Date: Wed, 1 Dec 2021 08:14:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [patch 05/22] genirq/msi: Fixup includes
Content-Language: en-US
To: Thomas Gleixner <tglx@linutronix.de>, LKML <linux-kernel@vger.kernel.org>
CC: <linux-hyperv@vger.kernel.org>, Paul Mackerras <paulus@samba.org>,
 <sparclinux@vger.kernel.org>, Wei Liu <wei.liu@kernel.org>, Ashok Raj
 <ashok.raj@intel.com>, Marc Zygnier <maz@kernel.org>, <x86@kernel.org>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Bjorn Helgaas
 <helgaas@kernel.org>, Jason Gunthorpe <jgg@nvidia.com>,
 <linux-pci@vger.kernel.org>, <xen-devel@lists.xenproject.org>,
 <ath11k@lists.infradead.org>, Kevin Tian <kevin.tian@intel.com>, Heiko
 Carstens <hca@linux.ibm.com>, Alex Williamson <alex.williamson@redhat.com>,
 Megha Dey <megha.dey@intel.com>, Juergen Gross <jgross@suse.com>, Thomas
 Bogendoerfer <tsbogend@alpha.franken.de>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, <linux-mips@vger.kernel.org>,
 <linuxppc-dev@lists.ozlabs.org>
References: <20211126222700.862407977@linutronix.de>
 <20211126223824.382273262@linutronix.de>
 <b1a6d267-c7b4-c4b9-ab0e-f5cc32bfe9bf@kaod.org> <87tufud4m3.ffs@tglx>
 <524d9b84-caa8-dd6f-bb5e-9fc906d279c0@kaod.org> <87czmhb8gq.ffs@tglx>
 <875ys9b71j.ffs@tglx>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <875ys9b71j.ffs@tglx>
X-Originating-IP: [37.59.142.105]
X-ClientProxiedBy: DAG1EX2.mxp5.local (172.16.2.2) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: e52f034b-6a74-4e80-b1cd-9a54c9a992a9
X-Ovh-Tracer-Id: 2359604732828158876
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddriedvgddutdeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepjeekvdfgudevkeefkeeltdejteekvdegffegudetgeettdffjeefheekfeelffdtnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehlihhnuhigphhptgdquggvvheslhhishhtshdrohiilhgrsghsrdhorhhg
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211130_231412_822345_4B662E31 
X-CRM114-Status: GOOD (  10.14  )
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

T24gMTEvMzAvMjEgMjM6NDEsIFRob21hcyBHbGVpeG5lciB3cm90ZToKPiBPbiBUdWUsIE5vdiAz
MCAyMDIxIGF0IDIzOjEwLCBUaG9tYXMgR2xlaXhuZXIgd3JvdGU6Cj4gCj4+IE9uIFR1ZSwgTm92
IDMwIDIwMjEgYXQgMjI6NDgsIEPDqWRyaWMgTGUgR29hdGVyIHdyb3RlOgo+Pj4gT24gMTEvMjkv
MjEgMjI6MzgsIFRob21hcyBHbGVpeG5lciB3cm90ZToKPj4+PiBPbiBNb24sIE5vdiAyOSAyMDIx
IGF0IDA4OjMzLCBDw6lkcmljIExlIEdvYXRlciB3cm90ZToKPj4+PiB0aGFua3MgZm9yIGhhdmlu
ZyBhIGxvb2suIEkgZml4ZWQgdXAgdGhpcyBhbmQgb3RoZXIgZmFsbG91dCBhbmQgcHVzaGVkIG91
dCBhbgo+Pj4+IHVwZGF0ZWQgc2VyaWVzIChhbGwgNCBwYXJ0cykgdG86Cj4+Pj4KPj4+PiAgICAg
ICAgICAgZ2l0Oi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3RnbHgv
ZGV2ZWwgbXNpCj4+Pgo+Pj4gcFNlcmllcyBmYWlscyB0byBhbGxvY2F0ZSBNU0lzIHN0YXJ0aW5n
IHdpdGggdGhpcyBwYXRjaCA6Cj4+Pgo+Pj4gICAgW1BBVENIIDA0OS8xMDFdIHBvd2VycGMvcHNl
cmllcy9tc2k6IExldCBjb3JlIGNvZGUgY2hlY2sgZm9yIGNvbnRpZ3VvdXMgLi4uCj4+Pgo+Pj4g
SSB3aWxsIGRpZyBpbiBsYXRlciBvbi4KPj4KPj4gTGV0IG1lIHN0YXJlIGF0IHRoZSBjb3JlIGZ1
bmN0aW9uLi4KPiAKPiBJdCdzIG5vdCB0aGUgY29yZSBmdW5jdGlvbi4gSXQncyB0aGUgcGF0Y2gg
YWJvdmUgYW5kIEknbSBhIG1vcm9uLgoKQWxsIGdvb2Qgbm93LiBTaGlwIGl0ICEKClRoYW5rcywK
CkMuCgoKCgoKLS0gCmF0aDExayBtYWlsaW5nIGxpc3QKYXRoMTFrQGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9hdGgxMWsK
