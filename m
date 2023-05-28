Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD8C1C7EE29
	for <ath11k@archiver.kernel.org>; Sun, 28 May 2023 14:57:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3JG6UyyMM4utbV+2d6T7dXAUrNU6SP2IynPdlGs9GdY=; b=ZxVmUlnDvH/M2f
	moLQzMf5QcZ6GAyh1zSLZW+BzvS+bM+x2bILhlUr8rl22yIW8NSav1yfEkTq5C/Ua7ritxlgeIRpe
	qOVYJ5RU6ER5/ON85pBLPfEYgkCJ3FNBbrU/yjCtKh9d+GtirqVcpmJaAN/VbcuFIBUQGDm1mUNo8
	2YwVlzq+5v6woQuFRx2HUw8zdJXvUVLbAoPxQ93oaU7mw3zfINZQ0v5d+TUS4pQvKzCpBXefiAdaL
	8yOA30N9SWF2dswK6Eezu9s9ayomluuUSoSWnAWXCRi2YTx1/WZVr19WOPnZBHS+RUOpdOPchgFe2
	MKVy3v9LYpgnqZCzCuow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3Hpp-007s3m-2B;
	Sun, 28 May 2023 14:57:29 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3Hpn-007s2b-0u
	for ath11k@lists.infradead.org;
	Sun, 28 May 2023 14:57:28 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-253340db64fso2311170a91.2
        for <ath11k@lists.infradead.org>; Sun, 28 May 2023 07:57:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685285845; x=1687877845;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Bg4yP6JQUstw/bz5fFj0XL84ZF9tW/DTkJgQGvQnFs8=;
        b=dIWuteu9Fhf3vaicbIowU+wrrOTZL/zRcMlF/jKSKQNochrLf3vP78/5cUEgmYfa8V
         G3YQjMGayZchpuC2i+weXCmjd1RcuBm1hVZa8L5S97r06XjLz/3aSCFuoATNalUGLa43
         6bgdIu6NRfZb/yxZ1JsEJyCwnXGyro+aC2KcgO4kVib1Ps+hAzNSVJYXbYTN5bNjFQ3f
         Ys9V5oecLhPOuMBPLNaRbrk3cbkJbvSjmFavV67us8z+mwQdnzWhUhOaxBjJ/BxlGnPX
         z9ji/dXt9P9NN2mVrZpHBfjQWruESvQi4WpGJL/oH785dwK1AtDdyt5RevFUC9Ce+ZqN
         TtLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685285845; x=1687877845;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Bg4yP6JQUstw/bz5fFj0XL84ZF9tW/DTkJgQGvQnFs8=;
        b=jsjKTnAbEn+Q+EG9VpMG/Ygwsd4+feYTqH6RZiKKmzwirhzagOUKDVGkTgIdSWSAQI
         igm4IVQ75OytIDELSX9b92UvJvHLtV9LtvrfyCY8useRd8ptUAXCiGS7pZ4kAYDwpwGE
         FTBr23nKkvIdKZOYL9fi26QWOm5DZol2mOl41o3+IAgX9/dv8F6gacm/8x3lm/uTAYG6
         2WVUUhiA45uHk0DYtEV8JskjuaZaikBAnf9lgo/g5lnvMmCfQqn8POegYGez3d9K7vNB
         6IscdYySkOUH1u71q0r/q94/5tpwJdTd1zspdUrAc6ik/edQa1o9ncGUmEYs0QrDzCog
         d4oA==
X-Gm-Message-State: AC+VfDwRu9HAoKBv2M0DB4QzcPEF6BVJB7F/n1idfJlEf6aRNnOmVP/X
	PMsya2as81U1A/qZCkteda3TT0+GcMJ55MSHTw==
