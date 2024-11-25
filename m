Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAA58D3B7DB
	for <ath11k@archiver.kernel.org>; Mon, 25 Nov 2024 05:34:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	From:References:To:Subject:MIME-Version:Date:Message-ID:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TmnaknKa6IZNpSVZkLsvxAuaKlw5GH8aakL9lyPv3lw=; b=sq5fCsGKzzgdrtHXDOeqiEqVgo
	mzm61+8I3azjWk8KKnA6c+pCRpnIgXZzg0rm0LrMMft3EMq0tcYByIS6VE2cDCrfPocTozFhpiiAE
	jwZ3l0OiWi65UgySlHDQd8kXGxzET7NgLqPAq+Tv7NpOomrmdvS19vblIpcTWwQ93XY/EJTTHPfw0
	CLwsOkj7MXKq2SiSIk56QWdfyITlQHN0SlWRMPp4O8Pm8PitGDop9aZyrQ7Kf3i9GOJLnz/2B2dJX
	E/0Kug+bCYc4OrFsViws7Kz6Xs9FUPFka8dGEAwTNnDOSnpTtIq57YBxXqLL2LEYo5OVxVOfO0NG+
	skVvOcWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFRjZ-000000076VK-1FGi;
	Mon, 25 Nov 2024 05:34:05 +0000
Received: from ionic.de ([145.239.234.145] helo=mail.ionic.de)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFRjW-000000076Ua-18MQ
	for ath11k@lists.infradead.org;
	Mon, 25 Nov 2024 05:34:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ionic.de; s=default;
	t=1732512839; bh=TmnaknKa6IZNpSVZkLsvxAuaKlw5GH8aakL9lyPv3lw=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=MYVbvynMXMgyxLYvlP7I64UpyLDqNdTQ7gjkw6cbXsWuAeOL7v1umuYtgfNI+x3YV
	 S47OP4iXJzND1s3qP43Zg8gaJQxKfCB57LKvgby1ICafoj0g4S47d9OnBaXFVduYk7
	 tsx3DIeXEDCOQSeecHvY7n4xE9WBKEws6Q6KsLI0=
Received: from [172.22.111.213] (185.102.219.38.adsl.inet-telecom.org [185.102.219.38])
	by mail.ionic.de (Postfix) with ESMTPSA id 16D751487357
	for <ath11k@lists.infradead.org>; Mon, 25 Nov 2024 06:33:59 +0100 (CET)
Message-ID: <ff487372-2200-4100-af8f-108bf2fcb80c@ionic.de>
Date: Mon, 25 Nov 2024 06:33:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath11k: Fix NULL pointer check in
 ath11k_ce_rx_post_pipe()
To: ath11k@lists.infradead.org
References: <20241125050821.149898-1-zghbqbc@gmail.com>
Content-Language: en-US
From: Mihai Moldovan <ionic@ionic.de>
Autocrypt: addr=ionic@ionic.de; keydata=
 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
 S0VlnF9z
In-Reply-To: <20241125050821.149898-1-zghbqbc@gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------PGMxTUvo0zMCelcMhdbem4sF"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241124_213402_481277_96E74499 
X-CRM114-Status: UNSURE (   8.07  )
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
--------------PGMxTUvo0zMCelcMhdbem4sF
Content-Type: multipart/mixed; boundary="------------iAdjnOX1RXwBj8NM03smPxR0";
 protected-headers="v1"
From: Mihai Moldovan <ionic@ionic.de>
To: ath11k@lists.infradead.org
Message-ID: <ff487372-2200-4100-af8f-108bf2fcb80c@ionic.de>
Subject: Re: [PATCH] wifi: ath11k: Fix NULL pointer check in
 ath11k_ce_rx_post_pipe()
References: <20241125050821.149898-1-zghbqbc@gmail.com>
In-Reply-To: <20241125050821.149898-1-zghbqbc@gmail.com>

