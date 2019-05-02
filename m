Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hMBhz-0007Kq-2X
 for ath11k@lists.infradead.org; Thu, 02 May 2019 13:25:08 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH] ath11k: fix build issues on disabling ATH11K_DEBUG
References: <1556045425-28750-1-git-send-email-akolli@codeaurora.org>
Date: Thu, 02 May 2019 16:25:03 +0300
In-Reply-To: <1556045425-28750-1-git-send-email-akolli@codeaurora.org>
 (Anilkumar Kolli's message of "Wed, 24 Apr 2019 00:20:25 +0530")
Message-ID: <87woj9m1jk.fsf@kamboji.qca.qualcomm.com>
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
To: Anilkumar Kolli <akolli@codeaurora.org>
Cc: ath11k@lists.infradead.org

QW5pbGt1bWFyIEtvbGxpIDxha29sbGlAY29kZWF1cm9yYS5vcmc+IHdyaXRlczoKCj4gT24gQ09O
RklHX0FUSDExS19ERUJVRyBkaXNhYmxlIGZpeCB0aGVzZSBidWlsZCBlcnJvcnMKPgo+IGF0aDEx
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
ZGRyLCBhci0+ZGVidWcucGt0bG9nX3BlZXJfYWRkcikpIHsKPgo+IFNpZ25lZC1vZmYtYnk6IEFu
aWxrdW1hciBLb2xsaSA8YWtvbGxpQGNvZGVhdXJvcmEub3JnPgoKRmFpbGVkIHRvIGFwcGx5OgoK
QXBwbHlpbmc6IGF0aDExazogZml4IGJ1aWxkIGlzc3VlcyBvbiBkaXNhYmxpbmcgQVRIMTFLX0RF
QlVHCmZhdGFsOiBzaGExIGluZm9ybWF0aW9uIGlzIGxhY2tpbmcgb3IgdXNlbGVzcyAoZHJpdmVy
cy9uZXQvd2lyZWxlc3MvYXRoL2F0aDExay9kcF9yeC5jKS4KZXJyb3I6IGNvdWxkIG5vdCBidWls
ZCBmYWtlIGFuY2VzdG9yClBhdGNoIGZhaWxlZCBhdCAwMDAxIGF0aDExazogZml4IGJ1aWxkIGlz
c3VlcyBvbiBkaXNhYmxpbmcgQVRIMTFLX0RFQlVHCgpQbGVhc2UgdXNlIGF0aDExay1icmluZ3Vw
IGJyYW5jaCBhcyB0aGUgYmFzZWxpbmUgc28gdGhhdCBnaXQgY2FuIHVzZQozLXdheSBtZXJnZS4g
T3RoZXJ3aXNlIGl0IHdpbGwgYmUgaGFyZCB0byByZXNvbHZlIGNvbmZsaWN0cy4KCi0tIApLYWxs
ZSBWYWxvCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwph
dGgxMWsgbWFpbGluZyBsaXN0CmF0aDExa0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vYXRoMTFrCg==
