Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1236FE6F06F
	for <ath11k@archiver.kernel.org>; Fri,  1 Nov 2024 17:05:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:Subject:From
	:MIME-Version:Date:Message-ID:Reply-To:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LBFXvtix+QX0jVzv0EWywfuffsmKdLD8CixdVkArwXs=; b=pqZuLZgrO8TOFmGXtS0uW2Frwi
	4qMzW32jRhQW8xO7WtJ0oW4PVFYHeNsFGGI6hecHbw5mc1heVLOXnmWX+2l9qyuuYFk7rTwgcvMQq
	tdgh4NlorlB68VKEZx1g8EDcNkXxNg1Jy/e4k3Y1KhX5f6OzOvKqqhEkGJY8pRYedO0/vkI9B6jEr
	YZS615asm8l2oJm9V2gy5lz4Tc7y7MCWbISYWArtZC+q2oCf77aMhRWKb+ivvds2S6DFTF4wbyH+P
	297a4x8NqwZ0QHrQnA+13NLXIeJxsUQU3KTlHsXkm4LhH1uM8XZgK4/Y2ZGWLrn6gmxDgJqcQLyIs
	7albFRnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6v5f-00000007nM7-28BM;
	Fri, 01 Nov 2024 17:05:39 +0000
Received: from ionic.de ([2001:41d0:700:3394:1::2] helo=mail.ionic.de)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6v5b-00000007nLR-1bWF
	for ath11k@lists.infradead.org;
	Fri, 01 Nov 2024 17:05:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ionic.de; s=default;
	t=1730480729; bh=LBFXvtix+QX0jVzv0EWywfuffsmKdLD8CixdVkArwXs=;
	h=Date:From:Subject:To:From;
	b=HM677mgdWSOWDL4sGT73ydRJ7HOX8urD5V0IHbCRnHp/TBuvtmQtTFQypt3owv8+I
	 cUG+lb16lW7pTj3xccqMZl06Jz5OXtXjhinO1o9cuo8X59xjJLYFmvfzpW5G3J9X0Q
	 Pv7lwg3bx8AmG32hKkbtD57SHUCL9Z9Of1Yt068A=
Received: from [172.22.111.213] (185.102.219.38.adsl.inet-telecom.org [185.102.219.38])
	by mail.ionic.de (Postfix) with ESMTPSA id 8426C148867B
	for <ath11k@lists.infradead.org>; Fri, 01 Nov 2024 18:05:29 +0100 (CET)
Message-ID: <a8874554-e618-48e8-8092-81bc2abb743a@ionic.de>
Date: Fri, 1 Nov 2024 18:05:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Mihai Moldovan <ionic@ionic.de>
Subject: Re: State of multiple PCI(e) modules since 2022
To: ath11k@lists.infradead.org
Content-Language: en-US
Autocrypt: addr=ionic@ionic.de; keydata=
 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
 S0VlnF9z
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------4cXXyE1iqoaEisXL3NnN0zAD"
X-Bad-Reply: 'Re:' in Subject but no References or In-Reply-To headers
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_100535_948149_DFD7217B 
X-CRM114-Status: GOOD (  17.47  )
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
--------------4cXXyE1iqoaEisXL3NnN0zAD
Content-Type: multipart/mixed; boundary="------------MFRWWxSWcFdrbXHFZO6AsVbU";
 protected-headers="v1"
From: Mihai Moldovan <ionic@ionic.de>
To: ath11k@lists.infradead.org
Message-ID: <a8874554-e618-48e8-8092-81bc2abb743a@ionic.de>
Subject: Re: State of multiple PCI(e) modules since 2022

--------------MFRWWxSWcFdrbXHFZO6AsVbU
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

