Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from nbd.name ([2a01:4f8:221:3d45::2])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hTlAT-0006qr-7P
 for ath11k@lists.infradead.org; Thu, 23 May 2019 10:41:51 +0000
Subject: Re: [PATCH V5 1/8] mac80211: propagate HE operation info into
 ieee80211_sta
References: <20190520085508.5888-1-john@phrozen.org>
 <20190520085508.5888-2-john@phrozen.org>
 <87woihcv3l.fsf@kamboji.qca.qualcomm.com>
From: John Crispin <john@phrozen.org>
Message-ID: <7715f971-e650-ef34-6045-d2d0d418ae9d@phrozen.org>
Date: Thu, 23 May 2019 12:41:43 +0200
MIME-Version: 1.0
In-Reply-To: <87woihcv3l.fsf@kamboji.qca.qualcomm.com>
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

Ck9uIDIzLzA1LzIwMTkgMTI6NDAsIEthbGxlIFZhbG8gd3JvdGU6Cj4gKGRyb3BwaW5nIGxpbnV4
LXdpcmVsZXNzKQo+Cj4gSm9obiBDcmlzcGluIDxqb2huQHBocm96ZW4ub3JnPiB3cml0ZXM6Cj4K
Pj4gVXBvbiBhIHN1Y2Nlc3NmdWwgYXNzb2MgYSBzdGF0aW9uIHNoYWxsIHN0b3JlIHRoZSBjb250
ZW50IG9mIHRoZSBIRQo+PiBvcGVyYXRpb24gZWxlbWVudCBpbnNpZGUgaWVlZTgwMjExX3N0YSBz
byB0aGF0IHRoZSBkcml2ZXIgY2FuIHNldHVwIHRoZQo+PiBoYXJkd2FyZSBhY2NvcmRpbmdseS4K
Pj4KPj4gU2lnbmVkLW9mZi1ieTogU2hhc2hpZGhhciBMYWtrYXZhbGxpIDxzbGFra2F2YWxsaUBk
YXR0by5jb20+Cj4+IFNpZ25lZC1vZmYtYnk6IEpvaG4gQ3Jpc3BpbiA8am9obkBwaHJvemVuLm9y
Zz4KPiBBcyB0aGlzIHBhdGNoIGlzIG5vdCB5ZXQgaW4gYXRoMTFrLWJyaW5ndXAgYnJhbmNoIChp
dCdzIG5vdCBldmVuIGluCj4gbWFjODAyMTEtbmV4dCB5ZXQpIG15IHBsYW4gaXMgdGhhdCBJIHdp
bGwgYXBwbHkgdGhpcyB0byBhdGgxMWstYnJpbmd1cAo+IGJyYW5jaCB3aXRoIHByZWZpeCAiTk9U
VVBTVFJFQU06IiBzbyB0aGF0IGl0J3MgZWFzeSB0byBmaW5kIHdoZW4gSSdtCj4gbWVyZ2luZyBw
YXRjaGVzIGZyb20gdXBzdHJlYW0gYW5kIHNvbHZpbmcgY29uZmxpY3RzLgo+CgpHb29kIGlkZWEg
IQoKIMKgwqDCoCBKb2huCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KYXRoMTFrIG1haWxpbmcgbGlzdAphdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2F0aDExawo=
