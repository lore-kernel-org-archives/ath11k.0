Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 748EBC433FE
	for <ath11k@archiver.kernel.org>; Tue, 30 Nov 2021 21:48:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=glWb3Y5w5JGiFORH2HwnRqwuYJR4cibh7KOOx8xpccM=; b=euIUonzav7jHl7
	Ku93aQ3r62RbQV2HBrdEu+mE+ZMVKSiOBves0PC0CLCJQjHlGt+tqwRiT83FKt2uMg9DMPWDOn8o6
	DTh+xLg8qH4YnpzEdvpIAGhyPM8SBMmCITVYlKwdmy+LmJKMpNAhd5QeLy4ct0ABnVKBKXlgo5Ky7
	/+bJsUq4MCwP2YYTtc4E537nibaKn2X2RXpjF/e+gQ9exkqNTz82aNHAHBjYw+Q2h0NaC87c7bE12
	0kFyeo3MVRhxi99atH7UYYwfx/kIP2hpwD+FQPbXrw2tKFPEhj8raDlEODDKpS4mmXUqOb8+ye9Sj
	57aFFfG0duPpqXgkBi4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1msAzL-006pcL-MR; Tue, 30 Nov 2021 21:48:35 +0000
Received: from 10.mo552.mail-out.ovh.net ([87.98.187.244])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1msAzI-006pZI-2a
 for ath11k@lists.infradead.org; Tue, 30 Nov 2021 21:48:34 +0000
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.123])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 0AD47216DE;
 Tue, 30 Nov 2021 21:48:24 +0000 (UTC)
Received: from kaod.org (37.59.142.99) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Tue, 30 Nov
 2021 22:48:23 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-99G00338e8fa02-b36d-46a2-a9ce-03d85f7b4222,
 1FE831E2BDC1BE20692CF32662DF656E64B35270) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 90.11.56.15
Message-ID: <524d9b84-caa8-dd6f-bb5e-9fc906d279c0@kaod.org>
Date: Tue, 30 Nov 2021 22:48:22 +0100
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
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <87tufud4m3.ffs@tglx>
X-Originating-IP: [37.59.142.99]
X-ClientProxiedBy: DAG3EX2.mxp5.local (172.16.2.22) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 16c7449c-9f55-435d-bf3c-7f66bf2ab8fd
X-Ovh-Tracer-Id: 11252243670229552028
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddriedugdduheehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepjeekvdfgudevkeefkeeltdejteekvdegffegudetgeettdffjeefheekfeelffdtnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtoheplhhinhhugihpphgtqdguvghvsehlihhsthhsrdhoiihlrggsshdrohhrgh
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211130_134832_446273_F5E0C425 
X-CRM114-Status: GOOD (  13.15  )
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

T24gMTEvMjkvMjEgMjI6MzgsIFRob21hcyBHbGVpeG5lciB3cm90ZToKPiBDZWRyaWMsCj4gCj4g
T24gTW9uLCBOb3YgMjkgMjAyMSBhdCAwODozMywgQ8OpZHJpYyBMZSBHb2F0ZXIgd3JvdGU6Cj4+
IE9uIDExLzI3LzIxIDAyOjE4LCBUaG9tYXMgR2xlaXhuZXIgd3JvdGU6Cj4+PiBSZW1vdmUgdGhl
IGtvYmplY3QuaCBpbmNsdWRlIGZyb20gbXNpLmggYXMgaXQncyBub3QgcmVxdWlyZWQgYW5kIGFk
ZCBhCj4+PiBzeXNmcy5oIGluY2x1ZGUgdG8gdGhlIGNvcmUgY29kZSBpbnN0ZWFkLgo+Pj4KPj4+
IFNpZ25lZC1vZmYtYnk6IFRob21hcyBHbGVpeG5lciA8dGdseEBsaW51dHJvbml4LmRlPgo+Pgo+
Pgo+PiBUaGlzIHBhdGNoIGJyZWFrcyBjb21waWxlIG9uIHBvd2VycGMgOgo+Pgo+PiAgICAgQ0Mg
ICAgICBhcmNoL3Bvd2VycGMva2VybmVsL21zaS5vCj4+IEluIGZpbGUgaW5jbHVkZWQgZnJvbSAu
Li9hcmNoL3Bvd2VycGMva2VybmVsL21zaS5jOjc6Cj4+IC4uL2luY2x1ZGUvbGludXgvbXNpLmg6
NDEwOjY1OiBlcnJvcjog4oCYc3RydWN0IGNwdW1hc2vigJkgZGVjbGFyZWQgaW5zaWRlIHBhcmFt
ZXRlciBsaXN0IHdpbGwgbm90IGJlIHZpc2libGUgb3V0c2lkZSBvZiB0aGlzIGRlZmluaXRpb24g
b3IgZGVjbGFyYXRpb24gWy1XZXJyb3JdCj4+ICAgICA0MTAgfCBpbnQgbXNpX2RvbWFpbl9zZXRf
YWZmaW5pdHkoc3RydWN0IGlycV9kYXRhICpkYXRhLCBjb25zdCBzdHJ1Y3QgY3B1bWFzayAqbWFz
aywKPj4gICAgICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBefn5+fn5+Cj4+IGNjMTogYWxsIHdhcm5pbmdzIGJlaW5n
IHRyZWF0ZWQgYXMgZXJyb3JzCj4+Cj4+IEJlbG93IGlzIGZpeCB5b3UgY2FuIG1lcmdlIGluIHBh
dGNoIDUuCj4gCj4gdGhhbmtzIGZvciBoYXZpbmcgYSBsb29rLiBJIGZpeGVkIHVwIHRoaXMgYW5k
IG90aGVyIGZhbGxvdXQgYW5kIHB1c2hlZCBvdXQgYW4KPiB1cGRhdGVkIHNlcmllcyAoYWxsIDQg
cGFydHMpIHRvOgo+IAo+ICAgICAgICAgIGdpdDovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGlu
dXgva2VybmVsL2dpdC90Z2x4L2RldmVsIG1zaQoKcFNlcmllcyBmYWlscyB0byBhbGxvY2F0ZSBN
U0lzIHN0YXJ0aW5nIHdpdGggdGhpcyBwYXRjaCA6CgogIFtQQVRDSCAwNDkvMTAxXSBwb3dlcnBj
L3BzZXJpZXMvbXNpOiBMZXQgY29yZSBjb2RlIGNoZWNrIGZvciBjb250aWd1b3VzIC4uLgoKSSB3
aWxsIGRpZyBpbiBsYXRlciBvbi4KCkMuCgotLSAKYXRoMTFrIG1haWxpbmcgbGlzdAphdGgxMWtA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2F0aDExawo=
