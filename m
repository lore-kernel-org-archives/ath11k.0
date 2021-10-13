Return-Path: <SRS0=CdPh=PB=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FA58C433F5
	for <ath11k@archiver.kernel.org>; Wed, 13 Oct 2021 01:13:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 521B060E94
	for <ath11k@archiver.kernel.org>; Wed, 13 Oct 2021 01:13:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 521B060E94
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f7YZHOmvCqxsEsGyVrEIL/BkrcrC5u6Vl6gju5kB50g=; b=jfzIqDV7h0x8dKA78z8MzNuY00
	zfVZHMoQX0D2QQX2rzsWqpDAKywJMrEXR4XL/RFg3YF4E5uAdcNPxAw89V12rLxRn8a1fxBb1uhyl
	Gk/SedzdoRULvWxe6tL50vb9ZDRFK6T10LljMTShKyeifQC7KK41ACetyM6cHutXBj1v9OJvkf2yq
	mbD8Me1CWzaBgXehKWWPj2tm/3Kqlth/19FsRk9YmifPjUsxC+o61IQeoDiNrlnw01Ym6TcNYPeqs
	FTzi1DHO4DKqnMpfliBeY9dijqCXPQr/yDiPTApFpXmDQFbCmfHCm6CeCbh6RxoM+MM1GB57VjXFg
	NMpXKKvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1maSpZ-00EXDL-A2; Wed, 13 Oct 2021 01:13:17 +0000
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1maSpR-00EXC1-Nj
 for ath11k@lists.infradead.org; Wed, 13 Oct 2021 01:13:15 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1634087593; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: From: References: To: Subject: MIME-Version: Date:
 Message-ID: Sender; bh=rNQ4anskZi9Vbwsew66ozvplwM+AvOZk04OzZHXyZag=;
 b=D4ao6eHWu0xC4U5rEfDnnwO/YoPJHF8gbM6Uhj4zt+BPh0SFmUgY1BJNnjM9BA2zdM3XOSf2
 YtZUTEPbIDNexncdYE8HaCBqy/bCXjXMO9Cfp4hAoApOcOJzGY4J/ZunmrZuhUrfzhWAs7FU
 DMZfRNgAiIeqMPB9810CSBssA5g=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 6166327e446c6db0cb0ba5a7 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 13 Oct 2021 01:12:30
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id E8A3EC43460; Wed, 13 Oct 2021 01:12:29 +0000 (UTC)
Received: from [192.168.1.132] (c-24-4-33-213.hsd1.ca.comcast.net
 [24.4.33.213])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: jjohnson)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 5B789C4338F
 for <ath11k@lists.infradead.org>; Wed, 13 Oct 2021 01:12:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 5B789C4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
Message-ID: <a345b584-c4ed-d158-f28c-8ecdc6aae330@codeaurora.org>
Date: Tue, 12 Oct 2021 18:12:29 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.0.1
Subject: Re: [PATCH] ath11k: enable IEEE80211_VHT_EXT_NSS_BW_CAPABLE if NSS
 ratio enabled
Content-Language: en-US
To: ath11k@lists.infradead.org
References: <20211011083020.30536-1-wgong@codeaurora.org>
From: Jeff Johnson <jjohnson@codeaurora.org>
In-Reply-To: <20211011083020.30536-1-wgong@codeaurora.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211012_181313_800741_874A32DF 
X-CRM114-Status: GOOD (  16.46  )
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

