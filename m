Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A46E2C433EF
	for <ath11k@archiver.kernel.org>; Mon, 16 May 2022 16:05:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k4WMnPZsK6zhp3NjT+fCb9chU9dHkD8wkhnuhpsXCp0=; b=ux0K7eKFiOyjmm
	besP2fqf40BHoG1JX8KIh9pb4ZGxPRvZXYFjObHD6nktcz1xT24dyTBIGmRUc8i1/1tiZNAQuhZH0
	gVi2ySWwQjkr5GRCJwcH2hc0RDY5kafsY6O+PV4u8wzffBjiw8g6CZNt8yCVRJvkjrCDez1dTgor6
	vsn5giUkXih3hs3Pm4sbMH3S4020Ba1yC9IUxISdQPvI/7nLA75IIUkY+fIK3AazWTTvh5370SCY1
	niuiqpRfAtJ+vZgJ86xiQarCKG9CWObRQYYhR8uSf2ejPwF1XohTEHn/Fsl7v2IalSQRyWZiAkc9O
	IR/93Tg9UWbYV7gJSQoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nqdEJ-008qEL-Ad; Mon, 16 May 2022 16:05:55 +0000
Received: from mail-qt1-x831.google.com ([2607:f8b0:4864:20::831])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nqdDs-008pzg-9O
 for ath11k@lists.infradead.org; Mon, 16 May 2022 16:05:30 +0000
Received: by mail-qt1-x831.google.com with SMTP id h3so12419935qtn.4
 for <ath11k@lists.infradead.org>; Mon, 16 May 2022 09:05:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=31EDCvuGSrVMybrirvtMgqohy3uIOUlnRMDtiOinc1Q=;
 b=iv8/rHdJ63o6e63cZmjh62qX82W39f+nlhTVE9WmHZ3Zxi7U7fzwLOKHMG1xztjUPh
 zboDx4dAcdkmrGvKT7sAii6GaeUBTE3BWEuh2HN+SZLbMFOHv1pPSWrP5iUGVW52cLEV
 es1MUsmW+ZAhy+/nuCu36xb9WrjC1mVCOmhmsciJlqDSuNu06j7Ok7aygpJX260xdzP0
 Z2OjrvkKkVEmz7d0lY0Vp1zPmEduodMBSxAhXdRNlPojXwjftDn43/FaQK960LQmrzEN
 JvfKgLIhjlls2ojGPmxtXvwzHN5iA3VOz0u/l6/8rj/XIhmThmwjNNFzFcilQH4VV0lC
 2sAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=31EDCvuGSrVMybrirvtMgqohy3uIOUlnRMDtiOinc1Q=;
 b=aXB/bkmPinliLoeywzMF/YGe7JI/d5O1WJkWgBR4lGPNl7xowYY+qzy0vsGRZxg6ro
 EutwqXjerU2o4bVuonsBiNaSW0GHBLjI7m1o/HRDqH84AgGuTjdcSHGA3Jp9PX8J5d9X
 UOc6cGG/+d8KZIr7GfHRijg8swz/6s2eywghK6pCuL2MNm/d+aQAr7GJtUtugNDIpplm
 yv3UXF4+bwMDVgAzC5N+rzoTaZHhprGMu9uUYbSdHYeviaN9eayRGyM6NSal02SQv9yw
 FqT6gkKgKscvwovk3PIgpE9SECV0H4x9ArKoHC225goVZWYHXfSI23TO66CSLJWdiWdN
 RZsA==
X-Gm-Message-State: AOAM530JU+kZcFcCaehsROlmTvmFAn+jMGHrPObppPqKwu34gbH5eACC
 FO4m1/qQDerzOpKmOqU97a8ZXkT6Lkq6qrk8uJsxpgC2NFgnyA==
X-Google-Smtp-Source: ABdhPJwPsPSwLLQpK2PjppoPR+u6kd5OfPKTgxbjiZ59wvYiBRdr6schVgElFpDJ16zrazWLnvhkMp/pTwRa4YqK3JU=
X-Received: by 2002:ac8:5e54:0:b0:2f3:f4ee:efbd with SMTP id
 i20-20020ac85e54000000b002f3f4eeefbdmr15803348qtx.295.1652717126384; Mon, 16
 May 2022 09:05:26 -0700 (PDT)
