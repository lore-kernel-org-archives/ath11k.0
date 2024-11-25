Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A970CD59D7E
	for <ath11k@archiver.kernel.org>; Mon, 25 Nov 2024 22:23:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MEDMnZ8MjOKHcO7f/p0ezcS7KWhPZgsys9mcSJsVG8Y=; b=afB4nzhKvWYJYaOBM+9K8Vmioc
	AWfEPsnWBSt5mdEqnfeqhEiRQsdX+fEN4YmUuSI9zl/066UjXd77pqJgmyWslqKHsRbmfNeC3QiPs
	skW9wTXdB+6/AD1P3rk9sscb6xoCNjYPokdovF+/pn6kwcsKfTRjho44fIoxvHoz5wrAxU6Jzd/qY
	XnVrlmQB11STR/mmSnQcXTIVIvX2uFBp8XF8Q8LUmdapxTlqr3erWkyxQ1zRm7ThmmRSoWHKBfW1e
	kbM+yVub6MjzcTBDDlPjY+SPmKmGI3bZZbsLoExgv2h/baoRO9a6kOscKFC+c2VXOsnCKCGcTxtk3
	YZn+8MHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFhUA-00000009CVw-1BDA;
	Mon, 25 Nov 2024 22:23:14 +0000
Received: from ionic.de ([2001:41d0:700:3394:1::2] helo=mail.ionic.de)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFhU8-00000009CVX-09HM
	for ath11k@lists.infradead.org;
	Mon, 25 Nov 2024 22:23:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ionic.de; s=default;
	t=1732573388; bh=MEDMnZ8MjOKHcO7f/p0ezcS7KWhPZgsys9mcSJsVG8Y=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=JDtv/DvYqTI9RB+nqCeVjvqfe7GFOQzNTFL4+K64wIjxDAhvrzEfWNGLzQh81h0vr
	 DsRivxuCjqMYga9LiBRozGCkEKpe5aceseq+W62jzIfBsXdPLM5AXbVBpNtAcB2ExT
	 rY84a30t66ZFK9wzsORZTJWFoASX2h9+87B8MjLk=
Received: from [172.22.111.213] (185.102.219.38.adsl.inet-telecom.org [185.102.219.38])
	by mail.ionic.de (Postfix) with ESMTPSA id B54D41480B8A;
	Mon, 25 Nov 2024 23:23:08 +0100 (CET)
Message-ID: <9a166195-bd05-4c83-9b03-91101e7c4baf@ionic.de>
Date: Mon, 25 Nov 2024 23:23:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath11k: Fix NULL pointer check in
 ath11k_ce_rx_post_pipe()
To: Baichuan Qi <zghbqbc@gmail.com>
Cc: ath11k@lists.infradead.org
References: <ff487372-2200-4100-af8f-108bf2fcb80c@ionic.de>
 <20241125073746.260605-1-zghbqbc@gmail.com>
Content-Language: en-US
From: Mihai Moldovan <ionic@ionic.de>
Autocrypt: addr=ionic@ionic.de; keydata=
 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
 S0VlnF9z
In-Reply-To: <20241125073746.260605-1-zghbqbc@gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------cdC1xi63kfCHcgC5tB0EZBbb"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241125_142312_252618_0A7FDF2B 
X-CRM114-Status: UNSURE (   8.93  )
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
--------------cdC1xi63kfCHcgC5tB0EZBbb
Content-Type: multipart/mixed; boundary="------------YWlT9fMlE1rmDA0Ex3hjXg5c";
 protected-headers="v1"
From: Mihai Moldovan <ionic@ionic.de>
To: Baichuan Qi <zghbqbc@gmail.com>
Cc: ath11k@lists.infradead.org
Message-ID: <9a166195-bd05-4c83-9b03-91101e7c4baf@ionic.de>
Subject: Re: [PATCH] wifi: ath11k: Fix NULL pointer check in
 ath11k_ce_rx_post_pipe()
References: <ff487372-2200-4100-af8f-108bf2fcb80c@ionic.de>
 <20241125073746.260605-1-zghbqbc@gmail.com>
In-Reply-To: <20241125073746.260605-1-zghbqbc@gmail.com>

--------------YWlT9fMlE1rmDA0Ex3hjXg5c
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

