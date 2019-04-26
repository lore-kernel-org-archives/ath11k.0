Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from nbd.name ([2a01:4f8:221:3d45::2])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hK6rl-0001n8-6J
 for ath11k@lists.infradead.org; Fri, 26 Apr 2019 19:50:38 +0000
Subject: Re: [PATCH V2 1/3] mac80211: allow turning TWT responder support on
 and off via netlink
References: <20190426094150.18078-1-john@phrozen.org>
 <20190426094150.18078-2-john@phrozen.org>
From: John Crispin <john@phrozen.org>
Message-ID: <2f153f21-17fe-26aa-98a4-b82cdb16ffff@phrozen.org>
Date: Fri, 26 Apr 2019 21:50:34 +0200
MIME-Version: 1.0
In-Reply-To: <20190426094150.18078-2-john@phrozen.org>
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
To: Johannes Berg <johannes@sipsolutions.net>, Kalle Valo <kvalo@codeaurora.org>
Cc: Srini Kode <skode@qti.qualcomm.com>, ath11k@lists.infradead.org, linux-wireless@vger.kernel.org, Rajkumar Manoharan <rmanohar@qti.qualcomm.com>, Shashidhar Lakkavalli <slakkavalli@datto.com>

Ck9uIDI2LzA0LzIwMTkgMTE6NDEsIEpvaG4gQ3Jpc3BpbiB3cm90ZToKPiBAQCAtNjEwNSw2ICs2
MTA2LDcgQEAgc3RhdGljIGludCBubDgwMjExX3NldF9ic3Moc3RydWN0IHNrX2J1ZmYgKnNrYiwg
c3RydWN0IGdlbmxfaW5mbyAqaW5mbykKPiAgIAlwYXJhbXMuaHRfb3Btb2RlID0gLTE7Cj4gICAJ
cGFyYW1zLnAycF9jdHdpbmRvdyA9IC0xOwo+ICAgCXBhcmFtcy5wMnBfb3BwX3BzID0gLTE7Cj4g
KwlwYXJhbXMudHd0X3Jlc3BvbmRlciA9IC0xOwo+ICAgCj4gICAJaWYgKGluZm8tPmF0dHJzW05M
ODAyMTFfQVRUUl9CU1NfQ1RTX1BST1RdKQo+ICAgCQlwYXJhbXMudXNlX2N0c19wcm90ID0KPiBA
QCAtNjE0OSw2ICs2MTUxLDEwIEBAIHN0YXRpYyBpbnQgbmw4MDIxMV9zZXRfYnNzKHN0cnVjdCBz
a19idWZmICpza2IsIHN0cnVjdCBnZW5sX2luZm8gKmluZm8pCj4gICAJCQlyZXR1cm4gLUVJTlZB
TDsKPiAgIAl9Cj4gICAKPiArCWlmIChpbmZvLT5hdHRyc1tOTDgwMjExX0FUVFJfVFdUX1JFU1BP
TkRFUl0pCj4gKwkJcGFyYW1zLnR3dF9yZXNwb25kZXIgPQo+ICsJCSAgICBubGFfZ2V0X3U4KGlu
Zm8tPmF0dHJzW05MODAyMTFfQVRUUl9UV1RfUkVTUE9OREVSXSk7Cj4gKwo+ICAgCWlmICghcmRl
di0+b3BzLT5jaGFuZ2VfYnNzKQo+ICAgCQlyZXR1cm4gLUVPUE5PVFNVUFA7CgpIaSwKCnRoaXMg
c2hvdWxkIHByb2JhYmx5IGJlIG1vdmVkIHRvIG5sODAyMTFfc3RhcnRfYXAoKSBpbnN0ZWFkIG9m
IApubDgwMjExX3NldF9ic3MoKSBhcyB3ZSBwcm9iYWJseSBkb250IHdhbnQgdG8gY2hhbmdlIHRo
aXMgYXQgcnVudGltZSA/CgogwqDCoMKgIEpvaG4KCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwphdGgxMWsgbWFpbGluZyBsaXN0CmF0aDExa0BsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
YXRoMTFrCg==
