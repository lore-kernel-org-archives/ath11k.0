Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F8AEEB64DC
	for <ath11k@archiver.kernel.org>; Tue, 11 Jul 2023 08:16:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hu+hM4F2Ltb25N+QKgPhZnn7sbtStieJ2nj1pa+OPBY=; b=OJO7rI2kRh2/Qo
	LSp4Ptivwb05yBKP6Y7Q0AviDo+14DdtSMeZZo60SkTGVFTfjWUZS//xhnwOvMve/GTb6oTDCqJf2
	susI8xE7YrUm6/hyJfeuf+2hff9y4AS5iIF4Ug8/WJ6Chq36FOFdnxAA7u8VM0h4r4M74aySIB7QR
	VGh24tibGUvlgTje8OFTupj9qvWyuMx0YbTe+G86Et1vj+3l0f4fkpjTFZMBEnv9MO0ulHdTXPM/S
	/sv5qbOedpuHPey9JDoUbT4OYrX40KFKMg3FxVedw03MHzawe/FZ1H9El9NPGLYa8G+WWsB12Ou2L
	YVeSiFpHDKiJUUjhgRfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJ8Xa-00E59V-1M;
	Tue, 11 Jul 2023 08:16:10 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJ8XW-00E58W-0t
	for ath11k@lists.infradead.org;
	Tue, 11 Jul 2023 08:16:08 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-51de9c2bc77so6513987a12.3
        for <ath11k@lists.infradead.org>; Tue, 11 Jul 2023 01:16:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=squaremind-io.20221208.gappssmtp.com; s=20221208; t=1689063361; x=1691655361;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vmN/BSd04epf1djOUai9kZ3RltWB096/AaRtUP/EXBI=;
        b=1pLeo7bGqHLgThT78hm4ErGwwIDQ2HS0V93IGpKTeg1ZmCRZdVBEYQ/aROY/5NNGNQ
         ZLvOCR4Oa2vTRC7PinHkAoYQIgXy+LKvRaHk5HFSlbXQ2J3IDYYv0texIEKtLZmNLn8g
         liWhrPXAVZF3BGv38rChVNqZGrHTqfvXelKtfe1AsKJ7Jn39AKTpiJ27XedRw6Q4p34U
         sodrE6aUnWnHGXXEjiLFymt0GcOsjvW2Yw3x4GjPX7UVoFHOJvsWizd7uVf23bf7JHCf
         H2PiC1rquJUKpkys/s0GfU7gZKWAaS5z90O69iabGKyqiQ1OUin8j+SxE/6YAMOcyWDp
         uGqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689063361; x=1691655361;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vmN/BSd04epf1djOUai9kZ3RltWB096/AaRtUP/EXBI=;
        b=TiQxa1rqHd91uqkkFQH+ALZurV7LPq786oaHAKGVPSHt2nsjFm4Xlg8K4L/EC+nUuQ
         K06pEBHSawYQG+XjYVlu8R5swxE0ciqWR6zqdLe6GdXBz0h2hxszMWreY9x//cFP+D0U
         L2/HSDvYvUvWgBItdd/aQKF6p23hTDpcPIJ1oEv7GHUV/6YEqaBd00xV/x1qu8pFltbE
         1qtkNG67tFSlcJ7LjY/kkOyhujVT1sLJC+WuH8W3/rLCnJi6xSq7ls+1DqxkjAhBMaFp
         syhF0Z25p1W0r4fbrwG6wuuxs7/rjPQdypKDx8FU8vwnokpyCWMDQKGkO+Erm7v9KlsF
         1HWQ==
X-Gm-Message-State: ABy/qLY6nOkVKHUwlgCPOOHrSh8OlPDOWQl0snIP5sMb4beBXBhb+5QJ
	copoIE0CrgKzBfuULtarWzClhkdIvur2hxGe68XHzigc7isZzxSYQXPfRw==
X-Google-Smtp-Source: APBJJlFM1Bmgasrr5DS7fGkZIIchqLnTLiZGxPy5KU+91myFeXQLxDLVNyVb3GLMcHXlG4CXmGr+ONajn9VyPYrr18Y=
X-Received: by 2002:a05:6402:1645:b0:51e:34d5:a23f with SMTP id
 s5-20020a056402164500b0051e34d5a23fmr14556077edx.23.1689063361381; Tue, 11
 Jul 2023 01:16:01 -0700 (PDT)