KiBPbiAxMS8yNS8yNCAwODozNywgQmFpY2h1YW4gUWkgd3JvdGU6DQo+IHRoYW5rcyBmb3Ig
eW91ciByZXBseQ0KPiANCj4+ICEocGlwZS0+ZGVzdF9yaW5nICYmIHBpcGUtPnN0YXR1c19y
aW5nKQ0KPiBtZWFucyBib3RoIHBpcGUtPmRlc3RfcmluZyBhbmQgcGlwZS0+c3RhdHVzX3Jp
bmcgbXVzdA0KPiBiZSBOT04tTlVMTCAsIHByZXZpb3VzIGNvZGUgbWVhbnMgT05FIG9mIHRo
ZXNlIHR3byByaW5ncw0KPiBpcyBOT04tTlVMTC4NCg0KWWVzLCBJIHVuZGVyc3RhbmQgdGhh
dCwgYW5kIEkgYWxyZWFkeSBpbXBsaWVkIHRoYXQgeW91ciBmaXggaXMgZmluZSANCmZ1bmN0
aW9uYWxseS4gSSBjYW4gYWxzbyBzcGVsbCBpdCBvdXQgbW9yZSBkaXJlY3RseS4NCg0KSG93
ZXZlciwgSSBkbyBiZWxpZXZlIHRoYXQgIXBpcGUtPmRlc3RfcmluZyB8fCAhcGlwZS0+c3Rh
dHVzX3JpbmcgLSB3aGljaCBpcyANCmZ1bmN0aW9uYWxseSBlcXVpdmFsZW50IHRvICEocGlw
ZS0+ZGVzdF9yaW5nICYmIHBpcGUtPnN0YXR1c19yaW5nKSAtIGlzIG1vcmUgDQptYWludGFp
bmFibGUgYW5kIGVhc2llciB0byBwYXJzZSBmb3IgaHVtYW5zIGJlY2F1c2UgaXQgY29udmV5
cyB3aGF0IGlzIG1lYW50IA0KYmV0dGVyIGF0IGEgZ2xhbmNlIC0gbmFtZWx5IHRoYXQgd2Ug
d2FudCB0byBoYW5kbGUgdGhlIHNpdHVhdGlvbiBhcyBhbiBlcnJvciBpZiANCmFueSBvZiB0
aGUgZ2l2ZW4gcG9pbnRlcnMgaXMgTlVMTC4NCg0KDQoNCk1paGFpDQo=

--------------YWlT9fMlE1rmDA0Ex3hjXg5c--

--------------cdC1xi63kfCHcgC5tB0EZBbb
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEEbhHQj3UzgcdE8cg8H9Yu2W4lOocFAmdE+MsFAwAAAAAACgkQH9Yu2W4lOodV
ChAAxWC+/8uQsKq6/0E+2F1NP+qD5Rdo291MA/iuBfFAi3K5CJEyf/+Ik0R7Dy5vWnTvdnZ19kpx
K3bAydlAyG3e7fPDBTWuYwAuS7iDIHUS5iz8LnLIxZd26hfdIewAIHSuIbncC886DK2EHHa1Vx3J
eFl6O4D1QEBJ2hB6QwK9rZbCcO0e4DF6Y+3RjVeqATlzOCMEVyHFm+vMGtMc0YxjewGFGc9j2Wgh
UwS/h2ns73jbvePdj4Rfrcgflv+ZiyGswN52Jwq5GM3Lq0AtjLwBdAROGO4BDuw/TEt0lFtGXG/X
6pGrV5vz3bOQSjdTyemNcSEb+1bH1et1vIn24iaqbi+xhEZ+i2ih8/DtwSz4r5n8/cm/97j1YMaZ
sx8DI8d4d1/SD8cRYFJRqKutgEFcPsGlFRHCrHwv7dh2pDPzNK4d+jMbIAz0AI3Be6m0PTFR1j6C
4KWC+2BFcWewmzzfCZzxdpOcY53Vf6qRg9uaOYs/gaqHKj9/yLHpUaq/p0NmesweNDb0H25+AlRe
h5PDSPbsvZspR/AIwd4tSCjZT47oe92d1MKZt2D4vJZtfx1SCvV1G8ftyxo1WzsaP634+rSrXKFe
NeMtbRCm8iOAeFg5mxYtfgYyk5ZuqwkD4Npr5C/vAby0lUEbDRErZEzhNXrjtOD+MfUaPgHa92qK
24A=
=Deh6
-----END PGP SIGNATURE-----

--------------cdC1xi63kfCHcgC5tB0EZBbb--

