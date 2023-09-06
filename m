Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A25B2EB8FB6
	for <ath11k@archiver.kernel.org>; Wed,  6 Sep 2023 11:03:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q/3f+pdJAIhLtSvKSeTFnvQe9e1YytcD6vzQ6O8JWoA=; b=LC6biXGOXXrrdX
	ucXqoqPwv1eGbWliHc3+seUAgpZT0qMS9lx9ysk8oyjM7gJ9FYw2T351keUMBpIoBJ77iIEI3SSd5
	hZNofhRuO1udupTVhvCpRaZhqHCPq8x+Z3hqeLv0xiocXMbzAxT6UDq2QaUG6norcmpUvTvVQgyWu
	hYiuETcNSUrDfhS45Yp4LnzkNzyR6y1gJY8zy67v/hA3VyZmEj8h1q6Jqhxamcl3cm35q1EYYop9U
	pn8PWxOD4gGGMKVwk7PeyOBm5T0GyDE6Z7lFAu8dBWpT1aRgQQjwkJWVQnNWeunxx6AV1VimYYuWs
	lIRwcQnnSJ8G34Lqp1aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qdqJs-008RlM-38;
	Wed, 06 Sep 2023 11:03:36 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qdqJq-008Rhk-0J
	for ath11k@lists.infradead.org;
	Wed, 06 Sep 2023 11:03:35 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-4fe15bfb1adso5836954e87.0
        for <ath11k@lists.infradead.org>; Wed, 06 Sep 2023 04:03:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1693998212; x=1694603012; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4cP1GgEPsuH5x3JwCdVLlQl6m1HOoYau4dFR4xNCE00=;
        b=Zg7lw4JheBT4TnCCS9g3ZkgS7yAdpzogj/061psIcANy2dYDshrTmUa/MlT8VgKvg4
         brauOk/kddLKZFO07Y0CzFxjY3kVrCqcu+ktVugv5o7igHl/PLQRj3irgLwcthhuY2i/
         2K3k0yy5Qs7yQ6kHV7OckTPEWgdQg1ZMI4fp8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693998212; x=1694603012;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4cP1GgEPsuH5x3JwCdVLlQl6m1HOoYau4dFR4xNCE00=;
        b=UEjATjJBfYZhX78l13fQuRH3WIylRlEDDaM4uGyouft3WEudyRl6e6lkcg4V7sZz4i
         3lHMIPQEZl9dIPX4CXCFhgOu8gw8KGP2U7GS/Ma+CC1oTDH6GkmQnTF9K+OnaseSjdDz
         mv7oTJNu80mRzy0r6VFP9+zo3MRC+rAAR4ta8XLS+bkDpHCBten6fqA2td0ZU2rzpPaj
         TBDoJ3grb4fxHHtT6tIDjPXSgja4woh41p7RUDvk1Bx+/eOqjTIRP9wfIxeUp9o6X8IU
         7iXK1dwr588OWDGb4rBdzaA5k3TZ5QY8yiQwzh+q8n61NzZgVSoYSq4HUQz6fZ25jmEn
         Badg==
X-Gm-Message-State: AOJu0Yxh7+uRecNgo0n+7N9NCXHYR6ontxJwhn4sadPCwisaiJ0on2v6
	0WAO/8EQxSagMNx8JF4/gV4zXMMFMKEJLbi8n4VB
X-Google-Smtp-Source: AGHT+IGajkHriDp2V73gLnt8w9Q25yWyd69bww3RGThTXV/dyVspDiEGJ6yxe7gAgW9hORJWYBsEuf4z+KZwKyH4opw=
X-Received: by 2002:a05:6512:2393:b0:500:b5db:990b with SMTP id
 c19-20020a056512239300b00500b5db990bmr2354910lfv.47.1693998211695; Wed, 06
 Sep 2023 04:03:31 -0700 (PDT)
