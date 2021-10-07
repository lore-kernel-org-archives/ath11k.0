Return-Path: <SRS0=tHTJ=O3=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAF41C433F5
	for <ath11k@archiver.kernel.org>; Thu,  7 Oct 2021 08:51:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7EB6060F6F
	for <ath11k@archiver.kernel.org>; Thu,  7 Oct 2021 08:51:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7EB6060F6F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jG5bXFkqvX0RRj83b+2NKQ8BANT3ow9gkjPUbdG5eQ0=; b=CR1i26slc/q2DTQ645vmsMoHcW
	gw/N+dNjVwrw2uDklVvNGdWB6OwIXbSc5bPVzLiPnE4PWIcJFJAZ+Qr3kdhKpGpUW4gV1nJC0f+Sr
	DzzF8pqmYdsAbs2aCQosBFl2opOFv3qwDaIrv5csiLtQoNyE7RA1UDYf+lYtz5trQRCbfUz50m01I
	x3aDpjIwSX4iO1KRfIgFbBJYdK6ayGUIfyeelgaHa5wE8c/ySmP3rkh3uF6O8u/ypxfO+FVPTn87t
	0nBrdALxsOPhG6CA2Ymk5u9iXCuXlmNm1JB7CgvWr4/uU1z49LaCWgaVpCyyfamlbkzw38Ixv2N7g
	CE6Ab6gQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mYP7y-00Gcht-AI; Thu, 07 Oct 2021 08:51:46 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mYP7w-00Gcgr-4X
 for ath11k@lists.infradead.org; Thu, 07 Oct 2021 08:51:45 +0000
Received: by mail-lf1-x12b.google.com with SMTP id j21so3807310lfe.0
 for <ath11k@lists.infradead.org>; Thu, 07 Oct 2021 01:51:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=B2eR2TqPGkaOItD4RRlwmOUHWetClYriSRqdtMrzMfQ=;
 b=cNsbXj1KzjuzfYaOlbd4d2nr8w/ro+t+YdgdgfmmFrgK6xFABFDIIqhJxksMGU9MjG
 fVjE3N2C93CdG73SoeyEfgOLycB7+4RXJYZPT6Q4wU/83M6pm/yzll6lARWTnBTnoy+B
 AFDDSbMrEUa5FdETmzDyxokG8QuKgHukiai3ufWr4bcZSkLPb+qvosXvremZNPPqXasB
 XqB5VgwYIWdh7NY3/ltDmpYZZJWv98015ZuRTO2zriaXa3FqnqtcgEUnncjYVgmJy2bZ
 ypd/3Hd0/DCyzGlFYT5vj+5gq27be7o5v+Bw5X/4gJY1hqsxveRfFjzTaEHcdcxihMnl
 p1kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=B2eR2TqPGkaOItD4RRlwmOUHWetClYriSRqdtMrzMfQ=;
 b=2FUWcSZeLxX1En0Enq7s0L28vcqxyzc/6fIkFP39eknItgQ0rQJQLNdPIVNrCMz9d5
 y4gJ5lLvzcBb+QqrhQFbGgv2nxRbpcrTkE1AHgGTstYLfuZfGlhrq8tVWmRjtIqGIEXr
 6RIs6Jk9W9sGaTqsMv7ShLbM8RK46LJumrw//SgvsQHOi6DltknrXKpU8bAfIj6PuAAp
 biflgzdtvGz4JzxOL+yOQ62DVpANR6I75KrBNt4dckd2Z6pXi97oBV+AOx1nWFtuYqzM
 Fg5Li1ReCbr1Ivrtq21aZymUXRlcSFqyqcDPtsKffHGQz/GMcx90isSfX3vSDszEEy01
 11rQ==
X-Gm-Message-State: AOAM533/tclI8xZ3zO4V16P7FhRConywLdYnFxaD5Cd6Fqo+UvqMfxOP
 gFKUiTJ1oGUChQ39ADqjjIkFHHuUtdyyy83n388=
X-Google-Smtp-Source: ABdhPJzlRREP44Klvd2SkwATLqBP/FE4O6gCCr4Y7zdZTMZtAxSj06MRKQ9j6oAeZCXlXWC4TtKWXQ==
X-Received: by 2002:a2e:9e42:: with SMTP id g2mr3226331ljk.483.1633596701885; 
 Thu, 07 Oct 2021 01:51:41 -0700 (PDT)
