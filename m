Return-Path: <SRS0=LAxC=J7=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09F49C433B4
	for <ath11k@archiver.kernel.org>; Tue,  4 May 2021 16:50:34 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4C711613BE
	for <ath11k@archiver.kernel.org>; Tue,  4 May 2021 16:50:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4C711613BE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=phrozen.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ukBj4GSr/Egt4FPTvsSdvwy95FcfBNgyinackAg9S7o=; b=VcyA9AstTwpsGjhsUtnCybYpa
	lz1DFDxDN7TpCrdaPgVFLQ31IbiH3NLdESclLDkYRZLG/zLtv0fftBFJXlOaDKA7Nat2SazRJFbpE
	DMeqr3F7rEga4D3CHTKSp1vOhta9cPst8mBS86vKwORzj0OyR+L2QjvXtR+UaDCBOWBbgg2CycwPd
	QsZ7nocbBJ9VnSw4IeEfEl7BGQu/HkfzkexEhw8qmYW6VmYPmpqRQWv6PDZBvf8Zb1nAVUXgk9GBl
	n2zSSPJmZfFpWgSMWmUPYSuqu73b3guXUDQ9qIVfuZV1BPPPK2Mnr/q6BUMBDHphCh3XJcvIQtuZ6
	YmPPLJElw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1ldyFg-00Gao2-5L; Tue, 04 May 2021 16:50:28 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ldyFd-00GanL-Sa
 for ath11k@desiato.infradead.org; Tue, 04 May 2021 16:50:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:
 Subject:Sender:Reply-To:Cc:Content-ID:Content-Description;
 bh=SEFTAPkse7bB9Zz1SwKPqf1wJ62BleY1QO4ZO+qmBDU=; b=V+uczr/VtVX0/mUtAV8lHBcEl9
 V5P0i973Bm7eg3zb2krfadqrL+pa18U7FltRcIw3GSvHNsCVWu4liEjUAWDIm0VjKB6AnrnuMWUkZ
 Yi7Y3DPQLVQEjxGxp991DnWjsH3MqntzpWy0ESk+caPI+YTkKebmomCv6h2pCiWG37gqYF4x4wGfL
 ulc27oXx9YJal1tmfSHeqt8/OwgrnLkUhRaMB6D+3eJ/pQslZhf68lCPQil9xwzIPP4+uHOl8GH2j
 BD29w9ttblcffaI3Lc3g/C1AwNJXbwtrT1Vy9EwhwR4h3zo4GEukAEc4TaTezeSp6VNZald6+GrU3
 mZlCI/0w==;
Received: from nbd.name ([2a01:4f8:221:3d45::2])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ldyFZ-0047NS-SD
 for ath11k@lists.infradead.org; Tue, 04 May 2021 16:50:24 +0000
Received: from 95.81.21.172.dynamic-pppoe.dt.ipv4.wtnet.de ([95.81.21.172]
 helo=[192.168.178.183])
 by ds12 with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <john@phrozen.org>) id 1ldyFT-0002t0-Nz
 for ath11k@lists.infradead.org; Tue, 04 May 2021 18:50:15 +0200
