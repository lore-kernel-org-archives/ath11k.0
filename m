Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65270C433EF
	for <ath11k@archiver.kernel.org>; Mon, 10 Jan 2022 15:19:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VViPjr39SKHV0AnPE79OEZfPoicm5AlvxhUDmak1QJQ=; b=Azb5tWAG+B7SmF
	SXcLyicsm/5hnF9uSXxRM4aC17xONP9z/84r519QhbVqt7GJ7RR8lIcOyp1KXFXwPkWKD73LwYe+P
	oIxPeD1AYOXjYEWLTcqgzqGvV6z33jP6EHVp9PB03DGz6MYpTB/ekRMLE7PMkvztgK5W1AKSVGVGt
	WxdBqq2H4TJxwd23Np1k+Z85bqeEUnXIk9ducJQPHJtX9Nj7TSSAbpT3tLMZ++KzU2N/ZJqBTt9MY
	zbGko8JLvzLqQLOFfUrkLW5jL06Myup4psNPZ4lC6Hs8ESlIKDmEEwklJbD8t8c3VMvy/oKRjFvIB
	ulBn4Tc9+ETzbGsaJ0Dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n6wS5-00C1Wy-F4; Mon, 10 Jan 2022 15:19:17 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n6wS2-00C1W9-Jm
 for ath11k@lists.infradead.org; Mon, 10 Jan 2022 15:19:16 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 27817612FB
 for <ath11k@lists.infradead.org>; Mon, 10 Jan 2022 15:19:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D1D8C36AE3;
 Mon, 10 Jan 2022 15:19:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1641827953;
 bh=pxPTJzmSBgH4bIUlhYAOmUy0JXvAVcZ0GJB2upPJ0DQ=;
 h=From:To:List-Id:Cc:Subject:References:Date:In-Reply-To:From;
 b=kfWirbvtrfOgywNReNZ4KfFBr6U70gAAPLC188GP/UR4T0LyujAtZsFjme4wrFM28
 xWmLeXqj1chaoS1v75Tqam+1PfVBFCDKZt/gD5Frp4Pgpmhpkj5yOdCvyDHFgNvmyh
 kNLZjR4pKFzqlsjugubNg29xypdQq6kKfRdmJJFb7WV5W3Bxzxpv0OjKk9BzHTeOxo
 0rQ7VGYGSW+WK23eqc7MMQGdFmyoaGbhA4I8v6v1lwiQHxkHAH8CAWwsfqD4ORNLBR
 mMPAW6vJTBjyl5ezxg90T6IMWsA/jOmBVEyicZnW4Ud5sh4pyd7b5ULr95uSVzWDnU
 kGjbLCpIJqbqA==
From: Kalle Valo <kvalo@kernel.org>
To: Josh Boyer <jwboyer@kernel.org>
Cc: "linux-firmware\@kernel.org" <linux-firmware@kernel.org>,
 "linux-wireless\@vger.kernel.org" <linux-wireless@vger.kernel.org>,
 "ath11k\@lists.infradead.org" <ath11k@lists.infradead.org>
Subject: Re: [PULL] ath11k firmware 20211223
References: <BYAPR02MB4567669033A210A78AC397E9927E9@BYAPR02MB4567.namprd02.prod.outlook.com>
 <CA+5PVA4WEuJDB3OCKfYK-BPaccpVWd9t_au9S7MCEtpy7cdF-A@mail.gmail.com>
