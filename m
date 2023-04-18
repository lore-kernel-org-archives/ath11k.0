Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA991C77B75
	for <ath11k@archiver.kernel.org>; Tue, 18 Apr 2023 08:48:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TZJVDHQSvHltfnJpRU0X5MI0tFzTYB0b6PF4ASHMpAg=; b=i7GI32AOhmW/K5
	V3CD4YeNMrT7DbUkAwhnNFmEtMt1ZgWNLNeLpIvu5NEIT3RHbooGd57Zq+e77ZeQ3WeFzXCnNHe68
	DEmyOgn1Ko7uiaVO7EkKc5DxoLGzMqCtyzu700athtHQ3yCnrZKwVThzdwOOGUh86leY1hmj+5KKn
	wi0TI9Id9ZTvwae1L3CW8GJD+OfKOjM6EMdFaFp+5TxVQWmxnALYycmohyX6PGMkWNqrwIb33+Gs1
	OwbUn9B8192sSdygCQY0uh1MpYjDz5tGdA5Av04WAZY5ZVRXawF6UUHrAktNJ8JxPGqX8MFySEVNj
	HUiFaKIRF9y41izBVMKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1poh0u-001ND9-1t;
	Tue, 18 Apr 2023 08:48:36 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1poh0s-001NBs-0T
	for ath11k@lists.infradead.org;
	Tue, 18 Apr 2023 08:48:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=2pNhfyigwf3jg3qPzX2v8I+sVoNNXo+B8ure2SdJcVw=;
	t=1681807713; x=1683017313; b=ESmJIsRwKxEhCX/Lld0OZXB0Zu4mphFpb0R7gT9zLfJvObm
	WO3vQUTY/5B1DLOOyFu+g+yDBRyE+TXV+Y7bHHK8cRuUwmeUE6fRFec+4taW0r48HlJ3P48IZl/Dd
	cZUtRnZT92FyV4LesboBgofyAZdvUfdX7qbvdGKDJFBO0PwnRkFBixv+3pGEBeCkZWR/5Pdo496lb
	pj856wWOUDJBCanPvfovCOn4oTYKmBLPxJ2NXEnZt+taFiZX1xayTBLmzoIO/2ZGq/q5eHbcJQXwf
	cR9GfHpavu1nnZ4jJ7TS36LGrql0et7UQqjGWogg9XWuKu3LPg5LVSQJhLLsNYYg==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <johannes@sipsolutions.net>)
	id 1poh0n-001Y87-2I;
	Tue, 18 Apr 2023 10:48:29 +0200
Message-ID: <e40ee96ab2a8d9d079d3a06b7b1c615ab25a2403.camel@sipsolutions.net>
Subject: Re: parsing the multi-link element with STA profile wifi: mac80211:
 support MLO authentication/association with one link
From: Johannes Berg <johannes@sipsolutions.net>
To: Wen Gong <quic_wgong@quicinc.com>, linux-wireless
	 <linux-wireless@vger.kernel.org>
Cc: ath11k@lists.infradead.org
Date: Tue, 18 Apr 2023 10:48:28 +0200
In-Reply-To: <571d8ecf-2ca6-8b7b-6e15-be12c56e9f88@quicinc.com>
References: <48715509-62fd-2307-e38f-176234b482c1@quicinc.com>
	 <f240b33d507daf898480b0a11eb27d4475e45164.camel@sipsolutions.net>
	 <571d8ecf-2ca6-8b7b-6e15-be12c56e9f88@quicinc.com>
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230418_014834_183807_A199E10C 
X-CRM114-Status: GOOD (  12.44  )
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