KiBPbiAxMC8yOS8yNCAxNzozOSwgRGVuaXMgS2VuemlvciB3cm90ZToNCj4gVGhpcyBSRkMg
bWlnaHQgYmUgb2YgaW50ZXJlc3QgdGhlbjoNCj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcv
YWxsLzIwMjQxMDE4MTgxODQyLjEzNjgzOTQtMS1kZW5rZW56QGdtYWlsLmNvbS8NCg0KV293
LCB0aGFuayB5b3UhDQoNCkkndmUgdHJpZWQgYXBwbHlpbmcgS2FsbGUncyBSRkMgdG8gYXRo
MTFrIChhbmQgbm90aWNlZCB0aGF0IGl0IGFscmVhZHkgaXMgcGFydCANCm9mIGF0aDEyayks
IGZvcmNlLWVuYWJsZWQgaXQgYW5kIG5vdGljZWQgdGhhdCBuZWl0aGVyIFFDQTYzOTAgbm9y
IFdOQzc4NTAgaG9ub3IgDQp0aGUgdmFsdWUgd3JpdHRlbiB0byB0aGUgbWFnaWMgcmVnaXN0
ZXIuIFNpbmNlIHRoZSBpbml0aWFsIGZpcm13YXJlL2Jvb3Rsb2FkZXIgDQpjYW4ndCBiZSBl
YXNpbHkgdXBkYXRlZCwgdGhhdCBhcHByb2FjaCBpc24ndCBnb2luZyB0byB3b3JrIGZvciBh
bGwgc3VwcG9ydGVkIA0KaGFyZHdhcmUuDQoNCk15IGlkZWEgd2FzIHRvIGltcGxlbWVudCBh
biBvcHRpb25hbCBwcm94eSBtb2RlIGludG8gcXJ0ciwgd2hpY2ggaWRlbnRpZmllcyANCm1l
c3NhZ2VzIGZyb20gc3BlY2lmaWMgY2FyZHMgYmFzZWQgb24gdGhlaXIgUENJIGRvbWFpbiBh
bmQgYnVzIG51bWJlciAod2hpY2ggDQpzaG91bGQgd29yayBhdCBsZWFzdCBmb3IgTUhJLCBu
byBpZGVhIGFib3V0IEFIQiksIGFuZCB1c2VzIG9uZSBzb2NrZXQgdG8gDQpjb21tdW5pY2F0
ZSB3aXRoIHRoZSBkZXZpY2UgZGlyZWN0bHksIGFuZCBhbm90aGVyIHNvY2tldCB0aGF0IGNh
biBiZSB1c2VkIGFzIGEgDQpwcm94eSBzb2NrZXQgd2hpY2ggcmVhZHMgZnJvbSB0aGUgIm5v
cm1hbCIgc29ja2V0IGFuZCBtb2RpZmllcyBtZXNzYWdlcyBiYXNlZCBvbiANCnRoZSBQQ0kg
ZGF0YSB0byByZXBsYWNlIHRoZSBpbnN0YW5jZSBJRCAoYW5kIHZpY2UgdmVyc2EgZnJvbSBk
cml2ZXIgYmFjayB0byB0aGUgDQpjYXJkL01ISSBpbnRlcmZhY2UpLg0KDQoNCllvdXIgYXBw
cm9hY2ggb2YgdXNpbmcgYXV4aWxpYXJ5IGRhdGEgbG9va3Mgd2F5IGVhc2llciwgY2xlYW5l
ciBhbmQgZ2VuZXJhbGx5IA0KYmV0dGVyIGFuZCBtb3JlIHByb21pc2luZy4NCg0KSSd2ZSBh
cHBsaWVkIHlvdXIgcGF0Y2ggc2V0IGFuZCB0cmllZCB0byByZXNvbHZlIG1vc3Qgbml0cyB0
aGF0IGNhbWUgdXAgLSANCmFsdGhvdWdoIEkndmUgbmVpdGhlciB1bmRlcnN0b29kIHdoYXQg
dG8gY2hhbmdlIHRvIHVzZSB7V1JJVEUsUkVBRH1fT05DQ0Ugb3IgDQp3aGVyZSB0byByZW1v
dmUgbG9ja2luZywgYmVjYXVzZSB0aGUgY29kZSByZWZlcnJlZCB0byAoQklORF9FTkRQT0lO
VCkgZG9lc24ndCANCmV2ZW4gdXNlIGxvY2tpbmcuIEFsdGhvdWdoIEkgZXNzZW50aWFsbHkg
dGVzdGVkIFYxLjUsIGZlZWwgZnJlZSB0byBhZGQgYSBtZSBhcyANClRlc3RlZC1CeS4gSXQn
cyBzdWNjZXNzZnVsbHkgZG9pbmcgd2hhdCBpdCBzYXlzIGl0IGRvZXMuDQoNCg0KT2J2aW91
c2x5IHRoYXQgd29uJ3Qgd29yayBvdXQgb2YgdGhlIGJveCBmb3IgYXRoMTFrLCBiZWNhdXNl
IHFtaV9oZWxwZXJzIGlzIA0Kc3RpbGwgdXNpbmcgdGhlICJvbGQiIEFQSSB0aGF0IGRvZXNu
J3QgdXNlIHNwZWNpZmljIGVuZHBvaW50IGJpbmRpbmcuIEknbSBoYXZpbmcgDQphIGhhcmQg
dGltZSBmaW5kaW5nIGEgd2F5IHRvIG1ha2UgdXNlIG9mIHRoaXMgZmVhdHVyZSBpbiBhdGgx
MWssIHRob3VnaC4gV2UncmUgDQphdCB0aGUgIndyb25nIiBzaWRlIG9mIHRoZSBzb2NrZXQg
aW4gYXRoMTFrL3FtaV9oZWxwZXJzLCBzbyBjYW4ndCBhY2Nlc3MgYW55IA0KcXJ0ciBpbnRl
cm5hbHMgdGhlcmUuIHN0cnVjdCBtaGlfZGV2aWNlIGlzIGFjY2Vzc2libGUgZnJvbSBib3Ro
IGVuZHMsIHNvIEkgY291bGQgDQp3cml0ZSB0aGUgUVJUUiBlbmRwb2ludCBpZCBpbnRvIGl0
cyBkcml2ZXIgZGF0YSwgcmVhZCBpdCBpbiBhdGgxMWsgYW5kIHBhc3MgaXQgDQpkb3duIHRv
IHFtaV9oZWxwZXJzIHRvIGJpbmQgdG8gdGhlIHNwZWNpZmljIGVuZHBvaW50LiBUaGF0IGNl
cnRhaW5seSBkb2Vzbid0IA0Kc291bmQgZWxlZ2FudCBhbmQgaXQncyBoYXJkIHRvIGFyZ3Vl
IHdoeSBRUlRSIGRhdGEgc2hvdWxkIGJlIHBhcnQgb2Ygc3RydWN0IA0KbWhpX2RldmljZSwg
YW5kIHRoZXJlIGlzIHNvbWUgcG90ZW50aWFsIGZvciBicmVha2FnZSBiZWNhdXNlIGl0IHdv
dWxkIG9ubHkgYmUgDQphdmFpbGFibGUgYWZ0ZXIgdGhlIHFydHItbWhpIGludGVyZmFjZSB3
YXMgaW5pdGlhbGl6ZWQvcHJvYmVkLCBidXQgdGhhdCdzIHRoZSANCm9ubHkgY29tbW9uIGdy
b3VuZCBJIHNlZS4NCg0KDQoNCk1paGFpDQo=