MIME-Version: 1.0
References: <a1657ff0-198c-14f9-3b2b-d7ab06cfc8e6@linaro.org>
 <87v8ua624n.fsf@kernel.org> <08d0ec20-f9ae-c546-becb-a77404e91a9a@linaro.org>
 <87sfp94ooj.fsf@kernel.org>
In-Reply-To: <87sfp94ooj.fsf@kernel.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 16 May 2022 19:05:15 +0300
Message-ID: <CAA8EJpq1FySTU2Hr4G5OLocejzNZF1hDzyqTHV4e+R0duf2cJw@mail.gmail.com>
Subject: Re: WCN6855 issues with latest linux-firmware
To: Kalle Valo <kvalo@kernel.org>
Cc: "ath11k@lists.infradead.org" <ath11k@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220516_090528_377354_1BC76EC2 
X-CRM114-Status: GOOD (  21.90  )
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

T24gTW9uLCAxNiBNYXkgMjAyMiBhdCAxNjowMSwgS2FsbGUgVmFsbyA8a3ZhbG9Aa2VybmVsLm9y
Zz4gd3JvdGU6Cj4KPiBEbWl0cnkgQmFyeXNoa292IDxkbWl0cnkuYmFyeXNoa292QGxpbmFyby5v
cmc+IHdyaXRlczoKPgo+ID4gT24gMTIvMDUvMjAyMiAyMToyMywgS2FsbGUgVmFsbyB3cm90ZToK
PiA+PiBEbWl0cnkgQmFyeXNoa292IDxkbWl0cnkuYmFyeXNoa292QGxpbmFyby5vcmc+IHdyaXRl
czoKPiA+Pgo+ID4+PiBUaGUgd2NuNjg1NSBXaUZpIGNoaXAgc3RvcHBlZCB3b3JraW5nIGZvciBt
ZSBhZnRlciBhbiB1cGRhdGUgdG8gdGhlCj4gPj4+IGxhdGVzdCBsaW51eC1maXJtd2FyZSAoTGlu
dXggNS4xOC1yYzIpLiBJIGNhbiByZXByb2R1Y2UgaXQgd2l0aCBib3RoCj4gPj4+IGh3Mi4wIGFu
ZCBodzIuMSBjaGlwcy4KPiA+Pj4KPiA+Pj4gSGVyZSBpcyB0aGUgc2V0IG9mIGtlcm5lbCBtZXNz
YWdlcyBJJ20gZ2V0dGluZyBmcm9tIGF0aDExa19wY2kgZHJpdmVyOgo+ID4+Pgo+ID4+PiBbICAg
IDQuNDIyMzkxXSBhdGgxMWtfcGNpIDAwMDA6MDE6MDAuMDogQWRkaW5nIHRvIGlvbW11IGdyb3Vw
IDMKPiA+Pj4gWyAgICA0LjQyOTU3MV0gYXRoMTFrX3BjaSAwMDAwOjAxOjAwLjA6IEJBUiAwOiBh
c3NpZ25lZCBbbWVtCj4gPj4+IDB4NjA0MDAwMDAtMHg2MDVmZmZmZiA2NGJpdF0KPiA+Pj4gWyAg
ICA0LjQzNzg1N10gYXRoMTFrX3BjaSAwMDAwOjAxOjAwLjA6IGVuYWJsaW5nIGRldmljZSAoMDAw
MCAtPiAwMDAyKQo+ID4+PiBbICAgIDQuNDQ1MzIzXSBhdGgxMWtfcGNpIDAwMDA6MDE6MDAuMDog
TVNJIHZlY3RvcnM6IDEKPiA+Pj4gWyAgICA0LjQ1MDM3NV0gYXRoMTFrX3BjaSAwMDAwOjAxOjAw
LjA6IHdjbjY4NTUgaHcyLjAKPiA+Pj4gWyAgICA1LjM3ODQ4OF0gYXRoMTFrX3BjaSAwMDAwOjAx
OjAwLjA6IGNoaXBfaWQgMHgyIGNoaXBfZmFtaWx5IDB4Ygo+ID4+PiBib2FyZF9pZCAweDhjIHNv
Y19pZCAweDQwMGMwMjAwCj4gPj4+IFsgICAgNS4zOTI4OThdIGF0aDExa19wY2kgMDAwMDowMTow
MC4wOiBmd192ZXJzaW9uIDB4MTEwZjBjMzUKPiA+Pj4gZndfYnVpbGRfdGltZXN0YW1wIDIwMjIt
MDMtMzAgMDk6MDUgZndfYnVpbGRfaWQKPiA+Pj4gUUNfSU1BR0VfVkVSU0lPTl9TVFJJTkc9V0xB
Ti5IU1AuMS4xLTAzMTI1LVFDQUhTUFNXUExfVjFfVjJfU0lMSUNPTlpfTElURS0zLjY1MTAuNwo+
ID4+PiBbICAgIDUuNDIwNjQ4XSBhdGgxMWtfcGNpIDAwMDA6MDE6MDAuMDogZmFpbGVkIHRvIGZl
dGNoIGJvYXJkIGRhdGEgZm9yCj4gPj4+IGJ1cz1wY2ksdmVuZG9yPTE3Y2IsZGV2aWNlPTExMDMs
c3Vic3lzdGVtLXZlbmRvcj0xN2NiLHN1YnN5c3RlbS1kZXZpY2U9MDEwOCxxbWktY2hpcC1pZD0y
LHFtaS1ib2FyZC1pZD0xNDAKPiA+Pj4gZnJvbSBhdGgxMWsvV0NONjg1NS9odzIuMC9ib2FyZC0y
LmJpbgo+ID4+PiBbICAgMTUuNjg2Mzk4XSBhdGgxMWtfcGNpIDAwMDA6MDE6MDAuMDogZmFpbGVk
IHRvIHdhaXQgYm9hcmQgZmlsZQo+ID4+PiBkb3dubG9hZCByZXF1ZXN0OiAtMTEwCj4gPj4+IFsg
ICAxNS42OTQ1MzBdIGF0aDExa19wY2kgMDAwMDowMTowMC4wOiBxbWkgZmFpbGVkIHRvIGxvYWQg
YmRmIGZpbGUKPiA+Pj4gWyAgIDE1LjcwMDc4NF0gYXRoMTFrX3BjaSAwMDAwOjAxOjAwLjA6IGZh
aWxlZCB0byBsb2FkIGJvYXJkIGRhdGEgZmlsZTogLTExMAo+ID4+Cj4gPj4gV2hhdCBXQ042ODU1
IGhhcmR3YXJlIGFyZSB5b3UgZXhhY3RseSB1c2luZz8gKG1ha2UsIG1vZGVsIGV0YykKPiA+Cj4g
PiBJIGhhdmUgYXNrZWQgZm9yIHRoZSBodyBkZXRhaWxzLiBUaGUgdXNlciBndWlkZSBmb3IgdGhl
IEhESzg0NTAgbGlzdHMKPiA+IFdDTjY4NTYgY2hpcCBhbmQgYWxzbyBtZW50aW9ucyAnUXVhbGNv
bW3CriBGYXN0Q29ubmVjdOKEoiA2OTAwIFN5c3RlbXMnLgo+Cj4gU28gdGhlIGNoaXAgd2FzIGlu
Y2x1ZGVkIHdpdGhpbiBIREs4NDUwPyBJdCB3YXMgbm90IGluc3RhbGxlZCB0byB0aGUKPiBib2Fy
ZCBzZXBhcmF0ZWx5IG9yIGFueXRoaW5nIGxpa2UgdGhhdD8KClllcywgaXQncyB0aGUgaW5jbHVk
ZWQgY2hpcC4KCj4KPiA+PiBBbmQgd2hhdAo+ID4+IGJvYXJkIGZpbGUgYXJlIHlvdSB1c2luZz8g
bWQ1c3VtcyBvZiBhbGwgZmlybXdhcmUgZmlsZXMgaXMgdGhlIGJlc3QuCj4gPgo+ID4gIyBtZDVz
dW0gL2xpYi9maXJtd2FyZS9hdGgxMWsvV0NONjg1NS9odzIuMS8qCj4gPiA0NjBmYmQ1ZGRjNTdi
M2QyZWZiZjFjYTk3NmY3OGI5MAo+ID4gL2xpYi9maXJtd2FyZS9hdGgxMWsvV0NONjg1NS9odzIu
MS9hbXNzLmJpbgo+ID4gODhiM2E0ZmJkZThjYWI0NDkzZjAwNjBhZTNiNWRlZTMKPiA+IC9saWIv
ZmlybXdhcmUvYXRoMTFrL1dDTjY4NTUvaHcyLjEvYm9hcmQtMi5iaW4KPiA+IDdmZDFjMjMzN2Iw
YjY1MDI1ODhkMzE0MWUyMDVlNzM1Cj4gPiAvbGliL2Zpcm13YXJlL2F0aDExay9XQ042ODU1L2h3
Mi4xL2JvYXJkLmJpbgo+ID4gZDE0NjBmYzFjNDU5NWQwZDIyZjgyZDViYWVhYWJiZDggIC9saWIv
ZmlybXdhcmUvYXRoMTFrL1dDTjY4NTUvaHcyLjEvbTMuYmluCj4gPiBmNjdiZTgzNjU5Yzc5MGZl
MTVkMWU0MmFmNTAxZTlmYQo+ID4gL2xpYi9maXJtd2FyZS9hdGgxMWsvV0NONjg1NS9odzIuMS9y
ZWdkYi5iaW4KPgo+IFNvIHlvdSBhcmUgdXNpbmcgYSBzZXBhcmF0ZSBib2FyZC5iaW4gZmlsZSwg
d2hlcmUgZGlkIHlvdSBnZXQgaXQ/IGF0aDExawo+IGJvYXJkIGZpbGVzIGFyZSBkaWZmZXJlbnQg
c28geW91IGNhbm5vdCB0YWtlIHRoZSBib2FyZCBmaWxlIGZyb20KPiBlbHNld2hlcmUuCgpUaGUg
Ym9hcmQgZmlsZSBjb21lcyB0b2dldGhlciB3aXRoIHRoZSBib2FyZCwgYXMgYSBidW5jaApiZHds
YW4uZSovYmR3bGFuZy5lKiBmaWxlcyBvbiB0aGUgbW9kZW0gcGFydGl0aW9uLgpJIHdhcyB1c2lu
ZyB0aGUgb25lIGNvcnJlc3BvbmRpbmcgdG8gdGhlIGJvYXJkIGlkLgoKQnV0IG5vdGUsIHRoYXQg
dGhlIGRyaXZlciByZXBvcnRzIHRoYXQgaXQgZGlkIG5vdCBnZXQgdGhlICdmYWlsZWQgdG8Kd2Fp
dCBib2FyZCBmaWxlIGRvd25sb2FkIHJlcXVlc3QnLiBTbywgaXQgd291bGQgYmUgZ29vZCB0byBn
ZXQgdGhlCmJvYXJkIGZpbGUgaW50byB0aGUgYm9hcmQtMi5iaW4sIGJ1dCBmb3IgbWUgaXQgbG9v
a3MgbGlrZSBhIHNlcGFyYXRlCnN0b3J5LgoKPiBDYW4geW91IGZpbGUgdGhpcyB0byBidWd6aWxs
YToKPgo+IGh0dHBzOi8vd2lyZWxlc3Mud2lraS5rZXJuZWwub3JnL2VuL3VzZXJzL2RyaXZlcnMv
YXRoMTFrL2J1Z3JlcG9ydAo+Cj4gVGhhdCB3YXkgaXQncyBlYXNpZXIgdG8gdHJhY2sgYW5kIEkg
Y2FuIHRyeSB0byBmaW5kIHRoZSBjb3JyZWN0IGJvYXJkCj4gZmlsZS4KCkRvbmU6IGh0dHBzOi8v
YnVnemlsbGEua2VybmVsLm9yZy9zaG93X2J1Zy5jZ2k/aWQ9MjE1OTg3CgotLSAKV2l0aCBiZXN0
IHdpc2hlcwpEbWl0cnkKCi0tIAphdGgxMWsgbWFpbGluZyBsaXN0CmF0aDExa0BsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vYXRo
MTFrCg==