T24gMTAvMTEvMjAyMSAxOjMwIEFNLCBXZW4gR29uZyB3cm90ZToKPiBXaGVuIE5TUyByYXRpbyBl
bmFibGVkIHJlcG9ydGVkIGJ5IGZpcm13YXJlLCBTVVBQT1JUU19WSFRfRVhUX05TU19CVwo+IGlz
IHNldCBpbiBhdGgxMWssIG1lYW53aGlsZSBJRUVFODAyMTFfVkhUX0VYVF9OU1NfQldfQ0FQQUJM
RSBhbHNvCj4gbmVlZCB0byBiZSBzZXQsIG90aGVyd2lzZSBpdCBpcyBpbnZhbGlkIGJlY2F1c2Ug
c3BlYyBpbiBJRUVFIFN0ZAo+IDgwMi4xMeKEoi0yMDE2IGFzIGJlbG93LgoKU3VnZ2VzdCB5b3Ug
cmVmZXJlbmNlIHRoZSBsYXRlc3QgdmVyc2lvbiBvZiB0aGUgc3BlYywgSUVFRSBTdGQKODAyLjEx
4oSi4oCQMjAyMCwgVGFibGUgOS0yNzPigJRTdXBwb3J0ZWQgVkhULU1DUyBhbmQgTlNTIFNldCBz
dWJmaWVsZHMKCj4gCj4gVGFibGUgOS0yNTHigJRTdXBwb3J0ZWQgVkhULU1DUyBhbmQgTlNTIFNl
dCBzdWJmaWVsZHMsIGl0IGhhcyBzdWJmaWVsZAo+IFZIVCBFeHRlbmRlZCBOU1MgQlcgQ2FwYWJs
ZSwgaXRzIGRlZmluaXRpb24gaXM6Cj4gSW5kaWNhdGVzIHdoZXRoZXIgdGhlIFNUQSBpcyBjYXBh
YmxlIG9mIGludGVycHJldGluZyB0aGUgRXh0ZW5kZWQgTlNTCj4gQlcgU3VwcG9ydCBzdWJmaWVs
ZCBvZiB0aGUgVkhUIENhcGFiaWxpdGllcyBJbmZvcm1hdGlvbiBmaWVsZC4KPiAKPiBkbWVzZyBo
YXZlIGEgbWVzc2FnZSB3aXRob3V0IHRoaXMgcGF0Y2g6Cj4gWyAzMTQzLjE3NzgxMF0gWzUyMDRd
IG1hYzgwMjExOmllZWU4MDIxMV9yZWdpc3Rlcl9odzoxMjU4OiBpZWVlODAyMTEgcGh5MDogY29w
eWluZyBzYmFuZCAoYmFuZCAxKSBkdWUgdG8gVkhUIEVYVCBOU1MgQlcgZmxhZwo+IEl0IG1lYW5z
IG1hYzgwMjExIHdpbGwgc2V0IElFRUU4MDIxMV9WSFRfRVhUX05TU19CV19DQVBBQkxFIGlmIGF0
aDExayBub3QKPiBzZXQgaXQgaW4gaWVlZTgwMjExX3JlZ2lzdGVyX2h3KCkuIFNvIGl0IGlzIGJl
dHRlciB0byBzZXQgaXQgaW4gYXRoMTFrLgo+IAo+IFRlc3RlZC1vbjogV0NONjg1NSBodzIuMCBQ
Q0kgV0xBTi5IU1AuMS4xLTAxNzIwLjEtUUNBSFNQU1dQTF9WMV9WMl9TSUxJQ09OWl9MSVRFLTEK
PiAKPiBTaWduZWQtb2ZmLWJ5OiBXZW4gR29uZyA8d2dvbmdAY29kZWF1cm9yYS5vcmc+Cj4gLS0t
Cj4gICBkcml2ZXJzL25ldC93aXJlbGVzcy9hdGgvYXRoMTFrL21hYy5jIHwgNCArKysrCj4gICAx
IGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
bmV0L3dpcmVsZXNzL2F0aC9hdGgxMWsvbWFjLmMgYi9kcml2ZXJzL25ldC93aXJlbGVzcy9hdGgv
YXRoMTFrL21hYy5jCj4gaW5kZXggYzczYjJkZTExYWUzLi40YzU5Y2VhMzQxNzQgMTAwNjQ0Cj4g
LS0tIGEvZHJpdmVycy9uZXQvd2lyZWxlc3MvYXRoL2F0aDExay9tYWMuYwo+ICsrKyBiL2RyaXZl
cnMvbmV0L3dpcmVsZXNzL2F0aC9hdGgxMWsvbWFjLmMKPiBAQCAtNDEyMyw2ICs0MTIzLDEwIEBA
IGF0aDExa19jcmVhdGVfdmh0X2NhcChzdHJ1Y3QgYXRoMTFrICphciwgdTMyIHJhdGVfY2FwX3R4
X2NoYWlubWFzaywKPiAgIAl2aHRfY2FwLnZodF9zdXBwb3J0ZWQgPSAxOwo+ICAgCXZodF9jYXAu
Y2FwID0gYXItPnBkZXYtPmNhcC52aHRfY2FwOwo+ICAgCj4gKwlpZiAoYXItPnBkZXYtPmNhcC5u
c3NfcmF0aW9fZW5hYmxlZCkKPiArCQl2aHRfY2FwLnZodF9tY3MudHhfaGlnaGVzdCB8PQo+ICsJ
CQljcHVfdG9fbGUxNihJRUVFODAyMTFfVkhUX0VYVF9OU1NfQldfQ0FQQUJMRSk7Cj4gKwo+ICAg
CWF0aDExa19zZXRfdmh0X3R4YmZfY2FwKGFyLCAmdmh0X2NhcC5jYXApOwo+ICAgCj4gICAJcnht
Y3NfbWFwID0gMDsKPiAKCgotLSAKYXRoMTFrIG1haWxpbmcgbGlzdAphdGgxMWtAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2F0
aDExawo=
