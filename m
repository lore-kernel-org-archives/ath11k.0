Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAD53C433F5
	for <ath11k@archiver.kernel.org>; Mon, 29 Nov 2021 07:33:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DLu0XmWDQ1YUShSn3X2pmyJkh2/1dp/BQHz1NaIyB10=; b=BSxAjsTJzud30b
	dyCmyDd4R9e5uIX5xi8IRIkql54jX4hAyIuN4BonrNgSzQwi28L8h9jQ1AvOeXEXRuKFsCZcJ2906
	mRj/JOTKTl9IK13QtjPHWljDAgTSVbqvlNFCw3s6sUOaPeiZglZqhwlYpHrRX7Fj4sDkxICeHyIsd
	HbmDV9j4wLukPwTZdmdy+iaAMu0N3Jc/uCLUMUzj73HgfBbw41hgXUSVX1UpDCQH2L9cvf+Gb2NlJ
	hcEplqr6gdufKX5WZe4pQEYyVCi5OfgXitGZcECHwcMsgKO7TGpLX/hehk2T7vpbWbws9S2wN7cNv
	Ne2DHVPGPqSDyXHT3oQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mrbAd-0002Bm-P4; Mon, 29 Nov 2021 07:33:51 +0000
Received: from 10.mo548.mail-out.ovh.net ([46.105.77.235])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mrbAa-0002BG-An
 for ath11k@lists.infradead.org; Mon, 29 Nov 2021 07:33:50 +0000
Received: from mxplan5.mail.ovh.net (unknown [10.108.20.7])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id D10AB2064C;
 Mon, 29 Nov 2021 07:33:34 +0000 (UTC)
Received: from kaod.org (37.59.142.103) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Mon, 29 Nov
 2021 08:33:33 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-103G0058ffb0110-7673-40ee-a51a-c9a65a45fa89,
 3279756C2EB34864E332BB908A933B747C53BE44) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <b1a6d267-c7b4-c4b9-ab0e-f5cc32bfe9bf@kaod.org>
Date: Mon, 29 Nov 2021 08:33:33 +0100
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
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20211126223824.382273262@linutronix.de>
X-Originating-IP: [37.59.142.103]
X-ClientProxiedBy: DAG1EX2.mxp5.local (172.16.2.2) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 67cb6c92-6833-4394-901b-34c8b386eb6d
X-Ovh-Tracer-Id: 9389442276353674140
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrheekgdegjecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeeigedvffekgeeftedutddttdevudeihfegudffkeeitdekkeetkefhffelveelleenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtfeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehlihhnuhigphhptgdquggvvheslhhishhtshdrohiilhgrsghsrdhorhhg
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211128_233348_702974_4BB52B63 
X-CRM114-Status: GOOD (  14.03  )
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

T24gMTEvMjcvMjEgMDI6MTgsIFRob21hcyBHbGVpeG5lciB3cm90ZToKPiBSZW1vdmUgdGhlIGtv
YmplY3QuaCBpbmNsdWRlIGZyb20gbXNpLmggYXMgaXQncyBub3QgcmVxdWlyZWQgYW5kIGFkZCBh
Cj4gc3lzZnMuaCBpbmNsdWRlIHRvIHRoZSBjb3JlIGNvZGUgaW5zdGVhZC4KPiAKPiBTaWduZWQt
b2ZmLWJ5OiBUaG9tYXMgR2xlaXhuZXIgPHRnbHhAbGludXRyb25peC5kZT4KCgpUaGlzIHBhdGNo
IGJyZWFrcyBjb21waWxlIG9uIHBvd2VycGMgOgoKICAgQ0MgICAgICBhcmNoL3Bvd2VycGMva2Vy
bmVsL21zaS5vCkluIGZpbGUgaW5jbHVkZWQgZnJvbSAuLi9hcmNoL3Bvd2VycGMva2VybmVsL21z
aS5jOjc6Ci4uL2luY2x1ZGUvbGludXgvbXNpLmg6NDEwOjY1OiBlcnJvcjog4oCYc3RydWN0IGNw
dW1hc2vigJkgZGVjbGFyZWQgaW5zaWRlIHBhcmFtZXRlciBsaXN0IHdpbGwgbm90IGJlIHZpc2li
bGUgb3V0c2lkZSBvZiB0aGlzIGRlZmluaXRpb24gb3IgZGVjbGFyYXRpb24gWy1XZXJyb3JdCiAg
IDQxMCB8IGludCBtc2lfZG9tYWluX3NldF9hZmZpbml0eShzdHJ1Y3QgaXJxX2RhdGEgKmRhdGEs
IGNvbnN0IHN0cnVjdCBjcHVtYXNrICptYXNrLAogICAgICAgfCAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXn5+fn5+fgpjYzE6
IGFsbCB3YXJuaW5ncyBiZWluZyB0cmVhdGVkIGFzIGVycm9ycwoKQmVsb3cgaXMgZml4IHlvdSBj
YW4gbWVyZ2UgaW4gcGF0Y2ggNS4KClRoYW5rcywKCkMuCgotLS0gYS9pbmNsdWRlL2xpbnV4L21z
aS5oCisrKyBiL2luY2x1ZGUvbGludXgvbXNpLmgKQEAgLTIsNiArMiw3IEBACiAgI2lmbmRlZiBM
SU5VWF9NU0lfSAogICNkZWZpbmUgTElOVVhfTVNJX0gKICAKKyNpbmNsdWRlIDxsaW51eC9jcHVt
YXNrLmg+CiAgI2luY2x1ZGUgPGxpbnV4L2xpc3QuaD4KICAjaW5jbHVkZSA8YXNtL21zaS5oPgoK
PiAtLS0KPiAgIGluY2x1ZGUvbGludXgvbXNpLmggfCAgICAxIC0KPiAgIGtlcm5lbC9pcnEvbXNp
LmMgICAgfCAgICAxICsKPiAgIDIgZmlsZXMgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVs
ZXRpb24oLSkKPiAKPiAtLS0gYS9pbmNsdWRlL2xpbnV4L21zaS5oCj4gKysrIGIvaW5jbHVkZS9s
aW51eC9tc2kuaAo+IEBAIC0yLDcgKzIsNiBAQAo+ICAgI2lmbmRlZiBMSU5VWF9NU0lfSAo+ICAg
I2RlZmluZSBMSU5VWF9NU0lfSAo+ICAgCj4gLSNpbmNsdWRlIDxsaW51eC9rb2JqZWN0Lmg+Cj4g
ICAjaW5jbHVkZSA8bGludXgvbGlzdC5oPgo+ICAgI2luY2x1ZGUgPGFzbS9tc2kuaD4KPiAgIAo+
IC0tLSBhL2tlcm5lbC9pcnEvbXNpLmMKPiArKysgYi9rZXJuZWwvaXJxL21zaS5jCj4gQEAgLTE0
LDYgKzE0LDcgQEAKPiAgICNpbmNsdWRlIDxsaW51eC9pcnFkb21haW4uaD4KPiAgICNpbmNsdWRl
IDxsaW51eC9tc2kuaD4KPiAgICNpbmNsdWRlIDxsaW51eC9zbGFiLmg+Cj4gKyNpbmNsdWRlIDxs
aW51eC9zeXNmcy5oPgo+ICAgI2luY2x1ZGUgPGxpbnV4L3BjaS5oPgo+ICAgCj4gICAjaW5jbHVk
ZSAiaW50ZXJuYWxzLmgiCj4gCgoKLS0gCmF0aDExayBtYWlsaW5nIGxpc3QKYXRoMTFrQGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9hdGgxMWsK