Received: from [192.168.2.114] ([109.106.141.149])
 by smtp.gmail.com with ESMTPSA id u15sm2711666lfl.20.2021.10.07.01.51.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Oct 2021 01:51:41 -0700 (PDT)
Subject: Re: Can not unload ath11k_pci and load it back
To: Kalle Valo <kvalo@codeaurora.org>
Cc: ath11k@lists.infradead.org
References: <190a1b14-0a8c-f1fb-9f0d-e25cc57034a7@gmail.com>
 <875yu9e4li.fsf@codeaurora.org>
 <8324ec52-303d-ea04-b635-a550e83ad47c@gmail.com>
 <87y275cm2x.fsf@codeaurora.org>
From: Mark Herbert <mark.herbert42@gmail.com>
Message-ID: <470fe764-f287-1d0c-7341-3e3ed3e46208@gmail.com>
Date: Thu, 7 Oct 2021 11:51:40 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <87y275cm2x.fsf@codeaurora.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211007_015144_220495_8F64AB1A 
X-CRM114-Status: GOOD (  22.74  )
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

SSd2ZSBtYW5nZWQgdG8gc3RhcnQgYSBjYXJkIHdpdGggbWhpIGNvbXBpbGVkIGFzIGEgbW9kdWxl
LiBJc3RlYWQgb2YgCmF1dG9sb2FkwqAgY29uZmlndXJlZCB0byBsYWQgbWhpIGluIGFkdmFuY2Us
IGJlZm9yZSBzeXN0ZW0gZGV0ZWN0cyAKYXRoMTFrLiBTbyB0aGUgY2FyZCBzdGFydHMuIHRoZW4g
SSB1bmxvYWQgYXRoMTFrX3BjaSwgcXRycl9taGkgLCBhbmQgCmZpbmFsbHkgbWhpLiBUaGVuIGxv
YWRpbmcgdGhlbSBiYWNrwqAgLSBtaGkgZmlyc3QsIHRoZW4gcXRyciBhbmQgZmluYWxseSAKYXRo
MTFfcGNpLiBTdGlsbCBzYW1lIHN0b3J5LsKgIEkndmUgYWxzbyB0cmllZCB0byB1bmxvYWQgbW9k
dWxlcywgdGhlbiAKaGliZXJuYXRlIHNvIGxhcHRvcCB3YXMgb2ZmIGZvciBhIHdoaWxlLiBUaGVu
IHJlc3VtZWQgYW5kIGxvYWRlZCB0aGUgCm1vZHVsZXMgbWFudWFsbHkuIE5vIGVmZmVjdC4KCk9u
IDA3LjEwLjIwMjEgMTA6NDgsIEthbGxlIFZhbG8gd3JvdGU6Cj4gTWFyayBIZXJiZXJ0IDxtYXJr
LmhlcmJlcnQ0MkBnbWFpbC5jb20+IHdyaXRlczoKPgo+PiBJJ3ZlIGZvdW5kIHNpbWlsYXIgYnVn
IGZpbGVzIGFscmVhZHkgLSBzbyBub3QgdG8gY3JlYXRlIGR1cGxpY2F0ZXMKPj4gc2ltcGx5IGNv
bW1lbnRlZCB0aGVyZQo+Pgo+PiBodHRwczovL2J1Z3ppbGxhLmtlcm5lbC5vcmcvc2hvd19idWcu
Y2dpP2lkPTIxNDU0MQo+Pgo+PiBFeGFjdGx5IC0gaGliZXJuYXRpb24gbWVhbnMgc2F2aW5nIHN0
YXRlIG9uIGRpc2sgYW5kIHJlc3VtaW5nIGxhdGVyLAo+PiBpdCBpcyBhIHZlcnkgdXNlZnVsbCBm
ZWF0dXJlIHdoZW4geW91IGFyZSBydW5uaW5nIG91dCBvZiBiYXR0ZXJ5IGFuZAo+PiB3YW50IHRv
IHNhdmUgeW91ciB3b3JrLgo+IEdvdCBpdCwgdGhhbmtzLiBTbyBpdCBzZWVtcyB3ZSBoYXZlIHR3
byBpc3N1ZXMgaGVyZTogYXRoMTFrIGRvZXMgbm90Cj4gc3VwcG9ydCBoaWJlcm5hdGlvbiBhbmQg
YXRoMTFrIG1vZHVsZSByZWxvYWQgZmFpbGluZy4gTGV0J3MgaGFuZGxlIHRoZQo+IG1vZHVsZSBy
ZWxvYWQgZmFpbGluZyBpbiBidWcgIzIxNDU0MSwgYnV0IGNhbiB5b3UgZmlsZSBhbm90aGVyIGJ1
ZyBhYm91dAo+IHRoZSBtaXNzaW5nIHN1cHBvcnQgZm9yIGhpYmVybmF0aW9uPyBMZXQncyBoYXZl
IG9uZSBpc3N1ZSBwZXIgYnVnCj4gcmVwb3J0LCBpdCdzIGVhc2llciB0byBtYW5hZ2UgYnVnemls
bGEgdGhhdCB3YXkuCj4KPj4gQWxzbyBvbmUgbW9yZSBwb2ludCBJJ3ZlIGZvdW5kIC0gaWYgTUhJ
IGlzIGNvbmZpZ3VyZWQgaW4gdGhlIGtlcm5lbCAtCj4+IHRoZSBjYXJkIGlzIHN0YXJ0aW5nIHVw
IG9uIHRociBmaXJzdCBib290IGFuZCB3b3Jrcy4gQnV0IGlmIGkKPj4gY29uZmlndXJlIE1ISSBh
cyBhIG1vZHVsZSAtIGl0IGRvZXMgbm90LiBNSEkgbW9kdWxlIGRvIGxvYWQuIFNvIGRvCj4+IGF0
aDExayBhbmQgYXRoMTFrX3BjaS7CoCBCdXQgdGhlIGxhc3QgYXRoMTFrIGRtZXNnIHNheXMgOgo+
Pgo+PiBtaGkgbWhpMDogV2FpdCBmb3IgZGV2aWNlIHRvIGVudGVyIFNCTCBvciBNaXNzaW9uIG1v
ZGUKPj4KPj4gRXhhY3RseSBhcyBpZiBJwqAgZG8gcm1tb2QvbW9kcHJvYmUgc2VxdWVuY2UuCj4+
Cj4+IEkgdXNlIGxhdGVzdCBCSU9TIGZyb20gRGVsbCAoaW4gZmFjdCB1cGdyYWRpbmcgMy4wLjQg
dG8gMy4xLjAgZGlkIG5vdAo+PiBjYW5nZSBhbnl0aG5nKSAswqAgYW5kIGhhdmUgdHJpZWQgbXVs
dGlwbGUga2VybmVscy4gU3RhYmxlIDUuMTQgc2VyaWVzCj4+IGFuZCBhdGgxMWsgZ2l0IHRyZWUg
KG5leHQgYW5kIG1hc3Rlci1wZW5kaW5nKS4gTm90aGluZyBoZWxwcy4KPj4gU29tZXRpbWVzIGl0
IHdva3Mgb3V0IC0gSSBoYWQgY291cGxlIG9mIHRpbWVzIHN1Y2Nlc3NmdWxseQo+PiBybW1vZC9t
b2Rwcm9iZSBhdGgxMWtfcGNpIGJ1dCBpdCBzIGEga2luZCBvZiByYW5kb20gYW5kIHZlcnkgcmFy
ZQo+PiBldmVudCAoIEkgaGFkIGl0IDIgdGltZXMgb25seSkuCj4+Cj4+IFNvIGZvciBtZSBpdCBs
b29rcyBsaWtlIGFuIGlzc3VlIGJldHdlZW4gTUhJIGFuZCBhdGgxMWsgLCBidXQKPj4gdWJmb3J0
dW5hdGVseSBteSBrbm93bGVkZ2UgaXMgbm90IGVub3VnaCB0byBwcm9wb3NlIGFueSBzb2x1dGlv
biBoZXJlLgo+IE9uIG15IE5VQyB4ODYgdGVzdCBib3ggSSByZWxvYWQgYXRoMTFrIG1vZHVsZXMg
c2V2ZXJhbCB0aW1lcyBhIGRheSB3aGlsZQo+IEkgdGVzdCBhdGgxMWsgYnV0IEkgYWx3YXlzIHJl
bG9hZCB0aGUgbWhpIG1vZHVsZXMgYXQgdGhlIHNhbWUgdGltZSwKPiBtYXliZSB0aGF0IG1ha2Vz
IHRoZSBkaWZmZXJlbmNlPyBPciBYUFMgMTMgOTMxMCB3b3JrcyBkaWZmZXJlbnRseSBmcm9tCj4g
TlVDLCB0aGF0J3MgYWxzbyBwb3NzaWJsZS4KPgoKLS0gCmF0aDExayBtYWlsaW5nIGxpc3QKYXRo
MTFrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9hdGgxMWsK
