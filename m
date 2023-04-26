Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01820C7618E
	for <ath11k@archiver.kernel.org>; Wed, 26 Apr 2023 07:28:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PnpqG5CfB0HVIBJLZ+ZS0nHh2XKkHWLouuAf71/DQoY=; b=3Wp+4n0RzeZ0yp
	w6wFq0pVabKZ/D2S8tYHYmiTArIb6Nya8y2b91rjIhQYngi6EOlu9/dw5SFeDkWDcKOdrTZSjppPg
	hQS8JNpPojgmhOfbcNJEgX+XFGxp7ItoLrW+c9wouhXQX5YUTEm84YeCZl0tdi43vdpIjYIRVJRd3
	HyXw++l5PRVVWOWorB8zofqj1O2L8oZrFy966piJWu8l8rn/83Hmrw95+CqL9rCeQyiANPMe/2PcF
	aU5s5E7UhXqU65bpRyfHMVuD12w2YYbtioCCbaAVreGgo2afqiYpVeQpjcbK9EQcGvx0sbXbADDtr
	x3AQy49GfhwF1yWfTj4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1prZZm-0032Od-2N;
	Wed, 26 Apr 2023 07:28:30 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1prZZk-0032O2-0X
	for ath11k@lists.infradead.org;
	Wed, 26 Apr 2023 07:28:29 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E714C60BC7;
	Wed, 26 Apr 2023 07:28:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBCD4C433D2;
	Wed, 26 Apr 2023 07:28:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1682494105;
	bh=u8xE+AGwFuKAFrkw50pHw2yu/zsFUYVwAdAsQmvHt4Q=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=atpGRdUw1+AFrst8KGB3tctHyAZcbE0HkTTxaBx16sIxPDh9x/iDiTXjC5t+YXGEf
	 J/QBld5L56h3cE7uLgtUNB2AnL9MidQt5bICVyUh3JVaYj5kApWPU0mMVNqnA038/s
	 K2rqFztEd4VLhh/eYDfTTYe9Xi5Am08M+nHuma1NZ/dbArv8TeQBZKQtbAbOGVbykY
	 jiaSSKVFIntUi80yN7KrJuVX9NDuC1UNw2m5GJtbEp70wouVyGaj8tu1kgf3qmQjh8
	 ROKYQIn7Dg4mQPtryH9fQDnvUie3zZNUtvPuwb8UIR71AqMVy0DKEYfZY6nKPXOYDT
	 +PclkO4dSvJtg==
From: Kalle Valo <kvalo@kernel.org>
To: Doug Brewer <brewer.doug@gmail.com>
Cc: ath11k@lists.infradead.org
Subject: Re: QCA9074 problem on rk3568
References: <CAG0V13RiyW0HptSbZ6vxoTCmdjzrYZ9MQxCqKuiczJL9znW0-g@mail.gmail.com>
	<87mt32vjdm.fsf@kernel.org>
	<CAG0V13SNRwhyyKMBxL71-u5mGH6kiagXecebage7xqCq7N3q3w@mail.gmail.com>
