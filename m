Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D52C3C678D4
	for <ath11k@archiver.kernel.org>; Thu,  2 Mar 2023 06:16:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6pNYoD3JxGhZJZoBc0bH0d2cQzA2s7AuSKOYrNA09g8=; b=YsmsRMG7xah/zJ
	iXn7/U06RMp0UxboAKF1Cx54r3qilqwysTEW0WNL/FQkg9Ap4NKRkSFO7Ob0kbWKP7/1A+AGqpppp
	RyPKkZjySEXKinYiFQQfqz5nQid0ArfOBEudVA1t3utDhzeUZhbuyxe/Yp3p4pthDh+OHRG7CxXg+
	IKwAaFP1CiQgTQ1ifI28L4CticOv3Cf6hQcgrZef0FrWJGreNd0YrdSiJtq1FdEZ4sDTUXeEzX02V
	lJAANn354q4XeO0BrVqeOu+bwI7iV3v1NdKl4pgsPxpJY7SkOmuGDPZv+Uvi+Ml+sUicZyp9h4gBr
	Gjah31B9yet3KrDWSLjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXcET-00100m-6R; Thu, 02 Mar 2023 06:16:01 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXcEP-00100I-UY
	for ath11k@lists.infradead.org; Thu, 02 Mar 2023 06:15:59 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 94206B80DF0;
	Thu,  2 Mar 2023 06:15:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8ADA0C433EF;
	Thu,  2 Mar 2023 06:15:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677737755;
	bh=gj9DUV7zv5VEvJ6WHVaoqujiN65v86EupFQIcl1U2MM=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=piiXjKVbajJCIl5VC8EQlnElAPxc4RYUyuyFJKY5uqszU7YMGSAIF4N9Y9Al3fvsg
	 AG7hM0sreHCiibFIl97qv0C61F4sXEI91vRyQy1CNWEltUVI22JzZQ5C5QdDfc2KaP
	 N/zy8CgN9U9vFItXZfpUmPQ6LvqWP3b48cS6U1qVv/FxAUTDmB0Ql8PIhP6KYj+J9c
	 AM0BXxuUi1lWIk679UWEmL+JJL59fPWAryAP0zcRG5/54U9zvOnTrqTbatPOx5GZ7y
	 ilzKsAhVSMs3Q/GdaU2QTRnzFLo1dJ9swSiWaNIqBwhQjcsQA9l2c0+NiwDrl2M4R/
	 6GPUI1IpZfEtA==
