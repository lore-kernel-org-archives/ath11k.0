Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69FF6C7EE23
	for <ath11k@archiver.kernel.org>; Wed, 10 May 2023 12:25:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6u8nXmD6WPTa/hB8zIigOuno9tJH1aTSCAtLKr/sYQw=; b=e/ZkMIFtXhAkv5
	XWGmh1NouiZtsx/E3dLyZGBhbvUDxpawfP/PVtNdQ36ZOjtZFQbUcSH8o4ysqgMYVpItfpczh+ULV
	PKGJXy3+X47bnxdddeOgYbw8QK8e3UEpzrQEU8uINNs44iCW+LyCypyGAAc54DUMH++v0La+2TUEI
	5/aTjKYxABeYWldPJ8QjUvDNvHb4dInHz5rB3BxlawXexZ9Ngh+C2OatasElP+OfD65rJDmcpkCF8
	ryE48c9udFMN7BDpqN/BSCp0G1uZXr79ccqI+JlyqJLZOYoQbjnW6pekgl9k2AnK+BLngp5orGIV0
	ZfLfVmPx/RClGH8NxhXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwitA-0068e2-0A;
	Wed, 10 May 2023 12:25:48 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwit7-0068cb-06
	for ath11k@lists.infradead.org;
	Wed, 10 May 2023 12:25:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=fH86BazKajYWz6GKOtNlQLeQieZJZxHPckvxia2YnZo=;
	t=1683721543; x=1684931143; b=tIt/y65DsvcgHzIdocLd36MygNJem0axghP1oIchNY1gs/f
	LHOI0uN8egEcwrZW/SHAgHng8292cQ6QSbiDy/DoiU0UYn7Y7CFLQHbBgzSw++Z5poya3HEWjyJhh
	cc/c3iLtVulE0e6cDQi++7RtuYa9jtErnas2MpIt242/B6oR/khJj56zE0DViYOOKFngfQlCV3LeZ
	oSijRTP38xrghvol4s9Nm29u6zCo5GymdXbBdjqVJaM5XisRcJSDFK1szx1j9nz5jaOCotgFd6HUf
	1JferVGOeyYvT4Dx4gGNCusTjor1I8161iJI6k/ZUQjd0FD1igrcDbXpwNA99oYA==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <johannes@sipsolutions.net>)
	id 1pwit0-005OZF-1y;
	Wed, 10 May 2023 14:25:38 +0200
Message-ID: <c1adcc4ddeb7c47c3255cc2953d3b9debee681ca.camel@sipsolutions.net>
Subject: Re: [PATCH 10/27] wifi: mac80211: isolate driver from inactive links
From: Johannes Berg <johannes@sipsolutions.net>
To: Wen Gong <quic_wgong@quicinc.com>, linux-wireless@vger.kernel.org
Cc: ath11k@lists.infradead.org
Date: Wed, 10 May 2023 14:25:37 +0200
In-Reply-To: <de1f920b-66f5-fb0a-47a5-622ba6bbbff8@quicinc.com>
References: <20220902141259.377789-1-johannes@sipsolutions.net>
	 <20220902161143.5ce3dad3be7c.I92e9f7a6c120cd4a3631baf486ad8b6aafcd796f@changeid>
	 <5d82e564-86bf-c26b-077a-d0bc14e2d3c3@quicinc.com>
	 <74f3eb848326607b15336c31a02bdd861ccafb47.camel@sipsolutions.net>
	 <d10b88b4-0bd7-a38c-e8d7-8982a281c4b3@quicinc.com>
	 <e5adbed1524b27228c152ba14f78c550c8730baa.camel@sipsolutions.net>
	 <5e3ec5f8-1462-5de6-2b5a-4cf62f23deb7@quicinc.com>
	 <0e7023062f44d0ea68625c27cb13731d17857311.camel@sipsolutions.net>
	 <de1f920b-66f5-fb0a-47a5-622ba6bbbff8@quicinc.com>
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230510_052545_072115_FAAB1A1A 
X-CRM114-Status: GOOD (  20.16  )
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

