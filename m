Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F9AEC433EF
	for <ath11k@archiver.kernel.org>; Tue, 15 Feb 2022 11:30:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LBri/FTOo4ci/bsp3wnPuuF6tNH4YzZ4LpVJKr6aF1M=; b=217vrokUlBMwLZ
	6lELzEOVhEnwSNwzBGJzQztEfWDSjICMxKqmDtX+HDAeMu5sdghz6YavR/47aHqENVZd1tGKQz4+e
	jFhols6fjY+VTX1az+noViyQcXPMYdr83NFRGEDGhAR8c9ocxOOJpPbI7O/kU8j/p0+ws6mhVy6XI
	PX1dRhgI6S1LADFgjr4ZiW8dH/snksY9M2w24yKAWfMD272WROUNCn2EV2NFylaX3O1Fp3cwksz06
	u1rQKS/ZjpPXDBK+h7tSnHj8OI5FbWcCbCnch0CkgAyNOX7wB8EGv+X46/Xfkamqfs8dxKY/2HkVn
	IG5wCdbaHTAMO5jo1fVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJw28-002YEc-0Q; Tue, 15 Feb 2022 11:30:12 +0000
Received: from mail-yb1-xb2d.google.com ([2607:f8b0:4864:20::b2d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJw24-002YDt-Uc
 for ath11k@lists.infradead.org; Tue, 15 Feb 2022 11:30:10 +0000
Received: by mail-yb1-xb2d.google.com with SMTP id j12so32803266ybh.8
 for <ath11k@lists.infradead.org>; Tue, 15 Feb 2022 03:30:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=uLmkEprQLgKpWoGD4x15PH8z1SwhCcQgELJSPJrjiMw=;
 b=BaFt6t48CsQyyhRu4DOVXOy0Ue4sLIVCY6pNcLzKgn+nqJCNdUkLKwC9fJ+fsPIov5
 LIj2NXK2s7E5t1S3P2Kx+/ZCwzClhoH+9qd/s88xXx2TkJQDhsvJYPK4sKzLDXd1SAqz
 /x9u21FgVp6MvEs3g1zAiT2ogss2jQXbYU8CXfDJ60K/CiK+bhdLAksgybDoLpcXDw+U
 eUZbTh4/1jGkIqlDx63g3BQTn3ua6XVlzKzEjdt2cZ+VVy/SLVmLZkfAW60z00AX2TIS
 vv08rGEUk+tnoG+Evtz96eMMeA6PvSNldvgRrH4OTlLX1SwhuswLGJxLJ8rcDmSintd7
 CGBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=uLmkEprQLgKpWoGD4x15PH8z1SwhCcQgELJSPJrjiMw=;
 b=jXLT5obN46ghPK/WBIsP/44ur7Yk+S5yZB2opsfB3mFtqzcVKc0oTgNUxMgLuaZecQ
 lpiz9PMfn/nbFwZLKRgwQjCoX9I8ftVpukMpQPPbt2LqR0bp5Lq02xjk6/eVfYtVlIyh
 tC+XAhXUDrqI7feJRxfTYx05fouGhwLYVkuMyOGa5UjW5ymOqUWbLC6Uo1A1OrGCFcKA
 c/ATGwsAgcHxDc7TUPo/4+iC+R6jfJW2ylw4DCqDLza2k+yHAwEixrQNkKZLx55Hquvy
 Ph28D6RYpBqihhUgr1I3KB41kcJF65AvDBY/ui0zGHQwjj2t1nGksLtLu8EjaA6bgQwr
 C7Vw==
X-Gm-Message-State: AOAM531a302KHmj7cEdAyFTQzREJAopRsut+qmh+cneELzcIE9C+YQJr
 aW6rOXfOCZDuqZizss3R+lmPrtqNEglutCZcMnU=
X-Google-Smtp-Source: ABdhPJy/F5eHotKfc9Jy4/cloAjVsV7ZVcBVmMM2zMioY22b4Jdpgu4Blsd0Htv4jspjIMAYXTacTVlxw/mloQBfUIc=
X-Received: by 2002:a81:611:: with SMTP id 17mr3167250ywg.511.1644924608193;
 Tue, 15 Feb 2022 03:30:08 -0800 (PST)
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
Date: Tue, 15 Feb 2022 12:29:31 +0100
Message-ID: <CAGYwnbk9mUim8GvzLYqqkHLNjtJdQUMqhP1+82s3tCnRHRam=w@mail.gmail.com>
Subject: Re: Fwd: AX500 support quirks
To: Kalle Valo <kvalo@kernel.org>
Cc: Mark Herbert <mark.herbert42@gmail.com>, ath11k@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220215_033009_016494_0B9D69D3 
X-CRM114-Status: GOOD (  28.99  )
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

SGV5IGZvbGtzLAoKU28uIEkgYW0gc3RpbGwgdXNpbmcgYXJjaCBsaW51eCwgYnV0IG5vdCBldmVy
eXRoaW5nIGlzIHdvcmtpbmcuCkkgaGF2ZSBkZWNpZGVkIHRvIGdpdmUgaXQgYSB0cnkgYW5kIGRp
dmUgZGVlcGVyIGJ5IHRyeWluZyB0byBjb21waWxlCm15IG93biBrZXJuZWwgd2l0aCB0aGUgbmVj
ZXNzYXJ5IG1vZHVsZXMgYW5kIGZpcm13YXJlIGZvciBXaWZpIGFuZApCbHVldG9vdGguCgpDb3Vs
ZCB5b3UgZ3V5cyBzaGFyZSB3aXRoIG1lIHdoaWNoIHJlcG9zIChhcGFydCBmcm9tIHRoZSBrZXJu
ZWwKc291cmNlKSBJIHNob3VsZCB1c2UgaW4gb3JkZXIgdG8gYnVpbGQgc29tZXRoaW5nIGJhc2Vk
IG9uIHRoZSBsYXRlc3QKbGludXgtbWFpbmxpbmUga2VybmVsPwpJIGFtIHVuYXdhcmUgb2YgaG93
IHNob3VsZCBJIGluY2x1ZGUgdGhlIGxhdGVzdCBhdGgxMWsgZHJpdmVycyBmcm9tCkthbGxlIGFu
ZCB3aGljaCBtb2R1bGVzIEkgbmVlZCBpbiBvcmRlciB0byBtYWtlIEJUIHdvcmsuCkkgd291bGQg
cmVhbGx5IGFwcHJlY2lhdGUgaXQgaWYgeW91IGNvdWxkIGdpdmUgbWUgc29tZSBsaW5rcyB0byB0
aGUKcmVwb3MsIHNvbWUgaW5mbywgYW5kIG1heWJlIGEgYmFzaWMgc3RyYXRlZ3kgb24gaG93IHRv
IGFwcHJvYWNoIHRoaXMuCkkgd2lsbCBzZWFyY2ggYW5kIGxlYXJuIGZyb20gdGhhdCBzdGFydGlu
ZyBwb2ludC4KClRoYW5rcyBmb3IgYWxsIHlvdXIgaGVscC4KCkVsIGx1biwgMzEgZW5lIDIwMjIg
YSBsYShzKSAxMjowNiwgS2FsbGUgVmFsbyAoa3ZhbG9Aa2VybmVsLm9yZykgZXNjcmliacOzOgo+
Cj4gUGF0cmljaW8gRmVycmFnZ2kgQXJlcyA8cGF0dGZlcnJhZ2dpQGdtYWlsLmNvbT4gd3JpdGVz
Ogo+Cj4gPiBIaSwKPiA+Cj4gPiBTbyBJIGRlY2lkZWQgdG8gZ2l2ZSBpdCBhIGdvLCBJIHByZWZl
ciB0byBkaXZlIG1vcmUgaW50byBMaW51eCBhbmQKPiA+IGhhdmUgYSBkaXN0cm8gdGhhdCBJIGVu
am95IHVzaW5nIHRoYW4gdGhlIG9uZSB0aGF0IHBsYXlzIGl0IHNhZmUgYW5kCj4gPiBoYXMgImV2
ZXJ5dGhpbmciIHdvcmtpbmcgYnV0IEkgaGF0ZSBpdC4KPiA+IE15IExpbnV4IHBhcnRpdGlvbiBp
cyBqdXN0IGZvciBteSBwZXJzb25hbCB1c2UgKG15IHdpbmRvd3MgcGFydGl0aW9uCj4gPiBpcyBm
b3IgcGF5aW5nIHRoZSBiaWxscykgYXQgdGhlIGVuZCBzbyB3aHkgbm90IGVuam95IGl0Lgo+ID4K
PiA+IEkgYW0gY3VycmVudGx5IHJ1bm5pbmc6Cj4gPgo+ID4gRGlzdHJvOiBBcmNoIExpbnV4Cj4g
PiBLZXJuZWw6IDUuMTYuMy1hcmNoMS0xCj4gPiBMaW51eCBmaXJtd2FyZTogbGludXgtZmlybXdh
cmUgMjAyMjAxMTkuMGM2YTdiMy0yCj4gPiBTeXN0ZW0gZmlybXdhcmU6IDMuNC4wCj4gPgo+ID4g
VGhlIHdpZmkgd29ya3Mgb3V0IG9mIHRoZSBib3gsIGFsd2F5cyBjb25uZWN0cyBhbmQgSSBoYXZl
bid0IGhhZCBhbnkKPiA+IGlzc3VlcyB3aGF0c29ldmVyLgo+ID4KPiA+IEJUIHN0aWxsIGEgZGlm
ZmVyZW50IHN0b3J5Ogo+ID4gU29tZSBib290cyBJIGNhbid0IGNvbm5lY3QgdG8gZGV2aWNlcywg
c29tZSBib290cyBJIGNhbid0IGZpbmQKPiA+IGRldmljZXMsIHNvbWUgYm9vdHMgQlQgd29ya3Mg
ZmluZS4KPiA+IFdoZW4gaXQgZG9lc24ndCB3b3JrIEkgZ2V0IGVycm9ycyBsaWtlOgo+ID4KPiA+
IFJlYWRpbmcgUUNBIHZlcnNpb24gaW5mb3JtYXRpb24gZmFpbGVkICgtMTEwKQo+ID4gaGNpMDog
RnJhbWUgcmVhc3NlbWJseSBmYWlsZWQgKC04NCkKPiA+Cj4gPiBXaGF0IHdvdWxkIHJlY29tbWVu
ZCBteSBuZXh0IHN0ZXAgd291bGQgYmUgZm9yIHRyeWluZyB0byBzb2x2ZSB0aGlzCj4gPiBpc3N1
ZT8gSSBhc3N1bWUgZ2V0dGluZyB0aGUgbGFzdCBmaXJtd2FyZSBmcm9tIGthbGxlJ3MgZ2l0IHdv
dWxkIGJlIGEKPiA+IGdvb2QgaWRlYT8gaWYgc28gaXMgdGhpcyB0aGUgYXBwcm9wcmlhdGUgZ2l0
Cj4gPiBodHRwczovL2dpdGh1Yi5jb20va3ZhbG8vYXRoMTFrLWZpcm13YXJlPwo+ID4gSXQgd291
bGQgYmUgbmljZSBpZiB5b3UgZ3V5cyBjb3VsZCBnaXZlIG1lIGEgZmV3IHN0ZXBzIHRvIGZvbGxv
dy4KPgo+IEZyb20gc29mdHdhcmUgcG9pbnQgb2YgdmlldyBCbHVldG9vdGggYW5kIFdpLUZpIGFy
ZSBzZXBhcmF0ZSwgYXRoMTFrCj4gZHJpdmVyIGhhbmRsZXMgV2ktRmkgYW5kIHRoZXJlJ3MgYSBz
ZXBhcmF0ZSBkcml2ZXIgKGFuZCBmaXJtd2FyZSkgZm9yCj4gQmx1ZXRvb3RoLiBJJ20gbm90IGZh
bWlsaWFyIGVub3VnaCB3aXRoIEJsdWV0b290aCBpbXBsZW1lbnRhdGlvbiB0byBoZWxwCj4gbXVj
aCwgYnV0IG1ha2Ugc3VyZSB5b3UgaGF2ZSB0aGUgbGF0ZXN0IEJsdWV0b290aCBmaXJtd2FyZS4g
QWxzbyB0aGUKPiBCbHVldG9vdGggZHJpdmVyIG1pZ2h0IGhhdmUgaGFkIGZpeGVzIHNpbmNlIHY1
LjE2Lgo+Cj4gLS0KPiBodHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3Byb2plY3QvbGludXgt
d2lyZWxlc3MvbGlzdC8KPgo+IGh0dHBzOi8vd2lyZWxlc3Mud2lraS5rZXJuZWwub3JnL2VuL2Rl
dmVsb3BlcnMvZG9jdW1lbnRhdGlvbi9zdWJtaXR0aW5ncGF0Y2hlcwoKLS0gCmF0aDExayBtYWls
aW5nIGxpc3QKYXRoMTFrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9hdGgxMWsK
