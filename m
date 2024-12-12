Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBFA2E7717F
	for <ath11k@archiver.kernel.org>; Thu, 12 Dec 2024 06:35:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	From:References:To:Subject:MIME-Version:Date:Message-ID:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n1G3vuoy7tNVTEz+v9qQSvSEkW+b4VR/HN7rUd/bfVE=; b=0Jbbu6oUFOWMhb5XNGBazJEVJs
	fxezU1kCUuZHgbCQwonhAYDmOOcRPWbLZdw5IeSge28qbogCdC43SVZyJ28qqupL/RIYsrpFsQ1jj
	OL2mw6xxGYo9sQqYyYwr+9nlZxphMu9aLIIC5iIPaaUWRu9jzuukmNu3uu7iHG36/5+X5fyYjkHcb
	EAc6A2G4Ngeyp6aN5EnuI5gJmEIxHq9tcrQxEH0rb7nA4Av8oG+Ll14oIvRXfB6YsJdVT4thDvYbD
	ieMeAFe8R6bjlVIo8I49wmA7bc0/roM9M/c5N05r1lJvHFirorvwlh8kOV6SQCsVDxBlkxIVr8cNq
	qBbPabMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLcn6-0000000H3kI-1rPa;
	Thu, 12 Dec 2024 06:35:16 +0000
Received: from ionic.de ([2001:41d0:700:3394:1::2] helo=mail.ionic.de)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLcn3-0000000H3jV-2i55
	for ath11k@lists.infradead.org;
	Thu, 12 Dec 2024 06:35:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ionic.de; s=default;
	t=1733985308; bh=n1G3vuoy7tNVTEz+v9qQSvSEkW+b4VR/HN7rUd/bfVE=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=A8qwgqHvfAWXdCIcdzF9dpksqpQAevHTfV73HUU1JHsV1W5EpI7O7u58HJ/I8RNAB
	 giueXtXO6T3Y0dYSqA8SxqXL4d+qPb40MGQ64UEckh7RCQUrPtC+Q3QL6+0KhWegkV
	 0gObupji5yaswPaqyUIj9h5y9m49i2gosI2uwKVw=
Received: from [172.22.111.213] (185.102.219.38.adsl.inet-telecom.org [185.102.219.38])
	by mail.ionic.de (Postfix) with ESMTPSA id B61081480CE0;
	Thu, 12 Dec 2024 07:35:08 +0100 (CET)
Message-ID: <c0fc2c17-2836-43c1-b888-459b8e71b6c0@ionic.de>
Date: Thu, 12 Dec 2024 07:35:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: ath11k for QCA6391
To: wang chaozheng <ultwcz1997@outlook.com>,
 "ath11k@lists.infradead.org" <ath11k@lists.infradead.org>
References: <12ce6ea00fd34e919527021ab17da92cOSZPR01MB6597F2FD7B51B0E5E8BEA5DBD93F2@OSZPR01MB6597.jpnprd01.prod.outlook.com>
Content-Language: en-US
From: Mihai Moldovan <ionic@ionic.de>
Autocrypt: addr=ionic@ionic.de; keydata=
 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
 S0VlnF9z
In-Reply-To: <12ce6ea00fd34e919527021ab17da92cOSZPR01MB6597F2FD7B51B0E5E8BEA5DBD93F2@OSZPR01MB6597.jpnprd01.prod.outlook.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------Mksffof45FCogvjAhJ30nQpF"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_223514_180012_77A85549 
X-CRM114-Status: UNSURE (   7.04  )
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
--------------Mksffof45FCogvjAhJ30nQpF
Content-Type: multipart/mixed; boundary="------------pdHJCoFQgg7HDLOFXdW1wB0i";
 protected-headers="v1"
From: Mihai Moldovan <ionic@ionic.de>
To: wang chaozheng <ultwcz1997@outlook.com>,
 "ath11k@lists.infradead.org" <ath11k@lists.infradead.org>
