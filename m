Return-Path: <SRS0=tHTJ=O3=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF018C433EF
	for <ath11k@archiver.kernel.org>; Thu,  7 Oct 2021 08:00:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8AA0061053
	for <ath11k@archiver.kernel.org>; Thu,  7 Oct 2021 08:00:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8AA0061053
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rdDoiwZYu3Xe76ydBznQvXv6IiyuD9MKZdSUNFA5WoI=; b=xZZn6Z8hZBGnRmRUawttvdAg5B
	ytqU7zOKO1JlqIxEU/KEbTfmOt2w2rCn38qkzQyyFtySEVeIuykPHk28YzFE68Ph7FWtxCqU23Fe5
	oYBn3JsnxW5Mkd5JSrt4Pt30nI6PiRSlLRHchdIDssE3hdwPpP189o+UzHBN1e/LiBPUXMKsFJcTF
	GHBV0VDFnmI2OzD4fqgvFT12cM7ZkVr6+yjhVEfYzQEf94CgeUjLlxsa3MfohkE3fwsadmSh2KIsd
	hnT308cPHbaaPgLffEifbFAVNqMS5Adr4YZfC6I3dVYLfQvaL4k2/eNSdPzPLEncLv8VRBhUBOFRf
	gNyNmt1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mYOKh-00GUaD-14; Thu, 07 Oct 2021 08:00:51 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mYOKe-00GUZe-Mz
 for ath11k@lists.infradead.org; Thu, 07 Oct 2021 08:00:50 +0000
Received: by mail-lf1-x12e.google.com with SMTP id i24so20521870lfj.13
 for <ath11k@lists.infradead.org>; Thu, 07 Oct 2021 01:00:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=17ebDvk0yYxc62ya3plryElMTBDx4GfoGJgHlvUy7VQ=;
 b=pM+t1ddSCHNWuS7u03GanzDwXQCIShXOuNt1MLf1jo9E2Tbx25IvhmkfSGqBNAFjTl
 AqcEdF8Dlb0jms+NkjEaFhj3mBtQwREoHcQIFZ7PmuMNHf5jj+mxo0/Y4hIKXy5Tmv9G
 h0Ifued9qpGpRcZBfBm5M9pe+FWhslAfJ2UP6oxkoAmhgrxNvlXGvrHL9a8moJr1+7gA
 JE2Or/GwJCRDLcrVtGmJ8WZ+3RYTENru0oLz8DnE1r74dbjwyat9NCDDyJGaP1dkuUPI
 MvCtFpGvFC58R0TWOJfbb+P7Y8rFQZ6sqpwj6mK+9BTQxPrbsIT8LTLp/Oh3ZOLjX3MK
 y2IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=17ebDvk0yYxc62ya3plryElMTBDx4GfoGJgHlvUy7VQ=;
 b=EoKRd1cBVSxdikDEX5R65V+ME+dYPHHlJb9xEGE04nuEtbkfqsI6FvSuLCEUt8xcIy
 +VbnAYoOQ3/1wPYC5yqjsJOFjUbUq+h0ahCcOUZeuOefYlkq/V9hBRNJofLWI+jpOG0B
 zOBbeQqpxshoX6a93HVFMPsMEK/9Dq42WNbNEEY7hGiAZrAdAF4GPAgVo+yEvrRw9Veo
 Bv85C99QMQ2dmScbizMchbPgYkJGYJnjxSl6TiThSZ+C15xb8hCnWGxcOtYc1CJQeOwM
 lA3yYGcUw9vTST2xM2S8vCnmwSiKwW51baeazki68yM/7cAYQwVo6m7R9A3uOrEkAkWr
 hAYA==
X-Gm-Message-State: AOAM532lS16dqxChfx0nA8C+YYU8f5M/nnn1ZLrcRNr+HKXrVhYnqCvR
 +R9xUQ22+JZAVRhbNy5caFJdvGaEgmS98qruuNo=
