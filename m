Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF953C433EF
	for <ath11k@archiver.kernel.org>; Tue, 15 Feb 2022 11:23:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1XhKcgLowrBSAuyPONOrl/hdnCue9ppmWcHImMzFv50=; b=Pbgj//sfmDcZv5
	JwcOnTguiJlm26fUCOoZKSWfkmNG6ufjDdTz6GHzZ/zEvDVybu1ROHUs7GfgW9AXL3OhwYHjxXx+Z
	RcGfyfHb+MeI1je0uTNBfixgEp1PswiTgc4kJPDb3VSWa3xcKYruWBw3pPntkGnVS4sqQSkL8bdIu
	y1dvHdUlOAKB9uXVwDZfLZfukt+K/7bznbWklF9xikWMbdfR5YA0ZOJV75tWBMxpIgiB3c4F215ZA
	Z8MmrnjUKzY1GYVMHqImR+JMrnR6Fl1oO1TOlSI8BOzsD0OVghQxfkmr1O6Oo96QBa/JhvGumkPr3
	HYeRhW7zTMO22tOAz42A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJvvX-002WiQ-3c; Tue, 15 Feb 2022 11:23:23 +0000
Received: from mail-yb1-xb2d.google.com ([2607:f8b0:4864:20::b2d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJvvU-002Whe-Pi
 for ath11k@lists.infradead.org; Tue, 15 Feb 2022 11:23:22 +0000
Received: by mail-yb1-xb2d.google.com with SMTP id o19so54736957ybc.12
 for <ath11k@lists.infradead.org>; Tue, 15 Feb 2022 03:23:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=PgwQaYwXOji/J2Qg3oR0V4YS3P1e60Zqu89ItaRZ5rQ=;
 b=kKcJ4/VcKF/iKzVFnoqUbhOLrApZ3JtkoL5y2KyRrQ84qL3g432pn04yhx+H+fk2nV
 MRjNpPaNyF7QaBerpmp1z92umXW5H8+yCPySSgiyBkk/d++JukDfBvvC9CMK8RulczyW
 riFlfRzD3cKWowqS5SYN9pMD8Pye1gq+4GIt9EHp6Bc0m3ks0XO6QQcDdfGKwI7+ovqm
 EHm0593p45btnDZARPV39xbv8yTkYAgXGaSXXCbxZR8RjPe4qngwfMeTJZ2Jp0S7OvkA
 aL8Tv6iO/ry5utfdqX0Rr7DOY5wB3MdkgQI1w+n1IBkG/MI+d6erIA3rU3JDU5xir2jj
 TCOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=PgwQaYwXOji/J2Qg3oR0V4YS3P1e60Zqu89ItaRZ5rQ=;
 b=cYs0QjVynabMtU1NyjdH4m09T538LiZvpv6XWx8XM/cB6nIyfgvMAarbSVncXgp7k2
 wfCcB4qFF4aiRioxNB/38d6XYXe06qtyIh/D2ZLVFHKppd3IYX6TwqhLE+eMageXEFgb
 Xpyf4rbRTgicyDjm9zNMcPIJi/UARkjYmDjxpaUE/fJT1QZ5kHXsX9bkVZNL7fKIxWeC
 4N76HCvB5hkWnqUrIPAvrhrI3AmWkDUoejlkpvbt7NTTQTcpwc6pqfyaFfQHnx1FS1si
 QbEufTGALOJ13sreOlwqz36AMmFyLrlgY0W7mZmw0HMEXYMSqjwdR+LGZd+Jmdt82vca
 h3Rg==
X-Gm-Message-State: AOAM533GrnahSsU7FvJL/2lSpMFJJyI24bXBkGFWHxtstFLDtaiFi9U0
 ga3D7Gogixwk8+J+yEyQQwGf+XLuViHk6wcCoxDoufDhMaBPiQ==
X-Google-Smtp-Source: ABdhPJzFc4tkVGBBqWqxfdSpqyI3yzkz2Pt6dm7dPyHPNS+gu+HMShHwCCTbmtAfbgLkYrclqnhXo1n182ClaY0sWzE=
X-Received: by 2002:a81:eb02:: with SMTP id n2mr3092976ywm.315.1644924199425; 
 Tue, 15 Feb 2022 03:23:19 -0800 (PST)
MIME-Version: 1.0
References: <CAGYwnb=p38NMpWY=wLiPRE7eUDfjE_SyNS9zQ9W7Nhpy6hn+WQ@mail.gmail.com>
 <CAGYwnbnBjaNmS7aaSTXKtAbF1tKqeXTT_6tjka=5AS97c7Br8Q@mail.gmail.com>
 <87ilu5jr98.fsf@kernel.org> <198d5223-0dcf-6006-407f-7f9eeeb90c92@gmail.com>
 <CAGYwnbkh=RebRnSxXy7jXyfgMUXd=VBBZPTCB2zWbAM5y40XzQ@mail.gmail.com>
 <a00b83f2-ceba-ec6c-dd41-edaa9f84a041@gmail.com>
 <CAGYwnbnJb_0B0rwbDkTseJVZvNxn_XN2dPF5rG_ni9Hoy8MXgw@mail.gmail.com>
 <87ee4ocgfq.fsf@tynnyri.adurom.net>
In-Reply-To: <87ee4ocgfq.fsf@tynnyri.adurom.net>
From: Patricio Ferraggi Ares <pattferraggi@gmail.com>
Date: Tue, 15 Feb 2022 12:22:42 +0100
Message-ID: <CAGYwnb=BpeXZjviGpXPFQ9WgGAcBqep23m=+YfCfrZzdZirpoQ@mail.gmail.com>
Subject: Re: Fwd: AX500 support quirks
To: Kalle Valo <kvalo@kernel.org>
Cc: Mark Herbert <mark.herbert42@gmail.com>, ath11k@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220215_032320_859148_96B6B443 
X-CRM114-Status: GOOD (  30.13  )
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

SGV5IGZvbGtzLAoKU28uIEkgYW0gc3RpbGwgdXNpbmcgYXJjaCBsaW51eCwgYWx0aG91Z2ggaXQg
aXMgYSB0cmlja3kgc2l0dWF0aW9uLiBJCmhhdmUgd2lmaSB3b3JraW5nIChhcyBsb25nIGFzIEkg
Ym9vdCB3aXRoIGZhbGxiYWNrIGluaXRyYW1mcyBhbmQgZG9uJ3QKdXBkYXRlIG15IHN5c3RlbSks
IHN0aWxsIG5vIEJsdWV0b290aC4gSSBhbSBjdXJyZW50bHkgdXNpbmcgYSBidApkb25nbGUgdG8g
Y292ZXIgdGhhdC4KCkkgaGF2ZSBkZWNpZGVkIHRvIGdpdmUgaXQgYSB0cnkgYW5kIGRpdmUgZGVl
cGVyIGJ5IHR5aW5nIHRvIGNvbXBpbGUgbXkKb3duIGtlcm5lbCB3aXRoIHRoZSBuZWNlc3Nhcnkg
bW9kdWxlcyBhbmQgZmlybXdhcmUgZm9yIFdpZmkgYW5kCkJsdWV0b290aC4KCkNvdWxkIHlvdSBn
dXlzIHNoYXJlIHdpdGggbWUgb24gd2hpY2ggcmVwb3MgKGFwYXJ0IGZyb20gdGhlIGtlcm5lbApz
b3VyY2UpIEkgc2hvdWxkIHVzZSBpbiBvcmRlciB0byBidWlsZCBzb21ldGhpbmcgYmFzZWQgb24g
dGhlIGxhdGVzdApsaW51eC1tYWlubGluZSBrZXJuZWw/CkkgYW0gdW5hd2FyZSBvZiBob3cgc2hv
dWxkIEkgaW5jbHVkZSB0aGUgbGF0ZXN0IGF0aDExayBkcml2ZXJzIGZyb20KS2FsbGUgYW5kIHdo
aWNoIG1vZHVsZXMgSSBuZWVkIGluIG9yZGVyIHRvIG1ha2UgQlQgd29yay4KCkkgd291bGQgcmVh
bGx5IGFwcHJlY2lhdGUgaXQgaWYgeW91IGNvdWxkIGdpdmUgbWUgc29tZSBsaW5rcyB0byB0aGUK
cmVwb3MsIHNvbWUgaW5mbywgYW5kIG1heWJlIGEgYmFzaWMgc3RyYXRlZ3kgb24gaG93IHRvIGFw
cHJvYWNoIHRoaXMuCkkgd2lsbCBzZWFyY2ggYW5kIGxlYXJuIGZyb20gdGhhdCBzdGFydGluZyBw
b2ludC4KClRoYW5rcyBmb3IgYWxsIHlvdXIgaGVscC4KUGF0cmljaW8gRmVycmFnZ2kgQXJlcwoK
CkVsIGx1biwgMzEgZW5lIDIwMjIgYSBsYShzKSAxMjowNiwgS2FsbGUgVmFsbyAoa3ZhbG9Aa2Vy
bmVsLm9yZykgZXNjcmliacOzOgo+Cj4gUGF0cmljaW8gRmVycmFnZ2kgQXJlcyA8cGF0dGZlcnJh
Z2dpQGdtYWlsLmNvbT4gd3JpdGVzOgo+Cj4gPiBIaSwKPiA+Cj4gPiBTbyBJIGRlY2lkZWQgdG8g
Z2l2ZSBpdCBhIGdvLCBJIHByZWZlciB0byBkaXZlIG1vcmUgaW50byBMaW51eCBhbmQKPiA+IGhh
dmUgYSBkaXN0cm8gdGhhdCBJIGVuam95IHVzaW5nIHRoYW4gdGhlIG9uZSB0aGF0IHBsYXlzIGl0
IHNhZmUgYW5kCj4gPiBoYXMgImV2ZXJ5dGhpbmciIHdvcmtpbmcgYnV0IEkgaGF0ZSBpdC4KPiA+
IE15IExpbnV4IHBhcnRpdGlvbiBpcyBqdXN0IGZvciBteSBwZXJzb25hbCB1c2UgKG15IHdpbmRv
d3MgcGFydGl0aW9uCj4gPiBpcyBmb3IgcGF5aW5nIHRoZSBiaWxscykgYXQgdGhlIGVuZCBzbyB3
aHkgbm90IGVuam95IGl0Lgo+ID4KPiA+IEkgYW0gY3VycmVudGx5IHJ1bm5pbmc6Cj4gPgo+ID4g
RGlzdHJvOiBBcmNoIExpbnV4Cj4gPiBLZXJuZWw6IDUuMTYuMy1hcmNoMS0xCj4gPiBMaW51eCBm
aXJtd2FyZTogbGludXgtZmlybXdhcmUgMjAyMjAxMTkuMGM2YTdiMy0yCj4gPiBTeXN0ZW0gZmly
bXdhcmU6IDMuNC4wCj4gPgo+ID4gVGhlIHdpZmkgd29ya3Mgb3V0IG9mIHRoZSBib3gsIGFsd2F5
cyBjb25uZWN0cyBhbmQgSSBoYXZlbid0IGhhZCBhbnkKPiA+IGlzc3VlcyB3aGF0c29ldmVyLgo+
ID4KPiA+IEJUIHN0aWxsIGEgZGlmZmVyZW50IHN0b3J5Ogo+ID4gU29tZSBib290cyBJIGNhbid0
IGNvbm5lY3QgdG8gZGV2aWNlcywgc29tZSBib290cyBJIGNhbid0IGZpbmQKPiA+IGRldmljZXMs
IHNvbWUgYm9vdHMgQlQgd29ya3MgZmluZS4KPiA+IFdoZW4gaXQgZG9lc24ndCB3b3JrIEkgZ2V0
IGVycm9ycyBsaWtlOgo+ID4KPiA+IFJlYWRpbmcgUUNBIHZlcnNpb24gaW5mb3JtYXRpb24gZmFp
bGVkICgtMTEwKQo+ID4gaGNpMDogRnJhbWUgcmVhc3NlbWJseSBmYWlsZWQgKC04NCkKPiA+Cj4g
PiBXaGF0IHdvdWxkIHJlY29tbWVuZCBteSBuZXh0IHN0ZXAgd291bGQgYmUgZm9yIHRyeWluZyB0
byBzb2x2ZSB0aGlzCj4gPiBpc3N1ZT8gSSBhc3N1bWUgZ2V0dGluZyB0aGUgbGFzdCBmaXJtd2Fy
ZSBmcm9tIGthbGxlJ3MgZ2l0IHdvdWxkIGJlIGEKPiA+IGdvb2QgaWRlYT8gaWYgc28gaXMgdGhp
cyB0aGUgYXBwcm9wcmlhdGUgZ2l0Cj4gPiBodHRwczovL2dpdGh1Yi5jb20va3ZhbG8vYXRoMTFr
LWZpcm13YXJlPwo+ID4gSXQgd291bGQgYmUgbmljZSBpZiB5b3UgZ3V5cyBjb3VsZCBnaXZlIG1l
IGEgZmV3IHN0ZXBzIHRvIGZvbGxvdy4KPgo+IEZyb20gc29mdHdhcmUgcG9pbnQgb2YgdmlldyBC
bHVldG9vdGggYW5kIFdpLUZpIGFyZSBzZXBhcmF0ZSwgYXRoMTFrCj4gZHJpdmVyIGhhbmRsZXMg
V2ktRmkgYW5kIHRoZXJlJ3MgYSBzZXBhcmF0ZSBkcml2ZXIgKGFuZCBmaXJtd2FyZSkgZm9yCj4g
Qmx1ZXRvb3RoLiBJJ20gbm90IGZhbWlsaWFyIGVub3VnaCB3aXRoIEJsdWV0b290aCBpbXBsZW1l
bnRhdGlvbiB0byBoZWxwCj4gbXVjaCwgYnV0IG1ha2Ugc3VyZSB5b3UgaGF2ZSB0aGUgbGF0ZXN0
IEJsdWV0b290aCBmaXJtd2FyZS4gQWxzbyB0aGUKPiBCbHVldG9vdGggZHJpdmVyIG1pZ2h0IGhh
dmUgaGFkIGZpeGVzIHNpbmNlIHY1LjE2Lgo+Cj4gLS0KPiBodHRwczovL3BhdGNod29yay5rZXJu
ZWwub3JnL3Byb2plY3QvbGludXgtd2lyZWxlc3MvbGlzdC8KPgo+IGh0dHBzOi8vd2lyZWxlc3Mu
d2lraS5rZXJuZWwub3JnL2VuL2RldmVsb3BlcnMvZG9jdW1lbnRhdGlvbi9zdWJtaXR0aW5ncGF0
Y2hlcwoKLS0gCmF0aDExayBtYWlsaW5nIGxpc3QKYXRoMTFrQGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9hdGgxMWsK
