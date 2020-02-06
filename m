Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from nbd.name ([2a01:4f8:221:3d45::2])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1izd55-00019z-I8
 for ath11k@lists.infradead.org; Thu, 06 Feb 2020 09:04:18 +0000
Subject: Re: [PATCH V2 1/3] nl80211: add support for setting fixed HE
 rate/gi/ltf
References: <20200204103514.18111-1-john@phrozen.org>
 <4bf4c267-bfc2-1a04-f2d6-541f086e72c0@broadcom.com>
From: John Crispin <john@phrozen.org>
Message-ID: <1b74ca8c-3bed-6296-5b3d-1ece82b4a56e@phrozen.org>
Date: Thu, 6 Feb 2020 10:04:10 +0100
MIME-Version: 1.0
In-Reply-To: <4bf4c267-bfc2-1a04-f2d6-541f086e72c0@broadcom.com>
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
To: Arend Van Spriel <arend.vanspriel@broadcom.com>, Johannes Berg <johannes@sipsolutions.net>, Kalle Valo <kvalo@codeaurora.org>
Cc: Miles Hu <milehu@codeaurora.org>, linux-wireless@vger.kernel.org, ath11k@lists.infradead.org

T24gMDYvMDIvMjAyMCAwOTo1OCwgQXJlbmQgVmFuIFNwcmllbCB3cm90ZToKPiBPbiAyLzQvMjAy
MCAxMTozNSBBTSwgSm9obiBDcmlzcGluIHdyb3RlOgo+PiBGcm9tOiBNaWxlcyBIdSA8bWlsZWh1
QGNvZGVhdXJvcmEub3JnPgo+Pgo+PiBUaGlzIHBhdGNoIGFkZHMgdGhlIG5sODAyMTEgc3RydWN0
cywgZGVmaW5pdGlvbnMsIHBvbGljaWVzIGFuZCBwYXJzaW5nCj4+IGNvZGUgcmVxdWlyZWQgdG8g
cGFzcyBmaXhlZCBIRSByYXRlLCBnaSBhbmQgbHRmIHNldHRpbmdzLgo+Pgo+PiBTaWduZWQtb2Zm
LWJ5OiBKb2huIENyaXNwaW4gPGpvaG5AcGhyb3plbi5vcmc+Cj4+IFNpZ25lZC1vZmYtYnk6IE1p
bGVzIEh1IDxtaWxlaHVAY29kZWF1cm9yYS5vcmc+Cj4+IC0tLQo+PiBDaGFuZ2VzIGluIFYyCj4+
ICogYWRkIG1vcmUgcG9saWNpZXMKPj4gKiByZW9kZXIgZW51bXMKPj4gKiByZW1vdmUgaW5jb3Jy
ZWN0IGhlX2NhcCBmcm9tIGllZWU4MDIxMV9zdXBwb3J0ZWRfYmFuZAo+IAo+IE5vdCBzZWVpbmcg
dGhlIGNoYW5nZSBsaXN0ZWQgYWJvdmUgb3IgYW0gSSBtaXNzaW5nIHNvbWV0aGluZz8KPiAKPiBS
ZWdhcmRzLAo+IEFyZW5kCgpIaSBBcmVuZCwKdGhhdCBpcyB0aGUgZGVsdGEgdG8gVjEgYXMgcGVy
IEpvaGFubmVzJ3MgZmVlZGJhY2suIE5vdCBhZGRpdGlvbmFsIApjb2RlL2ZlYXR1cmVzCglKb2hu
Cgo+IAo+PiAqIHJlbW92ZSBfV0FSTiBmcm9tIHBvbGljeQo+Pgo+PiDCoCBpbmNsdWRlL25ldC9j
Zmc4MDIxMS5owqDCoMKgwqDCoMKgIHzCoMKgIDMgKwo+PiDCoCBpbmNsdWRlL3VhcGkvbGludXgv
bmw4MDIxMS5oIHzCoCAyOCArKysrKysrKysKPj4gwqAgbmV0L3dpcmVsZXNzL25sODAyMTEuY8Kg
wqDCoMKgwqDCoCB8IDExNyArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrLQo+PiDC
oCAzIGZpbGVzIGNoYW5nZWQsIDE0NiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+IAo+
IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gYXRoMTFr
IG1haWxpbmcgbGlzdAo+IGF0aDExa0BsaXN0cy5pbmZyYWRlYWQub3JnCj4gaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9hdGgxMWsKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphdGgxMWsgbWFpbGluZyBsaXN0CmF0aDEx
a0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vYXRoMTFrCg==
