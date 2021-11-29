Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB9A3C433EF
	for <ath11k@archiver.kernel.org>; Mon, 29 Nov 2021 21:40:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=up1Qd1bjsoLwY1QYufdoy/BrMTwqM4py2AFaIpAA2W0=; b=Umg36AYjYQdp5A
	QFqG3cFPO2ymoGZ3VS5BFvPUBqMwA7eYc8PGDZ2IGXdp/QqF6JV81N9YXQIy3yT+tIL+gE3OnlrGs
	rCP1T4rPfCRW7QIUJm75JSR9rXwL4nJqDOvccwawBmln/l4s83a26fHu/qncB9sWCxe1xUASA6Qr9
	MV7ykZaAeCekHFwbeRi5JTejduarhW2DnzSROml5yQsBXzbfoDcwTSnaPiZe7FKEodR+HPsrU6qvT
	6QFJHoG8gV+LCWXlKXQY1oOUsKE6KChbX6xyE4vaxde7Zv7lOJczbPnXGGRlv2z6dg54b7tsoDXz0
	4TNmCcX4370t4Vh/v+Nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mroNm-002nrw-Hy; Mon, 29 Nov 2021 21:40:18 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mroMM-002nP5-Lu
 for ath11k@lists.infradead.org; Mon, 29 Nov 2021 21:38:52 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1638221925;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sTsTXZmVNEttdKActcp/MQ79Sqm2VlTHeENYuk8KrhE=;
 b=ILyfVKGE5UZvmRThsq5XEtpixIVIivrUSBAXm+humQHTDLzWIKEX4H8+4OD+aeIfZ4DV92
 9T+62U6FIpWYIpoyRwMMumiAWctcb/I9yr1yNfsu8sRnZChwXIMAcSaHOA+Rqc6gRrobwk
 VD1hPi2gr2//sF+SQuC4nahdGSaDafaDW7sBy0aS8tR1r1meQJeCOwOOGRC5aIHAc9Xvk4
 /FJzDlJKlE89PcGuwq4SuMSriWZnI0H29jLtYIq6CXQ6TOUli2NIXrPAh97GMsBqbXW+Qh
 eBXpIwFI96/i9Jnc137e9kO89zceLA086wH/JPWoxTfUn5qn3H8Cfws4QVJy/w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1638221925;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sTsTXZmVNEttdKActcp/MQ79Sqm2VlTHeENYuk8KrhE=;
 b=IFrPJPgHlzA5jXpCGMUgcnutoSn2o/emSpKWK3dUIvafMv+/N8+lm8fxoSszjkihxr/hYU
 KzMXez+vjEq3dIDw==
To: =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>, LKML
 <linux-kernel@vger.kernel.org>
Cc: linux-hyperv@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 sparclinux@vger.kernel.org, Wei Liu <wei.liu@kernel.org>, Ashok Raj
 <ashok.raj@intel.com>, Marc Zygnier <maz@kernel.org>, x86@kernel.org,
 Christian Borntraeger <borntraeger@de.ibm.com>, Bjorn Helgaas
 <helgaas@kernel.org>, Jason Gunthorpe <jgg@nvidia.com>,
 linux-pci@vger.kernel.org, xen-devel@lists.xenproject.org,
 ath11k@lists.infradead.org, Kevin Tian <kevin.tian@intel.com>, Heiko
 Carstens <hca@linux.ibm.com>, Alex Williamson
 <alex.williamson@redhat.com>, Megha Dey <megha.dey@intel.com>, Juergen
 Gross <jgross@suse.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [patch 05/22] genirq/msi: Fixup includes
In-Reply-To: <b1a6d267-c7b4-c4b9-ab0e-f5cc32bfe9bf@kaod.org>
References: <20211126222700.862407977@linutronix.de>
 <20211126223824.382273262@linutronix.de>
 <b1a6d267-c7b4-c4b9-ab0e-f5cc32bfe9bf@kaod.org>
Date: Mon, 29 Nov 2021 22:38:44 +0100
Message-ID: <87tufud4m3.ffs@tglx>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211129_133850_938702_FF37D138 
X-CRM114-Status: GOOD (  11.48  )
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

Q2VkcmljLAoKT24gTW9uLCBOb3YgMjkgMjAyMSBhdCAwODozMywgQ8OpZHJpYyBMZSBHb2F0ZXIg
d3JvdGU6Cj4gT24gMTEvMjcvMjEgMDI6MTgsIFRob21hcyBHbGVpeG5lciB3cm90ZToKPj4gUmVt
b3ZlIHRoZSBrb2JqZWN0LmggaW5jbHVkZSBmcm9tIG1zaS5oIGFzIGl0J3Mgbm90IHJlcXVpcmVk
IGFuZCBhZGQgYQo+PiBzeXNmcy5oIGluY2x1ZGUgdG8gdGhlIGNvcmUgY29kZSBpbnN0ZWFkLgo+
PiAKPj4gU2lnbmVkLW9mZi1ieTogVGhvbWFzIEdsZWl4bmVyIDx0Z2x4QGxpbnV0cm9uaXguZGU+
Cj4KPgo+IFRoaXMgcGF0Y2ggYnJlYWtzIGNvbXBpbGUgb24gcG93ZXJwYyA6Cj4KPiAgICBDQyAg
ICAgIGFyY2gvcG93ZXJwYy9rZXJuZWwvbXNpLm8KPiBJbiBmaWxlIGluY2x1ZGVkIGZyb20gLi4v
YXJjaC9wb3dlcnBjL2tlcm5lbC9tc2kuYzo3Ogo+IC4uL2luY2x1ZGUvbGludXgvbXNpLmg6NDEw
OjY1OiBlcnJvcjog4oCYc3RydWN0IGNwdW1hc2vigJkgZGVjbGFyZWQgaW5zaWRlIHBhcmFtZXRl
ciBsaXN0IHdpbGwgbm90IGJlIHZpc2libGUgb3V0c2lkZSBvZiB0aGlzIGRlZmluaXRpb24gb3Ig
ZGVjbGFyYXRpb24gWy1XZXJyb3JdCj4gICAgNDEwIHwgaW50IG1zaV9kb21haW5fc2V0X2FmZmlu
aXR5KHN0cnVjdCBpcnFfZGF0YSAqZGF0YSwgY29uc3Qgc3RydWN0IGNwdW1hc2sgKm1hc2ssCj4g
ICAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIF5+fn5+fn4KPiBjYzE6IGFsbCB3YXJuaW5ncyBiZWluZyB0cmVhdGVk
IGFzIGVycm9ycwo+Cj4gQmVsb3cgaXMgZml4IHlvdSBjYW4gbWVyZ2UgaW4gcGF0Y2ggNS4KCnRo
YW5rcyBmb3IgaGF2aW5nIGEgbG9vay4gSSBmaXhlZCB1cCB0aGlzIGFuZCBvdGhlciBmYWxsb3V0
IGFuZCBwdXNoZWQgb3V0IGFuCnVwZGF0ZWQgc2VyaWVzIChhbGwgNCBwYXJ0cykgdG86CgogICAg
ICAgIGdpdDovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC90Z2x4L2Rl
dmVsIG1zaQoKVGhhbmtzLAoKICAgICAgICB0Z2x4CgotLSAKYXRoMTFrIG1haWxpbmcgbGlzdAph
dGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2F0aDExawo=
