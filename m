Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173]
 helo=mail3.candelatech.com)
 by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
 id 1i2gue-0000ZQ-U9
 for ath11k@lists.infradead.org; Tue, 27 Aug 2019 19:13:54 +0000
Subject: Re: [PATCH 31/49] ath11k: add mac.c
References: <1566316095-27507-1-git-send-email-kvalo@codeaurora.org>
 <1566316095-27507-32-git-send-email-kvalo@codeaurora.org>
 <8736hvu6e6.fsf@toke.dk> <ac6e7dbbd53e7ba9e82e49baca22b73c@codeaurora.org>
 <875zmqsudn.fsf@toke.dk> <14737343f1925a771ddd8dadf0f2b5a3@codeaurora.org>
 <87sgpmikne.fsf@toke.dk>
From: Ben Greear <greearb@candelatech.com>
Message-ID: <0aa03fd8-1fad-416b-0cd5-fcca79732987@candelatech.com>
Date: Tue, 27 Aug 2019 12:13:51 -0700
MIME-Version: 1.0
In-Reply-To: <87sgpmikne.fsf@toke.dk>
Content-Language: en-US
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
To: =?UTF-8?Q?Toke_H=c3=b8iland-J=c3=b8rgensen?= <toke@redhat.com>, Vasanthakumar Thiagarajan <vthiagar@codeaurora.org>
Cc: linux-wireless-owner@vger.kernel.org, devicetree@vger.kernel.org, linux-wireless@vger.kernel.org, ath11k@lists.infradead.org, Kalle Valo <kvalo@codeaurora.org>

T24gOC8yNy8xOSAxMDoyNyBBTSwgVG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2VuIHdyb3RlOgo+IFZh
c2FudGhha3VtYXIgVGhpYWdhcmFqYW4gPHZ0aGlhZ2FyQGNvZGVhdXJvcmEub3JnPiB3cml0ZXM6
Cj4gCj4+IE9uIDIwMTktMDgtMjEgMTU6MzgsIFRva2UgSMO4aWxhbmQtSsO4cmdlbnNlbiB3cm90
ZToKPj4+IFZhc2FudGhha3VtYXIgVGhpYWdhcmFqYW4gPHZ0aGlhZ2FyQGNvZGVhdXJvcmEub3Jn
PiB3cml0ZXM6Cj4+Pgo+Pj4+IE9uIDIwMTktMDgtMjAgMjI6MjEsIFRva2UgSMO4aWxhbmQtSsO4
cmdlbnNlbiB3cm90ZToKPj4+Pj4gWy4uLiBzbmlwIC4uLiBdCj4+Pj4+Cj4+Pj4+PiArc3RhdGlj
IGNvbnN0IHN0cnVjdCBpZWVlODAyMTFfb3BzIGF0aDExa19vcHMgPSB7Cj4+Pj4+PiArCS50eAkJ
CQk9IGF0aDExa19tYWNfb3BfdHgsCj4+Pj4+Cj4+Pj4+IE5vIHdha2VfdHhfcXVldWU/IDooCj4+
Pj4KPj4+PiBZZXMsIHBhY2tldCBxdWV1ZWluZyBpcyBoYW5kbGVkIGluIGZpcm13YXJlLiBUaGlz
IG1ha2VzIHNlbnNlCj4+Pj4gZXNwZWNpYWxseSB3aGVuIHdlIGVuYWJsZSA4MDIuMTEgZW5jYXAg
b2ZmbG9hZCBzdXBwb3J0IHdoZXJlIG1vc3Qgb2YKPj4+PiB0aGUgZGF0YSBwYXRoIHByb2Nlc3Np
bmcgaW4gbWFjODAyMTEgd2lsbCBiZSBza2lwcGVkIGFuZCBwYWNrZXQgaXMKPj4+PiBnaXZlbiB0
byBkcml2ZXIvZmlybXdhcmUgaW4gODAyLjMgZm9ybWF0IGl0c2VsZi4gVGhlbiBmaXJtd2FyZSB3
b3VsZAo+Pj4+IHRha2UgY2FyZSBvZiBhbGwgdGhlIGNsYXNzaWZpY2F0aW9uLCBxdWV1ZWluZyBh
bmQgZW5jYXBzdWxhdGlvbgo+Pj4+IG9wZXJhdGlvbnMuCj4+Pgo+Pj4gV2VsbCwgc28gZG9lcyBh
dGgxMGssIGFuZCB5ZXQgd2Ugc3RpbGwgc2F3IGEgc2lnbmlmaWNhbnQgaW1wcm92ZW1lbnQgYnkK
Pj4+IG1vdmluZyBxdWV1ZWluZyBiYWNrIGludG8gdGhlIGhvc3Qgd2hlcmUgaXQgY2FuIGJlIGhh
bmRsZWQgYnkgdGhlCj4+PiBGUS1Db0RlbC1lbmFibGVkIHF1ZXVlaW5nIHN0cnVjdHVyZS4KPj4+
Cj4+Cj4+IFN1cmUsIHdlIGNvdWxkIHByb2JhYmx5IHRyeSB0aGF0IHdpdGggYXRoMTFrIGFzIHdl
bGwgYXQgc29tZSBwb2ludCB3aGVuCj4+IHdlIGhhdmUgYSBiYXNlbGluZSB3aXRoIEhFIHN1cHBv
cnQuCj4gCj4gV2VsbCwgcmF0aGVyIHRoYW4gcmV0cm9maXQgY2hhbmdlIHRoaW5ncyBsYXRlciwg
d2h5IG5vdCBzdGFydCBvdXQgd2l0aCBhCj4gd2FrZV90eF9xdWV1ZS1iYXNlZCBkcml2ZXI/CgpJ
ZiB0aGVyZSBpcyBzb21ldGhpbmcgdGhhdCB3b3JrcyBhdCBhbGwsIGxldHMgZ2V0IGl0IHVwc3Ry
ZWFtIHdoZW4gaXQgaXMKZWFzaWVyIHRvIGRldmVsb3AgYW5kIHRlc3QgYWdhaW5zdC4gIFRoZW4g
d2Ugd2lsbCBoYXZlIGEgYmFzZWxpbmUgdG8gdGVzdCBhZ2FpbnN0CndoZW4gYWRkaW5nIG5ldyBm
ZWF0dXJlcyBhbmQgc28gZm9ydGguCgpUaGFua3MsCkJlbgoKLS0gCkJlbiBHcmVlYXIgPGdyZWVh
cmJAY2FuZGVsYXRlY2guY29tPgpDYW5kZWxhIFRlY2hub2xvZ2llcyBJbmMgIGh0dHA6Ly93d3cu
Y2FuZGVsYXRlY2guY29tCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KYXRoMTFrIG1haWxpbmcgbGlzdAphdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2F0aDExawo=
