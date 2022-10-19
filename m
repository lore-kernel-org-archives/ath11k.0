Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 163ACC433FE
	for <ath11k@archiver.kernel.org>; Wed, 19 Oct 2022 09:40:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ncvSz0SQkop0/Xa5+YazAj866DF0vIcUoKTr3SbM2Uw=; b=SMuXalFJmIEVTD
	zAveohKbLlwK4Lvk71j+ETsEvZNVGjuTFsXswi8tPosIhkZfIEYnA436jgczm64E1HQ/cvP8KU0Fb
	e9+7va/lld02WO1ZBk4EAnRwyK9TV8GlPgq8yTVh93Jk538lzaYfJuXo8Q6cevwWFBBAmyY3tNecD
	Q/FE9fl2dvUOCT9jEIC5MjmluTt+lkMCqLP4KLD5vWKgzI7LtEjDphQxu1Jm5iY8Ex60pe2YPJ32N
	9fn4ylnXSvI4ax6/id5UtY68uqcJf8Yk2F8DdjPpJsS1cM2w9x7cYxNLV3boIrkXbbWmpZRnZWsMC
	+xIpMgULHb0FQ5Tks2nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ol5Yb-00HQWp-Hd; Wed, 19 Oct 2022 09:40:13 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ol5YQ-00HPmu-9A; Wed, 19 Oct 2022 09:40:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=s36QNv/moHHJ+f1RqNZgsNfQjM0SpYNUcmf7spZNn7Y=;
	t=1666172319; x=1667381919; b=QMLnfn7lIRzCH6xU29yCS+KdIewBEtR4/RYTqbhp6yeFXXs
	n824pNI+kTiND+ABYSu9K/HTPNZuMunpjWGlX2WMCb1w8s9KJ9s/p0Y5+ZWXKeU83aa0u4PFrXnNG
	t7HZgGHlfxh3E64UlWvjh+ho2ceMIMs95FpTBiNzD6POblVbDXoPp5cwl/pLUBqEc2raOBIbBq6Dx
	JcXzyYkEbs9jOpHXaGBAazR+gu+Z3EJfsGN55kwIXZXPXo/4c9AnsjWS0vBMwjGUY9vMNxzQccPpx
	e6sOiKfG3g66vYEqhQzadR4O1GFE8SAHQ1ge6aQyMfpqpJbhc/cbjoRqOEjrwBAg==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <johannes@sipsolutions.net>)
	id 1ol5Wz-00B30v-0z;
	Wed, 19 Oct 2022 11:38:33 +0200
Message-ID: <5f652efb43226f67e932f5aaf97cd717992bfd81.camel@sipsolutions.net>
Subject: Re: wifi: mac80211: Re: unicast probe response bssid changed by
 "wifi: mac80211: do link->MLD address translation on RX"
From: Johannes Berg <johannes@sipsolutions.net>
To: Wen Gong <quic_wgong@quicinc.com>, linux-wireless
	 <linux-wireless@vger.kernel.org>
Cc: ath11k@lists.infradead.org, ath12k@lists.infradead.org
Date: Wed, 19 Oct 2022 11:38:32 +0200
In-Reply-To: <9fe7c0f2-e02f-e87f-dced-90e973c8992f@quicinc.com>
References: <e1c5fbac-7e6e-c643-f24d-32cec779f2d3@quicinc.com>
	 <9fe7c0f2-e02f-e87f-dced-90e973c8992f@quicinc.com>
User-Agent: Evolution 3.44.4 (3.44.4-2.fc36) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221019_024002_378743_A9AF40B0 
X-CRM114-Status: GOOD (  18.52  )
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

