Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52BDBD5A6DF
	for <ath11k@archiver.kernel.org>; Tue, 26 Nov 2024 06:10:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	From:References:To:Subject:MIME-Version:Date:Message-ID:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UopkJJmIQN/sDWdPV9W74xeIoYiTzN5Q2uxUnD/Qj4M=; b=X6FAM8hifYqc5/yk2IDop5L7VY
	xAI80S8sd5ZcwLT4b6mYg+8UfhcRgZKcd17cxsSjd8fBlM7YYmZ1/ghfXLjmfDBiZKjF1Ckl67FFj
	lE/ED1js2ZS0cezIrWwaIs8cv7rNk7EZQAkOmPwJ5yE+coURlznGh2DIB/S1s/dXl+ixO60V7tHkL
	AFWoM0ksG/m9uHwct/prNBrTjYPShq1HuHbwBveoWQupiZkf9gNnTkFrnndLFhl3OkRFq4UFIGcRu
	cOzFTUzZ6tZxvFMbXuodfMKNcSRnktQjShoJmWL5gDTp3aF91ISVyZ+bFZij+kCEHN1CUao4gMIEY
	PIlTDkVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFolx-00000009jT6-1chv;
	Tue, 26 Nov 2024 06:10:05 +0000
Received: from ionic.de ([145.239.234.145] helo=mail.ionic.de)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFolu-00000009jSJ-1bMz
	for ath11k@lists.infradead.org;
	Tue, 26 Nov 2024 06:10:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ionic.de; s=default;
	t=1732601397; bh=UopkJJmIQN/sDWdPV9W74xeIoYiTzN5Q2uxUnD/Qj4M=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=kM4iNvHNFAxOPFyp9BEiTbkq9SU1InV8IYwVeyO49uV8e+M7XbNMrvFNgJprdhOq4
	 J1uoBwplGyHEm6aOqNM30fuv5Xc8TRF0eBiEWW6zXbiAh1P0yI32JzKsCN98S96+3D
	 a1DOnGobuRxT7uxfd2sR8Z0bYrOFB6SwgaUYxr3A=
Received: from [172.22.111.213] (185.102.219.38.adsl.inet-telecom.org [185.102.219.38])
	by mail.ionic.de (Postfix) with ESMTPSA id 39D9B1480CDE
	for <ath11k@lists.infradead.org>; Tue, 26 Nov 2024 07:09:57 +0100 (CET)
Message-ID: <90c806db-9d75-4c25-88f5-252da80b5d40@ionic.de>
Date: Tue, 26 Nov 2024 07:09:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] wifi: ath11k: support DBS and DFS compatibility
To: ath11k@lists.infradead.org
References: <20241125100508.3458594-1-quic_yuzha@quicinc.com>
Content-Language: en-US
From: Mihai Moldovan <ionic@ionic.de>
Autocrypt: addr=ionic@ionic.de; keydata=
 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
 S0VlnF9z
In-Reply-To: <20241125100508.3458594-1-quic_yuzha@quicinc.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------OjpeL0Ch5J7NC1IF3J4dvxLH"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241125_221002_925461_B63D9DDA 
X-CRM114-Status: UNSURE (   8.92  )
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
--------------OjpeL0Ch5J7NC1IF3J4dvxLH
Content-Type: multipart/mixed; boundary="------------nh6QtHM1Hq049VOCj5aQhoJD";
 protected-headers="v1"
From: Mihai Moldovan <ionic@ionic.de>
To: ath11k@lists.infradead.org
Message-ID: <90c806db-9d75-4c25-88f5-252da80b5d40@ionic.de>
Subject: Re: [PATCH v2] wifi: ath11k: support DBS and DFS compatibility
References: <20241125100508.3458594-1-quic_yuzha@quicinc.com>
In-Reply-To: <20241125100508.3458594-1-quic_yuzha@quicinc.com>

--------------nh6QtHM1Hq049VOCj5aQhoJD
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

