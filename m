Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06FEDC83F2C
	for <ath11k@archiver.kernel.org>; Tue,  5 Sep 2023 16:28:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LdbvrLus6KJ0NJKMyQiCfjIBZS04C0a1xs1RKJ2c5FI=; b=Axh5mDBGx3wQrn
	67DA3guU7KMK+3A+tpkxiOp9bb1fYjF9uZTOlze0DPD6h7SFuKe8k8t6xP2Mrazx8iM+G1E9GaXVE
	2XUQlIsZ26UZMPi3X8fBUnDw1W4rZuklA9/fLEruK/KVaF/6EyJ0q2JtpkXL69Gws1D9fQjjn1uOn
	bbeAiydZXndaOqNxzZyG3cByaln7Fzu9ISJIxKg+de4LmqinxYifgiLMlpI8Ng64CGAPlmADJPtYj
	pNznph/8IannB08jvHhDhf+GhQxs8IfqgatuCUBYIlgYrLbevFhozXZgU/9VJ5nY/awN/FR+/+ePX
	wsjnFZxVUMTuxVmWFmdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qdYvC-006MRS-2N;
	Tue, 05 Sep 2023 16:28:58 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qdYv9-006MQL-1h
	for ath11k@lists.infradead.org;
	Tue, 05 Sep 2023 16:28:56 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-501be2d45e0so1482661e87.3
        for <ath11k@lists.infradead.org>; Tue, 05 Sep 2023 09:28:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1693931330; x=1694536130; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OfYnmYbnlw/oOdEXRRJF1VOqzdakA8jCVvd4ZjMv2EM=;
        b=Kg5fla2a54K6E9ajWTQCfBOihMiNH4iFNtSut2Sv4xOeU1/GhIqxzO2xyCuvd1SBZi
         kjnxo+0NA3ZKZHAvuB+O8LO+3S4I3BEFuuJ+VC+LTPJCacm9yalDbjJGbS06UugXZClj
         RyMtPWFzWtYq3Y+CW5iLSJDFPIcw8w6ldwF4k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693931330; x=1694536130;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OfYnmYbnlw/oOdEXRRJF1VOqzdakA8jCVvd4ZjMv2EM=;
        b=JxwMfuLfwaHIFqJA48Vi2VF716Ah9ktQgSpj+OVNoPbMKW/cS/zowhi0/vxnf8vtpp
         9VDBpxqfGTuvrEA5/Rgqvo6CflO/rLyYt/+VGqIHY3C1lHeqCrWkwEttJLV/iwOhPTwB
         vygfAc7CuPnM8j9pheTKVJSF6Jo+Q7G4MQID5h+80gLT8ixxSZysHdscCGlAF5bm2Uaa
         5ytkoFCMkYg8JMV6FPkMdfXY+34G3stgkJMfJqxi71Vd3M2ibvID4DQXt3l0zPCektch
         M26Us+Wtio77OhAmP2wKqkSElL0pV5cRvj8ADYBOnIjJ9KhIh7+JA6dXbwyA9FHNZFur
         4TqA==
X-Gm-Message-State: AOJu0YyxQt3q5EgFnD3SVUxGV0rCnyBHic5uXeYnEkQ0gDIkdyRvKUtL
	n5gHBYFI3dRjgpSkAV35oC+1uiBK0RS3VGLI1dVzEvehWaDcsT4KzA==
X-Google-Smtp-Source: AGHT+IHRpYJwtBkvQItpDOzpsoiC8Dj7/UWfHFdTNS2CIKeWgrIXNYkWJnDsvCEq1d6lrwFV0p0pXAjnk5zgzKOzDrQ=
X-Received: by 2002:ac2:5925:0:b0:500:b828:7a04 with SMTP id
 v5-20020ac25925000000b00500b8287a04mr259335lfi.18.1693931329871; Tue, 05 Sep
 2023 09:28:49 -0700 (PDT)
MIME-Version: 1.0
References: <878r9sga1t.fsf@kernel.org>
In-Reply-To: <878r9sga1t.fsf@kernel.org>
From: Ross Lagerwall <ross.lagerwall@cloud.com>
Date: Tue, 5 Sep 2023 17:28:38 +0100
Message-ID: <CAG7k0Epk6KJvoDJKVc86sc_ems3DTbKvPLouBzOoVvn1tZwQ=w@mail.gmail.com>
Subject: Re: [regression v6.5-rc1] PCI: comm "swapper/0" leaking memory
To: Kalle Valo <kvalo@kernel.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org, 
	linux-kernel@vger.kernel.org, ath11k@lists.infradead.org, 
	regressions@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230905_092855_571677_A898CE29 
X-CRM114-Status: GOOD (  16.90  )
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

