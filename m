Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from nbd.name ([2a01:4f8:221:3d45::2])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kQbnq-0006tX-IK
 for ath11k@lists.infradead.org; Thu, 08 Oct 2020 19:42:15 +0000
Subject: Re: [PATCH V3 2/9] mac80211: add multiple bssid support to interface
 handling
References: <20200812150050.2683396-1-john@phrozen.org>
 <20200812150050.2683396-3-john@phrozen.org>
 <6e914f17bc1fcd57bfb1a0d9f68fe4ad@codeaurora.org>
 <cc1fd0b5-d12f-0cdc-f918-b8f761b18c88@phrozen.org>
 <54033ab6e1bcf7ecda314c3ec81f1736@codeaurora.org>
From: John Crispin <john@phrozen.org>
Message-ID: <95f54d65-cd6d-7cb1-65c6-53a969dd8601@phrozen.org>
Date: Thu, 8 Oct 2020 21:42:11 +0200
MIME-Version: 1.0
In-Reply-To: <54033ab6e1bcf7ecda314c3ec81f1736@codeaurora.org>
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
To: Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>
Cc: linux-wireless-owner@vger.kernel.org, Johannes Berg <johannes@sipsolutions.net>, linux-wireless@vger.kernel.org, ath11k@lists.infradead.org

Ck9uIDA4LjEwLjIwIDE5OjIxLCBQcmFkZWVwIEt1bWFyIENoaXRyYXB1IHdyb3RlOgo+IE9uIDIw
MjAtMTAtMDggMDE6MDYsIEpvaG4gQ3Jpc3BpbiB3cm90ZToKPj4gT24gMDguMTAuMjAgMDI6MzMs
IFByYWRlZXAgS3VtYXIgQ2hpdHJhcHUgd3JvdGU6Cj4+Pj4KPj4+PiDCoHN0YXRpYyBpbnQgaWVl
ZTgwMjExX2RlbF9pZmFjZShzdHJ1Y3Qgd2lwaHkgKndpcGh5LCBzdHJ1Y3QgCj4+Pj4gd2lyZWxl
c3NfZGV2ICp3ZGV2KQo+Pj4+IMKgewo+Pj4+ICvCoMKgwqAgc3RydWN0IGllZWU4MDIxMV9zdWJf
aWZfZGF0YSAqc2RhdGE7Cj4+Pj4gK8KgwqDCoCBzdHJ1Y3QgaWVlZTgwMjExX3ZpZiAqY2hpbGQs
ICp0bXA7Cj4+Pj4gKwo+Pj4+ICvCoMKgwqAgc2RhdGEgPSBJRUVFODAyMTFfV0RFVl9UT19TVUJf
SUYod2Rldik7Cj4+Pj4gK8KgwqDCoCBpZiAoc2RhdGEtPnZpZi50eXBlID09IE5MODAyMTFfSUZU
WVBFX0FQKSB7Cj4+PiBIaSBKb2huLCBPYnNlcnZlZCBhIE5VTEwgcHRyIGRlcmVmZXJlbmNlIGVy
cm9yIGhlcmUuLgo+Pj4KPj4+IFRoYW5rcwo+Pj4gUHJhZGVlcAo+Pgo+Pgo+PiBob3cgZGlkIHlv
dSB0cmlnZ2VyIGl0ID8KPj4KPj4gwqDCoMKgIEpvaG4KPiBIaQo+Cj4gRGVsZXRlZCB0aGUgaW50
ZXJmYWNlIGFuZCBkaWQgcm1tb2QgYW5kIGluc21vZCBvZiAKPiBjZmc4MDIxMS9tYWM4MDIxMS9h
dGggbW9kdWxlcy4KPgo+IFvCoCA4ODMuNTY1OTMzXSBVbmFibGUgdG8gaGFuZGxlIGtlcm5lbCBO
VUxMIHBvaW50ZXIgZGVyZWZlcmVuY2UgYXQgCj4gdmlydHVhbCBhZGRyZXNzIDAwMDAwMDAwCj4g
W8KgIDg4My41NjU5NzBdIHBnZCA9IGIzMTFjMDAwCj4gW8KgIDg4My41NzMzNTddIFswMDAwMDAw
MF0gKnBnZD0wMDAwMDAwMAo+IFvCoCA4ODMuNTc5MDIxXSBJbnRlcm5hbCBlcnJvcjogT29wczog
NSBbIzFdIFBSRUVNUFQgU01QIEFSTQo+IFvCoCA4ODMuODQ4MjU3XSB0YXNrOiBiZDFhYzYwMCB0
aTogYjAyN2EwMDAgdGFzay50aTogYjAyN2EwMDAKPiBbwqAgODgzLjg1MjkwNF0gUEMgaXMgYXQg
aWVlZTgwMjExX2RlbF9pZmFjZSsweDM0LzB4OTAgW21hYzgwMjExXQo+IFvCoCA4ODMuODU4MzMz
XSBMUiBpcyBhdCBleHRhY2tfZG9pdCsweDIwLzB4NmMgW2NvbXBhdF0KPiBbwqAgODg0LjA5Mjkz
Nl0gWzxjNzUxZmJkOD5dIChpZWVlODAyMTFfZGVsX2lmYWNlIFttYWM4MDIxMV0pIGZyb20gCj4g
Wzw3ZjU2MTgxYz5dIChleHRhY2tfZG9pdCsweDIwLzB4NmMgW2NvbXBhdF0pCj4gW8KgIDg4NC4x
MDA5OTFdIFs8N2Y1NjE4MWM+XSAoZXh0YWNrX2RvaXQgW2NvbXBhdF0pIGZyb20gWzw4MDc2YTM0
MD5dIAo+IChnZW5sX3Jjdl9tc2crMHgyN2MvMHgzMDApCj4gW8KgIDg4NC4xMTA4NTRdIFs8ODA3
NmEzNDA+XSAoZ2VubF9yY3ZfbXNnKSBmcm9tIFs8ODA3Njk2YzA+XSAKPiAobmV0bGlua19yY3Zf
c2tiKzB4NTgvMHhiNCkKPgo+IFRoYW5rcwo+IFByYWRlZXAKPgpsYXN0IEkgdGVzdGVkIHJtbW9k
L2luc21vZCB3aWxsIGFsd2F5cyBjcmFzaCB0aGUga2VybmVsIHdoZW4gdXNpbmcgYXRoMTFrCgpo
b3dldmVyIGknbGwgYXNzICFOVUxMIGd1YXJkIGluIHRoZSBuZXh0IHNlcmllcwoKIMKgwqDCoCBK
b2huCgoKLS0gCmF0aDExayBtYWlsaW5nIGxpc3QKYXRoMTFrQGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9hdGgxMWsK