T24gV2VkLCAyMDIyLTEwLTE5IGF0IDE3OjM1ICswODAwLCBXZW4gR29uZyB3cm90ZToKPiBPbiA5
LzE0LzIwMjIgMTE6MTMgQU0sIFdlbiBHb25nIHdyb3RlOgo+ID4gSGkgSm9oYW5uZXMsCj4gPiAK
PiA+IFRoZSBtYWMgYWRkciBvZiB1bmljYXN0IHJ4IHBhY2tldCBhbGwgY2hhbmdlZCB0byB0aGUg
TUxEIGFkZHJlc3MgYnkgCj4gPiBiZWxvdyBwYXRjaC4KPiA+IE5vdyB0aGUgcHJvYmUgcHJlc3Bv
bnNlIHdoaWNoIGlzIHVuaWNhc3QgcGFja2V0IGlzIGFsc28gY2hhbmdlZCBtYWMgCj4gPiBhZGRy
ZXNzIGhlcmUuCj4gPiBJIGZvdW5kIGJzc2lkIHdoaWNoIGlzIHRoZSBNTEQgYWRkcmVzcyBvZiBt
eSB0ZXN0IEFQIGluIAo+ID4gY2ZnODAyMTFfZ2V0X2JzcygpLgo+ID4gRm9yIGV4YW1wbGUsIGlm
IHRoZSBBUCBoYXMgMiBtbG8gbGlua3MsIGxpbmsgMSBpcyA1IEdIeiBiYW5kLCBsaW5rIDIgCj4g
PiBpcyAyLjQgR0h6IGJhbmQsCj4gPiB0aGVuIHRoZSAyIHByb2JlIHJlcG9uc2Ugd2lsbCBiZSBj
aGFuZ2VkIHRvIGEgc2FtZSBvbmUuCj4gPiBzZWVtcyB3ZSBzaG91bGQgc2tpcCBwcm9iZSBwcmVz
cG9uc2UgZm9yIHRoZSBtYWMgYWRkcmVzcyBjaGFuZ2UgaGVyZSwgCj4gPiByaWdodD8KPiA+IAo+
ID4gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQva3ZhbG8v
YXRoLmdpdC9jb21taXQvP2lkPTQyZmI5MTQ4YzA3ODAwNGQwN2I0YzM5YmQ3YjEwODZiNjE2NTc4
MGMgCj4gPiAKPiA+IHdpZmk6IG1hYzgwMjExOiBkbyBsaW5rLT5NTEQgYWRkcmVzcyB0cmFuc2xh
dGlvbiBvbiBSWAo+ID4gCj4gSGkgSm9oYW5uZXMsCj4gCj4gTWF5IEkgZ2V0IHlvdXIgY29tbWVu
dCBhYm91dCB0aGlzPwoKWWVzIEkndmUgYWN0dWFsbHkgc2VlbiB0aGlzIGlzc3VlIGFzIHdlbGwu
Cgo+IEkgZGlkIGJlbG93IGNoYW5nZSBpbiBteSBsb2NhbCB0ZXN0IHRvIHdvcmthcm91bmQgdGhl
IGlzc3VlLgo+IAo+IGRpZmYgLS1naXQgYS9uZXQvbWFjODAyMTEvcnguYyBiL25ldC9tYWM4MDIx
MS9yeC5jCj4gaW5kZXggYTU3ODExMzcyMDI3Li5lYWZmNTM1MzUyMGEgMTAwNjQ0Cj4gLS0tIGEv
bmV0L21hYzgwMjExL3J4LmMKPiArKysgYi9uZXQvbWFjODAyMTEvcnguYwo+IEBAIC00ODU4LDcg
KzQ4NTgsOCBAQCBzdGF0aWMgYm9vbCBpZWVlODAyMTFfcHJlcGFyZV9hbmRfcnhfaGFuZGxlKHN0
cnVjdCAKPiBpZWVlODAyMTFfcnhfZGF0YSAqcngsCj4gIMKgwqDCoMKgIMKgwqDCoCBzaHd0LT5o
d3RzdGFtcCA9IHNrYl9od3RzdGFtcHMoc2tiKS0+aHd0c3RhbXA7Cj4gIMKgwqDCoMKgIH0KPiAK
PiAtwqDCoMKgIGlmICh1bmxpa2VseShsaW5rX3N0YSkpIHsKPiArwqDCoMKgIGlmICh1bmxpa2Vs
eShsaW5rX3N0YSkgJiYKPiArwqDCoMKgIMKgwqDCoCAhKGllZWU4MDIxMV9pc19wcm9iZV9yZXNw
KGhkci0+ZnJhbWVfY29udHJvbCkpKSB7Cj4gIMKgwqDCoMKgIMKgwqDCoCAvKiB0cmFuc2xhdGUg
dG8gTUxEIGFkZHJlc3NlcyAqLwo+IAoKTWF5YmUgaXQgc2hvdWxkIGFsc28gYmUgZm9yIGJlYWNv
bnMgb3Igc28/Cgpqb2hhbm5lcwoKLS0gCmF0aDExayBtYWlsaW5nIGxpc3QKYXRoMTFrQGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9hdGgxMWsK