--------------iAdjnOX1RXwBj8NM03smPxR0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

KiBPbiAxMS8yNS8yNCAwNjowOCwgQmFpY2h1YW4gUWkgd3JvdGU6DQo+IC0JaWYgKCEocGlw
ZS0+ZGVzdF9yaW5nIHx8IHBpcGUtPnN0YXR1c19yaW5nKSkNCj4gKwlpZiAoIShwaXBlLT5k
ZXN0X3JpbmcgJiYgcGlwZS0+c3RhdHVzX3JpbmcpKQ0KPiAgIAkJcmV0dXJuIDA7DQoNCldv
dWxkbid0IHRoZSBleHBhbmRlZCBmb3JtLCBpLmUuLCBpZiAoIXBpcGUtPmRlc3RfcmluZyB8
fCAhcGlwZS0+c3RhdHVzX3JpbmcpIA0Kc2hvdyB0aGUgaW50ZW50aW9uIG1vcmUgY2xlYXJs
eSAocmV0dXJuIGlmIGFueSBvZiB0aGVzZSBwb2ludGVycyBpcyBOVUxMKSBhbmQgDQphdm9p
ZCB0aGUgd2hvbGUgY29uZnVzaW9uIGluIHRoZSBmaXJzdCBwbGFjZT8NCg0KV2UgYWxsIGtu
b3cgdGhhdCAhKGEgJiYgYikgfj0gIWEgfHwgIWIsIHNvIHlvdXIgZXhwcmVzc2lvbiBpcyBv
YnZpb3VzbHkgDQpmdW5jdGlvbmFsbHkgZXF1aXZhbGVudCwgYnV0IGl0J3Mgbm90IGV4YWN0
bHkgb2J2aW91cyBhdCBmaXJzdCBnbGFuY2UuDQoNCg0KDQpNaWhhaQ0K

--------------iAdjnOX1RXwBj8NM03smPxR0--

--------------PGMxTUvo0zMCelcMhdbem4sF
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEEbhHQj3UzgcdE8cg8H9Yu2W4lOocFAmdEDEYFAwAAAAAACgkQH9Yu2W4lOocp
4w/9EYyMYGW5hyYEfKHwVJc3JOLcXkDKDSRxydraqiHJYWp85Cw5yd6B0JYObicPvy3PzlRPeuHX
GDqbY3ofDDn7144Qgc+G5mSsSEalUr76xLJ8GT5Iqjp4wgAxcSl3SjJObxCK2W2i0YP34/3zv59p
xQPlyVS/ed4pF14e+vopdgy5LNWj/yZJzo3C1nquO4SK2p+54gtz07cHRKgc7s1xk64wxOJWCPQ5
cpoHXbdvKlxNhQoXqH2pVGvDqfyFI++YBfN0rpOgv/UKQhLAB4Uwfcg5KN/Eh2jOzxhsJha2i6ow
4sDjxXyjkcph/1BlSIDMetp3qHi5DtS7IegCEdpQR8+58yj2oDDesR96LFClfh8lyJD0cuLTZHy/
2PSKqJLFR3Gl/HF6fowUDivM9bCrF/lvAG0BaiqCaVBLR6jwTAIGGTpj7HzVCYZiuoakzbzpJJQF
AsaA45PDoNrLdUbfHoaqwhZJ2m11iKqvCWeD+VPg1chyRwPpdkI4O0WEsdBbOQUyZZKboV1V2Zd3
sZldBcNzIABg5wUE19l79BmTFjodUVYcdzYkY7O7Ud5iVXYJrGoqYJHBFnz3ztrn3t9tDCVVMq77
yZN3j5O9dNBGtyQvcQno9JTmv4aY9JXmRt+4u47wucPH1w73NiEjc73Ud9otmNkr3mBmn3g96nug
L28=
=cpnC
-----END PGP SIGNATURE-----

--------------PGMxTUvo0zMCelcMhdbem4sF--