X-Google-Smtp-Source: ACHHUZ6yrBb/7PjUZzsTRpSciXH9EHy45Kbam/bdUmU0L6LbzwZ1LEy+e8SNaqJrDSUo8RFhrjF78w==
X-Received: by 2002:a17:902:a50d:b0:1a2:6257:36b9 with SMTP id s13-20020a170902a50d00b001a2625736b9mr7729161plq.31.1685285845626;
        Sun, 28 May 2023 07:57:25 -0700 (PDT)
Received: from thinkpad ([117.248.1.157])
        by smtp.gmail.com with ESMTPSA id f10-20020a170902ce8a00b001ae59169f05sm6406643plg.182.2023.05.28.07.57.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 May 2023 07:57:25 -0700 (PDT)
Date: Sun, 28 May 2023 20:27:21 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Kalle Valo <kvalo@kernel.org>
Cc: mhi@lists.linux.dev, ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org
Subject: Re: [PATCH v2 1/3] mhi: allow MHI client drivers to provide the
 firmware via a pointer
Message-ID: <20230528145721.GE2814@thinkpad>
References: <20230308152522.6728-1-kvalo@kernel.org>
 <20230308152522.6728-2-kvalo@kernel.org>
 <20230315081820.GD25575@thinkpad>
 <87353jl3it.fsf@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87353jl3it.fsf@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230528_075727_385535_720731BC 
X-CRM114-Status: GOOD (  23.80  )
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

