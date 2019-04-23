Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hIwdk-000479-49
 for ath11k@lists.infradead.org; Tue, 23 Apr 2019 14:43:22 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH V2] ath11k: add HE support
References: <20190416142758.23437-1-john@phrozen.org>
 <00b059e27def4295ae1169cc332adb73@codeaurora.org>
 <2fdd2aa7-758c-55d1-4afb-9afdc8842c98@phrozen.org>
Date: Tue, 23 Apr 2019 17:43:13 +0300
In-Reply-To: <2fdd2aa7-758c-55d1-4afb-9afdc8842c98@phrozen.org> (John
 Crispin's message of "Tue, 16 Apr 2019 19:12:54 +0200")
Message-ID: <87wojkye7y.fsf@kamboji.qca.qualcomm.com>
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
To: John Crispin <john@phrozen.org>
Cc: Vasanthakumar Thiagarajan <vthiagar@codeaurora.org>, ath11k@lists.infradead.org, Shashidhar Lakkavalli <slakkavalli@datto.com>

Sm9obiBDcmlzcGluIDxqb2huQHBocm96ZW4ub3JnPiB3cml0ZXM6Cgo+IE9uIDE2LzA0LzIwMTkg
MTk6MDcsIFZhc2FudGhha3VtYXIgVGhpYWdhcmFqYW4gd3JvdGU6Cj4+IE9uIDIwMTktMDQtMTYg
MTk6NTcsIEpvaG4gQ3Jpc3BpbiB3cm90ZToKPj4+IEFkZCBiYXNpYyBIRSBzdXBwb3J0IHRvIHRo
ZSBkcml2ZXIuIFRoaW5ncyBzdGlsbCBtaXNzaW5nIGFyZQo+Pj4gKiBmaXhlZCBIRSBtY3MvbnNz
IHJhdGVzCj4+PiAqIHJlYWRpbmcgdGhlIGNhcHMgZnJvbSB0aGUgRlcKPj4+ICogODBQODAgc3Vw
cG9ydAo+Pj4gKiB2ZXJpZnkgaWYgdGhlIG1hY19jYXBzIGFyZSBjb3JyZWN0Cj4+PiAqIGhlX29w
ZXJhdGlvbnMgaXMgbm90IHlldCBwcm9wYWdhdGVkIHRvIHRoZSBGVyB5ZXQKPj4+Cj4+PiBGb3Ig
SEUgdG8gd29yayB0aGUgZm9sbG93aW5nIGhvc3RhcGQgcGF0Y2hlcyBuZWVkIHRvIGJlIHVzZWQK
Pj4+IC0tPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9waXBlcm1haWwvaG9zdGFwLzIwMTkt
QXByaWwvMDM5OTYyLmh0bWwKPj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBTaGFzaGlkaGFyIExha2th
dmFsbGkgPHNsYWtrYXZhbGxpQGRhdHRvLmNvbT4KPj4+IFNpZ25lZC1vZmYtYnk6IEpvaG4gQ3Jp
c3BpbiA8am9obkBwaHJvemVuLm9yZz4KClsuLi5dCgo+PiBUaGlzIHNlZW1zIHRvIHJldmVydCB0
aGUgYmVsb3cgY29tbWl0IHdoaWNoIGZpeGVzIHRhcmdldCBhc3NlcnQuCj4+Cj4+IGNvbW1pdCBl
OTU4OTRlMGU1YTdiNTc1YjY4MWVkN2NhNTUwNjU2YjdmYzcyNjQ5Cj4+IEF1dGhvcjogU3JpcmFt
IFIgPHNyaXJyYW1hQGNvZGVhdXJvcmEub3JnPgo+PiBEYXRlOsKgwqAgRnJpIE1hciAyOSAxNDo1
MzowNSAyMDE5ICswNTMwCj4+Cj4+IMKgwqDCoCBhdGgxMWs6IEZpeCBmdyBhc3NlcnQgaW4gVkhU
MjAvVkhUNDAgbW9kZXMgZHVyaW5nIHBlZXIgYXNzb2MKPj4KClsuLi5dCgo+IElUIGRvZXMgaW5k
ZWVkLCBsZXQgbWUgZm9sZCBhIGZpeCBpbnRvIG15IHBhdGNoLgoKSSBhc3N1bWUgeW91IHdpbGwg
c2VuZCBhIG5ldyB2ZXJzaW9uIGFuZCBJIGNhbiBkcm9wIHRoaXM/CgotLSAKS2FsbGUgVmFsbwoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYXRoMTFrIG1h
aWxpbmcgbGlzdAphdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2F0aDExawo=
