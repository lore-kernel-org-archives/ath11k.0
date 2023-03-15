Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC109C61DA4
	for <ath11k@archiver.kernel.org>; Wed, 15 Mar 2023 08:18:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8GpWWhlKYkmSIr0IPHCXkL7Hc1UwAyQZK2EUt/h9Oqo=; b=jZWi6uz4Q6Bb3c
	s302KHoVHW8lBWmvZew7/y72Bu0Nd0Tq3t5MExcZqnYjoCGQ2d1Lwq8/VTgi1AXwQ7CvxukrcdBnF
	LnTLQSVPzxEt1F8EwqbmgPYdRZMUFpsgxVHV22PgGsA6iMAv000cf7zd0irKH6T4lyB0MeMwLG8So
	OMlWQQOvttqxV+2BywGdrFA5kRTcVU5cB4zlcAlbReAPsVlRiN6Sax9Yakgaszpe5iTp4k/ECEiJS
	Ai4bw7Cjqs+iRD8iduGj1gotwvCkfKbL0IJW1QbV9mJViqwCM7qK1Bx1raNlLGd+slqHJ/1EznfTT
	0kHSO5cKPcPUMXXjMDuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pcMLB-00Clqp-1f;
	Wed, 15 Mar 2023 08:18:33 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pcML8-00ClpY-28
	for ath11k@lists.infradead.org;
	Wed, 15 Mar 2023 08:18:32 +0000
Received: by mail-pj1-x1030.google.com with SMTP id p13-20020a17090a284d00b0023d2e945aebso2948988pjf.0
        for <ath11k@lists.infradead.org>; Wed, 15 Mar 2023 01:18:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678868307;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vLfoTlbAo5jcQ6X2/SF0xxvTQO4Wt5qY3k91cC+sQqw=;
        b=B5a0eNeX40LWPowEKVW/CluA5to6/jpRTgi/jhL/2R0tt+l/NxJmJorqsKCvsSXjBY
         OOZW+9YWYzU1Gs+yqeRVpblxh8+13Yfb3NkRdsBGXSS2DBvpfc0+TI0kJG0OcFWRSCFS
         E9ohaHCOyFlNYtygRmShZWEUfO3q0SJGHhkAyelZe6nbkeda5Phlhf6PvTo9unLHv2L0
         zdYKYhCGif0BwYj36Z9r7axxO2gyUkVy13V+8oUUQvgrNiTuOB4h/hg1dIXOCq0jAU1N
         oEF+ueFxH9ZY4CUkEUWIVRrpVtbdbqBgFBDK+T/fDhzKcjJtKH2BwWOaP88tkYrQ8fDE
         q+4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678868307;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vLfoTlbAo5jcQ6X2/SF0xxvTQO4Wt5qY3k91cC+sQqw=;
        b=0yYYq6rccJt51XNsiIOQsrYnh3gDsKQqMzA3n+y76CAEikIzZPuTsVYM3t/64KID3L
         1M8JrkRJYcVR0HrZ2B4mj0jGh+tDXiXvHDfzMuuNsOsQOYFAHGDH/p68tfi7vgpVkjRx
         vLhGWDOjAr2dVLH6QjSc4mBmFGc0shUket3ROU3AwVF5wXZyImbPRiL819PxoEB4aJaT
         v6QOjYebOoZLuq7yoiAYZvf0+t2bdRIggFfODldmOMkkj4ZKnQ98eJRdwgDn9BC97uC3
         2wlLYxlhhkaIJtLYxUWV+xeRDx2QsWdPA3yMR4lEuTl+v1adEbXljMUGm+xkzTxvhsdr
         VnqA==
X-Gm-Message-State: AO0yUKVcOIAYbeCvMDI1vANC0/wOLaV+YYRBRkA6dgOQqsz0UzSntIqz
	rnfI+SYx5QZ555I+7GfeoN1m