--------------MFRWWxSWcFdrbXHFZO6AsVbU--

--------------4cXXyE1iqoaEisXL3NnN0zAD
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEEbhHQj3UzgcdE8cg8H9Yu2W4lOocFAmclClgFAwAAAAAACgkQH9Yu2W4lOoew
CQ/+JQnGgcxK1hlmblJ0AFg2mF0/7TDTCm1yEnmKwifzx+hhZSiyE1VJNdt3dp+zMCH5pdneA+ip
zC2fppESswEkPUZu1r884mXogn45hisPIlERBNqC0L/r55DnMut48yE1ydeixlnrSt6OgFuazX+W
1mEh/t7QeEiw4LLGBxjatGS7/z3JbHgz5k+k0K4TC/sUYsepxX6zpwwOrctU8dkLI+mp3ErVJRsB
kQBs9FvcqX0ygQmaltLD4tAFxCgSEkH77uMnyvehQ2LmgbuXGLhwS2D/ka5pmhWKEnFQNVCn2QP1
QkCGcifgGBpxnAQL4JLT+a6Gm9C8KZFIrCXfG79EVnqjM3AzVXiprdweUR3F2GaPuqWjiSgJ9/TY
oDk0ZWpBkS67DpRu606pH9WWZwZTX1HAfLxfXuWP+sbERjtNpXumHFV6xhahTo/lWELSkAogZcQx
UFpawtexGUwxuoI4RJIpjAi18qvJi6Lrr1US/ibf8kcq1wY4AICn+rLJvsDu5sxSSn6xOpx3Pl9V
k3FtG9616iAYrPvzfJ2t8pKujUN7J6lGXLFMOga0BhUSAsJ9z6hye0YePN0Xh1Hgq4ORFBKA4kU8
6fzEbmEtlaPEV6OfVtr0lI3MyudeKej5KbhU3eRUY73/dfEFaqyid97i8NyIDFVU6riAw6GegpXG
FaA=
=lR+7
-----END PGP SIGNATURE-----

--------------4cXXyE1iqoaEisXL3NnN0zAD--

