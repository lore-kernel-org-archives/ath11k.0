Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hNdHT-00052G-Ry
 for ath11k@lists.infradead.org; Mon, 06 May 2019 13:03:45 +0000
MIME-Version: 1.0
Subject: Re: [PATCH v3] ath11k: fix build issues on disabling ATH11K_DEBUG
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1556860487-31604-1-git-send-email-akolli@codeaurora.org>
References: <1556860487-31604-1-git-send-email-akolli@codeaurora.org>
Message-Id: <20190506130343.65563608FC@smtp.codeaurora.org>
Date: Mon,  6 May 2019 13:03:43 +0000 (UTC)
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
To: Anilkumar Kolli <akolli@codeaurora.org>
Cc: ath11k@lists.infradead.org

QW5pbGt1bWFyIEtvbGxpIDxha29sbGlAY29kZWF1cm9yYS5vcmc+IHdyb3RlOgoKPiBPbiBDT05G
SUdfQVRIMTFLX0RFQlVHIGRpc2FibGUgZml4IHRoZXNlIGJ1aWxkIGVycm9ycwo+IAo+IGF0aDEx
ay9kcF9yeC5jOiBJbiBmdW5jdGlvbiDigJhhdGgxMWtfaHR0X3B1bGxfcHBkdV9zdGF0c+KAmToK
PiBhdGgxMWsvZHBfcnguYzo5OTE6ODogZXJyb3I6IOKAmHN0cnVjdCBhdGgxMWvigJkgaGFzIG5v
IG1lbWJlciBuYW1lZAo+IOKAmGRlYnVn4oCZCj4gICBpZiAoYXItPmRlYnVnLnBrdGxvZ19tb2Rl
ID09IEFUSDExS19QS1RMT0dfTU9ERV9MSVRFKSB7Cj4gICAgICAgICBeCj4gYXRoMTFrL2RwX3J4
LmM6IEluIGZ1bmN0aW9uIOKAmGF0aDExa19kcF9yeF9wcm9jZXNzX21vbl9zdGF0dXPigJk6Cj4g
YXRoMTFrL2RwX3J4LmM6MjI3ODoxMDogZXJyb3I6IOKAmHN0cnVjdCBhdGgxMWvigJkgaGFzIG5v
IG1lbWJlcgo+IG5hbWVkIOKAmGRlYnVn4oCZCj4gICAgaWYgKCFhci0+ZGVidWcucGt0bG9nX3Bl
ZXJfdmFsaWQpIHsKPiAgICAgICAgICAgXgo+IGF0aDExay9kcF9yeC5jOjIzMDc6OTogZXJyb3I6
IOKAmHN0cnVjdCBhdGgxMWvigJkgaGFzIG5vIG1lbWJlciBuYW1lZAo+IOKAmGRlYnVn4oCZCj4g
ICAgaWYgKGFyLT5kZWJ1Zy5wa3Rsb2dfcGVlcl92YWxpZCAmJgo+ICAgICAgICAgIF4KPiBhdGgx
MWsvZHBfcnguYzoyMzA4OjM4OiBlcnJvcjog4oCYc3RydWN0IGF0aDExa+KAmSBoYXMgbm8gbWVt
YmVyCj4gbmFtZWQg4oCYZGVidWfigJkKPiAgICAgICAgZXRoZXJfYWRkcl9lcXVhbChwZWVyLT5h
ZGRyLCBhci0+ZGVidWcucGt0bG9nX3BlZXJfYWRkcikpIHsKPiAKPiBTaWduZWQtb2ZmLWJ5OiBB
bmlsa3VtYXIgS29sbGkgPGFrb2xsaUBjb2RlYXVyb3JhLm9yZz4KClBhdGNoIGFwcGxpZWQgdG8g
YXRoLmdpdCwgdGhhbmtzLgoKNThlZTg1OTU4YzQyIGF0aDExazogZml4IGJ1aWxkIGlzc3VlcyBv
biBkaXNhYmxpbmcgQVRIMTFLX0RFQlVHCgotLSAKaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9y
Zy9wYXRjaC8xMDkyNzkwNS8KCmh0dHBzOi8vd2lyZWxlc3Mud2lraS5rZXJuZWwub3JnL2VuL2Rl
dmVsb3BlcnMvZG9jdW1lbnRhdGlvbi9zdWJtaXR0aW5ncGF0Y2hlcwoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmF0aDExayBtYWlsaW5nIGxpc3QKYXRo
MTFrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9hdGgxMWsK
