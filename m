Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D316EC77B75
	for <ath11k@archiver.kernel.org>; Tue, 18 Apr 2023 08:19:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YB9h/quevsue4vylsUopp0sCpEHeYN97bqy9F+0I228=; b=l0EAJ6bgw3o3ho
	McsuIjfiVE6TGl24QGgM4/pl51SRwfX4OxU4AQ9pKkuCeTPPk3Qn84tOZO9lQXAx5VZCCEMoMPU3Y
	N1DS1xVt/rhfoJFEX/UZJLH5YdHTi3Ko+fyMART+kgwaqLYXWbhlLq85wDawduazm6pJKHYKeXkwS
	kSeMXm6IlcKrfmwmHF1jctol8EXjp3DXD1B5ycTJrrsXT+xCJL0gYeLPQDuilRGq6RrBoohYMmABA
	9xNbjYhrKQGbFyAtT4chSUlFbABOjw7QXpfP8DDiJQiEI+1tUlCGiVGgVGXKuC9+EMF+XgMiYMqtw
	GB04vjfx2j1ToZwCWz8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pogYK-001Hsz-1Q;
	Tue, 18 Apr 2023 08:19:04 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pogYI-001HsT-0A
	for ath11k@lists.infradead.org;
	Tue, 18 Apr 2023 08:19:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=Ikol0l/TvRGzuG8c6TvFV/l96gE43Z3P2Br4TTBQDGE=;
	t=1681805941; x=1683015541; b=VsD+BFaxu7MtvE75ocqafkxCoQkMrQKgzD5mT8fav8jIO6X
	VbOLyoWcAWf5Ey7MZb74CoZuBXLgo1gtTBYFJFnLh0UWsILCUS8zRj7OiKa3nscU7H9MhidJF06wA
	myvornAlJQr0e/q5w/7MERcHuFm/Cho2O299dZtuMpjli9W58Evrt6EUZjmU0QQY6d4Vrh6UXndZ8
	JsTCIWYD1dhKtgFV0MLLVRgRGUpvqX2tVTBAebNcG20MOxnBaqyu/KxdOR6a/cpeZBomRZqX5q9q7
	nM0Ck3XWzyDDTFgkSzNqLZ9VFslmuhnUeblxMvRfP/ZV+9QGWqtDD3/b/X6mwAqw==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <johannes@sipsolutions.net>)
	id 1pogYD-001XZP-2H;
	Tue, 18 Apr 2023 10:18:57 +0200
Message-ID: <113761966918b2f390d3c9304307b42a0b4a829b.camel@sipsolutions.net>
Subject: Re: [PATCH 10/27] wifi: mac80211: isolate driver from inactive links
From: Johannes Berg <johannes@sipsolutions.net>
To: Wen Gong <quic_wgong@quicinc.com>, linux-wireless@vger.kernel.org
Cc: ath11k@lists.infradead.org
Date: Tue, 18 Apr 2023 10:18:56 +0200
In-Reply-To: <c15e368e-2fea-a1d8-9c0d-db9278ded5e5@quicinc.com>
References: <20220902141259.377789-1-johannes@sipsolutions.net>
	 <20220902161143.5ce3dad3be7c.I92e9f7a6c120cd4a3631baf486ad8b6aafcd796f@changeid>
	 <5d82e564-86bf-c26b-077a-d0bc14e2d3c3@quicinc.com>
	 <74f3eb848326607b15336c31a02bdd861ccafb47.camel@sipsolutions.net>
	 <d10b88b4-0bd7-a38c-e8d7-8982a281c4b3@quicinc.com>
	 <e5adbed1524b27228c152ba14f78c550c8730baa.camel@sipsolutions.net>
	 <c15e368e-2fea-a1d8-9c0d-db9278ded5e5@quicinc.com>
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230418_011902_087178_ED21B724 
X-CRM114-Status: GOOD (  19.48  )
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

