Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from z5.mailgun.us ([104.130.96.5])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kUQEx-0000X8-Fb
 for ath11k@lists.infradead.org; Mon, 19 Oct 2020 08:10:01 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: pci_alloc_irq_vectors fails ENOSPC for XPS 13 9310
References: <2849fd39-a7a6-8366-7c78-fc9fec4dffa4@posteo.de>
Date: Mon, 19 Oct 2020 11:09:45 +0300
In-Reply-To: <2849fd39-a7a6-8366-7c78-fc9fec4dffa4@posteo.de> (Thomas Krause's
 message of "Sat, 17 Oct 2020 13:01:46 +0200")
Message-ID: <87tuuqhc1i.fsf@codeaurora.org>
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
To: Thomas Krause <thomaskrause@posteo.de>
Cc: ath11k@lists.infradead.org

VGhvbWFzIEtyYXVzZSA8dGhvbWFza3JhdXNlQHBvc3Rlby5kZT4gd3JpdGVzOgoKPiBzb21lIHZh
cmlhbnRzIG9mIERlbGwgWFBTIDEzIDkzMTAgbW9kZWwgaGF2ZSBhIFFDQTYzOTAgZGV2aWNlIAoK
RG8geW91IGhhcHBlbiB0byBrbm93IHdoaWNoIG1vZGVscyBleGFjbHkgaGF2ZSBpdD8gSSdtIHRy
eWluZyB0byBmaW5kIGEKcmVhc29uYWJseSBwcmljZWQgbGFwdG9wIHdpdGggUUNBNjM5MCBmcm9t
IEZpbmxhbmQgb3IgRVUsIG5vIGx1Y2sgeWV0LgpBcHBhcmVudGx5IHRoZXJlIHdhcyBhIGNlcnRh
aW4gRGVsbCBYUFMgMTUgOTUwMCBtb2RlbCBidXQgaXQgd2FzIGFsbW9zdAo0ayBFVVIuCgo+IGFu
ZCBJIHdhcyB0cnlpbmcgdG8gbWFrZSBpdCB3b3JrIHVzaW5nIHRoZcKgIGF0aC5naXQgbWFzdGVy
IGJyYW5jaCAodGFnCj4gYXRoLTIwMjAxMDAxMTkzNCkuCj4KPiBVbmZvcnR1bmF0bHksIEkgZ2V0
IHRoZSBmb2xsb3dpbmcgZXJyb3IgbWVzc2FnZXMgd2hlbiBsb2FkaW5nIHRoZSBtb2R1bGU6Cj4K
Pj4gW8KgIDY3Mi4yNzc3MjZdIGF0aDExa19wY2kgMDAwMDo1NjowMC4wOiBXQVJOSU5HOiBhdGgx
MWsgUENJIHN1cHBvcnQKPj4gaXMgZXhwZXJpbWVudGFsIQo+PiBbwqAgNjcyLjI3NzkyNV0gYXRo
MTFrX3BjaSAwMDAwOjU2OjAwLjA6IEJBUiAwOiBhc3NpZ25lZCBbbWVtCj4+IDB4OGMzMDAwMDAt
MHg4YzNmZmZmZiA2NGJpdF0KPj4gW8KgIDY3Mi4yNzgwMjBdIGF0aDExa19wY2kgMDAwMDo1Njow
MC4wOiBmYWlsZWQgdG8gZ2V0IDMyIE1TSQo+PiB2ZWN0b3JzLCBvbmx5IC0yOCBhdmFpbGFibGUK
Pj4gW8KgIDY3Mi4yNzgwMjRdIGF0aDExa19wY2kgMDAwMDo1NjowMC4wOiBmYWlsZWQgdG8gZW5h
YmxlIG1zaTogLTI4Cj4+IFvCoCA2NzIuMjc4MTQ0XSBhdGgxMWtfcGNpOiBwcm9iZSBvZiAwMDAw
OjU2OjAwLjAgZmFpbGVkIHdpdGggZXJyb3IgLTI4Cj4KPiAtMjggc2VlbXMgdG8gcmVmZXJlbmNl
IEVOT1NQQywgd2hpY2ggc2VlbXMgdG8gYmUgcmVsYXRlZCB0byB0aGUKPiBtaW5pbXVtIG51bWJl
ciBvZiB2ZWN0b3JzIG5vdCBiZWVpbmcgYXZhaWxhYmxlLgoKSSBoYWQgdGhlIHNhbWUgcHJvYmxl
bSBhcyB3ZWxsIGJhY2sgaW4gdGhlIGRheXMsIGZvciBtZSBlbmFibGluZwpDT05GSUdfSVJRX1JF
TUFQIGhlbHBlZC4gSWYgaXQgaGVscHMgZm9yIHlvdSBhbHNvIEkgd29uZGVyIGlmIHdlIHNob3Vs
ZAptZW50aW9uIHRoYXQgaW4gdGhlIGF0aDExayB3YXJuaW5nIGFib3ZlIDopCgotLSAKaHR0cHM6
Ly93aXJlbGVzcy53aWtpLmtlcm5lbC5vcmcvZW4vZGV2ZWxvcGVycy9kb2N1bWVudGF0aW9uL3N1
Ym1pdHRpbmdwYXRjaGVzCgotLSAKYXRoMTFrIG1haWxpbmcgbGlzdAphdGgxMWtAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2F0
aDExawo=
