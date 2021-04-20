Return-Path: <SRS0=YHSM=JR=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCFC5C433ED
	for <ath11k@archiver.kernel.org>; Tue, 20 Apr 2021 10:36:03 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1308861008
	for <ath11k@archiver.kernel.org>; Tue, 20 Apr 2021 10:36:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1308861008
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=lj6XaxbA7x6gzpgDNIep4sxDlDhHkpETb5UbKaNg0NY=; b=WWnF+04AUE4geQAKC/fJoRvUx
	djyvoM0aUMRqyntOoVqa9h/9vFx+Cz5hwdG9mC8dqa6s75dTkJ0BVCc6evohU2KoS5qa4GdOfhogH
	4mDjdh7Qmu3wfyyDuk29SpVP3UQSu2EE7fTS+5QWnsJF1vqUM+VmpzTKt0wb0WMCcAsHakHMjwcJl
	BRf9s+0KXY4jvHWaZWcfRepQhELJzjWPLhBZ1nM063z2PGxxeEK2iXtDoaWostnhGjVnR1YvW7e9a
	T0WCDmv9TMhYoQVYOPOnjUC8bclqDCjvF9i1mhZXZWTDfwNXGR4GXa2b2YJzx6PxxkyOdI2wd9fB9
	9z7h0wK2Q==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lYnja-00BtcZ-6G; Tue, 20 Apr 2021 10:35:58 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYnjY-00BtcS-1a
 for ath11k@desiato.infradead.org; Tue, 20 Apr 2021 10:35:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Message-ID:References:In-Reply-To:
 Subject:Cc:To:From:Date:Content-Transfer-Encoding:Content-Type:MIME-Version:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=nNr67v+iEadzV1K+10M8RRJWh4dNw7R3LqqbsZvqqHE=; b=1rrytkUMmaMVqkggN1zRBkKZfA
 f/VeL/v1aID7lkjS9bsjSE3Y5tR4j2vdvYHHbdaeHyiTz4fcm22z17MXdW8AhorKaK7usZU0pa6Ne
 b6fF5WnGweShYxUPSeNgGZnsMeZLEg1ORyWV8FrsRkBcAvmlt8epprGjunl3Gp8PclOTq9RMP4nWP
 RshDl7jL8Ekps5h0+Xbk1BbOB9AjgC9PoJZaC5TGCMzht9349V80zgEywclCdVTZ8+f+Ky4TxSrUD
 LGbhYUOkyJ6ZPxz/ncWi6AaADtHoBv5XHIQPdk72P9XB4zUwWaHseEPLt4QDrgfluyUDf1+wzPLvC
 DB5Vk/Qg==;
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYnjJ-00C1lx-4k
 for ath11k@lists.infradead.org; Tue, 20 Apr 2021 10:35:54 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1618914951; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=nNr67v+iEadzV1K+10M8RRJWh4dNw7R3LqqbsZvqqHE=;
 b=sBYBaAlzFSSnR1FDPk3z1buq/QkaBuG1/pJtk9R26ga+rtF68P1Xo3POqaSe9BpXXCEBlQOt
 gzjbk+sQY6uCtFUmXTG3g9CA5nHK4GvWBiHAK/iPstINE/GHKbX7UgbNThWyfMJS2UhUdKi6
 0EHR2u3oCqolaoLpY5lxhAOfVTY=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 607eae622cbba88980e77a92 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 20 Apr 2021 10:35:14
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id CD547C433D3; Tue, 20 Apr 2021 10:35:13 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: bperumal)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 65D7DC433F1;
 Tue, 20 Apr 2021 10:35:12 +0000 (UTC)
MIME-Version: 1.0
Date: Tue, 20 Apr 2021 16:05:12 +0530
From: Bhagavathi Perumal S <bperumal@codeaurora.org>
To: =?UTF-8?Q?Andr=C3=A9_Eberle?= <andre.eberle@gmail.com>
Cc: ath11k@lists.infradead.org
Subject: Re: ath11k-qca crashing
In-Reply-To: <CA+D0iCL3wmHRLYBpt-QKoVGZNmNUzLHuG+ZyG8UALt=WeDuA_w@mail.gmail.com>
References: <SN6PR02MB5520E3ADA594F9BA98E64B22E24D9@SN6PR02MB5520.namprd02.prod.outlook.com>
 <7da530f675a485bb2ccd397b4ad303fa@codeaurora.org>
 <CA+D0iCJswb8a_=YoM1=c9vNBu15nnv_BNp2Jyh8CgnNqTs4qxg@mail.gmail.com>
 <CA+D0iCL3wmHRLYBpt-QKoVGZNmNUzLHuG+ZyG8UALt=WeDuA_w@mail.gmail.com>
