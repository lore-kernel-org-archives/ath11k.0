Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 707F5E6918F
	for <ath11k@archiver.kernel.org>; Fri, 22 Nov 2024 20:05:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	From:References:To:Subject:MIME-Version:Date:Message-ID:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GOtpR5fyT2vGTWZ6/1WG89thpef6+jwzG6v/yxh8QL8=; b=UWrzsdizDh9isrDClh83SNNVGX
	RoOMj6XPaeglvDHcLGnLVc04oSzumjNJAZG+rC9SgTzqjEmz1Qn2T1CczHBDi2u7HaVgIwldj31q6
	M1+EHMot4lbIQICcXlfST1PaW97bTQRwUZsaXuH6yYRrYLW5yfOVhR1gTSc1/J89puHjAld1tGrZE
	hGhuZC+Bslz5dZvYZykMqUdg0cIg2wzmrrp6t25vPfFb8ncy3d+6Pet7fFdMNiOLaHZDMw25Y3PZu
	ED/XMuZrvyrtGfeHI65+ZqH0IW2oHPTG1rZYysmWybUAkQJwPi21rcKZJko3U6w1uS0oZu3e6k+3l
	9CEtmseA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tEZtx-00000003Fi7-2rO4;
	Fri, 22 Nov 2024 20:05:13 +0000
Received: from ionic.de ([145.239.234.145] helo=mail.ionic.de)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tEZtu-00000003Fgh-2Fxf
	for ath11k@lists.infradead.org;
	Fri, 22 Nov 2024 20:05:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ionic.de; s=default;
	t=1732305905; bh=GOtpR5fyT2vGTWZ6/1WG89thpef6+jwzG6v/yxh8QL8=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=oOdIsY6dpuwNpKJMDSsaX5CnC1BX5U+0gJtlLi2yjn+mmM1ZGolA0fGK5cGvjMUqt
	 E9LzHbIgstNG4Y7wKrAwQAHQHXG2NOcyzvYLtpDv1oX1ElNVf/BKvG76/o0jP2V3DT
	 nGT7BAQmNSjMwpkJQoOYxHEBdoBQ7sGjilyqLr1I=
Received: from [172.22.111.213] (185.102.219.38.adsl.inet-telecom.org [185.102.219.38])
	by mail.ionic.de (Postfix) with ESMTPSA id 8FA6F1487394;
	Fri, 22 Nov 2024 21:05:05 +0100 (CET)
Message-ID: <607a548e-7972-42e5-9c73-f928ebff81d9@ionic.de>
Date: Fri, 22 Nov 2024 21:05:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC] [PATCH 00/13] ath1{1,2}k: support multiple PCI devices in
 one system
To: Jeff Johnson <quic_jjohnson@quicinc.com>, ath11k@lists.infradead.org
References: <cover.1731858971.git.ionic@ionic.de>
 <4c5a9c95-13a3-440a-9947-a11209876c0b@ionic.de>
 <6b9c0664-f58a-4978-a371-741c6e6eb133@quicinc.com>
 <872fd68a-b484-46b0-803d-9a6ceb823931@quicinc.com>
Content-Language: en-US
From: Mihai Moldovan <ionic@ionic.de>
Autocrypt: addr=ionic@ionic.de; keydata=
 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
 S0VlnF9z
In-Reply-To: <872fd68a-b484-46b0-803d-9a6ceb823931@quicinc.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------Ae07cfXrqEXfAvUdAcfzUsPg"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241122_120510_748840_1648F2E5 
X-CRM114-Status: GOOD (  12.22  )
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
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------Ae07cfXrqEXfAvUdAcfzUsPg
Content-Type: multipart/mixed; boundary="------------qH5KzaRZUyTRZmPP499ttB93";
 protected-headers="v1"
From: Mihai Moldovan <ionic@ionic.de>
To: Jeff Johnson <quic_jjohnson@quicinc.com>, ath11k@lists.infradead.org
Message-ID: <607a548e-7972-42e5-9c73-f928ebff81d9@ionic.de>
Subject: Re: [RFC] [PATCH 00/13] ath1{1,2}k: support multiple PCI devices in
 one system
References: <cover.1731858971.git.ionic@ionic.de>
 <4c5a9c95-13a3-440a-9947-a11209876c0b@ionic.de>
 <6b9c0664-f58a-4978-a371-741c6e6eb133@quicinc.com>
 <872fd68a-b484-46b0-803d-9a6ceb823931@quicinc.com>
In-Reply-To: <872fd68a-b484-46b0-803d-9a6ceb823931@quicinc.com>

--------------qH5KzaRZUyTRZmPP499ttB93
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

