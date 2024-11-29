Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24724D6EBFE
	for <ath11k@archiver.kernel.org>; Fri, 29 Nov 2024 10:45:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	From:References:To:Subject:MIME-Version:Date:Message-ID:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6bltB50E5PPMoIMVEZyJhtV3eOObuF0OiTvrPYqg7Kc=; b=Qet0AO1hqs32PhQJ8eqB46OVwQ
	USCdhK+W22dJIjRSWB3HcrtU0o854acFfBpBJxa+OwBJRmTU47xVKiN8LiVjIMTX77GD/u+Pp0Mbh
	bk8R6ZhoUhgKm6qVP+P/GjKeqbqnZ4G/hynU5corXVmVDbFaH7c24LlGpiNeALarry6iCqSXr7Lsc
	P6GTHA+lNtq7kqCR+EtPIhfNaUJBlWDlCd6LRJCLbsqsadLRfkuGW5fRI89QYGfIOEhkDWvIDukhw
	t3YXFytowll+Jl4U5l0eB6YmR1HcgQracVF7RDbq47HeXdhgIGWXWYjYLtiKD7npm4IMavaqd+ZtW
	+wZFtAUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGyVA-0000000HSsK-2sl2;
	Fri, 29 Nov 2024 10:45:32 +0000
Received: from ionic.de ([145.239.234.145] helo=mail.ionic.de)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGyV7-0000000HSrh-49e9
	for ath11k@lists.infradead.org;
	Fri, 29 Nov 2024 10:45:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ionic.de; s=default;
	t=1732877124; bh=6bltB50E5PPMoIMVEZyJhtV3eOObuF0OiTvrPYqg7Kc=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=QvHQ0Zj6q5lV3guuA7j/I6hrnD0GysOdqy38SZ+vvIXQliji2c36CgLQlux/r+eBl
	 isWgyOk/O8Vb0k1IIzxpZgA9IJHdKPeVi/SZFNgoRSuf+JHD839ictLqZZ6yhwLDDs
	 Jz3rJZkjxd10wwe/tBvOwTsiWbJzU96Kq+jb4Gfg=
Received: from [172.22.111.213] (185.102.219.38.adsl.inet-telecom.org [185.102.219.38])
	by mail.ionic.de (Postfix) with ESMTPSA id 14A5B14886E3;
	Fri, 29 Nov 2024 11:45:24 +0100 (CET)
Message-ID: <1c643b65-6aff-4ce8-84e1-1b4a117a0bb8@ionic.de>
Date: Fri, 29 Nov 2024 11:45:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: ath11k hibernation broken since v6.11
To: Julian Wollrath <jwollrath@web.de>, ath11k@lists.infradead.org
References: <20241115083537.6a5681ad@mayene>
Content-Language: en-US
From: Mihai Moldovan <ionic@ionic.de>
Autocrypt: addr=ionic@ionic.de; keydata=
 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
 S0VlnF9z
In-Reply-To: <20241115083537.6a5681ad@mayene>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------cPPQtFR0ozzC7na0OcJidyz6"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241129_024530_500533_EA9D1200 
X-CRM114-Status: UNSURE (   8.18  )
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
--------------cPPQtFR0ozzC7na0OcJidyz6
Content-Type: multipart/mixed; boundary="------------0AuDKR0n7T6Zf6aTYuv75MXp";
 protected-headers="v1"
From: Mihai Moldovan <ionic@ionic.de>
To: Julian Wollrath <jwollrath@web.de>, ath11k@lists.infradead.org
Message-ID: <1c643b65-6aff-4ce8-84e1-1b4a117a0bb8@ionic.de>
Subject: Re: ath11k hibernation broken since v6.11
References: <20241115083537.6a5681ad@mayene>
In-Reply-To: <20241115083537.6a5681ad@mayene>

--------------0AuDKR0n7T6Zf6aTYuv75MXp
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