Date: Mon, 10 Jan 2022 17:19:07 +0200
In-Reply-To: <CA+5PVA4WEuJDB3OCKfYK-BPaccpVWd9t_au9S7MCEtpy7cdF-A@mail.gmail.com>
 (Josh Boyer's message of "Wed, 29 Dec 2021 08:41:45 -0500")
Message-ID: <87leznvct0.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220110_071914_756055_959685C9 
X-CRM114-Status: GOOD (  23.37  )
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

Sm9zaCBCb3llciA8andib3llckBrZXJuZWwub3JnPiB3cml0ZXM6Cgo+IE9uIFRodSwgRGVjIDIz
LCAyMDIxIGF0IDk6MDMgQU0gS2FsbGUgVmFsbyA8a3ZhbG9AcWNhLnF1YWxjb21tLmNvbT4gd3Jv
dGU6Cj4+Cj4+IEhpIGxpbnV4LWZpcm13YXJlIG1haW50YWluZXJzLAo+Pgo+PiBoZXJlJ3MgYSBw
dWxsIHJlcXVlc3QgdG8gdXBkYXRlIGF0aDExayBmaXJtd2FyZSBpbWFnZXMuIFdlIGhhdmUgbmV3
IGhhcmR3YXJlIHN1cHBvcnQgV0NONjg1NSBhbmQgUUNOOTA3NCwgYnV0IGFsc28gdXBkYXRlcyB0
byBleGlzdGluZyBoYXJkd2FyZS4KPj4KPj4gUGxlYXNlIGxldCBtZSBrbm93IGlmIHRoZXJlIGFy
ZSBhbnkgcHJvYmxlbXMuCj4+Cj4+IEthbGxlCj4+Cj4+IFRoZSBmb2xsb3dpbmcgY2hhbmdlcyBz
aW5jZSBjb21taXQgZjY4MmVjYjAxNWRmMDg3NjEzZjkxODcyNzEyZWI2YzBmNmM5OThhODoKPj4K
Pj4gICBNZXJnZSBodHRwczovL2dpdGh1Yi5jb20vcGtzaGloL2xpbnV4LWZpcm13YXJlIGludG8g
bWFpbiAoMjAyMS0xMi0xNiAwOTo0Mjo1MSAtMDUwMCkKPj4KPj4gYXJlIGF2YWlsYWJsZSBpbiB0
aGUgR2l0IHJlcG9zaXRvcnkgYXQ6Cj4+Cj4+ICAgZ2l0Oi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3Nj
bS9saW51eC9rZXJuZWwvZ2l0L2t2YWxvL2xpbnV4LWZpcm13YXJlLmdpdCBhdGgxMGstMjAyMTEy
MjMKPj4KPj4gZm9yIHlvdSB0byBmZXRjaCBjaGFuZ2VzIHVwIHRvIDBmMTYxZjM4NWYzODU0MDg2
YjRmZGFlMmRhZTc4NmFiNmJkM2VmYTU6Cj4+Cj4+ICAgYXRoMTFrOiBXQ042ODU1IGh3Mi4wOiBh
ZGQgdG8gV0xBTi5IU1AuMS4xLTAzMDAzLVFDQUhTUFNXUExfVjFfVjJfU0lMSUNPTlpfTElURS0y
ICgyMDIxLTEyLTIzIDEyOjQwOjU1ICswMjAwKQo+Pgo+PiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4+IEthbGxlIFZhbG8g
KDUpOgo+PiAgICAgICBhdGgxMWs6IElQUTYwMTggaHcxLjA6IHVwZGF0ZSB0byBXTEFOLkhLLjIu
NS4wLjEtMDExMDAtUUNBSEtTV1BMX1NJTElDT05aLTEKPj4gICAgICAgYXRoMTFrOiBJUFE4MDc0
IGh3Mi4wOiB1cGRhdGUgdG8gV0xBTi5ISy4yLjUuMC4xLTAxMTAwLVFDQUhLU1dQTF9TSUxJQ09O
Wi0xCj4+ICAgICAgIGF0aDExazogUUNOOTA3NCBodzEuMDogYWRkIHRvIFdMQU4uSEsuMi41LjAu
MS0wMTEwMC1RQ0FIS1NXUExfU0lMSUNPTlotMQo+PiAgICAgICBhdGgxMWs6IFdDTjY4NTUgaHcy
LjA6IGFkZCBib2FyZC0yLmJpbiBhbmQgcmVnZGIuYmluCj4+ICAgICAgIGF0aDExazogV0NONjg1
NSBodzIuMDogYWRkIHRvIFdMQU4uSFNQLjEuMS0wMzAwMy1RQ0FIU1BTV1BMX1YxX1YyX1NJTElD
T05aX0xJVEUtMgo+Pgo+PiAgV0hFTkNFICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDE0
ICstCj4+ICBhdGgxMWsvSVBRNjAxOC9odzEuMC9Ob3RpY2UudHh0ICB8ICAgNDggKy0KPgo+IFRo
ZXNlIE5vdGljZSBmaWxlcyBzZWVtIHByb2JsZW1hdGljLiAgVGhleSdyZSBjbGVhcmx5IHdlbGwg
aW50ZW5kZWQsCj4gYnV0IHRoZXkgaGF2ZSBsYW5ndWFnZSB0aGF0IGFsbHVkZXMgdG8gYW4gYWdy
ZWVtZW50IHdpdGggQXRoZXJvcyBhbmQgYQo+IGNvbmZpZGVudGlhbCBuYXR1cmUgdG8gc29tZSBv
ZiB0aGUgZmlsZXMuICBTcGVjaWZpY2FsbHk6Cj4KPiAiLi4ueW91ciB1c2Ugb2YgdGhlc2Ugc29m
dHdhcmUKPiBjb21wb25lbnRzIHRvZ2V0aGVyIHdpdGggdGhlIFF1YWxjb21tIEF0aGVyb3Mgc29m
dHdhcmUgKFF1YWxjb21tCj4gQXRoZXJvcyBzb2Z0d2FyZSBoZXJlaW5hZnRlciByZWZlcnJlZCB0
byBhcyDigJxTb2Z0d2FyZeKAnSkgaXMKPiBzdWJqZWN0IHRvIHRoZSB0ZXJtcyBvZiB5b3VyIGFn
cmVlbWVudCBmcm9tIFF1YWxjb21tIEF0aGVyb3MuIgo+Cj4gTm9ib2R5IGhhcyBhbiBvcHBvcnR1
bml0eSB0byBhZ3JlZSB0byBhbnl0aGluZyB3aXRoIEF0aGVyb3Mgd2hlbiB0aGV5Cj4gY29uc3Vt
ZSB0aGUgZmlsZXMgZnJvbSBsaW51eC1maXJtd2FyZS4gIFRoZXJlJ3MgYWxzbyBubyBleHBsaWNp
dCBncmFudAo+IG9mIHJlZGlzdHJpYnV0aW9uIGZvciBhbnkgb2YgdGhlc2UgZmlsZXMuCj4KPiBB
bHNvOgo+Cj4gIi8qCj4gICogQ29weXJpZ2h0IChjKSAyMDExIFF1YWxjb21tIFRlY2hub2xvZ2ll
cywgSW5jLgo+ICAqIDIwMTEgUXVhbGNvbW0gQXRoZXJvcywgSW5jLgo+ICAqIEFsbCBSaWdodHMg
UmVzZXJ2ZWQuCj4gICogQ29uZmlkZW50aWFsIGFuZCBQcm9wcmlldGFyeSAtIFF1YWxjb21tIFRl
Y2hub2xvZ2llcywgSW5jLgo+ICAqIE5vdGlmaWNhdGlvbnMgYW5kIGxpY2Vuc2VzIGFyZSByZXRh
aW5lZCBmb3IgYXR0cmlidXRpb24gcHVycG9zZXMgb25seS4KPiAgKi8KPiAiCj4KPiBTZXZlcmFs
IG9mIHRob3NlIGFyZSBmb2xsb3dlZCBieSAiRm9yIHRoaXMgZmlsZS4uLi4gIGhhcyBzZWxlY3Rl
ZCB0aGUKPiBCU0QgbGljZW5zZSIgIGJ1dCBpdCdzIHVuY2xlYXIgd2hhdCBmaWxlIHRoYXQncyBy
ZWZlcnJpbmcgdG8uCj4KPiBJJ20gbm90IGNvbWZvcnRhYmxlIHB1bGxpbmcgdGhpcyB3aXRoIHRo
ZSBsaWNlbnNlcyBpbiBhbiBhbWJpZ3VvdXMKPiBzdGF0ZS4gIENhbiB5b3Ugd29yayB3aXRoIHlv
dXIgdGVhbSB0byBjbGFyaWZ5IHRoZSB0ZXh0PwoKU29ycnkgZm9yIHRoZSBkZWxheSwgSSB3YXMg
b24gdmFjYXRpb24uCgpUaGFua3MgZm9yIHRoZSBmZWVkYmFjaywgSSdsbCByZXBvcnQgdGhpcyBh
bmQgbGF0ZXIgc2VuZCBhIG5ldyBwdWxsCnJlcXVlc3Qgd2l0aCBiZXR0ZXIgbGFuZ3VhZ2UuIEJ1
dCB0aGlzIGNhbiB0YWtlIHNvbWUgdGltZS4KCi0tIApodHRwczovL3BhdGNod29yay5rZXJuZWwu
b3JnL3Byb2plY3QvbGludXgtd2lyZWxlc3MvbGlzdC8KCmh0dHBzOi8vd2lyZWxlc3Mud2lraS5r
ZXJuZWwub3JnL2VuL2RldmVsb3BlcnMvZG9jdW1lbnRhdGlvbi9zdWJtaXR0aW5ncGF0Y2hlcwoK
LS0gCmF0aDExayBtYWlsaW5nIGxpc3QKYXRoMTFrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9hdGgxMWsK