Message-ID: <2100b7360df7c8fc4b695cd06851dc01@codeaurora.org>
X-Sender: bperumal@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210420_033551_181339_659AA346 
X-CRM114-Status: GOOD (  30.30  )
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

T24gMjAyMS0wNC0xOCAwMDo0NSwgQW5kcsOpIEViZXJsZSB3cm90ZToKPiBBZnRlciBzb21lIG1v
cmUgZGVidWdnaW5nLCBJIGZpZ3VyZWQgdGhlcmUgaXMgc29tZSBwcm9ibGVtIG9uIFRYLgo+IFJp
Z2h0IG5vdywgYWRkaW5nIHNtYWxsIGRlbGF5cyB0byB0aGUgYXRoMTFrX25zc190eCBmdW5jdGlv
biBpbiBuc3MuYwo+IGlzIHByZXZlbnRpbmcgdGhlIGNyYXNoIGZyb20gaGFwcGVuaW5nLiBDb3Vs
ZCBzb21lb25lIHBvaW50IG1lIHRvCj4gd2hlcmUgcmFjZSBjb25kaXRpb25zL290aGVyIGlzc3Vl
cyBjb3VsZCBiZSBoYXBwZW5pbmcgb24gdGhlIFRYIHN0YWNrPwo+IAoKVXBzdHJlYW0gYXRoMTFr
IGRyaXZlciBpcyBub3QgdXNpbmcgdGhlIGFwaSBhdGgxMWtfbnNzX3R4KCksIEkgdGhpbmsgeW91
IAphcmUgdXNpbmcgc29tZSBwcml2YXRlIGF0aDExayBkcml2ZXIsIGNhbiB5b3UgcGxlYXNlIGNo
ZWNrIHdoZXRoZXIgdGhlIAphdGgxMWsgZHJpdmVyIGlzIGNvbXBsZXRlZCBlbmFibGVkIGFuZCBm
dWxseSB0ZXN0ZWQgZm9yIHRoZSBwbGF0Zm9ybSAKIklQUTgwN3gvQVAtQUMwNCI/Cgo+IE9uIFRo
dSwgQXByIDE1LCAyMDIxIGF0IDM6MDEgUE0gQW5kcsOpIEViZXJsZSA8YW5kcmUuZWJlcmxlQGdt
YWlsLmNvbT4gCj4gd3JvdGU6Cj4+IAo+PiBJIGhhdmUgYXR0YWNoZWQgdGhlIGRtZXNnLiBJdCBp
cyB0aGUgVUFSVCBkdW1wIGVzc2VudGlhbGx5LCBzbyBpdAo+PiBpbmNsdWRlcyBzb21lIHByZS1i
b290IGluZm8sIG1heWJlIGl0IGlzIHVzZWZ1bDoKPj4gCj4+IGh0dHBzOi8vZHJpdmUuZ29vZ2xl
LmNvbS9maWxlL2QvMXU1X0M3cTZ5SzlxUnlxNFRKWVFwa1plVS0xZVFtUndSL3ZpZXc/dXNwPXNo
YXJpbmcKPj4gCj4+IFRoZXJlIGlzIG5vIHN0YWNrIHRyYWNlIGR1bXAgZHVyaW5nIHRoZSBjcmFz
aCwgdW5mb3J0dW5hdGVseS4gQXMgeW91Cj4+IGNhbiBzZWUgdGhlIHN5c3RlbSBzdWRkZW5seSBy
ZWJvb3RzIChzb21ldGltZXMgaXQganVzdCBmcmVlemVzKS4KPj4gCj4+IEkgaGF2ZSBhZGRlZCB0
aGUgbG9ncmVhZCBmcm9tIG9wZW53cnQgYWxzby4gVGhpcyBvbmUgaGFzIHRyYWNlLWxldmVsCj4+
IG1lc3NhZ2VzIGZyb20gZG1lc2csIHNvIG1heWJlIGl0IGlzIG1vcmUgaGVscGZ1bC4gSSBlbmFi
bGVkIG1heGltdW0KPj4gZGVidWcgbGV2ZWwgZm9yIGF0aDExIG9uIHRoaXMgb25lLCBob3BlIGl0
IGhlbHBzOgo+PiAKPj4gZWNobyAweGZmZmZmZmZmID4gL3N5cy9tb2R1bGUvYXRoMTFrL3BhcmFt
ZXRlcnMvZGVidWdfbWFzawo+PiAKPj4gaHR0cHM6Ly9kcml2ZS5nb29nbGUuY29tL2ZpbGUvZC8x
c2FzRDk5UVZmMlVxRjdsT1FfcEQ1SmhJNDNJZTNETzYvdmlldz91c3A9c2hhcmluZwo+PiAKPj4g
T24gVGh1LCBBcHIgMTUsIDIwMjEgYXQgNjo0OCBBTSBCaGFnYXZhdGhpIFBlcnVtYWwgUwo+PiA8
YnBlcnVtYWxAY29kZWF1cm9yYS5vcmc+IHdyb3RlOgo+PiA+Cj4+ID4gT24gMjAyMS0wNC0xNSAx
NDo1OCwgQmhhZ2F2YXRoaSBQZXJ1bWFsIFMgd3JvdGU6Cj4+ID4gPiBIZWxsbywKPj4gPiA+Cj4+
ID4gPiBJIGhhdmUgYmVlbiB1c2luZyB0aGUgYXRoMTFrIHdpcmVsZXNzIGRyaXZlciAocWNhIHZl
cnNpb24gaWUuIFFTREspIGluCj4+ID4gPiBhIElQUTgwN3ggcm91dGVyLCBidXQgSSBhbSBmYWNp
bmcgY3Jhc2hlcy4gRXRoZXJuZXQgYW5kIFdBTiB3b3JrIGZpbmUuCj4+ID4gPgo+PiA+ID4KPj4g
PiA+IEkgY2FuIGNvbm5lY3QgdG8gV2lGaSwgYW5kIHJlY2VpdmUgYW4gYWRkcmVzcyBmcm9tIERI
Q1AuIEkgY2FuIGV2ZW4KPj4gPiA+IHNlbmQvcmVjZWl2ZSBhIG51bWJlciBvZiBwYWNrZXRzIHZp
YSB0aGUgd2lmaSBuaWMsIGJ1dCBpZiBJIHRyeSB0bywKPj4gPiA+IHNheSwgc2VuZC9yZWN2IGEg
bGFyZ2VyIG51bWJlciBvZiBwYWNrZXRzIGF0IG9uY2UgKGxpa2UgdmlzaXRpbmcgYQo+PiA+ID4g
d2VicGFnZSksIHRoZSBrZXJuZWwgY3Jhc2hlcy4gSSBoYXZlIGJlZW4gZGlnZ2luZyBpbnRvIHRo
ZSBOU1MgYW5kCj4+ID4gPiBhdGgxMWsgZHJpdmVycyB0cnlpbmcgdG8gaXNvbGF0ZSB0aGUgcHJv
YmxlbSwgYnV0IHNvIGZhciBteSBkZWJ1Z2dpbmcKPj4gPiA+IGF0dGVtcHRzIGhhdmUgZmFpbGVk
LiBJIGhhdmUgc28gZmFyIGZhaWxlZCB0byBzZXQgdXAga2dkYiBvbiBxc2RrCj4+ID4gPiBhbHNv
LCBzbyBubyBoZWxwIG9uIHRoYXQgZnJvbnQuCj4+ID4gPgo+PiA+ID4gV2hhdCBpcyB0aGUgYmVz
dCB3YXkgdG8gZGVidWcgdGhlIGF0aDExayBkcml2ZXJzIGZvciBzdWNoIHByb2JsZW1zPyBPcgo+
PiA+ID4gYXQgbGVhc3QgdHJ5IHRvIGRldGVybWluZSBpZiB0aGUgY3Jhc2hlcyBhcmUgZnJvbSB0
aGUgZHJpdmVyLCBvcgo+PiA+ID4gZWxzZXdoZXJlIGluIHRoZSBOU1Mgc3lzdGVtPwo+PiA+Cj4+
ID4gU2VyaWFsIGxvZ3MgYW5kIGNyYXNoIGR1bXAgd2lsbCBoZWxwIHRvIGRlYnVnIHRoZSBrZXJu
ZWwgY3Jhc2hlcy4gUGxlYXNlCj4+ID4gc2hhcmUgZG1lc2cgbG9ncyBhbmQgc2VyaWFsIGxvZ3Mg
ZnJvbSBwb3dlciBvbiBhbmQgcGxlYXNlIHNoYXJlIGNhbGwKPj4gPiBzdGFjayBkZXRhaWxzIGR1
cmluZyBjcmFzaCBpZiBhbnkuCj4+ID4KPj4gPiA+Cj4+ID4gPiAtLQo+PiA+ID4KPj4gPiA+IGF0
aDExayBtYWlsaW5nIGxpc3QKPj4gPiA+Cj4+ID4gPiBhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9y
Zwo+PiA+ID4KPj4gPiA+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vYXRoMTFrCgotLSAKYXRoMTFrIG1haWxpbmcgbGlzdAphdGgxMWtAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2F0aDExawo=