X-Google-Smtp-Source: ABdhPJzfhQE9KWvAUCcBRaUoEvhjLM0DMhedUre2/95Sq3O/7chpoxyfoKdQ63BdMiYx7COSNs7M4w==
X-Received: by 2002:a05:651c:1b4:: with SMTP id
 c20mr3257953ljn.484.1633593643343; 
 Thu, 07 Oct 2021 01:00:43 -0700 (PDT)
Received: from [192.168.2.114] ([109.106.141.149])
 by smtp.gmail.com with ESMTPSA id a23sm1944935ljb.107.2021.10.07.01.00.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Oct 2021 01:00:43 -0700 (PDT)
Subject: Re: Can not unload ath11k_pci and load it back
To: Kalle Valo <kvalo@codeaurora.org>
Cc: ath11k@lists.infradead.org
References: <190a1b14-0a8c-f1fb-9f0d-e25cc57034a7@gmail.com>
 <875yu9e4li.fsf@codeaurora.org>
 <8324ec52-303d-ea04-b635-a550e83ad47c@gmail.com>
 <87y275cm2x.fsf@codeaurora.org>
From: Mark Herbert <mark.herbert42@gmail.com>
Message-ID: <c2699c64-44d0-1857-e3b1-21e02e401b86@gmail.com>
Date: Thu, 7 Oct 2021 11:00:42 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <87y275cm2x.fsf@codeaurora.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211007_010048_799216_9B77A301 
X-CRM114-Status: GOOD (  22.62  )
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

