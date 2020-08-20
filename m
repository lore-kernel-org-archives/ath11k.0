Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from nbd.name ([2a01:4f8:221:3d45::2])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k8cvn-0006Ll-JY
 for ath11k@lists.infradead.org; Thu, 20 Aug 2020 05:16:10 +0000
Subject: Re: [PATCH V6 1/2] ath11k: switch to using ieee80211_tx_status_ext()
References: <20200803145444.473810-1-john@phrozen.org>
 <87d03milp7.fsf@codeaurora.org>
From: John Crispin <john@phrozen.org>
Message-ID: <fb192822-935e-9886-38b0-288ca34b43c2@phrozen.org>
Date: Thu, 20 Aug 2020 07:16:02 +0200
MIME-Version: 1.0
In-Reply-To: <87d03milp7.fsf@codeaurora.org>
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
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org

Ck9uIDE5LjA4LjIwIDE5OjM0LCBLYWxsZSBWYWxvIHdyb3RlOgo+IEpvaG4gQ3Jpc3BpbiA8am9o
bkBwaHJvemVuLm9yZz4gd3JpdGVzOgo+Cj4+IFRoaXMgYWxsb3dzIHVzIHRvIHBhc3MgSEUgcmF0
ZXMgZG93biBpbnRvIHRoZSBzdGFjay4KPj4KPj4gU2lnbmVkLW9mZi1ieTogSm9obiBDcmlzcGlu
IDxqb2huQHBocm96ZW4ub3JnPgo+IE9uIHdoYXQgaGFyZHdhcmUgYW5kIGZpcm13YXJlIHdhcyB0
aGlzIHRlc3RlZD8KPgpNaWxlcyBjYW4gZ2l2ZSBtb3JlIGluc2lnaHQsIHRoZSBwYXRjaCB3YXMg
d3JpdHRlbiBieSBoaW0sIEkganVzdCAKcmViYXNlZCBpdCwgcmVtb3ZlZCB0aGUgY2hlY2twYXRj
aCB3YXJuaW5ncyBhbmQgZGlkIHNvbWUgYmFzaWMgdGVzdGluZy4KCiDCoMKgwqAgSm9obgoKCi0t
IAphdGgxMWsgbWFpbGluZyBsaXN0CmF0aDExa0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vYXRoMTFrCg==
