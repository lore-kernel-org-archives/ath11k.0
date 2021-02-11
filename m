Return-Path: <SRS0=Y6aC=HN=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2899C433DB
	for <ath11k@archiver.kernel.org>; Thu, 11 Feb 2021 22:24:02 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9D402601FD
	for <ath11k@archiver.kernel.org>; Thu, 11 Feb 2021 22:24:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9D402601FD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=justinmp.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=TrE1R06cUNBeE87Tc/xyiX/a55R28ukZ2mu3uFkh3wI=; b=LYNwa7msUurDGj2f4WKy6wr7z
	N9xgMnjLRPKVJWrl6F8jKya0J2CfnSz/Lr0BkQPuc3sOxqUju48f56P6zyWzBr96gk1hwHaZn+8ao
	cviI2NXiiMB5Aw62rLOY7r/f8w6HE3gsp9aXtV99tZMEYuqBFrUNgnmSxkGDs4NyjiYMycaPdHrBM
	TjHtbPPOwPIsEcnfxsD5VfnW2qsdUChSTg3E/fuKmWrxXj1KwtpT5wNoi9TkTERD05pLBuY6IpqbA
	R2OoQAHY8Pb2MrJ/BqSLhLs9Phnpe++3KrCA+ni3I+Fck+Ps/uQpBvofqdJMGdCGOWErJeP/LrDfy
	bRruVqhkA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lAKNS-0004pG-6R; Thu, 11 Feb 2021 22:23:58 +0000
Received: from mail-qt1-x830.google.com ([2607:f8b0:4864:20::830])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lAKNQ-0004oa-Ak
 for ath11k@lists.infradead.org; Thu, 11 Feb 2021 22:23:57 +0000
Received: by mail-qt1-x830.google.com with SMTP id n28so5379362qtv.12
 for <ath11k@lists.infradead.org>; Thu, 11 Feb 2021 14:23:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=justinmp-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=v5EERyiquxYoSfHQnqlQuHmdqSwKPQcsKyX8Zbg+XO4=;
 b=0D61rYXII20k5ZzzLdUvYfsg8Y/4c6UFQ1ZZ8Jyb9I/3BrecXceK3Q6sfpIRLZCobH
 mZalvctCzcFWyaZZgNzkmB9q+kXpnS0FrXqvvruTIIwsMabcXv7s46h/IPo6acLTeuBG
 1J8FtY6MDik8ujtC8Y10s1kPOdvI1jSivX5rFyGOa+yTJSIbwGOgkg0LoRQWrji/q2b4
 EmgFdcD1cKCnJYSN8/cG7AUc06EKCM0m4mwBrOcRG+Mu35ku4VmP0FdZNgW5noWfgHyL
 ewXidqjZQE7z2uoiR7L13fi1tGXUJHooFAIghzghTEhRGBRbJ//H33OGlNV3sveffRXE
 FxsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=v5EERyiquxYoSfHQnqlQuHmdqSwKPQcsKyX8Zbg+XO4=;
 b=qyziFcLDdfI2AHkvVbtHC8E6RvPpnOh9U50jg/Cb7vKIfvhxe0yxg4dWedRk979t2H
 sOf7HQ0SuxZv27tq/SYHNwWlHFDxjQlSAXjbnrR8NGGr13wAiunVgAA4LUhui1FcYJAy
 Zl7Y1xJK8X8YSP887lRQFeNbXRjsMJgozU1z809gxpcdcWXM7AAO4IHY715iJrt16ROr
 9wByhUW85HKYmt8v+gohVHCgDkt+812CKaece8sWlSntsyMxt9ZpTPjHIzdAXqjyfW1p
 Jqpu93fw2znI9ew2IrDAi6c8eZbfhzbfODl0QB/b8tpSp/w4kdoiWgjLvb4j4wwUR510
 B07Q==
X-Gm-Message-State: AOAM533iPvbr2WZAIiSjci9FRYdZHO+loxy7ApWsQYAhDhz5Bp6pKN0j
 rBNRzRGM4H6jbHAPk3CJ95rL2F317kV1zA==
X-Google-Smtp-Source: ABdhPJwwj8pBJr95jNYZ3Uwa0RGYeV/69grMIjIOhHSbSN4hTvWQjMYMq803ss11RuA7mzq3oYuXdw==
X-Received: by 2002:ac8:184:: with SMTP id x4mr9750289qtf.99.1613082230899;
 Thu, 11 Feb 2021 14:23:50 -0800 (PST)
Received: from ?IPv6:2601:184:4a7f:a732::1f1? ([2601:184:4a7f:a732::1f1])
 by smtp.gmail.com with ESMTPSA id p188sm4966091qkf.40.2021.02.11.14.23.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Feb 2021 14:23:49 -0800 (PST)
