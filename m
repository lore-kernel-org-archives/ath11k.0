Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B7EAD1CA3B
	for <ath11k@archiver.kernel.org>; Tue,  5 Nov 2024 06:52:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	From:References:To:Subject:MIME-Version:Date:Message-ID:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h0ckolleZ9oF7tcbZTiFPsl39waFTSVIImSp4IhxPoA=; b=fgbZa3zeqJD1zswOVJrYCJkKjs
	UQc94JJtlGPh4gTXSt9qvkJy7pyE6ISC2LI1CBFs23qEtk9kaF/sUZ2F2zPPzrkaNJyRPK7B1if+L
	eSIloIeT2p9PHnWmskZBjLEcNExkMv7pgZZ9bc6G+lUi2NMtZ7mZe15W1N+oGShaVjR7y1uAe8Mhw
	4D9jn0VQGRzTsAmxrNeI14XwzNhb1N8bZwpgVY2fcwXeBCcmSraNQaQpu9zQbZ1Z4N/jiou1J47A/
	bVLXGNzAiDtUeaucbznXhNV3MrakelYtswAAlCq2rIL4pcXUyBmAXRt3PALSAJ1e7/kV4m8AMkqLI
	KJIAaiOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8DQI-0000000G6lh-0Lmy;
	Tue, 05 Nov 2024 06:52:18 +0000
Received: from ionic.de ([145.239.234.145] helo=mail.ionic.de)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8DQF-0000000G6kN-1w7d
	for ath11k@lists.infradead.org;
	Tue, 05 Nov 2024 06:52:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ionic.de; s=default;
	t=1730789529; bh=h0ckolleZ9oF7tcbZTiFPsl39waFTSVIImSp4IhxPoA=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=rCPbh0lReaC6J1Kn4MeXtXH3rNc+ohV05uElA4iFkvVHS60CrVffnv8GkgSZQT+2i
	 UhJ1gukfETT3PK0NybudSEH0o6AeVfZXYQLrXS1W9MEBdtBJoEcxZcc99+DcP1Z/8r
	 UxOCKABBVBUAeFZp5r97Pvk4HGxUASHz4kdI0w2s=
Received: from [172.22.111.213] (185.102.219.38.adsl.inet-telecom.org [185.102.219.38])
	by mail.ionic.de (Postfix) with ESMTPSA id A13D11480CC6;
	Tue, 05 Nov 2024 07:52:09 +0100 (CET)
Message-ID: <cc6d59b4-27ec-4362-b7be-8cc1632cad50@ionic.de>
Date: Tue, 5 Nov 2024 07:52:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: State of multiple PCI(e) modules since 2022
To: Jeff Johnson <quic_jjohnson@quicinc.com>, ath11k@lists.infradead.org
References: <588735d6-d30d-4d9c-ba43-6a10d85786d8@ionic.de>
 <ceaab3b3-6537-4ea4-bc66-1ee8c48da16a@quicinc.com>
Content-Language: en-US
From: Mihai Moldovan <ionic@ionic.de>
Autocrypt: addr=ionic@ionic.de; keydata=
 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
 S0VlnF9z
In-Reply-To: <ceaab3b3-6537-4ea4-bc66-1ee8c48da16a@quicinc.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------BkgNN24mnm1l2ol1slKTW0Mj"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_225215_999445_B6C3EDAF 
X-CRM114-Status: UNSURE (   8.70  )
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
--------------BkgNN24mnm1l2ol1slKTW0Mj
Content-Type: multipart/mixed; boundary="------------VBs74s0aDWfIqSDIL3p1FeAo";
 protected-headers="v1"
From: Mihai Moldovan <ionic@ionic.de>
To: Jeff Johnson <quic_jjohnson@quicinc.com>, ath11k@lists.infradead.org
Message-ID: <cc6d59b4-27ec-4362-b7be-8cc1632cad50@ionic.de>
Subject: Re: State of multiple PCI(e) modules since 2022
References: <588735d6-d30d-4d9c-ba43-6a10d85786d8@ionic.de>
 <ceaab3b3-6537-4ea4-bc66-1ee8c48da16a@quicinc.com>
In-Reply-To: <ceaab3b3-6537-4ea4-bc66-1ee8c48da16a@quicinc.com>

--------------VBs74s0aDWfIqSDIL3p1FeAo
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