KiBPbiAxMS8yNS8yNCAxMTowNSwgWXUgWmhhbmcoWXVyaXkpIHdyb3RlOg0KPiBBZGQgYSBp
ZWVlODAyMTFfaWZhY2VfY29tYmluYXRpb24gdG8gc3VwcG9ydCBEQlMgYW5kIERGUyBjb21w
YXRpYmlsaXR5LA0KPiBvbmUgY29tYmluYXRpb24gY2FuIHN1cHBvcnQgREZTKHNhbWUgd2l0
aCBub24gZHVhbCBzdGEpLCBhbm90aGVyDQo+IGNvbWJpbmF0aW9uIGNhbiBzdXBwb3J0IERC
Uy4gV2hlbiBydW5uaW5nIGRpZmZlcmVudCBzY2VuYXJpb3MgdGhhdCB3aWxsDQo+IHVzZSBk
aWZmZXJlbnQgaWVlZTgwMjExX2lmYWNlX2NvbWJpbmF0aW9uIGR1ZSB0byBtYWM4MDIxMSB3
aWxsIGdvIHRocm91Z2gNCj4gYWxsIG9mIHBvc3NpYmxlIGludGVyZmFjZSBjb21iaW5hdGlv
bnMuDQoNCkFyZSBERlMgYW5kIERCUyBtdXR1YWxseSBleGNsdXNpdmUgZmVhdHVyZXM/IEkg
Y2FuIGltYWdpbmUgdGhhdCBJU00gY2xhc2hlcyB3aXRoIA0KREJTLCBidXQgd29uZGVyIGlm
IHRoaXMgaXMgYSBoYXJkd2FyZSBsaW1pdGF0aW9uLCBhIGZpcm13YXJlIGxpbWl0YXRpb24g
b3IgDQptZXJlbHkgYW4gaW1wbGVtZW50YXRpb24gbGltaXRhdGlvbiBzbyBmYXIgdGhhdCBt
aWdodCBldmVudHVhbGx5IGJlIGxpZnRlZC4NCg0KDQo+IFRoZSBjaGlwcyBhZmZlY3RlZCBh
cmU6DQo+IA0KPiAgIFFDQTYzOTAgaHcyLjANCg0KVGVzdGVkLWJ5OiBNaWhhaSBNb2xkb3Zh
biA8aW9uaWNAaW9uaWMuZGU+DQpUZXN0ZWQtb246IFFDQTYzOTAgaHcyLjAgUENJIFdMQU4u
SFNULjEuMC4xLTA1MjY2LVFDQUhTVFNXUExaX1YyX1RPX1g4Ni0xDQoNCg0KVGhlc2Ugd2Vy
ZSB0aGUgdGVzdGVkIGNvbmZpZ3VyYXRpb25zOg0KDQogICAtIDUgR0h6IG9uIERGUyBjaGFu
bmVsOg0KDQogICAgICAgICBJbnRlcmZhY2Ugd2lmaWF4DQogICAgICAgICAgICAgICAgIGlm
aW5kZXggNg0KICAgICAgICAgICAgICAgICB3ZGV2IDB4MQ0KICAgICAgICAgICAgICAgICBh
ZGRyIDIwOjU3OjllOjJkOjA0OjFlDQogICAgICAgICAgICAgICAgIHNzaWQgV1JUS0EwNQ0K
ICAgICAgICAgICAgICAgICB0eXBlIEFQDQogICAgICAgICAgICAgICAgIGNoYW5uZWwgMTAw
ICg1NTAwIE1IeiksIHdpZHRoOiA4MCBNSHosIGNlbnRlcjE6IDU1MzAgTUh6DQogICAgICAg
ICAgICAgICAgIHR4cG93ZXIgMjAuMDAgZEJtDQogICAgICAgICAgICAgICAgIG11bHRpY2Fz
dCBUWFE6DQogICAgICAgICAgICAgICAgICAgICAgICAgcXN6LWJ5dCBxc3otcGt0IGZsb3dz
ICAgZHJvcHMgICBtYXJrcyAgIG92ZXJsbXQgaGFzaGNvbCANCnR4LWJ5dGVzICAgICAgICB0
eC1wYWNrZXRzDQogICAgICAgICAgICAgICAgICAgICAgICAgMCAgICAgICAwICAgICAgIDQ1
NCAgICAgMCAgICAgICAwICAgICAgIDAgICAgICAgMCANCjYxNDU2ICAgICAgICAgICA0NTQN
Cg0KICAgLSA1IEdIeiBvbiBub24tREZTIGNoYW5uZWwgKyAyLjQgR0h6IChEQlMpOg0KDQog
ICAgICAgICBJbnRlcmZhY2Ugd2lmaWF4MjQNCiAgICAgICAgICAgICAgICAgaWZpbmRleCA3
DQogICAgICAgICAgICAgICAgIHdkZXYgMHgyDQogICAgICAgICAgICAgICAgIGFkZHIgMjI6
NTc6OWU6MmQ6MDQ6MWUNCiAgICAgICAgICAgICAgICAgc3NpZCBXUlRLQTA2LVRhc21vdGEN
CiAgICAgICAgICAgICAgICAgdHlwZSBBUA0KICAgICAgICAgICAgICAgICBjaGFubmVsIDcg
KDI0NDIgTUh6KSwgd2lkdGg6IDQwIE1IeiwgY2VudGVyMTogMjQ1MiBNSHoNCiAgICAgICAg
ICAgICAgICAgdHhwb3dlciAyMC4wMCBkQm0NCiAgICAgICAgICAgICAgICAgbXVsdGljYXN0
IFRYUToNCiAgICAgICAgICAgICAgICAgICAgICAgICBxc3otYnl0IHFzei1wa3QgZmxvd3Mg
ICBkcm9wcyAgIG1hcmtzICAgb3ZlcmxtdCBoYXNoY29sIA0KdHgtYnl0ZXMgICAgICAgIHR4
LXBhY2tldHMNCiAgICAgICAgICAgICAgICAgICAgICAgICAwICAgICAgIDAgICAgICAgNjEg
ICAgICAwICAgICAgIDAgICAgICAgMCAgICAgICAwIA0KODU2MiAgICAgICAgICAgIDYxDQog
ICAgICAgICBJbnRlcmZhY2Ugd2lmaWF4DQogICAgICAgICAgICAgICAgIGlmaW5kZXggNg0K
ICAgICAgICAgICAgICAgICB3ZGV2IDB4MQ0KICAgICAgICAgICAgICAgICBhZGRyIDIwOjU3
OjllOjJkOjA0OjFlDQogICAgICAgICAgICAgICAgIHNzaWQgV1JUS0EwNQ0KICAgICAgICAg
ICAgICAgICB0eXBlIEFQDQogICAgICAgICAgICAgICAgIGNoYW5uZWwgNDAgKDUyMDAgTUh6
KSwgd2lkdGg6IDgwIE1IeiwgY2VudGVyMTogNTIxMCBNSHoNCiAgICAgICAgICAgICAgICAg
dHhwb3dlciAyMC4wMCBkQm0NCiAgICAgICAgICAgICAgICAgbXVsdGljYXN0IFRYUToNCiAg
ICAgICAgICAgICAgICAgICAgICAgICBxc3otYnl0IHFzei1wa3QgZmxvd3MgICBkcm9wcyAg
IG1hcmtzICAgb3ZlcmxtdCBoYXNoY29sIA0KdHgtYnl0ZXMgICAgICAgIHR4LXBhY2tldHMN
CiAgICAgICAgICAgICAgICAgICAgICAgICAwICAgICAgIDAgICAgICAgNjkgICAgICAwICAg
ICAgIDAgICAgICAgMCAgICAgICAwIA0KMTAwMzIgICAgICAgICAgIDY5DQoNCg0KDQpNaWhh
aQ0K

