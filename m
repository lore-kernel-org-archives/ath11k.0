Return-Path: <SRS0=PCnT=O4=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4835BC433F5
	for <ath11k@archiver.kernel.org>; Fri,  8 Oct 2021 13:28:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0915760F92
	for <ath11k@archiver.kernel.org>; Fri,  8 Oct 2021 13:28:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0915760F92
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+xeansD6ZWt34+SibbElfYNnPV9xS9n5jfgCJUrQxIg=; b=FfGOUYGlO9OUV0Sg55rcNHKXfI
	uYkbD78CE7D7Cr2AQwar+AYQQWpCWEKys5HQwEy3/OOXaqGAdL4P7Yao9FM1tU1PQu+BX1DpCCNBJ
	DrkTyWzA4PpNeo995J5iNIrdjj5jqlQhRKqlXASNapKt/tPkjhh466dSydU/lKDGfb0gau22IWnIT
	oc2hWjHyeDQtaP11uMR7wRlXz+6uy+yr2MWOXKhe/RgKet8qVRkgjgSValIuAnsplTy9y5cVJBDi/
	8M2F06ry9WCICVLSQ6Kyd4VKYnb4RX4AJIigsfnzn9cro+9me758InTEJZtwpDbArFl6ZM8X9L0N4
	4bm/yn9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mYpvU-002swr-KR; Fri, 08 Oct 2021 13:28:40 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mYpvQ-002swF-Vs
 for ath11k@lists.infradead.org; Fri, 08 Oct 2021 13:28:38 +0000
Received: by mail-lf1-x129.google.com with SMTP id x27so39501095lfu.5
 for <ath11k@lists.infradead.org>; Fri, 08 Oct 2021 06:28:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=tG25Axt9NKfYWyZ51jXDE/Kk2qP1EHeTLtunbVrmGRU=;
 b=hy7monrPvigUMH4zwsc5VHON7eIS2sezpnVBQvWRwhcW4pl9NaX7I1YGcD0GXQCG5O
 d0DzhBqO9f1eqddzUvYJWScH5aylzjde0qVPk6x9fNBk8FDIv1tmQByfZLA4zwBRs4sh
 qlbNkqpJQH/N46LzO+EuMtVbIOUPk6mnds25N07pCOhjW47eDkYkd7Yv7P6uqF4nuEZP
 nrT4Ba7OtgE1E3358NqCSdEvXSR3VNi4xAarulEpxbutaX0gI9z8d5KN9kISvszolpFn
 FM/W+/dMgzt3RmQ6hRd/VXQDvKpcTkTIdx1Q9sCa2N31bOI9hLGSozEsl1SFZN09jQKY
 EOIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=tG25Axt9NKfYWyZ51jXDE/Kk2qP1EHeTLtunbVrmGRU=;
 b=iGmV9glUYQM2rzQhSVcrYBPeYS3fuP4hKef+8SW7fzR4WVxohqjDGzlh3+r4LpRIZk
 OKnuU1V1LKOMKCbBwHBOQI7bEORTDgyXwBXfS6x7YuX/mYF79lh0joldq+sooXDt6UmG
 EXS/2ftJxdwbDxCuwAIcyQyTT0cyZKhrrk++fQg4DKwgizMsqiIj2VWLvcVptyYicv5B
 9ge1YHV5JRiAzUQ3o9W/1F/5r0yow1M5o7NNM2BjjVsD2DE9WtjiX+7BssmNWkUTmcHi
 i8LBLdFmV5r8W25A6Rj9fevZf8bpMpqr+gucZZ9aLJCeXDPJ9BuwoSL3tbY8g0FEmgA3
 gWHQ==
X-Gm-Message-State: AOAM531hXuFLLEbl+kAEtZDr/ahAQ14EnMH6odZbQEeWXFtlmElqe8Qf
 YL0ZjpwOzgu1MGo9dL2Vmj6V0fQ/oNpfYur7
X-Google-Smtp-Source: ABdhPJwL6dWyQi92GvAvMY6y+RiNrl7fvg4W4jlSx+hvxORlsEyfNLV7GOKcQ1gadFcoihgB9oBqrQ==
X-Received: by 2002:ac2:5c06:: with SMTP id r6mr10365194lfp.103.1633699713270; 
 Fri, 08 Oct 2021 06:28:33 -0700 (PDT)
Received: from [192.168.2.114] ([5.187.75.16])
 by smtp.gmail.com with ESMTPSA id v23sm244428lfi.156.2021.10.08.06.28.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Oct 2021 06:28:32 -0700 (PDT)
