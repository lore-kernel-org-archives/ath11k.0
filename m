Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 093D1C433EF
	for <ath11k@archiver.kernel.org>; Wed,  2 Mar 2022 18:00:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/nf1xcCXxS12BUmvtE5AgGFMSlbEw+tsdtdl/OiAoAk=; b=ViO8/IgpiBr/Cx
	Mv1l+0oS6fU0u3X2J3IEWNND7j+aCJY7z2mn7BSbeNlCYG9zboYVTVJITLZw9ZIKodQVtuhGha0ZO
	NjHxxKJlSXhRUzJVuLHSb15iJv3RV4vioXaNUw5EiY4uxh4q/3sAfvpv3MU58+jFeJKcdYrRbMXye
	etpUOWHS/rUK5U2aU48PW12eqOh2hCrjUDO7L3cSFTKIFouNTGkJdrLGav3gtFV8j6Ggmi22KGEJq
	eZmp5izbQJPB/dm4/OVNFuoILuGDrRQI05E+H8S36g4G3Su7w+uyAHIT15QTIhid8uMq9WNj4cHg/
	TmZRG/Ehnrvpov8M1NuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nPTH9-003hrs-G2; Wed, 02 Mar 2022 18:00:35 +0000
Received: from mail.w1.fi ([212.71.239.96])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nPT7J-003esC-P3
 for ath11k@lists.infradead.org; Wed, 02 Mar 2022 17:50:27 +0000
Received: from localhost (localhost [127.0.0.1])
 by mail.w1.fi (Postfix) with ESMTP id 9C0CD10FB1;
 Wed,  2 Mar 2022 17:50:18 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at w1.fi
