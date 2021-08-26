Return-Path: <SRS0=rto1=NR=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A341CC432BE
	for <ath11k@archiver.kernel.org>; Thu, 26 Aug 2021 10:50:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 61A0D606A5
	for <ath11k@archiver.kernel.org>; Thu, 26 Aug 2021 10:50:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 61A0D606A5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VgOjRmpUDqOArpvdnaF6JpnLPwD5lRA5wIGBRblH8x0=; b=xFgRXB3ATwg/jlnZQrBoIop7sS
	C2Q8vqflxAu4FzdwDYmeCg/tkgSSO5NLApudE8ebvqHzquhc82dAurgsVyhbvTfbvzLUZNlEVD2fE
	G2BUb6wMj/DkBRlmpFaDeX9DD+eBS8cyPuOWw1snmJreJbRC55RKpDY59G73neZdA+yYllW/NN/e9
	JwqqDQ4VDaWoLN31AceXBg1YclKh0oaVGpoJOC4mco3npeiIUNXXBCm7lHb8CzG6x3ETxrsKyJHRX
	i81LLEnsXWj9CbiQC2ExRifHbZ1RE/pcESECaDff7eETiBd4WMGjTtWGpFCbOq8A9RwJjC/ZK8aGJ
	UlAB1ikQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mJCy2-009pq5-6v; Thu, 26 Aug 2021 10:50:42 +0000
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mJCxx-009ppH-AN
 for ath11k@lists.infradead.org; Thu, 26 Aug 2021 10:50:41 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1629975036; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=wRDjUNngzx8wMiil9WEwX/qFGguTuF8OcepMb62yclE=;
 b=Dmv0M0WrNgGiP5cUfBw2AOTfYMkonwWOOxd43aJ0ezRfFtYBJW/WvQxt7poJMcX7bGIVI+oT
 hcQqqJWVIbOi3x5NQkReiptygRMH2mbWpbD/Oam11uUaKjJSOSL1ZD/VjMALyE7gkrUvGRmw
 KVgqXvsu7X/OmLSE2wXtbfMOONk=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 612771fbfc1f4cb692cf5d05 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 26 Aug 2021 10:50:35
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 815B3C43617; Thu, 26 Aug 2021 10:50:35 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: wgong)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 36EF2C4360D;
 Thu, 26 Aug 2021 10:50:35 +0000 (UTC)
MIME-Version: 1.0
Date: Thu, 26 Aug 2021 18:50:35 +0800
From: Wen Gong <wgong@codeaurora.org>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org
Subject: Re: [PATCH v2 8/8] mac80211: save transmit power envelope element and
 power constraint
In-Reply-To: <dfe27f657b4615369cf751d394f5cba75f5fdcc1.camel@sipsolutions.net>
References: <20210820122041.12157-1-wgong@codeaurora.org>
 <20210820122041.12157-9-wgong@codeaurora.org>
 <dfe27f657b4615369cf751d394f5cba75f5fdcc1.camel@sipsolutions.net>
