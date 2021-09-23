Return-Path: <SRS0=q7Iz=ON=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A691DC433F5
	for <ath11k@archiver.kernel.org>; Thu, 23 Sep 2021 10:45:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 71535610A0
	for <ath11k@archiver.kernel.org>; Thu, 23 Sep 2021 10:45:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 71535610A0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=baXkQTx2fXp5g5YKl3m/GNYoppUoJyHuBO93cS+0p2I=; b=vqrMcaSuEsLulw
	v2sqpFzDctiXlhJXI/W3PHiiz6G7R65sf/y03CkWMfnUJTH/uEZvTga7WN4+5o1pybOkKtZaNEtLJ
	pb8Ba8fDQOjtScctAzsGkMFeubutV8rwAwhde84K0TXxHBxW8WeJRirXju//mKAgd6n6uJENsAYuP
	OysbEUtboomJRyaEN3aK+QWT0adopfkFhuXevLElSZ2dWoqbthU35y0Omoj1cwgQyrkxeC1TZasVb
	Kd8b8ph40tX8vuK/3AnKAxLOFaShjysHDzyuDmi55zrSdakeKApseyi6bzc9911KzBbo3rRiJ+ix3
	4EBlsHIRSfOFusBmfEFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mTMDw-00AyvK-9o; Thu, 23 Sep 2021 10:45:04 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mTM90-00Awe4-U1
 for ath11k@lists.infradead.org; Thu, 23 Sep 2021 10:40:00 +0000
Received: by mail-pj1-x1035.google.com with SMTP id t20so4128824pju.5
 for <ath11k@lists.infradead.org>; Thu, 23 Sep 2021 03:39:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=0l5Qjk10ns9RTcZCx62S0Ghtn1+O62O0rQJz+8Rhm0I=;
 b=n8Wqw2WAmNvR3Tfi0IN+hvY9FiUzaOcCcnnXcLK89WtSIR7TucrqCxR1kymTRGKzwU
 2lTZq5gtLAKlj0ciNizxwCSSFk5at9MDpjkx7Zix2Wa70HQjvjPKCaiNqDykmbEoH+0V
 IFOyuUukiqSdgrTjdg5IWPbFKSQ9W6cyN4e8+E4K/su0afRI2cG12hJwBSKbkVlH/luA
 xC/qtUiLMECJ+SayzxbbsghqViDuQL2G7P/zthFDVFRmsOBAMDOQXUWKleB7Cgz9AnLm
 OO587hdDoTtG1l4kyieL5kdJFDw37yZx5NO2SV7BHVc7DxaXCx2jf6CJWV259SyveSK6
 WMLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=0l5Qjk10ns9RTcZCx62S0Ghtn1+O62O0rQJz+8Rhm0I=;
 b=mI1hUWhFmFIfpoSjEkQ3M1FglF5Q1X7VW+XMKasKfoN0X2pcOtJoXD65Enqtsh/BgL
 oCP9yv85HufA4tew5zci3QkZ7Wa+m2F7X+NkxZmxMCFMHtVUg6L7V23lYNW8bc/pRivT
 y9htu3N+58v49MFKipcJeSQ9x/9c0GwnRCsYuaO6J69VtJP1o2w6a6M3Cg/fKQZed6V1
 CWeyBDjdji968kE6tBWcBtwurEkWbO1PNc3grI6hPbtrqcsgpt61ZjoCO+ncXrNpUsVr
 DVyf0p+8fOSSCxaqBMd5+dtqeB+7c6mJwROQiu3ta06Z3Ejm/4W/jmoUzNeMTNSRFzT+
 werQ==
X-Gm-Message-State: AOAM530Rdd4yxV0/MghCrL7QqY1ZaHPivJ6+d0Wi7KtZl0ay6uqOb6o8
 IueF9Cw94ysi/SO1QYrEhM4xmXmnKTvP40x5maFbP7yEFoJlCA==
