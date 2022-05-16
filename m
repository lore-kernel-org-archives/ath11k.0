Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB2E5C433EF
	for <ath11k@archiver.kernel.org>; Mon, 16 May 2022 16:15:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8293HjDw+32+GoHZ9mb4DeT+jUBQH1gDVnGnnVbaL7A=; b=sQDV9KSWgCyRVd
	Y3pjJwFjGe1/TeYsD17aKZT5hrDu8HjxX2j4fs0kT8losRLur519z7AbZoDsoErtWeReqX4XBhXhz
	znSMGoiX2uJGvd4CGz5rv3xeEmFL7gWETdnA4XPWc3Q4qMRIRbZlMFkqPoWS/+Au1jekKk2MP7KpR
	HLrhC6JPBWehxQ5wH/ABq2xpBIT35uuct3nPiBFH98DAhTqvWvTt6EkJ78PSRbJW6ZXu3Vr4uWz+A
	kIVLkiqp2oRsSL5RACy7CexoecjG6jMqJts9YsoNEKDAJaTrTKoRw0UriB6sW7NNwoWd1rU7GGI1z
	lSfj7NZDTSl3C0BjUgbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nqdNg-008v75-9H; Mon, 16 May 2022 16:15:36 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nqdNc-008v5y-Uv
 for ath11k@lists.infradead.org; Mon, 16 May 2022 16:15:34 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 75CC1CE1274;
 Mon, 16 May 2022 16:15:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F35BC385AA;
 Mon, 16 May 2022 16:15:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652717724;
 bh=Gd11/zuHbF5jwjOvDwj3/Fc5hS4NUMxrWyhz/k+ceUQ=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=FqAIjSDercoMM/hOxcgQ/A5sTBhHufLvEN/PHGshiqwe2aecb06kt/RGskVA6OG3n
 i6/MYasq+NDpohvNwsomxMgKDNjyDAwDNAMnMxP6YiIRLYfkUwfglOVIkTWnSMULOw
 qOxL9iy8RJRipeOaauy0XMDq1qcN88uAlq5U6cmc6xzd7Igbgrx4egsX0qgzfo1lW2
 58AOO18DNmtrJ9cxubfFev++Do9QYWqVLQrIzaLl0biNYettdaefI6au6vHbupHA+i
 O+GaK7zMYgb5jIbUPRD+/fNjK8B6FR+/Gws752m3bZE+XoUSowje5ZdZjrnoynt21l
 uTtCcPAPiIFQw==
From: Kalle Valo <kvalo@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: "ath11k\@lists.infradead.org" <ath11k@lists.infradead.org>
Subject: Re: WCN6855 issues with latest linux-firmware
References: <a1657ff0-198c-14f9-3b2b-d7ab06cfc8e6@linaro.org>
 <87v8ua624n.fsf@kernel.org>
 <08d0ec20-f9ae-c546-becb-a77404e91a9a@linaro.org>
 <87sfp94ooj.fsf@kernel.org>
 <CAA8EJpq1FySTU2Hr4G5OLocejzNZF1hDzyqTHV4e+R0duf2cJw@mail.gmail.com>
