Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail26.static.mailgun.info ([104.130.122.26])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jcHNH-0003Co-QA
 for ath11k@lists.infradead.org; Fri, 22 May 2020 23:46:49 +0000
MIME-Version: 1.0
Date: Fri, 22 May 2020 16:46:45 -0700
From: Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>
Subject: Re: [PATCH v2 1/9] cfg80211: Add new channel flag to identify 6GHz
 PSC channel
In-Reply-To: <fa1879bf357c091277972b2a370799fdf6192ae3.camel@sipsolutions.net>
References: <20200522072431.27601-1-pradeepc@codeaurora.org>
 <20200522072431.27601-2-pradeepc@codeaurora.org>
 <fa1879bf357c091277972b2a370799fdf6192ae3.camel@sipsolutions.net>
Message-ID: <05fcfc43f2d59dd549a65a83ab60df60@codeaurora.org>
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
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org

T24gMjAyMC0wNS0yMiAxMzozOCwgSm9oYW5uZXMgQmVyZyB3cm90ZToKPiBPbiBGcmksIDIwMjAt
MDUtMjIgYXQgMDA6MjQgLTA3MDAsIFByYWRlZXAgS3VtYXIgQ2hpdHJhcHUgd3JvdGU6Cj4+IDZH
SHogY2hhbm5lbHMgYXJlIGRpdmlkZWQgaW50byBwcmVmZXJyZWQgc2Nhbm5pbmcgY2hhbm5lbHMo
UFNDKQo+PiBhbmQgbm9uLVBTQyBjaGFubmVscy4gT25lIGluIGV2ZXJ5IGZvdXIgMjBNSHogY2hh
bm5lbHMgaXMgYSBQU0MuCj4+IFNwZWMgbWFuZGF0ZXMgdG8gdXNlIG9ubHkgUFNDIGNoYW5uZWxz
IGFzIHByaW1hcnkgY2hhbm5lbHMgZm9yCj4+IHNldHRpbmcgdXAgQlNTIG9uIDZHSHogb25seSBB
UC4KPj4gCj4+IFRoZSBzZXQgb2YgMjAgTUh6IGNoYW5uZWxzIGluIHRoZSA2IEdIeiBiYW5kLCB3
aXRoIGNoYW5uZWwgY2VudGVyCj4+IGZyZXF1ZW5jeSwgY2hfYSA9IENoYW5uZWwgc3RhcnRpbmcg
ZnJlcXVlbmN5IOKAkyA1NSArIDgwIMOXIG4gKE1IeikKPj4gYXJlIHJlZmVycmVkIHRvIGFzIHBy
ZWZlcnJlZCBzY2FubmluZyBjaGFubmVscyAoUFNDcykgd2hlcmUsCj4+IG4gPSAxLCDigKYsIDE1
IGFzIHBlciBJRUVFIFA4MDIuMTFheC9ENi4wLgo+PiAKPj4gVGhpcyBmbGFnIGFsc28gd2lsbCBi
ZSB1c2VkIHdoZW4gbWFraW5nIHNjYW5uaW5nIGRlY2lzaW9uIG9uCj4+IDZHSHogY2hhbm5lbHMu
Cj4gCj4gSXMgdGhlcmUgbXVjaCB2YWx1ZSBpbiBleHBvc2luZyB0aGlzIGFzIGEgKmZsYWcqPwo+
IAo+IFdlIGhhdmUgYSBzaW1pbGFyIHBhdGNoLCBidXQgaXQganVzdCBhZGRzIHRoZSBmdW5jdGlv
biBhbmQgZXZlcnlvbmUgd2hvCj4gY2FyZXMgY2FuIGNhbGwgaXQuIERvIHdlIHJlYWxseSBuZWVk
IHRvIHByZWNhbGN1bGF0ZSB0aGF0Pwo+IAo+IGpvaGFubmVzClRoYW5rcyBKb2hhbm5lcyBmb3Ig
dGhlIHJldmlldy4uCgpJTU8sIGFjY2Vzc2luZyBmbGFnIHdvdWxkIGJlIGZhc3RlciBpbnN0ZWFk
IG9mIGNvbXB1dGF0aW9uLCBhcyB0aGlzIGluZm8KaXMgaGFuZHkgKGFscmVhZHkgaW4gY2FjaGUp
IHdoZW4gYWNjZXNzaW5nIGllZWU4MDIxMV9jaGFubmVsLgpIb3dldmVyLCBjb25zaWRlcmluZyBn
ZW5lcmFsIHVzYWdlIGZvciB0aGlzIGluZm8gd291bGQgYmUgb25seSBmb3IgCmNvbnRyb2wKcGF0
aCwgaXQgc2hvdWxkIGJlIG9rIHRvIGV4cG9zZSBmdW5jdGlvbiBpbnN0ZWFkIG9mIG1haW50YWlu
aW5nIHNlcGFyYXRlIApmbGFnLgpQbGVhc2UgbGV0IG1lIGtub3cgeW91ciBzdWdnZXN0aW9uLi4K
CgpUaGFua3MKUHJhZGVlcAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KYXRoMTFrIG1haWxpbmcgbGlzdAphdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2F0aDExawo=
