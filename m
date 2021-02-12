Return-Path: <SRS0=PtVs=HO=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D3EBC433DB
	for <ath11k@archiver.kernel.org>; Fri, 12 Feb 2021 07:14:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 34BCC64DBA
	for <ath11k@archiver.kernel.org>; Fri, 12 Feb 2021 07:14:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 34BCC64DBA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:Date:References:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=0tE2xy2YRPwP4k97L8OShM9a1L4upeV7Qp+ncXrLJCA=; b=mbHaW1+0j7lTZqUUVfLxa18Jw
	YQ6DJaYuhsF2dKOpJ7Fqoo7zc2oEzMS1sGl4uPyeamsgVR0L7ARivO5XOc4TFfDBmf+qMztLCA+1x
	7VKr3cJjCl8q8HLx+EOIFoS0VBvXelmyzIuWUx9rggdIBYByw2i8WNlrHifJM3ZwfyyQiOPeUlhd1
	RCTMt8E9N7J67y6ZEEKx7XZgsuHF5iOtWGt0RjdRCmnvLuTjlGgGfEf9ugWusB2FgUJkou75TIQif
	q9wMraO3z4NnQrm1JpBC56TM5EM4UYgRModwWzhiuWzchBr1vmJTlTC7YK/SKK2QWtULEm2pTwbvZ
	rQIJpwSoA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lASep-0005xj-Ct; Fri, 12 Feb 2021 07:14:27 +0000