Date: Mon, 16 May 2022 19:15:19 +0300
In-Reply-To: <CAA8EJpq1FySTU2Hr4G5OLocejzNZF1hDzyqTHV4e+R0duf2cJw@mail.gmail.com>
 (Dmitry Baryshkov's message of "Mon, 16 May 2022 19:05:15 +0300")
Message-ID: <87k0al4foo.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220516_091533_389256_3A582DC2 
X-CRM114-Status: GOOD (  23.85  )
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

RG1pdHJ5IEJhcnlzaGtvdiA8ZG1pdHJ5LmJhcnlzaGtvdkBsaW5hcm8ub3JnPiB3cml0ZXM6Cgo+
IE9uIE1vbiwgMTYgTWF5IDIwMjIgYXQgMTY6MDEsIEthbGxlIFZhbG8gPGt2YWxvQGtlcm5lbC5v
cmc+IHdyb3RlOgo+Pgo+PiBEbWl0cnkgQmFyeXNoa292IDxkbWl0cnkuYmFyeXNoa292QGxpbmFy
by5vcmc+IHdyaXRlczoKPj4KPj4gPiBPbiAxMi8wNS8yMDIyIDIxOjIzLCBLYWxsZSBWYWxvIHdy
b3RlOgo+PiA+PiBEbWl0cnkgQmFyeXNoa292IDxkbWl0cnkuYmFyeXNoa292QGxpbmFyby5vcmc+
IHdyaXRlczoKPj4gPj4KPj4gPj4+IFRoZSB3Y242ODU1IFdpRmkgY2hpcCBzdG9wcGVkIHdvcmtp
bmcgZm9yIG1lIGFmdGVyIGFuIHVwZGF0ZSB0byB0aGUKPj4gPj4+IGxhdGVzdCBsaW51eC1maXJt
d2FyZSAoTGludXggNS4xOC1yYzIpLiBJIGNhbiByZXByb2R1Y2UgaXQgd2l0aCBib3RoCj4+ID4+
PiBodzIuMCBhbmQgaHcyLjEgY2hpcHMuCj4+ID4+Pgo+PiA+Pj4gSGVyZSBpcyB0aGUgc2V0IG9m
IGtlcm5lbCBtZXNzYWdlcyBJJ20gZ2V0dGluZyBmcm9tIGF0aDExa19wY2kgZHJpdmVyOgo+PiA+
Pj4KPj4gPj4+IFsgICAgNC40MjIzOTFdIGF0aDExa19wY2kgMDAwMDowMTowMC4wOiBBZGRpbmcg
dG8gaW9tbXUgZ3JvdXAgMwo+PiA+Pj4gWyAgICA0LjQyOTU3MV0gYXRoMTFrX3BjaSAwMDAwOjAx
OjAwLjA6IEJBUiAwOiBhc3NpZ25lZCBbbWVtCj4+ID4+PiAweDYwNDAwMDAwLTB4NjA1ZmZmZmYg
NjRiaXRdCj4+ID4+PiBbICAgIDQuNDM3ODU3XSBhdGgxMWtfcGNpIDAwMDA6MDE6MDAuMDogZW5h
YmxpbmcgZGV2aWNlICgwMDAwIC0+IDAwMDIpCj4+ID4+PiBbICAgIDQuNDQ1MzIzXSBhdGgxMWtf
cGNpIDAwMDA6MDE6MDAuMDogTVNJIHZlY3RvcnM6IDEKPj4gPj4+IFsgICAgNC40NTAzNzVdIGF0
aDExa19wY2kgMDAwMDowMTowMC4wOiB3Y242ODU1IGh3Mi4wCj4+ID4+PiBbICAgIDUuMzc4NDg4
XSBhdGgxMWtfcGNpIDAwMDA6MDE6MDAuMDogY2hpcF9pZCAweDIgY2hpcF9mYW1pbHkgMHhiCj4+
ID4+PiBib2FyZF9pZCAweDhjIHNvY19pZCAweDQwMGMwMjAwCj4+ID4+PiBbICAgIDUuMzkyODk4
XSBhdGgxMWtfcGNpIDAwMDA6MDE6MDAuMDogZndfdmVyc2lvbiAweDExMGYwYzM1Cj4+ID4+PiBm
d19idWlsZF90aW1lc3RhbXAgMjAyMi0wMy0zMCAwOTowNSBmd19idWlsZF9pZAo+PiA+Pj4gUUNf
SU1BR0VfVkVSU0lPTl9TVFJJTkc9V0xBTi5IU1AuMS4xLTAzMTI1LVFDQUhTUFNXUExfVjFfVjJf
U0lMSUNPTlpfTElURS0zLjY1MTAuNwo+PiA+Pj4gWyAgICA1LjQyMDY0OF0gYXRoMTFrX3BjaSAw
MDAwOjAxOjAwLjA6IGZhaWxlZCB0byBmZXRjaCBib2FyZCBkYXRhIGZvcgo+PiA+Pj4gYnVzPXBj
aSx2ZW5kb3I9MTdjYixkZXZpY2U9MTEwMyxzdWJzeXN0ZW0tdmVuZG9yPTE3Y2Isc3Vic3lzdGVt
LWRldmljZT0wMTA4LHFtaS1jaGlwLWlkPTIscW1pLWJvYXJkLWlkPTE0MAo+PiA+Pj4gZnJvbSBh
dGgxMWsvV0NONjg1NS9odzIuMC9ib2FyZC0yLmJpbgo+PiA+Pj4gWyAgIDE1LjY4NjM5OF0gYXRo
MTFrX3BjaSAwMDAwOjAxOjAwLjA6IGZhaWxlZCB0byB3YWl0IGJvYXJkIGZpbGUKPj4gPj4+IGRv
d25sb2FkIHJlcXVlc3Q6IC0xMTAKPj4gPj4+IFsgICAxNS42OTQ1MzBdIGF0aDExa19wY2kgMDAw
MDowMTowMC4wOiBxbWkgZmFpbGVkIHRvIGxvYWQgYmRmIGZpbGUKPj4gPj4+IFsgICAxNS43MDA3
ODRdIGF0aDExa19wY2kgMDAwMDowMTowMC4wOiBmYWlsZWQgdG8gbG9hZCBib2FyZCBkYXRhIGZp
bGU6IC0xMTAKPj4gPj4KPj4gPj4gV2hhdCBXQ042ODU1IGhhcmR3YXJlIGFyZSB5b3UgZXhhY3Rs
eSB1c2luZz8gKG1ha2UsIG1vZGVsIGV0YykKPj4gPgo+PiA+IEkgaGF2ZSBhc2tlZCBmb3IgdGhl
IGh3IGRldGFpbHMuIFRoZSB1c2VyIGd1aWRlIGZvciB0aGUgSERLODQ1MCBsaXN0cwo+PiA+IFdD
TjY4NTYgY2hpcCBhbmQgYWxzbyBtZW50aW9ucyAnUXVhbGNvbW3CriBGYXN0Q29ubmVjdOKEoiA2
OTAwIFN5c3RlbXMnLgo+Pgo+PiBTbyB0aGUgY2hpcCB3YXMgaW5jbHVkZWQgd2l0aGluIEhESzg0
NTA/IEl0IHdhcyBub3QgaW5zdGFsbGVkIHRvIHRoZQo+PiBib2FyZCBzZXBhcmF0ZWx5IG9yIGFu
eXRoaW5nIGxpa2UgdGhhdD8KPgo+IFllcywgaXQncyB0aGUgaW5jbHVkZWQgY2hpcC4KCk9rLCB0
aGF0IHNob3VsZCBoZWxwIHRvIGZpbmQgaXQuCgo+PiA+PiBBbmQgd2hhdAo+PiA+PiBib2FyZCBm
aWxlIGFyZSB5b3UgdXNpbmc/IG1kNXN1bXMgb2YgYWxsIGZpcm13YXJlIGZpbGVzIGlzIHRoZSBi
ZXN0Lgo+PiA+Cj4+ID4gIyBtZDVzdW0gL2xpYi9maXJtd2FyZS9hdGgxMWsvV0NONjg1NS9odzIu
MS8qCj4+ID4gNDYwZmJkNWRkYzU3YjNkMmVmYmYxY2E5NzZmNzhiOTAKPj4gPiAvbGliL2Zpcm13
YXJlL2F0aDExay9XQ042ODU1L2h3Mi4xL2Ftc3MuYmluCj4+ID4gODhiM2E0ZmJkZThjYWI0NDkz
ZjAwNjBhZTNiNWRlZTMKPj4gPiAvbGliL2Zpcm13YXJlL2F0aDExay9XQ042ODU1L2h3Mi4xL2Jv
YXJkLTIuYmluCj4+ID4gN2ZkMWMyMzM3YjBiNjUwMjU4OGQzMTQxZTIwNWU3MzUKPj4gPiAvbGli
L2Zpcm13YXJlL2F0aDExay9XQ042ODU1L2h3Mi4xL2JvYXJkLmJpbgo+PiA+IGQxNDYwZmMxYzQ1
OTVkMGQyMmY4MmQ1YmFlYWFiYmQ4ICAvbGliL2Zpcm13YXJlL2F0aDExay9XQ042ODU1L2h3Mi4x
L20zLmJpbgo+PiA+IGY2N2JlODM2NTljNzkwZmUxNWQxZTQyYWY1MDFlOWZhCj4+ID4gL2xpYi9m
aXJtd2FyZS9hdGgxMWsvV0NONjg1NS9odzIuMS9yZWdkYi5iaW4KPj4KPj4gU28geW91IGFyZSB1
c2luZyBhIHNlcGFyYXRlIGJvYXJkLmJpbiBmaWxlLCB3aGVyZSBkaWQgeW91IGdldCBpdD8gYXRo
MTFrCj4+IGJvYXJkIGZpbGVzIGFyZSBkaWZmZXJlbnQgc28geW91IGNhbm5vdCB0YWtlIHRoZSBi
b2FyZCBmaWxlIGZyb20KPj4gZWxzZXdoZXJlLgo+Cj4gVGhlIGJvYXJkIGZpbGUgY29tZXMgdG9n
ZXRoZXIgd2l0aCB0aGUgYm9hcmQsIGFzIGEgYnVuY2gKPiBiZHdsYW4uZSovYmR3bGFuZy5lKiBm
aWxlcyBvbiB0aGUgbW9kZW0gcGFydGl0aW9uLgo+IEkgd2FzIHVzaW5nIHRoZSBvbmUgY29ycmVz
cG9uZGluZyB0byB0aGUgYm9hcmQgaWQuCj4KPiBCdXQgbm90ZSwgdGhhdCB0aGUgZHJpdmVyIHJl
cG9ydHMgdGhhdCBpdCBkaWQgbm90IGdldCB0aGUgJ2ZhaWxlZCB0bwo+IHdhaXQgYm9hcmQgZmls
ZSBkb3dubG9hZCByZXF1ZXN0Jy4gU28sIGl0IHdvdWxkIGJlIGdvb2QgdG8gZ2V0IHRoZQo+IGJv
YXJkIGZpbGUgaW50byB0aGUgYm9hcmQtMi5iaW4sIGJ1dCBmb3IgbWUgaXQgbG9va3MgbGlrZSBh
IHNlcGFyYXRlCj4gc3RvcnkuCgpZZWFoLCB3ZSBzaG91bGQgdHJ5IHRvIGdldCB0aGUgY29ycmVj
dCBib2FyZCBmaWxlIHRvIGJvYXJkLTIuYmluLiBJJ2xsCmFzayBhcm91bmQuCgo+PiBDYW4geW91
IGZpbGUgdGhpcyB0byBidWd6aWxsYToKPj4KPj4gaHR0cHM6Ly93aXJlbGVzcy53aWtpLmtlcm5l
bC5vcmcvZW4vdXNlcnMvZHJpdmVycy9hdGgxMWsvYnVncmVwb3J0Cj4+Cj4+IFRoYXQgd2F5IGl0
J3MgZWFzaWVyIHRvIHRyYWNrIGFuZCBJIGNhbiB0cnkgdG8gZmluZCB0aGUgY29ycmVjdCBib2Fy
ZAo+PiBmaWxlLgo+Cj4gRG9uZTogaHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVn
LmNnaT9pZD0yMTU5ODcKClRoYW5rcyEKCi0tIApodHRwczovL3BhdGNod29yay5rZXJuZWwub3Jn
L3Byb2plY3QvbGludXgtd2lyZWxlc3MvbGlzdC8KCmh0dHBzOi8vd2lyZWxlc3Mud2lraS5rZXJu
ZWwub3JnL2VuL2RldmVsb3BlcnMvZG9jdW1lbnRhdGlvbi9zdWJtaXR0aW5ncGF0Y2hlcwoKLS0g
CmF0aDExayBtYWlsaW5nIGxpc3QKYXRoMTFrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9hdGgxMWsK
