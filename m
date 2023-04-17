Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE28CC77B76
	for <ath11k@archiver.kernel.org>; Mon, 17 Apr 2023 13:10:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Subject:Message-Id:References:
	In-Reply-To:Cc:To:From:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TYqdWf0gkNUUjh2W8GOSCaCkncE1025v+avxWr3OipY=; b=v1TgQK9/kOVofy
	z+OX1gfuqzbPXRrALC8nKmgh6W7GUw44vJzbvOZmp0Xd7M/pJ+DKvSFOKQYUbaFlzx1fKVx04LVEe
	fQCddxp0kB9BYVEdbhm4cGCT+cJ8JnD7TR/yB5zsXJZwiyGtfP7VDwP/GXxUQRED9KAdRlYveJ6I5
	/w6CNErNPW7aXBg0Ft6BoRMhd2RMLmprjyA7vVMjeCsrWVu/s2Xx+ZR0aDr+98WtxXxAvofG+MJiH
	/zQSsaFSdoxk+8OvBYTertPT4Z9U/cIwa5Emj8euxfK24vH6plQnxvleF4Ta5k/yt8QuQ9iaNAMPO
	RVM6wg+0KyGn5Gv4psKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1poOcz-00GLAu-1O;
	Mon, 17 Apr 2023 13:10:41 +0000
Received: from mail-oi1-f174.google.com ([209.85.167.174])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1poOcv-00GL9E-2W
	for ath11k@lists.infradead.org;
	Mon, 17 Apr 2023 13:10:39 +0000
Received: by mail-oi1-f174.google.com with SMTP id bg7so1359798oib.9
        for <ath11k@lists.infradead.org>; Mon, 17 Apr 2023 06:10:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681737035; x=1684329035;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VxzMSlWJqp0jC6TDxAVrz9kAacy8nE6CyreWMpO82qY=;
        b=TCzkC57K0gKnsS3UuYZEFpJkWwPU3ayn1afKYsjLUROTIjgT1higwuwBHp8kSU2tay
         qjPcY7eR5jtUzswFZ7cuTonkdV3VSkuvTHvFVIs15J7osxiJEw73cLXABqG5So11L8jU
         OM/uwbojf83n4VoajTsLY5gXVJXlhgQhCMc5eO3MhAyLcL/e0/b3pLeVZ7cjtzWK2qTi
         0zgUpM826Tv1IL/xSCpiyrxP1R6zhQM7fU0WxZg4u4zxCs3SsVnXoEaWTQyNNtMJDhbR
         qJpzfcyoCOfpzYfHSFaz0fRz1Ghq63YF71c1WbDD7MfXsjKKVLhvUHYhpYdd6nbWG9oN
         kBlg==
X-Gm-Message-State: AAQBX9e4OmpZmK7M0ZvI8hBmtIqBp9VdxveHJFWTDR+BaMSOheXfk7TG
	xH1jy3mkfj1NyKcU4alvoQ==
X-Google-Smtp-Source: AKy350ZlGphdnLNiDveQNO6I/GKvTFb/FnKDX5Ft9E5IDzE2uMM2gZ+a2HIyvJqu2MA7klFBfhkVoQ==
X-Received: by 2002:a05:6808:bd5:b0:38d:e9e4:1ebd with SMTP id o21-20020a0568080bd500b0038de9e41ebdmr3351197oik.8.1681737035239;
        Mon, 17 Apr 2023 06:10:35 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id r7-20020acada07000000b003895430852dsm4607496oig.54.2023.04.17.06.10.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Apr 2023 06:10:34 -0700 (PDT)
Received: (nullmailer pid 2588774 invoked by uid 1000);
	Mon, 17 Apr 2023 13:10:27 -0000
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <zajec5@gmail.com>
Cc: Paolo Abeni <pabeni@redhat.com>, ath11k@lists.infradead.org, devicetree@vger.kernel.org, =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, "David S . Miller" <davem@davemloft.net>, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, Robert Marko <robimarko@gmail.com>, Kalle Valo <kvalo@kernel.org>, Eric Dumazet <edumazet@google.com>
In-Reply-To: <20230414212356.9326-1-zajec5@gmail.com>
References: <20230414212356.9326-1-zajec5@gmail.com>
Message-Id: <168173527510.2535500.15269428530497246338.robh@kernel.org>
Subject: Re: [PATCH 1/3] dt-bindings: net: wireless: qcom,ath11k: allow
 describing radios
Date: Mon, 17 Apr 2023 08:10:27 -0500
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230417_061037_817016_EC3C4C7B 
X-CRM114-Status: GOOD (  11.12  )
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

