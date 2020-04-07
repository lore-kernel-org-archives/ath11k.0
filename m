Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from szxga07-in.huawei.com ([45.249.212.35] helo=huawei.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jLdZ1-0004Jw-Oz
 for ath11k@lists.infradead.org; Tue, 07 Apr 2020 02:02:10 +0000
Subject: Re: [PATCH] ath11k: thermal: Fix build error without CONFIG_THERMAL
References: <20200403083414.31392-1-yuehaibing@huawei.com>
 <87mu7ozs1c.fsf@kamboji.qca.qualcomm.com>
From: Yuehaibing <yuehaibing@huawei.com>
Message-ID: <2c636eaf-7672-353c-80b2-1649b3a94e60@huawei.com>
Date: Tue, 7 Apr 2020 10:01:47 +0800
MIME-Version: 1.0
In-Reply-To: <87mu7ozs1c.fsf@kamboji.qca.qualcomm.com>
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
To: Kalle Valo <kvalo@codeaurora.org>
Cc: pradeepc@codeaurora.org, netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath11k@lists.infradead.org, davem@davemloft.net

T24gMjAyMC80LzYgMjE6MDIsIEthbGxlIFZhbG8gd3JvdGU6Cj4gWXVlSGFpYmluZyA8eXVlaGFp
YmluZ0BodWF3ZWkuY29tPiB3cml0ZXM6Cj4gCj4+IGRyaXZlcnMvbmV0L3dpcmVsZXNzL2F0aC9h
dGgxMWsvdGhlcm1hbC5oOjQ1OjE6Cj4+ICB3YXJuaW5nOiBubyByZXR1cm4gc3RhdGVtZW50IGlu
IGZ1bmN0aW9uIHJldHVybmluZyBub24tdm9pZCBbLVdyZXR1cm4tdHlwZV0KPj4gZHJpdmVycy9u
ZXQvd2lyZWxlc3MvYXRoL2F0aDExay9jb3JlLmM6NDE2OjI4OiBlcnJvcjoKPj4gIHBhc3Npbmcg
YXJndW1lbnQgMSBvZiDigJhhdGgxMWtfdGhlcm1hbF91bnJlZ2lzdGVy4oCZIGZyb20gaW5jb21w
YXRpYmxlIHBvaW50ZXIgdHlwZSBbLVdlcnJvcj1pbmNvbXBhdGlibGUtcG9pbnRlci10eXBlc10K
Pj4KPj4gQWRkIG1pc3NpbmcgcmV0dXJuIDAgaW4gYXRoMTFrX3RoZXJtYWxfc2V0X3Rocm90dGxp
bmcsCj4+IGFuZCBmaXggYXRoMTFrX3RoZXJtYWxfdW5yZWdpc3RlciBwYXJhbSB0eXBlLgo+IAo+
IFRoZXNlIGFyZSB3YXJuaW5ncywgbm8/ICJidWlsZCBlcnJvciIgYW5kICJjb21waWxlciB3YXJu
aW5nIiBhcmUKPiBkaWZmZXJlbnQgdGhpbmdzLCB0aGUgZm9ybWVyIGJyZWFrcyB0aGUgd2hvbGUg
YnVpbGQgd2hpY2ggaXMgc3VwZXIKPiBjcml0aWNhbCwgYnV0IEknbGwgcXVldWUgdGhpcyB0byB2
NS43IG5ldmVydGhlbGVzcy4gQW5kIEknbGwgY2hhbmdlIHRoZQo+IHRpdGxlIHRvOgo+IAo+IGF0
aDExazogZml4IGNvbXBpbGVyIHdhcm5pbmcgd2l0aG91dCBDT05GSUdfVEhFUk1BTAoKT2sgLCB0
aGFua3MhCgo+IAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmF0aDExayBtYWlsaW5nIGxpc3QKYXRoMTFrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9hdGgxMWsK