Subject: Re: Can not unload ath11k_pci and load it back
To: Kalle Valo <kvalo@codeaurora.org>
Cc: ath11k@lists.infradead.org
References: <190a1b14-0a8c-f1fb-9f0d-e25cc57034a7@gmail.com>
 <875yu9e4li.fsf@codeaurora.org>
 <8324ec52-303d-ea04-b635-a550e83ad47c@gmail.com>
 <87y275cm2x.fsf@codeaurora.org>
From: Mark Herbert <mark.herbert42@gmail.com>
Message-ID: <fe68f030-da86-9f4e-07e1-cb800eff5f87@gmail.com>
Date: Fri, 8 Oct 2021 16:28:31 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <87y275cm2x.fsf@codeaurora.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211008_062837_070052_0D488CA4 
X-CRM114-Status: GOOD (  23.20  )
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

Q3JlYXRlZCB0aGUgYnVnIGZvciBoaWJlcm5hdGUgaXNzdWUuIEZvciBtZSBpdCBsb29rcyB2ZXJ5
IGNsb3NlIHRvIHRoZSAKbW9kdWxlcyB1bmxvYWRpbmcgLSBBcmNobGludXggd2lraSBwcm92aWRl
cyBtb2R1bGUgdW5sb2FkaW5nIGJlZm9yZSAKL2xvYWRpbmcgYWZ0ZXIgYXMgYSB3b3JrYXJvdW5k
LiBBbmQgaW4gZmFjdCB0aGVyZSBhcmUgYSBsb3Qgb2YgaGFyZHdhcmUgCnBpZWNlcyB0aGF0IG5l
ZWQgdG8gYmUgcmVpbml0aWFsaXplZMKgIGFmdGVyIHJlc3VtZSwgc28gaXQgaXMgYSBraW5kIG9m
IApjb21tb24gd29ya2Fyb3VuZC4KCgpodHRwczovL2J1Z3ppbGxhLmtlcm5lbC5vcmcvc2hvd19i
dWcuY2dpP2lkPTIxNDY0OQoKCkJ5IHRoZSB3YXkgdGhlIGNhcmQgZ2l2ZXMgYSBsb3Qgb2YgdHJv
dWJsZSBub3Qgb25seSBmb3IgTGludXggdXNlcnMgYnV0IApldmVuIGluIFdpbmRvd3MsIGFuZCBE
ZWxsIGhhcyBpc3N1ZWQgc2V2ZXJhbCBkcml2ZXIgdXBkYXRlcyAobGF0ZXN0IApkYXRlZCAyMyBv
ZiBTZXB0ZW1iZXIpLsKgIEp1c3Qgd2luZGVyaW5nIGlmIERlbGwgYWxzbyB1c2VzIHNhbWUgZmly
bXdhcmUgCjEyIG1vbnRoIG9sZCBvciB0aGV5IGhhdmUgc29tZSBidWdmaXhlcyBpbiB0aGUgZmly
bXdhcmUgaXRzZWxmLi4uCgpPbiAwNy4xMC4yMDIxIDEwOjQ4LCBLYWxsZSBWYWxvIHdyb3RlOgo+
IE1hcmsgSGVyYmVydCA8bWFyay5oZXJiZXJ0NDJAZ21haWwuY29tPiB3cml0ZXM6Cj4KPj4gSSd2
ZSBmb3VuZCBzaW1pbGFyIGJ1ZyBmaWxlcyBhbHJlYWR5IC0gc28gbm90IHRvIGNyZWF0ZSBkdXBs
aWNhdGVzCj4+IHNpbXBseSBjb21tZW50ZWQgdGhlcmUKPj4KPj4gaHR0cHM6Ly9idWd6aWxsYS5r
ZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMTQ1NDEKPj4KPj4gRXhhY3RseSAtIGhpYmVybmF0
aW9uIG1lYW5zIHNhdmluZyBzdGF0ZSBvbiBkaXNrIGFuZCByZXN1bWluZyBsYXRlciwKPj4gaXQg
aXMgYSB2ZXJ5IHVzZWZ1bGwgZmVhdHVyZSB3aGVuIHlvdSBhcmUgcnVubmluZyBvdXQgb2YgYmF0
dGVyeSBhbmQKPj4gd2FudCB0byBzYXZlIHlvdXIgd29yay4KPiBHb3QgaXQsIHRoYW5rcy4gU28g
aXQgc2VlbXMgd2UgaGF2ZSB0d28gaXNzdWVzIGhlcmU6IGF0aDExayBkb2VzIG5vdAo+IHN1cHBv
cnQgaGliZXJuYXRpb24gYW5kIGF0aDExayBtb2R1bGUgcmVsb2FkIGZhaWxpbmcuIExldCdzIGhh
bmRsZSB0aGUKPiBtb2R1bGUgcmVsb2FkIGZhaWxpbmcgaW4gYnVnICMyMTQ1NDEsIGJ1dCBjYW4g
eW91IGZpbGUgYW5vdGhlciBidWcgYWJvdXQKPiB0aGUgbWlzc2luZyBzdXBwb3J0IGZvciBoaWJl
cm5hdGlvbj8gTGV0J3MgaGF2ZSBvbmUgaXNzdWUgcGVyIGJ1Zwo+IHJlcG9ydCwgaXQncyBlYXNp
ZXIgdG8gbWFuYWdlIGJ1Z3ppbGxhIHRoYXQgd2F5Lgo+Cj4+IEFsc28gb25lIG1vcmUgcG9pbnQg
SSd2ZSBmb3VuZCAtIGlmIE1ISSBpcyBjb25maWd1cmVkIGluIHRoZSBrZXJuZWwgLQo+PiB0aGUg
Y2FyZCBpcyBzdGFydGluZyB1cCBvbiB0aHIgZmlyc3QgYm9vdCBhbmQgd29ya3MuIEJ1dCBpZiBp
Cj4+IGNvbmZpZ3VyZSBNSEkgYXMgYSBtb2R1bGUgLSBpdCBkb2VzIG5vdC4gTUhJIG1vZHVsZSBk
byBsb2FkLiBTbyBkbwo+PiBhdGgxMWsgYW5kIGF0aDExa19wY2kuwqAgQnV0IHRoZSBsYXN0IGF0
aDExayBkbWVzZyBzYXlzIDoKPj4KPj4gbWhpIG1oaTA6IFdhaXQgZm9yIGRldmljZSB0byBlbnRl
ciBTQkwgb3IgTWlzc2lvbiBtb2RlCj4+Cj4+IEV4YWN0bHkgYXMgaWYgScKgIGRvIHJtbW9kL21v
ZHByb2JlIHNlcXVlbmNlLgo+Pgo+PiBJIHVzZSBsYXRlc3QgQklPUyBmcm9tIERlbGwgKGluIGZh
Y3QgdXBncmFkaW5nIDMuMC40IHRvIDMuMS4wIGRpZCBub3QKPj4gY2FuZ2UgYW55dGhuZykgLMKg
IGFuZCBoYXZlIHRyaWVkIG11bHRpcGxlIGtlcm5lbHMuIFN0YWJsZSA1LjE0IHNlcmllcwo+PiBh
bmQgYXRoMTFrIGdpdCB0cmVlIChuZXh0IGFuZCBtYXN0ZXItcGVuZGluZykuIE5vdGhpbmcgaGVs
cHMuCj4+IFNvbWV0aW1lcyBpdCB3b2tzIG91dCAtIEkgaGFkIGNvdXBsZSBvZiB0aW1lcyBzdWNj
ZXNzZnVsbHkKPj4gcm1tb2QvbW9kcHJvYmUgYXRoMTFrX3BjaSBidXQgaXQgcyBhIGtpbmQgb2Yg
cmFuZG9tIGFuZCB2ZXJ5IHJhcmUKPj4gZXZlbnQgKCBJIGhhZCBpdCAyIHRpbWVzIG9ubHkpLgo+
Pgo+PiBTbyBmb3IgbWUgaXQgbG9va3MgbGlrZSBhbiBpc3N1ZSBiZXR3ZWVuIE1ISSBhbmQgYXRo
MTFrICwgYnV0Cj4+IHViZm9ydHVuYXRlbHkgbXkga25vd2xlZGdlIGlzIG5vdCBlbm91Z2ggdG8g
cHJvcG9zZSBhbnkgc29sdXRpb24gaGVyZS4KPiBPbiBteSBOVUMgeDg2IHRlc3QgYm94IEkgcmVs
b2FkIGF0aDExayBtb2R1bGVzIHNldmVyYWwgdGltZXMgYSBkYXkgd2hpbGUKPiBJIHRlc3QgYXRo
MTFrIGJ1dCBJIGFsd2F5cyByZWxvYWQgdGhlIG1oaSBtb2R1bGVzIGF0IHRoZSBzYW1lIHRpbWUs
Cj4gbWF5YmUgdGhhdCBtYWtlcyB0aGUgZGlmZmVyZW5jZT8gT3IgWFBTIDEzIDkzMTAgd29ya3Mg
ZGlmZmVyZW50bHkgZnJvbQo+IE5VQywgdGhhdCdzIGFsc28gcG9zc2libGUuCj4KCi0tIAphdGgx
MWsgbWFpbGluZyBsaXN0CmF0aDExa0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vYXRoMTFrCg==
