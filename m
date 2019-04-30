Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from nbd.name ([2a01:4f8:221:3d45::2])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hLMix-0002Ze-AZ
 for ath11k@lists.infradead.org; Tue, 30 Apr 2019 06:58:45 +0000
Subject: Re: [PATCH V2 2/3] mac80211: dynamically turn TWT requester support
 on and off
References: <20190426094150.18078-1-john@phrozen.org>
 <20190426094150.18078-3-john@phrozen.org>
 <a580242a242ec6126928bba5227f1e2d@codeaurora.org>
From: John Crispin <john@phrozen.org>
Message-ID: <0af51f01-eeb0-f9f4-0fa4-56b64ceceb7a@phrozen.org>
Date: Tue, 30 Apr 2019 08:58:37 +0200
MIME-Version: 1.0
In-Reply-To: <a580242a242ec6126928bba5227f1e2d@codeaurora.org>
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
To: Rajkumar Manoharan <rmanohar@codeaurora.org>
Cc: linux-wireless-owner@vger.kernel.org, linux-wireless@vger.kernel.org, Rajkumar Manoharan <rmanohar@qti.qualcomm.com>, Srini Kode <skode@qti.qualcomm.com>, Shashidhar Lakkavalli <slakkavalli@datto.com>, Johannes Berg <johannes@sipsolutions.net>, ath11k@lists.infradead.org, Kalle Valo <kvalo@codeaurora.org>

Ck9uIDMwLzA0LzIwMTkgMDg6NDUsIFJhamt1bWFyIE1hbm9oYXJhbiB3cm90ZToKPiBPbiAyMDE5
LTA0LTI2IDAyOjQxLCBKb2huIENyaXNwaW4gd3JvdGU6Cj4+IFR1cm4gVFdUIG9uL29mZiBmb3Ig
U1RBIGludGVyZmFjZXMgd2hlbiB0aGV5IGFzc29jaWF0ZSBhbmQvb3IgcmVjZWl2ZSBhCj4+IGJl
YWNvbiB3aGVyZSB0aGUgdHd0X3Jlc3BvbmRlciBiaXQgaGFzIGNoYW5nZWQuCj4+Cj4KPiBEb2Vz
IGl0IG1lYW4gdGhhdCBUV1QgcmVzcG9uZGVyIGNhbiBiZSB0dXJuIG9uL29mZiB3aGVuIEFQIGlz
IFVQIGFuZCAKPiBydW5uaW5nPwo+IEkgdGhvdWdodCBhbnkgY2hhbmdlIGluIGJlYWNvbiBuZWVk
cyBBUCByZXN0YXJ0LiBubz8KPgo+IC1SYWprdW1hcgo+Cj4gX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KPiBhdGgxMWsgbWFpbGluZyBsaXN0Cj4gYXRoMTFr
QGxpc3RzLmluZnJhZGVhZC5vcmcKPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2F0aDExawoKSGkgUmFqa3VtYXIsCgpJIGFtIGFib3V0IHRvIHNlbmQgYSBWMiB0
aGF0IGFscmVhZHkgYWRkcmVzc2VzIGFsbHRob3NlIGNvbW1lbnRzLCBUaGFua3MgCmZvciB0aGUg
cmV2aWV3CgogwqDCoMKgIEpvaG4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwphdGgxMWsgbWFpbGluZyBsaXN0CmF0aDExa0BsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vYXRoMTFrCg==
