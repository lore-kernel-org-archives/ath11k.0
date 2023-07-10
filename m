Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 648E8EB64D9
	for <ath11k@archiver.kernel.org>; Mon, 10 Jul 2023 11:02:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IMkqhbIivfP27MM1hFkcdrAiVGkObXDY2XRgVrXoOOQ=; b=PrD29KdUfsgL3/
	KxVv2us+wEYM5evqMVapVhbq9/2JDZfGCOM0uS3Mp/vTOKNW6BVhL9oto6Owx0ymRHFzD0Z73eLoy
	c5ouk59NTNXiV8rKgoZyLRAZs/VhwxrncLXyaXrl9ruDCP6mKgdPKowe/ZUBLBtbSL3PT8+RLgh4+
	nIUAFvIaJmsqh0iYHtVQlYQuXlrhAQ97XM3amyhHZfdGcj2TMd94IBI3tZwyEyu9Ns//xQP87JQtz
	k/7Nal5yp95WolKtXSwJ4XSX5KxdGWbLpxhiu1e/3B1AtIXDGHVPwmVV1tLD26nBIppa5ulEfK3cT
	lPx19TlU8+BGz4CjOm5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qIoei-00BPp9-00;
	Mon, 10 Jul 2023 11:02:12 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qIoed-00BPn8-2t
	for ath11k@lists.infradead.org;
	Mon, 10 Jul 2023 11:02:10 +0000
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-2b702319893so67196101fa.3
        for <ath11k@lists.infradead.org>; Mon, 10 Jul 2023 04:02:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=squaremind-io.20221208.gappssmtp.com; s=20221208; t=1688986922; x=1691578922;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JuI1AtaDdhWF7NCc6Hc97WOaLYYe+3jyQNThbf6myps=;
        b=XFWSrVeCBiWVwBNI5dR+9AGUmb6gOUw+Iq6FwFBTMSZt6xajvu4zfvDpelNZ2l7Sg6
         J1KeVnOCNe/umDV783lLSf2CUcdq6dwxmGJaYudstQ85yd3f2ntVsWlNlZvBbLbGGjm2
         Y/TnJCsytMwYH8PWHxjt4Q0HxUCSjeOC13ghjIvK8hQd9bkkH79PYign3oBStNMpZjqx
         rDq+CL58l8og5PPwAqsRYhHu5lMJf1mpo85mCD54LZEwZpZuAixY91ZewCjPv7VjyaMb
         tZj0zzckDPfDySpqn+O+z8uVKSffbxgYHvaHGbfCALPn8O+JhcaTCmglCJJRttk6V/DX
         Spyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688986922; x=1691578922;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JuI1AtaDdhWF7NCc6Hc97WOaLYYe+3jyQNThbf6myps=;
        b=Ey7S5KsSUcskdF6tJGV5CHUCw2dNWAzZacOLTX7OYOSt1NJQ1MLQcO9YUGPnbcSg8p
         d7mVDyb69YnLIb4W070k6ZzBLOexov4jA3sQKeYl9Hr9/+c/5b8wc/qcwQvWNCDhYRDO
         5TxfLf31z3N00+zjKZtjvt5R2wMP2Gr2l4uxVasiN9Py6JuyccL+OUWaT39IvkqICk+B
         +JXFH2cEG/lDSpBEKcwyjy6BnMNxGsoAM9bHs7gSG5upu+5K6ltVNxwiR4gvWOfoxQPd
         7X5HPedjq0efhaNdc3QkEdQAONwlc9ow8UV9JgWgk/otdlhKIbEcI/B9DEQXhMPJC1kX
         kwwg==
X-Gm-Message-State: ABy/qLaoy/h11iWvc7pMLqGNwH9qBy2p577vrlLJOPV1R8bVf7JljxFz
	EPpKy/y7B4deu3njssyyv/aUr8guH6xzELFBpuLN3g==
X-Google-Smtp-Source: APBJJlGqqZ+G3L2lcxHSxhI6ACzPEny20kNrhohmp+A+bDoyQ7dG1Wc1GgV5a0v/h4WHgOsN5BgO6tf3jNfNX767hDs=
X-Received: by 2002:a2e:854c:0:b0:2b5:974f:385 with SMTP id
 u12-20020a2e854c000000b002b5974f0385mr10315455ljj.9.1688986922312; Mon, 10
 Jul 2023 04:02:02 -0700 (PDT)
MIME-Version: 1.0
References: <CAPr+0Hb5b_CEihVH+Mo-uR4+Wp-ACkoCySkyLrk=mkzme6ezPg@mail.gmail.com>
 <fba6f326-679b-d160-5ab6-3f885bacb5a2@leemhuis.info>
