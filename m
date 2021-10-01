Return-Path: <SRS0=G+gt=OV=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0916C433EF
	for <ath11k@archiver.kernel.org>; Fri,  1 Oct 2021 11:17:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9326161A84
	for <ath11k@archiver.kernel.org>; Fri,  1 Oct 2021 11:17:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9326161A84
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=osK3uyzsc1BUkhDCq21j8RddPDfSsiYhZdliVbRDKOs=; b=1fdruPSOZGNCzB
	FmZZTZUroiMVmDOhEEbBzPxRl52aF8teqLQEmBGIoDrhniLgXFvMoqiz4InsGGqmZyVlH4666IVlm
	jc7ijJH8wfgIDhqaL2Q1DKM1KupyEjnM8W/f0PeRmF6Hwga1aljHyy3uP4KhhhU+HhjMN9NscUTa8
	NSJsOtY3885r9UG6zP3W8mz3N3EUlDuc8gM+zZBYI4z+yPk5Tf1UJUePvNKY/K6iBc2UnUa+nq9Z0
	KBF++BUC6c6TKhTuP3ueFJtSAx8qpk5TFPv8V7Q+C+DAMHITEiW/k5Q2BdRDTwdSjte5ueL7AVJZa
	G9O/FRZzQm1i+poKnQeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mWGY5-00HZfF-Lc; Fri, 01 Oct 2021 11:17:53 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mWGY1-00HZda-LY; Fri, 01 Oct 2021 11:17:51 +0000
Received: by mail-wm1-x32b.google.com with SMTP id z2so6949354wmc.3;
 Fri, 01 Oct 2021 04:17:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=/daOxNeMRBqAQ9qFc9dbkkcOID+IWuEhIuLuYmnrND8=;
 b=bAOeC9AJaZ6n3huKl2ky8zQJUv2CJqws9i8ZJIwYTltlKeJqyhxKVlP+EWSYfLlAW0
 78I60qmqdCvLi4j7YCNXk0f2Jt2Vhp0eR2uGcvzBbiGcYhT0ueKIoQa/GUruM3mR29g4
 HMMte/mPGqMPdC/tjoHEBrV465ypl8+DvJKll48fzbhDtG9io3ngigBeJVtgZgEm5Lcu
 zXtChJHa1OEvWWDuXq6yP3xNN6E0G3aVvYBpdO3Wo146Vfao8FujkIE6Ib+3X+sLWhR4
 DONQ1CC+sCIbu9z/z+EGpjsGIJWXrssEuEcvBEspaOGJKKUXqhogW6ECevgEPyT5x4kZ
 vF7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=/daOxNeMRBqAQ9qFc9dbkkcOID+IWuEhIuLuYmnrND8=;
 b=LW4t4XFAANI/DZlagqtLSn7CrHKUWyfsyaAdYwf4s3wLz9OFEqkCyzYsKSxeLA++PA
 Cui7di5KMAL5wG2t38Y9Z3yH2u4ctKsX6tLx8aGVgNluKRu3IH/QaeGPGRKEA8DjcBWz
 HPWtgWO8Uk/9w3X6x0LpPRO0aG+y5FVyG4K8CIgIGmYJWWxObmlCjhTJbI9I0X2yV6Y2
 0E8ZGFDzAkymeX7zb99XjWpAiRadJVbE75yjBJLrs/InWGE5jn+vwlKBBnjv8NaY9tqU
 2ZoSbKKc2y4q8USFarwnyTo4ggOQbVZy+wQCyQA0Lv9BTv5ta8ocQjCPOU2LfBgbtXy2
 toPg==
X-Gm-Message-State: AOAM532dSrBVvwUdYPuTreuh6Uo99FX9gm/umpwwEX4vMGNfvrdA8baB
 2ivKZfAJcpVtnmDpXH+h7Tw=
X-Google-Smtp-Source: ABdhPJwrmN6K45pUi+Y7WuZleS9c1EVmueCrA6kIQje16YW9M5oY/cTvF5XrwHtjnZHJD78UCNPBGA==
X-Received: by 2002:a1c:ac81:: with SMTP id v123mr3979971wme.94.1633087061988; 
 Fri, 01 Oct 2021 04:17:41 -0700 (PDT)
Received: from [192.168.1.6] ([171.49.254.68])
 by smtp.gmail.com with ESMTPSA id v13sm2507895wrp.64.2021.10.01.04.17.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 Oct 2021 04:17:41 -0700 (PDT)