Message-ID: <c0fc2c17-2836-43c1-b888-459b8e71b6c0@ionic.de>
Subject: Re: ath11k for QCA6391
References: <12ce6ea00fd34e919527021ab17da92cOSZPR01MB6597F2FD7B51B0E5E8BEA5DBD93F2@OSZPR01MB6597.jpnprd01.prod.outlook.com>
In-Reply-To: <12ce6ea00fd34e919527021ab17da92cOSZPR01MB6597F2FD7B51B0E5E8BEA5DBD93F2@OSZPR01MB6597.jpnprd01.prod.outlook.com>

--------------pdHJCoFQgg7HDLOFXdW1wB0i
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

KiBPbiAxMi8xMi8yNCAwNDo1MSwgd2FuZyBjaGFvemhlbmcgd3JvdGU6DQo+IEJUVywgb3Ro
ZXIgaW5mb3JtYXRpb24NCj4gJCB1bmFtZSAtcg0KPiA1LjEwLjEwNA0KDQpZb3VyIGtlcm5l
bCBpcyB2ZXJ5IG9sZC4gV2hpbGUgYmVpbmcgTFRTIGFuZCBzaGlwcGluZyBhIGxvdCBvZiBi
YWNrcG9ydHMsIHRoYXQgDQp0eXBpY2FsbHkgaXMgbm90IHRoZSBjYXNlIGZvciBuZXcgZmVh
dHVyZXMuIEFkZGl0aW9uYWxseSwgZXZlbiBmb3IgTFRTIA0Kc3RhbmRhcmRzLCB0aGlzIHZl
cnNpb24gaXMgYW50aXF1ZSAoYy5mLjogY3VycmVudCB2ZXJzaW9uIG9mIHRoZSA1LjEwIGxp
bmUgaXMgDQo1LjEwLjIzMCkuDQoNClFDQTYzOTEgc3VwcG9ydCByZWFsbHkgY2FtZSB3aXRo
IDUuMTUgb3Igc29tZXRoaW5nIGFsb25nIHRob3NlIGxpbmVzLg0KDQoNCkRvIHlvdXJzZWxm
IGEgZmF2b3IgYW5kIHJldGVzdCB3aXRoIHRoZSBtYWlubGluZSBrZXJuZWwgdmVyc2lvbiwg
cGxlYXNlLg0KDQoNCg0KTWloYWkNCg==

--------------pdHJCoFQgg7HDLOFXdW1wB0i--

--------------Mksffof45FCogvjAhJ30nQpF
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEEbhHQj3UzgcdE8cg8H9Yu2W4lOocFAmdahBsFAwAAAAAACgkQH9Yu2W4lOoc2
+A//ayjNeYVrUldTQi3k9XhTR+2951iV8fmEe1DRU2KpbtYuVB6hzQbyrLAj7DZoUCV0SwBZelSx
fg+n4Sf6G6DNBzHC7oL2sg+SAYz4SplQyss2NBxuJPL7XkvSdavk3V5l0XvVmpxtH2OcoxkUmcnj
TOEJsYi81uoeG8SD/rZ7SaNkyvjxXcJps/Du5Q6ezNOS8/4jahgZnZnQ5trgC84rr4vn/DaFebBz
jAvie40eIssE+KbYrLPcEQlDVUbWMDCcG4Qb7B4DbJANSBC4eyvJlkYGHt5nwrBlpDVFsAqqHOau
9GGX4LsVEU7TN9JW43xJBG6lIqEGSWdiTXfAkSm3k/LMRMB7oYLGL1qzauilMjpmLhn6RAb6mUCe
K1nOETrvrQ1ubdC3OypU1LToPAfpwG1eRgXlcFTW/PXVPF8JwE9rrpykBdKX1RZib3Cg+thwG+Pz
i8OHr/w4sNkVS3bFUtrgk6MqUKZXtENaMNKJdYmUXr+WrvxIKcyk4b6bXbRYNzEbQwjDNX3pHu6S
tmqpLPhn4gEf7/pGlXzdrUk1RjxFk+eP/+pAjzBRf0KOzpr5UpXnJIQ9Fz1W/844nODlgp3aeh6f
C24fBhpyFq03w0uLlvxxKCpeF8N/avZttq1qWxLj6NE+GXIrOicQFFfM9IUTEY7aQC/NWLfWB7pu
iRw=
=dZW/
-----END PGP SIGNATURE-----

--------------Mksffof45FCogvjAhJ30nQpF--