MIME-Version: 1.0
References: <CAPr+0Hb5b_CEihVH+Mo-uR4+Wp-ACkoCySkyLrk=mkzme6ezPg@mail.gmail.com>
 <87sf9v7xir.fsf@kernel.org>
In-Reply-To: <87sf9v7xir.fsf@kernel.org>
From: Tanguy Serrat <tanguy@squaremind.io>
Date: Tue, 11 Jul 2023 10:15:50 +0200
Message-ID: <CAPr+0HbwpA0KrV71ah8bQ_Gnn9Ch2PMZnHE3uqRUrNU8=DoMFA@mail.gmail.com>
Subject: Re: ath11k: QCN9074: low HE-MCS index
To: Kalle Valo <kvalo@kernel.org>
Cc: ath11k@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230711_011606_530857_A64EF30E 
X-CRM114-Status: GOOD (  23.40  )
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

RGVhciBLYWxsZSwKClRoYW5rIHlvdSBmb3IgeW91ciByZXBseS4KCkkgaGF2ZSBvcGVuZWQgdHdv
IHNlcGFyYXRlIGlzc3VlczoKMSkgaHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVn
LmNnaT9pZD0yMTc1MzYgLSByZWxhdGVkIHRvIGEKcHJldmlvdXMgaXNzdWUgSSBlbmNvdW50ZXJl
ZC4KCjIpIGh0dHBzOi8vYnVnemlsbGEua2VybmVsLm9yZy9zaG93X2J1Zy5jZ2k/aWQ9MjE3NjUy
IC0gcmVsYXRlZCB0byB0aGlzIGZlZWQuCgpJIGhhdmUgdGVzdGVkIDNtIGFwYXJ0LCBhcyBkZXNj
cmliZWQgaW4gMjE3NjUyLCByZXN1bHRzIGFyZSBqdXN0CnNsaWdodGx5IGJldHRlciBpbiB0ZXJt
cyBvZiByZXBvcnRlZCBNQ1MuIEkgc3RpbGwgc2VlbSB0byBiZSBtaXNzaW5nCmFsbCBjYXBhYmls
aXRpZXMgb3ZlciA3LgpJIGhhdmUgYXR0YWNoZWQgdGhlIGZ1bGwgZG1lc2cgbG9nIGFuZCAuY29u
ZmlnIGZpbGUgdG8gdGhlIGJ1ZyByZXBvcnQKCkxlIG1hci4gMTEganVpbC4gMjAyMyDDoCAwODo0
OSwgS2FsbGUgVmFsbyA8a3ZhbG9Aa2VybmVsLm9yZz4gYSDDqWNyaXQgOgo+Cj4gVGFuZ3V5IFNl
cnJhdCA8dGFuZ3V5QHNxdWFyZW1pbmQuaW8+IHdyaXRlczoKPgo+ID4gSGkgZXZlcnlvbmUsCj4g
Pgo+ID4gSW4gbXkgcXVlc3QgdG8gZ2V0IDJ4IFFDTjkwNzQgcGFpcmVkIGFuZCBhY2hpZXZpbmcg
aGlnaCB0aHJvdWdocHV0Cj4gPiBkYXRhIHRyYW5zZmVycywgSSBhbSBub3cgZmFjaW5nIGlzc3Vl
cyB3aXRoIHRoZSBBUCBjb25maWd1cmF0aW9uLgo+ID4KPiA+IFNwZWNpZmljYWxseSwgSSBjYW5u
b3QgZ2V0IG1vcmUgdGhhbiBIRS1NQ1MgNSAoQVAgYW5kIGNsaWVudCA1MGNtCj4gPiBhcGFydCkg
YWx0aG91Z2ggU05SIGFuZCBSU1NJIGFyZSBhbHdheXMgdmVyeSBzdHJvbmcgYW5kIHN1cHBvc2Vk
bHkgaW4KPiA+IHNwZWNzIChTTlIgPiA0MGRiIG9yIFJTU0kgPCAtNDhkYikuCj4gPgo+ID4gaXcg
d2xwNnMwIGxpbmsKPiA+IENvbm5lY3RlZCB0byAwMDoxNTo2MToyNzpjZDpkYyAob24gd2xwNnMw
KQo+ID4gU1NJRDogU3BhY2UKPiA+IGZyZXE6IDU3NDUKPiA+IFJYOiAxMDczNTg0NDgyIGJ5dGVz
ICg3MDg1NjcgcGFja2V0cykKPiA+IFRYOiAzNTU4MjQyMTQgYnl0ZXMgKDI1NjE0MyBwYWNrZXRz
KQo+ID4gc2lnbmFsOiAtNDAgZEJtCj4gPiByeCBiaXRyYXRlOiAxNzI5LjMgTUJpdC9zIDE2ME1I
eiBIRS1NQ1MgNCBIRS1OU1MgNCBIRS1HSSAwIEhFLURDTSAwCj4gPiB0eCBiaXRyYXRlOiAxNzI5
LjMgTUJpdC9zIDE2ME1IeiBIRS1NQ1MgNCBIRS1OU1MgNCBIRS1HSSAwIEhFLURDTSAwCj4gPgo+
ID4gSW4gdGhpcyBjYXNlIGlwZXJmMyBzaG93cyB+OTUwTWJpdHMvcyB0cmFuc2ZlciBzcGVlZC4g
SSBhbSBob3BpbmcgdG8KPiA+IGdldCBhdCBsZWFzdCB0d2ljZSBhcyBtdWNoLgo+ID4KPiA+IEl0
IHNlZW1zIHRvIG1lIHRoYXQgZWl0aGVyIG1hYzgwMjExLCBhdGgxMWsgb3IgaG9zdGFwZCBhcmUg
bm90Cj4gPiBhZHZlcnRpc2luZyB0aGUgYXZhaWxhYmxlIGNhcGFiaWxpdGllcyBjb3JyZWN0bHku
IEkgaGF2ZSB0cmllZCBzZXR0aW5nCj4gPiBob3N0YXBkIGhlX2Jhc2ljX21jc19zZXQ9NjU1MzAg
b3Igb3RoZXJzIGJ1dCBkaWQgbm90IGhlbHAuCj4gPgo+ID4gSSBoYXZlIGFkZGVkIGllZWU4MDIx
MV9yZWdkb209RlIgb3B0aW9uIHRvIGNmZzgwMjExIG1vZHVsZSBvbiB0aGUgQVAKPiA+IHNpZGUu
IENoYW5uZWwgc2VsZWN0aW9uIGlzIGRvbmUgd2l0aCBBQ1Mgc3VydmV5LiBJIGFsc28gdHJpZWQg
b3RoZXIKPiA+IGNoYW5uZWxzL2ZyZXF1ZW5jaWVzIHdpdGhvdXQgc3VjY2VzcyBlZy4gNTUwME1o
ei4KPiA+Cj4gPiBpdyByZWcgZ2V0Cj4gPiBnbG9iYWwKPiA+IGNvdW50cnkgRlI6IERGUy1FVFNJ
Cj4gPiAoMjQwMCAtIDI0ODMgQCA0MCksIChOL0EsIDIwKSwgKE4vQSkKPiA+ICg1MTUwIC0gNTI1
MCBAIDgwKSwgKE4vQSwgMjMpLCAoTi9BKSwgTk8tT1VURE9PUiwgQVVUTy1CVwo+ID4gKDUyNTAg
LSA1MzUwIEAgODApLCAoTi9BLCAyMCksICgwIG1zKSwgTk8tT1VURE9PUiwgREZTLCBBVVRPLUJX
Cj4gPiAoNTQ3MCAtIDU3MjUgQCAxNjApLCAoTi9BLCAyNiksICgwIG1zKSwgREZTCj4gPiAoNTcy
NSAtIDU4NzUgQCA4MCksIChOL0EsIDEzKSwgKE4vQSkKPiA+ICg1OTQ1IC0gNjQyNSBAIDE2MCks
IChOL0EsIDIzKSwgKE4vQSksIE5PLU9VVERPT1IKPiA+ICg1NzAwMCAtIDcxMDAwIEAgMjE2MCks
IChOL0EsIDQwKSwgKE4vQSkKPiA+Cj4gPiBwaHkjMCAoc2VsZi1tYW5hZ2VkKQo+ID4gY291bnRy
eSBVUzogREZTLUZDQwo+ID4gKDI0MDIgLSAyNDcyIEAgNDApLCAoNiwgMzApLCAoTi9BKQo+ID4g
KDUxNzAgLSA1MjUwIEAgODApLCAoTi9BLCAzMCksIChOL0EpLCBBVVRPLUJXCj4gPiAoNTI1MCAt
IDUzMzAgQCA4MCksIChOL0EsIDI0KSwgKDAgbXMpLCBERlMsIEFVVE8tQlcKPiA+ICg1NDkwIC0g
NTczMCBAIDE2MCksIChOL0EsIDI0KSwgKDAgbXMpLCBERlMsIEFVVE8tQlcKPiA+ICg1NzM1IC0g
NTg5NSBAIDE2MCksIChOL0EsIDMwKSwgKE4vQSksIEFVVE8tQlcKPiA+ICg1OTQ1IC0gNzEyNSBA
IDE2MCksIChOL0EsIDI3KSwgKE4vQSksIE5PLU9VVERPT1IsIEFVVE8tQlcKPiA+Cj4gPiBDdXJy
ZW50IHNldHVwIGlzOgo+ID4gLSBJbnRlbCB4ODYKPiA+IC0gVWJ1bnR1IDIyLjA0Cj4gPiAtIEtl
cm5lbCBidWlsdCBmcm9tIGF0aCA2LjQuMC1yYzYtd3QtYXRoKyAoY29tbWl0Ogo+ID4gYzYwZDE1
ZjM4OWVmOTgzMmE4ZGE0MTBlNDM4ZDgxYjEwMzI3NzUxZikKPiA+IHdpdGggY29tbWl0IHJldmVy
dGVkIGZyb20gdGhlIGJ1ZyB0aWNrZXQgSSBvcGVuZWQKPiA+IChodHRwczovL2J1Z3ppbGxhLmtl
cm5lbC5vcmcvc2hvd19idWcuY2dpP2lkPTIxNzUzNikuCj4gPiAtIDF4IFFDTjkwNzQgYXMgQVAs
IDF4IGFzIG1hbmFnZWQgY2xpZW50IDUwY20gYXBhcnQKPiA+IC0gQm90aCBBUCBhbmQgQ2xpZW50
IGFyZSBydW5uaW5nIHdpdGggdGhlIGxhdGVzdCAyLjcuMCBGVy4KPiA+Cj4gPiBJIGhhdmUgc3Rh
cnRlZCBmcm9tIHRoaXMgdGlja2V0Cj4gPiAoaHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3No
b3dfYnVnLmNnaT9pZD0yMTcyODYpIGhvc3RhcGQgY29uZmlnCj4gPiBmaWxlLCBhbmQgYWRhcHRl
ZCwgcGxlYXNlIGZpbmQgYXR0YWNoZWQuCj4gPgo+ID4gQW55b25lIHNlZWluZyB3aGF0IGNvdWxk
IGJlIG15IGlzc3VlIC8gaG93IEkgY291bGQgZGVidWcgZnVydGhlciA/Cj4KPiBBcyBhIHN0YXJ0
IHBsZWFzZSBmaWxlIHRoaXMgdG8gYnVnemlsbGEgYXMgYSBuZXcgYnVnLiBBbHdheXMgb25lIGlz
c3VlCj4gcGVyIHJlcG9ydCwgcGxlYXNlLiBPdGhlcndpc2UgaXQncyBhIG5pZ2h0bWFyZSB0byBt
YW5hZ2UgdGhlIGJ1Zwo+IHJlcG9ydHMuCj4KPiBodHRwczovL3dpcmVsZXNzLndpa2kua2VybmVs
Lm9yZy9lbi91c2Vycy9kcml2ZXJzL2F0aDExay9idWdyZXBvcnQKPgo+IFRyeSB0byBwcm92aWRl
IGFzIG11Y2ggYXMgaW5mb3JtYXRpb24gYXMgeW91IGNhbiB0byB0aGUgcmVwb3J0LiBZb3Ugc2Fp
ZAo+IHRoYXQgeW91IGhhdmUgdGVzdGVkIGl0IDUwIGNtIGFwYXJ0IGJ1dCBoYXZlIHlvdSB0ZXN0
ZWQgaXQsIGZvciBleGFtcGxlLAo+IDMgbSBhcGFydD8gUGxlYXNlIGFsc28gaW5jbHVkZSB5b3Vy
IGZ1bGwga2VybmVsIC5jb25maWcgZmlsZSBhbmQgZG1lc2cKPiBvdXRwdXQuCj4KPiAtLQo+IGh0
dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcHJvamVjdC9saW51eC13aXJlbGVzcy9saXN0Lwo+
Cj4gaHR0cHM6Ly93aXJlbGVzcy53aWtpLmtlcm5lbC5vcmcvZW4vZGV2ZWxvcGVycy9kb2N1bWVu
dGF0aW9uL3N1Ym1pdHRpbmdwYXRjaGVzCgotLSAKYXRoMTFrIG1haWxpbmcgbGlzdAphdGgxMWtA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2F0aDExawo=
