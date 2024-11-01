Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58C4BE6F06F
	for <ath11k@archiver.kernel.org>; Fri,  1 Nov 2024 17:17:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:From:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9rVr+ovZYGdSgX0rEl7IOOIL1OZFgSIUZHUL1YV/j9c=; b=q1e+IbBnWrqLEyujVMnOlyLKmV
	71EzK7upe4PoUckvh7toAZGp4rcfQmug2shMnC0Xspbj7Gb1hqoBtS+aEAm1dewJx0zeZXFdFPoQs
	pvTXar11p68ZanjOGBF7JB4f0V9VbOLV6edEPXThsPkCsDbxDfsOz1y29EeeoJKeVSCGvf4kq17L8
	EwjX+BY4+19eYfge2fZXDKSYjYRkTm0ceWclcHQtzlIIsBvxQSWJNgrzEcqxGcGLf+gGCY9Da5j8p
	vTY8WUW8k++wlZdy9bYFrFWog5WcaJ3zgpNnn+0AB9VSGD+frpSPuDP+G82qX37gl4zWUdpJRMcFA
	FAS/TOQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6vHD-00000007oaR-32GT;
	Fri, 01 Nov 2024 17:17:35 +0000
Received: from ionic.de ([2001:41d0:700:3394:1::2] helo=mail.ionic.de)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6vHA-00000007oZc-2RgP
	for ath11k@lists.infradead.org;
	Fri, 01 Nov 2024 17:17:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ionic.de; s=default;
	t=1730481451; bh=9rVr+ovZYGdSgX0rEl7IOOIL1OZFgSIUZHUL1YV/j9c=;
	h=Date:Subject:To:From:From;
	b=tH9NNp9wj8SYnRHXaHKQ3Oyzse10GYQbegwuGYSUKfPr7HaUPk00VoD6ofHFgoatp
	 O/SmF09VaXPDWIpD+RxPFEP14anaKLmaEWeet0kmLrg20ZyIxZhdgXqs5Tyc3fvHiY
	 dIJERUUdpyZJOT2xXtxUGwh5VNyQxbTTV5Hj530Q=
Received: from [172.22.111.213] (185.102.219.38.adsl.inet-telecom.org [185.102.219.38])
	by mail.ionic.de (Postfix) with ESMTPSA id F2321148867B
	for <ath11k@lists.infradead.org>; Fri, 01 Nov 2024 18:17:30 +0100 (CET)
Message-ID: <a7954fb4-4f3f-4923-8d50-a04891037d3f@ionic.de>
Date: Fri, 1 Nov 2024 18:17:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: State of multiple PCI(e) modules since 2022
To: ath11k@lists.infradead.org
Content-Language: en-US
From: Mihai Moldovan <ionic@ionic.de>
Autocrypt: addr=ionic@ionic.de; keydata=
 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
 S0VlnF9z
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------G1M1dOqNFfGv9tr60Q94StQf"
X-Bad-Reply: 'Re:' in Subject but no References or In-Reply-To headers
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_101732_809326_143D5728 
X-CRM114-Status: UNSURE (   5.80  )
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
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------G1M1dOqNFfGv9tr60Q94StQf
Content-Type: multipart/mixed; boundary="------------NkiY4FmmYw6zz0TYbkB0yI4y";
 protected-headers="v1"
From: Mihai Moldovan <ionic@ionic.de>
To: ath11k@lists.infradead.org
Message-ID: <a7954fb4-4f3f-4923-8d50-a04891037d3f@ionic.de>
Subject: Re: State of multiple PCI(e) modules since 2022

--------------NkiY4FmmYw6zz0TYbkB0yI4y
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

KiBPbiAxMS8xLzI0IDE4OjA1LCBNaWhhaSBNb2xkb3ZhbiB3cm90ZToNCiA+IFsuLi5dDQoN
ClNvcnJ5LCBteSBtYWlsIGNsaWVudCBjcmFzaGVkIHdoaWxlIGNvbXBvc2luZyB0aGUgbWVz
c2FnZSBhbmQgY29udGludWluZyB0aGUgDQpkcmFmdCBkaWRuJ3QgYXV0b21hdGljYWxseSBp
bmNsdWRlIHRoZSBJbi1SZXBseS1UbyBvciBSZWZlcmVuY2VzIGhlYWRlcnMuIA0KVW5mb3J0
dW5hdGVseSBJIG9ubHkgbm90aWNlZCB0aGF0IGFmdGVyIHJlY2VpdmluZyBhIGNvcHkgb2Yg
bXkgbWVzc2FnZSBiYWNrIGZyb20gDQp0aGUgbGlzdC4gSSBkaWRuJ3QgaW50ZW5kIHRvIGJy
ZWFrIHRoZSBvcmlnaW5hbCB0aHJlYWQuIEknbSBhd2FyZSB0aGF0IHRoaXMgaXMgDQpoaWdo
bHkgYW5ub3lpbmcuDQoNCkknbGwgYmUgbW9yZSBjYXJlZnVsIGluIHRoZSBmdXR1cmUgYW5k
IHdpbGwgbWFudWFsbHkgc3VwcGx5IGFuIEluLVJlcGx5LVRvIA0KaGVhZGVyIG5vdyB0aGF0
IEknbSBhd2FyZSBvZiB0aGUgaXNzdWVzIHdpdGggY29udGludWluZyBhIGRyYWZ0IG1lc3Nh
Z2UuDQoNCg0KDQpNaWhhaQ0K

--------------NkiY4FmmYw6zz0TYbkB0yI4y--

--------------G1M1dOqNFfGv9tr60Q94StQf
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEEbhHQj3UzgcdE8cg8H9Yu2W4lOocFAmclDSoFAwAAAAAACgkQH9Yu2W4lOodu
xxAA1CJXG2aLOI4iLF97WAIBIrWt1FcDuU/myxdluYp7eGfXfqNcoKkwRrIKDa+mg2cM+J2QscKs
uA7JwXZJbbaGDSSPCLc5U1RV0rK+pxPB+YHJJOynIPSIV7WzKhBoS61ktz9ESkKEqkSZE3FhBehH
pRHMeCQV8WXY9pScDa7Bi/cHLO9RlpKMTHnadIvZc+SMGU19smPxhsF0AsmH8suPuHR0AJ5nn1J9
DAR/g+UqcRyzgeNosSIz45qrC1toOYYre1AzP4J8p+9oWo9rifOq7nUeKtvNwTm3tEg3WkdsfHBc
x/NY1sFdq683Tlqf47xBwyI/9nVvDVR5nYutzh23dwh1y+/4HLSyuLq7xQN9DKz/OG1rKAmA4wZA
2guwWvUQ/7YHk586RgqESbx/rMaZQy2RwSIfKjLr7P1VHykJiu9iVmeAwrMmdeb8buQgdsMb/uB0
CfBACff9Rg6PlC5xWX4oLFONc6LHO/1bendxuZHDADqelNo/ZPuL1b+dAJMSJygWMifdLRgcXRLy
pOn/v5BfRWszGELgDxMwH5WNMbsdd6F8GNX+AV8NyyNCMePOE1ZX4uA6BW2ObTslBikTPC0TG7G7
zU+QCWLABSbNnOzIp+bxmUPCBSDsnXf1y6UvCw/AS5XFKerq143iyBQmDkv2N6Uup9gvTxDQoWu2
2Dk=
=pkHg
-----END PGP SIGNATURE-----

--------------G1M1dOqNFfGv9tr60Q94StQf--