X-Google-Smtp-Source: AK7set9nq0rU9SIcIZvJnGD3+aES4Bd8l19cmFTdbVWu5f5V8XZe07f2/PJcfSHIS1E+7Gn+w9O1jA==
X-Received: by 2002:a17:90a:cb8e:b0:23d:35cf:44be with SMTP id a14-20020a17090acb8e00b0023d35cf44bemr5027663pju.6.1678868307439;
        Wed, 15 Mar 2023 01:18:27 -0700 (PDT)
Received: from thinkpad ([117.217.182.35])
        by smtp.gmail.com with ESMTPSA id o10-20020a17090a678a00b00230b8402760sm759365pjj.38.2023.03.15.01.18.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Mar 2023 01:18:26 -0700 (PDT)
Date: Wed, 15 Mar 2023 13:48:20 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Kalle Valo <kvalo@kernel.org>
Cc: mhi@lists.linux.dev, ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org
Subject: Re: [PATCH v2 1/3] mhi: allow MHI client drivers to provide the
 firmware via a pointer
Message-ID: <20230315081820.GD25575@thinkpad>
References: <20230308152522.6728-1-kvalo@kernel.org>
 <20230308152522.6728-2-kvalo@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230308152522.6728-2-kvalo@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230315_011830_728044_74EBB80C 
X-CRM114-Status: GOOD (  29.48  )
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

