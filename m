Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from z5.mailgun.us ([104.130.96.5])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kdOVk-0000zt-AP
 for ath11k@lists.infradead.org; Fri, 13 Nov 2020 02:08:25 +0000
MIME-Version: 1.0
Date: Fri, 13 Nov 2020 10:08:13 +0800
From: Wen Gong <wgong@codeaurora.org>
Subject: Re: [PATCH v2] mac80211: reject/clear user rate mask if not usable
In-Reply-To: <5decc452-7b2a-db1d-c5eb-04ab6bb61553@broadcom.com>
References: <20170308132022.4216-1-johannes@sipsolutions.net>
 <07179008e9369bc81e152009ca85191d@codeaurora.org>
 <5decc452-7b2a-db1d-c5eb-04ab6bb61553@broadcom.com>
Message-ID: <4b8f37fde23262547edb6ed4635cf89b@codeaurora.org>
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
To: Arend Van Spriel <arend.vanspriel@broadcom.com>
Cc: Johannes Berg <johannes.berg@intel.com>, kirtika@google.com, linux-wireless-owner@vger.kernel.org, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, Johannes Berg <johannes@sipsolutions.net>, ath11k@lists.infradead.org

T24gMjAyMC0xMS0xMiAyMDo0OSwgQXJlbmQgVmFuIFNwcmllbCB3cm90ZToKPiBPbiAxMS8xMi8y
MDIwIDExOjU1IEFNLCBXZW4gR29uZyB3cm90ZToKPj4gT24gMjAxNy0wMy0wOCAyMToyMCwgSm9o
YW5uZXMgQmVyZyB3cm90ZToKPj4+IEZyb206IEpvaGFubmVzIEJlcmcgPGpvaGFubmVzLmJlcmdA
aW50ZWwuY29tPgo+Pj4gCj4gCj4gWy4uLl0KPiAKPj4+IEBAIC0yNjg1LDYgKzI2ODYsMjEgQEAg
c3RhdGljIGludCBpZWVlODAyMTFfc2V0X2JpdHJhdGVfbWFzayhzdHJ1Y3QKPj4+IHdpcGh5ICp3
aXBoeSwKPj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gcmV0Owo+Pj4gwqDCoMKg
wqAgfQo+Pj4gCj4+PiArwqDCoMKgIC8qCj4+PiArwqDCoMKgwqAgKiBJZiBhY3RpdmUgdmFsaWRh
dGUgdGhlIHNldHRpbmcgYW5kIHJlamVjdCBpdCBpZiBpdCBkb2Vzbid0IAo+Pj4gbGVhdmUKPj4+
ICvCoMKgwqDCoCAqIGF0IGxlYXN0IG9uZSBiYXNpYyByYXRlIHVzYWJsZSwgc2luY2Ugd2UgcmVh
bGx5IGhhdmUgdG8gYmUgCj4+PiBhYmxlCj4+PiArwqDCoMKgwqAgKiB0byBzZW5kIHNvbWV0aGlu
ZywgYW5kIGlmIHdlJ3JlIGFuIEFQIHdlIGhhdmUgdG8gYmUgYWJsZSB0byAKPj4+IGRvCj4+PiAr
wqDCoMKgwqAgKiBzbyBhdCBhIGJhc2ljIHJhdGUgc28gdGhhdCBhbGwgY2xpZW50cyBjYW4gcmVj
ZWl2ZSBpdC4KPj4+ICvCoMKgwqDCoCAqLwo+Pj4gK8KgwqDCoCBpZiAocmN1X2FjY2Vzc19wb2lu
dGVyKHNkYXRhLT52aWYuY2hhbmN0eF9jb25mKSAmJgo+Pj4gK8KgwqDCoMKgwqDCoMKgIHNkYXRh
LT52aWYuYnNzX2NvbmYuY2hhbmRlZi5jaGFuKSB7Cj4+PiArwqDCoMKgwqDCoMKgwqAgdTMyIGJh
c2ljX3JhdGVzID0gc2RhdGEtPnZpZi5ic3NfY29uZi5iYXNpY19yYXRlczsKPj4+ICvCoMKgwqDC
oMKgwqDCoCBlbnVtIG5sODAyMTFfYmFuZCBiYW5kID0gCj4+PiBzZGF0YS0+dmlmLmJzc19jb25m
LmNoYW5kZWYuY2hhbi0+YmFuZDsKPj4+ICsKPj4+ICvCoMKgwqDCoMKgwqDCoCBpZiAoIShtYXNr
LT5jb250cm9sW2JhbmRdLmxlZ2FjeSAmIGJhc2ljX3JhdGVzKSkKPj4+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIHJldHVybiAtRUlOVkFMOwo+PiBJZiB1c2VyIHdhbnQgdG8gdXNlIOKAnGl3IHds
YW4wIHNldCBiaXRyYXRlcyBsZWdhY3ktNSA1NOKAnSB0byBzZXQgaXQgdG8gCj4+IGZpeGVkIGlu
IDU0TSBhbmQgNTRNIGlzCj4+IG5vdCBiYXNpYyByYXRlIGluIEFQJ3MgYmVjYW9uIGFzIGV4YW1w
bGUgb2YgYmVsb3csIHRoZW4gdGhlIGl3IGNvbW1hbmQgCj4+IHdpbGwgZmFpbC4KPiAKPiBXaGlj
aCB3YXMgdGhlIGludGVudCBvZiB0aGlzIGNoYW5nZSwgd2Fzbid0IGl0PyBZb3Ugd2FudCB0byBh
bGxvdwo+IGFueXdheSBvciB5b3Ugd2FudCBhIGNsZWFyIGVycm9yIG1lc3NhZ2UgYXMgdG8gd2h5
IGl0IGZhaWxzPwpXZSBuZWVkIHRvIHNldCB0aGUgdHggcmF0ZSB0byBmaXhlZCBhdCBhIHNpbmds
ZSByYXRlLCBlLmcuLCAKNTRNLzQ4TS8zNk0uLi4gZm9yIGEgdGVzdCBjYXNlLgpJIGRvIG5vdCB3
YW50IGEgY2xlYXIgZXJyb3IgbWVzc2FnZSwgSSB3YW50IHRvIHRoZSA1NE0gcmF0ZSBwYXNzL3Nl
dCAKc3VjY2VzcyB0byBsb3dlciB3bGFuIGRyaXZlci4KVGhlbiBsb3dlciB3bGFuIGRyaXZlciBj
YW4gaGFuZGxlIGl0Lgo+IAo+IFJlZ2FyZHMsCj4gQXJlbmQKCi0tIAphdGgxMWsgbWFpbGluZyBs
aXN0CmF0aDExa0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vYXRoMTFrCg==