KiBPbiAxMS8yMi8yNCAxNzo0MCwgSmVmZiBKb2huc29uIHdyb3RlOg0KPj4gV2hlbiB5b3Ug
cG9zdCB2MiwgcGxlYXNlIHVzZSBzY3JpcHRzL2dldF9tYWludGFpbmVyLnBsIHRvIGlkZW50
aWZ5IGFsbCBvZiB0aGUNCj4+IG1haW50YWluZXJzIGFuZCBtYWlsaW5nIGxpc3RzIHRoYXQg
c2hvdWxkIGJlIG5vdGlmaWVkIG9mIHRoaXMgUkZDLg0KPj4NCj4+IEkgc3VzcGVjdCB5b3Ug
d29uJ3QgZ2V0IG11Y2ggZmVlZGJhY2sgd2l0aG91dCBkb2luZyBzby4NCj4gDQo+IFRoZSBz
b29uZXIgeW91IHBvc3QgYSB2MiBhbmQgaW5jbHVkZSBhbGwgb2YgdGhlIHJpZ2h0IHBlb3Bs
ZSBhbmQgbGlzdHMsIHRoZQ0KPiBzb29uZXIgdGhlIGNoYW5jZXMgb2YgZ2V0dGluZyBnb29k
IGZlZWRiYWNrLiBGcm9tIGludGVybmFsIFdMQU4gdGVhbQ0KPiBkaXNjdXNzaW9uIHRoZSBj
b25jZXB0IGlzIGdvb2QsIGJ1dCB0aGUgaW1wbGVtZW50YXRpb24gaXMgbm90IGlkZWFsLiBI
b3BlZnVsbHkNCj4gcHVsbGluZyBpbiB0aGUgYWN0dWFsIFFSVFIgJiBNSEkgZGV2ZWxvcGVy
cyBhbmQgbWFpbnRhaW5lciB3aWxsIGxlYWQgdG8gYQ0KPiBjbGVhbmVyIGFuZCBhY2NlcHRh
YmxlIHNvbHV0aW9uLg0KDQpUaGFuayB5b3UsIEplZmYuDQoNCk15IGluaXRpYWwgaWRlYSB3
YXMgdG8gbm90ICJzcGFtIiBvdGhlciBsaXN0cyB3aXRoIHRoaXMgUkZDLCBiZWNhdXNlIGl0
IGRlcGVuZHMgDQpvbi9pcyBiYXNlZCBvbiB5ZXQgYW5vdGhlciBSRkMgKGMuZi4sIERlbmlz
KSB3aGljaCBoYXMgYmVlbiByZXZpZXdlZCBvbmNlLCBidXQgDQpoYXMgYSBmZXcgcm91Z2gg
ZWRnZXMgYW5kIGlzbid0IG1lcmdlLXJlYWR5IHlldC4gU2luY2UgYXRoMTFrIGFuZCBhdGgx
MmsgYXJlIHRoZSANCm9ubHkgdXNlcnMgb2YgdGhlIG5ldyBmZWF0dXJlLCBJIGZpZ3VyZWQg
aXQgd291bGQgYmUgbW9yZSBhcHByb3ByaWF0ZSB0byBwb3N0IGl0IA0KaGVyZSBvbmx5Lg0K
DQoNClVuZm9ydHVuYXRlbHksIEkgaGF2ZSBiZWVuIHN3YW1wZWQgd2l0aCB3b3JrIHRoaXMg
d2Vlaywgc28gd2Fzbid0IGFibGUgdG8gZm9sbG93IA0KdXAgb24gdGhpcy4NCg0KSSdsbCBy
ZWJhc2UgYWdhaW5zdCB0aGUgbmV3ZXN0IHRhZywgdXNlIGdldF9tYWludGFpbmVyLnBsLCBj
aGVja3BhdGNoLnBsLCBmaXggDQp3YXJuaW5ncyBhbmQgcmVzdWJtaXQgd2l0aCBhIGZpeGVk
IGNvdmVyIGxldHRlciBzb21lIHRpbWUgdGhpcyB3ZWVrZW5kLg0KDQoNCg0KTWloYWkNCg==


--------------qH5KzaRZUyTRZmPP499ttB93--

--------------Ae07cfXrqEXfAvUdAcfzUsPg
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEEbhHQj3UzgcdE8cg8H9Yu2W4lOocFAmdA4/AFAwAAAAAACgkQH9Yu2W4lOofV
Uw//eWWKC2sKsbI6IoWWgocmUABasyN1aw2pBArerItGfRcFX12UDTa5RhbXsppe3VESqe0/QOkp
lh0s/XdGK7Dp5mc7x7SKl74kqQKuras+YcxyubCOo88YGOLJF8dWuPC0Kk0b+7LGDzn217PCtTHA
HY3NF6yC5khIT/UaVIoaf/3j34cINODGHJxyfwM5CrHwRRfH87NqqMiFZG8jPxbmsnBuIExkcTH+
Ex1510Yh0prsMSTn8I3RGU1098r8Uy4YFYMt1jdc4dITYKFMmS1a6HDo5u7Tt8aayP3dsxrFyC27
LWOw0GtcD7tHxeslyrUF/cnMVlvO6n6XCgF+q0MLq1xwPSgVNjJFePqkTEfFOJ3i056kRFIZXeBy
cumRN5HUw79uFW1E5jTMrQJ+TZTYFSEWJYR/va1XNIZkFMiqXE3zLtGiXsGk556nrp38oJD0PzkQ
z93t5+ma25BVNE348fSWC0l1sqmd0s+raylQwImKwmAl71QSU11PLVY/R4ky94spbW79nwq+Drvs
tI3saB/XxxDihrO6mUSSoVbpGPsRPxLhbSkmez5HqUD6arC6QJcIfrH97TdBBt0Q+Il+9GKk1rrb
4NIIfqcrCR4hWewZ7wbRYRQW4LefCsjjbRojakO+2swLCRG0CrmXAwTDtmJ8vuY0fwSpwPeBT16Z
xqk=
=Lpf+
-----END PGP SIGNATURE-----

--------------Ae07cfXrqEXfAvUdAcfzUsPg--

