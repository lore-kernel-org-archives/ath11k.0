Return-Path: <SRS0=ZsjY=HG=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E7A9C433DB
	for <ath11k@archiver.kernel.org>; Thu,  4 Feb 2021 03:09:02 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9B5E364DA1
	for <ath11k@archiver.kernel.org>; Thu,  4 Feb 2021 03:09:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9B5E364DA1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=eero.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=1/QV57kMyvbRustqbHvC4vz3RXup7I4pcW31RG+OG44=; b=VQ9Dd1PvsFOie51Y4JQ6cW6zF
	xYH4z/OxF7HRr7bjEa4x9bnNbFY0Bgoks51Z+0YrLJB+z8K+bMaUtJvrh16C92SKdRhvNEQr/caI1
	kJ8Juihko4YkVSf9m2UhE3ax7OvFNyiAv6IlVcfdYad7uAjz4LVIf0wfgxA4Q5usp9gdQdSU+60JW
	saepGDL/5Ed8loE0cHnPPgieo4YHj1ppLIRK6WVuO5XYJ+PhorxYThECQ/KxKU8yatp5p4doepoe4
	uSA3oSj56BlFivl//k7sD7/oF5F0OT6sU2NfBqjuqpSpyA0mHG8ESh2OkS2zgDJEMxbYVnZkEYvlP
	9v93rVGEg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l7V0r-0005oq-0W; Thu, 04 Feb 2021 03:08:57 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l7V0n-0005oT-TE
 for ath11k@lists.infradead.org; Thu, 04 Feb 2021 03:08:55 +0000
Received: by mail-pl1-x62b.google.com with SMTP id x9so987929plb.5
 for <ath11k@lists.infradead.org>; Wed, 03 Feb 2021 19:08:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eero.com; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=X5SP/RYZJKYSVivEWNfD0sIb8eTHHQjIvVqVxhsjpNg=;
 b=lxDReiF9ZKqvpQzv+XoaPGetd5FSdV1f4kSyHLXdfcb+/mN08Uf3L+QmPrKihGKe5H
 CoZtii394Zbd7oIE1EmEh6b97FIppxZJX8B25be6AZGHP0HfRjL5O3X3m3ND69iwC21o
 nt65bLUp3ciIjOQs2033B+hgGxBO57jDNVqJU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=X5SP/RYZJKYSVivEWNfD0sIb8eTHHQjIvVqVxhsjpNg=;
 b=Auwc8SZQl23zJQWA5Z+Vu7sALvd0m7oXVEkTcm1e1kLTr15mzbse4xqw0hEvCmcHhD
 el2zijxYYAwm+at0EGeeY6bp7bBAZjyF/3Jiyz7YAZxHpO4UK6Mw8ngtYhVDGP7VWtrE
 YVpxjed1kbiiNg89fHDhNPpBN5Sr56dnu94n1wYNID4TrU1v4pGQt6FTs14z71rDZaXn
 mfO2oH9ujXb7WCMMp3CkrkDjBPFsKVNzIdB3T6sKB5p/VXFxboKlBidVI7SMJPKoUeBt
 Iq3DC9pi/E+1TkzID/db0bJZuASOOPeiG7WM/ReRLg1fjWrYcFOnzmIwQMGJXPhXAYeh
 Pc0g==
X-Gm-Message-State: AOAM5305pJVstg3Do09y0SMBLsUYvSQu7nQZjIaAqpVzRWbXqh7lovbJ
 0c2U4dmhFjqS4nV/zCf9b70PQLM8x6Irkz4O
X-Google-Smtp-Source: ABdhPJxOwJump7KatZyew1+XbzPkief5EiCZBvjXqLCkOGNgj5cm/+obj745U8VvLzeme3/ueAMtnw==
X-Received: by 2002:a17:90a:b703:: with SMTP id
 l3mr5966492pjr.60.1612408131594; 
 Wed, 03 Feb 2021 19:08:51 -0800 (PST)