QXMgSSBtZW50aW9uZWQgLSBpZiBJIGJ1aWxkIG1oaSBhcyBhIG1vZHVsZSAtIGNhcmQgd2lsbCBu
b3QgZXZlbiBzdGFydC4gCml0IHdvcmtzIG9ubHkgaWYgbWhpIGlzIGNvbXBpbGVkIGluc2lkZSB0
aGUga2VybmVsLCBhbmQgaW4gdGhpcyBjb25maWcgSSAKY2FuIG5vdCB1bmxvYWQgaXQuCgpPbiAw
Ny4xMC4yMDIxIDEwOjQ4LCBLYWxsZSBWYWxvIHdyb3RlOgo+IE1hcmsgSGVyYmVydCA8bWFyay5o
ZXJiZXJ0NDJAZ21haWwuY29tPiB3cml0ZXM6Cj4KPj4gSSd2ZSBmb3VuZCBzaW1pbGFyIGJ1ZyBm
aWxlcyBhbHJlYWR5IC0gc28gbm90IHRvIGNyZWF0ZSBkdXBsaWNhdGVzCj4+IHNpbXBseSBjb21t
ZW50ZWQgdGhlcmUKPj4KPj4gaHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNn
aT9pZD0yMTQ1NDEKPj4KPj4gRXhhY3RseSAtIGhpYmVybmF0aW9uIG1lYW5zIHNhdmluZyBzdGF0
ZSBvbiBkaXNrIGFuZCByZXN1bWluZyBsYXRlciwKPj4gaXQgaXMgYSB2ZXJ5IHVzZWZ1bGwgZmVh
dHVyZSB3aGVuIHlvdSBhcmUgcnVubmluZyBvdXQgb2YgYmF0dGVyeSBhbmQKPj4gd2FudCB0byBz
YXZlIHlvdXIgd29yay4KPiBHb3QgaXQsIHRoYW5rcy4gU28gaXQgc2VlbXMgd2UgaGF2ZSB0d28g
aXNzdWVzIGhlcmU6IGF0aDExayBkb2VzIG5vdAo+IHN1cHBvcnQgaGliZXJuYXRpb24gYW5kIGF0
aDExayBtb2R1bGUgcmVsb2FkIGZhaWxpbmcuIExldCdzIGhhbmRsZSB0aGUKPiBtb2R1bGUgcmVs
b2FkIGZhaWxpbmcgaW4gYnVnICMyMTQ1NDEsIGJ1dCBjYW4geW91IGZpbGUgYW5vdGhlciBidWcg
YWJvdXQKPiB0aGUgbWlzc2luZyBzdXBwb3J0IGZvciBoaWJlcm5hdGlvbj8gTGV0J3MgaGF2ZSBv
bmUgaXNzdWUgcGVyIGJ1Zwo+IHJlcG9ydCwgaXQncyBlYXNpZXIgdG8gbWFuYWdlIGJ1Z3ppbGxh
IHRoYXQgd2F5Lgo+Cj4+IEFsc28gb25lIG1vcmUgcG9pbnQgSSd2ZSBmb3VuZCAtIGlmIE1ISSBp
cyBjb25maWd1cmVkIGluIHRoZSBrZXJuZWwgLQo+PiB0aGUgY2FyZCBpcyBzdGFydGluZyB1cCBv
biB0aHIgZmlyc3QgYm9vdCBhbmQgd29ya3MuIEJ1dCBpZiBpCj4+IGNvbmZpZ3VyZSBNSEkgYXMg
YSBtb2R1bGUgLSBpdCBkb2VzIG5vdC4gTUhJIG1vZHVsZSBkbyBsb2FkLiBTbyBkbwo+PiBhdGgx
MWsgYW5kIGF0aDExa19wY2kuwqAgQnV0IHRoZSBsYXN0IGF0aDExayBkbWVzZyBzYXlzIDoKPj4K
Pj4gbWhpIG1oaTA6IFdhaXQgZm9yIGRldmljZSB0byBlbnRlciBTQkwgb3IgTWlzc2lvbiBtb2Rl
Cj4+Cj4+IEV4YWN0bHkgYXMgaWYgScKgIGRvIHJtbW9kL21vZHByb2JlIHNlcXVlbmNlLgo+Pgo+
PiBJIHVzZSBsYXRlc3QgQklPUyBmcm9tIERlbGwgKGluIGZhY3QgdXBncmFkaW5nIDMuMC40IHRv
IDMuMS4wIGRpZCBub3QKPj4gY2FuZ2UgYW55dGhuZykgLMKgIGFuZCBoYXZlIHRyaWVkIG11bHRp
cGxlIGtlcm5lbHMuIFN0YWJsZSA1LjE0IHNlcmllcwo+PiBhbmQgYXRoMTFrIGdpdCB0cmVlIChu
ZXh0IGFuZCBtYXN0ZXItcGVuZGluZykuIE5vdGhpbmcgaGVscHMuCj4+IFNvbWV0aW1lcyBpdCB3
b2tzIG91dCAtIEkgaGFkIGNvdXBsZSBvZiB0aW1lcyBzdWNjZXNzZnVsbHkKPj4gcm1tb2QvbW9k
cHJvYmUgYXRoMTFrX3BjaSBidXQgaXQgcyBhIGtpbmQgb2YgcmFuZG9tIGFuZCB2ZXJ5IHJhcmUK
Pj4gZXZlbnQgKCBJIGhhZCBpdCAyIHRpbWVzIG9ubHkpLgo+Pgo+PiBTbyBmb3IgbWUgaXQgbG9v
a3MgbGlrZSBhbiBpc3N1ZSBiZXR3ZWVuIE1ISSBhbmQgYXRoMTFrICwgYnV0Cj4+IHViZm9ydHVu
YXRlbHkgbXkga25vd2xlZGdlIGlzIG5vdCBlbm91Z2ggdG8gcHJvcG9zZSBhbnkgc29sdXRpb24g
aGVyZS4KPiBPbiBteSBOVUMgeDg2IHRlc3QgYm94IEkgcmVsb2FkIGF0aDExayBtb2R1bGVzIHNl
dmVyYWwgdGltZXMgYSBkYXkgd2hpbGUKPiBJIHRlc3QgYXRoMTFrIGJ1dCBJIGFsd2F5cyByZWxv
YWQgdGhlIG1oaSBtb2R1bGVzIGF0IHRoZSBzYW1lIHRpbWUsCj4gbWF5YmUgdGhhdCBtYWtlcyB0
aGUgZGlmZmVyZW5jZT8gT3IgWFBTIDEzIDkzMTAgd29ya3MgZGlmZmVyZW50bHkgZnJvbQo+IE5V
QywgdGhhdCdzIGFsc28gcG9zc2libGUuCj4KCi0tIAphdGgxMWsgbWFpbGluZyBsaXN0CmF0aDEx
a0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vYXRoMTFrCg==