Date: Wed, 26 Apr 2023 10:28:21 +0300
In-Reply-To: <CAG0V13SNRwhyyKMBxL71-u5mGH6kiagXecebage7xqCq7N3q3w@mail.gmail.com>
	(Doug Brewer's message of "Fri, 21 Apr 2023 09:35:34 +0800")
Message-ID: <87edo7t84q.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230426_002828_284133_3BEBCB35 
X-CRM114-Status: GOOD (  18.88  )
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

RG91ZyBCcmV3ZXIgPGJyZXdlci5kb3VnQGdtYWlsLmNvbT4gd3JpdGVzOgoKPiBPbiBUaHUsIEFw
ciAyMCwgMjAyMyBhdCA4OjE24oCvUE0gS2FsbGUgVmFsbyA8a3ZhbG9Aa2VybmVsLm9yZz4gd3Jv
dGU6Cj4KPj4KPj4gRG91ZyBCcmV3ZXIgPGJyZXdlci5kb3VnQGdtYWlsLmNvbT4gd3JpdGVzOgo+
Pgo+PiA+IEkgdHJpZWQgdG8gaW5zdGFsbCBsaW51eCBrZXJuZWwgNi4zLXJjNyBvbiBteSByazM1
NjggZXZiLiAgSXQgc2VlbXMgdGhlcmUncwo+PiA+IGEgcHJvYmxlbSBhYm91dCBNSEk6Cj4+ID4K
Pj4gPiBbICAgMTEuMzQwNTU4XSBhdGgxMWtfcGNpIDAwMDI6MDE6MDAuMDogQkFSIDA6IGFzc2ln
bmVkIFttZW0gMHgzODAwMDAwMDAtMHgzODAxZgo+PiA+IGZmZmYgNjRiaXRdCj4+ID4gWyAgIDEx
LjM0MTM5OV0gYXRoMTFrX3BjaSAwMDAyOjAxOjAwLjA6IGVuYWJsaW5nIGRldmljZSAoMDAwMCAt
PiAwMDAyKQo+PiA+IFsgICAxMS40MjI4NDldIGF0aDExa19wY2kgMDAwMjowMTowMC4wOiBNU0kg
dmVjdG9yczogMTYKPj4gPiBbICAgMTEuNDIzMzM1XSBhdGgxMWtfcGNpIDAwMDI6MDE6MDAuMDog
cWNuOTA3NCBodzEuMAo+PiA+IFsgICAxMS42NjA4NDZdIG1oaSBtaGkwOiBSZXF1ZXN0ZWQgdG8g
cG93ZXIgT04KPj4gPiBbICAgMTEuNjYxMjcxXSBtaGkgbWhpMDogUG93ZXIgb24gc2V0dXAgc3Vj
Y2Vzcwo+PiA+IFsgICAzMS43MTYyODldIG1oaSBtaGkwOiBNSEkgZGlkIG5vdCBsb2FkIGltYWdl
IG92ZXIgQkhJLCByZXQ6IC01Cj4+ID4gWyAgIDYwLjU1MTk0Ml0gbWhpIG1oaTA6IERldmljZSBm
YWlsZWQgdG8gZW50ZXIgUkVBRFkgc3RhdGUKPj4gPiBbICAgNjAuNTUyNTQ0XSBtaGkgbWhpMDog
RXJyb3IgbW92aW5nIGZyb20gUE0gc3RhdGU6IEZpcm13YXJlIERvd25sb2FkIEVycm9yIHRvOgo+
PiA+IERJU0FCTEUKPj4gPiBbICAgNjAuNTUzMzc2XSBhdGgxMWtfcGNpIDAwMDI6MDE6MDAuMDog
ZmFpbGVkIHRvIHBvd2VyIHVwIG1oaTogLTExMAo+PiA+IFsgICA2MC41NTM5NzJdIGF0aDExa19w
Y2kgMDAwMjowMTowMC4wOiBmYWlsZWQgdG8gc3RhcnQgbWhpOiAtMTEwCj4+ID4gWyAgIDYwLjU1
NDUzMl0gYXRoMTFrX3BjaSAwMDAyOjAxOjAwLjA6IGZhaWxlZCB0byBwb3dlciB1cCA6LTExMAo+
PiA+IFsgICA2MC41Njc5MDddIGF0aDExa19wY2kgMDAwMjowMTowMC4wOiBmYWlsZWQgdG8gY3Jl
YXRlIHNvYyBjb3JlOgo+PiA+IC0xMTAKPj4gPiBbICAgNjAuNTY4NDg4XSBhdGgxMWtfcGNpIDAw
MDI6MDE6MDAuMDogZmFpbGVkIHRvIGluaXQgY29yZTogLTExMAo+PiA+Cj4+ID4gQW55IGlkZWEg
aG93IHRvIGZpeCBpdD8gIFRoYW5rcy4KPj4KPj4gSSB3b3VsZCBmaXJzdCBjaGVjayB0aGF0IHRo
ZSBmaXJtd2FyZSBmaWxlcyBhcmUgbm90IGNvcnJ1cHRlZC4KPgo+ICMgc2hhMjU2c3VtIGFtc3Mu
YmluIGJvYXJkLTIuYmluIG0zLmJpbgo+IDVlZTFiN2IyMDQ1NDFiNWY5OTk4NGYyMWQ2OTRlY2Vj
YWVjMDhmYmNlMWI1MjBmZmU2ZmU3NDBiMDJhNGFmZDcgIGFtc3MuYmluCj4gZGJmMGNhMTRhYTEy
MjllY2NkNDhmMjZmMTAyNjkwMWI5NzE4YjE0M2JkMzBiNTFiOGVhNjdjODRiYTYyMDdmMSAgYm9h
cmQtMi5iaW4KPiBiNmQ5NTdmMzM1MDczYTE1YThkZTgwOTM5OGUxNTA2ZjAyMDBhMDg3NDdlYWY3
MTg5Yzg0M2NmNTE5ZmZjMWRlICBtMy5iaW4KPgo+IFRoZSBmaXJtd2FyZSBmaWxlcyBsb29rIGdv
b2QsIHRoYW5rcy4KCkluZGVlZCwgdGhlIGZpcm13YXJlIGZpbGVzIGRvbid0IHNlZW0gdG8gYmUg
Y29ycnVwdGVkLiBUaGlzIGlzIGEgd2VpcmQKcHJvYmxlbSwgSSBkb24ndCByZWNhbGwgc2VlaW5n
IGFueXRoaW5nIGxpa2UgdGhpcyBiZWZvcmUuIFNvbWUgb3RoZXIKaWRlYXMgdG8gdHJ5IG91dDoK
CiogaWYgeW91IGhhdmUgYWNjZXNzIHRvIHRoZSBRdWFsY29tbSBpbi1ob3VzZSBRU0RLIGRyaXZl
ciAoZG9uJ3Qga25vdwogIHdoYXQgdGhleSBjYWxsIGl0IG5vd2FkYXlzKSB0cnlpbmcgdGhhdCB3
b3VsZCBiZSBnb29kIGZvciBydWxpbmcgb3V0CiAgaGFyZHdhcmUgcHJvYmxlbXMKCiogdHJ5IG9s
ZGVyIGtlcm5lbAoKKiB0cnkgb2xkZXIgZmlybXdhcmUKCiogdHJ5IHRoZSBRQ045MDc0IG9uIGEg
ZGlmZmVyZW50IHBsYXRmb3JtCgpCdXQgdGhlc2UgYXJlIGp1c3Qgc2hvdHMgaW4gdGhlIGRhcmss
IEkgY2FuJ3QgcmVhbGx5IGd1ZXNzIHdoYXQgdGhlCnByb2JsZW0gY291bGQgYmUuIFRoZSBlcnJv
ciBjb21lcyBmcm9tIHRoZSB2ZXJ5IGVhcmx5IGR1cmluZyBkcml2ZXIKaW5pdGlhbGlzYXRpb24g
c28gbW9zdCBsaWtlbHkgYSBsb3cgbGV2ZWwgaXNzdWUuIEkgZG9uJ3QgaGF2ZSBRQ045MDc0IGlu
Cm15IHRlc3RiZWQgc28gb2YgY291cnNlIHRoaXMgY291bGQgYmUgYSBzaW1wbGUgcmVncmVzc2lv
biBzb21ld2hlcmUgYXMKd2VsbC4KCi0tIApodHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3By
b2plY3QvbGludXgtd2lyZWxlc3MvbGlzdC8KCmh0dHBzOi8vd2lyZWxlc3Mud2lraS5rZXJuZWwu
b3JnL2VuL2RldmVsb3BlcnMvZG9jdW1lbnRhdGlvbi9zdWJtaXR0aW5ncGF0Y2hlcwoKLS0gCmF0
aDExayBtYWlsaW5nIGxpc3QKYXRoMTFrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9hdGgxMWsK
