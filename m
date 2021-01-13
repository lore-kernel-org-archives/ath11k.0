Return-Path: <SRS0=juds=GQ=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFE46C433E0
	for <ath11k@archiver.kernel.org>; Wed, 13 Jan 2021 17:05:50 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4A39723383
	for <ath11k@archiver.kernel.org>; Wed, 13 Jan 2021 17:05:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4A39723383
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:Date:References:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=bGB3mZI5VQecu8xglJq9c7dreIIDuc4ruTFDXBA1O9Y=; b=pLeOaDs3ypKs1VyMNXGMs1JVl
	+IceuYpOWOAMhFyiDuOXj7vjJS9PL7f+xUS6CnAe4UZ2jakZkRGuwh4qUJvq9c0xFGEGMYo0/YQXq
	jFe5ACE+suw95nDloew+p6PCCSOTCi3c7MeYm0Paik1T9eaKG2PQYiMzyrQzNVhKaN81+AABv3fwy
	Yw5WDpR1FnUfO+5OWgeT6Ri5GyCB6IJlyWO3LJf/ID9KgG+prRn9J5ecmraTdA5qshjqG3rQg8/hC
	merj7vH76pUODcqye7PsDQuFRQD+eOhVsj0xqv3JfpINhaD/liJH4QSFDjlX67Tm3+L4Qxx3cFiCK
	pWPMI2wWw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kzjac-0000CC-UA; Wed, 13 Jan 2021 17:05:46 +0000