In-Reply-To: <fba6f326-679b-d160-5ab6-3f885bacb5a2@leemhuis.info>
From: Tanguy Serrat <tanguy@squaremind.io>
Date: Mon, 10 Jul 2023 13:01:51 +0200
Message-ID: <CAPr+0HY2iyPiZwABc6+5dBc+MA6CYd6v1hT-QyzApokogFTVvw@mail.gmail.com>
Subject: Re: ath11k: QCN9074: low HE-MCS index
To: Linux regressions mailing list <regressions@lists.linux.dev>
Cc: ath11k@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230710_040208_151848_6005C255 
X-CRM114-Status: GOOD (  25.85  )
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

PiBGV0lXIGZvciBhbnlvbmUgc2VlaW5nIHRoaXMgdGhhdCBtaWdodCB3b25kZXI6IHllcywgdGhp
cyBpcyB0aGUgc2FtZQo+IGlzc3VlIHRoYXQgaXMgYWxyZWFkeSBicm91Z2h0IHVwIG9uIHRoZSBs
aXN0cyBoZXJlOgoKPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMTMyNmE2ZTQtNzU4ZC0z
MzQ0LWQ5MGMtOGExMjY3NDhiMDM0QGdtYWlsLmNvbS8KClRoYW5rIHlvdSBUaG9yc3Rlbi4gVGhp
cyBpcyBhIHNlcGFyYXRlIG5ldyBpc3N1ZS4gSSBoYXZlIG9wZW5lZCBhIG5ldwp0aWNrZXQgaGVy
ZSB3aXRoIG15IGxhdGVzdCBmaW5kaW5nczoKaHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3No
b3dfYnVnLmNnaT9pZD0yMTc2NTIKCkFueSBoZWxwIHdvdWxkIGJlIGdyZWF0bHkgYXBwcmVjaWF0
ZWQsIHRoaXMgaXMgcXVpdGUgYmxvY2tpbmcgaW4gb3VyCnByb2R1Y3QgZGV2ZWxvcG1lbnQuCgoK
TGUgbHVuLiAyNiBqdWluIDIwMjMgw6AgMTU6NTAsIExpbnV4IHJlZ3Jlc3Npb24gdHJhY2tpbmcg
KFRob3JzdGVuCkxlZW1odWlzKSA8cmVncmVzc2lvbnNAbGVlbWh1aXMuaW5mbz4gYSDDqWNyaXQg
Ogo+Cj4gT24gMjYuMDYuMjMgMTQ6MjcsIFRhbmd1eSBTZXJyYXQgd3JvdGU6Cj4gPgo+ID4gSW4g
bXkgcXVlc3QgdG8gZ2V0IDJ4IFFDTjkwNzQgcGFpcmVkIGFuZCBhY2hpZXZpbmcgaGlnaCB0aHJv
dWdocHV0Cj4gPiBkYXRhIHRyYW5zZmVycywgSSBhbSBub3cgZmFjaW5nIGlzc3VlcyB3aXRoIHRo
ZSBBUCBjb25maWd1cmF0aW9uLgo+ID4KPiA+IFNwZWNpZmljYWxseSwgSSBjYW5ub3QgZ2V0IG1v
cmUgdGhhbiBIRS1NQ1MgNSAoQVAgYW5kIGNsaWVudCA1MGNtCj4gPiBhcGFydCkgYWx0aG91Z2gg
U05SIGFuZCBSU1NJIGFyZSBhbHdheXMgdmVyeSBzdHJvbmcgYW5kIHN1cHBvc2VkbHkgaW4KPiA+
IHNwZWNzIChTTlIgPiA0MGRiIG9yIFJTU0kgPCAtNDhkYikuCj4KPiBGV0lXIGZvciBhbnlvbmUg
c2VlaW5nIHRoaXMgdGhhdCBtaWdodCB3b25kZXI6IHllcywgdGhpcyBpcyB0aGUgc2FtZQo+IGlz
c3VlIHRoYXQgaXMgYWxyZWFkeSBicm91Z2h0IHVwIG9uIHRoZSBsaXN0cyBoZXJlOgo+Cj4gaHR0
cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzEzMjZhNmU0LTc1OGQtMzM0NC1kOTBjLThhMTI2NzQ4
YjAzNEBnbWFpbC5jb20vCj4KPiBTYWRseSBub3RoaW5nIG11Y2ggY2FtZSBmcm9tIGl0IChhbmQg
Y29pbmNpZGVudGFsbHkgSSB0cmllZCB0byByZXZpdmUKPiB0aGF0IHRocmVhZCBhIGZldyBtaW51
dGVzIGFmdGVyIFRhbmd1eSBTZXJyYXQgc2VudCB0aGUgcXVvdGVkIG1haWwsCj4gd2hpY2ggd2Fz
IGFuIGhvdXIgYmVmb3JlIEkgc2F3IGl0IC0tIGFrYTogcmFjZSBjb25kaXRpb24pLiBXZWxsLCBt
YXliZQo+IG9uZSBvZiB0aGVzZSBtYWlscyBob3BlZnVsbHkgd2lsbCBoZWxwLgo+Cj4gQ2lhbywg
VGhvcnN0ZW4gKHdlYXJpbmcgaGlzICd0aGUgTGludXgga2VybmVsJ3MgcmVncmVzc2lvbiB0cmFj
a2VyJyBoYXQpCj4gLS0KPiBFdmVyeXRoaW5nIHlvdSB3YW5uYSBrbm93IGFib3V0IExpbnV4IGtl
cm5lbCByZWdyZXNzaW9uIHRyYWNraW5nOgo+IGh0dHBzOi8vbGludXgtcmVndHJhY2tpbmcubGVl
bWh1aXMuaW5mby9hYm91dC8jdGxkcgo+IElmIEkgZGlkIHNvbWV0aGluZyBzdHVwaWQsIHBsZWFz
ZSB0ZWxsIG1lLCBhcyBleHBsYWluZWQgb24gdGhhdCBwYWdlLgo+Cj4gI3JlZ3pib3QgXmJhY2tt
b25pdG9yOiBkOTBjLThhMTI2NzQ4YjAzNEBnbWFpbC5jb20vCj4KPiA+IGl3IHdscDZzMCBsaW5r
Cj4gPiBDb25uZWN0ZWQgdG8gMDA6MTU6NjE6Mjc6Y2Q6ZGMgKG9uIHdscDZzMCkKPiA+IFNTSUQ6
IFNwYWNlCj4gPiBmcmVxOiA1NzQ1Cj4gPiBSWDogMTA3MzU4NDQ4MiBieXRlcyAoNzA4NTY3IHBh
Y2tldHMpCj4gPiBUWDogMzU1ODI0MjE0IGJ5dGVzICgyNTYxNDMgcGFja2V0cykKPiA+IHNpZ25h
bDogLTQwIGRCbQo+ID4gcnggYml0cmF0ZTogMTcyOS4zIE1CaXQvcyAxNjBNSHogSEUtTUNTIDQg
SEUtTlNTIDQgSEUtR0kgMCBIRS1EQ00gMAo+ID4gdHggYml0cmF0ZTogMTcyOS4zIE1CaXQvcyAx
NjBNSHogSEUtTUNTIDQgSEUtTlNTIDQgSEUtR0kgMCBIRS1EQ00gMAo+ID4KPiA+IEluIHRoaXMg
Y2FzZSBpcGVyZjMgc2hvd3Mgfjk1ME1iaXRzL3MgdHJhbnNmZXIgc3BlZWQuIEkgYW0gaG9waW5n
IHRvCj4gPiBnZXQgYXQgbGVhc3QgdHdpY2UgYXMgbXVjaC4KPiA+Cj4gPiBJdCBzZWVtcyB0byBt
ZSB0aGF0IGVpdGhlciBtYWM4MDIxMSwgYXRoMTFrIG9yIGhvc3RhcGQgYXJlIG5vdAo+ID4gYWR2
ZXJ0aXNpbmcgdGhlIGF2YWlsYWJsZSBjYXBhYmlsaXRpZXMgY29ycmVjdGx5LiBJIGhhdmUgdHJp
ZWQgc2V0dGluZwo+ID4gaG9zdGFwZCBoZV9iYXNpY19tY3Nfc2V0PTY1NTMwIG9yIG90aGVycyBi
dXQgZGlkIG5vdCBoZWxwLgo+ID4KPiA+IEkgaGF2ZSBhZGRlZCBpZWVlODAyMTFfcmVnZG9tPUZS
IG9wdGlvbiB0byBjZmc4MDIxMSBtb2R1bGUgb24gdGhlIEFQCj4gPiBzaWRlLiBDaGFubmVsIHNl
bGVjdGlvbiBpcyBkb25lIHdpdGggQUNTIHN1cnZleS4gSSBhbHNvIHRyaWVkIG90aGVyCj4gPiBj
aGFubmVscy9mcmVxdWVuY2llcyB3aXRob3V0IHN1Y2Nlc3MgZWcuIDU1MDBNaHouCj4gPgo+ID4g
aXcgcmVnIGdldAo+ID4gZ2xvYmFsCj4gPiBjb3VudHJ5IEZSOiBERlMtRVRTSQo+ID4gKDI0MDAg
LSAyNDgzIEAgNDApLCAoTi9BLCAyMCksIChOL0EpCj4gPiAoNTE1MCAtIDUyNTAgQCA4MCksIChO
L0EsIDIzKSwgKE4vQSksIE5PLU9VVERPT1IsIEFVVE8tQlcKPiA+ICg1MjUwIC0gNTM1MCBAIDgw
KSwgKE4vQSwgMjApLCAoMCBtcyksIE5PLU9VVERPT1IsIERGUywgQVVUTy1CVwo+ID4gKDU0NzAg
LSA1NzI1IEAgMTYwKSwgKE4vQSwgMjYpLCAoMCBtcyksIERGUwo+ID4gKDU3MjUgLSA1ODc1IEAg
ODApLCAoTi9BLCAxMyksIChOL0EpCj4gPiAoNTk0NSAtIDY0MjUgQCAxNjApLCAoTi9BLCAyMyks
IChOL0EpLCBOTy1PVVRET09SCj4gPiAoNTcwMDAgLSA3MTAwMCBAIDIxNjApLCAoTi9BLCA0MCks
IChOL0EpCj4gPgo+ID4gcGh5IzAgKHNlbGYtbWFuYWdlZCkKPiA+IGNvdW50cnkgVVM6IERGUy1G
Q0MKPiA+ICgyNDAyIC0gMjQ3MiBAIDQwKSwgKDYsIDMwKSwgKE4vQSkKPiA+ICg1MTcwIC0gNTI1
MCBAIDgwKSwgKE4vQSwgMzApLCAoTi9BKSwgQVVUTy1CVwo+ID4gKDUyNTAgLSA1MzMwIEAgODAp
LCAoTi9BLCAyNCksICgwIG1zKSwgREZTLCBBVVRPLUJXCj4gPiAoNTQ5MCAtIDU3MzAgQCAxNjAp
LCAoTi9BLCAyNCksICgwIG1zKSwgREZTLCBBVVRPLUJXCj4gPiAoNTczNSAtIDU4OTUgQCAxNjAp
LCAoTi9BLCAzMCksIChOL0EpLCBBVVRPLUJXCj4gPiAoNTk0NSAtIDcxMjUgQCAxNjApLCAoTi9B
LCAyNyksIChOL0EpLCBOTy1PVVRET09SLCBBVVRPLUJXCj4gPgo+ID4gQ3VycmVudCBzZXR1cCBp
czoKPiA+IC0gSW50ZWwgeDg2Cj4gPiAtIFVidW50dSAyMi4wNAo+ID4gLSBLZXJuZWwgYnVpbHQg
ZnJvbSBhdGggNi40LjAtcmM2LXd0LWF0aCsgKGNvbW1pdDoKPiA+IGM2MGQxNWYzODllZjk4MzJh
OGRhNDEwZTQzOGQ4MWIxMDMyNzc1MWYpCj4gPiB3aXRoIGNvbW1pdCByZXZlcnRlZCBmcm9tIHRo
ZSBidWcgdGlja2V0IEkgb3BlbmVkCj4gPiAoaHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3No
b3dfYnVnLmNnaT9pZD0yMTc1MzYpLgo+ID4gLSAxeCBRQ045MDc0IGFzIEFQLCAxeCBhcyBtYW5h
Z2VkIGNsaWVudCA1MGNtIGFwYXJ0Cj4gPiAtIEJvdGggQVAgYW5kIENsaWVudCBhcmUgcnVubmlu
ZyB3aXRoIHRoZSBsYXRlc3QgMi43LjAgRlcuCj4gPgo+ID4gSSBoYXZlIHN0YXJ0ZWQgZnJvbSB0
aGlzIHRpY2tldAo+ID4gKGh0dHBzOi8vYnVnemlsbGEua2VybmVsLm9yZy9zaG93X2J1Zy5jZ2k/
aWQ9MjE3Mjg2KSBob3N0YXBkIGNvbmZpZwo+ID4gZmlsZSwgYW5kIGFkYXB0ZWQsIHBsZWFzZSBm
aW5kIGF0dGFjaGVkLgo+ID4KPiA+IEFueW9uZSBzZWVpbmcgd2hhdCBjb3VsZCBiZSBteSBpc3N1
ZSAvIGhvdyBJIGNvdWxkIGRlYnVnIGZ1cnRoZXIgPwo+ID4KPiA+IFRoYW5rIHlvdSAhCj4gPiBU
YW5ndXkKPiA+Cj4gPgoKLS0gCmF0aDExayBtYWlsaW5nIGxpc3QKYXRoMTFrQGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9hdGgx
MWsK