Ck9uIEZyaSwgMTQgQXByIDIwMjMgMjM6MjM6NTQgKzAyMDAsIFJhZmHFgiBNacWCZWNraSB3cm90
ZToKPiBGcm9tOiBSYWZhxYIgTWnFgmVja2kgPHJhZmFsQG1pbGVja2kucGw+Cj4gCj4gUXVhbGNv
bW0gYXRoMTFrIGNoaXBzZXRzIGNhbiBoYXZlIHVwIHRvIDMgcmFkaW9zLiBFYWNoIHJhZGlvIG1h
eSBuZWVkIHRvCj4gYmUgYWRkaXRpb25hbGx5IGRlc2NyaWJlZCBieSBpbmNsdWRpbmcgaXRzIE1B
QyBvciBhdmFpbGFibGUgZnJlcXVlbmN5Cj4gcmFuZ2VzLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFJh
ZmHFgiBNacWCZWNraSA8cmFmYWxAbWlsZWNraS5wbD4KPiAtLS0KPiAgLi4uL2JpbmRpbmdzL25l
dC93aXJlbGVzcy9xY29tLGF0aDExay55YW1sICAgIHwgMjYgKysrKysrKysrKysrKysrKysrKwo+
ICAxIGZpbGUgY2hhbmdlZCwgMjYgaW5zZXJ0aW9ucygrKQo+IAoKTXkgYm90IGZvdW5kIGVycm9y
cyBydW5uaW5nICdtYWtlIERUX0NIRUNLRVJfRkxBR1M9LW0gZHRfYmluZGluZ19jaGVjaycKb24g
eW91ciBwYXRjaCAoRFRfQ0hFQ0tFUl9GTEFHUyBpcyBuZXcgaW4gdjUuMTMpOgoKeWFtbGxpbnQg
d2FybmluZ3MvZXJyb3JzOgoKZHRzY2hlbWEvZHRjIHdhcm5pbmdzL2Vycm9yczoKL2J1aWxkcy9y
b2JoZXJyaW5nL2R0LXJldmlldy1jaS9saW51eC9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvbmV0L3dpcmVsZXNzL3Fjb20sYXRoMTFrLmV4YW1wbGUuZHRiOiB3aWZpQGMwMDAwMDA6
IHJhZGlvQDA6IFVuZXZhbHVhdGVkIHByb3BlcnRpZXMgYXJlIG5vdCBhbGxvd2VkICgncmVnJyB3
YXMgdW5leHBlY3RlZCkKCUZyb20gc2NoZW1hOiAvYnVpbGRzL3JvYmhlcnJpbmcvZHQtcmV2aWV3
LWNpL2xpbnV4L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9uZXQvd2lyZWxlc3Mv
cWNvbSxhdGgxMWsueWFtbAovYnVpbGRzL3JvYmhlcnJpbmcvZHQtcmV2aWV3LWNpL2xpbnV4L0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9uZXQvd2lyZWxlc3MvcWNvbSxhdGgxMWsu
ZXhhbXBsZS5kdGI6IHdpZmlAYzAwMDAwMDogJyNhZGRyZXNzLWNlbGxzJywgJyNzaXplLWNlbGxz
JyBkbyBub3QgbWF0Y2ggYW55IG9mIHRoZSByZWdleGVzOiAnXnJhZGlvQFswLTJdJCcsICdwaW5j
dHJsLVswLTldKycKCUZyb20gc2NoZW1hOiAvYnVpbGRzL3JvYmhlcnJpbmcvZHQtcmV2aWV3LWNp
L2xpbnV4L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9uZXQvd2lyZWxlc3MvcWNv
bSxhdGgxMWsueWFtbAoKZG9jIHJlZmVyZW5jZSBlcnJvcnMgKG1ha2UgcmVmY2hlY2tkb2NzKToK
ClNlZSBodHRwczovL3BhdGNod29yay5vemxhYnMub3JnL3Byb2plY3QvZGV2aWNldHJlZS1iaW5k
aW5ncy9wYXRjaC8yMDIzMDQxNDIxMjM1Ni45MzI2LTEtemFqZWM1QGdtYWlsLmNvbQoKVGhlIGJh
c2UgZm9yIHRoZSBzZXJpZXMgaXMgZ2VuZXJhbGx5IHRoZSBsYXRlc3QgcmMxLiBBIGRpZmZlcmVu
dCBkZXBlbmRlbmN5CnNob3VsZCBiZSBub3RlZCBpbiAqdGhpcyogcGF0Y2guCgpJZiB5b3UgYWxy
ZWFkeSByYW4gJ21ha2UgZHRfYmluZGluZ19jaGVjaycgYW5kIGRpZG4ndCBzZWUgdGhlIGFib3Zl
CmVycm9yKHMpLCB0aGVuIG1ha2Ugc3VyZSAneWFtbGxpbnQnIGlzIGluc3RhbGxlZCBhbmQgZHQt
c2NoZW1hIGlzIHVwIHRvCmRhdGU6CgpwaXAzIGluc3RhbGwgZHRzY2hlbWEgLS11cGdyYWRlCgpQ
bGVhc2UgY2hlY2sgYW5kIHJlLXN1Ym1pdCBhZnRlciBydW5uaW5nIHRoZSBhYm92ZSBjb21tYW5k
IHlvdXJzZWxmLiBOb3RlCnRoYXQgRFRfU0NIRU1BX0ZJTEVTIGNhbiBiZSBzZXQgdG8geW91ciBz
Y2hlbWEgZmlsZSB0byBzcGVlZCB1cCBjaGVja2luZwp5b3VyIHNjaGVtYS4gSG93ZXZlciwgaXQg
bXVzdCBiZSB1bnNldCB0byB0ZXN0IGFsbCBleGFtcGxlcyB3aXRoIHlvdXIgc2NoZW1hLgoKCi0t
IAphdGgxMWsgbWFpbGluZyBsaXN0CmF0aDExa0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vYXRoMTFrCg==