--------------nh6QtHM1Hq049VOCj5aQhoJD--

--------------OjpeL0Ch5J7NC1IF3J4dvxLH
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEEbhHQj3UzgcdE8cg8H9Yu2W4lOocFAmdFZjQFAwAAAAAACgkQH9Yu2W4lOoez
8hAAlPY4n+PW8REizmripIBVF6sI89SYKsn/d1Pi1YyREM0z0/Adc4+wbZHd93JdzJ6ELlWrMaj5
CLM2s6D23PxfUEBAKoR0EVoJBAahQ6C5vV/w74D9eK1KwX+AE9WkbySeA1UXOCll8dF6+kL6CHof
ODe6TylwYr5eSoSixPoT+C8eSScNxoCOz6bqD4SoRk5/V/LphoPHAS1hpzXK4uyMYknUWwrJ1+/6
R9T61W+DEVvJ+sU/xG4hhxl+jGdvgoS6Fz9sbCblUAvRlHvl+j5xy6esePyInJuZlWS4lgg5TE/A
VpLQt8cU32Zl7dOh9POqHh/iBDX3J/D+XeHg4KCDpDl8VraIfTHhtqRLk4Gn34hlMe8RWxofMxMh
XgJi2LVukQoAkH/ybAUU4kpxIwcJfkJRpqhwOtt74U672dy0ZO6ghR8fwKUVFc1oOqmkZQq3xzYn
YUhHnPBfb8v8p4q0e+I3dAAaJnLexOD4QpaE+dSxDCVLCFHVmmeKww7wN9AFcL1YyTJxiC6IYrNh
8t870lEYnHCRjxQcqBizIA/C+7rIJYFa+E791QUSyIZN8YvUgl49rNIKBzbWh7147eHvfkAOGe8x
QKtD4ShBQb8Y6YU8VmLOGw16hHvFW44cAMB31OQV8VynAVa/lJsOGWrgi1n3Z+0Fip9MPZPXBB46
cxY=
=xIy8
-----END PGP SIGNATURE-----

--------------OjpeL0Ch5J7NC1IF3J4dvxLH--

