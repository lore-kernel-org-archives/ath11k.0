Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kaln2-0004jC-8V
 for ath11k@lists.infradead.org; Thu, 05 Nov 2020 20:23:25 +0000
Received: by mail-wm1-f72.google.com with SMTP id z7so1061444wme.8
 for <ath11k@lists.infradead.org>; Thu, 05 Nov 2020 12:23:15 -0800 (PST)
From: David Hildenbrand <david@redhat.com>
Mime-Version: 1.0 (1.0)
Subject: Re: Regression: QCA6390 fails with "mm/page_alloc: place pages to
 tail in __free_pages_core()"
Date: Thu, 5 Nov 2020 21:23:12 +0100
Message-Id: <C3FD015A-8E51-4752-AD76-6ABE4583E268@redhat.com>
References: <225718f1-c4b0-8683-427a-059148a39350@gmail.com>
In-Reply-To: <225718f1-c4b0-8683-427a-059148a39350@gmail.com>
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
To: Pavel Procopiuc <pavel.procopiuc@gmail.com>
Cc: David Hildenbrand <david@redhat.com>, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, Vlastimil Babka <vbabka@suse.cz>, akpm@linux-foundation.org, ath11k@lists.infradead.org, Kalle Valo <kvalo@codeaurora.org>

Cj4gQW0gMDUuMTEuMjAyMCB1bSAxMzo1NSBzY2hyaWViIFBhdmVsIFByb2NvcGl1YyA8cGF2ZWwu
cHJvY29waXVjQGdtYWlsLmNvbT46Cj4gCj4g77u/T3AgMDUuMTEuMjAyMCBvbSAxMjoxMyBzY2hy
ZWVmIERhdmlkIEhpbGRlbmJyYW5kOgo+PiBJdCBkZXBlbmRzIGluIHdoaWNoIG9yZGVyIG1lbW9y
eSBpcyBleHBvc2VkIHRvIE1NLCB3aGljaCBtaWdodCBkZXBlbmQgb24gb3RoZXIgZmFjdG9ycyBp
biBzb21lIGNvbmZpZ3VyYXRpb25zLgo+PiBUaGlzIHNtZWxscyBsaWtlIGl0IGV4cG9zZXMgYW4g
ZXhpc3RpbmcgYnVnLiBDYW4geW91IHJlcHJvZHVjZSBhbHNvIHdpdGggem9uZSBzaHVmZmxpbmcg
ZW5hYmxlZD8KPiAKPiBTbyBqdXN0IHRvIG1ha2Ugc3VyZSBJIHVuZGVyc3RhbmQgeW91IGNvcnJl
Y3RseSwgeW91J2QgbGlrZSB0byBzZWUgaWYgdGhlIHByb2JsZW0gd2l0aCBhdGgxMWsgZHJpdmVy
IG9uIG15IGhhcmR3YXJlIHBlcnNpc3RzIHdoZW4gSSBib290IHByaXN0aW5lIDUuMTAtcmMyIGtl
cm5lbCAod2l0aG91dCByZXZlcnRpbmcgY29tbWl0IDdmZWY0MzFiZTljOWFjMjU1ODM4YTk1Nzgz
MzE1NjdiOWRiYTQ0NzcpIGFuZCB3aXRoIHBhZ2VfYWxsb2Muc2h1ZmZsZT0xLCByaWdodD8KPiAK
ClJpZ2h0LCBidXQgYXMgbGlzdHMgYXJlIHJhbmRvbWl6ZWQgdGhlbiBpdCBtaWdodCB0YWtlIGEg
Y291cGxlIG9mIHRyaWVzIHRvIHJlcHJvZHVjZS4gSeKAmGxsIGhhdmUgYSBsb29rIGF0IHRoZSBk
cml2ZXIgY29kZSAvIGZhaWxpbmcgcGF0aCBvbiBNb25kYXksIHdoZW4gYmFjayB0byB3b3JrLgoK
Q2hlZXJzIQoKCi0tIAphdGgxMWsgbWFpbGluZyBsaXN0CmF0aDExa0BsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vYXRoMTFrCg==