KiBPbiAxMS8xNS8yNCAwODozNSwgSnVsaWFuIFdvbGxyYXRoIHdyb3RlOg0KPiBpdCBzZWVt
cyBmb3IgdjYuMTEgdGhlIHBhdGNoIG1ha2luZyBoaWJlcm5hdGlvbiBwb3NzaWJsZSB3aXRo
IGF0aDExaw0KPiB3YXMgcmV2ZXJ0ZWQgYWdhaW4gKGluIGNvbW1pdCAyZjgzM2U4OTQ4KS4g
VGhpcyBicm9rZSBoaWJlcm5hdGlvbiBmb3INCj4gbWUuIElzIHRoZXJlIGEgcGxhbiB0byBy
ZS1pbnRyb2R1Y2UgaXQ/DQoNClVuZm9ydHVuYXRlbHksIHRoZSBjb21taXQgbWVzc2FnZSBt
ZW50aW9ucyB0aGF0IG5vIGFsdGVybmF0aXZlIGZpeCBpcyBhdmFpbGFibGUsIA0Kc28gSSB3
b3VsZG4ndCBob2xkIG15IGJyZWF0aC4NCg0KQXMgYSBmZWxsb3cgUUNORkE3NjUgdXNlciBp
biBhIG5vbi1MZW5vdm8gbWFjaGluZSwgcHJldmlvdXNseSBvbiA2LjkuMSB3aGljaCANCmRp
ZG4ndCBpbmNsdWRlIHRoZSBoaWJlcm5hdGlvbiBwYXRjaCwgSSByZXNvcnRlZCB0byBhIHdv
cmthcm91bmQgb2Ygc3RvcHBpbmcgdGhlIA0Kd2lmaSBpbnRlcmZhY2UsIHJlbW92aW5nIHJl
bGV2YW50IG1vZHVsZXMgKG1vZHByb2JlIC1yICdhdGgxMWtfcGNpJyAnYXRoMTFrJyANCidx
bWlfaGVscGVycycpIG9uIHN1c3BlbmQvaGliZXJuYXRlIGFuZCByZS1pbnNlcnRpbmcgYXRo
MTFrX3BjaSBvbiByZXN1bWUgdmlhIA0KZWxvZ2luZCBzeXN0ZW0tc2xlZXAgaG9va3MuIFRo
aXMgaXMgZWFzaWx5IHBvcnRhYmxlIHRvIGEgc3lzdGVtZC1iYXNlZCBzZXR1cC4NCg0KVGhp
cyBzaWRlc3RlcHBlZCBhbnkgaGliZXJuYXRpb24gaXNzdWVzIHJlbGF0ZWQgdG8gdGhlIG1v
ZHVsZS4NCg0KDQoNCk1paGFpDQo=

--------------0AuDKR0n7T6Zf6aTYuv75MXp--

--------------cPPQtFR0ozzC7na0OcJidyz6
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEEbhHQj3UzgcdE8cg8H9Yu2W4lOocFAmdJm0MFAwAAAAAACgkQH9Yu2W4lOoeU
jhAAxOECcni9K3L1qWVYWVU0+5azFcv02sRRa31KxontXrOuh6txDy/72K+ldZ8qVhm2mRSUFZsN
hyJyqR83dvj7xvFfWkvG9k4VQCBe7CRARudwT+8G8pSwD0EHR6Jd8oXzOyOfHYThALVAbB86YWIE
sqJ7N0vJdWtS4CMbGoRQZFxbQWsUS0zI+79K1bLQYlTa++ae3dYrUMfeGYtmLYXFmIZ57E0Y20vn
EVXGET5r5rgyJtdBhvEYeXLYFM9ciYki93e2Jc+xpZYIM1e0C2xzltYm2SvmD6zSwY84jfC+8Lhc
1pKeWOCK4m2pMr+OlA9SdIQ6C9aKEm+4euziNcABi1ne4Z5qtEqZ3hBT45AEXSoRekESIzvC4W57
poq6yJ9aAZA3LBpBHsRC8Ui+j5jHYICOrFlKWCLzxxYpl9DtHh+zuZuWKsGOGPIf3UdFbW/8RSSu
HnyNYMc2xqv8KFAdvAGZnqT04Cdjeyd3WX3PSwEQkN2nShIowslIXZlyRkg0W/79dc/hGEYdIYoH
rBHHLoYqSoytqufjBPeUSPJHeUGtwqBoqfa5hPNad6/fTArRnWjLLdI8/qA05GomqvDpYMy+Lb+5
LZUDibv1wnj4UD0Ts1+EsmnGKVsVwJNiJlBxVWK4KkZFG+5EMs+S68VS0Y1rKBv8Qox0OQjozPGG
lTA=
=8Nqo
-----END PGP SIGNATURE-----

--------------cPPQtFR0ozzC7na0OcJidyz6--

