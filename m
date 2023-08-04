Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E53AC04A94
	for <ath11k@archiver.kernel.org>; Fri,  4 Aug 2023 06:41:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mg6HhTdbIGglMEfFVe4nhuENGJH2R1P9UW+rOP4VMlo=; b=EK9NhyYPZZypTC
	4x72f0AlhjIMzJDi/bB+xfexN8oT9/UgXzi0339IHQRXsPt8ThFmSxCyp/PVC24N5OmEemBGZVZXs
	YIafMWmDlgqJVnNRMPgkRD2VKWc0cDZEHIHTNcPttc7dcANXPaUeDTW7mM3YjBfuDN2i0IWFXlmyM
	3o58XNpwK7fodV6Ojf/F5LyOEPyJjWzBPqbF6nQ+LhvbiZO3wjydUWzeknQDm1OKUtbrLp1b2IbJy
	VU8E8RA4u5r2mYOX1NNcAEtUkLuabmyV58czbyz8GRRXF3wGbaII+y+p0xxU1SO4qbGcG8S27zksW
	PCpSia8fsB2IxJiHCGVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRoUi-00BhJV-3A;
	Fri, 04 Aug 2023 06:41:04 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRoUg-00BhIz-0I
	for ath11k@lists.infradead.org;
	Fri, 04 Aug 2023 06:41:03 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-1bbbbb77b38so11839945ad.3
        for <ath11k@lists.infradead.org>; Thu, 03 Aug 2023 23:41:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691131260; x=1691736060;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uTvrtGm9omTNndYE3JOrnTDMBnw5b0qfWu1gksrG4sA=;
        b=bi7VaxN6DhwhtQXB/TUpFTkTl/gRFZNdenaA1nos0nIyhzVvWqdrCXIf8JnqyCM+54
         zliSb7mshRlVtYLM3aNiPlxjGICBivz6AQG8HZzoD6qQJZY9QM1mhXmWtzXnze0RSSuo
         Q2U76NLVfTSFoeKq9o+l7B2HYlFJraukN68XFfwK63rAz4MqdHeGba4JPQqSNbyblkHt
         ibC0/HTZ/Zq/o4uoN+6bNaC8E2IoFXTAxcfrRxjm/hZS8nglIdQST/Ku1DCclKsiskNZ
         dPeqiDTYFI6AQ+YAGDCD9NpepafmJbljY0upahkUafdVxgsKPT5h2TiqaEYXOiKT1mey
         Rqaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691131260; x=1691736060;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uTvrtGm9omTNndYE3JOrnTDMBnw5b0qfWu1gksrG4sA=;
        b=aZ9IHvrCOslWZ8ZCdBus560gWS357C2XxIT047L+FJGm2+3GO3WfO5VaTasZbv2AVp
         qREYVMd/znl/rk1kmnVECxBRq0HWxQHn6sb0wubPW6TGhzYV7jgJTEsZqv9qukb/caFW
         UvioPew6YiUHGv+gPahiW9mYhzfRN65RFXQvZGi/LZR08EshchI/FFdrNEviW2bOmdJe
         4Kt1vlm80dAkTTWdYXwmyo7/gsBAix72tcoVjX08iQ/DmUwPBtSJi8TopyQUZYmgVqCD
         9g2DmKuN8wuiVe8Mov6xVGoAxeZzboDl7mQCtORtJRLcmBiu/8+CsG4SU44wYYEiLiUR
         ZuLg==
X-Gm-Message-State: AOJu0YyE+/sLvM/eeqbxtmY24LX4x6tbF0QHp8aWGuFnIT2nYSExJfNa
	g26tNVQZOSR1L2EBAu08oYU4
X-Google-Smtp-Source: AGHT+IHc+yUaZUEKBeCJBB+ETgv1hAlQDqN5i4J03Rw8pg812GZIs+szUUub60VQdRC6HXKVjM+SNQ==
X-Received: by 2002:a17:902:b70e:b0:1b8:a812:7bc2 with SMTP id d14-20020a170902b70e00b001b8a8127bc2mr745947pls.8.1691131260198;
        Thu, 03 Aug 2023 23:41:00 -0700 (PDT)
Received: from thinkpad ([103.28.246.156])
        by smtp.gmail.com with ESMTPSA id j3-20020a170902c3c300b001b9cf6342e2sm936473plj.42.2023.08.03.23.40.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Aug 2023 23:40:59 -0700 (PDT)
Date: Fri, 4 Aug 2023 12:10:56 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Kalle Valo <kvalo@kernel.org>
Cc: mhi@lists.linux.dev, ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org
Subject: Re: [PATCH v4 1/3] bus: mhi: host: allow MHI client drivers to
 provide the firmware via a pointer