T24gV2VkLCBNYXIgMDgsIDIwMjMgYXQgMDU6MjU6MjBQTSArMDIwMCwgS2FsbGUgVmFsbyB3cm90
ZToKPiBGcm9tOiBLYWxsZSBWYWxvIDxxdWljX2t2YWxvQHF1aWNpbmMuY29tPgo+IAoKU3ViamVj
dCBwcmVmaXggc2hvdWxkIGJlOiAiYnVzOiBtaGk6IGhvc3Q6IC4uLiIKCj4gQ3VycmVudGx5IE1I
SSBsb2FkcyB0aGUgZmlybXdhcmUgaW1hZ2UgZnJvbSB0aGUgcGF0aCBwcm92aWRlZCBieSBjbGll
bnQKPiBkZXZpY2VzLiBhdGgxMWsgbmVlZHMgdG8gc3VwcG9ydCBmaXJtd2FyZSBpbWFnZSBlbWJl
ZGRlZCBhbG9uZyB3aXRoIG1ldGEgZGF0YQo+IChuYW1lZCBhcyBmaXJtd2FyZS0yLmJpbikuIFNv
IGFsbG93IHRoZSBjbGllbnQgZHJpdmVyIHRvIHJlcXVlc3QgdGhlIGZpcm13YXJlCj4gZmlsZSBm
cm9tIHVzZXIgc3BhY2Ugb24gaXQncyBvd24gYW5kIHByb3ZpZGUgdGhlIGZpcm13YXJlIGltYWdl
IGRhdGEgYW5kIHNpemUKPiB0byBNSEkgdmlhIGEgcG9pbnRlciBzdHJ1Y3QgbWhpX2NvbnRyb2xs
ZXI6OmZ3X2RhdGEuCj4gCj4gVGhpcyBpcyBhbiBvcHRpb25hbCBmZWF0dXJlLCBpZiBmd19kYXRh
IGlzIE5VTEwgTUhJIGxvYWQgdGhlIGZpcm13YXJlIHVzaW5nIHRoZQo+IG5hbWUgZnJvbSBzdHJ1
Y3QgbWhpX2NvbnRyb2xsZXI6OmZ3X2ltYWdlIHN0cmluZyBhcyBiZWZvcmUuCj4gCj4gVGVzdGVk
IHdpdGggYXRoMTFrIGFuZCBXQ042ODU1IGh3Mi4wLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEthbGxl
IFZhbG8gPHF1aWNfa3ZhbG9AcXVpY2luYy5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvYnVzL21oaS9o
b3N0L2Jvb3QuYyB8IDI4ICsrKysrKysrKysrKysrKysrKystLS0tLS0tLS0KPiAgaW5jbHVkZS9s
aW51eC9taGkuaCAgICAgICAgIHwgIDYgKysrKysrCj4gIDIgZmlsZXMgY2hhbmdlZCwgMjUgaW5z
ZXJ0aW9ucygrKSwgOSBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9idXMv
bWhpL2hvc3QvYm9vdC5jIGIvZHJpdmVycy9idXMvbWhpL2hvc3QvYm9vdC5jCj4gaW5kZXggMWM2
OWZlZWUxNzAzLi41ZTZlMWUzNDAwNTcgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9idXMvbWhpL2hv
c3QvYm9vdC5jCj4gKysrIGIvZHJpdmVycy9idXMvbWhpL2hvc3QvYm9vdC5jCj4gQEAgLTM2NSwx
MiArMzY1LDEwIEBAIGludCBtaGlfYWxsb2NfYmhpZV90YWJsZShzdHJ1Y3QgbWhpX2NvbnRyb2xs
ZXIgKm1oaV9jbnRybCwKPiAgfQo+ICAKPiAgc3RhdGljIHZvaWQgbWhpX2Zpcm13YXJlX2NvcHko
c3RydWN0IG1oaV9jb250cm9sbGVyICptaGlfY250cmwsCj4gLQkJCSAgICAgIGNvbnN0IHN0cnVj
dCBmaXJtd2FyZSAqZmlybXdhcmUsCj4gKwkJCSAgICAgIGNvbnN0IHU4ICpidWYsIHNpemVfdCBy
ZW1haW5kZXIsCj4gIAkJCSAgICAgIHN0cnVjdCBpbWFnZV9pbmZvICppbWdfaW5mbykKPiAgewo+
IC0Jc2l6ZV90IHJlbWFpbmRlciA9IGZpcm13YXJlLT5zaXplOwo+ICAJc2l6ZV90IHRvX2NweTsK
PiAtCWNvbnN0IHU4ICpidWYgPSBmaXJtd2FyZS0+ZGF0YTsKPiAgCXN0cnVjdCBtaGlfYnVmICpt
aGlfYnVmID0gaW1nX2luZm8tPm1oaV9idWY7Cj4gIAlzdHJ1Y3QgYmhpX3ZlY19lbnRyeSAqYmhp
X3ZlYyA9IGltZ19pbmZvLT5iaGlfdmVjOwo+ICAKPiBAQCAtMzkyLDkgKzM5MCwxMCBAQCB2b2lk
IG1oaV9md19sb2FkX2hhbmRsZXIoc3RydWN0IG1oaV9jb250cm9sbGVyICptaGlfY250cmwpCj4g
IAljb25zdCBzdHJ1Y3QgZmlybXdhcmUgKmZpcm13YXJlID0gTlVMTDsKPiAgCXN0cnVjdCBkZXZp
Y2UgKmRldiA9ICZtaGlfY250cmwtPm1oaV9kZXYtPmRldjsKPiAgCWNvbnN0IGNoYXIgKmZ3X25h
bWU7Cj4gKwljb25zdCB1OCAqZndfZGF0YTsKPiAgCXZvaWQgKmJ1ZjsKPiAgCWRtYV9hZGRyX3Qg
ZG1hX2FkZHI7Cj4gLQlzaXplX3Qgc2l6ZTsKPiArCXNpemVfdCBzaXplLCBmd19zejsKPiAgCWlu
dCBpLCByZXQ7Cj4gIAo+ICAJaWYgKE1ISV9QTV9JTl9FUlJPUl9TVEFURShtaGlfY250cmwtPnBt
X3N0YXRlKSkgewo+IEBAIC00MjQsNiArNDIzLDE0IEBAIHZvaWQgbWhpX2Z3X2xvYWRfaGFuZGxl
cihzdHJ1Y3QgbWhpX2NvbnRyb2xsZXIgKm1oaV9jbnRybCkKPiAgCWZ3X25hbWUgPSAobWhpX2Nu
dHJsLT5lZSA9PSBNSElfRUVfRURMKSA/Cj4gIAkJbWhpX2NudHJsLT5lZGxfaW1hZ2UgOiBtaGlf
Y250cmwtPmZ3X2ltYWdlOwo+ICAKCkNhbiB5b3UgcGxlYXNlIGFkZCBhIGNvbW1lbnQgaGVyZT8K
Cj4gKwlpZiAoIWZ3X25hbWUgJiYgbWhpX2NudHJsLT5mYmNfZG93bmxvYWQgJiYKPiArCSAgICBt
aGlfY250cmwtPmZ3X2RhdGEgJiYgbWhpX2NudHJsLT5md19zeikgewo+ICsJCXNpemUgPSBtaGlf
Y250cmwtPnNibF9zaXplOwoKRG9uJ3QgeW91IG5lZWQgdG8gdmFsaWRhdGUgc2JsX3NpemU/Cgo+
ICsJCWZ3X2RhdGEgPSBtaGlfY250cmwtPmZ3X2RhdGE7Cj4gKwkJZndfc3ogPSBtaGlfY250cmwt
PmZ3X3N6Owo+ICsJCWdvdG8gc2tpcF9yZXFfZnc7Cj4gKwl9Cj4gKwo+ICAJaWYgKCFmd19uYW1l
IHx8IChtaGlfY250cmwtPmZiY19kb3dubG9hZCAmJiAoIW1oaV9jbnRybC0+c2JsX3NpemUgfHwK
PiAgCQkJCQkJICAgICAhbWhpX2NudHJsLT5zZWdfbGVuKSkpIHsKPiAgCQlkZXZfZXJyKGRldiwK
PiBAQCAtNDQzLDYgKzQ1MCwxMCBAQCB2b2lkIG1oaV9md19sb2FkX2hhbmRsZXIoc3RydWN0IG1o
aV9jb250cm9sbGVyICptaGlfY250cmwpCj4gIAlpZiAoc2l6ZSA+IGZpcm13YXJlLT5zaXplKQo+
ICAJCXNpemUgPSBmaXJtd2FyZS0+c2l6ZTsKPiAgCj4gKwlmd19kYXRhID0gZmlybXdhcmUtPmRh
dGE7Cj4gKwlmd19zeiA9IGZpcm13YXJlLT5zaXplOwo+ICsKPiArc2tpcF9yZXFfZnc6Cj4gIAli
dWYgPSBkbWFfYWxsb2NfY29oZXJlbnQobWhpX2NudHJsLT5jbnRybF9kZXYsIHNpemUsICZkbWFf
YWRkciwKPiAgCQkJCSBHRlBfS0VSTkVMKTsKPiAgCWlmICghYnVmKSB7Cj4gQEAgLTQ1MSw3ICs0
NjIsNyBAQCB2b2lkIG1oaV9md19sb2FkX2hhbmRsZXIoc3RydWN0IG1oaV9jb250cm9sbGVyICpt
aGlfY250cmwpCj4gIAl9Cj4gIAo+ICAJLyogRG93bmxvYWQgaW1hZ2UgdXNpbmcgQkhJICovCj4g
LQltZW1jcHkoYnVmLCBmaXJtd2FyZS0+ZGF0YSwgc2l6ZSk7Cj4gKwltZW1jcHkoYnVmLCBmd19k
YXRhLCBzaXplKTsKPiAgCXJldCA9IG1oaV9md19sb2FkX2JoaShtaGlfY250cmwsIGRtYV9hZGRy
LCBzaXplKTsKPiAgCWRtYV9mcmVlX2NvaGVyZW50KG1oaV9jbnRybC0+Y250cmxfZGV2LCBzaXpl
LCBidWYsIGRtYV9hZGRyKTsKPiAgCj4gQEAgLTQ2Myw3ICs0NzQsNyBAQCB2b2lkIG1oaV9md19s
b2FkX2hhbmRsZXIoc3RydWN0IG1oaV9jb250cm9sbGVyICptaGlfY250cmwpCj4gIAl9Cj4gIAo+
ICAJLyogV2FpdCBmb3IgcmVhZHkgc2luY2UgRURMIGltYWdlIHdhcyBsb2FkZWQgKi8KPiAtCWlm
IChmd19uYW1lID09IG1oaV9jbnRybC0+ZWRsX2ltYWdlKSB7Cj4gKwlpZiAoZndfbmFtZSAmJiBm
d19uYW1lID09IG1oaV9jbnRybC0+ZWRsX2ltYWdlKSB7Cj4gIAkJcmVsZWFzZV9maXJtd2FyZShm
aXJtd2FyZSk7Cj4gIAkJZ290byBmd19sb2FkX3JlYWR5X3N0YXRlOwo+ICAJfQo+IEBAIC00Nzcs
MTUgKzQ4OCwxNCBAQCB2b2lkIG1oaV9md19sb2FkX2hhbmRsZXIoc3RydWN0IG1oaV9jb250cm9s
bGVyICptaGlfY250cmwpCj4gIAkgKiBkZXZpY2UgdHJhbnNpdGlvbmluZyBpbnRvIE1ISSBSRUFE
WSBzdGF0ZQo+ICAJICovCj4gIAlpZiAobWhpX2NudHJsLT5mYmNfZG93bmxvYWQpIHsKPiAtCQly
ZXQgPSBtaGlfYWxsb2NfYmhpZV90YWJsZShtaGlfY250cmwsICZtaGlfY250cmwtPmZiY19pbWFn
ZSwKPiAtCQkJCQkgICBmaXJtd2FyZS0+c2l6ZSk7Cj4gKwkJcmV0ID0gbWhpX2FsbG9jX2JoaWVf
dGFibGUobWhpX2NudHJsLCAmbWhpX2NudHJsLT5mYmNfaW1hZ2UsIGZ3X3N6KTsKPiAgCQlpZiAo
cmV0KSB7Cj4gIAkJCXJlbGVhc2VfZmlybXdhcmUoZmlybXdhcmUpOwo+ICAJCQlnb3RvIGVycm9y
X2Z3X2xvYWQ7Cj4gIAkJfQo+ICAKPiAgCQkvKiBMb2FkIHRoZSBmaXJtd2FyZSBpbnRvIEJISUUg
dmVjIHRhYmxlICovCj4gLQkJbWhpX2Zpcm13YXJlX2NvcHkobWhpX2NudHJsLCBmaXJtd2FyZSwg
bWhpX2NudHJsLT5mYmNfaW1hZ2UpOwo+ICsJCW1oaV9maXJtd2FyZV9jb3B5KG1oaV9jbnRybCwg
ZndfZGF0YSwgZndfc3osIG1oaV9jbnRybC0+ZmJjX2ltYWdlKTsKPiAgCX0KPiAgCj4gIAlyZWxl
YXNlX2Zpcm13YXJlKGZpcm13YXJlKTsKPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9taGku
aCBiL2luY2x1ZGUvbGludXgvbWhpLmgKPiBpbmRleCBhNTQ0MWFkMzNjNzQuLjcyZWVmNzMwOTcz
NiAxMDA2NDQKPiAtLS0gYS9pbmNsdWRlL2xpbnV4L21oaS5oCj4gKysrIGIvaW5jbHVkZS9saW51
eC9taGkuaAo+IEBAIC0yOTksNiArMjk5LDEwIEBAIHN0cnVjdCBtaGlfY29udHJvbGxlcl9jb25m
aWcgewo+ICAgKiBAaW92YV9zdGFydDogSU9NTVUgc3RhcnRpbmcgYWRkcmVzcyBmb3IgZGF0YSAo
cmVxdWlyZWQpCj4gICAqIEBpb3ZhX3N0b3A6IElPTU1VIHN0b3AgYWRkcmVzcyBmb3IgZGF0YSAo
cmVxdWlyZWQpCj4gICAqIEBmd19pbWFnZTogRmlybXdhcmUgaW1hZ2UgbmFtZSBmb3Igbm9ybWFs
IGJvb3RpbmcgKG9wdGlvbmFsKQo+ICsgKiBAZndfZGF0YTogRmlybXdhcmUgaW1hZ2UgZGF0YSBj
b250ZW50IGZvciBub3JtYWwgYm9vdGluZywgdXNlZCBvbmx5Cj4gKyAqICAgICAgICAgICBpZiBm
d19pbWFnZSBpcyBOVUxMIChvcHRpb25hbCkKPiArICogQGZ3X3N6OiBGaXJtd2FyZSBpbWFnZSBk
YXRhIHNpemUgZm9yIG5vcm1hbCBib290aW5nLCB1c2VkIG9ubHkgaWYgZndfaW1hZ2UKPiArICog
ICAgICAgICBpcyBOVUxMIGFuZCBmYmNfZG93bmxvYWQgaXMgdHJ1ZSAob3B0aW9uYWwpCj4gICAq
IEBlZGxfaW1hZ2U6IEZpcm13YXJlIGltYWdlIG5hbWUgZm9yIGVtZXJnZW5jeSBkb3dubG9hZCBt
b2RlIChvcHRpb25hbCkKPiAgICogQHJkZG1fc2l6ZTogUkFNIGR1bXAgc2l6ZSB0aGF0IGhvc3Qg
c2hvdWxkIGFsbG9jYXRlIGZvciBkZWJ1Z2dpbmcgcHVycG9zZQo+ICAgKiBAc2JsX3NpemU6IFNC
TCBpbWFnZSBzaXplIGRvd25sb2FkZWQgdGhyb3VnaCBCSEllIChvcHRpb25hbCkKPiBAQCAtMzg0
LDYgKzM4OCw4IEBAIHN0cnVjdCBtaGlfY29udHJvbGxlciB7Cj4gIAlkbWFfYWRkcl90IGlvdmFf
c3RhcnQ7Cj4gIAlkbWFfYWRkcl90IGlvdmFfc3RvcDsKPiAgCWNvbnN0IGNoYXIgKmZ3X2ltYWdl
Owo+ICsJY29uc3QgdTggKmZ3X2RhdGE7Cj4gKwlzaXplX3QgZndfc3o7CgpFdmVuIHRob3VnaCB0
aGVzZSBtZW1iZXJzIGFyZSBub3QgY3JlYXRpbmcgaG9sZXMgbm93LCBzaHVmZmxpbmcgdGhlIGRh
dGF0eXBlcwp3aWxsIGNyZWF0ZSBob2xlcyBpbiB0aGUgZnV0dXJlLiBTbyBJIGFsd2F5cyBwcmVm
ZXIgdG8ga2VlcCB0aGUgc3RydWN0IG1lbWJlcnMKc29ydGVkIGluIHRoZSBiZWxvdyBvcmRlcjoK
CnBvaW50ZXIKc3RydWN0L3VuaW9uCnU2NAp1MzIKdTE2CnU4CmJvb2wKClRoYW5rcywKTWFuaQoK
PiAgCWNvbnN0IGNoYXIgKmVkbF9pbWFnZTsKPiAgCXNpemVfdCByZGRtX3NpemU7Cj4gIAlzaXpl
X3Qgc2JsX3NpemU7Cj4gLS0gCj4gMi4zMC4yCj4gCj4gCgotLSAK4K6u4K6j4K6/4K614K6j4K+N
4K6j4K6p4K+NIOCumuCupOCuvuCumuCuv+CuteCuruCvjQoKLS0gCmF0aDExayBtYWlsaW5nIGxp
c3QKYXRoMTFrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9hdGgxMWsK