T24gV2VkLCAyMDIzLTA1LTEwIGF0IDIwOjI1ICswODAwLCBXZW4gR29uZyB3cm90ZToKPiBPbiA1
LzEwLzIwMjMgNzoyNCBQTSwgSm9oYW5uZXMgQmVyZyB3cm90ZToKPiA+IE9uIFdlZCwgMjAyMy0w
NS0xMCBhdCAxOTowNiArMDgwMCwgV2VuIEdvbmcgd3JvdGU6Cj4gPiA+IE9uIDQvMTEvMjAyMyAz
OjM4IFBNLCBKb2hhbm5lcyBCZXJnIHdyb3RlOgo+ID4gPiA+IE9uIFR1ZSwgMjAyMy0wNC0wNCBh
dCAxMToyOCArMDgwMCwgV2VuIEdvbmcgd3JvdGU6Cj4gPiA+ID4gPiBNYXkgSSBhbHNvIGFkZCBh
IGZpZWxkIHN1Y2ggYXMgInUxNiBhY3RpdmVfbGlua3NfY291bnQiIGluIHN0cnVjdAo+ID4gPiA+
ID4gd2lwaHlfaWZ0eXBlX2V4dF9jYXBhYiwKPiA+ID4gPiA+IGFuZCBhZGQgbG9naWMgaW4gZnVu
Y3Rpb24gaWVlZTgwMjExX3NldF92aWZfbGlua3NfYml0bWFwcygpIGZvciBzdGF0aW9uCj4gPiA+
ID4gPiBsaWtlIHRoaXMgPzoKPiA+ID4gPiA+IGlmIChhY3RpdmVfbGlua3NfY291bnQgJiYgaHdl
aWdodDE2KGxpbmtzKSA8PSBhY3RpdmVfbGlua3NfY291bnQpCj4gPiA+ID4gPiAgICDCoMKgwqAg
dGhlbiBzZGF0YS0+dmlmLmFjdGl2ZV9saW5rcyA9IGxpbmtzOwo+ID4gPiA+ID4gCj4gPiA+ID4g
QWxzbyBoZXJlLCBub3Qgc3VyZSBpdCBtYWtlcyBzZW5zZSBpbiBjZmc4MDIxMSBsZXZlbD8KPiA+
ID4gPiAKPiA+ID4gPiBUaG91Z2ggSSdtIG5vdCBzdXJlIHdoYXQgdGhlIGlkZWEgaGVyZSBpcyBh
dCBhbGwgLSB5b3UgY2FuIHJlZnVzZSB0bwo+ID4gPiA+IGxpbmsgc3dpdGNoIGV0Yywgd2hhdCB3
b3VsZCB5b3UgdXNlIHRoaXMgZm9yPwo+ID4gPiA+IAo+ID4gPiA+IFRoZW4gYWdhaW4sIHdlIGhh
dmVuJ3QgcmVhbGx5IGRlc2lnbmVkIG91dCBhbGwgdGhlIGxpbmsgc2VsZWN0aW9uIHN0dWZmLAo+
ID4gPiA+IGRvIHdlIHdhbnQgd3BhX3MgdG8gZG8gaXQsIGRyaXZlciB0byBkbyBpdCwgZXRjLj8g
SGVuY2UgZGVidWdmcy4gU28KPiA+ID4gPiBkZXBlbmRpbmcgb24gd2hhdCBlbmQgdXAgZG9pbmcg
dGhlcmUsIHdlIHdpbGwgb2J2aW91c2x5IG5lZWQgdG8KPiA+ID4gPiBhZHZlcnRpc2Ugc29tZSBs
ZXZlbCBvZiBsaW5rLWNvbmN1cnJlbmN5IHRvIHVzZXJzcGFjZS4KPiA+ID4gU28gd2lsbCB5b3Ug
cGxhbiB0byBkbyBzb21ldGhpbmcgdG8gbGV0IHdwYV9zL3VzZXJzcGFjZSBhcHAKPiA+ID4gYWN0
aXZlL2RlYWN0aXZlIGxpbmtzPwo+ID4gPiAKPiA+ID4gT3IgeW91IGFscmVhZHkgaGF2ZSBpbXBs
ZW1lbnRlZCB0aGF0Pwo+ID4gPiAKPiA+IE5vIHBsYW5zIHJpZ2h0IG5vdywgYW5kIGhvbmVzdGx5
IG5vdCBzdXJlIHdoYXQgdGhlIHJpZ2h0IHRoaW5nIGV2ZW4gaXMuCj4gT0suIEZvciAiYWR2ZXJ0
aXNlIHNvbWUgbGV2ZWwgb2YgbGluay1jb25jdXJyZW5jeSB0byB1c2Vyc3BhY2UiLCBkbyB5b3Ug
Cj4gaGF2ZSBhbnkgcGxhbi9pZGVhPwoKTm8sIG5vdCByZWFsbHkuCgpqb2hhbm5lcwo+IAoKLS0g
CmF0aDExayBtYWlsaW5nIGxpc3QKYXRoMTFrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9hdGgxMWsK
