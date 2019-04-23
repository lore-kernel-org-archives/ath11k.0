Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from nbd.name ([2a01:4f8:221:3d45::2])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hIwfi-0005lk-3p
 for ath11k@lists.infradead.org; Tue, 23 Apr 2019 14:45:23 +0000
Subject: Re: [PATCH V2] ath11k: add HE support
References: <20190416142758.23437-1-john@phrozen.org>
 <00b059e27def4295ae1169cc332adb73@codeaurora.org>
 <2fdd2aa7-758c-55d1-4afb-9afdc8842c98@phrozen.org>
 <87wojkye7y.fsf@kamboji.qca.qualcomm.com>
From: John Crispin <john@phrozen.org>
Message-ID: <839fa6da-f0c0-6cdc-5878-29ea7f33eac6@phrozen.org>
Date: Tue, 23 Apr 2019 16:45:20 +0200
MIME-Version: 1.0
In-Reply-To: <87wojkye7y.fsf@kamboji.qca.qualcomm.com>
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
Cc: Vasanthakumar Thiagarajan <vthiagar@codeaurora.org>, ath11k@lists.infradead.org, Shashidhar Lakkavalli <slakkavalli@datto.com>

Ck9uIDIzLzA0LzIwMTkgMTY6NDMsIEthbGxlIFZhbG8gd3JvdGU6Cj4gSm9obiBDcmlzcGluIDxq
b2huQHBocm96ZW4ub3JnPiB3cml0ZXM6Cj4KPj4gT24gMTYvMDQvMjAxOSAxOTowNywgVmFzYW50
aGFrdW1hciBUaGlhZ2FyYWphbiB3cm90ZToKPj4+IE9uIDIwMTktMDQtMTYgMTk6NTcsIEpvaG4g
Q3Jpc3BpbiB3cm90ZToKPj4+PiBBZGQgYmFzaWMgSEUgc3VwcG9ydCB0byB0aGUgZHJpdmVyLiBU
aGluZ3Mgc3RpbGwgbWlzc2luZyBhcmUKPj4+PiAqIGZpeGVkIEhFIG1jcy9uc3MgcmF0ZXMKPj4+
PiAqIHJlYWRpbmcgdGhlIGNhcHMgZnJvbSB0aGUgRlcKPj4+PiAqIDgwUDgwIHN1cHBvcnQKPj4+
PiAqIHZlcmlmeSBpZiB0aGUgbWFjX2NhcHMgYXJlIGNvcnJlY3QKPj4+PiAqIGhlX29wZXJhdGlv
bnMgaXMgbm90IHlldCBwcm9wYWdhdGVkIHRvIHRoZSBGVyB5ZXQKPj4+Pgo+Pj4+IEZvciBIRSB0
byB3b3JrIHRoZSBmb2xsb3dpbmcgaG9zdGFwZCBwYXRjaGVzIG5lZWQgdG8gYmUgdXNlZAo+Pj4+
IC0tPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9waXBlcm1haWwvaG9zdGFwLzIwMTktQXBy
aWwvMDM5OTYyLmh0bWwKPj4+Pgo+Pj4+IFNpZ25lZC1vZmYtYnk6IFNoYXNoaWRoYXIgTGFra2F2
YWxsaSA8c2xha2thdmFsbGlAZGF0dG8uY29tPgo+Pj4+IFNpZ25lZC1vZmYtYnk6IEpvaG4gQ3Jp
c3BpbiA8am9obkBwaHJvemVuLm9yZz4KPiBbLi4uXQo+Cj4+PiBUaGlzIHNlZW1zIHRvIHJldmVy
dCB0aGUgYmVsb3cgY29tbWl0IHdoaWNoIGZpeGVzIHRhcmdldCBhc3NlcnQuCj4+Pgo+Pj4gY29t
bWl0IGU5NTg5NGUwZTVhN2I1NzViNjgxZWQ3Y2E1NTA2NTZiN2ZjNzI2NDkKPj4+IEF1dGhvcjog
U3JpcmFtIFIgPHNyaXJyYW1hQGNvZGVhdXJvcmEub3JnPgo+Pj4gRGF0ZTrCoMKgIEZyaSBNYXIg
MjkgMTQ6NTM6MDUgMjAxOSArMDUzMAo+Pj4KPj4+ICDCoMKgwqAgYXRoMTFrOiBGaXggZncgYXNz
ZXJ0IGluIFZIVDIwL1ZIVDQwIG1vZGVzIGR1cmluZyBwZWVyIGFzc29jCj4+Pgo+IFsuLi5dCj4K
Pj4gSVQgZG9lcyBpbmRlZWQsIGxldCBtZSBmb2xkIGEgZml4IGludG8gbXkgcGF0Y2guCj4gSSBh
c3N1bWUgeW91IHdpbGwgc2VuZCBhIG5ldyB2ZXJzaW9uIGFuZCBJIGNhbiBkcm9wIHRoaXM/CgoK
SGkgS2FsbGUsCgp5ZXMgcGxlYXNlCgogwqDCoMKgIEpvaG4KCj4KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmF0aDExayBtYWlsaW5nIGxpc3QKYXRoMTFr
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9hdGgxMWsK
