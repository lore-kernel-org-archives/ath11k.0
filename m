Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kIXk5-0006jp-2r
 for ath11k@lists.infradead.org; Wed, 16 Sep 2020 13:45:02 +0000
Received: by mail-wm1-x342.google.com with SMTP id y15so3129285wmi.0
 for <ath11k@lists.infradead.org>; Wed, 16 Sep 2020 06:44:59 -0700 (PDT)
Date: Wed, 16 Sep 2020 14:44:55 +0100
From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 10/16] wireless: intersil: convert tasklets to use new
 tasklet_setup() API
Message-ID: <20200916134455.GD4678@dell>
References: <20200817090637.26887-1-allen.cryptic@gmail.com>
 <20200817090637.26887-11-allen.cryptic@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200817090637.26887-11-allen.cryptic@gmail.com>
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
To: Allen Pais <allen.cryptic@gmail.com>
Cc: Allen Pais <allen.lkml@gmail.com>, kune@deine-taler.de, chunkeey@googlemail.com, jirislaby@kernel.org, brcm80211-dev-list@cypress.com, pkshih@realtek.com, b43-dev@lists.infradead.org, dsd@gentoo.org, ath11k@lists.infradead.org, stas.yakovlev@gmail.com, mickflemm@gmail.com, keescook@chromium.org, kuba@kernel.org, kvalo@codeaurora.org, brcm80211-dev-list.pdl@broadcom.com, yhchuang@realtek.com, netdev@vger.kernel.org, helmut.schaa@googlemail.com, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, mcgrof@kernel.org, Romain Perier <romain.perier@gmail.com>, Larry.Finger@lwfinger.net

T24gTW9uLCAxNyBBdWcgMjAyMCwgQWxsZW4gUGFpcyB3cm90ZToKCj4gRnJvbTogQWxsZW4gUGFp
cyA8YWxsZW4ubGttbEBnbWFpbC5jb20+Cj4gCj4gSW4gcHJlcGFyYXRpb24gZm9yIHVuY29uZGl0
aW9uYWxseSBwYXNzaW5nIHRoZQo+IHN0cnVjdCB0YXNrbGV0X3N0cnVjdCBwb2ludGVyIHRvIGFs
bCB0YXNrbGV0Cj4gY2FsbGJhY2tzLCBzd2l0Y2ggdG8gdXNpbmcgdGhlIG5ldyB0YXNrbGV0X3Nl
dHVwKCkKPiBhbmQgZnJvbV90YXNrbGV0KCkgdG8gcGFzcyB0aGUgdGFza2xldCBwb2ludGVyIGV4
cGxpY2l0bHkKPiBhbmQgcmVtb3ZlIC5kYXRhIGZpZWxkLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFJv
bWFpbiBQZXJpZXIgPHJvbWFpbi5wZXJpZXJAZ21haWwuY29tPgo+IFNpZ25lZC1vZmYtYnk6IEFs
bGVuIFBhaXMgPGFsbGVuLmxrbWxAZ21haWwuY29tPgo+IC0tLQo+ICAuLi4vbmV0L3dpcmVsZXNz
L2ludGVyc2lsL2hvc3RhcC9ob3N0YXBfaHcuYyAgIHwgMTggKysrKysrKysrLS0tLS0tLS0tCj4g
IGRyaXZlcnMvbmV0L3dpcmVsZXNzL2ludGVyc2lsL29yaW5vY28vbWFpbi5jICAgfCAgNyArKyst
LS0tCj4gIGRyaXZlcnMvbmV0L3dpcmVsZXNzL2ludGVyc2lsL3A1NC9wNTRwY2kuYyAgICAgfCAg
OCArKysrLS0tLQo+ICAzIGZpbGVzIGNoYW5nZWQsIDE2IGluc2VydGlvbnMoKyksIDE3IGRlbGV0
aW9ucygtKQoKVGhpcyBwYXRjaCBzZWVtcyB0byBjYXVzZSBzZXZlcmFsIHdhcm5pbmdzIGFsb25n
IHRoZSBsaW5lcyBvZjoKCmRyaXZlcnMvbmV0L3dpcmVsZXNzL2ludGVyc2lsL2hvc3RhcC9ob3N0
YXBfaHcuYzogSW4gZnVuY3Rpb24g4oCYcHJpc20yX2luaXRfbG9jYWxfZGF0YeKAmToKZHJpdmVy
cy9uZXQvd2lyZWxlc3MvaW50ZXJzaWwvaG9zdGFwL2hvc3RhcF9ody5jOjMxODU6NDg6IHdhcm5p
bmc6IGNhc3QgYmV0d2VlbiBpbmNvbXBhdGlibGUgZnVuY3Rpb24gdHlwZXMgZnJvbSDigJh2b2lk
ICgqKShzdHJ1Y3QgdGFza2xldF9zdHJ1Y3QgKinigJkgdG8g4oCYdm9pZCAoKikobG9uZyB1bnNp
Z25lZCBpbnQp4oCZIFstV2Nhc3QtZnVuY3Rpb24tdHlwZV0KMzE4NSB8IGRvIHsgbWVtc2V0KChx
KSwgMCwgc2l6ZW9mKCoocSkpKTsgKHEpLT5mdW5jID0gKHZvaWQoKikodW5zaWduZWQgbG9uZykp
KGYpOyB9IHwgXgpkcml2ZXJzL25ldC93aXJlbGVzcy9pbnRlcnNpbC9ob3N0YXAvaG9zdGFwX2h3
LmM6MzE4NzoyOiBub3RlOiBpbiBleHBhbnNpb24gb2YgbWFjcm8g4oCYSE9TVEFQX1RBU0tMRVRf
SU5JVOKAmQozMTg3IHwgSE9TVEFQX1RBU0tMRVRfSU5JVCgmbG9jYWwtPmJhcF90YXNrbGV0LCBo
b3N0YXBfYmFwX3Rhc2tsZXQsCnwgXn5+fn5+fn5+fn5+fn5+fn5+fgpkcml2ZXJzL25ldC93aXJl
bGVzcy9pbnRlcnNpbC9ob3N0YXAvaG9zdGFwX2h3LmM6MzE4NTo0ODogd2FybmluZzogY2FzdCBi
ZXR3ZWVuIGluY29tcGF0aWJsZSBmdW5jdGlvbiB0eXBlcyBmcm9tIOKAmHZvaWQgKCopKHN0cnVj
dCB0YXNrbGV0X3N0cnVjdCAqKeKAmSB0byDigJh2b2lkICgqKShsb25nIHVuc2lnbmVkIGludCni
gJkgWy1XY2FzdC1mdW5jdGlvbi10eXBlXQoKLS0gCkxlZSBKb25lcyBb5p2O55C85pavXQpTZW5p
b3IgVGVjaG5pY2FsIExlYWQgLSBEZXZlbG9wZXIgU2VydmljZXMKTGluYXJvLm9yZyDilIIgT3Bl
biBzb3VyY2Ugc29mdHdhcmUgZm9yIEFybSBTb0NzCkZvbGxvdyBMaW5hcm86IEZhY2Vib29rIHwg
VHdpdHRlciB8IEJsb2cKCi0tIAphdGgxMWsgbWFpbGluZyBsaXN0CmF0aDExa0BsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vYXRo
MTFrCg==
