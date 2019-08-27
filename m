Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mx1.redhat.com ([209.132.183.28])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i2fFZ-0006RO-Qd
 for ath11k@lists.infradead.org; Tue, 27 Aug 2019 17:27:23 +0000
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 9598289ACA
 for <ath11k@lists.infradead.org>; Tue, 27 Aug 2019 17:27:20 +0000 (UTC)
Received: by mail-ed1-f72.google.com with SMTP id r21so13655edc.6
 for <ath11k@lists.infradead.org>; Tue, 27 Aug 2019 10:27:20 -0700 (PDT)
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
Subject: Re: [PATCH 31/49] ath11k: add mac.c
In-Reply-To: <14737343f1925a771ddd8dadf0f2b5a3@codeaurora.org>
References: <1566316095-27507-1-git-send-email-kvalo@codeaurora.org>
 <1566316095-27507-32-git-send-email-kvalo@codeaurora.org>
 <8736hvu6e6.fsf@toke.dk> <ac6e7dbbd53e7ba9e82e49baca22b73c@codeaurora.org>
 <875zmqsudn.fsf@toke.dk> <14737343f1925a771ddd8dadf0f2b5a3@codeaurora.org>
Date: Tue, 27 Aug 2019 19:27:17 +0200
Message-ID: <87sgpmikne.fsf@toke.dk>
MIME-Version: 1.0
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
Errors-To: ath11k-bounces+kvalo=adurom.com@lists.infradead.org
To: Vasanthakumar Thiagarajan <vthiagar@codeaurora.org>
Cc: linux-wireless-owner@vger.kernel.org, devicetree@vger.kernel.org, linux-wireless@vger.kernel.org, ath11k@lists.infradead.org, Kalle Valo <kvalo@codeaurora.org>

VmFzYW50aGFrdW1hciBUaGlhZ2FyYWphbiA8dnRoaWFnYXJAY29kZWF1cm9yYS5vcmc+IHdyaXRl
czoKCj4gT24gMjAxOS0wOC0yMSAxNTozOCwgVG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2VuIHdyb3Rl
Ogo+PiBWYXNhbnRoYWt1bWFyIFRoaWFnYXJhamFuIDx2dGhpYWdhckBjb2RlYXVyb3JhLm9yZz4g
d3JpdGVzOgo+PiAKPj4+IE9uIDIwMTktMDgtMjAgMjI6MjEsIFRva2UgSMO4aWxhbmQtSsO4cmdl
bnNlbiB3cm90ZToKPj4+PiBbLi4uIHNuaXAgLi4uIF0KPj4+PiAKPj4+Pj4gK3N0YXRpYyBjb25z
dCBzdHJ1Y3QgaWVlZTgwMjExX29wcyBhdGgxMWtfb3BzID0gewo+Pj4+PiArCS50eAkJCQk9IGF0
aDExa19tYWNfb3BfdHgsCj4+Pj4gCj4+Pj4gTm8gd2FrZV90eF9xdWV1ZT8gOigKPj4+IAo+Pj4g
WWVzLCBwYWNrZXQgcXVldWVpbmcgaXMgaGFuZGxlZCBpbiBmaXJtd2FyZS4gVGhpcyBtYWtlcyBz
ZW5zZQo+Pj4gZXNwZWNpYWxseSB3aGVuIHdlIGVuYWJsZSA4MDIuMTEgZW5jYXAgb2ZmbG9hZCBz
dXBwb3J0IHdoZXJlIG1vc3Qgb2YKPj4+IHRoZSBkYXRhIHBhdGggcHJvY2Vzc2luZyBpbiBtYWM4
MDIxMSB3aWxsIGJlIHNraXBwZWQgYW5kIHBhY2tldCBpcwo+Pj4gZ2l2ZW4gdG8gZHJpdmVyL2Zp
cm13YXJlIGluIDgwMi4zIGZvcm1hdCBpdHNlbGYuIFRoZW4gZmlybXdhcmUgd291bGQKPj4+IHRh
a2UgY2FyZSBvZiBhbGwgdGhlIGNsYXNzaWZpY2F0aW9uLCBxdWV1ZWluZyBhbmQgZW5jYXBzdWxh
dGlvbgo+Pj4gb3BlcmF0aW9ucy4KPj4gCj4+IFdlbGwsIHNvIGRvZXMgYXRoMTBrLCBhbmQgeWV0
IHdlIHN0aWxsIHNhdyBhIHNpZ25pZmljYW50IGltcHJvdmVtZW50IGJ5Cj4+IG1vdmluZyBxdWV1
ZWluZyBiYWNrIGludG8gdGhlIGhvc3Qgd2hlcmUgaXQgY2FuIGJlIGhhbmRsZWQgYnkgdGhlCj4+
IEZRLUNvRGVsLWVuYWJsZWQgcXVldWVpbmcgc3RydWN0dXJlLgo+PiAKPgo+IFN1cmUsIHdlIGNv
dWxkIHByb2JhYmx5IHRyeSB0aGF0IHdpdGggYXRoMTFrIGFzIHdlbGwgYXQgc29tZSBwb2ludCB3
aGVuIAo+IHdlIGhhdmUgYSBiYXNlbGluZSB3aXRoIEhFIHN1cHBvcnQuCgpXZWxsLCByYXRoZXIg
dGhhbiByZXRyb2ZpdCBjaGFuZ2UgdGhpbmdzIGxhdGVyLCB3aHkgbm90IHN0YXJ0IG91dCB3aXRo
IGEKd2FrZV90eF9xdWV1ZS1iYXNlZCBkcml2ZXI/CgotVG9rZQoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYXRoMTFrIG1haWxpbmcgbGlzdAphdGgxMWtA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2F0aDExawo=
