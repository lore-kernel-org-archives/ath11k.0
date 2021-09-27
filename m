Return-Path: <SRS0=w2Qz=OR=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0124CC433F5
	for <ath11k@archiver.kernel.org>; Mon, 27 Sep 2021 11:27:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B808260F91
	for <ath11k@archiver.kernel.org>; Mon, 27 Sep 2021 11:27:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B808260F91
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=sipsolutions.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m3ijm7XTQUbK/v8zoqCAPcdhVHBjl0hvqDEF6XU2AlI=; b=cYHYkxkbF3wW9t
	c0rVFfJ20K6gba7uEbH7Vy2yROLLV1n+RgIpCMfYhSpYFYA/dtmsEFfZypo0GJNuVHBANXuSP3uPv
	6AGJQW7QlUcfNXwWP+dfNnoeVawsGp0Db7xm8VCYS3UelAJTodWZg5tCUpizwfhRKEkaHX2kFcq54
	7EsuKuUjkqBeHOhU/x95zX/vUCy0T+SKVfpsok/vWc/XANw+3yx97BWEMnL14dcVa6ASWL1V+ZMi+
	7gapzqDzrCk+ArBVe+66MFHEjlyAE5JnNNp7fi4vajzIWLi8ZCUNKLoH3KblidzD8pY+ZWdYABs/N
	f4iMVvwMfjGuGUbrvTbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mUonc-002RBl-SV; Mon, 27 Sep 2021 11:27:56 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2]
 helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mUona-002RB5-7I
 for ath11k@lists.infradead.org; Mon, 27 Sep 2021 11:27:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sipsolutions.net; s=mail; h=Content-Transfer-Encoding:MIME-Version:
 Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
 Resent-Cc:Resent-Message-ID; bh=Nz+y2JP7TwcTL0tlwgIA9WmBtkgmcv08htMspl3Amhw=; 
 t=1632742074; x=1633951674; b=R8MenoEwtn6LKUF2flXGcytpeJcsOUx5MH42qrY+R9aMk6V
 CCfLmpawEC3LAYlkiagedLmgi5ZvsnUFipgMI4wPtIA2VztCx4nYSiVrZE+B/HvweA292tVE4OOFh
 Zx8akti6x6gCTwDsGwmuwXz9YUHVdJXKsxdLP/kBV5yMzVMOrAqeHaD01BQgtUcUPJAMDgiYcb36D
 sJOGefw3AVE46HmSZRXER27HNvqHO8ID4n9cK2OVPlJqGBaS2jN3tUeCc9lStBue2Lw3kPeDKcBHc
 fiZZ2r6GydsvQ2o8+Dh+nLPQKN1K4q0KjzIZFveEmdHqEDZIq86/K36icmUSABiw==;
Received: by sipsolutions.net with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.95-RC2) (envelope-from <johannes@sipsolutions.net>)
 id 1mUonY-00COei-Ni; Mon, 27 Sep 2021 13:27:52 +0200
Message-ID: <a4e56dbbe88771456bcf3051a0891d66d5e34fd4.camel@sipsolutions.net>
Subject: Re: [PATCH v4 4/6] cfg80211: save power spectral density(psd) of
 regulatory rule
From: Johannes Berg <johannes@sipsolutions.net>
To: Wen Gong <wgong@codeaurora.org>, ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Date: Mon, 27 Sep 2021 13:27:51 +0200
In-Reply-To: <20210924100052.32029-5-wgong@codeaurora.org>
References: <20210924100052.32029-1-wgong@codeaurora.org>
 <20210924100052.32029-5-wgong@codeaurora.org>
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210927_042754_285648_448D5F94 
X-CRM114-Status: GOOD (  19.55  )
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

