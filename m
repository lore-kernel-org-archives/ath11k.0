Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from szxga07-in.huawei.com ([45.249.212.35] helo=huawei.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kCxPX-0005Yo-Oq
 for ath11k@lists.infradead.org; Tue, 01 Sep 2020 03:56:44 +0000
From: YueHaibing <yuehaibing@huawei.com>
Subject: [PATCH] ath11k: Mark two variables as __maybe_unused
Date: Tue, 1 Sep 2020 11:56:03 +0800
Message-ID: <20200901035603.25180-1-yuehaibing@huawei.com>
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
To: kvalo@codeaurora.org, davem@davemloft.net, kuba@kernel.org
Cc: netdev@vger.kernel.org, YueHaibing <yuehaibing@huawei.com>, linux-wireless@vger.kernel.org, ath11k@lists.infradead.org, linux-kernel@vger.kernel.org

Rml4IC1XdW51c2VkLXZhcmlhYmxlIHdhcm5pbmdzOgoKZHJpdmVycy9uZXQvd2lyZWxlc3MvYXRo
L2F0aDExay9kZWJ1Zy5jOjM2OjIwOiB3YXJuaW5nOiDigJhodHRfYnBfbG1hY19yaW5n4oCZIGRl
ZmluZWQgYnV0IG5vdCB1c2VkIFstV3VudXNlZC12YXJpYWJsZV0KZHJpdmVycy9uZXQvd2lyZWxl
c3MvYXRoL2F0aDExay9kZWJ1Zy5jOjE1OjIwOiB3YXJuaW5nOiDigJhodHRfYnBfdW1hY19yaW5n
4oCZIGRlZmluZWQgYnV0IG5vdCB1c2VkIFstV3VudXNlZC12YXJpYWJsZV0KClNpZ25lZC1vZmYt
Ynk6IFl1ZUhhaWJpbmcgPHl1ZWhhaWJpbmdAaHVhd2VpLmNvbT4KLS0tCiBkcml2ZXJzL25ldC93
aXJlbGVzcy9hdGgvYXRoMTFrL2RlYnVnLmMgfCA0ICsrLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGlu
c2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9uZXQvd2ly
ZWxlc3MvYXRoL2F0aDExay9kZWJ1Zy5jIGIvZHJpdmVycy9uZXQvd2lyZWxlc3MvYXRoL2F0aDEx
ay9kZWJ1Zy5jCmluZGV4IDBhM2NmYTcxNjM5MC4uMGI3ODQyZThjYzU4IDEwMDY0NAotLS0gYS9k
cml2ZXJzL25ldC93aXJlbGVzcy9hdGgvYXRoMTFrL2RlYnVnLmMKKysrIGIvZHJpdmVycy9uZXQv
d2lyZWxlc3MvYXRoL2F0aDExay9kZWJ1Zy5jCkBAIC0xMiw3ICsxMiw3IEBACiAjaW5jbHVkZSAi
ZGVidWdfaHR0X3N0YXRzLmgiCiAjaW5jbHVkZSAicGVlci5oIgogCi1zdGF0aWMgY29uc3QgY2hh
ciAqaHR0X2JwX3VtYWNfcmluZ1tIVFRfU1dfVU1BQ19SSU5HX0lEWF9NQVhdID0geworc3RhdGlj
IGNvbnN0IF9fbWF5YmVfdW51c2VkIGNoYXIgKmh0dF9icF91bWFjX3JpbmdbSFRUX1NXX1VNQUNf
UklOR19JRFhfTUFYXSA9IHsKIAkiUkVPMlNXMV9SSU5HIiwKIAkiUkVPMlNXMl9SSU5HIiwKIAki
UkVPMlNXM19SSU5HIiwKQEAgLTMzLDcgKzMzLDcgQEAgc3RhdGljIGNvbnN0IGNoYXIgKmh0dF9i
cF91bWFjX3JpbmdbSFRUX1NXX1VNQUNfUklOR19JRFhfTUFYXSA9IHsKIAkiUkVPX1NUQVRVU19S
SU5HIiwKIH07CiAKLXN0YXRpYyBjb25zdCBjaGFyICpodHRfYnBfbG1hY19yaW5nW0hUVF9TV19M
TUFDX1JJTkdfSURYX01BWF0gPSB7CitzdGF0aWMgY29uc3QgX19tYXliZV91bnVzZWQgY2hhciAq
aHR0X2JwX2xtYWNfcmluZ1tIVFRfU1dfTE1BQ19SSU5HX0lEWF9NQVhdID0gewogCSJGVzJSWERN
QV9CVUZfUklORyIsCiAJIkZXMlJYRE1BX1NUQVRVU19SSU5HIiwKIAkiRlcyUlhETUFfTElOS19S
SU5HIiwKLS0gCjIuMTcuMQoKCgotLSAKYXRoMTFrIG1haWxpbmcgbGlzdAphdGgxMWtAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2F0aDExawo=
