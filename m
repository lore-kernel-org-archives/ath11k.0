Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from nbd.name ([2a01:4f8:221:3d45::2])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hcsao-0000gu-Ht
 for ath11k@lists.infradead.org; Mon, 17 Jun 2019 14:26:44 +0000
Subject: Re: [PATCH] ath11k: fix extended stats update issue
References: <1560778040-12386-1-git-send-email-periyasa@codeaurora.org>
From: John Crispin <john@phrozen.org>
Message-ID: <9bc5acf3-9ae2-2c86-abdd-73629eb2d0ae@phrozen.org>
Date: Mon, 17 Jun 2019 16:26:40 +0200
MIME-Version: 1.0
In-Reply-To: <1560778040-12386-1-git-send-email-periyasa@codeaurora.org>
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
To: Karthikeyan Periyasamy <periyasa@codeaurora.org>, ath11k@lists.infradead.org

Ck9uIDE3LzA2LzIwMTkgMTU6MjcsIEthcnRoaWtleWFuIFBlcml5YXNhbXkgd3JvdGU6Cj4gdXNl
ciBub3QgYWJsZSB0byBzZWUgdGhlIHZhbGlkIHR4IHN0YXRzLiBodHQgc3RhdHMgdXBkYXRlCj4g
cHJvY2VzcyBnZXQgZmFpbGVkIGR1ZSB0byB0aGUgd3JvbmcgYXJndW1lbnQgcGFzcyB0bwo+IGF0
aDExa19nZXRfYXJfYnlfcGRldl9pZCBBUEkuIEV4cGVjdGVkIGFyZ3VtZW50IGlzIHBkZXZfaWQg
bm90Cj4gdGhlIHBkZXYgaW5kZXguIHNvIGF2b2lkIHRoZSBjb252ZXJzaW9uIGxvZ2ljIG9mIHBk
ZXYgaWQgdG8gcGRldgo+IGluZGV4IGluIGh0dCBzdGF0cyB1cGRhdGUgcHJvY2Vzcy4KPgo+IFNp
Z25lZC1vZmYtYnk6IEthcnRoaWtleWFuIFBlcml5YXNhbXkgPHBlcml5YXNhQGNvZGVhdXJvcmEu
b3JnPgoKSGksCgp0aGFua3MsIGkganVzdCByYW4gaW50byB0aGlzIHByb2JsZW0gYW4gaG91ciBh
Z28gOi0pCgogwqDCoMKgIEpvaG4KCj4gLS0tCj4gICBkcml2ZXJzL25ldC93aXJlbGVzcy9hdGgv
YXRoMTFrL2RwX3J4LmMgfCAxIC0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGRlbGV0aW9uKC0pCj4K
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9uZXQvd2lyZWxlc3MvYXRoL2F0aDExay9kcF9yeC5jIGIv
ZHJpdmVycy9uZXQvd2lyZWxlc3MvYXRoL2F0aDExay9kcF9yeC5jCj4gaW5kZXggMWQ5ODkyZS4u
OTcxYzQzNyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL25ldC93aXJlbGVzcy9hdGgvYXRoMTFrL2Rw
X3J4LmMKPiArKysgYi9kcml2ZXJzL25ldC93aXJlbGVzcy9hdGgvYXRoMTFrL2RwX3J4LmMKPiBA
QCAtMTI5NCw3ICsxMjk0LDYgQEAgc3RhdGljIGludCBhdGgxMWtfaHR0X3B1bGxfcHBkdV9zdGF0
cyhzdHJ1Y3QgYXRoMTFrX2Jhc2UgKmFiLAo+ICAgCj4gICAJbGVuID0gRklFTERfR0VUKEhUVF9U
MkhfUFBEVV9TVEFUU19QQVlMT0FEX1NJWkVfTSwgKih1MzIgKilkYXRhKTsKPiAgIAlwZGV2X2lk
ID0gRklFTERfR0VUKEhUVF9UMkhfUFBEVV9TVEFUU19QREVWX0lEX00sICoodTMyICopZGF0YSk7
Cj4gLQlwZGV2X2lkID0gRFBfSFcyU1dfTUFDSUQocGRldl9pZCk7Cj4gICAJcHBkdV9pZCA9ICoo
KHUzMiAqKWRhdGEgKyAxKTsKPiAgIAo+ICAgCXJjdV9yZWFkX2xvY2soKTsKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmF0aDExayBtYWlsaW5nIGxpc3QK
YXRoMTFrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9hdGgxMWsK