Received: from so15.mailgun.net ([198.61.254.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lASek-0005vt-N5
 for ath11k@lists.infradead.org; Fri, 12 Feb 2021 07:14:26 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1613114064; h=Content-Transfer-Encoding: Content-Type:
 MIME-Version: Message-ID: In-Reply-To: Date: References: Subject: Cc:
 To: From: Sender; bh=f1s7EJfYimVPsHOIhv7YS54FIx5K/Ebp3WkMdfP+x5M=;
 b=X+gHIm4tC8JRHGClOX+j1H1IeyP8QwDv4qipmY+clf/THiMpKPYQgRiRDRdoOgaFDgVI7a7h
 DQaQEj8tjfUc23Y9V8KPROQccF+3+4nmOC8eazy4OK+9P4HH7wkx3NMDnV+nWn3Od25vk51S
 31Yl2IAYhuPPUAF9OiPRfNMBt8E=
X-Mailgun-Sending-Ip: 198.61.254.15
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 60262ac54bd23a05ae7d042f (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 12 Feb 2021 07:14:13
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id D4A6DC433CA; Fri, 12 Feb 2021 07:14:12 +0000 (UTC)
Received: from potku.adurom.net (88-114-240-156.elisa-laajakaista.fi
 [88.114.240.156])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id EF832C433C6;
 Fri, 12 Feb 2021 07:14:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org EF832C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=kvalo@codeaurora.org
From: Kalle Valo <kvalo@codeaurora.org>
To: Justin Mazzola Paluska <jmp@justinmp.com>
Subject: Re: Ordering Dell XPS 13 9310 to test QCA6390
References: <tQQZLjnfaM2XZ-LdgoSYE_9yQQmGCtzT108xBh-SzpRhHN7o6_w_jdIcfp67hVNe-kkiNC72u_rhyo1AtUw-41nvcCo_K3pUhkR__6VF6ig=@mitchellnordine.com>
 <87mtydwy7v.fsf@codeaurora.org> <87h7nli16d.fsf@codeaurora.org>
 <CAHUdJJWpHWznHOhdtuRjbH2tr9F5kagGUbNsFO_f7MfY=w_3Gg@mail.gmail.com>
 <878s8xhx1s.fsf@codeaurora.org>
 <CAHUdJJVk3jDY9FGjPTuDTF2+QK+B8f8s6ZqMA+8uH-7Yd==Mmw@mail.gmail.com>
 <075eed74b59afc9bc4f870aea6765f85d040cf47.camel@ciena.com>
 <874kjkix7m.fsf_-_@codeaurora.org>
 <97390297b66298e485ac5d477594b7d31d3aa7df.camel@ciena.com>
 <ef858ed0-b561-cf30-8741-bb3d85b22d83@justinmp.com>
Date: Fri, 12 Feb 2021 09:14:08 +0200
In-Reply-To: <ef858ed0-b561-cf30-8741-bb3d85b22d83@justinmp.com> (Justin
 Mazzola Paluska's message of "Sat, 16 Jan 2021 09:10:58 -0500")
Message-ID: <87ft21sqpr.fsf@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.5 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210212_021424_792179_13C7AC4B 
X-CRM114-Status: GOOD (  18.03  )
X-BeenThere: ath11k@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Cc: "Luo, Sining" <sluo@ciena.com>,
 "ath11k@lists.infradead.org" <ath11k@lists.infradead.org>,
 "wink@technolu.st" <wink@technolu.st>,
 "mail@mitchellnordine.com" <mail@mitchellnordine.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

SnVzdGluIE1henpvbGEgUGFsdXNrYSA8am1wQGp1c3Rpbm1wLmNvbT4gd3JpdGVzOgoKPiBPbiAx
LzEzLzIxIDE6MjkgUE0sIEx1bywgU2luaW5nIHdyb3RlOgo+PiBZZXMsIGl0IHdhcyBlbmFibGVk
IGluIEJJT1MsIGJ1dCBpdCB3YXNuJ3QgZW5hYmxlZCBhdCBib290IGR1ZSB0byB0aGUKPj4gQklP
UyBidWc6Cj4+IERNQVI6IFtGaXJtd2FyZSBCdWddOiBZb3VyIEJJT1MgaXMgYnJva2VuOyBETUFS
IHJlcG9ydGVkIGF0IGFkZHJlc3MgMCEKPj4KPj4gSSB3ZW50IGFoZWFkIHRvIHVwZ3JhZGUgdGhl
IEJJT1MgdG8gMS4yLjUuIFRoZSBETUFSIGVycm9yIGlzIG5vdyBnb25lCj4+IGFuZCBJIGNhbiBn
ZXQgMzIgTVNJIHZlY3RvcnMgZm9yIHRoZSBmaXJzdCB0aW1lIQo+Pgo+PiBbICAgIDMuOTcxMjE4
XSBhdGgxMWtfcGNpIDAwMDA6NzI6MDAuMDogV0FSTklORzogYXRoMTFrIFBDSSBzdXBwb3J0IGlz
Cj4+IGV4cGVyaW1lbnRhbCEKPj4gWyAgICAzLjk3MTI4NV0gYXRoMTFrX3BjaSAwMDAwOjcyOjAw
LjA6IEJBUiAwOiBhc3NpZ25lZCBbbWVtIDB4YTI1MDAwMDAtCj4+IDB4YTI1ZmZmZmYgNjRiaXRd
Cj4+IFsgICAgMy45NzEzMDJdIGF0aDExa19wY2kgMDAwMDo3MjowMC4wOiBlbmFibGluZyBkZXZp
Y2UgKDAwMDAgLT4gMDAwMikKPj4gWyAgICAzLjk3MTQ1Ml0gYXRoMTFrX3BjaSAwMDAwOjcyOjAw
LjA6IE1TSSB2ZWN0b3JzOiAzMgo+PiBbICAgIDQuNjA5NTkzXSBhdGgxMWtfcGNpIDAwMDA6NzI6
MDAuMDogcW1pIHJlcSBtZW1fc2VnWzBdIDB4NTNjMDAwMDAKPj4gMzUyMjU2MCAxCj4+IFsgICAg
NC42MDk1OTVdIGF0aDExa19wY2kgMDAwMDo3MjowMC4wOiBxbWkgcmVxIG1lbV9zZWdbMV0gMHg1
NDEwMDAwMAo+PiA4ODQ3MzYgNAo+PiBbICAgIDQuNjE2Mzk2XSBhdGgxMWtfcGNpIDAwMDA6NzI6
MDAuMDogY2hpcF9pZCAweDAgY2hpcF9mYW1pbHkgMHhiCj4+IGJvYXJkX2lkIDB4ZmYgc29jX2lk
IDB4ZmZmZmZmZmYKPj4gWyAgICA0LjYxNjM5OF0gYXRoMTFrX3BjaSAwMDAwOjcyOjAwLjA6IGZ3
X3ZlcnNpb24gMHgxMDFjMDZjYwo+PiBmd19idWlsZF90aW1lc3RhbXAgMjAyMC0wNi0yNCAxOTo1
MCBmd19idWlsZF9pZAo+PiBbICAgIDQuNzkzNjUwXSBhdGgxMWtfcGNpIDAwMDA6NzI6MDAuMCB3
bHAxMTRzMDogcmVuYW1lZCBmcm9tIHdsYW4wCj4+Cj4KPgo+IEZvciB3aGF0IGl0J3Mgd29ydGgs
IEkgdXBncmFkZWQgbXkgRGVsbCBYUFMgMTMgOTMxMCB0byBCSU9TIDEuMi41IGFuZAo+IGNhbiBh
bHNvIHJlcG9ydCB0aGF0IHRoZSBETUFSIGVycm9yIGlzIGdvbmUgYW5kIEkgYWxzbyBnZXQgMzIg
TVNJCj4gdmVjdG9ycy4KPgo+ICQgc3VkbyBkbWVzZyB8IGdyZXAgLWUgYXRoMTFrXFxcfG1oaQo+
IFvCoMKgIDE3LjMxNzA5OV0gYXRoMTFrX3BjaSAwMDAwOjU2OjAwLjA6IFdBUk5JTkc6IGF0aDEx
ayBQQ0kgc3VwcG9ydCBpcwo+IGV4cGVyaW1lbnRhbCEKPiBbwqDCoCAxNy4zMTcxNTNdIGF0aDEx
a19wY2kgMDAwMDo1NjowMC4wOiBCQVIgMDogYXNzaWduZWQgW21lbQo+IDB4OGMzMDAwMDAtMHg4
YzNmZmZmZiA2NGJpdF0KPiBbwqDCoCAxNy4zMTcxNzBdIGF0aDExa19wY2kgMDAwMDo1NjowMC4w
OiBlbmFibGluZyBkZXZpY2UgKDAwMDAgLT4gMDAwMikKPiBbwqDCoCAxNy4zMTczMzZdIGF0aDEx
a19wY2kgMDAwMDo1NjowMC4wOiBNU0kgdmVjdG9yczogMzIKPiBbwqDCoCAxNy4zNzUwMjJdIG1o
aSAwMDAwOjU2OjAwLjA6IFJlcXVlc3RlZCB0byBwb3dlciBPTgo+IFvCoMKgIDE3LjM3NTE4MV0g
bWhpIDAwMDA6NTY6MDAuMDogUG93ZXIgb24gc2V0dXAgc3VjY2Vzcwo+IFvCoMKgIDE3Ljk0NTY3
MV0gYXRoMTFrX3BjaSAwMDAwOjU2OjAwLjA6IHFtaSByZXEgbWVtX3NlZ1swXSAweDMzMDAwMDAw
Cj4gMzUyMjU2MCAxCj4gW8KgwqAgMTcuOTQ1Njc1XSBhdGgxMWtfcGNpIDAwMDA6NTY6MDAuMDog
cW1pIHJlcSBtZW1fc2VnWzFdIDB4MzM1MDAwMDAKPiA4ODQ3MzYgNAo+IFvCoMKgIDE3Ljk1MzA1
NF0gYXRoMTFrX3BjaSAwMDAwOjU2OjAwLjA6IGNoaXBfaWQgMHgwIGNoaXBfZmFtaWx5IDB4Ygo+
IGJvYXJkX2lkIDB4ZmYgc29jX2lkIDB4ZmZmZmZmZmYKPiBbwqDCoCAxNy45NTMwNTZdIGF0aDEx
a19wY2kgMDAwMDo1NjowMC4wOiBmd192ZXJzaW9uIDB4MTAxYzA2Y2MKPiBmd19idWlsZF90aW1l
c3RhbXAgMjAyMC0wNi0yNCAxOTo1MCBmd19idWlsZF9pZAo+IFvCoMKgIDE4LjEyNzE2NV0gYXRo
MTFrX3BjaSAwMDAwOjU2OjAwLjAgd2xwODZzMDogcmVuYW1lZCBmcm9tIHdsYW4wCj4KPiBJJ20g
c3RpbGwgdXNpbmcgdGhlIGF0aDExay1xY2E2MzkwLWJyaW5ndXAtMjAyMDEyMTQwOTM4IGJyYW5j
aC7CoCBJJ20KPiBoYXBweSB0byB0cnkgb3V0IG5ldyBwYXRjaGVzLCBwYXJ0aWN1bGFybHkgb25l
cyByZWxhdGVkIHRvIHBvd2VyCj4gbWFuYWdlbWVudC7CoCBUaGUgbGFwdG9wIGRvZXNuJ3QgZ2V0
IGludG8gc3RhdGVzIGxvd2VyIHRoYW4gcGM2IHdoaWxlCj4gdGhlIHdpcmVsZXNzIGNhcmQgaXMg
cnVubmluZy7CoCBJZiBJIHNodXQgZG93biB0aGUgY2FyZCwgdGhlIGxhcHRvcAo+IHdpbGwgb3Bw
b3J0dW5pc3RpY2FsbHkgZ2V0IGRvd24gaW50byB0aGUgcGMxMCBzdGF0ZSwgd2hpY2ggbGVhZHMg
dG8KPiBtYXNzaXZlIHBvd2VyIHNhdmluZ3MuCgpJJ20gbm90IGZhbWlsaWFyIHdpdGggcGMgc3Rh
dGVzLCBkbyB5b3UgaGF2ZSBhbnkgcG9pbnRlcnM/IEhvdyBkbyB5b3UKY2hlY2sgdGhlIHN0YXRl
cyB5b3Vyc2VsZj8KCkF0IHRoZSBtb21lbnQgaW4gc3VzcGVuZCB3ZSBsZWF2ZSB0aGUgZmlybXdh
cmUgcnVubmluZyBpbiBsb3cgcG93ZXIKc3RhdGUgZHVlIHRvIHByb2JsZW1zIGluIE1ISS4gVGhl
IGlkZWFsIHN0YXRlIHdvdWxkIGJlIHRvIHBvd2VyIG9mZiB0aGUKZmlybXdhcmUgZW50aXJlbHks
IGJ1dCB0aGF0IG5lZWRzIGNoYW5nZXMgaW4gTUhJLiBCdXQgSSBzdXNwZWN0IHlvdSBhcmUKbm90
IHRhbGtpbmcgYWJvdXQgc3VzcGVuZC4KCi0tIApodHRwczovL3BhdGNod29yay5rZXJuZWwub3Jn
L3Byb2plY3QvbGludXgtd2lyZWxlc3MvbGlzdC8KCmh0dHBzOi8vd2lyZWxlc3Mud2lraS5rZXJu
ZWwub3JnL2VuL2RldmVsb3BlcnMvZG9jdW1lbnRhdGlvbi9zdWJtaXR0aW5ncGF0Y2hlcwoKLS0g
CmF0aDExayBtYWlsaW5nIGxpc3QKYXRoMTFrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9hdGgxMWsK
