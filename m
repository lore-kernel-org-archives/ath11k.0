Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from nbd.name ([2a01:4f8:221:3d45::2])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kHsSR-0005HU-N6
 for ath11k@lists.infradead.org; Mon, 14 Sep 2020 17:40:04 +0000
Subject: Re: [PATCH V6 2/2] ath11k: add support for setting fixed HE
 rate/gi/ltf
References: <20200804081630.2013619-2-john@phrozen.org>
 <010101746c53c3fc-6b47ad5d-f740-4029-9a89-2ba9bef427f3-000000@us-west-2.amazonses.com>
 <010101747ecf2d5c-5543939f-2417-438a-8d0a-c31832121a00-000000@us-west-2.amazonses.com>
From: John Crispin <john@phrozen.org>
Message-ID: <ebf50ae1-910c-fab4-83e7-24677ae87243@phrozen.org>
Date: Mon, 14 Sep 2020 19:40:00 +0200
MIME-Version: 1.0
In-Reply-To: <010101747ecf2d5c-5543939f-2417-438a-8d0a-c31832121a00-000000@us-west-2.amazonses.com>
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
To: Aloka Dixit <alokad@codeaurora.org>, Kalle Valo <kvalo@codeaurora.org>
Cc: Miles Hu <milehu@codeaurora.org>, linux-wireless-owner@vger.kernel.org, Johannes Berg <johannes@sipsolutions.net>, linux-wireless@vger.kernel.org, ath11k@lists.infradead.org

Ck9uIDExLjA5LjIwIDIyOjE1LCBBbG9rYSBEaXhpdCB3cm90ZToKPiBPbiAyMDIwLTA5LTA3IDIz
OjA3LCBLYWxsZSBWYWxvIHdyb3RlOgo+PiBKb2huIENyaXNwaW4gPGpvaG5AcGhyb3plbi5vcmc+
IHdyb3RlOgo+Pgo+Pj4gRnJvbTogTWlsZXMgSHUgPG1pbGVodUBjb2RlYXVyb3JhLm9yZz4KPj4+
Cj4+PiBUaGlzIHBhdGNoIGFkZHMgYXRoMTFrIHN1cHBvcnQgZm9yIHNldHRpbmcgZml4ZWQgSEUg
cmF0ZS9naS9sdGYgCj4+PiB2YWx1ZXMgdGhhdAo+Pj4gd2UgYXJlIG5vdyBhYmxlIHRvIHNlbmQg
dG8gdGhlIGtlcm5lbCB1c2luZyBubDgwMjExLiBUaGUgYWRkZWQgY29kZSBpcwo+Pj4gcmV1c2lu
ZyBwYXJ0cyBvZiB0aGUgZXhpc3RpbmcgY29kZSBwYXRoIGFscmVhZHkgdXNlZCBmb3IgSFQvVkhU
LiBUaGUgCj4+PiBuZXcKPj4+IGhlbHBlcnMgYXJlIHN5bW1ldHJpYyB0byBob3cgd2UgZG8gaXQg
Zm9yIEhUL1ZIVC4KPj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBNaWxlcyBIdSA8bWlsZWh1QGNvZGVh
dXJvcmEub3JnPgo+Pj4gU2lnbmVkLW9mZi1ieTogSm9obiBDcmlzcGluIDxqb2huQHBocm96ZW4u
b3JnPgo+Pgo+PiBEZXBlbmRzIG9uOgo+Pgo+PiBlYjg5YTZhNmI3YTEgbmw4MDIxMTogYWRkIHN1
cHBvcnQgZm9yIHNldHRpbmcgZml4ZWQgSEUgcmF0ZS9naS9sdGYKPj4KPj4gQ3VycmVudGx5IGlu
IG5ldC1uZXh0Lgo+Cj4gSGkgS2FsbGUgYW5kIEpvaG4sCj4gVGhpcyBwYXRjaCBpbmNsdWRlcyBh
dXRvLXJhdGUgc3VwcG9ydCBhcyB3ZWxsIHdoaWNoIGlzIHBhcnQgb2YgdGhlIENBRiAKPiBjaGFu
Z2VzIEpvaG4gbWVudGlvbmVkIGluIHY1NSBjaGFuZ2UtbG9nLgo+IEF1dG8tcmF0ZSBwYXJ0IHdh
cyBhZGRlZCBieSBtZSBpbnRvIENBRi4KPiBQbGVhc2UgYWRkIG15IHNpZ24tb2ZmIG9uIHRoaXMg
cGF0Y2guCj4gT3IgbGV0IG1lIGtub3cgaWYgeW91IGRlY2lkZSB0byByZW1vdmUgdGhhdCBwYXJ0
aWN1bGFyIHBvcnRpb24sIHRoZW4gSSAKPiB3aWxsIHNlbmQgYSBzZXBhcmF0ZSBwYXRjaC4KPiBU
aGFua3MuCgpIaSBLYWxsZSwKCnBsZWFzZSBpZ25vcmUgdGhpcyBwYXRjaCBmb3Igbm93CgogwqDC
oMKgIEpvaG4KCgotLSAKYXRoMTFrIG1haWxpbmcgbGlzdAphdGgxMWtAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2F0aDExawo=