T24gRnJpLCAyMDIxLTA5LTI0IGF0IDA2OjAwIC0wNDAwLCBXZW4gR29uZyB3cm90ZToKPiBUaGUg
cG93ZXIgc3BlY3RyYWwgZGVuc2l0eShwc2QpIG9mIHJlZ3VsYXRvcnkgcnVsZSBzaG91bGQgYmUg
dGFrZQo+IGVmZmVjdCB0byB0aGUgY2hhbm5lbHMuIFRoaXMgcGF0Y2ggaXMgdG8gc2F2ZSB0aGUg
dmFsdWVzIHRvIHRoZQo+IGNoYW5uZWwgd2hpY2ggaGFzIHBzZCB2YWx1ZS4KPiAKPiBTaWduZWQt
b2ZmLWJ5OiBXZW4gR29uZyA8d2dvbmdAY29kZWF1cm9yYS5vcmc+Cj4gLS0tCj4gwqBuZXQvd2ly
ZWxlc3MvcmVnLmMgfCAxNyArKysrKysrKysrKysrKysrKwo+IMKgMSBmaWxlIGNoYW5nZWQsIDE3
IGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvbmV0L3dpcmVsZXNzL3JlZy5jIGIvbmV0
L3dpcmVsZXNzL3JlZy5jCj4gaW5kZXggZGY4N2M3ZjNhMDQ5Li44Zjc2NWJlZmI5YmMgMTAwNjQ0
Cj4gLS0tIGEvbmV0L3dpcmVsZXNzL3JlZy5jCj4gKysrIGIvbmV0L3dpcmVsZXNzL3JlZy5jCj4g
QEAgLTE1OTAsNiArMTU5MCw4IEBAIHN0YXRpYyB1MzIgbWFwX3JlZ2RvbV9mbGFncyh1MzIgcmRf
ZmxhZ3MpCj4gwqAJCWNoYW5uZWxfZmxhZ3MgfD0gSUVFRTgwMjExX0NIQU5fTk9fMTYwTUhaOwo+
IMKgCWlmIChyZF9mbGFncyAmIE5MODAyMTFfUlJGX05PX0hFKQo+IMKgCQljaGFubmVsX2ZsYWdz
IHw9IElFRUU4MDIxMV9DSEFOX05PX0hFOwo+ICsJaWYgKHJkX2ZsYWdzICYgTkw4MDIxMV9SUkZf
UFNEKQo+ICsJCWNoYW5uZWxfZmxhZ3MgfD0gSUVFRTgwMjExX0NIQU5fUFNEOwoKSSB3ZW50IHRv
IGdvIHNxdWFzaCB0aGlzIHdpdGggcGF0Y2ggMyBhbmQgdG9vayBhIGNsb3NlciBsb29rLCBhbmQg
dGhlbiBJCnJlYWxpemVkIHlvdSdyZSBkb2luZyB0aGlzIHdlaXJkLgoKUGxlYXNlIHdoZW4geW91
IHJlc2VuZCBhbHNvIHNxdWFzaCB0aGlzIC0gaXQncyBhIGJpdCB3ZWlyZCB0byByZWFkIGluCnR3
byBwYXRjaGVzLgoKSG93ZXZlciwgSSB0aGluayB0aGlzIGlzIG1pc3NpbmcgYSBsb3Qgb2YgdGhp
bmdzIC0gd2UgYWxyZWFkeSB0YWxrZWQKYWJvdXQgdGhlIHJlZ3VsYXRvcnkgZGF0YWJhc2UsIGFu
ZCB3aGlsZSB0aGF0J2QgYmUgbmljZSwgSSBndWVzcyBJCmNvbmNlZGVkIHRoYXQgeW91IGRvbid0
IHJlYWxseSBoYXZlIHRvIGRvIGl0IG5vdy4KCkhvd2V2ZXIsIGZvciB2aXNpYmlsaXR5IHJlYXNv
bnMsIEkgKnJlYWxseSogdGhpbmsgeW91IG5lZWQgdG8gYWRkCm5sODAyMTEgYXR0cmlidXRlcyBm
b3IgYWxsIG9mIHRoaXMgZGF0YSAtIHdoZW4gdGhlIHJlZ2RvbWFpbiBpcyBkdW1wZWQKaW4gbmw4
MDIxMV9wdXRfcmVnZG9tKCkgeW91IHdvdWxkIGhhdmUgdGhlIGZsYWcgbm93IChpdCBkdW1wcyB0
aGUgdmFsdWUKb2YgcmVnX3J1bGUtPmZsYWdzIGluIE5MODAyMTFfQVRUUl9SRUdfUlVMRV9GTEFH
UyksIGJ1dCB5b3UgZGlkbid0IGFkZAp0aGUgdmFsdWUgb2YgcmVnX3J1bGUtPnBzZCB3aGljaCB5
b3UndmUgYWRkZWQuCgpTaW1pbGFybHksIHlvdSdyZSBub3QgYWRkaW5nIHRoZSBQU0QgZmxhZyBu
b3IgdGhlIFBTRCB2YWx1ZSBmb3IgdGhlCipjaGFubmVsKiBpbiBubDgwMjExX21zZ19wdXRfY2hh
bm5lbCgpLCBib3RoIG9mIHdoaWNoIEkgdGhpbmsgeW91IHNob3VsZApoYXZlIGZvciB2aXNpYmls
aXR5IGludG8gd2hhdCdzIGdvaW5nIG9uIGluIHRoZSBrZXJuZWwvZHJpdmVyLgoKSSd2ZSBhcHBs
aWVkIGFsbCB0aGUgb3RoZXIgcGF0Y2hlcywgc28gcGxlYXNlIGp1c3QgcmVzZW5kIDMgYW5kIDQs
CnNxdWFzaGVkIGludG8gYSBzaW5nbGUgcGF0Y2gsIHdpdGggdGhlIGZpeGVzLgoKam9oYW5uZXMK
CgotLSAKYXRoMTFrIG1haWxpbmcgbGlzdAphdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2F0aDExawo=
