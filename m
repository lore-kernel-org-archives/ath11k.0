Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from nbd.name ([2a01:4f8:221:3d45::2])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hK6uD-0001vi-6h
 for ath11k@lists.infradead.org; Fri, 26 Apr 2019 19:53:10 +0000
Subject: Re: [PATCH V2 1/3] mac80211: allow turning TWT responder support on
 and off via netlink
References: <20190426094150.18078-1-john@phrozen.org>
 <20190426094150.18078-2-john@phrozen.org>
 <2f153f21-17fe-26aa-98a4-b82cdb16ffff@phrozen.org>
 <8b456918fc5cd0674f834771be2bb5134bccd26a.camel@sipsolutions.net>
From: John Crispin <john@phrozen.org>
Message-ID: <d60c3032-b432-c2ee-95e2-edffed75c87a@phrozen.org>
Date: Fri, 26 Apr 2019 21:53:07 +0200
MIME-Version: 1.0
In-Reply-To: <8b456918fc5cd0674f834771be2bb5134bccd26a.camel@sipsolutions.net>
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

Ck9uIDI2LzA0LzIwMTkgMjE6NTEsIEpvaGFubmVzIEJlcmcgd3JvdGU6Cj4gT24gRnJpLCAyMDE5
LTA0LTI2IGF0IDIxOjUwICswMjAwLCBKb2huIENyaXNwaW4gd3JvdGU6Cj4+IE9uIDI2LzA0LzIw
MTkgMTE6NDEsIEpvaG4gQ3Jpc3BpbiB3cm90ZToKPj4+IEBAIC02MTA1LDYgKzYxMDYsNyBAQCBz
dGF0aWMgaW50IG5sODAyMTFfc2V0X2JzcyhzdHJ1Y3Qgc2tfYnVmZiAqc2tiLCBzdHJ1Y3QgZ2Vu
bF9pbmZvICppbmZvKQo+Pj4gICAgCXBhcmFtcy5odF9vcG1vZGUgPSAtMTsKPj4+ICAgIAlwYXJh
bXMucDJwX2N0d2luZG93ID0gLTE7Cj4+PiAgICAJcGFyYW1zLnAycF9vcHBfcHMgPSAtMTsKPj4+
ICsJcGFyYW1zLnR3dF9yZXNwb25kZXIgPSAtMTsKPj4+ICAgIAo+Pj4gICAgCWlmIChpbmZvLT5h
dHRyc1tOTDgwMjExX0FUVFJfQlNTX0NUU19QUk9UXSkKPj4+ICAgIAkJcGFyYW1zLnVzZV9jdHNf
cHJvdCA9Cj4+PiBAQCAtNjE0OSw2ICs2MTUxLDEwIEBAIHN0YXRpYyBpbnQgbmw4MDIxMV9zZXRf
YnNzKHN0cnVjdCBza19idWZmICpza2IsIHN0cnVjdCBnZW5sX2luZm8gKmluZm8pCj4+PiAgICAJ
CQlyZXR1cm4gLUVJTlZBTDsKPj4+ICAgIAl9Cj4+PiAgICAKPj4+ICsJaWYgKGluZm8tPmF0dHJz
W05MODAyMTFfQVRUUl9UV1RfUkVTUE9OREVSXSkKPj4+ICsJCXBhcmFtcy50d3RfcmVzcG9uZGVy
ID0KPj4+ICsJCSAgICBubGFfZ2V0X3U4KGluZm8tPmF0dHJzW05MODAyMTFfQVRUUl9UV1RfUkVT
UE9OREVSXSk7Cj4+PiArCj4+PiAgICAJaWYgKCFyZGV2LT5vcHMtPmNoYW5nZV9ic3MpCj4+PiAg
ICAJCXJldHVybiAtRU9QTk9UU1VQUDsKPj4gSGksCj4+Cj4+IHRoaXMgc2hvdWxkIHByb2JhYmx5
IGJlIG1vdmVkIHRvIG5sODAyMTFfc3RhcnRfYXAoKSBpbnN0ZWFkIG9mCj4+IG5sODAyMTFfc2V0
X2JzcygpIGFzIHdlIHByb2JhYmx5IGRvbnQgd2FudCB0byBjaGFuZ2UgdGhpcyBhdCBydW50aW1l
ID8KPiBJIGhhdmUgbm8gaWRlYSwgY2FuIHdlIGNoYW5nZSBpdCBhdCBydW50aW1lPyBJcyBpdCBh
IGNhcGFiaWxpdHkgb3IgYW4KPiBvcGVyYXRpb25hbCBzdGF0ZT8KPgo+IGpvaGFubmVzCgppdHMg
YSBjYXBhYmlsaXR5LCBvbmx5IHRoZSB0d3RfcmVxdWlyZWQgYml0IGlzIGFuIG9wZXJhdGlvbmFs
IHN0YXRlLiBzbyAKSSBzaGFsbCBzZW5kIGEgVjMgbW92aW5nIGl0IHRvIHN0YXJ0X2FwKCkgOi0p
CgogwqDCoMKgIEpvaG4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwphdGgxMWsgbWFpbGluZyBsaXN0CmF0aDExa0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vYXRoMTFrCg==
