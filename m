Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62177C74A5B
	for <ath11k@archiver.kernel.org>; Wed, 29 Mar 2023 10:42:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bhXBBrgfxo3EPz49Ct/KLKbbxbiIe/LaWnZLkt7CnPA=; b=MUZkx7kWgMQ8eA
	FKlztMytyeYUTan90gG8fLRivFbSldEEibJ8SVQaUbDyQe+DqrLViqD+HT50xN/zlf63fKof9572X
	FD/dy17rqm2517IreQ1N99ct5tVxrzpPqGRINJC6rusHeHRmJFIeqhhcWIHbpzCW87wCy+8B2ku7Q
	PMykqxHWqD/qQapmlQY3D1KAI91T/tMCQiCV5HtxzdmF8idb7Vp3jVt/vcHaDgYLwC5aBlF+ZpFNO
	ZpjF8jk69Y0YWwnANXzV9ObgquFGw4XvJrW3dzlRIVCj5TEbBoWDN+XyJuwpXWy+5d67Yfi3JreAa
	BIg2868vSZjxj+caFUBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phTGU-00HV2h-02;
	Wed, 29 Mar 2023 10:42:50 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phTGR-00HV1f-1f
	for ath11k@lists.infradead.org;
	Wed, 29 Mar 2023 10:42:48 +0000
Received: by mail-pf1-x42e.google.com with SMTP id cm5so4150032pfb.0
        for <ath11k@lists.infradead.org>; Wed, 29 Mar 2023 03:42:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1680086565;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2pqAbUFfZiNAhVrRkDDtYoGzMzm37Wd82TtGFY4R3UI=;
        b=s0u0upSbIUKtRcAK0o7kK2itfM/jxmnYT3JBkMYKb9duYTH2DIjSlFLFsgkPeNa10r
         +FSc9ZFLQmMokiJ61N+ZFV0MN0GikoBkv+8xYN84qBheVTrDwLRjYByfbtLpQE+KzauL
         wuBtte2nZdW4kYI5kFbgjjyD7X4/BFw5MsCDPR4yc2hgq9nv1vP4gSE13Fw1hrRdCAfM
         WA/PRvIGBjf2mxPI5GOaJ+ltD8BDhYpHEVKV1/0Rspq06QsSfA36r0oL73rx4kAUf3ZX
         k76L3Df19RpQMXVppI+bEKLvQ2uOrq2f80skSAMsrTGFusHpHfIYg7Hdwwry/Obx4Lfn
         eeFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680086565;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2pqAbUFfZiNAhVrRkDDtYoGzMzm37Wd82TtGFY4R3UI=;
        b=oPM9c7JJR0rQ2ZR/WA4S/8ryHg2JD3ASVnN81yaLtKyTBA/EZ3JvFmCc4iGtfrxgqP
         3TqKy9CPSglKizvlH04stjY5Ui0PK5chxQWFy5j4Sazn9mOBNoeHbfafw3u6xBzPjouv
         VFjA4dPgwZns0b/wovrripxP1p5+OtrRZoHRR5GHmzo/kyp5IjxylQHpUiBP99np0Dqf
         V7ywGdmLLLLvuu8wNu2M3Kz8D7CoPNoE4QwVAS2YSKXIpV+vDymDd9D+yH1iluP6TFHM
         ttHI7IYIwf/z2zP6JVegpCTEXV+O4hmxURLmJJgH7XUaWfNUM5YB+zWN6Lulpv7Bm405
         +WIg==
X-Gm-Message-State: AAQBX9cCO8Q5UKZw7in6qUnM/z+dxvHcxh8X4fmpooR3/tm0vJd2EcXx
	zYHyPCAJbZmxpwNnkYhZp6WlHq3aVw14YmCBJgZ86yCgdBKWkd2Y
X-Google-Smtp-Source: AKy350Yo8TVnevEY8VdJ78n97+w7knMlBtntmkhqLIV2dPuhf6x+6a+8fOe4sJdxednmNd9dC1IRhn76LC0i5ZDbidk=
X-Received: by 2002:a05:6a00:2d1d:b0:61c:67d2:a332 with SMTP id
 fa29-20020a056a002d1d00b0061c67d2a332mr1039907pfb.3.1680086565027; Wed, 29
 Mar 2023 03:42:45 -0700 (PDT)
MIME-Version: 1.0
References: <1666128501-12364-1-git-send-email-quic_msinada@quicinc.com>
 <1666128501-12364-3-git-send-email-quic_msinada@quicinc.com>
 <CA+HBbNHw-0+Ty_-masxGKwT6ju_EBxT3n5B0Ygcn3XzQi_CzWg@mail.gmail.com> <87fs9ndh6s.fsf@kernel.org>