Subject: Re: ath11k: qca6390 firmware crashes while connecting to 160 MHz
 channel
To: Kalle Valo <kvalo@codeaurora.org>
References: <87blew3e4q.fsf@codeaurora.org> <87blew3e4q.fsf@codeaurora.org>
 <054ddea6-639e-c21e-d404-d551c65128df@justinmp.com>
 <920c8cc9-21fb-b7aa-4b49-be7656fb14b5@justinmp.com>
 <f776233a-0ed6-1ebc-3d68-be4a88514736@justinmp.com>
 <874kkfozhp.fsf@codeaurora.org>
 <a170a87b-072d-dc8e-6833-231e0df5b23c@justinmp.com>
 <875z2yuafn.fsf_-_@codeaurora.org>
From: Justin Mazzola Paluska <jmp@justinmp.com>
Message-ID: <5fd39674-d513-c28e-5469-693d96e804c0@justinmp.com>
Date: Thu, 11 Feb 2021 17:23:47 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <875z2yuafn.fsf_-_@codeaurora.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210211_172356_556255_4A79157A 
X-CRM114-Status: GOOD (  13.76  )
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
Cc: ath11k@lists.infradead.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

T24gMi8xMS8yMSA2OjEwIEFNLCBLYWxsZSBWYWxvIHdyb3RlOgo+IChjaGFuZ2luZyB0aGUgdGl0
bGUgdG8gZmluZCB0aGlzIGVhc2llcikKPgo+IEp1c3RpbiBNYXp6b2xhIFBhbHVza2EgPGptcEBq
dXN0aW5tcC5jb20+IHdyaXRlczoKPgo+PiBPbiAxMi8yMS8yMCAxMjoxMSBQTSwgS2FsbGUgVmFs
byB3cm90ZToKPj4+PiBNeSByb3V0ZXIgc3VwcG9ydHMgMTYwIE1IeiBjaGFubmVscyBpbiB0aGUg
NSBHSHogYmFuZHMgWzFdLsKgIEkKPj4+PiBzd2l0Y2hlZCB0aGUgcm91dGVyIHRvIGFkdmVydGlz
aW5nIDgwIE1IeiBjaGFubmVscyBhbmQgdGhlIGNhcmQgY291bGQKPj4+PiBjb25uZWN0Lgo+Pj4g
VGhhbmtzIGZvciB0aGUgZGV0YWlsZWQgZGVidWdnaW5nLCB0aGlzIHNob3VsZCBoZWxwIHVzIHJl
cHJvZHVjaW5nIHRoZQo+Pj4gcHJvYmxlbS4gV2hhdCdzIHRoZSBleGFjdCBvcGVud3J0IHZlcnNp
b24geW91IGFyZSB1c2luZz8KPj4gVGhlIE9wZW5XUlQgdmVyc2lvbiBpczoKPj4KPj4gT3Blbldy
dCAxOS4wNy41IHIxMTI1Ny01MDkwMTUyYWUzIC8gTHVDSSBvcGVud3J0LTE5LjA3IGJyYW5jaAo+
PiBnaXQtMjAuMzQxLjU3NjI2LTUxZjU1YjUKPj4KPj4gKFRoaXMgaXMgdGhlIGxhdGVzdCBzdGFi
bGUgcmVsZWFzZS4pCj4gVGhhbmtzLiBJIGdvdCBhIHJlcG9ydCB0aGF0IHRoaXMgbWlnaHQgYmUg
ZHVlIHRvIGNvbW1pdCAzNTc5OTk0NDc2YjYKPiAoIndpcmVsZXNzOiBmaXggd3JvbmcgMTYwLzgw
KzgwIE1IeiBzZXR0aW5nIikuIENhbiB5b3UgdHJ5IHJldmVydGluZyB0aGUKPiBjb21taXQganVz
dCB0byBjb25maXJtIHdlIGFyZSBzZWVpbmcgdGhlIHNhbWUgaXNzdWU/CgpJIHdpbGwgdHJ5IG92
ZXIgdGhlIHdlZWtlbmQuwqAgU2hhbGwgSSBzdGlsbCB1c2UgdGhlIAphdGgxMWstcWNhNjM5MC1i
cmluZ3VwIGJyYW5jaCBvciBzb21ldGhpbmcgZWxzZT/CoCAoSSdtIHN0aWxsIHJ1bm5pbmcgdGhl
IAphdGgxMWstcWNhNjM5MC1icmluZ3VwIGJyYW5jaCBvbiBteSBsYXB0b3ApLgogwqDCoMKgIC0t
SnVzdGluCgotLSAKYXRoMTFrIG1haWxpbmcgbGlzdAphdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2F0aDExawo=