Received: from [192.168.4.200]
 (107-196-182-50.lightspeed.sntcca.sbcglobal.net. [107.196.182.50])
 by smtp.gmail.com with ESMTPSA id v126sm1822305pfv.163.2021.02.03.19.08.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Feb 2021 19:08:51 -0800 (PST)
Subject: Re: [PATCH] ath11k: Update tx descriptor search index properly
To: Karthikeyan periyasamy <periyasa@codeaurora.org>
References: <1608305041-21946-1-git-send-email-periyasa@codeaurora.org>
 <959ea12a-e35b-5867-c55e-7f62e2956b09@eero.com>
 <d6cbfd2aff787faa3be69252b2677df9@codeaurora.org>
 <08ef5e10-de7a-fe13-d23a-d1afa1dbd0e5@eero.com>
 <ea757176a6438f1b0cf9bee41f8a9f8c@codeaurora.org>
From: Peter Oh <peter.oh@eero.com>
Message-ID: <dc8f531f-2ab5-f690-2b94-917880682fcc@eero.com>
Date: Wed, 3 Feb 2021 19:08:49 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <ea757176a6438f1b0cf9bee41f8a9f8c@codeaurora.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210203_220854_095504_4621E868 
X-CRM114-Status: GOOD (  14.12  )
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
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Ck9uIDIvMy8yMSA1OjA4IFBNLCBLYXJ0aGlrZXlhbiBwZXJpeWFzYW15IHdyb3RlOgo+IE9uIDIw
MjEtMDItMDQgMDA6NTksIFBldGVyIE9oIHdyb3RlOgo+PiBPbiAxLzI2LzIxIDY6NDYgUE0sIEth
cnRoaWtleWFuIHBlcml5YXNhbXkgd3JvdGU6Cj4+PiBPbiAyMDIwLTEyLTE5IDAwOjUzLCBQZXRl
ciBPaCB3cm90ZToKPj4+PiBPbiAxMi8xOC8yMCA3OjI0IEFNLCBLYXJ0aGlrZXlhbiBQZXJpeWFz
YW15IHdyb3RlOgo+Pj4+PiBUeCBkZXNjcmlwdG9yIHNlYXJjaCBpbmRleCBmaWVsZCBzaG91bGQg
YmUgdXBkYXRlZCB3aXRoIGh3IHBlZXIgaWQKPj4+Pj4gYW5kIG5vdCBieSBBU1QgSGFzaC4gSW5j
b3JyZWN0IHNlYXJjaCBpbmRleCBjYXVzZXMgdGhyb3VnaHB1dCAKPj4+Pj4gZGVncmFkYXRpb24K
Pj4+Pj4gaW4gYWxsIHRoZSBwbGF0Zm9ybXMuIHNvIHVwZGF0ZWQgdGhlIHNlYXJjaCBpbmRleCBm
aWVsZCB3aXRoIGh3IAo+Pj4+PiBwZWVyIGlkLAo+Pj4+PiB3aGljaCBpcyBhIGNvbW1vbiBjaGFu
Z2UgYXBwbGljYWJsZSBmb3IgYWxsIHRoZSBwbGF0Zm9ybXMuCj4+Pj4+Cj4+Pj4+IFRlc3RlZC1v
bjogSVBRODA3NCBodzIuMCBBSEIgCj4+Pj4+IFdMQU4uSEsuMi40LjAuMS0wMTQ5Mi1RQ0FIS1NX
UExfU0lMSUNPTlotMQo+Pj4+Pgo+Pj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9uZXQvd2lyZWxl
c3MvYXRoL2F0aDExay9wZWVyLmMgCj4+Pj4+IGIvZHJpdmVycy9uZXQvd2lyZWxlc3MvYXRoL2F0
aDExay9wZWVyLmMKPj4+Pj4gaW5kZXggYjY5ZTdlYi4uZjQ5YWJlZmEgMTAwNjQ0Cj4+Pj4+IC0t
LSBhL2RyaXZlcnMvbmV0L3dpcmVsZXNzL2F0aC9hdGgxMWsvcGVlci5jCj4+Pj4+ICsrKyBiL2Ry
aXZlcnMvbmV0L3dpcmVsZXNzL2F0aC9hdGgxMWsvcGVlci5jCj4+Pj4+Cj4+Pj4+IEBAIC0zMDks
NyArMzEwLDExIEBAIGludCBhdGgxMWtfcGVlcl9jcmVhdGUoc3RydWN0IGF0aDExayAqYXIsIAo+
Pj4+PiBzdHJ1Y3QgYXRoMTFrX3ZpZiAqYXJ2aWYsCj4+Pj4+IMKgwqDCoMKgwqDCoMKgIHBlZXIt
PnBkZXZfaWR4ID0gYXItPnBkZXZfaWR4Owo+Pj4+PiDCoMKgwqDCoMKgIHBlZXItPnN0YSA9IHN0
YTsKPj4+Pj4gLcKgwqDCoCBhcnZpZi0+YXN0X2hhc2ggPSBwZWVyLT5hc3RfaGFzaDsKPj4+Pj4g
Kwo+Pj4+PiArwqDCoMKgIGlmIChhcnZpZi0+dmlmLT50eXBlID09IE5MODAyMTFfSUZUWVBFX1NU
QVRJT04pIHsKPj4+Pj4gK8KgwqDCoMKgwqDCoMKgIGFydmlmLT5hc3RfaGFzaCA9IHBlZXItPmFz
dF9oYXNoOwo+Pj4+PiArwqDCoMKgwqDCoMKgwqAgYXJ2aWYtPmFzdF9pZHggPSBwZWVyLT5od19w
ZWVyX2lkOwo+Pj4+PiArwqDCoMKgIH0KPj4+Pgo+Pj4+IEhvdyBhYm91dCBub24gU1RBVElPTiB0
eXBlPwo+Pj4+Cj4+Pgo+Pj4gbm8gbmVlZCBvZiBjb25maWd1cmluZyB0aGUgYXN0X2lkeCwgYXN0
X2hhc2ggZmllbGQgZm9yIG5vbiBzdGF0aW9uIAo+Pj4gdHlwZS4gSXRzIHJlY29tbWVuZGVkIGJ5
IEhXL0ZXIHRlYW0uCj4+Pgo+PiBDYW4geW91IGFkZCB0aGlzIGNvbW1lbnQgaW4gY29tbWl0IG1l
c3NhZ2U/Cj4+Cj4KPiBzdXJlCj4KPj4gQWxzbyBjb3VsZCB5b3UgaW5jbHVkZSB0aGUgYW5zd2Vy
IHRvICJ3aGF0IGNvbmRpdGlvbnMgeW91IG9ic2VydmVkIHRoZQo+PiB0aHJvdWdocHV0IGRlZ3Jh
ZGF0aW9uPyIgaW4gY29tbWl0IG1lc3NhZ2UgdG9vPwo+Cj4gSW4gYWxsIHRoZSBzY2VuYXJpbyB3
aWxsIHNlZSBkZWdyYWRhdGlvbi4gSXRzIGEgZ2VuZXJhbCBpbXByb3ZlbWVudC4KPgpJdCBzb3Vu
ZHMgZ29vZCBhbmQgaXQgd2lsbCBiZXR0ZXIgaWYgeW91IHNoYXJlIHRoZSBudW1iZXIgYmVmb3Jl
IGFuZCAKYWZ0ZXIgdGhlIHBhdGNoLgoKClRoYW5rcywKClBldGVyCgoKLS0gCmF0aDExayBtYWls
aW5nIGxpc3QKYXRoMTFrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9hdGgxMWsK