Received: from m43-15.mailgun.net ([69.72.43.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kzjaY-0000B8-OF
 for ath11k@lists.infradead.org; Wed, 13 Jan 2021 17:05:44 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1610557541; h=Content-Transfer-Encoding: Content-Type:
 MIME-Version: Message-ID: In-Reply-To: Date: References: Subject: Cc:
 To: From: Sender; bh=XWqR+16fOJw3D7G+I3d31Tys3DdkJh9NtBQ7qpZghDI=;
 b=qQiyDa0j5HtY1bkAc8D1167Lbf+11ROAc2lT+xmHID/IVurpjd3+rbZDHIxPjbLELJM++J8X
 nr40IOJfBoe5vK/p+gesJrGNPep/LIxuweon2Igw0IBUiX3G9uQGuA+SWr81WTpWY6GYhV7E
 BTevNnpvvnUBFkfkw10s4efmvjk=
X-Mailgun-Sending-Ip: 69.72.43.15
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 5fff2864c88af061072f9992 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 13 Jan 2021 17:05:40
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 0F202C43461; Wed, 13 Jan 2021 17:05:40 +0000 (UTC)
Received: from potku.adurom.net (88-114-240-156.elisa-laajakaista.fi
 [88.114.240.156])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 6BAE6C433CA;
 Wed, 13 Jan 2021 17:05:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 6BAE6C433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=kvalo@codeaurora.org
From: Kalle Valo <kvalo@codeaurora.org>
To: "Luo\, Sining" <sluo@ciena.com>
Subject: Re: Ordering Dell XPS 13 9310 to test QCA6390
References: <tQQZLjnfaM2XZ-LdgoSYE_9yQQmGCtzT108xBh-SzpRhHN7o6_w_jdIcfp67hVNe-kkiNC72u_rhyo1AtUw-41nvcCo_K3pUhkR__6VF6ig=@mitchellnordine.com>
 <87mtydwy7v.fsf@codeaurora.org> <87h7nli16d.fsf@codeaurora.org>
 <CAHUdJJWpHWznHOhdtuRjbH2tr9F5kagGUbNsFO_f7MfY=w_3Gg@mail.gmail.com>
 <878s8xhx1s.fsf@codeaurora.org>
 <CAHUdJJVk3jDY9FGjPTuDTF2+QK+B8f8s6ZqMA+8uH-7Yd==Mmw@mail.gmail.com>
 <075eed74b59afc9bc4f870aea6765f85d040cf47.camel@ciena.com>
Date: Wed, 13 Jan 2021 19:05:33 +0200
In-Reply-To: <075eed74b59afc9bc4f870aea6765f85d040cf47.camel@ciena.com>
 (Sining Luo's message of "Wed, 13 Jan 2021 15:22:31 +0000")
Message-ID: <874kjkix7m.fsf_-_@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.5 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210113_120542_960009_5ED93BC5 
X-CRM114-Status: GOOD (  26.92  )
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
Cc: "ath11k@lists.infradead.org" <ath11k@lists.infradead.org>,
 "wink@technolu.st" <wink@technolu.st>,
 "mail@mitchellnordine.com" <mail@mitchellnordine.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Ikx1bywgU2luaW5nIiA8c2x1b0BjaWVuYS5jb20+IHdyaXRlczoKCj4gT24gV2VkLCAyMDIxLTAx
LTEzIGF0IDEzOjAyICswMTAwLCB3aSBuayB3cm90ZToKPj4gT24gV2VkLCBKYW4gMTMsIDIwMjEg
YXQgMTI6NTQgUE0gS2FsbGUgVmFsbyA8a3ZhbG9AY29kZWF1cm9yYS5vcmc+Cj4+IHdyb3RlOgo+
PiA+IAo+PiA+IHdpIG5rIDx3aW5rQHRlY2hub2x1LnN0PiB3cml0ZXM6Cj4+ID4gCj4+ID4gPiA+
IEkgZ290IHRoZSBYUFMgMTMgOTMxMCBub3cgYW5kIGl0IGluZGVlZCBoYWQgQVg1MDAuIEJ1dCBp
dCBhbHNvCj4+ID4gPiA+IGhhcyBhbgo+PiA+ID4gPiB1cGRhdGVkIEJJT1M6Cj4+ID4gPiA+IAo+
PiA+ID4gPiBbwqDCoMKgIDAuMDAwMDAwXSBETUk6IERlbGwgSW5jLiBYUFMgMTMgOTMxMC8wTVJU
MTIsIEJJT1MgMS4xLjQKPj4gPiA+ID4gMTEvMjMvMjAyMAo+PiA+ID4gPiAKPj4gPiA+ID4gQW5k
IHdpdGggdGhhdCBJIGNhbiBnZXQgMzIgTVNJIHZlY3RvcnM6Cj4+ID4gPiA+IAo+PiA+ID4gPiBb
wqDCoMKgIDIuNzU4MjE5XSBhdGgxMWtfcGNpIDAwMDA6NTY6MDAuMDogV0FSTklORzogYXRoMTFr
IFBDSQo+PiA+ID4gPiBzdXBwb3J0IGlzIGV4cGVyaW1lbnRhbCEKPj4gPiA+ID4gWyAyLjc1ODc3
OF0gYXRoMTFrX3BjaSAwMDAwOjU2OjAwLjA6IEJBUiAwOiBhc3NpZ25lZCBbbWVtCj4+ID4gPiA+
IDB4OGMzMDAwMDAtMHg4YzNmZmZmZiA2NGJpdF0KPj4gPiA+ID4gW8KgwqDCoCAyLjc1ODc5N10g
YXRoMTFrX3BjaSAwMDAwOjU2OjAwLjA6IGVuYWJsaW5nIGRldmljZSAoMDAwMCAtPgo+PiA+ID4g
PiAwMDAyKQo+PiA+ID4gPiBbwqDCoMKgIDIuNzU5MDg2XSBhdGgxMWtfcGNpIDAwMDA6NTY6MDAu
MDogTVNJIHZlY3RvcnM6IDMyCj4+ID4gPiA+IFvCoMKgwqAgMy4yMDg0NDddIGF0aDExa19wY2kg
MDAwMDo1NjowMC4wOiBxbWkgcmVxIG1lbV9zZWdbMF0KPj4gPiA+ID4gMHgzZjAwMDAwMCAzNTIy
NTYwIDEKPj4gPiA+ID4gW8KgwqDCoCAzLjIwODQ0OV0gYXRoMTFrX3BjaSAwMDAwOjU2OjAwLjA6
IHFtaSByZXEgbWVtX3NlZ1sxXQo+PiA+ID4gPiAweDNmNTAwMDAwIDg4NDczNiA0Cj4+ID4gPiA+
IFsgMy4yMTUzNTVdIGF0aDExa19wY2kgMDAwMDo1NjowMC4wOiBjaGlwX2lkIDB4MCBjaGlwX2Zh
bWlseSAweGIKPj4gPiA+ID4gYm9hcmRfaWQgMHhmZiBzb2NfaWQgMHhmZmZmZmZmZgo+PiA+ID4g
PiBbIDMuMjE1MzU4XSBhdGgxMWtfcGNpIDAwMDA6NTY6MDAuMDogZndfdmVyc2lvbiAweDEwMWMw
NmNjCj4+ID4gPiA+IGZ3X2J1aWxkX3RpbWVzdGFtcCAyMDIwLTA2LTI0IDE5OjUwIGZ3X2J1aWxk
X2lkCj4+ID4gPiAKPj4gPiA+IMKgIEkgZGlkIHNlZSB0aGUgdXBkYXRlZCBCSU9TIGZyb20gYSBm
ZXcgd2Vla3MgYWdvLCBidXQgSSd2ZSBiZWVuIGEKPj4gPiA+IGxpdHRsZSBoZXNpdGFudCB0byB1
cGRhdGUgc2luY2UgSSB3YXNuJ3Qgc3VyZSB3aGF0IHdvdWxkIGhhcHBlbiBvcgo+PiA+ID4gaWYK
Pj4gPiA+IEkgY291bGQgZG93bmdyYWRlLgo+PiA+IAo+PiA+IE1ha2VzIHNlbnNlLCBiZXR0ZXIg
dG8gYmUgY2FyZWZ1bC4KPj4gPiAKPj4gPiA+IFNvIHRvIGNvbmZpcm0sIHRoZSBuZXcgQklPUyBp
cyBhbGxvd2luZyB0aGUgZHJpdmVyIHRvIG9idGFpbiBhbGwKPj4gPiA+IDMyCj4+ID4gPiBtc2kg
dmVjdG9ycyByZW1vdmluZyB0aGUgbmVlZCBmb3IgdGhlIHNpbmdsZSBNU0kgcGF0Y2hpbmc/IERv
ZXMKPj4gPiA+IHRoZQo+PiA+ID4gTUhJIC8gTTIgYmVoYXZpb3IgYWxzbyBjaGFuZ2UgdG8gd29y
ayBwcm9wZXJseT8KPj4gPiAKPj4gPiBJIGhhdmUgbm90IHRlc3RlZCB0aGVzZSB5ZXQgYXMgSSBv
bmx5IGRpZCBhIHF1aWNrIDEwIG1pbnV0ZSB0ZXN0LiBJCj4+ID4gd2FzCj4+ID4gb2ZmbGluZSBv
dmVyIHR3byB3ZWVrcyBzbyBJIGhhdmUgYSBsb3Qgb2YgY2F0Y2hpbmcgdXAgdG8gZG8sIGJ1dAo+
PiA+IHdpbGwKPj4gPiBnZXQgYmFjayB0byB5b3UgaW4gbmV4dCBmZXcgZGF5cyBvbiB0aGVzZS4g
TXkgcGxhbiBpcyB0byBhbHNvIHRlc3QKPj4gPiB0aGlzCj4+ID4gbmV3IEJJT1Mgd2l0aCB0aGUg
b2ZmaWNpYWwgNS4xMCByZWxlYXNlIGZyb20gTGludXMgKHRhZyB2NS4xMCkuCj4+ID4gCj4+ID4g
LS0KPj4gPiBodHRwczovL3VybGRlZmVuc2UuY29tL3YzL19faHR0cHM6Ly9wYXRjaHdvcmsua2Vy
bmVsLm9yZy9wcm9qZWN0L2xpbnV4LXdpcmVsZXNzL2xpc3QvX187ISFPU3NHRHchZDQySkZ3bjZ0
SVR5a0VVUTZaWXRmSU1pZjVCUlBkVnRfek9xQ3pvSU5jNjQwT3p3U0h1c3Y1WDU4OGckCj4+ID4g
wqAKPj4gPiAKPj4gPiBodHRwczovL3VybGRlZmVuc2UuY29tL3YzL19faHR0cHM6Ly93aXJlbGVz
cy53aWtpLmtlcm5lbC5vcmcvZW4vZGV2ZWxvcGVycy9kb2N1bWVudGF0aW9uL3N1Ym1pdHRpbmdw
YXRjaGVzX187ISFPU3NHRHchZDQySkZ3bjZ0SVR5a0VVUTZaWXRmSU1pZjVCUlBkVnRfek9xQ3pv
SU5jNjQwT3p3U0h1c2F5MWhtdlkkCj4+ID4gwqAKPj4gCj4+IEF3ZXNvbWUsIGxldCBtZSBrbm93
IGhvdyBpdCBnb2VzLsKgIEkndmUgZ290IHRoZSA5MzEwIGJyYW5jaCBydW5uaW5nCj4+IDUuMTAu
MiB3aXRoIG5vIGlzc3VlcyAoMTYgZGF5cyB1cHRpbWUpIHNvIEkgd291bGRuJ3QgZXhwZWN0IHlv
dSB0byBzZWUKPj4gYW55dGhpbmcgc3VwZXIgbmV3IHRoZXJlLCBnb29kIGx1Y2sgOkQuCj4+IAo+
PiBwcyAtIEhhcHB5IG5ldyB5ZWFyCj4+IAo+Cj4gSGkgS2FsbGUgYW5kIFdpLAo+Cj4gSSd2ZSB1
cGdyYWRlZCBteSA5MzEwIEJJT1MgdG8gdGhlIHNhbWUgMS4xLjQgc2luY2UgaXQncyBhdmFpbGFi
bGU6Cj4KPiBbICAgIDAuMDAwMDAwXSBETUk6IERlbGwgSW5jLiBYUFMgMTMgOTMxMC8wRjdNNEMs
IEJJT1MgMS4xLjQgMTEvMjMvMjAyMAo+Cj4gQnV0IGl0J3Mgc3RpbGwgZ2V0dGluZyBhIHNpbmds
ZSBNU0kgdmVjdG9yOgo+Cj4gWyAgICAzLjE0MzcxMl0gYXRoMTFrX3BjaSAwMDAwOjU2OjAwLjA6
IFdBUk5JTkc6IGF0aDExayBQQ0kgc3VwcG9ydCBpcwo+IGV4cGVyaW1lbnRhbCEKPiBbICAgIDMu
MTQzNzk0XSBhdGgxMWtfcGNpIDAwMDA6NTY6MDAuMDogQkFSIDA6IGFzc2lnbmVkIFttZW0gMHg4
YzMwMDAwMC0KPiAweDhjM2ZmZmZmIDY0Yml0XQo+IFsgICAgMy4xNDM4MTFdIGF0aDExa19wY2kg
MDAwMDo1NjowMC4wOiBlbmFibGluZyBkZXZpY2UgKDAwMDAgLT4gMDAwMikKPiBbICAgIDMuMTQz
ODg1XSBhdGgxMWtfcGNpIDAwMDA6NTY6MDAuMDogTVNJIHZlY3RvcnM6IDEKPiBbICAgIDMuNzU1
NzQ3XSBhdGgxMWtfcGNpIDAwMDA6NTY6MDAuMDogcW1pIHJlcSBtZW1fc2VnWzBdIDB4NTc0MDAw
MDAKPiAzNTIyNTYwIDEKPiBbICAgIDMuNzU1NzQ4XSBhdGgxMWtfcGNpIDAwMDA6NTY6MDAuMDog
cW1pIHJlcSBtZW1fc2VnWzFdIDB4NTRkMDAwMDAKPiA4ODQ3MzYgNAo+IFsgICAgMy43NjQxMTBd
IGF0aDExa19wY2kgMDAwMDo1NjowMC4wOiBjaGlwX2lkIDB4MCBjaGlwX2ZhbWlseSAweGIKPiBi
b2FyZF9pZCAweGZmIHNvY19pZCAweGZmZmZmZmZmCj4gWyAgICAzLjc2NDExMV0gYXRoMTFrX3Bj
aSAwMDAwOjU2OjAwLjA6IGZ3X3ZlcnNpb24gMHgxMDFjMDZjYwo+IGZ3X2J1aWxkX3RpbWVzdGFt
cCAyMDIwLTA2LTI0IDE5OjUwIGZ3X2J1aWxkX2lkIAo+IFsgICAgMy45MzM5MzZdIGF0aDExa19w
Y2kgMDAwMDo1NjowMC4wIHdscDg2czA6IHJlbmFtZWQgZnJvbSB3bGFuMAo+Cj4gRG9lcyBpdCBt
ZWFuIHRoYXQgdGhlIHNpbmdsZSBNU0kgaXNzdWUgaXMgbm90IGZyb20gdGhlIEJJT1M/IAoKRG8g
eW91IGhhdmUgdnQtZCBlbmFibGVkIGluIEJJT1M/IElJUkMgdGhhdCdzIG5lZWRlZCBmb3IgMzIg
dmVjdG9ycy4KCi0tIApodHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3Byb2plY3QvbGludXgt
d2lyZWxlc3MvbGlzdC8KCmh0dHBzOi8vd2lyZWxlc3Mud2lraS5rZXJuZWwub3JnL2VuL2RldmVs
b3BlcnMvZG9jdW1lbnRhdGlvbi9zdWJtaXR0aW5ncGF0Y2hlcwoKLS0gCmF0aDExayBtYWlsaW5n
IGxpc3QKYXRoMTFrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9hdGgxMWsK