T24gRnJpLCBNYXkgMjYsIDIwMjMgYXQgMDI6NDU6NDZQTSArMDMwMCwgS2FsbGUgVmFsbyB3cm90
ZToKPiBNYW5pdmFubmFuIFNhZGhhc2l2YW0gPG1hbml2YW5uYW4uc2FkaGFzaXZhbUBsaW5hcm8u
b3JnPiB3cml0ZXM6Cj4gCj4gPiBPbiBXZWQsIE1hciAwOCwgMjAyMyBhdCAwNToyNToyMFBNICsw
MjAwLCBLYWxsZSBWYWxvIHdyb3RlOgo+ID4+IEZyb206IEthbGxlIFZhbG8gPHF1aWNfa3ZhbG9A
cXVpY2luYy5jb20+Cj4gPj4gCj4gPgo+ID4gU3ViamVjdCBwcmVmaXggc2hvdWxkIGJlOiAiYnVz
OiBtaGk6IGhvc3Q6IC4uLiIKPiAKPiBXaWxsIGRvLgo+IAo+ID4+IEBAIC0zOTIsOSArMzkwLDEw
IEBAIHZvaWQgbWhpX2Z3X2xvYWRfaGFuZGxlcihzdHJ1Y3QgbWhpX2NvbnRyb2xsZXIgKm1oaV9j
bnRybCkKPiA+PiAgCWNvbnN0IHN0cnVjdCBmaXJtd2FyZSAqZmlybXdhcmUgPSBOVUxMOwo+ID4+
ICAJc3RydWN0IGRldmljZSAqZGV2ID0gJm1oaV9jbnRybC0+bWhpX2Rldi0+ZGV2Owo+ID4+ICAJ
Y29uc3QgY2hhciAqZndfbmFtZTsKPiA+PiArCWNvbnN0IHU4ICpmd19kYXRhOwo+ID4+ICAJdm9p
ZCAqYnVmOwo+ID4+ICAJZG1hX2FkZHJfdCBkbWFfYWRkcjsKPiA+PiAtCXNpemVfdCBzaXplOwo+
ID4+ICsJc2l6ZV90IHNpemUsIGZ3X3N6Owo+ID4+ICAJaW50IGksIHJldDsKPiA+PiAgCj4gPj4g
IAlpZiAoTUhJX1BNX0lOX0VSUk9SX1NUQVRFKG1oaV9jbnRybC0+cG1fc3RhdGUpKSB7Cj4gPj4g
QEAgLTQyNCw2ICs0MjMsMTQgQEAgdm9pZCBtaGlfZndfbG9hZF9oYW5kbGVyKHN0cnVjdCBtaGlf
Y29udHJvbGxlciAqbWhpX2NudHJsKQo+ID4+ICAJZndfbmFtZSA9IChtaGlfY250cmwtPmVlID09
IE1ISV9FRV9FREwpID8KPiA+PiAgCQltaGlfY250cmwtPmVkbF9pbWFnZSA6IG1oaV9jbnRybC0+
ZndfaW1hZ2U7Cj4gPj4gIAo+ID4KPiA+IENhbiB5b3UgcGxlYXNlIGFkZCBhIGNvbW1lbnQgaGVy
ZT8KPiAKPiBPay4KPiAKPiA+Cj4gPj4gKwlpZiAoIWZ3X25hbWUgJiYgbWhpX2NudHJsLT5mYmNf
ZG93bmxvYWQgJiYKPiA+PiArCSAgICBtaGlfY250cmwtPmZ3X2RhdGEgJiYgbWhpX2NudHJsLT5m
d19zeikgewo+ID4+ICsJCXNpemUgPSBtaGlfY250cmwtPnNibF9zaXplOwo+ID4KPiA+IERvbid0
IHlvdSBuZWVkIHRvIHZhbGlkYXRlIHNibF9zaXplPwo+IAo+IEdvb2QgcG9pbnQsIEknbGwgYWRk
IHRoYXQuCj4gCj4gPj4gLS0tIGEvaW5jbHVkZS9saW51eC9taGkuaAo+ID4+ICsrKyBiL2luY2x1
ZGUvbGludXgvbWhpLmgKPiA+PiBAQCAtMjk5LDYgKzI5OSwxMCBAQCBzdHJ1Y3QgbWhpX2NvbnRy
b2xsZXJfY29uZmlnIHsKPiA+PiAgICogQGlvdmFfc3RhcnQ6IElPTU1VIHN0YXJ0aW5nIGFkZHJl
c3MgZm9yIGRhdGEgKHJlcXVpcmVkKQo+ID4+ICAgKiBAaW92YV9zdG9wOiBJT01NVSBzdG9wIGFk
ZHJlc3MgZm9yIGRhdGEgKHJlcXVpcmVkKQo+ID4+ICAgKiBAZndfaW1hZ2U6IEZpcm13YXJlIGlt
YWdlIG5hbWUgZm9yIG5vcm1hbCBib290aW5nIChvcHRpb25hbCkKPiA+PiArICogQGZ3X2RhdGE6
IEZpcm13YXJlIGltYWdlIGRhdGEgY29udGVudCBmb3Igbm9ybWFsIGJvb3RpbmcsIHVzZWQgb25s
eQo+ID4+ICsgKiAgICAgICAgICAgaWYgZndfaW1hZ2UgaXMgTlVMTCAob3B0aW9uYWwpCj4gPj4g
KyAqIEBmd19zejogRmlybXdhcmUgaW1hZ2UgZGF0YSBzaXplIGZvciBub3JtYWwgYm9vdGluZywg
dXNlZCBvbmx5IGlmIGZ3X2ltYWdlCj4gPj4gKyAqICAgICAgICAgaXMgTlVMTCBhbmQgZmJjX2Rv
d25sb2FkIGlzIHRydWUgKG9wdGlvbmFsKQo+ID4+ICAgKiBAZWRsX2ltYWdlOiBGaXJtd2FyZSBp
bWFnZSBuYW1lIGZvciBlbWVyZ2VuY3kgZG93bmxvYWQgbW9kZSAob3B0aW9uYWwpCj4gPj4gICAq
IEByZGRtX3NpemU6IFJBTSBkdW1wIHNpemUgdGhhdCBob3N0IHNob3VsZCBhbGxvY2F0ZSBmb3Ig
ZGVidWdnaW5nIHB1cnBvc2UKPiA+PiAgICogQHNibF9zaXplOiBTQkwgaW1hZ2Ugc2l6ZSBkb3du
bG9hZGVkIHRocm91Z2ggQkhJZSAob3B0aW9uYWwpCj4gPj4gQEAgLTM4NCw2ICszODgsOCBAQCBz
dHJ1Y3QgbWhpX2NvbnRyb2xsZXIgewo+ID4+ICAJZG1hX2FkZHJfdCBpb3ZhX3N0YXJ0Owo+ID4+
ICAJZG1hX2FkZHJfdCBpb3ZhX3N0b3A7Cj4gPj4gIAljb25zdCBjaGFyICpmd19pbWFnZTsKPiA+
PiArCWNvbnN0IHU4ICpmd19kYXRhOwo+ID4+ICsJc2l6ZV90IGZ3X3N6Owo+ID4KPiA+IEV2ZW4g
dGhvdWdoIHRoZXNlIG1lbWJlcnMgYXJlIG5vdCBjcmVhdGluZyBob2xlcyBub3csIHNodWZmbGlu
ZyB0aGUgZGF0YXR5cGVzCj4gPiB3aWxsIGNyZWF0ZSBob2xlcyBpbiB0aGUgZnV0dXJlLiBTbyBJ
IGFsd2F5cyBwcmVmZXIgdG8ga2VlcCB0aGUgc3RydWN0IG1lbWJlcnMKPiA+IHNvcnRlZCBpbiB0
aGUgYmVsb3cgb3JkZXI6Cj4gPgo+ID4gcG9pbnRlcgo+ID4gc3RydWN0L3VuaW9uCj4gPiB1NjQK
PiA+IHUzMgo+ID4gdTE2Cj4gPiB1OAo+ID4gYm9vbAo+IAo+IEknbSBub3Qgc3VyZSB3aGF0IGFy
ZSBzdWdnZXN0aW5nIGhlcmUgYXMgc3RydWN0IG1oaV9jb250cm9sbGVyIGlzIG5vdAo+IHVzaW5n
IHRoYXQgc3R5bGUuIEFyZSB5b3Ugc2F5aW5nIHRoYXQgZndfc3ogc2hvdWxkIGJlIGFmdGVyIHJl
Z19sZW4/IFNvCj4gc29tZXRoaW5nIGxpa2UgdGhpczoKPiAKPiAJY29uc3QgdTggKmZ3X2RhdGE7
Cj4gCWNvbnN0IGNoYXIgKmVkbF9pbWFnZTsKPiAJc2l6ZV90IHJkZG1fc2l6ZTsKPiAJc2l6ZV90
IHNibF9zaXplOwo+IAlzaXplX3Qgc2VnX2xlbjsKPiAJc2l6ZV90IHJlZ19sZW47Cj4gCXNpemVf
dCBmd19zejsKPiAKCkFoLCBJIHRob3VnaHQgSSBhbHJlYWR5IHNvcnRlZCB0aGVtIHVwIGJ1dCBh
cHBhcmVudGx5IG5vdC4gS2VlcCBpdCBhcyBpdCBpcywKSSdsbCBzb3J0IHRoaXMgYW5kIG90aGVy
IHN0cnVjdHMgbGF0ZXIuCgotIE1hbmkKCj4gLS0gCj4gaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVs
Lm9yZy9wcm9qZWN0L2xpbnV4LXdpcmVsZXNzL2xpc3QvCj4gCj4gaHR0cHM6Ly93aXJlbGVzcy53
aWtpLmtlcm5lbC5vcmcvZW4vZGV2ZWxvcGVycy9kb2N1bWVudGF0aW9uL3N1Ym1pdHRpbmdwYXRj
aGVzCgotLSAK4K6u4K6j4K6/4K614K6j4K+N4K6j4K6p4K+NIOCumuCupOCuvuCumuCuv+CuteCu
ruCvjQoKLS0gCmF0aDExayBtYWlsaW5nIGxpc3QKYXRoMTFrQGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9hdGgxMWsK