Received: from mail.w1.fi ([127.0.0.1])
 by localhost (mail.w1.fi [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XhKH9mXcoUA0; Wed,  2 Mar 2022 17:50:16 +0000 (UTC)
Received: by jm (sSMTP sendmail emulation); Wed, 02 Mar 2022 19:50:14 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=w1.fi; s=default;
 t=1646243416; bh=hjH28rMHWPqV8u0M5BGXXoiITE9qsVcforZPtpPdcFI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=vnqwv9F++gHGVjfVTdR6PEJoJ+v6+hnA5LTehj8YD7vvxvVAhJH1h1DBxo+9ANJEt
 iC+XiV4ASw3VfN7HoVnSmIP4WpgXmnOvN/7WF2qSc6eLHxSQkH6G3zx7LRnh6sFHrk
 43u1B3UnmLuNPLRfhGQfCK2PXtmzG2uk2a9BRZkq0Me1syNXuUXSqO0up2yIfygOqX
 OebZMG+RTuLXAq7EoWajL8HwlrT4kVqdFU9+tGN4OMbA7oG2pHFKPNaulUfDXO70yS
 5uD9XljTn7OR939AXTOF5uk4V3WEa++BTHtLIDjWdkShvaqJ5oSFT1I8QseeSxU09C
 mFmkNJ/D/0+UQ==
Date: Wed, 2 Mar 2022 19:50:14 +0200
From: Jouni Malinen <j@w1.fi>
To: Josh Boyer <jwboyer@kernel.org>
Cc: Kalle Valo <kvalo@kernel.org>,
 "linux-firmware@kernel.org" <linux-firmware@kernel.org>,
 "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
 "ath11k@lists.infradead.org" <ath11k@lists.infradead.org>
Subject: Re: [PULL] ath11k firmware 20211223
Message-ID: <20220302175014.GA14801@w1.fi>
References: <BYAPR02MB4567669033A210A78AC397E9927E9@BYAPR02MB4567.namprd02.prod.outlook.com>
 <CA+5PVA4WEuJDB3OCKfYK-BPaccpVWd9t_au9S7MCEtpy7cdF-A@mail.gmail.com>
 <87ee4brodv.fsf@kernel.org>
 <CA+5PVA5DJmwPqpz8F9iDbJKcF1hDBRLdDT4URgSaiEcjet74Kw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CA+5PVA5DJmwPqpz8F9iDbJKcF1hDBRLdDT4URgSaiEcjet74Kw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220302_095026_171412_AF501FAA 
X-CRM114-Status: GOOD (  38.09  )
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

T24gRnJpLCBGZWIgMTgsIDIwMjIgYXQgMTA6NTU6MzdBTSAtMDUwMCwgSm9zaCBCb3llciB3cm90
ZToKPiBPbiBUaHUsIEZlYiAxMCwgMjAyMiBhdCA1OjQ1IEFNIEthbGxlIFZhbG8gPGt2YWxvQGtl
cm5lbC5vcmc+IHdyb3RlOgo+ID4gPiBPbiBUaHUsIERlYyAyMywgMjAyMSBhdCA5OjAzIEFNIEth
bGxlIFZhbG8gPGt2YWxvQHFjYS5xdWFsY29tbS5jb20+IHdyb3RlOgo+ID4gPj4KPiA+ID4+ICBX
SEVOQ0UgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgMTQgKy0KPiA+ID4+ICBhdGgxMWsv
SVBRNjAxOC9odzEuMC9Ob3RpY2UudHh0ICB8ICAgNDggKy0KCj4gPiA+IFRoZXNlIE5vdGljZSBm
aWxlcyBzZWVtIHByb2JsZW1hdGljLiAgVGhleSdyZSBjbGVhcmx5IHdlbGwgaW50ZW5kZWQsCj4g
PiA+IGJ1dCB0aGV5IGhhdmUgbGFuZ3VhZ2UgdGhhdCBhbGx1ZGVzIHRvIGFuIGFncmVlbWVudCB3
aXRoIEF0aGVyb3MgYW5kIGEKPiA+ID4gY29uZmlkZW50aWFsIG5hdHVyZSB0byBzb21lIG9mIHRo
ZSBmaWxlcy4gIFNwZWNpZmljYWxseToKPiA+ID4KPiA+ID4gIi4uLnlvdXIgdXNlIG9mIHRoZXNl
IHNvZnR3YXJlCj4gPiA+IGNvbXBvbmVudHMgdG9nZXRoZXIgd2l0aCB0aGUgUXVhbGNvbW0gQXRo
ZXJvcyBzb2Z0d2FyZSAoUXVhbGNvbW0KPiA+ID4gQXRoZXJvcyBzb2Z0d2FyZSBoZXJlaW5hZnRl
ciByZWZlcnJlZCB0byBhcyDigJxTb2Z0d2FyZeKAnSkgaXMKPiA+ID4gc3ViamVjdCB0byB0aGUg
dGVybXMgb2YgeW91ciBhZ3JlZW1lbnQgZnJvbSBRdWFsY29tbSBBdGhlcm9zLiIKPiA+ID4KPiA+
ID4gTm9ib2R5IGhhcyBhbiBvcHBvcnR1bml0eSB0byBhZ3JlZSB0byBhbnl0aGluZyB3aXRoIEF0
aGVyb3Mgd2hlbiB0aGV5Cj4gPiA+IGNvbnN1bWUgdGhlIGZpbGVzIGZyb20gbGludXgtZmlybXdh
cmUuICBUaGVyZSdzIGFsc28gbm8gZXhwbGljaXQgZ3JhbnQKPiA+ID4gb2YgcmVkaXN0cmlidXRp
b24gZm9yIGFueSBvZiB0aGVzZSBmaWxlcy4KClRoaXMgaXMgbm90IHRoZSBsaWNlbnNlOyB0aGlz
IGlzIGEgZGVzY3JpcHRpb24gb2YgdGhlIG5vdGljZS50eHQgZmlsZQpjb250YWluaW5nIHRoZSBu
b3RpY2VzIHRvIGNvdmVyIHRoZSAzcmQgcGFydHkgbGljZW5zZSByZXF1aXJlbWVudHMgZm9yCmF0
dHJpYnV0aW9uL25vdGljZXMgaW5jbHVkZWQgaW4gcmVkaXN0cmlidXRpb24gb2YgdGhvc2UgcGFy
dHMuCgo+ID4gU28gdGhpcyBmaWxlIHdlIGFyZSBkaXNjdXNzaW5nIGlzIHRoZSBub3RpY2UudHh0
IGZpbGUuIEluIHRoZSBXSEVOQ0UKPiA+IGZpbGUgdGhlIGFjdHVhbCBsaWNlbnNlIGZvciBhdGgx
MWsgaXM6Cj4gPgo+ID4gTGljZW5jZTogUmVkaXN0cmlidXRhYmxlLiBTZWUgTElDRU5TRS5RdWFs
Y29tbUF0aGVyb3NfYXRoMTBrIGZvciBkZXRhaWxzCgpBbmQgdGhpcyBpcyB3aGVyZSB0aGUgbGlj
ZW5zZSBpcyBhbmQgdGhpcyBpbmNsdWRlcyBsaWNlbnNlIHRvCnJlZGlzdHJpYnV0ZS4KCj4gVGhl
biBpcyB0aGUgbm90aWNlLnR4dCBmaWxlIG5lZWRlZCBhdCBhbGw/ICBJZiBhIHVzZXIgb3IgZGlz
dHJpYnV0aW9uCj4gd2VyZSB0byBpbnN0YWxsIHRoaXMgZmlybXdhcmUsIGlzIHRoZSBleHBlY3Rh
dGlvbiB0aGF0IHRoZSBub3RpY2UudHh0Cj4gZmlsZSBhbHNvIGJlIGluc3RhbGxlZD8KClRob3Nl
IDNyZCBwYXJ0eSBsaWNlbnNlIG1pZ2h0IHJlcXVpcmUgdmFyaW91cyBub3RpZmljYXRpb25zIHRv
IGJlCmluY2x1ZGVkIGZvciBub3RpZmljYXRpb24vYXR0cmlidXRpb24gcHVycG9zZXMsIHNvIEkg
d291bGQgZXhwZWN0IHRoZQpub3RpY2UudHh0IGZpbGUgdG8gYmUgcmVkaXN0cmlidXRlZCB3aGVu
ZXZlciB0aGUgZmlybXdhcmUgaW1hZ2UgaXMKcmVkaXN0cmlidXRlZC4KCj4gPiBEb2VzIHRoYXQg
Y292ZXIgeW91ciBjb25jZXJucyBhYm91dCByZWRpc3RyaWJ1dGlvbj8KPiAKPiBOb3QgcmVhbGx5
LiAgSSB1bmRlcnN0YW5kIHRoZSBsb2dpYywgYnV0IGlmIHRoZSBiaW5kaW5nIGxpY2Vuc2UgZm9y
Cj4gdGhlIGZpcm13YXJlIGlzIExJQ0VOU0UuUXVhbGNvbW1BdGhlcm9zX2F0aDEwayBidXQgd2Ug
c3RpbGwgbmVlZAo+IG5vdGljZS50eHQgZm9yIHNvbWUgcmVhc29uLCB0aGV5IGNvbmZsaWN0LiAg
SXQncyBhbWJpZ3VvdXMgYXQgYmVzdC4KCkNvdWxkIHlvdSBwbGVhc2UgYmUgbW9yZSBzcGVjaWZp
YyBvbiB3aGVyZSB5b3Ugc2VlIGEgY29uZmxpY3Q/IE1heWJlCnRoaXMgd291bGQgYmUgY2xlYXJl
ciBpZiB0aGUgV0hFTkNFIGZpbGUgd291bGQgbm90IG1hcmsgdGhlIG5vdGljZS50eHQKZmlsZXMg
d2l0aCB0aGUgIkxpY2Vuc2U6IDxmaWxlPiIgbGluZXMgc2luY2UgdGhlc2UgYXJlIG5vdCB0aGUg
bGljZW5zZQpmb3IgdGhlIGZpcm13YXJlIGJpbmFyeSBhbmQgdGhlbiB0aGVyZSB3b3VsZCBiZSBh
IHNpbmdsZSAiTGljZW5zZToiIGxpbmUKcG9pbnRpbmcgb3V0IHRoZSBleGFjdCBsaWNlbnNlIHRo
YXQgYXBwbGllcz8KCldvdWxkIHRoZSBmb2xsb3dpbmcgaW4gV0hFTkNFIHdvcmsgZm9yIHlvdT8K
CkRyaXZlcjogYXRoMTFrIC0gUXVhbGNvbW0gVGVjaG5vbG9naWVzIDgwMi4xMWF4IGNoaXBzZXQg
c3VwcG9ydAoKRmlsZTogYXRoMTFrL0lQUTYwMTgvaHcxLjAvYm9hcmQtMi5iaW4KLi4uClZlcnNp
b246IFdMQU4uSEsuMi4xLjAuMS0wMTIzOC1RQ0FIS1NXUExfU0lMSUNPTlotMgpOb3RpY2U6IGF0
aDExay9JUFE2MDE4L2h3MS4wL05vdGljZS50eHQKLi4uCkZpbGU6IGF0aDExay9RQ0E2MzkwL2h3
Mi4wL20zLmJpbgpWZXJzaW9uOiBXTEFOLkhTVC4xLjAuMS0wMTc0MC1RQ0FIU1RTV1BMWl9WMl9U
T19YODYtMQpOb3RpY2U6IGF0aDExay9RQ0E2MzkwL2h3Mi4wL05vdGljZS50eHQKCkxpY2VuY2U6
IFJlZGlzdHJpYnV0YWJsZS4gU2VlIExJQ0VOU0UuUXVhbGNvbW1BdGhlcm9zX2F0aDEwayBmb3Ig
ZGV0YWlscwoKCkluIG90aGVyIHdvcmRzLCB0aGVyZSB3b3VsZCBiZSBvbmx5IGEgc2luZ2xlICJM
aWNlbnNlOiIgbGluZSBhbmQgb25lCiJOb3RpY2U6IiBsaW5lIGZvciBlYWNoIGZpcm13YXJlIHZl
cnNpb24/IFRoZSBsaWNlbnNlIGl0c2VsZiAoaS5lLiwKTElDRU5TRS5RdWFsY29tbUF0aGVyb3Nf
YXRoMTBrKSBpcyBzYW1lIGZvciBhbGwgdGhlIHZlcnNpb25zIHdoaWxlIHRoZQpzZXQgb2Ygbm90
aWNlcyAoaS5lLiwgdGhvc2Ugbm90aWNlLnR4dCBmaWxlcykgY2FuIGJlIGRpZmZlcmVudCBiYXNl
ZCBvbgp3aGF0IGlzIGluY2x1ZGVkIGluIHRoZSBwYXJ0aWN1bGFyIGJ1aWxkLgoKPiA+IEknbSBz
dGlsbCB3b3JraW5nIG9uIHlvdXIgb3RoZXIgY29tbWVudCBhYm91dCBub3RpY2UudHh0LCB3aWxs
IGdldCBiYWNrCj4gPiBvbiB0aGF0IGxhdGVyLgoKVGhpcyBwYXJ0IGFib3V0IGNsZWFybHkgaWRl
bnRpZnlpbmcgdGhlIGZpbGVzIHNob3VsZCBiZSBjbGVhciBub3csIGJ1dAppdCB3b3VsZCBiZSBn
b29kIHRvIHJlc29sdmUgdGhhdCBwYXJ0IGFib3V0IHRoZSBub3RpY2UudHh0IGZpbGVzIGluCmdl
bmVyYWwgYmVmb3JlIHNlbmRpbmcgb3V0IGFuIHVwZGF0ZWQgcHVsbCByZXF1ZXN0LgoKLS0gCkpv
dW5pIE1hbGluZW4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFBH
UCBpZCBFRkM4OTVGQQoKLS0gCmF0aDExayBtYWlsaW5nIGxpc3QKYXRoMTFrQGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9hdGgx
MWsK