KiBPbiAxMC8zMS8yNCAxNTo0OSwgSmVmZiBKb2huc29uIHdyb3RlOg0KPiBLYWxsZSAmIEkg
c3ltcGF0aGl6ZSB3aXRoIHlvdS4gSSd2ZSBlc2NhbGF0ZWQgdGhpcyB0byBteSBtYW5hZ2Vt
ZW50Lg0KDQpUaGFuayB5b3UsIHRoYXQncyBzZXJpb3VzbHkgbXVjaCBhcHByZWNpYXRlZC4N
Cg0KQnV0IGFsc28sIEknbSBub3QganVzdCBoZXJlIHRvIGNvbXBsYWluLg0KDQoNCkJhc2Vk
IG9uIERlbmlzJ3Mgd29yaywgYW5kIG9uIHRoZSBhdGgtMjAyNDExMDQxNTQzIHRhZywgSSd2
ZSBtb2RpZmllZCBhdGgxMWsgYW5kIA0KYXRoMTJrIHRvIG1ha2UgdXNlIG9mIHRoZSBuZXcg
ZW5kcG9pbnQgSUQgYmluZGluZyBmZWF0dXJlIGFuZCBmaW5hbGx5IGdvdCBhbiANCmF0aDEx
ayBhbmQgYXRoMTJrIGNhcmQgd29ya2luZyBhdCB0aGUgc2FtZSB0aW1lIChJJ20gdG9vIGxh
enkgdG8gcHV0IHR3byANCmF0aDExay1iYXNlZCBjYXJkcyBpbnRvIHRoZSBtYWNoaW5lIHRv
IHRlc3Qgd2hldGhlciB0aGlzIGFsc28gd29ya3MgZm9yIG5vdyk6DQoNCg0KNTogd2xwM3Mw
OiA8Tk8tQ0FSUklFUixCUk9BRENBU1QsTVVMVElDQVNULFVQPiBtdHUgMTUwMCBxZGlzYyBu
b3F1ZXVlIHN0YXRlIERPV04gDQptb2RlIERPUk1BTlQgZ3JvdXAgZGVmYXVsdCBxbGVuIDEw
MDANCiAgICAgbGluay9ldGhlciA2NjphMzo2OTplOTo3MTo0OSBicmQgZmY6ZmY6ZmY6ZmY6
ZmY6ZmYgcGVybWFkZHIgMjA6NTc6OWU6MmQ6MDQ6MWUNCjY6IHdscDFzMDogPEJST0FEQ0FT
VCxNVUxUSUNBU1Q+IG10dSAxNTAwIHFkaXNjIG5vb3Agc3RhdGUgRE9XTiBtb2RlIERFRkFV
TFQgDQpncm91cCBkZWZhdWx0IHFsZW4gMTAwMA0KICAgICBsaW5rL2V0aGVyIDc4OjQ2OjVj
OjNiOmFiOmE3IGJyZCBmZjpmZjpmZjpmZjpmZjpmZg0KDQoNCkhvd2V2ZXIsIEknbSBub3Qg
YXQgYWxsIGhhcHB5IHdpdGggdGhlIHNvbHV0aW9uIGFuZCBkb24ndCBldmVuIGNvbnNpZGVy
IGl0IGFuIA0KUkZDIGR1ZSB0byB0aGUgd2F5IGl0IGludGVncmF0ZXMuIEknbGwgc3RpbGwg
c2hhcmUgdGhlIHBhdGNoIHNldCBmb3IgcmVmZXJlbmNlLg0KDQoNCg0KTWloYWkNCg==

--------------VBs74s0aDWfIqSDIL3p1FeAo--

--------------BkgNN24mnm1l2ol1slKTW0Mj
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEEbhHQj3UzgcdE8cg8H9Yu2W4lOocFAmcpwJgFAwAAAAAACgkQH9Yu2W4lOoeH
cBAAysWWU6bnhz3O0BQIQHCYPK6t+vR3ZsOxyRF22yWcKWoq9UCPGaoRsVeboh/CMFtDvVaP+3AM
qQVDZyacVo2v6FoKjZPzhMM54zuPQCbIwGSAe790uU31PsC1378Lp2tKyPn5NbKd1Gcx3g5rn7+6
dBGPykerfLcoMaKbf+cbtIGJTr5Sb9tygF3C8skI2zAI4Lkk9/97HzfPRVDWc0fKxMzVX/nVxxFt
Mq2BXZD1VETQsg4pbMBdc75TNoDrjtf/wlon22iuUwQvXTXPVD0NNq5xlT19d1w72wBhyTZGWGeE
LkU7/epC8BR0DzDkmvM6Uaxt5A11ajJzSY01mrPNJJ3eE+kBgQ2RjlJyuzhLZlJ8SGxsJ7MfmPMg
ke6sbc3MgcGTSd/EWFJn+kPpNwtfExHJHazEgszDdWoEYfgiiiVBuBXPdU/4SKg6GJszh93adrKP
Uen1eyfKinMwClH417vwQiroX75WwjyvWwN0VHyiG/wupgjrraoP0Em4qGNK/+uqXycs631SJNkN
PhDN6smsinAadRp0xdqSXwupprRXNJILRrUw76upEeGXTcKLRhyRcUAdr+AA/92+TA8MQ+X3MoG6
A+cGCZ9FwezKFAvYSyaf6VwSlvSVjXwLmAmorl8Egcw9Hr0xHaslzf5k4oGCBc33fMPcSYuMxN5E
Q60=
=BnM2
-----END PGP SIGNATURE-----

--------------BkgNN24mnm1l2ol1slKTW0Mj--