SGksCgo+IE15IGNhc2UgaXM6Cj4gV2hlbiBjb25uZWN0IHdpdGggMiBsaW5rcyBBUCwgdGhlIGNm
ZzgwMjExX2hvbGRfYnNzKCkgaXMgY2FsbGVkIGJ5IAo+IGNmZzgwMjExX21sbWVfYXNzb2MoKQo+
IGZvciBlYWNoIEJTUyBvZiB0aGUgMiBsaW5rcywKPiAKPiBXaGVuIGFzc3NvY1Jlc3AgZnJvbSBB
UCBpcyBub3Qgc3VjY2VzcyhzdWNoIGFzIHN0YXR1c19jb2RlPT0xKSwgdGhlIAo+IGllZWU4MDIx
MV9saW5rX2RhdGEgb2YgMm5kIGxpbmsoc2RhdGEtPmxpbmtbbGlua19pZF0pCj4gaXMgTlVMTCBi
ZWNhdXNlIGllZWU4MDIxMV9hc3NvY19zdWNjZXNzKCktPmllZWU4MDIxMV92aWZfdXBkYXRlX2xp
bmtzKCkgCj4gaXMgbm90IGNhbGxlZC4KPiAKPiBUaGVuIHN0cnVjdCBjZmc4MDIxMV9yeF9hc3Nv
Y19yZXNwIHJlc3AgaW4gY2ZnODAyMTFfcnhfYXNzb2NfcmVzcCgpIGFuZAo+IHN0cnVjdCBjZmc4
MDIxMV9jb25uZWN0X3Jlc3BfcGFyYW1zIGNyIGluIF9fY2ZnODAyMTFfY29ubmVjdF9yZXN1bHQo
KSAKPiB3aWxsIG9ubHkgaGF2ZSB0aGUgZGF0YSBvZgo+IHRoZSAxc3QgbGluaywgYW5kIGZpbmFs
bHkgY2ZnODAyMTFfY29ubmVjdF9yZXN1bHRfcmVsZWFzZV9ic3NlcygpIG9ubHkgCj4gY2FsbCBj
Zmc4MDIxMV91bmhvbGRfYnNzKCkKPiBmb3IgdGhlIDFzdCBsaW5rLCB0aGVuIEJTUyBvZiB0aGUg
Mm5kIGxpbmsgd2lsbCBuZXZlciBmcmVlIGJlY2F1c2UgaXRzIAo+IGhvbGQgaXMgYXdsYXlzID4g
MCBub3cuCgpIYWgsIHllcywgb3VjaC4KCj4gSSBmb3VuZCBpdCBpcyBub3QgZWFzeSB0byByZWZp
bmUgaXQsIHNvIGRvIHlvdSBoYXZlIGFueSBhZHZpc2UvaWRlYT8KPiAKPiBmb3IgKGxpbmtfaWQg
PSAwOyBsaW5rX2lkIDwgSUVFRTgwMjExX01MRF9NQVhfTlVNX0xJTktTOyBsaW5rX2lkKyspIHsK
PiAgwqDCoMKgwqDCoMKgwqAgc3RydWN0IGllZWU4MDIxMV9saW5rX2RhdGEgKmxpbms7Cj4gCj4g
IMKgwqDCoMKgwqDCoMKgIGxpbmsgPSBzZGF0YV9kZXJlZmVyZW5jZShzZGF0YS0+bGlua1tsaW5r
X2lkXSwgc2RhdGEpOwo+ICDCoMKgwqDCoMKgwqDCoCBpZiAoIWxpbmspCj4gIMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgY29udGludWU7Cj4gCj4gIMKgwqDCoMKgwqDCoMKgIGlmICghYXNzb2NfZGF0
YS0+bGlua1tsaW5rX2lkXS5ic3MpCj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY29udGludWU7
Cj4gCj4gIMKgwqDCoMKgwqDCoMKgIHJlc3AubGlua3NbbGlua19pZF0uYnNzID0gYXNzb2NfZGF0
YS0+bGlua1tsaW5rX2lkXS5ic3M7Cj4gIMKgwqDCoMKgwqDCoMKgIHJlc3AubGlua3NbbGlua19p
ZF0uYWRkciA9IGxpbmstPmNvbmYtPmFkZHI7Cj4gIMKgwqDCoMKgwqDCoMKgIHJlc3AubGlua3Nb
bGlua19pZF0uc3RhdHVzID0gYXNzb2NfZGF0YS0+bGlua1tsaW5rX2lkXS5zdGF0dXM7Cj4gCgpC
dXQgaXMgaXQgcmVhbGx5IHNvIGhhcmQ/IFdlIG9ubHkgbmVlZCBsaW5rIGZvciBsaW5rLT5jb25m
LT5hZGRyLCBhbmQgd2UKY2FuIHVzZSBhc3NvY19kYXRhLT5saW5rW2xpbmtfaWRdLmFkZHIgZm9y
IHRoYXQgaW5zdGVhZCwgbm8/IFdlIG5lZWQgdG8Kc3RvcmUgdGhvc2UgbG9jYWxseSB0byBhdm9p
ZCBhIHVzZS1hZnRlci1mcmVlLCBidXQgdGhhdCdzIGF0IG1vc3QgMTUKYWRkcmVzc2VzIG9uIHRo
ZSBzdGFjaywgd2hpY2ggc2VlbXMgYWNjZXB0YWJsZT8KCk9oIGFuZCB0aGVyZSdzIHRoZSB1YXBz
ZCBzdHVmZiBidXQgdGhhdCBvbmx5IG1hdHRlcnMgaW4gdGhlIHN1Y2Nlc3MgY2FzZQphbnl3YXku
IEluIGZhY3QgSSdtIG5vdCBldmVuIHN1cmUgdGhlIGFkZHJlc3MgbWF0dGVycyBpbiB0aGUKdW5z
dWNjZXNzZnVsIGNhc2UgYnV0IHdlIGhhdmUgaXQgcHJldHR5IGVhc2lseS4KCmpvaGFubmVzCgot
LSAKYXRoMTFrIG1haWxpbmcgbGlzdAphdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2F0aDExawo=
