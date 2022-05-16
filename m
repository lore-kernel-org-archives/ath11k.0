Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 725EAC4332F
	for <ath11k@archiver.kernel.org>; Mon, 16 May 2022 16:28:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3j48KhD5YqlSD6R5M/Gq+fIqEea/94pQxUTNgytKAvo=; b=k0KCXQCbsuSWD+
	NdDdOIuRzcPHGUveff1lIPqasLHPEAZSaM64f/NLIsJnz0A5ItLHhWN3SdPHROmHK6Lvt7lFtGzFF
	KElNaiRTO5lkrv0Sj2e1mmkUKMd/oVvkDIevMNd/ITaLKMJfm2vySQ6+c3w7KWEpM+lDrUZnXyvvb
	a3qbdqGJJ/W+b68JE1D2veLHhkwPwrF6nI1ruYxMcIiTVQNXEVOt4iqxci4ZIEMqfrQLfObAN4VI8
	mVmvWsj51j958M7Z5T8kkHh4m1OMI2DwmnYZESpfCduHbVpxCMIEOQEDz64bppfguXy526rUUqm0j
	TMEgaMa6Rpd07ZsD2S+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nqdaV-008zX4-MV; Mon, 16 May 2022 16:28:51 +0000
Received: from mail-qt1-x82c.google.com ([2607:f8b0:4864:20::82c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nqdaR-008zUD-Jw
 for ath11k@lists.infradead.org; Mon, 16 May 2022 16:28:49 +0000
Received: by mail-qt1-x82c.google.com with SMTP id k2so12472334qtp.1
 for <ath11k@lists.infradead.org>; Mon, 16 May 2022 09:28:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ExqDegCgIODPIpUBeSdEFNDR4pcOAwO1cg27g0/gj7k=;
 b=BI/DuqlM/1b2TDVXbHN63tu2lPGbl9yFqwqYuAJ/i8wiyazGLuYEzn3EZBkY40ck/4
 +E1GIhH3BzzGVY6ID7AwIJyxmghlmqSzD7dB2EVs2kOsRaxEkoapuFRUbGlk19AGjSSB
 Nq+HD9Smp5nptLiiqzZ2TpgsXAFxvOSN4qJjJzRqOpTB3PVl3G/5+I73aVhKGn8p19d/
 OP1d0CGrmpYjbJKDReyGMoRcptSwrWtQRXBN515eqEkY/WrIiIuBixH35pFN8Rf2gMNk
 wDaLiFd3OupUehdL2RxHSRpxXQteKnd2YylHOl0wIrPvnII5SaXI4e/fycnurPsbByqd
 mrQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ExqDegCgIODPIpUBeSdEFNDR4pcOAwO1cg27g0/gj7k=;
 b=1v/gIQE+0S6IvT+/oAVBYDQsBr5Bpflx2yZKDA3M3p+oDwzehRRGtdSBtRHtdpz2Br
 Dyzlh/RXrXNu6x8JY9Fc5egdTDiIC/kqbvZ15Y7/My1gqGhAof5EY7RHi3jn6AmdgGAX
 ZwYktA9PChdxXLQA5l9ftE17mAlHz9qEkvCX7eCthwZNG8ZPAOXtRbgkXAG0SBQT0TAn
 xkC9opJcSCXSAMTMfsbzBS1O75ywJtL8ii/YNoaTqXjkaTO0sEdBkSAghvEjawTvxYVv
 r9Pq8/UtdEtx6SlAa0PunNwUmuWEldRwCG9Q68qI7Vktv3tgqvEe3zo8d+llaUg5N4LD
 drUQ==
X-Gm-Message-State: AOAM5336uDddq+WbuOiQypOOQ3dK7E1lMY8f35uoeCxxy60tvj8svNCM
 ppkdB8cSMZzBFEOFu9l+xI+a33TWmWHKqRkWUEa5aQIRGlkwdA==
X-Google-Smtp-Source: ABdhPJw5YDzd90LptTDrxekDGzOOifHvNdgVFJAMSf5W7w6CFN8DF/WlcnGGtEytm1fZC2pIJ3DmWlHVD80hUiqjuH0=
X-Received: by 2002:a05:622a:4f:b0:2f3:e77c:2c7e with SMTP id
 y15-20020a05622a004f00b002f3e77c2c7emr16051439qtw.62.1652718525573; Mon, 16
 May 2022 09:28:45 -0700 (PDT)
MIME-Version: 1.0
References: <a1657ff0-198c-14f9-3b2b-d7ab06cfc8e6@linaro.org>
 <87v8ua624n.fsf@kernel.org> <08d0ec20-f9ae-c546-becb-a77404e91a9a@linaro.org>
 <87sfp94ooj.fsf@kernel.org>
 <CAA8EJpq1FySTU2Hr4G5OLocejzNZF1hDzyqTHV4e+R0duf2cJw@mail.gmail.com>
 <87k0al4foo.fsf@kernel.org>
In-Reply-To: <87k0al4foo.fsf@kernel.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 16 May 2022 19:28:34 +0300
Message-ID: <CAA8EJpqGf8238egwnL8+1DeZJ4bOzc_Dc9AmcMXytiK+VAeThQ@mail.gmail.com>
Subject: Re: WCN6855 issues with latest linux-firmware
To: Kalle Valo <kvalo@kernel.org>
Cc: "ath11k@lists.infradead.org" <ath11k@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220516_092847_728896_2A52F51A 
X-CRM114-Status: GOOD (  27.41  )
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

T24gTW9uLCAxNiBNYXkgMjAyMiBhdCAxOToxNSwgS2FsbGUgVmFsbyA8a3ZhbG9Aa2VybmVsLm9y
Zz4gd3JvdGU6Cj4KPiBEbWl0cnkgQmFyeXNoa292IDxkbWl0cnkuYmFyeXNoa292QGxpbmFyby5v
cmc+IHdyaXRlczoKPgo+ID4gT24gTW9uLCAxNiBNYXkgMjAyMiBhdCAxNjowMSwgS2FsbGUgVmFs
byA8a3ZhbG9Aa2VybmVsLm9yZz4gd3JvdGU6Cj4gPj4KPiA+PiBEbWl0cnkgQmFyeXNoa292IDxk
bWl0cnkuYmFyeXNoa292QGxpbmFyby5vcmc+IHdyaXRlczoKPiA+Pgo+ID4+ID4gT24gMTIvMDUv
MjAyMiAyMToyMywgS2FsbGUgVmFsbyB3cm90ZToKPiA+PiA+PiBEbWl0cnkgQmFyeXNoa292IDxk
bWl0cnkuYmFyeXNoa292QGxpbmFyby5vcmc+IHdyaXRlczoKPiA+PiA+Pgo+ID4+ID4+PiBUaGUg
d2NuNjg1NSBXaUZpIGNoaXAgc3RvcHBlZCB3b3JraW5nIGZvciBtZSBhZnRlciBhbiB1cGRhdGUg
dG8gdGhlCj4gPj4gPj4+IGxhdGVzdCBsaW51eC1maXJtd2FyZSAoTGludXggNS4xOC1yYzIpLiBJ
IGNhbiByZXByb2R1Y2UgaXQgd2l0aCBib3RoCj4gPj4gPj4+IGh3Mi4wIGFuZCBodzIuMSBjaGlw
cy4KPiA+PiA+Pj4KPiA+PiA+Pj4gSGVyZSBpcyB0aGUgc2V0IG9mIGtlcm5lbCBtZXNzYWdlcyBJ
J20gZ2V0dGluZyBmcm9tIGF0aDExa19wY2kgZHJpdmVyOgo+ID4+ID4+Pgo+ID4+ID4+PiBbICAg
IDQuNDIyMzkxXSBhdGgxMWtfcGNpIDAwMDA6MDE6MDAuMDogQWRkaW5nIHRvIGlvbW11IGdyb3Vw
IDMKPiA+PiA+Pj4gWyAgICA0LjQyOTU3MV0gYXRoMTFrX3BjaSAwMDAwOjAxOjAwLjA6IEJBUiAw
OiBhc3NpZ25lZCBbbWVtCj4gPj4gPj4+IDB4NjA0MDAwMDAtMHg2MDVmZmZmZiA2NGJpdF0KPiA+
PiA+Pj4gWyAgICA0LjQzNzg1N10gYXRoMTFrX3BjaSAwMDAwOjAxOjAwLjA6IGVuYWJsaW5nIGRl
dmljZSAoMDAwMCAtPiAwMDAyKQo+ID4+ID4+PiBbICAgIDQuNDQ1MzIzXSBhdGgxMWtfcGNpIDAw
MDA6MDE6MDAuMDogTVNJIHZlY3RvcnM6IDEKPiA+PiA+Pj4gWyAgICA0LjQ1MDM3NV0gYXRoMTFr
X3BjaSAwMDAwOjAxOjAwLjA6IHdjbjY4NTUgaHcyLjAKPiA+PiA+Pj4gWyAgICA1LjM3ODQ4OF0g
YXRoMTFrX3BjaSAwMDAwOjAxOjAwLjA6IGNoaXBfaWQgMHgyIGNoaXBfZmFtaWx5IDB4Ygo+ID4+
ID4+PiBib2FyZF9pZCAweDhjIHNvY19pZCAweDQwMGMwMjAwCj4gPj4gPj4+IFsgICAgNS4zOTI4
OThdIGF0aDExa19wY2kgMDAwMDowMTowMC4wOiBmd192ZXJzaW9uIDB4MTEwZjBjMzUKPiA+PiA+
Pj4gZndfYnVpbGRfdGltZXN0YW1wIDIwMjItMDMtMzAgMDk6MDUgZndfYnVpbGRfaWQKPiA+PiA+
Pj4gUUNfSU1BR0VfVkVSU0lPTl9TVFJJTkc9V0xBTi5IU1AuMS4xLTAzMTI1LVFDQUhTUFNXUExf
VjFfVjJfU0lMSUNPTlpfTElURS0zLjY1MTAuNwo+ID4+ID4+PiBbICAgIDUuNDIwNjQ4XSBhdGgx
MWtfcGNpIDAwMDA6MDE6MDAuMDogZmFpbGVkIHRvIGZldGNoIGJvYXJkIGRhdGEgZm9yCj4gPj4g
Pj4+IGJ1cz1wY2ksdmVuZG9yPTE3Y2IsZGV2aWNlPTExMDMsc3Vic3lzdGVtLXZlbmRvcj0xN2Ni
LHN1YnN5c3RlbS1kZXZpY2U9MDEwOCxxbWktY2hpcC1pZD0yLHFtaS1ib2FyZC1pZD0xNDAKPiA+
PiA+Pj4gZnJvbSBhdGgxMWsvV0NONjg1NS9odzIuMC9ib2FyZC0yLmJpbgo+ID4+ID4+PiBbICAg
MTUuNjg2Mzk4XSBhdGgxMWtfcGNpIDAwMDA6MDE6MDAuMDogZmFpbGVkIHRvIHdhaXQgYm9hcmQg
ZmlsZQo+ID4+ID4+PiBkb3dubG9hZCByZXF1ZXN0OiAtMTEwCj4gPj4gPj4+IFsgICAxNS42OTQ1
MzBdIGF0aDExa19wY2kgMDAwMDowMTowMC4wOiBxbWkgZmFpbGVkIHRvIGxvYWQgYmRmIGZpbGUK
PiA+PiA+Pj4gWyAgIDE1LjcwMDc4NF0gYXRoMTFrX3BjaSAwMDAwOjAxOjAwLjA6IGZhaWxlZCB0
byBsb2FkIGJvYXJkIGRhdGEgZmlsZTogLTExMAo+ID4+ID4+Cj4gPj4gPj4gV2hhdCBXQ042ODU1
IGhhcmR3YXJlIGFyZSB5b3UgZXhhY3RseSB1c2luZz8gKG1ha2UsIG1vZGVsIGV0YykKPiA+PiA+
Cj4gPj4gPiBJIGhhdmUgYXNrZWQgZm9yIHRoZSBodyBkZXRhaWxzLiBUaGUgdXNlciBndWlkZSBm
b3IgdGhlIEhESzg0NTAgbGlzdHMKPiA+PiA+IFdDTjY4NTYgY2hpcCBhbmQgYWxzbyBtZW50aW9u
cyAnUXVhbGNvbW3CriBGYXN0Q29ubmVjdOKEoiA2OTAwIFN5c3RlbXMnLgo+ID4+Cj4gPj4gU28g
dGhlIGNoaXAgd2FzIGluY2x1ZGVkIHdpdGhpbiBIREs4NDUwPyBJdCB3YXMgbm90IGluc3RhbGxl
ZCB0byB0aGUKPiA+PiBib2FyZCBzZXBhcmF0ZWx5IG9yIGFueXRoaW5nIGxpa2UgdGhhdD8KPiA+
Cj4gPiBZZXMsIGl0J3MgdGhlIGluY2x1ZGVkIGNoaXAuCj4KPiBPaywgdGhhdCBzaG91bGQgaGVs
cCB0byBmaW5kIGl0Lgo+Cj4gPj4gPj4gQW5kIHdoYXQKPiA+PiA+PiBib2FyZCBmaWxlIGFyZSB5
b3UgdXNpbmc/IG1kNXN1bXMgb2YgYWxsIGZpcm13YXJlIGZpbGVzIGlzIHRoZSBiZXN0Lgo+ID4+
ID4KPiA+PiA+ICMgbWQ1c3VtIC9saWIvZmlybXdhcmUvYXRoMTFrL1dDTjY4NTUvaHcyLjEvKgo+
ID4+ID4gNDYwZmJkNWRkYzU3YjNkMmVmYmYxY2E5NzZmNzhiOTAKPiA+PiA+IC9saWIvZmlybXdh
cmUvYXRoMTFrL1dDTjY4NTUvaHcyLjEvYW1zcy5iaW4KPiA+PiA+IDg4YjNhNGZiZGU4Y2FiNDQ5
M2YwMDYwYWUzYjVkZWUzCj4gPj4gPiAvbGliL2Zpcm13YXJlL2F0aDExay9XQ042ODU1L2h3Mi4x
L2JvYXJkLTIuYmluCj4gPj4gPiA3ZmQxYzIzMzdiMGI2NTAyNTg4ZDMxNDFlMjA1ZTczNQo+ID4+
ID4gL2xpYi9maXJtd2FyZS9hdGgxMWsvV0NONjg1NS9odzIuMS9ib2FyZC5iaW4KPiA+PiA+IGQx
NDYwZmMxYzQ1OTVkMGQyMmY4MmQ1YmFlYWFiYmQ4ICAvbGliL2Zpcm13YXJlL2F0aDExay9XQ042
ODU1L2h3Mi4xL20zLmJpbgo+ID4+ID4gZjY3YmU4MzY1OWM3OTBmZTE1ZDFlNDJhZjUwMWU5ZmEK
PiA+PiA+IC9saWIvZmlybXdhcmUvYXRoMTFrL1dDTjY4NTUvaHcyLjEvcmVnZGIuYmluCj4gPj4K
PiA+PiBTbyB5b3UgYXJlIHVzaW5nIGEgc2VwYXJhdGUgYm9hcmQuYmluIGZpbGUsIHdoZXJlIGRp
ZCB5b3UgZ2V0IGl0PyBhdGgxMWsKPiA+PiBib2FyZCBmaWxlcyBhcmUgZGlmZmVyZW50IHNvIHlv
dSBjYW5ub3QgdGFrZSB0aGUgYm9hcmQgZmlsZSBmcm9tCj4gPj4gZWxzZXdoZXJlLgo+ID4KPiA+
IFRoZSBib2FyZCBmaWxlIGNvbWVzIHRvZ2V0aGVyIHdpdGggdGhlIGJvYXJkLCBhcyBhIGJ1bmNo
Cj4gPiBiZHdsYW4uZSovYmR3bGFuZy5lKiBmaWxlcyBvbiB0aGUgbW9kZW0gcGFydGl0aW9uLgo+
ID4gSSB3YXMgdXNpbmcgdGhlIG9uZSBjb3JyZXNwb25kaW5nIHRvIHRoZSBib2FyZCBpZC4KPiA+
Cj4gPiBCdXQgbm90ZSwgdGhhdCB0aGUgZHJpdmVyIHJlcG9ydHMgdGhhdCBpdCBkaWQgbm90IGdl
dCB0aGUgJ2ZhaWxlZCB0bwo+ID4gd2FpdCBib2FyZCBmaWxlIGRvd25sb2FkIHJlcXVlc3QnLiBT
bywgaXQgd291bGQgYmUgZ29vZCB0byBnZXQgdGhlCj4gPiBib2FyZCBmaWxlIGludG8gdGhlIGJv
YXJkLTIuYmluLCBidXQgZm9yIG1lIGl0IGxvb2tzIGxpa2UgYSBzZXBhcmF0ZQo+ID4gc3Rvcnku
Cj4KPiBZZWFoLCB3ZSBzaG91bGQgdHJ5IHRvIGdldCB0aGUgY29ycmVjdCBib2FyZCBmaWxlIHRv
IGJvYXJkLTIuYmluLiBJJ2xsCj4gYXNrIGFyb3VuZC4KClRoYW5rcyEKVGhlIGRldmljZXMgSSBo
YXZlIGhlcmUgdXNlIHRoZSBmb2xsb3dpbmcgYm9hcmQgSURzOgoKYnVzPXBjaSx2ZW5kb3I9MTdj
YixkZXZpY2U9MTEwMyxzdWJzeXN0ZW0tdmVuZG9yPTE3Y2Isc3Vic3lzdGVtLWRldmljZT0wMTA4
LHFtaS1jaGlwLWlkPTIscW1pLWJvYXJkLWlkPTE2NwpidXM9cGNpLHZlbmRvcj0xN2NiLGRldmlj
ZT0xMTAzLHN1YnN5c3RlbS12ZW5kb3I9MTdjYixzdWJzeXN0ZW0tZGV2aWNlPTAxMDgscW1pLWNo
aXAtaWQ9MixxbWktYm9hcmQtaWQ9MTQwCgo+Cj4gPj4gQ2FuIHlvdSBmaWxlIHRoaXMgdG8gYnVn
emlsbGE6Cj4gPj4KPiA+PiBodHRwczovL3dpcmVsZXNzLndpa2kua2VybmVsLm9yZy9lbi91c2Vy
cy9kcml2ZXJzL2F0aDExay9idWdyZXBvcnQKPiA+Pgo+ID4+IFRoYXQgd2F5IGl0J3MgZWFzaWVy
IHRvIHRyYWNrIGFuZCBJIGNhbiB0cnkgdG8gZmluZCB0aGUgY29ycmVjdCBib2FyZAo+ID4+IGZp
bGUuCj4gPgo+ID4gRG9uZTogaHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNn
aT9pZD0yMTU5ODcKPgo+IFRoYW5rcyEKPgo+IC0tCj4gaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVs
Lm9yZy9wcm9qZWN0L2xpbnV4LXdpcmVsZXNzL2xpc3QvCj4KPiBodHRwczovL3dpcmVsZXNzLndp
a2kua2VybmVsLm9yZy9lbi9kZXZlbG9wZXJzL2RvY3VtZW50YXRpb24vc3VibWl0dGluZ3BhdGNo
ZXMKCgoKLS0gCldpdGggYmVzdCB3aXNoZXMKRG1pdHJ5CgotLSAKYXRoMTFrIG1haWxpbmcgbGlz
dAphdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2F0aDExawo=