MIME-Version: 1.0
References: <878r9sga1t.fsf@kernel.org> <CAG7k0Epk6KJvoDJKVc86sc_ems3DTbKvPLouBzOoVvn1tZwQ=w@mail.gmail.com>
 <87o7ifelt7.fsf@kernel.org>
In-Reply-To: <87o7ifelt7.fsf@kernel.org>
From: Ross Lagerwall <ross.lagerwall@cloud.com>
Date: Wed, 6 Sep 2023 12:03:20 +0100
Message-ID: <CAG7k0Ep6ZT6f_wcr67ZOz-kDjNx2M-wax8QFoA5-WfyMhycR3A@mail.gmail.com>
Subject: Re: [regression v6.5-rc1] PCI: comm "swapper/0" leaking memory
To: Kalle Valo <kvalo@kernel.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org, 
	linux-kernel@vger.kernel.org, ath11k@lists.infradead.org, 
	regressions@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230906_040334_186792_B01DB0D6 
X-CRM114-Status: GOOD (  23.23  )
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

T24gV2VkLCBTZXAgNiwgMjAyMyBhdCA5OjQw4oCvQU0gS2FsbGUgVmFsbyA8a3ZhbG9Aa2VybmVs
Lm9yZz4gd3JvdGU6Cj4KPiBSb3NzIExhZ2Vyd2FsbCA8cm9zcy5sYWdlcndhbGxAY2xvdWQuY29t
PiB3cml0ZXM6Cj4KPiA+IE9uIFdlZCwgQXVnIDMwLCAyMDIzIGF0IDEwOjIx4oCvQU0gS2FsbGUg
VmFsbyA8a3ZhbG9Aa2VybmVsLm9yZz4gd3JvdGU6Cj4gPgo+ID4+Cj4gPj4gSSBub3RpY2VkIHRo
YXQgc3RhcnRpbmcgZnJvbSB2Ni41LXJjMSBteSBhdGgxMWsgdGVzdHMgcmVwb3J0ZWQgc2V2ZXJh
bAo+ID4+IG1lbW9yeSBsZWFrcyBmcm9tIHN3YXBwZXIvMDoKPiA+Pgo+ID4+IHVucmVmZXJlbmNl
ZCBvYmplY3QgMHhmZmZmODg4MTBhMDJiN2E4IChzaXplIDk2KToKPiA+PiAgIGNvbW0gInN3YXBw
ZXIvMCIsIHBpZCAxLCBqaWZmaWVzIDQyOTQ2NzE4MzggKGFnZSA5OC4xMjBzKQo+ID4+ICAgaGV4
IGR1bXAgKGZpcnN0IDMyIGJ5dGVzKToKPiA+PiAgICAgODAgYjggMDIgMGEgODEgODggZmYgZmYg
YjggNzIgMDcgMDAgMDAgYzkgZmYgZmYgIC4uLi4uLi4uLnIuLi4uLi4KPiA+PiAgICAgYzggYjcg
MDIgMGEgODEgODggZmYgZmYgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgIC4uLi4uLi4uLi4uLi4u
Li4KPiA+PiAgIGJhY2t0cmFjZToKPiA+PiB1bnJlZmVyZW5jZWQgb2JqZWN0IDB4ZmZmZjg4ODEw
YTAyYjg4MCAoc2l6ZSA5Nik6Cj4gPj4gICBjb21tICJzd2FwcGVyLzAiLCBwaWQgMSwgamlmZmll
cyA0Mjk0NjcxODM4IChhZ2UgOTguMTIwcykKPiA+PiAgIGhleCBkdW1wIChmaXJzdCAzMiBieXRl
cyk6Cj4gPj4gICAgIDU4IGI5IDAyIDBhIDgxIDg4IGZmIGZmIGE4IGI3IDAyIDBhIDgxIDg4IGZm
IGZmICBYLi4uLi4uLi4uLi4uLi4uCj4gPj4gICAgIGEwIGI4IDAyIDBhIDgxIDg4IGZmIGZmIDAw
IDAwIDAwIDAwIDAwIDAwIDAwIDAwICAuLi4uLi4uLi4uLi4uLi4uCj4gPj4gICBiYWNrdHJhY2U6
Cj4gPj4gdW5yZWZlcmVuY2VkIG9iamVjdCAweGZmZmY4ODgxMGEwMmI5NTggKHNpemUgOTYpOgo+
ID4+ICAgY29tbSAic3dhcHBlci8wIiwgcGlkIDEsIGppZmZpZXMgNDI5NDY3MTgzOCAoYWdlIDk4
LjEyMHMpCj4gPj4gICBoZXggZHVtcCAoZmlyc3QgMzIgYnl0ZXMpOgo+ID4+ICAgICAzMCBiYSAw
MiAwYSA4MSA4OCBmZiBmZiA4MCBiOCAwMiAwYSA4MSA4OCBmZiBmZiAgMC4uLi4uLi4uLi4uLi4u
Lgo+ID4+ICAgICA3OCBiOSAwMiAwYSA4MSA4OCBmZiBmZiAwMCAwMCAwMCAwMCAwMCAwMCAwMCAw
MCAgeC4uLi4uLi4uLi4uLi4uLgo+ID4+ICAgYmFja3RyYWNlOgo+ID4+IHVucmVmZXJlbmNlZCBv
YmplY3QgMHhmZmZmODg4MTBhMDJiYTMwIChzaXplIDk2KToKPiA+PiAgIGNvbW0gInN3YXBwZXIv
MCIsIHBpZCAxLCBqaWZmaWVzIDQyOTQ2NzE4MzggKGFnZSA5OC4xMjBzKQo+ID4+ICAgaGV4IGR1
bXAgKGZpcnN0IDMyIGJ5dGVzKToKPiA+PiAgICAgMDggYmIgMDIgMGEgODEgODggZmYgZmYgNTgg
YjkgMDIgMGEgODEgODggZmYgZmYgIC4uLi4uLi4uWC4uLi4uLi4KPiA+PiAgICAgNTAgYmEgMDIg
MGEgODEgODggZmYgZmYgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgIFAuLi4uLi4uLi4uLi4uLi4K
PiA+PiAgIGJhY2t0cmFjZToKPiA+PiB1bnJlZmVyZW5jZWQgb2JqZWN0IDB4ZmZmZjg4ODEwYTAy
YmIwOCAoc2l6ZSA5Nik6Cj4gPj4gICBjb21tICJzd2FwcGVyLzAiLCBwaWQgMSwgamlmZmllcyA0
Mjk0NjcxODM4IChhZ2UgOTguMTIwcykKPiA+PiAgIGhleCBkdW1wIChmaXJzdCAzMiBieXRlcyk6
Cj4gPj4gICAgIGUwIGJiIDAyIDBhIDgxIDg4IGZmIGZmIDMwIGJhIDAyIDBhIDgxIDg4IGZmIGZm
ICAuLi4uLi4uLjAuLi4uLi4uCj4gPj4gICAgIDI4IGJiIDAyIDBhIDgxIDg4IGZmIGZmIDAwIDAw
IDAwIDAwIDAwIDAwIDAwIDAwICAoLi4uLi4uLi4uLi4uLi4uCj4gPj4gICBiYWNrdHJhY2U6Cj4g
Pj4KPiA+PiBJIGNhbiBlYXNpbHkgcmVwcm9kdWNlIHRoaXMgYnkgZG9pbmcgYSBzaW1wbGUgaW5z
bW9kIGFuZCBybW1vZCBvZiBhdGgxMWsKPiA+PiBhbmQgaXQncyBkZXBlbmRlbmNpZXMgKG1hYzgw
MjExLCBNSEkgZXRjKS4gSSBjYW4gcmVsaWFiaWxpdHkgcmVwcm9kdWNlCj4gPj4gdGhlIGxlYWtz
IGJ1dCBJIG9ubHkgc2VlIHRoZW0gb25jZSBhZnRlciBhIGJvb3QsIEkgbmVlZCB0byByZWJvb3Qg
dGhlCj4gPj4gaG9zdCB0byBzZWUgdGhlIGxlYWtzIGFnYWluLiB2Ni40IGhhcyBubyBsZWFrcy4K
PiA+Pgo+ID4+IEkgZGlkIGEgYmlzZWN0IGFuZCBmb3VuZCB0aGUgY29tbWl0IGJlbG93LiBJIHZl
cmlmaWVkIHJldmVydGluZyB0aGUKPiA+PiBjb21taXQgbWFrZXMgdGhlIGxlYWtzIGdvIGF3YXku
Cj4gPj4KPiA+PiBjb21taXQgZTU0MjIzMjc1YmExYmM2ZjcwNGE2YmFiMDE1ZmNkMmFlNGY3MjU3
Mgo+ID4+IEF1dGhvcjogICAgIFJvc3MgTGFnZXJ3YWxsIDxyb3NzLmxhZ2Vyd2FsbEBjaXRyaXgu
Y29tPgo+ID4+IEF1dGhvckRhdGU6IFRodSBNYXkgMjUgMTY6MzI6NDggMjAyMyArMDEwMAo+ID4+
IENvbW1pdDogICAgIEJqb3JuIEhlbGdhYXMgPGJoZWxnYWFzQGdvb2dsZS5jb20+Cj4gPj4gQ29t
bWl0RGF0ZTogRnJpIEp1biA5IDE1OjA2OjE2IDIwMjMgLTA1MDAKPiA+Pgo+ID4+ICAgICBQQ0k6
IFJlbGVhc2UgcmVzb3VyY2UgaW52YWxpZGF0ZWQgYnkgY29hbGVzY2luZwo+ID4KPiA+IEhpIEth
bGxlLAo+ID4KPiA+IEkgY2FuJ3QgcmVwcm9kdWNlIHRoZSBsZWFrIGJ5IGxvYWRpbmcvdW5sb2Fk
aW5nIHRoZSBhdGgxMWsgbW9kdWxlLiBJIHN1c3BlY3QKPiA+IHRoYXQgdGhlIGxlYWsgaXMgYWx3
YXlzIHRoZXJlIHdoZW4gUENJIHJlc291cmNlcyBhcmUgY29hbGVzY2VkIGJ1dAo+ID4ga21lbWxl
YWsgZG9lc24ndCBub3RpY2UgdW50aWwgYXRoMTFrIGlzIGxvYWRlZC4KPiA+Cj4gPiBDYW4geW91
IHBsZWFzZSB0cnkgdGhlIGZvbGxvd2luZyB0byBjb25maXJtIGl0IGZpeGVzIGl0Pwo+Cj4gSSBy
dW4gdmFyaW91cyB0ZXN0cyB3aXRoIHlvdXIgcGF0Y2ggYW5kIEkgZG9uJ3Qgc2VlIGxlYWtzIGFu
eW1vcmUuIEkKPiBhbHNvIHZlcmllZCB0aGF0IHdpdGhvdXQgeW91ciBwYXRjaCBJIHNlZSB0aGUg
bGVhayBpbW1lZGlhdGVseS4KPgo+IFRoYW5rcyBmb3IgZml4aW5nIHRoaXMgc28gcXVpY2tseSwg
aXQgd291bGQgZ29vZCB0byBoYXZlIHRoaXMgZml4IGluCj4gdjYuNiBpZiBwb3NzaWJsZS4KPgo+
IFRlc3RlZC1ieTogS2FsbGUgVmFsbyA8a3ZhbG9Aa2VybmVsLm9yZz4KPgoKVGhhbmtzLCBJIHdp
bGwgc2VuZCBvdXQgYSBwcm9wZXIgcGF0Y2ggbm93LgoKUm9zcwoKLS0gCmF0aDExayBtYWlsaW5n
IGxpc3QKYXRoMTFrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9hdGgxMWsK
