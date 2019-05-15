Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from nbd.name ([2a01:4f8:221:3d45::2])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hQqNi-0007dc-IB
 for ath11k@lists.infradead.org; Wed, 15 May 2019 09:39:28 +0000
Subject: Re: [PATCH V4 1/5] ath11k: move phymode selection from function to
 array lookup
References: <20190509201550.3977-1-john@phrozen.org>
 <20190509201550.3977-2-john@phrozen.org>
 <87tvdyig5t.fsf@kamboji.qca.qualcomm.com>
From: John Crispin <john@phrozen.org>
Message-ID: <4f655243-44f2-1094-6a0f-e1916392f2ae@phrozen.org>
Date: Wed, 15 May 2019 11:39:22 +0200
MIME-Version: 1.0
In-Reply-To: <87tvdyig5t.fsf@kamboji.qca.qualcomm.com>
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
Cc: ath11k@lists.infradead.org, Shashidhar Lakkavalli <slakkavalli@datto.com>

Ck9uIDEzLzA1LzIwMTkgMTY6MjYsIEthbGxlIFZhbG8gd3JvdGU6Cj4+IEBAIC0zODg5LDcgKzM4
NzIsMTIgQEAgYXRoMTFrX21hY192ZGV2X3N0YXJ0X3Jlc3RhcnQoc3RydWN0IGF0aDExa192aWYg
KmFydmlmLAo+PiAgIAlhcmcuY2hhbm5lbC5mcmVxID0gY2hhbmRlZi0+Y2hhbi0+Y2VudGVyX2Zy
ZXE7Cj4+ICAgCWFyZy5jaGFubmVsLmJhbmRfY2VudGVyX2ZyZXExID0gY2hhbmRlZi0+Y2VudGVy
X2ZyZXExOwo+PiAgIAlhcmcuY2hhbm5lbC5iYW5kX2NlbnRlcl9mcmVxMiA9IGNoYW5kZWYtPmNl
bnRlcl9mcmVxMjsKPj4gLQlhcmcuY2hhbm5lbC5tb2RlID0gY2hhbl90b19waHltb2RlKGNoYW5k
ZWYpOwo+PiArCWFyZy5jaGFubmVsLm1vZGUgPQo+PiArCQlhdGgxMWtfcGh5bW9kZXNbY2hhbmRl
Zi0+Y2hhbi0+YmFuZF1baGVfc3VwcG9ydF1bY2hhbmRlZi0+d2lkdGhdOwo+PiArCWlmIChhcmcu
Y2hhbm5lbC5tb2RlID09IE1PREVfMTFHICYmCj4+ICsJICAgIGNoYW5kZWYtPmNoYW4tPmZsYWdz
ICYgSUVFRTgwMjExX0NIQU5fTk9fT0ZETSkKPj4gKwkJYXJnLmNoYW5uZWwubW9kZSA9IE1PREVf
MTFCOwo+PiArCVdBUk5fT04oYXJnLmNoYW5uZWwubW9kZSA9PSBNT0RFX1VOS05PV04pOwo+IFdo
YXQgaGFwcGVucyB3aGVuIG1vZGUgaXMgTU9ERV9VTktOT1dOPyBTaG91bGQgd2UgYXNzaWduIHNv
bWUgZGVmYXVsdAo+IHZhbHVlIGFmdGVyIHRoZSB3YXJuaW5nIG1lc3NhZ2U/Cgp0aGUgZHJpdmVy
IHVzZXMgdGhhdCBlbnVtIHZhbHVlIGF0IHZhcmlvdXMgcGxhY2VzIGFuZCBpdCBzZWVtcyB0byBi
ZSBhIAp2YWxpZCB3bWkgSUQgc28gaSBndWVzcyBpdHMgYmV0dGVyIHRvIGxldCBpdCBibG93IHVw
IHVwb24gYSBiYWQgCmNvbmZpZ3VyYXRpb24gdGhhbiBzaWxlbnRseSBmYWxsaW5nIGJhY2sgdG8g
YSBwb3NzaWJseSB1bmV4cGVjdGVkIGJlaGF2aW91cgoKIMKgwqDCoCBKb2huCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYXRoMTFrIG1haWxpbmcgbGlz
dAphdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2F0aDExawo=