In-Reply-To: <87fs9ndh6s.fsf@kernel.org>
From: Robert Marko <robert.marko@sartura.hr>
Date: Wed, 29 Mar 2023 12:42:34 +0200
Message-ID: <CA+HBbNEaNTkUv_UPgQievxaLya0XC6=AVj0=GWiH+qB9=vRZHg@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] wifi: ath11k: push MU-MIMO params from hostapd to hardware
To: Kalle Valo <kvalo@kernel.org>
Cc: Muna Sinada <quic_msinada@quicinc.com>, ath11k@lists.infradead.org, 
	linux-wireless@vger.kernel.org, Anilkumar Kolli <quic_akolli@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230329_034247_560252_E74E2DC8 
X-CRM114-Status: GOOD (  22.76  )
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

T24gV2VkLCBNYXIgMjksIDIwMjMgYXQgMTE6NDXigK9BTSBLYWxsZSBWYWxvIDxrdmFsb0BrZXJu
ZWwub3JnPiB3cm90ZToKPgo+IFJvYmVydCBNYXJrbyA8cm9iZXJ0Lm1hcmtvQHNhcnR1cmEuaHI+
IHdyaXRlczoKPgo+ID4gT24gVHVlLCBPY3QgMTgsIDIwMjIgYXQgMTE6MjjigK9QTSBNdW5hIFNp
bmFkYSA8cXVpY19tc2luYWRhQHF1aWNpbmMuY29tPiB3cm90ZToKPiA+Cj4gPj4KPiA+PiBJbiB0
aGUgcHJldmlvdXMgYmVoYXZpb3VyIG9ubHkgSEUgSUUgaW4gbWFuYWdlbWVudCBmcmFtZXMgYXJl
IGNoYW5nZWQKPiA+PiByZWdhcmRpbmcgTVUtTUlNTyBjb25maWd1cmF0aW9ucyBhbmQgbm90IGlu
IGhhcmR3YXJlLiBBZGRpbmcgcHVzaCBvZgo+ID4+IE1VLU1JTU8gY29uZmlndXJhdGlvbnMgdG8g
dGhlIGhhcmR3YXJlIGFzIHdlbGwuCj4gPj4KPiA+PiBUaGlzIHBhdGNoIGlzIGRlcGVuZGFudCBv
biBtYWM4MDIxMSBwYXRjaHNldDoKPiA+PiBodHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3By
b2plY3QvbGludXgtd2lyZWxlc3MvbGlzdC8/c2VyaWVzPTY4MzMyMiZzdGF0ZT0lMkEmYXJjaGl2
ZT1ib3RoCj4gPj4KPiA+PiBUZXN0ZWQtb246IElQUTgwNzQgaHcyLjAgQUhCIFdMQU4uSEsuMi40
LjAuMS0wMDM1Ni1RQ0FIS1NXUExfU0lMSUNPTlotMQo+ID4+Cj4gPj4gQ28tZGV2ZWxvcGVkLWJ5
OiBBbmlsa3VtYXIgS29sbGkgPHF1aWNfYWtvbGxpQHF1aWNpbmMuY29tPgo+ID4+IFNpZ25lZC1v
ZmYtYnk6IEFuaWxrdW1hciBLb2xsaSA8cXVpY19ha29sbGlAcXVpY2luYy5jb20+Cj4gPj4gU2ln
bmVkLW9mZi1ieTogTXVuYSBTaW5hZGEgPHF1aWNfbXNpbmFkYUBxdWljaW5jLmNvbT4KPgo+IFsu
Li5dCj4KPiA+PiBAQCAtNTM2OSw2ICs1NDkxLDEwIEBAIHN0YXRpYyBpbnQgYXRoMTFrX21hY19j
b3B5X2hlX2NhcChzdHJ1Y3QgYXRoMTFrICphciwKPiA+Pgo+ID4+ICAgICAgICAgICAgICAgICBo
ZV9jYXBfZWxlbS0+bWFjX2NhcF9pbmZvWzFdICY9Cj4gPj4gICAgICAgICAgICAgICAgICAgICAg
ICAgSUVFRTgwMjExX0hFX01BQ19DQVAxX1RGX01BQ19QQURfRFVSX01BU0s7Cj4gPj4gKyAgICAg
ICAgICAgICAgIGhlX2NhcF9lbGVtLT5waHlfY2FwX2luZm9bMF0gJj0KPiA+PiArICAgICAgICAg
ICAgICAgICAgICAgICB+SUVFRTgwMjExX0hFX1BIWV9DQVAwX0NIQU5ORUxfV0lEVEhfU0VUXzE2
ME1IWl9JTl81RzsKPiA+PiArICAgICAgICAgICAgICAgaGVfY2FwX2VsZW0tPnBoeV9jYXBfaW5m
b1swXSAmPQo+ID4+ICsgICAgICAgICAgICAgICAgICAgICAgIH5JRUVFODAyMTFfSEVfUEhZX0NB
UDBfQ0hBTk5FTF9XSURUSF9TRVRfODBQTFVTODBfTUhaX0lOXzVHOwo+ID4KPiA+IFRoaXMgaXMg
Y2F1c2luZyBhIHJlZ3Jlc3Npb24gZm9yIHVzIGluIE9wZW5XcnQgYXQgbGVhc3Qgb24gSVBRODA3
NCBidXQKPiA+IHByb2JhYmx5IG9uIGFsbCBhdGgxMWstc3VwcG9ydGVkIEhXLiBDYXVzZSA4MCs4
MCBhbmQgMTYwTUh6IHN1cHBvcnQKPiA+IGJpdHMgYXJlIGJlaW5nIGNsZWFyZWQgaGVyZSBzbyAx
NjBNSHogaXMgbm90IGJlaW5nIGFkdmVydGlzZWQgYWZ0ZXIKPiA+IHRoaXMgcGF0Y2guCj4KPiBP
aCBtYW4sIG5vdCBnb29kLiBSb2JlcnQsIHNob3VsZCB3ZSByZXZlcnQgdGhpcyBwYXRjaHNldCBl
bnRpcmVseT8gT2YKPiBjb3Vyc2UgaXQgd291bGQgYmUgYmV0dGVyIGlmIE11bmEgY2FuIHN1Ym1p
dCBxdWlja2x5IGEgZml4LCBidXQgSSdtIG5vdAo+IGdvaW5nIHRvIHdhaXQgZm9yIGxvbmcuCgpJ
IHdvdWxkIHByZWZlciB0byBzZWUgaXQgZ2V0IGZpeGVkLCBjYXVzZSBqdXN0IHJlbW92aW5nIHRo
ZSBmbGFnCnJlbW92YWwgZ2V0cyAxNjBNSHogd29ya2luZywKYnV0IEkgYW0gbm90IHN1cmUgYWJv
dXQgb3RoZXIgZmxhZ3MgYXMgd2VsbC4KClJlZ2FyZHMsClJvYmVydAo+Cj4gVGhlIHBhdGNoc2V0
IGlzIGluIHdpcmVsZXNzLW5leHQgYXQgdGhlIG1vbWVudCBhbmQgdGhlIGNvbW1pdHMgZnJvbSB0
aGUKPiBwYXRjaHNldCBhcmU6Cj4KPiBhOTZmMTA0MjJlNzQgd2lmaTogYXRoMTFrOiBtb2RpZnkg
YWNjZXNzb3IgbWFjcm9zIHRvIG1hdGNoIGluZGV4IHNpemUKPiAzOGRmZTc3NWQwYWIgd2lmaTog
YXRoMTFrOiBwdXNoIE1VLU1JTU8gcGFyYW1zIGZyb20gaG9zdGFwZCB0byBoYXJkd2FyZQo+IDgw
NzdjMWJiYmMyOCB3aWZpOiBhdGgxMWs6IG1vdmUgSEUgTUNTIG1hcHBlciB0byBhIHNlcGFyYXRl
IGZ1bmN0aW9uCj4gZWJmODI5ODhmODQ0IHdpZmk6IGF0aDExazogZ2VuZXJhdGUgcnggYW5kIHR4
IG1jcyBtYXBzIGZvciBzdXBwb3J0ZWQgSEUgbWNzCj4KPiA+IEkgZmFpbCB0byB1bmRlcnN0YW5k
IHdoeSBhcmUgODArODAgYW5kIDE2MCBNSHogZmVhdHVyZSBmbGFncyBiZWluZyBjbGVhcmVkPwo+
Cj4gTWUgbmVpdGhlci4gSSBtaXNzZWQgdGhhdCBpbiBteSByZXZpZXcuCj4KPiAtLQo+IGh0dHBz
Oi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcHJvamVjdC9saW51eC13aXJlbGVzcy9saXN0Lwo+Cj4g
aHR0cHM6Ly93aXJlbGVzcy53aWtpLmtlcm5lbC5vcmcvZW4vZGV2ZWxvcGVycy9kb2N1bWVudGF0
aW9uL3N1Ym1pdHRpbmdwYXRjaGVzCgoKCi0tIApSb2JlcnQgTWFya28KU3RhZmYgRW1iZWRkZWQg
TGludXggRW5naW5lZXIKU2FydHVyYSBMdGQuCkxlbmRhdnNrYSB1bGljYSAxNmEKMTAwMDAgWmFn
cmViLCBDcm9hdGlhCkVtYWlsOiByb2JlcnQubWFya29Ac2FydHVyYS5ocgpXZWI6IHd3dy5zYXJ0
dXJhLmhyCgotLSAKYXRoMTFrIG1haWxpbmcgbGlzdAphdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2F0aDExawo=