Message-ID: <fe21853e8c9a73632e0ca860eef00296@codeaurora.org>
X-Sender: wgong@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210826_035037_467180_8FEBFAC2 
X-CRM114-Status: GOOD (  22.44  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

T24gMjAyMS0wOC0yNiAxNjoyOSwgSm9oYW5uZXMgQmVyZyB3cm90ZToKPiBPbiBGcmksIDIwMjEt
MDgtMjAgYXQgMDg6MjAgLTA0MDAsIFdlbiBHb25nIHdyb3RlOgo+PiAKPj4gwqAJaWYgKCEoaWZt
Z2QtPmZsYWdzICYgSUVFRTgwMjExX1NUQV9ESVNBQkxFX0hFKSkgewo+PiDCoAkJY29uc3Qgc3Ry
dWN0IGNmZzgwMjExX2Jzc19pZXMgKmllczsKPj4gKwkJc3RydWN0IGllZWU4MDIxMV9ic3NfY29u
ZiAqYnNzX2NvbmY7Cj4gCj4gYW0gSSBtaXNzaW5nIHdoZXJlIHlvdSBzZXQgdGhpcz8Kc29ycnks
IGkgbG9zdCBpdCBpbiB2MiBwYXRjaC4KYnNzX2NvbmYgPSAmc2RhdGEtPnZpZi5ic3NfY29uZjsK
PiAKPj4gKwkJaWYgKGlzXzZnaHopIHsKPj4gKwkJCXN0cnVjdCBpZWVlODAyXzExX2VsZW1zIGVs
ZW1zOwo+IAo+IFRoaXMgaXMgcHJldHR5IGJpZywgbm90IHN1cmUgd2Ugd2FudCBpdCBvbiB0aGUg
c3RhY2sgKGNhdXNlcyB3YXJuaW5ncwo+IGZvciBtZSBpbiBidWlsZCkuIEFsc28sIGlmIHdlJ3Jl
IGRvaW5nIHRoaXMgYW55d2F5LCB0aGVuIHdlIGNhbiBjaGFuZ2UKPiB0aGUgY29kZSBhYm92ZSAo
cGVyaGFwcyBhcyBhIHNlcGFyYXRlIHBhdGNoKSB0byBub3QgZG8KPiBjZmc4MDIxMV9maW5kX2V4
dF9pZSgpIGJ1dCByYXRoZXIgdGFrZSBpdCBvdXQgb2YgdGhlIHBhcnNlZC4Kd2lsbCBjaGFuZ2Ug
aXQuCj4gCj4+ICsJCQl1OCBpLCBqID0gMDsKPj4gKwo+PiArCQkJaWVlZTgwMl8xMV9wYXJzZV9l
bGVtcyhpZXMtPmRhdGEsIGllcy0+bGVuLCBmYWxzZSwgJmVsZW1zLAo+IAo+IChsaW5lIHRvbyBs
b25nKQo+IAo+PiArCQkJCQkgICAgICAgTlVMTCwgTlVMTCk7Cj4+ICsKPj4gKwkJCWlmIChlbGVt
cy5wd3JfY29uc3RyX2VsZW0pCj4+ICsJCQkJYnNzX2NvbmYtPnB3cl9yZWR1Y3Rpb24gPSAqZWxl
bXMucHdyX2NvbnN0cl9lbGVtOwo+IAo+IGJlZm9yZSB1c2luZyBpdD8KPiAKPj4gKwo+PiArCQkJ
QlVJTERfQlVHX09OKEFSUkFZX1NJWkUoYnNzX2NvbmYtPnR4X3B3cl9lbnYpICE9Cj4+ICsJCQkJ
ICAgICBBUlJBWV9TSVpFKGVsZW1zLnR4X3B3cl9lbnYpKTsKPj4gKwo+PiArCQkJZm9yIChpID0g
MDsgaSA8IGVsZW1zLnR4X3B3cl9lbnZfbnVtOyBpKyspIHsKPj4gKwkJCQlpZiAoZWxlbXMudHhf
cHdyX2Vudl9sZW5baV0gPgo+PiArCQkJCSAgICBzaXplb2YoYnNzX2NvbmYtPnR4X3B3cl9lbnZb
al0pKQo+PiArCQkJCQljb250aW51ZTsKPiAKPiBJIGRpZCB0aGF0IGluIHRoZSBwYXJzaW5nIGl0
c2VsZi4KPiAKPj4gKwo+PiArCQkJCWJzc19jb25mLT50eF9wd3JfZW52X251bSsrOwo+PiArCQkJ
CW1lbWNweSgmYnNzX2NvbmYtPnR4X3B3cl9lbnZbal0sIGVsZW1zLnR4X3B3cl9lbnZbaV0sCj4+
ICsJCQkJICAgICAgIGVsZW1zLnR4X3B3cl9lbnZfbGVuW2ldKTsKPiAKPiBZb3UncmUgbmV2ZXIg
cmVzZXR0aW5nIGFueSBvZiB0aGlzIGZvciB0aGUgbmV4dCBjb25uZWN0aW9uIChpZiBpdCdzIG5v
dAo+IDYgR0h6IGZvciBleGFtcGxlLCBvciBkb2Vzbid0IGhhdmUgYW55IGRhdGEpIC0gc2hvdWxk
IHByb2JhYmx5IG1lbXNldAo+IGFsbCB0aGUgbmV3IG1lbWJlcnMgdG8gMCBiZWZvcmUgdGhlICJp
ZiAoaXNfNmdoeikiIG9yIHNvPwo+IAppdCBpcyBtZW1zZXQgaGVyZSBpIHRoaXMgcGF0Y2g6Ci0t
LSBhL25ldC9tYWM4MDIxMS9jaGFuLmMKKysrIGIvbmV0L21hYzgwMjExL2NoYW4uYwpAQCAtNzIx
LDYgKzcyMSwxNSBAQCBzdGF0aWMgaW50IGllZWU4MDIxMV9hc3NpZ25fdmlmX2NoYW5jdHgoc3Ry
dWN0IAppZWVlODAyMTFfc3ViX2lmX2RhdGEgKnNkYXRhLAogICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAKbG9ja2RlcF9pc19oZWxkKCZsb2NhbC0+Y2hhbmN0eF9tdHgp
KTsKCiAgICAgICAgIGlmIChjb25mKSB7CisgICAgICAgICAgICAgICBpZiAoY29uZi0+ZGVmLmNo
YW4tPmJhbmQgPT0gTkw4MDIxMV9CQU5EXzZHSFopIHsKKyAgICAgICAgICAgICAgICAgICAgICAg
c3RydWN0IGllZWU4MDIxMV9ic3NfY29uZiAqYnNzX2NvbmY7CisKKyAgICAgICAgICAgICAgICAg
ICAgICAgYnNzX2NvbmYgPSAmc2RhdGEtPnZpZi5ic3NfY29uZjsKKyAgICAgICAgICAgICAgICAg
ICAgICAgYnNzX2NvbmYtPnB3cl9yZWR1Y3Rpb24gPSAwOworICAgICAgICAgICAgICAgICAgICAg
ICBic3NfY29uZi0+dHhfcHdyX2Vudl9udW0gPSAwOworICAgICAgICAgICAgICAgICAgICAgICBt
ZW1zZXQoYnNzX2NvbmYtPnR4X3B3cl9lbnYsIDAsIApzaXplb2YoYnNzX2NvbmYtPnR4X3B3cl9l
bnYpKTsKKyAgICAgICAgICAgICAgIH0KKwogICAgICAgICAgICAgICAgIGN1cnJfY3R4ID0gY29u
dGFpbmVyX29mKGNvbmYsIHN0cnVjdCBpZWVlODAyMTFfY2hhbmN0eCwgCmNvbmYpOwoKICAgICAg
ICAgICAgICAgICBkcnZfdW5hc3NpZ25fdmlmX2NoYW5jdHgobG9jYWwsIHNkYXRhLCBjdXJyX2N0
eCk7Cgo+IGpvaGFubmVzCgotLSAKYXRoMTFrIG1haWxpbmcgbGlzdAphdGgxMWtAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2F0
aDExawo=