T24gV2VkLCBBdWcgMzAsIDIwMjMgYXQgMTA6MjHigK9BTSBLYWxsZSBWYWxvIDxrdmFsb0BrZXJu
ZWwub3JnPiB3cm90ZToKPgo+IFtDQVVUSU9OIC0gRVhURVJOQUwgRU1BSUxdIERPIE5PVCByZXBs
eSwgY2xpY2sgbGlua3MsIG9yIG9wZW4gYXR0YWNobWVudHMgdW5sZXNzIHlvdSBoYXZlIHZlcmlm
aWVkIHRoZSBzZW5kZXIgYW5kIGtub3cgdGhlIGNvbnRlbnQgaXMgc2FmZS4KPgo+IEhpLAo+Cj4g
SSBub3RpY2VkIHRoYXQgc3RhcnRpbmcgZnJvbSB2Ni41LXJjMSBteSBhdGgxMWsgdGVzdHMgcmVw
b3J0ZWQgc2V2ZXJhbAo+IG1lbW9yeSBsZWFrcyBmcm9tIHN3YXBwZXIvMDoKPgo+IHVucmVmZXJl
bmNlZCBvYmplY3QgMHhmZmZmODg4MTBhMDJiN2E4IChzaXplIDk2KToKPiAgIGNvbW0gInN3YXBw
ZXIvMCIsIHBpZCAxLCBqaWZmaWVzIDQyOTQ2NzE4MzggKGFnZSA5OC4xMjBzKQo+ICAgaGV4IGR1
bXAgKGZpcnN0IDMyIGJ5dGVzKToKPiAgICAgODAgYjggMDIgMGEgODEgODggZmYgZmYgYjggNzIg
MDcgMDAgMDAgYzkgZmYgZmYgIC4uLi4uLi4uLnIuLi4uLi4KPiAgICAgYzggYjcgMDIgMGEgODEg
ODggZmYgZmYgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgIC4uLi4uLi4uLi4uLi4uLi4KPiAgIGJh
Y2t0cmFjZToKPiB1bnJlZmVyZW5jZWQgb2JqZWN0IDB4ZmZmZjg4ODEwYTAyYjg4MCAoc2l6ZSA5
Nik6Cj4gICBjb21tICJzd2FwcGVyLzAiLCBwaWQgMSwgamlmZmllcyA0Mjk0NjcxODM4IChhZ2Ug
OTguMTIwcykKPiAgIGhleCBkdW1wIChmaXJzdCAzMiBieXRlcyk6Cj4gICAgIDU4IGI5IDAyIDBh
IDgxIDg4IGZmIGZmIGE4IGI3IDAyIDBhIDgxIDg4IGZmIGZmICBYLi4uLi4uLi4uLi4uLi4uCj4g
ICAgIGEwIGI4IDAyIDBhIDgxIDg4IGZmIGZmIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwICAuLi4u
Li4uLi4uLi4uLi4uCj4gICBiYWNrdHJhY2U6Cj4gdW5yZWZlcmVuY2VkIG9iamVjdCAweGZmZmY4
ODgxMGEwMmI5NTggKHNpemUgOTYpOgo+ICAgY29tbSAic3dhcHBlci8wIiwgcGlkIDEsIGppZmZp
ZXMgNDI5NDY3MTgzOCAoYWdlIDk4LjEyMHMpCj4gICBoZXggZHVtcCAoZmlyc3QgMzIgYnl0ZXMp
Ogo+ICAgICAzMCBiYSAwMiAwYSA4MSA4OCBmZiBmZiA4MCBiOCAwMiAwYSA4MSA4OCBmZiBmZiAg
MC4uLi4uLi4uLi4uLi4uLgo+ICAgICA3OCBiOSAwMiAwYSA4MSA4OCBmZiBmZiAwMCAwMCAwMCAw
MCAwMCAwMCAwMCAwMCAgeC4uLi4uLi4uLi4uLi4uLgo+ICAgYmFja3RyYWNlOgo+IHVucmVmZXJl
bmNlZCBvYmplY3QgMHhmZmZmODg4MTBhMDJiYTMwIChzaXplIDk2KToKPiAgIGNvbW0gInN3YXBw
ZXIvMCIsIHBpZCAxLCBqaWZmaWVzIDQyOTQ2NzE4MzggKGFnZSA5OC4xMjBzKQo+ICAgaGV4IGR1
bXAgKGZpcnN0IDMyIGJ5dGVzKToKPiAgICAgMDggYmIgMDIgMGEgODEgODggZmYgZmYgNTggYjkg
MDIgMGEgODEgODggZmYgZmYgIC4uLi4uLi4uWC4uLi4uLi4KPiAgICAgNTAgYmEgMDIgMGEgODEg
ODggZmYgZmYgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgIFAuLi4uLi4uLi4uLi4uLi4KPiAgIGJh
Y2t0cmFjZToKPiB1bnJlZmVyZW5jZWQgb2JqZWN0IDB4ZmZmZjg4ODEwYTAyYmIwOCAoc2l6ZSA5
Nik6Cj4gICBjb21tICJzd2FwcGVyLzAiLCBwaWQgMSwgamlmZmllcyA0Mjk0NjcxODM4IChhZ2Ug
OTguMTIwcykKPiAgIGhleCBkdW1wIChmaXJzdCAzMiBieXRlcyk6Cj4gICAgIGUwIGJiIDAyIDBh
IDgxIDg4IGZmIGZmIDMwIGJhIDAyIDBhIDgxIDg4IGZmIGZmICAuLi4uLi4uLjAuLi4uLi4uCj4g
ICAgIDI4IGJiIDAyIDBhIDgxIDg4IGZmIGZmIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwICAoLi4u
Li4uLi4uLi4uLi4uCj4gICBiYWNrdHJhY2U6Cj4KPiBJIGNhbiBlYXNpbHkgcmVwcm9kdWNlIHRo
aXMgYnkgZG9pbmcgYSBzaW1wbGUgaW5zbW9kIGFuZCBybW1vZCBvZiBhdGgxMWsKPiBhbmQgaXQn
cyBkZXBlbmRlbmNpZXMgKG1hYzgwMjExLCBNSEkgZXRjKS4gSSBjYW4gcmVsaWFiaWxpdHkgcmVw
cm9kdWNlCj4gdGhlIGxlYWtzIGJ1dCBJIG9ubHkgc2VlIHRoZW0gb25jZSBhZnRlciBhIGJvb3Qs
IEkgbmVlZCB0byByZWJvb3QgdGhlCj4gaG9zdCB0byBzZWUgdGhlIGxlYWtzIGFnYWluLiB2Ni40
IGhhcyBubyBsZWFrcy4KPgo+IEkgZGlkIGEgYmlzZWN0IGFuZCBmb3VuZCB0aGUgY29tbWl0IGJl
bG93LiBJIHZlcmlmaWVkIHJldmVydGluZyB0aGUKPiBjb21taXQgbWFrZXMgdGhlIGxlYWtzIGdv
IGF3YXkuCj4KPiBjb21taXQgZTU0MjIzMjc1YmExYmM2ZjcwNGE2YmFiMDE1ZmNkMmFlNGY3MjU3
Mgo+IEF1dGhvcjogICAgIFJvc3MgTGFnZXJ3YWxsIDxyb3NzLmxhZ2Vyd2FsbEBjaXRyaXguY29t
Pgo+IEF1dGhvckRhdGU6IFRodSBNYXkgMjUgMTY6MzI6NDggMjAyMyArMDEwMAo+IENvbW1pdDog
ICAgIEJqb3JuIEhlbGdhYXMgPGJoZWxnYWFzQGdvb2dsZS5jb20+Cj4gQ29tbWl0RGF0ZTogRnJp
IEp1biA5IDE1OjA2OjE2IDIwMjMgLTA1MDAKPgo+ICAgICBQQ0k6IFJlbGVhc2UgcmVzb3VyY2Ug
aW52YWxpZGF0ZWQgYnkgY29hbGVzY2luZwo+Cj4gS2FsbGUKPgoKSGkgS2FsbGUsCgpJIGNhbid0
IHJlcHJvZHVjZSB0aGUgbGVhayBieSBsb2FkaW5nL3VubG9hZGluZyB0aGUgYXRoMTFrIG1vZHVs
ZS4gSSBzdXNwZWN0CnRoYXQgdGhlIGxlYWsgaXMgYWx3YXlzIHRoZXJlIHdoZW4gUENJIHJlc291
cmNlcyBhcmUgY29hbGVzY2VkIGJ1dAprbWVtbGVhayBkb2Vzbid0IG5vdGljZSB1bnRpbCBhdGgx
MWsgaXMgbG9hZGVkLgoKQ2FuIHlvdSBwbGVhc2UgdHJ5IHRoZSBmb2xsb3dpbmcgdG8gY29uZmly
bSBpdCBmaXhlcyBpdD8KClJvc3MKCjg8LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL3BjaS9wcm9iZS5jIGIvZHJpdmVycy9wY2kvcHJvYmUuYwppbmRleCA4YmFj
M2NlMDI2MDkuLjkwN2M4NzM0NzNlMiAxMDA2NDQKLS0tIGEvZHJpdmVycy9wY2kvcHJvYmUuYwor
KysgYi9kcml2ZXJzL3BjaS9wcm9iZS5jCkBAIC05OTgsNiArOTk4LDcgQEAgc3RhdGljIGludCBw
Y2lfcmVnaXN0ZXJfaG9zdF9icmlkZ2Uoc3RydWN0CnBjaV9ob3N0X2JyaWRnZSAqYnJpZGdlKQog
ICAgICAgICByZXMgPSB3aW5kb3ctPnJlczsKICAgICAgICAgaWYgKCFyZXMtPmZsYWdzICYmICFy
ZXMtPnN0YXJ0ICYmICFyZXMtPmVuZCkgewogICAgICAgICAgICAgcmVsZWFzZV9yZXNvdXJjZShy
ZXMpOworICAgICAgICAgICAgcmVzb3VyY2VfbGlzdF9kZXN0cm95X2VudHJ5KHdpbmRvdyk7CiAg
ICAgICAgICAgICBjb250aW51ZTsKICAgICAgICAgfQoKLS0gCmF0aDExayBtYWlsaW5nIGxpc3QK
YXRoMTFrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9hdGgxMWsK