X-Google-Smtp-Source: ABdhPJzkbgNlQdn54hfS6ArGL5SRw53Cv7Fuq/8iSKoYVDZpajH5rCyoTEjEMX9HaJM31dUcaJsRWZRXBwZKT3o3JOw=
X-Received: by 2002:a17:90b:4a88:: with SMTP id
 lp8mr4495426pjb.159.1632393597263; 
 Thu, 23 Sep 2021 03:39:57 -0700 (PDT)
MIME-Version: 1.0
References: <871r5p0x2u.fsf@codeaurora.org>
 <CAMZdPi8UJLvBFQd8-nf-iHAQh8cEuihq97PUFfZ7Q=rxRQoPsg@mail.gmail.com>
 <20210916111218.GA12918@thinkpad>
 <CAMZdPi94607mZorp+Zmkw3seWXak6p9Jr05CQ5hhfgKQoG8n7Q@mail.gmail.com>
 <20210916163529.GA9027@thinkpad> <87k0jgxyjp.fsf@codeaurora.org>
 <20210916171927.GB9027@thinkpad>
 <b7c0906041dcafb43be215bd4f55326a@codeaurora.org>
 <20210923085926.GD6083@thinkpad>
 <6912b6840858c0554922c01a0f9c47b8@codeaurora.org>
In-Reply-To: <6912b6840858c0554922c01a0f9c47b8@codeaurora.org>
From: Loic Poulain <loic.poulain@linaro.org>
Date: Thu, 23 Sep 2021 12:50:08 +0200
Message-ID: <CAMZdPi-3WOj_TT7diUJJ00RaoHgKw-tu-heQJu6vDUK1yZ4CZg@mail.gmail.com>
Subject: Re: [regression] mhi: ath11k resume fails on some devices
To: Carl Huang <cjhuang@codeaurora.org>, Kalle Valo <kvalo@codeaurora.org>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 ath11k@lists.infradead.org, 
 linux-arm-msm <linux-arm-msm@vger.kernel.org>, linux-wireless@vger.kernel.org, 
 regressions@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210923_033959_021982_0A553967 
X-CRM114-Status: GOOD (  28.94  )
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

