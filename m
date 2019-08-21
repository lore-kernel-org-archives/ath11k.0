Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mx1.redhat.com ([209.132.183.28])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i0NXz-0006su-Qj
 for ath11k@lists.infradead.org; Wed, 21 Aug 2019 10:08:57 +0000
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 6A8CD2F3675
 for <ath11k@lists.infradead.org>; Wed, 21 Aug 2019 10:08:55 +0000 (UTC)
Received: by mail-ed1-f72.google.com with SMTP id m30so1097711eda.11
 for <ath11k@lists.infradead.org>; Wed, 21 Aug 2019 03:08:55 -0700 (PDT)
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
Subject: Re: [PATCH 31/49] ath11k: add mac.c
In-Reply-To: <ac6e7dbbd53e7ba9e82e49baca22b73c@codeaurora.org>
References: <1566316095-27507-1-git-send-email-kvalo@codeaurora.org>
 <1566316095-27507-32-git-send-email-kvalo@codeaurora.org>
 <8736hvu6e6.fsf@toke.dk> <ac6e7dbbd53e7ba9e82e49baca22b73c@codeaurora.org>
Date: Wed, 21 Aug 2019 12:08:52 +0200
Message-ID: <875zmqsudn.fsf@toke.dk>
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
czoKCj4gT24gMjAxOS0wOC0yMCAyMjoyMSwgVG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2VuIHdyb3Rl
Ogo+PiBbLi4uIHNuaXAgLi4uIF0KPj4gCj4+PiArc3RhdGljIGNvbnN0IHN0cnVjdCBpZWVlODAy
MTFfb3BzIGF0aDExa19vcHMgPSB7Cj4+PiArCS50eAkJCQk9IGF0aDExa19tYWNfb3BfdHgsCj4+
IAo+PiBObyB3YWtlX3R4X3F1ZXVlPyA6KAo+Cj4gWWVzLCBwYWNrZXQgcXVldWVpbmcgaXMgaGFu
ZGxlZCBpbiBmaXJtd2FyZS4gVGhpcyBtYWtlcyBzZW5zZQo+IGVzcGVjaWFsbHkgd2hlbiB3ZSBl
bmFibGUgODAyLjExIGVuY2FwIG9mZmxvYWQgc3VwcG9ydCB3aGVyZSBtb3N0IG9mCj4gdGhlIGRh
dGEgcGF0aCBwcm9jZXNzaW5nIGluIG1hYzgwMjExIHdpbGwgYmUgc2tpcHBlZCBhbmQgcGFja2V0
IGlzCj4gZ2l2ZW4gdG8gZHJpdmVyL2Zpcm13YXJlIGluIDgwMi4zIGZvcm1hdCBpdHNlbGYuIFRo
ZW4gZmlybXdhcmUgd291bGQKPiB0YWtlIGNhcmUgb2YgYWxsIHRoZSBjbGFzc2lmaWNhdGlvbiwg
cXVldWVpbmcgYW5kIGVuY2Fwc3VsYXRpb24KPiBvcGVyYXRpb25zLgoKV2VsbCwgc28gZG9lcyBh
dGgxMGssIGFuZCB5ZXQgd2Ugc3RpbGwgc2F3IGEgc2lnbmlmaWNhbnQgaW1wcm92ZW1lbnQgYnkK
bW92aW5nIHF1ZXVlaW5nIGJhY2sgaW50byB0aGUgaG9zdCB3aGVyZSBpdCBjYW4gYmUgaGFuZGxl
ZCBieSB0aGUKRlEtQ29EZWwtZW5hYmxlZCBxdWV1ZWluZyBzdHJ1Y3R1cmUuCgpTbywgKmhvdyog
ZG9lcyB0aGUgZmlybXdhcmUgaGFuZGxlIHRoZSBxdWV1ZWluZz8gRG9lcyBpdCBoYXZlCnBlci1z
dGF0aW9ucyBxdWV1ZXM/IFBlci1mbG93IHF1ZXVlcz8gV2hhdCdzIHRoZSBsYXRlbmN5IHVuZGVy
IGxvYWQKZmlndXJlcyBmb3IgdGhlIGZpcm13YXJlIHF1ZXVlcz8KCi1Ub2tlCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphdGgxMWsgbWFpbGluZyBsaXN0
CmF0aDExa0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vYXRoMTFrCg==
