Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i2Ywr-0003R9-0E
 for ath11k@lists.infradead.org; Tue, 27 Aug 2019 10:43:38 +0000
MIME-Version: 1.0
Date: Tue, 27 Aug 2019 16:13:35 +0530
From: Vasanthakumar Thiagarajan <vthiagar@codeaurora.org>
Subject: Re: [PATCH 31/49] ath11k: add mac.c
In-Reply-To: <875zmqsudn.fsf@toke.dk>
References: <1566316095-27507-1-git-send-email-kvalo@codeaurora.org>
 <1566316095-27507-32-git-send-email-kvalo@codeaurora.org>
 <8736hvu6e6.fsf@toke.dk> <ac6e7dbbd53e7ba9e82e49baca22b73c@codeaurora.org>
 <875zmqsudn.fsf@toke.dk>
Message-ID: <14737343f1925a771ddd8dadf0f2b5a3@codeaurora.org>
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
Errors-To: ath11k-bounces+kvalo=adurom.com@lists.infradead.org
To: =?UTF-8?Q?Toke_H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
Cc: linux-wireless-owner@vger.kernel.org, devicetree@vger.kernel.org, linux-wireless@vger.kernel.org, ath11k@lists.infradead.org, Kalle Valo <kvalo@codeaurora.org>

T24gMjAxOS0wOC0yMSAxNTozOCwgVG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2VuIHdyb3RlOgo+IFZh
c2FudGhha3VtYXIgVGhpYWdhcmFqYW4gPHZ0aGlhZ2FyQGNvZGVhdXJvcmEub3JnPiB3cml0ZXM6
Cj4gCj4+IE9uIDIwMTktMDgtMjAgMjI6MjEsIFRva2UgSMO4aWxhbmQtSsO4cmdlbnNlbiB3cm90
ZToKPj4+IFsuLi4gc25pcCAuLi4gXQo+Pj4gCj4+Pj4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgaWVl
ZTgwMjExX29wcyBhdGgxMWtfb3BzID0gewo+Pj4+ICsJLnR4CQkJCT0gYXRoMTFrX21hY19vcF90
eCwKPj4+IAo+Pj4gTm8gd2FrZV90eF9xdWV1ZT8gOigKPj4gCj4+IFllcywgcGFja2V0IHF1ZXVl
aW5nIGlzIGhhbmRsZWQgaW4gZmlybXdhcmUuIFRoaXMgbWFrZXMgc2Vuc2UKPj4gZXNwZWNpYWxs
eSB3aGVuIHdlIGVuYWJsZSA4MDIuMTEgZW5jYXAgb2ZmbG9hZCBzdXBwb3J0IHdoZXJlIG1vc3Qg
b2YKPj4gdGhlIGRhdGEgcGF0aCBwcm9jZXNzaW5nIGluIG1hYzgwMjExIHdpbGwgYmUgc2tpcHBl
ZCBhbmQgcGFja2V0IGlzCj4+IGdpdmVuIHRvIGRyaXZlci9maXJtd2FyZSBpbiA4MDIuMyBmb3Jt
YXQgaXRzZWxmLiBUaGVuIGZpcm13YXJlIHdvdWxkCj4+IHRha2UgY2FyZSBvZiBhbGwgdGhlIGNs
YXNzaWZpY2F0aW9uLCBxdWV1ZWluZyBhbmQgZW5jYXBzdWxhdGlvbgo+PiBvcGVyYXRpb25zLgo+
IAo+IFdlbGwsIHNvIGRvZXMgYXRoMTBrLCBhbmQgeWV0IHdlIHN0aWxsIHNhdyBhIHNpZ25pZmlj
YW50IGltcHJvdmVtZW50IGJ5Cj4gbW92aW5nIHF1ZXVlaW5nIGJhY2sgaW50byB0aGUgaG9zdCB3
aGVyZSBpdCBjYW4gYmUgaGFuZGxlZCBieSB0aGUKPiBGUS1Db0RlbC1lbmFibGVkIHF1ZXVlaW5n
IHN0cnVjdHVyZS4KPiAKClN1cmUsIHdlIGNvdWxkIHByb2JhYmx5IHRyeSB0aGF0IHdpdGggYXRo
MTFrIGFzIHdlbGwgYXQgc29tZSBwb2ludCB3aGVuIAp3ZSBoYXZlIGEgYmFzZWxpbmUgd2l0aCBI
RSBzdXBwb3J0LgoKVmFzYW50aAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KYXRoMTFrIG1haWxpbmcgbGlzdAphdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2F0aDExawo=