SGkgQ2FybCBhbmQgS2FsbGUsCgpPbiBUaHUsIDIzIFNlcHQgMjAyMSBhdCAxMToyNiwgQ2FybCBI
dWFuZyA8Y2podWFuZ0Bjb2RlYXVyb3JhLm9yZz4gd3JvdGU6Cj4KPiBPbiAyMDIxLTA5LTIzIDE2
OjU5LCBNYW5pdmFubmFuIFNhZGhhc2l2YW0gd3JvdGU6Cj4gPiBPbiBUaHUsIFNlcCAyMywgMjAy
MSBhdCAwNDozNDo0M1BNICswODAwLCBDYXJsIEh1YW5nIHdyb3RlOgo+ID4+IE9uIDIwMjEtMDkt
MTcgMDE6MTksIE1hbml2YW5uYW4gU2FkaGFzaXZhbSB3cm90ZToKPiA+PiA+IE9uIFRodSwgU2Vw
IDE2LCAyMDIxIGF0IDA3OjQyOjAyUE0gKzAzMDAsIEthbGxlIFZhbG8gd3JvdGU6Cj4gPj4gPiA+
IE1hbml2YW5uYW4gU2FkaGFzaXZhbSA8bWFuaXZhbm5hbi5zYWRoYXNpdmFtQGxpbmFyby5vcmc+
IHdyaXRlczoKPiA+PiA+ID4KPiA+PiA+ID4gPiBPbiBUaHUsIFNlcCAxNiwgMjAyMSBhdCAwMTox
ODoyMlBNICswMjAwLCBMb2ljIFBvdWxhaW4gd3JvdGU6Cj4gPj4gPiA+ID4+IExlIGpldS4gMTYg
c2VwdC4gMjAyMSDDoCAxMzoxMiwgTWFuaXZhbm5hbiBTYWRoYXNpdmFtIDwKPiA+PiA+ID4gPj4g
bWFuaXZhbm5hbi5zYWRoYXNpdmFtQGxpbmFyby5vcmc+IGEgw6ljcml0IDoKPiA+PiA+ID4gPj4K
PiA+PiA+ID4gPgo+ID4+ID4gPiA+IFsuLi5dCj4gPj4gPiA+ID4KPiA+PiA+ID4gPj4gPiBJZiB0
aGluZ3Mgc2VlbXMgdG8gd29yayBmaW5lIHdpdGhvdXQgdGhhdCBwYXRjaCwgdGhlbiBpdCBpbXBs
aWVzIHRoYXQKPiA+PiA+ID4gPj4gPiBzZXR0aW5nIE0wCj4gPj4gPiA+ID4+ID4gc3RhdGUgd29y
a3MgZHVyaW5nIHJlc3VtZS4gSSB0aGluayB3ZSBzaG91bGQganVzdCByZXZlcnQgdGhhdCBwYXRj
aC4KPiA+PiA+ID4gPj4gPgo+ID4+ID4gPiA+PiA+IExvaWMsIGRpZCB0aGF0IHBhdGNoIGZpeCBh
bnkgaXNzdWUgZm9yIHlvdSBvciBpdCB3YXMgYSBjb3NtZXRpYyBmaXggb25seT8KPiA+PiA+ID4g
Pj4KPiA+PiA+ID4gPj4KPiA+PiA+ID4gPj4gSXQgZml4ZXMgc2R4IG1vZGVtIHJlc3VtaW5nIGlz
c3VlLCB3aXRob3V0IHRoYXQgd2UgZG9u4oCZdCBrbm93IG1vZGVtIG5lZWRzCj4gPj4gPiA+ID4+
IHRvIGJlIHJlaW5pdGlhbGl6ZWQuCj4gPj4gPiA+ID4+Cj4gPj4gPiA+ID4KPiA+PiA+ID4gPiBP
a2F5LiBUaGVuIGluIHRoYXQgY2FzZSwgdGhlIHJlY292ZXJ5IG1lY2hhbmlzbSBoYXMgdG8gYmUg
YWRkZWQgdG8gdGhlIGF0aDExawo+ID4+ID4gPiA+IE1ISSBjb250cm9sbGVyLgo+ID4+ID4gPgo+
ID4+ID4gPiBXaGF0IGRvZXMgdGhhdCBtZWFuIGluIHByYWN0aXNlLCBkbyB5b3UgaGF2ZSBhbnkg
cG9pbnRlcnMgb3IKPiA+PiA+ID4gZXhhbXBsZXM/IEkKPiA+PiA+ID4gaGF2ZSBubyBjbHVlIHdo
YXQgeW91IGFyZSBwcm9wb3NpbmcgOikKPiA+PiA+ID4KPiA+PiA+Cj4gPj4gPiBUYWtlIGEgbG9v
ayBhdCB0aGUgbWhpX3BjaV9yZWNvdmVyeV93b3JrKCkgZnVuY3Rpb24gYmVsb3c6Cj4gPj4gPiBo
dHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC90b3J2YWxkcy9s
aW51eC5naXQvdHJlZS9kcml2ZXJzL2J1cy9taGkvcGNpX2dlbmVyaWMuYyNuNjEwCj4gPj4gPgo+
ID4+ID4gWW91IG5lZWQgdG8gaW1wbGVtZW50IHNvbWV0aGluZyBzaW1pbGFyIHRoYXQgYmFzaWNh
bGx5IHBvd2VycyB1cCB0aGUgTUhJCj4gPj4gPiBlbmRwb2ludCAoUUNBNjM5MCkgaW4gY2FzZSBw
bV9yZXN1bWUoKSBmYWlscy4gQXQgbWluaW11bSwgeW91IG5lZWQgdG8KPiA+PiA+IGNhbGwKPiA+
PiA+IGJlbG93IGZ1bmN0aW9uczoKPiA+PiA+Cj4gPj4gPiAjIENoZWNrIGlmIHRoZSBkZXZpY2Ug
aXMgcG93ZXJlZCBvbi4gSWYgeWVzLCB0aGVuIHBvd2VyIGl0IGRvd24gdG8gYnJpbmcKPiA+PiA+
IGl0IGJhY2sKPiA+PiA+IG1oaV9wb3dlcl9kb3duKCkKPiA+PiA+IG1oaV91bnByZXBhcmVfYWZ0
ZXJfcG93ZXJfZG93bigpCj4gPj4gPgo+ID4+ID4gIyBQb3dlciB1cCB0aGUgZGV2aWNlCj4gPj4g
PiBtaGlfcHJlcGFyZV9mb3JfcG93ZXJfdXAoKQo+ID4+ID4gbWhpX3N5bmNfcG93ZXJfdXAoKQo+
ID4+ID4KPiA+PiA+IFRoaXMgaW1wbGllcyB0aGF0IHRoZSBXTEFOIGRldmljZSBoYXMgYmVlbiBw
b3dlcmVkIG9mZiBkdXJpbmcgc3VzcGVuZCwKPiA+PiA+IHNvIHRoZQo+ID4+ID4gcmVzdW1lIGZh
aWxzIGFuZCB3ZSBhcmUgYnJpbmdpbmcgdGhlIGRldmljZSBiYWNrIHRvIHdvcmtpbmcgc3RhdGUu
Cj4gPj4gPgo+ID4+IFRoaXMgaXMgZmluZSBmb3IgcGxhdGZvcm0gd2hpY2ggZG9lc24ndCBwcm92
aWRlIHBvd2VyIHN1cHBseSBkdXJpbmcKPiA+PiBzdXNwZW5kLgo+ID4+IEJ1dCBOVUMgaGFzIHBv
d2VyIHN1cHBseSBpbiBzdXNwZW5kIHN0YXRlLgo+ID4KPiA+IElmIE5VQyByZXRhaW5zIHBvd2Vy
IHN1cHBseSBkdXJpbmcgc3VzcGVuZCB0aGVuIGl0IHNob3VsZCB3b3JrIHdpdGgKPiA+IHRoYXQg
Y29tbWl0Lgo+ID4gRHVyaW5nIHJlc3VtZSwgdGhlIGRldmljZSBpcyBleHBlY3RlZCB0byBiZSBp
biBNMyBzdGF0ZSBhbmQgdGhhdCdzIHdoYXQKPiA+IHRoZQo+ID4gY29tbWl0IHZlcmlmaWVzLgo+
ID4KPiA+IElmIHRoZSBkZXZpY2UgaXMgaW4gYSBkaWZmZXJlbnQgc3RhdGUsIHRoZW4gbW9zdCBs
aWtlbHkgdGhlIGRldmljZSBoYXZlCj4gPiBwb3dlcgo+ID4gY3ljbGVkLgo+ID4KPiBCdXQgdGhl
IHRyaWNreSB0aGluZyBoZXJlIGlzIHRoYXQgdXBzdHJlYW0gUUNBNjM5MCBkb2Vzbid0IGhhdmUg
cmVjb3ZlcnkKPiBtZWNoYW5pc20gdG8gZG93bmxvYWQKPiBmaXJtd2FyZSBhZ2Fpbiwgc28gUUNB
NjM5MCBoYXMgbm8gd2F5IHRvIHdvcmsgYWZ0ZXIgYSBwb3dlciBjeWNsZS4KCk1heWJlIGEgc2lt
cGxlIHF1aWNrLWZpeCB3b3VsZCBiZSB0byBhZGQgYSAnZm9yY2UnIHBhcmFtZXRlciB0byB0aGUK
bWhpIHJlc3VtZSBmdW5jdGlvbiBhbmQgZGlzY2FyZCBzdGF0ZSB0ZXN0aW5nIGluIGNhc2UgaXQg
aXMgZm9yY2VkLAp0aGF0IHdvdWxkIGFsbG93IGJvdGggYXRoMTFrIGFuZCBtb2RlbSB0byB3b3Jr
IGZvciBub3cuIFRoZW4KaW52ZXN0aWdhdGluZyB3aGF0IGhhcHBlbnMgb24gYXRoMTFrIHNpZGUu
CgpUaG91Z2h0cz8KClJlZ2FyZHMsCkxvaWMKCi0tIAphdGgxMWsgbWFpbGluZyBsaXN0CmF0aDEx
a0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vYXRoMTFrCg==