From: Kalle Valo <kvalo@kernel.org>
To: =?utf-8?Q?St=C3=A9phane?= Klein <hello@sklein.xyz>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org
Subject: Re: ath11k_pci 0000:01:00.0: failed to resume hif during resume: -5 after hibernaton resume on Thinkpad T14s Gen 3 AMD
References: <3ae33154-126c-42b8-a3cb-eeaa63c7a6f7@app.fastmail.com>
Date: Thu, 02 Mar 2023 08:15:52 +0200
In-Reply-To: <3ae33154-126c-42b8-a3cb-eeaa63c7a6f7@app.fastmail.com>
	(=?utf-8?Q?=22St=C3=A9phane?= Klein"'s message of "Wed, 01 Mar 2023
 19:05:39 +0100")
Message-ID: <87sfenznjb.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230301_221558_165987_7CB1214D 
X-CRM114-Status: GOOD (  11.84  )
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

KyBhdGgxMWsKClN0w6lwaGFuZSBLbGVpbiA8aGVsbG9Ac2tsZWluLnh5ej4gd3JpdGVzOgoKPiBJ
IHRyeSB0byBjb25maWd1cmUgaGliZXJuYXRpb24gb24gVGhpbmtwYWQgVDE0cyBHZW4gMyBBTUQu
IFNlZSBmdWxsCj4gY29udGV4dCBoZXJlOgo+IGh0dHBzOi8vZ2lzdC5naXRodWIuY29tL2Vsb3ls
cC9iMGQ2NGQzYzk0N2RiZmIyM2QxMzg2NGUwYzA1MWM2Nz9wZXJtYWxpbmtfY29tbWVudF9pZD00
NDc0NTY5I2dpc3Rjb21tZW50LTQ0NzQ1NjkKPgo+IEkgc2VlIHRoaXMgZXJyb3IgaW4gbXkgZG1l
c2c6Cj4KPiBbICAyMTAuMDQzMTMwXSBhdGgxMWtfcGNpIDAwMDA6MDE6MDAuMDogZmFpbGVkIHRv
IHJlc3VtZSBtaGk6IC01Cj4gWyAgMjEwLjA0MzEzNF0gYXRoMTFrX3BjaSAwMDAwOjAxOjAwLjA6
IGZhaWxlZCB0byByZXN1bWUgaGlmIGR1cmluZyByZXN1bWU6IC01Cj4gWyAgMjEwLjA0MzEzNl0g
YXRoMTFrX3BjaSAwMDAwOjAxOjAwLjA6IGZhaWxlZCB0byByZXN1bWUgY29yZTogLTUKPiBbICAy
MTAuMDQzMTM4XSBhdGgxMWtfcGNpIDAwMDA6MDE6MDAuMDogUE06IGRwbV9ydW5fY2FsbGJhY2so
KTogcGNpX3BtX3Jlc3RvcmUrMHgwLzB4ZTAgcmV0dXJucyAtNQo+IFsgIDIxMC4wNDMxNThdIGF0
aDExa19wY2kgMDAwMDowMTowMC4wOiBQTTogZmFpbGVkIHRvIHJlc3RvcmUgYXN5bmM6IGVycm9y
IC01Cj4gWyAgMjEzLjA1MDYxMV0gYXRoMTFrX3BjaSAwMDAwOjAxOjAwLjA6IHdtaSBjb21tYW5k
IDE2Mzg3IHRpbWVvdXQKPiBbICAyMTMuMDUwNjI0XSBhdGgxMWtfcGNpIDAwMDA6MDE6MDAuMDog
ZmFpbGVkIHRvIHNlbmQgV01JX1BERVZfU0VUX1BBUkFNIGNtZAo+IFsgIDIxMy4wNTA2MzJdIGF0
aDExa19wY2kgMDAwMDowMTowMC4wOiBmYWlsZWQgdG8gZW5hYmxlIGR5bmFtaWMgYnc6IC0xMQo+
Cj4gTW9yZSBpbmZvcm1hdGlvbiBvbiB0aGVzZSBjb21tZW50czoKPgo+IC0gaHR0cHM6Ly9naXN0
LmdpdGh1Yi5jb20vZWxveWxwL2IwZDY0ZDNjOTQ3ZGJmYjIzZDEzODY0ZTBjMDUxYzY3P3Blcm1h
bGlua19jb21tZW50X2lkPTQ0ODgzMjUjZ2lzdGNvbW1lbnQtNDQ4ODMyNQo+IGh0dHBzOi8vZ2lz
dC5naXRodWIuY29tL2Vsb3lscC9iMGQ2NGQzYzk0N2RiZmIyM2QxMzg2NGUwYzA1MWM2Nz9wZXJt
YWxpbmtfY29tbWVudF9pZD00NDg4MzQxI2dpc3Rjb21tZW50LTQ0ODgzNDEKPgo+IERvIHlvdSB0
aGluayBpdCBpcyBhIGhhcmR3YXJlIGJ1ZywgYSBiaW9zIGJ1ZyBvciBhIGRyaXZlciBidWc/Cj4g
T3IgZGlkIEkgY29uZmlndXJlIHNvbWV0aGluZyB3cm9uZz8KCmF0aDExayBpcyBicm9rZW4gYW5k
IGRvZXNuJ3Qgd29yayBpbiBoaWJlcm5hdGlvbiBtb2RlLCB3ZSBoYXZlIGEgYnVnCmFib3V0IHRo
YXQ6CgpodHRwczovL2J1Z3ppbGxhLmtlcm5lbC5vcmcvc2hvd19idWcuY2dpP2lkPTIxNDY0OQoK
QWRkaW5nIHRoZSBhdGgxMWsgbGlzdCwgcGxlYXNlIHNlbmQgYWxsIGF0aDExayBxdWVzdGlvbnMg
dGhlcmUuCgotLSAKaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wcm9qZWN0L2xpbnV4LXdp
cmVsZXNzL2xpc3QvCgpodHRwczovL3dpcmVsZXNzLndpa2kua2VybmVsLm9yZy9lbi9kZXZlbG9w
ZXJzL2RvY3VtZW50YXRpb24vc3VibWl0dGluZ3BhdGNoZXMKCi0tIAphdGgxMWsgbWFpbGluZyBs
aXN0CmF0aDExa0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vYXRoMTFrCg==