Message-ID: <6436bf9c-02fc-06b0-eb27-15a33b64abe0@gmail.com>
Date: Fri, 1 Oct 2021 16:47:30 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.2
Subject: Re: Qualcomm Atheros Ath10k and Ath11k CE Buffer DMA alignment issues
 on Raspberry PI CM4 - Aarch64 architecture
Content-Language: en-US
To: Kalle Valo <kvalo@codeaurora.org>,
 Maurice Smulders <Maurice.Smulders@windtalker.com>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
 ath10k@lists.infradead.org, ath11k@lists.infradead.org
References: <35F57D80-C7F7-47B2-BEC8-533006C72E2A@windtalker.com>
 <87lf3d5jxo.fsf@tynnyri.adurom.net>
From: Govind Singh <govind.sk85@gmail.com>
In-Reply-To: <87lf3d5jxo.fsf@tynnyri.adurom.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211001_041749_745792_277FF259 
X-CRM114-Status: GOOD (  14.12  )
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

Ck9uIDAxLTEwLTIwMjEgMTI6MDgsIEthbGxlIFZhbG8gd3JvdGU6Cj4gTWF1cmljZSBTbXVsZGVy
cyA8TWF1cmljZS5TbXVsZGVyc0B3aW5kdGFsa2VyLmNvbT4gd3JpdGVzOgo+Cj4+IEkgYW0gdHJ5
aW5nIHRvIHVzZSB0aGUgUUNBNjE3NEEgYW5kIHRoZSBRQ0E2MzkwIG9uIGEgY3VzdG9tIGJvYXJk
IHVzaW5nIGEgUENJZSBzd2l0Y2ggLSBidXQgdGhhdCBkb2Vzbid0IG1hdHRlciAtIEl0IHN0aWxs
IGZhaWxzIHcvbyB0aGUgc3dpdGNoOgo+Pgo+PiBsc3BjaQo+PiAwMDowMC4wIFBDSSBicmlkZ2U6
IEJyb2FkY29tIEluYy4gYW5kIHN1YnNpZGlhcmllcyBCQ00yNzExIFBDSWUgQnJpZGdlIChyZXYg
MjApCj4+IDAxOjAwLjAgUENJIGJyaWRnZTogUGVyaWNvbSBTZW1pY29uZHVjdG9yIFBJN0M5WDJH
NjA4R1AgUENJZTIgNi1Qb3J0LzgtTGFuZSBQYWNrZXQgU3dpdGNoCj4+IDAyOjAxLjAgUENJIGJy
aWRnZTogUGVyaWNvbSBTZW1pY29uZHVjdG9yIFBJN0M5WDJHNjA4R1AgUENJZTIgNi1Qb3J0Lzgt
TGFuZSBQYWNrZXQgU3dpdGNoCj4+IDAyOjAyLjAgUENJIGJyaWRnZTogUGVyaWNvbSBTZW1pY29u
ZHVjdG9yIFBJN0M5WDJHNjA4R1AgUENJZTIgNi1Qb3J0LzgtTGFuZSBQYWNrZXQgU3dpdGNoCj4+
IDAyOjAzLjAgUENJIGJyaWRnZTogUGVyaWNvbSBTZW1pY29uZHVjdG9yIFBJN0M5WDJHNjA4R1Ag
UENJZTIgNi1Qb3J0LzgtTGFuZSBQYWNrZXQgU3dpdGNoCj4+IDAyOjA0LjAgUENJIGJyaWRnZTog
UGVyaWNvbSBTZW1pY29uZHVjdG9yIFBJN0M5WDJHNjA4R1AgUENJZTIgNi1Qb3J0LzgtTGFuZSBQ
YWNrZXQgU3dpdGNoCj4+IDAyOjA1LjAgUENJIGJyaWRnZTogUGVyaWNvbSBTZW1pY29uZHVjdG9y
IFBJN0M5WDJHNjA4R1AgUENJZTIgNi1Qb3J0LzgtTGFuZSBQYWNrZXQgU3dpdGNoCj4+IDA1OjAw
LjAgVW5hc3NpZ25lZCBjbGFzcyBbZmYwMF06IFF1YWxjb21tIFFDQTYzOTAgV2lyZWxlc3MgTmV0
d29yayBBZGFwdGVyIFtBWDUwMC1EQlMgKDJ4MildCj4+IDA2OjAwLjAgTmV0d29yayBjb250cm9s
bGVyOiBRdWFsY29tbSBBdGhlcm9zIFFDQTYxNzQgODAyLjExYWMgV2lyZWxlc3MgTmV0d29yayBB
ZGFwdGVyIChyZXYgMzIpCj4+Cj4+IEJvdGggZGV2aWNlIGRyaXZlcnMgZG8gbm90IHdvcmsuIEkg
Y2hhbmdlZCB0aGUgQ0UgY29kZSB0byB1c2UgdGhlIEdGUF9ETUEzMiBmbGFnIGFzIGFuIGF0dGVt
cHQgdG8gYWxsb2NhdGUgdGhlIG1lbW9yeSBjb3JyZWN0bHksIGJ1dCBETUVTRyBzaG93cwo+Pgo+
PiBbcGlAbm9kZTY3NDUgfl0kIGRtZXNnIHwgZ3JlcCBhdGgKPj4gW8KgwqDCoMKgNS44MDE4OTZd
IGF0aDEwa19wY2kgMDAwMDowNjowMC4wOiBhdGgxMGtfY2VfYWxsb2Nfc3JjX3Jpbmc6IE5vdCB1
bmFsaWduZWQgPC0tLSBVc2VyIG1lc3NhZ2UgZXhpdCBmcm9tIHRoaXMgZnVuY3Rpb24KPj4gW8Kg
wqDCoMKgNS44MDQyODRdIGF0aDEwa19wY2kgMDAwMDowNjowMC4wOiBmYWlsZWQgdG8gYWxsb2Mg
Q0Ugc3JjIHJpbmcgMDogLTEyCj4+IFvCoMKgwqDCoDUuODEzMTM4XSBhdGgxMGtfcGNpIDAwMDA6
MDY6MDAuMDogZmFpbGVkIHRvIGFsbG9jYXRlIGNvcHkgZW5naW5lIHBpcGUgMDogLTEyCj4+IFvC
oMKgwqDCoDUuODE1NDE0XSBhdGgxMGtfcGNpIDAwMDA6MDY6MDAuMDogZmFpbGVkIHRvIGFsbG9j
YXRlIGNvcHkgZW5naW5lIHBpcGVzOiAtMTIKPj4gW8KgwqDCoMKgNS44MTgwMDJdIGF0aDEwa19w
Y2kgMDAwMDowNjowMC4wOiBmYWlsZWQgdG8gc2V0dXAgcmVzb3VyY2U6IC0xMgo+PiBbwqDCoMKg
wqA1LjgyNjk1M10gYXRoMTBrX3BjaTogcHJvYmUgb2YgMDAwMDowNjowMC4wIGZhaWxlZCB3aXRo
IGVycm9yIC0xMgo+PiBbwqDCoMKgwqA1Ljg1NTk5M10gYXRoMTFrX3BjaSAwMDAwOjA1OjAwLjA6
IFdBUk5JTkc6IGF0aDExayBQQ0kgc3VwcG9ydCBpcyBleHBlcmltZW50YWwhCj4+IFvCoMKgwqDC
oDUuODk2MTQ4XSBhdGgxMWtfcGNpIDAwMDA6MDU6MDAuMDogQkFSIDA6IGFzc2lnbmVkIFttZW0g
MHg2MDAwMDAwMDAtMHg2MDBmZmZmZmYgNjRiaXRdCj4+IFvCoMKgwqDCoDUuOTAwMjM2XSBhdGgx
MWtfcGNpIDAwMDA6MDU6MDAuMDogZW5hYmxpbmcgZGV2aWNlICgwMDAwIC0+IDAwMDIpCj4+IFvC
oMKgwqDCoDUuOTE0MDUwXSBhdGgxMWtfcGNpOiBwcm9iZSBvZiAwMDAwOjA1OjAwLjAgZmFpbGVk
IHdpdGggZXJyb3IgLTEyCj4+Cj4+IEVycm9yIC0xMiAoRU5PTUVNKSBnZXRzIHJldHVybmVkIGFu
ZCB0aGUgZHJpdmVyIGRvZXNuJ3Qgd29yay4uLgo+Pgo+PiAwNTowMC4wIFVuYXNzaWduZWQgY2xh
c3MgW2ZmMDBdOiBRdWFsY29tbSBRQ0E2MzkwIFdpcmVsZXNzIE5ldHdvcmsgQWRhcHRlciBbQVg1
MDAtREJTICgyeDIpXQo+PiBTdWJzeXN0ZW06IFF1YWxjb21tIERldmljZSAwMTA4Cj4+IENvbnRy
b2w6IEkvTy0gTWVtKyBCdXNNYXN0ZXItIFNwZWNDeWNsZS0gTWVtV0lOVi0gVkdBU25vb3AtIFBh
ckVyci0gU3RlcHBpbmctIFNFUlItIEZhc3RCMkItIERpc0lOVHgtCj4+IFN0YXR1czogQ2FwKyA2
Nk1Iei0gVURGLSBGYXN0QjJCLSBQYXJFcnItIERFVlNFTD1mYXN0ID5UQWJvcnQtIDxUQWJvcnQt
IDxNQWJvcnQtID5TRVJSLSA8UEVSUi0gSU5UeC0KPj4gUmVnaW9uIDA6IE1lbW9yeSBhdCA2MDAw
MDAwMDAgKDY0LWJpdCwgbm9uLXByZWZldGNoYWJsZSkgW3NpemU9MTZNXQo+PiBDYXBhYmlsaXRp
ZXM6IDxhY2Nlc3MgZGVuaWVkPgo+PiBLZXJuZWwgbW9kdWxlczogYXRoMTFrX3BjaQo+Pgo+PiAw
NjowMC4wIE5ldHdvcmsgY29udHJvbGxlcjogUXVhbGNvbW0gQXRoZXJvcyBRQ0E2MTc0IDgwMi4x
MWFjIFdpcmVsZXNzIE5ldHdvcmsgQWRhcHRlciAocmV2IDMyKQo+PiBTdWJzeXN0ZW06IEFTVVNU
ZUsgQ29tcHV0ZXIgSW5jLiBEZXZpY2UgODZlMAo+PiBDb250cm9sOiBJL08tIE1lbS0gQnVzTWFz
dGVyLSBTcGVjQ3ljbGUtIE1lbVdJTlYtIFZHQVNub29wLSBQYXJFcnItIFN0ZXBwaW5nLSBTRVJS
LSBGYXN0QjJCLSBEaXNJTlR4LQo+PiBTdGF0dXM6IENhcCsgNjZNSHotIFVERi0gRmFzdEIyQi0g
UGFyRXJyLSBERVZTRUw9ZmFzdCA+VEFib3J0LSA8VEFib3J0LSA8TUFib3J0LSA+U0VSUi0gPFBF
UlItIElOVHgtCj4+IEludGVycnVwdDogcGluIEEgcm91dGVkIHRvIElSUSA0OAo+PiBSZWdpb24g
MDogTWVtb3J5IGF0IDYwMTAwMDAwMCAoNjQtYml0LCBub24tcHJlZmV0Y2hhYmxlKSBbZGlzYWJs
ZWRdIFtzaXplPTJNXQo+PiBDYXBhYmlsaXRpZXM6IDxhY2Nlc3MgZGVuaWVkPgo+PiBLZXJuZWwg
bW9kdWxlczogYXRoMTBrX3BjaQo+Pgo+PiBJIGFtIGF0IGEgbG9zcyB3aGF0IHRvIGRvIGhlcmUu
IFRoZSBhdGgxMWsgZHJpdmVyIGhhcyB0aGUgU0lOR0xFIE1TSSBmaXggYnVpbHQgaW4uCj4+Cj4+
IEFueSBpZGVhcycgd2hhdCBJIGNhbiB0cnkgdG8gZml4IHRoaXMgcHJvYmxlbSBvbiB0aGUgcmFz
cGJlcnJ5IFBpIENNND8KPiBTb3JyeSwgbm8gaWRlYXMuIEJ1dCBhZGRpbmcgYXRoMTBrIGFuZCBh
dGgxMWsgbGlzdHMsIG1heWJlIHBlb3BsZSB0aGVyZQo+IGNhbiBwcm9wb3NlIHNvbWV0aGluZy4K
SW4gUlBJIENNNCBib2FyZCwgcGNpZS0zMmJpdC1kbWEgY29uZmlndXJhdGlvbiBpcyByZXF1aXJl
ZCBmb3IgClFDQTYxNzQvUUNBOTg4MCBtb2R1bGUsIHdoaWNoIGNhbiBiZSBlbmFibGVkIHVzaW5n
IGR0IG92ZXJsYXkuIEFsc28sIHlvdSAKd2lsbCBoYXZlIHRvIGVuYWJsZSBsZWdhY3kgUENJIElS
USBtb2RlKHVzaW5nIG1vZHBhcmFtQGF0aDEwa19wY2kgCmlycV9tb2RlPTEpIGFzIE1TSSBkb2Vz
IG5vdCB3b3JrLgoKRFQgb3ZlcmxheSBjaGFuZ2U6CjU2YjhiMmM5NjExODI5M2FkNmRlYzIwMjAz
ZGFkYTgxMTZmN2M2NjQ6b3ZlcmxheXM6IEFkZCBwY2llLTMyYml0LWRtYSAKb3ZlcmxheQoKCkJS
LAoKR292aW5kCgoKCi0tIAphdGgxMWsgbWFpbGluZyBsaXN0CmF0aDExa0BsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vYXRoMTFr
Cg==