Subject: Re: IPQ6018 issues
To: ath11k@lists.infradead.org
References: <CA+HBbNHYiULJ2T1Q3dmmXZSYb3gLajr2m86HTvCO-ud0GwkaZA@mail.gmail.com>
From: John Crispin <john@phrozen.org>
Message-ID: <724315d2-c542-617a-cfce-001c7e1b0f74@phrozen.org>
Date: Tue, 4 May 2021 18:50:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <CA+HBbNHYiULJ2T1Q3dmmXZSYb3gLajr2m86HTvCO-ud0GwkaZA@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210504_095022_118931_96B23923 
X-CRM114-Status: GOOD (  18.76  )
X-BeenThere: ath11k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
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
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Ck9uIDA0LjA1LjIxIDE4OjM1LCBSb2JlcnQgTWFya28gd3JvdGU6Cj4gSGksCj4KPiBJIGFtIHRy
eWluZyB0byB1c2UgYXRoMTFrIG9uIG11bHRpcGxlIElQUTYwMTggYW5kIElQUTYwMTAgYm9hcmRz
LAo+IHVuZm9ydHVuYXRlbHksIHRoZXkgd2lsbCBhbGwgZmFpbCBsaWtlIHRoaXM6CgpJIGhhdmUg
b2JzZXJ2ZWQgdGhlIHNhbWUgb24gaXBxODA3eC4gVGhpcyBjcmFzaCBoYXBwZW5zIHdoZW4gdGhl
IGRyaXZlciAKZG9lcyB0aGUgZmlyc3QgYWNjZXNzIHRvIEFIQiBtZW1vcnkgaWYgaSByZWNhbGwg
Y29ycmVjdGx5CgogwqDCoMKgIEpvaG4KCgo+PiAjIGVjaG8gYzAwMDAwMC53aWZpID4gL3N5cy9i
dXMvcGxhdGZvcm0vZHJpdmVycy9hdGgxMWsvYmluZAo+PiBbICAgMTIuNDE3MjE0XSBhdGgxMWsg
YzAwMDAwMC53aWZpOiBldmVudCB0eXBlOiAwCj4+IFsgICAxMi40MTc1NTddIGF0aDExayBjMDAw
MDAwLndpZmk6IHFtaSBpZ25vcmUgaW52YWxpZCBtZW0gcmVxIHR5cGUgMwo+PiBbICAgMTIuNDIw
NjA1XSBhdGgxMWsgYzAwMDAwMC53aWZpOiBldmVudCB0eXBlOiAyCj4+IFsgICAxMi40MjcxOTFd
IGF0aDExayBjMDAwMDAwLndpZmk6IGV2ZW50IHR5cGU6IDMKPj4gWyAgIDEyLjQzMTMxMl0gYXRo
MTFrIGMwMDAwMDAud2lmaTogY2hpcF9pZCAweDAgY2hpcF9mYW1pbHkgMHg0IGJvYXJkX2lkIDB4
ZmYgc29jX2lkIDB4ZmZmZmZmZmYKPj4gWyAgIDEyLjQzNTYyNl0gYXRoMTFrIGMwMDAwMDAud2lm
aTogZndfdmVyc2lvbiAweDI0MDYwNmM2IGZ3X2J1aWxkX3RpbWVzdGFtcCAyMDIxLTAyLTEyIDAz
OjE3IGZ3X2J1aWxkX2lkIFFDX0lNQUdFX1ZFUlNJT05fU1RSSU5HPVdMQU4uSEsuMi40LjAuMS0w
MTczNC1RQ0FIS1NXUExfU0lMSUNPTlotMQo+PiBbICAgMTIuNDQ3NTYwXSBhdGgxMWsgYzAwMDAw
MC53aWZpOiBldmVudCB0eXBlOiA0Cj4+IFsgICAxMi40NTkyMTVdIGF0aDExayBjMDAwMDAwLndp
Zmk6IEFUSDExS19RTUlfRVZFTlRfRldfUkVBRFkKPj4gWyAgIDEyLjQ2MzU1MV0gYXRoMTFrIGMw
MDAwMDAud2lmaTogYXRoMTFrX2NvcmVfcW1pX2Zpcm13YXJlX3JlYWR5Cj4+IFsgICAxMi40Njkw
MTNdIGF0aDExayBjMDAwMDAwLndpZmk6IGF0aDExa19jb3JlX3FtaV9maXJtd2FyZV9yZWFkeSBz
dGFydAo+PiBbICAgMTIuNDc0OTAwXSBhdGgxMWsgYzAwMDAwMC53aWZpOiBhdGgxMWtfY2VfaW5p
dF9waXBlcyBwYXNzCj4+ICMgWyAgIDEyLjQ5MTEyNF0gYXRoMTFrIGMwMDAwMDAud2lmaTogYXRo
MTFrX2NyeXB0b19tb2RlOiAwCj4+Cj4+IEZvcm1hdDogTG9nIFR5cGUgLSBUaW1lKG1pY3Jvc2Vj
KSAtIE1lc3NhZ2UgLSBPcHRpb25hbCBJbmZvCj4+IExvZyBUeXBlOiBCIC0gU2luY2UgQm9vdChQ
b3dlciBPbiBSZXNldCksICBEIC0gRGVsdGEsICBTIC0gU3RhdGlzdGljCj4+IFMgLSBRQ19JTUFH
RV9WRVJTSU9OX1NUUklORz1CT09ULlhGLjAuMy0wMDA5OC1JUFE2MHh4TFpCLTEKPj4gUyAtIElN
QUdFX1ZBUklBTlRfU1RSSU5HPUlQUTYwMThMQQo+PiBTIC0gT0VNX0lNQUdFX1ZFUlNJT05fU1RS
SU5HPWNybS11YnVudHUxMjEKPj4gUyAtIEJvb3QgSW50ZXJmYWNlOiBTUEkKPj4gUyAtIFNlY3Vy
ZSBCb290OiBPZmYKPj4gUyAtIEJvb3QgQ29uZmlnIEAgMHgwMDBhNjAyYyA9IDB4MDAwMDAyZTEK
Pj4gUyAtIEpUQUcgSUQgQCAweDAwMGE2MDdjID0gMHgwMDEzYTBlMQo+PiBTIC0gT0VNIElEIEAg
MHgwMDBhNjA4MCA9IDB4MDAwMDAwMDAKPj4gUyAtIFNlcmlhbCBOdW1iZXIgQCAweDAwMGE0MTI4
ID0gMHhkOTJjYTEwMgo+PiBTIC0gT0VNIENvbmZpZyBSb3cgMCBAIDB4MDAwYTQxODggPSAweDAw
MDAwMDAwMDAwMDAwMDAKPj4gUyAtIE9FTSBDb25maWcgUm93IDEgQCAweDAwMGE0MTkwID0gMHgw
MDAwMDAwMDAwMDAwMDAwCj4+IFMgLSBGZWF0dXJlIENvbmZpZyBSb3cgMCBAIDB4MDAwYTQxMzAg
PSAweDAwMDAwMDAwMDgwMDAwMDEKPj4gUyAtIEZlYXR1cmUgQ29uZmlnIFJvdyAxIEAgMHgwMDBh
NDEzOCA9IDB4MDJjM2U4MzM4MzAwMDAwOQo+PiBTIC0gUEJMIFBhdGNoIFZlcjogMQo+PiBTIC0g
SS1jYWNoZTogT24KPj4gUyAtIEQtY2FjaGU6IE9uCj4+IEIgLSAgICAgIDM0MTMgLSBQQkwsIFN0
YXJ0Cj4+IEIgLSAgICAgICA1OTIgLSBib290YWJsZV9tZWRpYV9kZXRlY3RfZW50cnksIFN0YXJ0
Cj4+IEIgLSAgICAgIDQzMzkgLSBib290YWJsZV9tZWRpYV9kZXRlY3Rfc3VjY2VzcywgU3RhcnQK
Pj4gQiAtICAgICAgNDQzNSAtIGVsZl9sb2FkZXJfZW50cnksIFN0YXJ0Cj4+IEIgLSAgICAgIDQ2
MDcgLSBhdXRoX2hhc2hfc2VnX2VudHJ5LCBTdGFydAo+PiBCIC0gICAgIDEwODU0IC0gYXV0aF9o
YXNoX3NlZ19leGl0LCBTdGFydAo+PiBCIC0gICAgIDExMzUwIC0gZWxmX3NlZ3NfaGFzaF92ZXJp
ZnlfZW50cnksIFN0YXJ0Cj4+IEIgLSAgICAzNTc5ODMgLSBlbGZfc2Vnc19oYXNoX3ZlcmlmeV9l
eGl0LCBTdGFydAo+PiBCIC0gICAgMzYyMTczIC0gYXV0aF94Ymxfc2VjX2hhc2hfc2VnX2VudHJ5
LCBTdGFydAo+PiBCIC0gICAgMzYyMzE4IC0gYXV0aF94Ymxfc2VjX2hhc2hfc2VnX2V4aXQsIFN0
YXJ0Cj4+IEIgLSAgICAzNjg4NjggLSB4Ymxfc2VjX3NlZ3NfaGFzaF92ZXJpZnlfZW50cnksIFN0
YXJ0Cj4+IEIgLSAgICAzNjg4NjkgLSB4Ymxfc2VjX3NlZ3NfaGFzaF92ZXJpZnlfZXhpdCwgU3Rh
cnQKPj4gQiAtICAgIDM2OTc5OCAtIFBCTCwgRW5kCj4+IEIgLSAgICAyOTYwMDIgLSBTQkwxLCBT
dGFydAo+PiBCIC0gICAgNDM1ODE0IC0gR0NDIFtSc3RTdGF0OjB4MiwgUnN0RGJnOjB4NDIwMTAw
XSBXRG9nIFN0YXQgOiAweDQKPj4gQiAtICAgIDQzODI1NCAtIGNsb2NrX2luaXQsIFN0YXJ0Cj4+
IEQgLSAgICAgIDM4MTIgLSBjbG9ja19pbml0LCBEZWx0YQo+PiBCIC0gICAgNDQ3ODYyIC0gYm9v
dF9mbGFzaF9pbml0LCBTdGFydAo+PiBEIC0gICAgICA4MDgyIC0gYm9vdF9mbGFzaF9pbml0LCBE
ZWx0YQo+PiBCIC0gICAgNDU4MjAxIC0gc2JsMV9kZHJfc2V0X2RlZmF1bHRfcGFyYW1zLCBTdGFy
dAo+PiBEIC0gICAgICAgMjc0IC0gc2JsMV9kZHJfc2V0X2RlZmF1bHRfcGFyYW1zLCBEZWx0YQo+
PiBCIC0gICAgNDY0ODIwIC0gYm9vdF9jb25maWdfZGF0YV90YWJsZV9pbml0LCBTdGFydAo+PiBE
IC0gICAgICAxODkxIC0gYm9vdF9jb25maWdfZGF0YV90YWJsZV9pbml0LCBEZWx0YSAtICg1NzUg
Qnl0ZXMpCj4+IEIgLSAgICA0NzM5NzAgLSBDRFQgVmVyc2lvbjoyLFBsYXRmb3JtIElEOjgsTWFq
b3IgSUQ6MyxNaW5vciBJRDowLFN1YnR5cGU6MAo+PiBCIC0gICAgNDc5NDkwIC0gSW1hZ2UgTG9h
ZCwgU3RhcnQKPj4gRCAtICAgICAgNjYxOSAtIE9FTV9NSVNDIEltYWdlIExvYWRlZCwgRGVsdGEg
LSAoMCBCeXRlcykKPj4gQiAtICAgIDQ4ODgyMyAtIEltYWdlIExvYWQsIFN0YXJ0Cj4+IEQgLSAg
ICAgIDUwNjMgLSBQTUlDIEltYWdlIExvYWRlZCwgRGVsdGEgLSAoMCBCeXRlcykKPj4gQiAtICAg
IDQ5NjY5MiAtIHNibDFfZGRyX3NldF9wYXJhbXMsIFN0YXJ0Cj4+IEIgLSAgICA1MDE2OTQgLSBD
UFIgY29uZmlndXJhdGlvbjogMHgzNjYKPj4gQiAtICAgIDUwNDg5NyAtIFByZV9ERFJfY2xvY2tf
aW5pdCwgU3RhcnQKPj4gRCAtICAgICAgIDE4MyAtIFByZV9ERFJfY2xvY2tfaW5pdCwgRGVsdGEK
Pj4gRCAtICAgICAgICAgMCAtIHNibDFfZGRyX3NldF9wYXJhbXMsIERlbHRhCj4KPiBJIGFkZGVk
IG1vc3Qgb2YgdGhlIHByaW50cyB0byBmaWd1cmUgb3V0IHdoZXJlIGl0IGRpZXMuCj4gSWYgY29s
ZC1ib290IGNhbGlicmF0aW9uIGlzIGVuYWJsZWQgdGhlbiBpdCB3aWxsIGRpZSBvbiB0aGUKPiBh
dGgxMWtfcW1pX3Byb2Nlc3NfY29sZGJvb3RfY2FsaWJyYXRpb24oKSwgdG8gYmUgZXhhY3Qgb24g
dGhlCj4+IHJldCA9IGF0aDExa19xbWlfd2xhbmZ3X21vZGVfc2VuZChhYiwgQVRIMTFLX0ZJUk1X
QVJFX01PREVfQ09MRF9CT09UKTsKPgo+IEJ1dCwgaWYgY29sZC1ib290IGNhbGlicmF0aW9uIGlz
IGRpc2FibGVkIHRoZW4gdGkgd2lsbCBmYWlsIGluCj4gYXRoMTFrX2NvcmVfcW1pX2Zpcm13YXJl
X3JlYWR5IGF0IG9yIGFmdGVyIGF0aDExa19jcnlwdG9fbW9kZSBzd2l0Y2guCj4KPiBBIGJpZyBp
c3N1ZSBpcyB0aGF0IGl0IHdpbGwgY3Jhc2ggdGhlIGJvYXJkIGFuZCBpdCB3aWxsIGdldCBzdHVj
ayBpbgo+IFNCTCwgb25seSByZW1vdmluZyB0aGUgcG93ZXIgd2lsbCBoZWxwLgo+Cj4gVGhlIGhh
cmR3YXJlIEkgdHJpZWQgb24gaXM6Cj4gKiBXYWxseXMgQ1AwMS1DMQo+ICogV2FsbHlzIENQMDMt
QzEKPiAqIEFsZmEgQVAxODAwQy1BWCBQUk8KPgo+IEkgYWxzbyB0cmllZCBmdyB2ZXJzaW9ucyBm
cm9tIDIuMS4wLjEgdG8gMi41LjAuMS1SMgo+Cj4gRG9lcyBhbnlib2R5IGhhdmUgYW4gaWRlYSBo
b3cgdG8gc29sdmUgdGhpcz8KPgoKLS0gCmF0aDExayBtYWlsaW5nIGxpc3QKYXRoMTFrQGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9hdGgxMWsK