Message-ID: <20230804064056.GA24883@thinkpad>
References: <20230727100430.3603551-1-kvalo@kernel.org>
 <20230727100430.3603551-2-kvalo@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230727100430.3603551-2-kvalo@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230803_234102_202230_566F387F 
X-CRM114-Status: GOOD (  28.74  )
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

T24gVGh1LCBKdWwgMjcsIDIwMjMgYXQgMDE6MDQ6MjhQTSArMDMwMCwgS2FsbGUgVmFsbyB3cm90
ZToKPiBGcm9tOiBLYWxsZSBWYWxvIDxxdWljX2t2YWxvQHF1aWNpbmMuY29tPgo+IAo+IEN1cnJl
bnRseSBNSEkgbG9hZHMgdGhlIGZpcm13YXJlIGltYWdlIGZyb20gdGhlIHBhdGggcHJvdmlkZWQg
YnkgY2xpZW50Cj4gZGV2aWNlcy4gYXRoMTFrIG5lZWRzIHRvIHN1cHBvcnQgZmlybXdhcmUgaW1h
Z2UgZW1iZWRkZWQgYWxvbmcgd2l0aCBtZXRhIGRhdGEKPiAobmFtZWQgYXMgZmlybXdhcmUtMi5i
aW4pLiBTbyBhbGxvdyB0aGUgY2xpZW50IGRyaXZlciB0byByZXF1ZXN0IHRoZSBmaXJtd2FyZQo+
IGZpbGUgZnJvbSB1c2VyIHNwYWNlIG9uIGl0J3Mgb3duIGFuZCBwcm92aWRlIHRoZSBmaXJtd2Fy
ZSBpbWFnZSBkYXRhIGFuZCBzaXplCj4gdG8gTUhJIHZpYSBhIHBvaW50ZXIgc3RydWN0IG1oaV9j
b250cm9sbGVyOjpmd19kYXRhLgo+IAo+IFRoaXMgaXMgYW4gb3B0aW9uYWwgZmVhdHVyZSwgaWYg
ZndfZGF0YSBpcyBOVUxMIE1ISSBsb2FkIHRoZSBmaXJtd2FyZSB1c2luZyB0aGUKPiBuYW1lIGZy
b20gc3RydWN0IG1oaV9jb250cm9sbGVyOjpmd19pbWFnZSBzdHJpbmcgYXMgYmVmb3JlLgo+IAo+
IFRlc3RlZCB3aXRoIGF0aDExayBhbmQgV0NONjg1NSBodzIuMC4KPiAKPiBTaWduZWQtb2ZmLWJ5
OiBLYWxsZSBWYWxvIDxxdWljX2t2YWxvQHF1aWNpbmMuY29tPgoKQXBwbGllZCB0byBtaGktbmV4
dCEKCi0gTWFuaQoKPiAtLS0KPiAgZHJpdmVycy9idXMvbWhpL2hvc3QvYm9vdC5jIHwgMzQgKysr
KysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLQo+ICBpbmNsdWRlL2xpbnV4L21oaS5oICAg
ICAgICAgfCAgNiArKysrKysKPiAgMiBmaWxlcyBjaGFuZ2VkLCAzMSBpbnNlcnRpb25zKCspLCA5
IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2J1cy9taGkvaG9zdC9ib290
LmMgYi9kcml2ZXJzL2J1cy9taGkvaG9zdC9ib290LmMKPiBpbmRleCBkMmExOWIwN2NjYjguLmVk
YzBlYzVhMDkzMyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2J1cy9taGkvaG9zdC9ib290LmMKPiAr
KysgYi9kcml2ZXJzL2J1cy9taGkvaG9zdC9ib290LmMKPiBAQCAtMzY1LDEyICszNjUsMTAgQEAg
aW50IG1oaV9hbGxvY19iaGllX3RhYmxlKHN0cnVjdCBtaGlfY29udHJvbGxlciAqbWhpX2NudHJs
LAo+ICB9Cj4gIAo+ICBzdGF0aWMgdm9pZCBtaGlfZmlybXdhcmVfY29weShzdHJ1Y3QgbWhpX2Nv
bnRyb2xsZXIgKm1oaV9jbnRybCwKPiAtCQkJICAgICAgY29uc3Qgc3RydWN0IGZpcm13YXJlICpm
aXJtd2FyZSwKPiArCQkJICAgICAgY29uc3QgdTggKmJ1Ziwgc2l6ZV90IHJlbWFpbmRlciwKPiAg
CQkJICAgICAgc3RydWN0IGltYWdlX2luZm8gKmltZ19pbmZvKQo+ICB7Cj4gLQlzaXplX3QgcmVt
YWluZGVyID0gZmlybXdhcmUtPnNpemU7Cj4gIAlzaXplX3QgdG9fY3B5Owo+IC0JY29uc3QgdTgg
KmJ1ZiA9IGZpcm13YXJlLT5kYXRhOwo+ICAJc3RydWN0IG1oaV9idWYgKm1oaV9idWYgPSBpbWdf
aW5mby0+bWhpX2J1ZjsKPiAgCXN0cnVjdCBiaGlfdmVjX2VudHJ5ICpiaGlfdmVjID0gaW1nX2lu
Zm8tPmJoaV92ZWM7Cj4gIAo+IEBAIC0zOTMsOSArMzkxLDEwIEBAIHZvaWQgbWhpX2Z3X2xvYWRf
aGFuZGxlcihzdHJ1Y3QgbWhpX2NvbnRyb2xsZXIgKm1oaV9jbnRybCkKPiAgCXN0cnVjdCBkZXZp
Y2UgKmRldiA9ICZtaGlfY250cmwtPm1oaV9kZXYtPmRldjsKPiAgCWVudW0gbWhpX3BtX3N0YXRl
IG5ld19zdGF0ZTsKPiAgCWNvbnN0IGNoYXIgKmZ3X25hbWU7Cj4gKwljb25zdCB1OCAqZndfZGF0
YTsKPiAgCXZvaWQgKmJ1ZjsKPiAgCWRtYV9hZGRyX3QgZG1hX2FkZHI7Cj4gLQlzaXplX3Qgc2l6
ZTsKPiArCXNpemVfdCBzaXplLCBmd19zejsKPiAgCWludCBpLCByZXQ7Cj4gIAo+ICAJaWYgKE1I
SV9QTV9JTl9FUlJPUl9TVEFURShtaGlfY250cmwtPnBtX3N0YXRlKSkgewo+IEBAIC00MjUsNiAr
NDI0LDIwIEBAIHZvaWQgbWhpX2Z3X2xvYWRfaGFuZGxlcihzdHJ1Y3QgbWhpX2NvbnRyb2xsZXIg
Km1oaV9jbnRybCkKPiAgCWZ3X25hbWUgPSAobWhpX2NudHJsLT5lZSA9PSBNSElfRUVfRURMKSA/
Cj4gIAkJbWhpX2NudHJsLT5lZGxfaW1hZ2UgOiBtaGlfY250cmwtPmZ3X2ltYWdlOwo+ICAKPiAr
CS8qIGNoZWNrIGlmIHRoZSBkcml2ZXIgaGFzIGFscmVhZHkgcHJvdmlkZWQgdGhlIGZpcm13YXJl
IGRhdGEgKi8KPiArCWlmICghZndfbmFtZSAmJiBtaGlfY250cmwtPmZiY19kb3dubG9hZCAmJgo+
ICsJICAgIG1oaV9jbnRybC0+ZndfZGF0YSAmJiBtaGlfY250cmwtPmZ3X3N6KSB7Cj4gKwkJaWYg
KCFtaGlfY250cmwtPnNibF9zaXplKSB7Cj4gKwkJCWRldl9lcnIoZGV2LCAiZndfZGF0YSBwcm92
aWRlZCBidXQgbm8gc2JsX3NpemVcbiIpOwo+ICsJCQlnb3RvIGVycm9yX2Z3X2xvYWQ7Cj4gKwkJ
fQo+ICsKPiArCQlzaXplID0gbWhpX2NudHJsLT5zYmxfc2l6ZTsKPiArCQlmd19kYXRhID0gbWhp
X2NudHJsLT5md19kYXRhOwo+ICsJCWZ3X3N6ID0gbWhpX2NudHJsLT5md19zejsKPiArCQlnb3Rv
IHNraXBfcmVxX2Z3Owo+ICsJfQo+ICsKPiAgCWlmICghZndfbmFtZSB8fCAobWhpX2NudHJsLT5m
YmNfZG93bmxvYWQgJiYgKCFtaGlfY250cmwtPnNibF9zaXplIHx8Cj4gIAkJCQkJCSAgICAgIW1o
aV9jbnRybC0+c2VnX2xlbikpKSB7Cj4gIAkJZGV2X2VycihkZXYsCj4gQEAgLTQ0NCw2ICs0NTcs
MTAgQEAgdm9pZCBtaGlfZndfbG9hZF9oYW5kbGVyKHN0cnVjdCBtaGlfY29udHJvbGxlciAqbWhp
X2NudHJsKQo+ICAJaWYgKHNpemUgPiBmaXJtd2FyZS0+c2l6ZSkKPiAgCQlzaXplID0gZmlybXdh
cmUtPnNpemU7Cj4gIAo+ICsJZndfZGF0YSA9IGZpcm13YXJlLT5kYXRhOwo+ICsJZndfc3ogPSBm
aXJtd2FyZS0+c2l6ZTsKPiArCj4gK3NraXBfcmVxX2Z3Ogo+ICAJYnVmID0gZG1hX2FsbG9jX2Nv
aGVyZW50KG1oaV9jbnRybC0+Y250cmxfZGV2LCBzaXplLCAmZG1hX2FkZHIsCj4gIAkJCQkgR0ZQ
X0tFUk5FTCk7Cj4gIAlpZiAoIWJ1Zikgewo+IEBAIC00NTIsNyArNDY5LDcgQEAgdm9pZCBtaGlf
ZndfbG9hZF9oYW5kbGVyKHN0cnVjdCBtaGlfY29udHJvbGxlciAqbWhpX2NudHJsKQo+ICAJfQo+
ICAKPiAgCS8qIERvd25sb2FkIGltYWdlIHVzaW5nIEJISSAqLwo+IC0JbWVtY3B5KGJ1ZiwgZmly
bXdhcmUtPmRhdGEsIHNpemUpOwo+ICsJbWVtY3B5KGJ1ZiwgZndfZGF0YSwgc2l6ZSk7Cj4gIAly
ZXQgPSBtaGlfZndfbG9hZF9iaGkobWhpX2NudHJsLCBkbWFfYWRkciwgc2l6ZSk7Cj4gIAlkbWFf
ZnJlZV9jb2hlcmVudChtaGlfY250cmwtPmNudHJsX2Rldiwgc2l6ZSwgYnVmLCBkbWFfYWRkcik7
Cj4gIAo+IEBAIC00NjQsNyArNDgxLDcgQEAgdm9pZCBtaGlfZndfbG9hZF9oYW5kbGVyKHN0cnVj
dCBtaGlfY29udHJvbGxlciAqbWhpX2NudHJsKQo+ICAJfQo+ICAKPiAgCS8qIFdhaXQgZm9yIHJl
YWR5IHNpbmNlIEVETCBpbWFnZSB3YXMgbG9hZGVkICovCj4gLQlpZiAoZndfbmFtZSA9PSBtaGlf
Y250cmwtPmVkbF9pbWFnZSkgewo+ICsJaWYgKGZ3X25hbWUgJiYgZndfbmFtZSA9PSBtaGlfY250
cmwtPmVkbF9pbWFnZSkgewo+ICAJCXJlbGVhc2VfZmlybXdhcmUoZmlybXdhcmUpOwo+ICAJCWdv
dG8gZndfbG9hZF9yZWFkeV9zdGF0ZTsKPiAgCX0KPiBAQCAtNDc4LDE1ICs0OTUsMTQgQEAgdm9p
ZCBtaGlfZndfbG9hZF9oYW5kbGVyKHN0cnVjdCBtaGlfY29udHJvbGxlciAqbWhpX2NudHJsKQo+
ICAJICogZGV2aWNlIHRyYW5zaXRpb25pbmcgaW50byBNSEkgUkVBRFkgc3RhdGUKPiAgCSAqLwo+
ICAJaWYgKG1oaV9jbnRybC0+ZmJjX2Rvd25sb2FkKSB7Cj4gLQkJcmV0ID0gbWhpX2FsbG9jX2Jo
aWVfdGFibGUobWhpX2NudHJsLCAmbWhpX2NudHJsLT5mYmNfaW1hZ2UsCj4gLQkJCQkJICAgZmly
bXdhcmUtPnNpemUpOwo+ICsJCXJldCA9IG1oaV9hbGxvY19iaGllX3RhYmxlKG1oaV9jbnRybCwg
Jm1oaV9jbnRybC0+ZmJjX2ltYWdlLCBmd19zeik7Cj4gIAkJaWYgKHJldCkgewo+ICAJCQlyZWxl
YXNlX2Zpcm13YXJlKGZpcm13YXJlKTsKPiAgCQkJZ290byBlcnJvcl9md19sb2FkOwo+ICAJCX0K
PiAgCj4gIAkJLyogTG9hZCB0aGUgZmlybXdhcmUgaW50byBCSElFIHZlYyB0YWJsZSAqLwo+IC0J
CW1oaV9maXJtd2FyZV9jb3B5KG1oaV9jbnRybCwgZmlybXdhcmUsIG1oaV9jbnRybC0+ZmJjX2lt
YWdlKTsKPiArCQltaGlfZmlybXdhcmVfY29weShtaGlfY250cmwsIGZ3X2RhdGEsIGZ3X3N6LCBt
aGlfY250cmwtPmZiY19pbWFnZSk7Cj4gIAl9Cj4gIAo+ICAJcmVsZWFzZV9maXJtd2FyZShmaXJt
d2FyZSk7Cj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvbWhpLmggYi9pbmNsdWRlL2xpbnV4
L21oaS5oCj4gaW5kZXggZjZkZTRiNmVjZmM3Li4wMzk5NDNlYzRkNGUgMTAwNjQ0Cj4gLS0tIGEv
aW5jbHVkZS9saW51eC9taGkuaAo+ICsrKyBiL2luY2x1ZGUvbGludXgvbWhpLmgKPiBAQCAtMjk5
LDYgKzI5OSwxMCBAQCBzdHJ1Y3QgbWhpX2NvbnRyb2xsZXJfY29uZmlnIHsKPiAgICogQGlvdmFf
c3RhcnQ6IElPTU1VIHN0YXJ0aW5nIGFkZHJlc3MgZm9yIGRhdGEgKHJlcXVpcmVkKQo+ICAgKiBA
aW92YV9zdG9wOiBJT01NVSBzdG9wIGFkZHJlc3MgZm9yIGRhdGEgKHJlcXVpcmVkKQo+ICAgKiBA
ZndfaW1hZ2U6IEZpcm13YXJlIGltYWdlIG5hbWUgZm9yIG5vcm1hbCBib290aW5nIChvcHRpb25h
bCkKPiArICogQGZ3X2RhdGE6IEZpcm13YXJlIGltYWdlIGRhdGEgY29udGVudCBmb3Igbm9ybWFs
IGJvb3RpbmcsIHVzZWQgb25seQo+ICsgKiAgICAgICAgICAgaWYgZndfaW1hZ2UgaXMgTlVMTCBh
bmQgZmJjX2Rvd25sb2FkIGlzIHRydWUgKG9wdGlvbmFsKQo+ICsgKiBAZndfc3o6IEZpcm13YXJl
IGltYWdlIGRhdGEgc2l6ZSBmb3Igbm9ybWFsIGJvb3RpbmcsIHVzZWQgb25seSBpZiBmd19pbWFn
ZQo+ICsgKiAgICAgICAgIGlzIE5VTEwgYW5kIGZiY19kb3dubG9hZCBpcyB0cnVlIChvcHRpb25h
bCkKPiAgICogQGVkbF9pbWFnZTogRmlybXdhcmUgaW1hZ2UgbmFtZSBmb3IgZW1lcmdlbmN5IGRv
d25sb2FkIG1vZGUgKG9wdGlvbmFsKQo+ICAgKiBAcmRkbV9zaXplOiBSQU0gZHVtcCBzaXplIHRo
YXQgaG9zdCBzaG91bGQgYWxsb2NhdGUgZm9yIGRlYnVnZ2luZyBwdXJwb3NlCj4gICAqIEBzYmxf
c2l6ZTogU0JMIGltYWdlIHNpemUgZG93bmxvYWRlZCB0aHJvdWdoIEJISWUgKG9wdGlvbmFsKQo+
IEBAIC0zODQsNiArMzg4LDggQEAgc3RydWN0IG1oaV9jb250cm9sbGVyIHsKPiAgCWRtYV9hZGRy
X3QgaW92YV9zdGFydDsKPiAgCWRtYV9hZGRyX3QgaW92YV9zdG9wOwo+ICAJY29uc3QgY2hhciAq
ZndfaW1hZ2U7Cj4gKwljb25zdCB1OCAqZndfZGF0YTsKPiArCXNpemVfdCBmd19zejsKPiAgCWNv
bnN0IGNoYXIgKmVkbF9pbWFnZTsKPiAgCXNpemVfdCByZGRtX3NpemU7Cj4gIAlzaXplX3Qgc2Js
X3NpemU7Cj4gLS0gCj4gMi4zOS4yCj4gCj4gCgotLSAK4K6u4K6j4K6/4K614K6j4K+N4K6j4K6p
4K+NIOCumuCupOCuvuCumuCuv+CuteCuruCvjQoKLS0gCmF0aDExayBtYWlsaW5nIGxpc3QKYXRo
MTFrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9hdGgxMWsK
