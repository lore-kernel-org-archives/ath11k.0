Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from nbd.name ([2a01:4f8:221:3d45::2])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hdTp5-0002TO-W5
 for ath11k@lists.infradead.org; Wed, 19 Jun 2019 06:11:57 +0000
Subject: Re: [PATCH] ath11k: fix mac_cap_info copy size
References: <20190619053208.17243-1-john@phrozen.org>
From: John Crispin <john@phrozen.org>
Message-ID: <38f69549-9070-8dc8-f7d8-36e613d11ae6@phrozen.org>
Date: Wed, 19 Jun 2019 08:11:57 +0200
MIME-Version: 1.0
In-Reply-To: <20190619053208.17243-1-john@phrozen.org>
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
To: Kalle Valo <kvalo@codeaurora.org>
Cc: ath11k@lists.infradead.org

Ck9uIDE5LzA2LzIwMTkgMDc6MzIsIEpvaG4gQ3Jpc3BpbiB3cm90ZToKPiBUaGUgY29kZSBjdXJy
ZW50bHkgY29waWVzIHRoZSBoZV9jYXAgZmllbGQgd2hlbiBhZGRpbmcgYSBwZWVyIGZyb20gYSBz
aXgKPiBieXRlIHRvIGFuIGVpZ2h0IGJ5dGUgYnVmZmVyLiBTd2l0Y2ggZnJvbSB1c2luZyB0aGUg
ZGVzdCBidWZmZXIgbGVuZ3RoIHRvCj4gdGhhdCBvZiB0aGUgc3JjIGJ1ZmZlci4gQWxzbyBtYWtl
IHN1cmUgdGhhdCB0aGUgdHJhaWxpbmcgMiBieXRlcyBhcmUKPiB6ZXJvJ2VkIG91dC4KPgo+IFNp
Z25lZC1vZmYtYnk6IEpvaG4gQ3Jpc3BpbiA8am9obkBwaHJvemVuLm9yZz4KPiAtLS0KPiAgIGRy
aXZlcnMvbmV0L3dpcmVsZXNzL2F0aC9hdGgxMWsvbWFjLmMgfCAzICsrLQo+ICAgMSBmaWxlIGNo
YW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+Cj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvbmV0L3dpcmVsZXNzL2F0aC9hdGgxMWsvbWFjLmMgYi9kcml2ZXJzL25ldC93aXJlbGVz
cy9hdGgvYXRoMTFrL21hYy5jCj4gaW5kZXggNTMxNzdhOWUzYzdlLi43MjM5MDEzYjU5Y2EgMTAw
NjQ0Cj4gLS0tIGEvZHJpdmVycy9uZXQvd2lyZWxlc3MvYXRoL2F0aDExay9tYWMuYwo+ICsrKyBi
L2RyaXZlcnMvbmV0L3dpcmVsZXNzL2F0aC9hdGgxMWsvbWFjLmMKPiBAQCAtMTI2Miw4ICsxMjYy
LDkgQEAgc3RhdGljIHZvaWQgYXRoMTFrX3BlZXJfYXNzb2NfaF9oZShzdHJ1Y3QgYXRoMTFrICph
ciwKPiAgIAo+ICAgCWFyZy0+aGVfZmxhZyA9IHRydWU7Cj4gICAKPiArCW1lbXNldCgmYXJnLT5w
ZWVyX2hlX2NhcF9tYWNpbmZvLCAwLCBzaXplb2YoJmFyZy0+cGVlcl9oZV9jYXBfbWFjaW5mbykp
OwoKc3RyYXkgJiAuLi4gZm9yZ290IHRvIGNvbW1pdCAtLWFtZW5kIHByaW9yIHRvIHNlbmRpbmcg
dGhpcwoKIMKgwqDCoCBKb2huCgo+ICAgCW1lbWNweSgmYXJnLT5wZWVyX2hlX2NhcF9tYWNpbmZv
LCBoZV9jYXAtPmhlX2NhcF9lbGVtLm1hY19jYXBfaW5mbywKPiAtCSAgICAgICBzaXplb2YoYXJn
LT5wZWVyX2hlX2NhcF9tYWNpbmZvKSk7Cj4gKwkgICAgICAgc2l6ZW9mKGhlX2NhcC0+aGVfY2Fw
X2VsZW0ubWFjX2NhcF9pbmZvKSk7Cj4gICAJbWVtY3B5KCZhcmctPnBlZXJfaGVfY2FwX3BoeWlu
Zm8sIGhlX2NhcC0+aGVfY2FwX2VsZW0ucGh5X2NhcF9pbmZvLAo+ICAgCSAgICAgICBzaXplb2Yo
YXJnLT5wZWVyX2hlX2NhcF9waHlpbmZvKSk7Cj4gICAJbWVtY3B5KCZhcmctPnBlZXJfaGVfb3Bz
LCAmdmlmLT5ic3NfY29uZi5oZV9vcGVyYXRpb24sCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwphdGgxMWsgbWFpbGluZyBsaXN0CmF0aDExa0BsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
YXRoMTFrCg==