T24gTW9uLCAyMDIzLTA0LTE3IGF0IDIyOjEzICswODAwLCBXZW4gR29uZyB3cm90ZToKPiBPbiA0
LzExLzIwMjMgMzozOCBQTSwgSm9oYW5uZXMgQmVyZyB3cm90ZToKPiA+IE9uIFR1ZSwgMjAyMy0w
NC0wNCBhdCAxMToyOCArMDgwMCwgV2VuIEdvbmcgd3JvdGU6Cj4gPiA+IE1heSBJIGFsc28gYWRk
IGEgZmllbGQgc3VjaCBhcyAidTE2IGFjdGl2ZV9saW5rc19jb3VudCIgaW4gc3RydWN0Cj4gPiA+
IHdpcGh5X2lmdHlwZV9leHRfY2FwYWIsCj4gPiA+IGFuZCBhZGQgbG9naWMgaW4gZnVuY3Rpb24g
aWVlZTgwMjExX3NldF92aWZfbGlua3NfYml0bWFwcygpIGZvciBzdGF0aW9uCj4gPiA+IGxpa2Ug
dGhpcyA/Ogo+ID4gPiBpZiAoYWN0aXZlX2xpbmtzX2NvdW50ICYmIGh3ZWlnaHQxNihsaW5rcykg
PD0gYWN0aXZlX2xpbmtzX2NvdW50KQo+ID4gPiAgIMKgwqDCoCB0aGVuIHNkYXRhLT52aWYuYWN0
aXZlX2xpbmtzID0gbGlua3M7Cj4gPiA+IAo+ID4gQWxzbyBoZXJlLCBub3Qgc3VyZSBpdCBtYWtl
cyBzZW5zZSBpbiBjZmc4MDIxMSBsZXZlbD8KPiA+IAo+ID4gVGhvdWdoIEknbSBub3Qgc3VyZSB3
aGF0IHRoZSBpZGVhIGhlcmUgaXMgYXQgYWxsIC0geW91IGNhbiByZWZ1c2UgdG8KPiA+IGxpbmsg
c3dpdGNoIGV0Yywgd2hhdCB3b3VsZCB5b3UgdXNlIHRoaXMgZm9yPwo+IElmIEkgdXNlIGllZWU4
MDIxMV9zZXRfYWN0aXZlX2xpbmtzKCksCj4gdGhlbiBJIG5lZWQgYWRkIEJTU19DSEFOR0VEX0FT
U09DIGFuZCBrZXkgZm9yIDJuZCBsaW5rIGluIGxvd2VyLWRyaXZlci4KPiAKPiBJIHdvdWxkIGxp
a2UgdG8gYWN0aXZlIGFsbCBsaW5rcyB3aGlsZSBhc3NvYywKPiB0aGVuIEJTU19DSEFOR0VEX0FT
U09DIGFuZCBrZXkgd2lsbCBhdXRvIHNldCBmb3IgdGhlIDJuZCBsaW5rIHRvIAo+IGxvd2VyLWRy
aXZlciBmcm9tIG1hYzgwMjExLgoKSSdtIG5vdCBjb252aW5jZWQgdGhhdCBtYWtlcyBzZW5zZS4g
WW91J3JlIGdvaW5nIHRvIGhhdmUgdG8gYmUgYWJsZSB0bwpkZWFsIHdpdGggY2hhbmdpbmcgbGlu
a3MgYWZ0ZXIgYXNzb2NpYXRpb24gX2FueXdheV8sIHVubGVzcyB5b3UgcGxhbiBvbgpicmVha2lu
ZyB0aGUgZW50aXJlIGNvbm5lY3Rpb24gb25jZSBhbnkgb2YgdGhlIGxpbmtzIGlzIGdldHRpbmcg
b3V0IG9mCnJhbmdlIG9yIHNvbWV0aGluZz8KClNvIGFueXdheSB5b3UncmUgZ29pbmcgdG8gaGF2
ZSB0byBiZSBhYmxlIHRvIHRoaXMgZm9yIG5ldyBsaW5rcyBhbnl3YXk/CkkgbWVhbiBkb2luZyBr
ZXkgbWFuYWdlbWVudCB3aGVuIGxpbmsgc3dpdGNoaW5nLCBhbmQgImFzc29jaWF0aW9uIiAoaW4K
cXVvdGVzLCBiZWNhdXNlIGFzIGEgdGVybSBkb2Vzbid0IGV2ZW4gbWFrZSBzZW5zZSBzaW5jZSB0
aGlzIHN0YXRlIGlzIG9uCnRoZSBNTEQgbGV2ZWwsIG5vdCB0aGUgbGluayBsZXZlbCkuLi4KClNv
IG5vdCBzdXJlIEkgZ2V0IGl0PwoKam9oYW5uZXMKCi0tIAphdGgxMWsgbWFpbGluZyBsaXN0CmF0
aDExa0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vYXRoMTFrCg==
