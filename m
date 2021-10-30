Return-Path: <SRS0=gwlD=PS=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CABB2C433EF
	for <ath11k@archiver.kernel.org>; Sat, 30 Oct 2021 19:23:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6B30D60F56
	for <ath11k@archiver.kernel.org>; Sat, 30 Oct 2021 19:23:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6B30D60F56
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PNbToCF62T1LG1sSWwNCoW8yXPIoVMUopimbRwAzSJ4=; b=tKqH0NnITASSKDIT/SgS1A+wAh
	kWRyelhsgZckL0vu5M0mpBIUgFnZy/bGiw8W/PpUUc/UEm5iGBzC80C7J9ZNxFjnYpMe9my1s/Lfi
	ojKzO38Zj1PqWo03Lyiz1QS9I7ShklJAdRKWfK/7F5J7KpxVITMrE7oXPCKf8YlNorSaOSnZu5kKU
	ON6Um80W5IODiJrquLhNX/j0X+IIFjk6h6ctLcsSJQCsxKfkgoD9Gw632I3mQ1SmiRBljAeuk3uwb
	m9ceP1FtwmaI0xTi+Wkg2BG67Re/C70kGe/LEUATG15apW3ObxpilzRi6F51un/ujQlt4qvpXPqFN
	7L1CtvXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mgtx5-00DTk6-3X; Sat, 30 Oct 2021 19:23:39 +0000
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mgtx1-00DTjn-Rp
 for ath11k@lists.infradead.org; Sat, 30 Oct 2021 19:23:37 +0000
Received: by mail-lj1-x22f.google.com with SMTP id i26so20543457ljg.7
 for <ath11k@lists.infradead.org>; Sat, 30 Oct 2021 12:23:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=cHaj34N+xMwdtyHdUytTCS+BDBXx0L0JfpH3XZXTPwQ=;
 b=Ngcan9ys8kvVNGqu/kZWxzgbvVI6xbAOzigWlvwv6bEjL5B299v7fgnW/3JYomrgez
 Av7v051r2JeCzLHNK0AkyliIuLbrplZ4cx+C33FVp5wENmVWrKig+/M8gruDCyVI2Kur
 b3djfZdDpMpt3jH+O0g/lUvbrWLNfsiEs2LTAi5lMe0CqdOLanOQwV6EOeoIz9oJFI2j
 2hiOxJxWp9ir42XKhsLrrZ2sbpmX7Kmjt7ud8RtodY3ekER2D9IeqcOHmKmGmB7uq57d
 jaD8pmizAujYZaFcCjhsa37dJm0Ndb+8SHYdqkOUp/RetF6/hCz0DVL17SjcyLL0qcJ0
 0NHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=cHaj34N+xMwdtyHdUytTCS+BDBXx0L0JfpH3XZXTPwQ=;
 b=g4V7z8VydkWGYme5WOZ7UyCZY5GGqrbxNbjiwUX0Oy6crFvOnwc/E7tUMhdzYfU+E2
 59IWps4nP7RA+bO0kqdf+r/MZ+1z3nQmAD8WYKhLxHui5SaPt20ZNj3P3eau2Uqs0RaP
 hV7zbSQZ8xBhv704bjLSlciUHzYrpwrovWLV8Vo7Ttw8tipM+Hopt2dl+VwNMFAuOC5l
 LyrIpO2XpqbIbW1bnDo/33tMt+PK3dcpPS6zhNxA9tZxIvg8KywnN0aUc1cop8sa/0zA
 cwgGE1DD09wJBR0niWwWPY2xQW4AV0qcaCnyfBoytdWUciYjhN27X9sqIbgdNfup4qEX
 QjDw==
X-Gm-Message-State: AOAM531zsRqiVPxD0MBNhbIFvjrJcR8LVqDg1C1+p5XjV57sNak/QM+t
 FLEQZQlH4MncS4k6iKvn4TONy59FqGBAOg==
X-Google-Smtp-Source: ABdhPJxPoRB6rFMk+01zDQJZ1IPcA9gkPXljkSsAAqBM6nf76OEl5f0rqtE7WtvjW+r5J8nK9ELxQQ==
X-Received: by 2002:a2e:b793:: with SMTP id n19mr20619982ljo.38.1635621813457; 
 Sat, 30 Oct 2021 12:23:33 -0700 (PDT)
Received: from ?IPv6:2a02:2168:88a0:5e00:a4c7:4ba3:4116:5?
 ([2a02:2168:88a0:5e00:a4c7:4ba3:4116:5])
 by smtp.gmail.com with ESMTPSA id b20sm957791lfb.219.2021.10.30.12.23.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 30 Oct 2021 12:23:33 -0700 (PDT)
Subject: Re: Can not unload ath11k_pci and load it back
To: Kalle Valo <kvalo@codeaurora.org>
Cc: ath11k@lists.infradead.org
References: <190a1b14-0a8c-f1fb-9f0d-e25cc57034a7@gmail.com>
 <875yu9e4li.fsf@codeaurora.org>
 <8324ec52-303d-ea04-b635-a550e83ad47c@gmail.com>
 <87y275cm2x.fsf@codeaurora.org>
From: Mark Herbert <mark.herbert42@gmail.com>
Message-ID: <7d7c56c4-0b34-0b3c-7956-4655be632b1f@gmail.com>
Date: Sat, 30 Oct 2021 22:23:31 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <87y275cm2x.fsf@codeaurora.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211030_122335_943898_C0649DBB 
X-CRM114-Status: GOOD (  25.52  )
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

Rm91bmQgbWVzc2FnZSBpbiBNYXkgYXJjaGl2ZSBvZiB0aGUgbWFpbGluZyBsaXN0IHdpdGggcHJl
dHR5IHNpbWlsYXIgCmlzc3VlIHRoYXQgSSBoYXZlLgoKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvcGlwZXJtYWlsL2F0aDExay8yMDIxLU1heS8wMDEyNjcuaHRtbAoKVGhlIGF1dGhvciBvZiB0
aGF0IG1lc3NhZ2UgbWFuYWdlZCBiZXR0ZXIgZGVidWdnaW5nIGluZm8gdGhhbiBJIGRpZC4gSXQg
CmlzIHNhbWUgLSBpZiB0aGUga2VybmVsIGRvIGF1dG9sb2FkaW5nIG9mIGF0aDExa19wY2nCoCBh
dCBib290IGl0IHdvcmtzLiAKQnV0wqAgaWYgSSBkbyBtYW51YWwgbG9hZCAtIGl0IGdldHMgc3R1
Y2sgaW4KCiJXYWl0IGZvciBkZXZpY2UgdG8gZW50ZXIgU0JMIG9yIE1pc3Npb24gbW9kZSIKCnNv
bWV0aW1lcyBpbnN0ZWFkIG9mIHdhaXRpbmcgaXQgZG9lcyByZXBvcnQgdGhlIHZlcnNpb25zIG9m
IGxvYWRlZCAKZmlybXdhcmUgYW5kIHRoZSBjYXJkIHdvcmtzIGZpbmUsIGJ1dCB0aGF0IGhhcHBl
bnMgdmVyeSB2ZXJ5IHJhcmUuIE9uY2UgCmluIDMwLTQwIHRyaWVzLgoKVGhlIG1lc3NhZ2UgaXMg
cHJvZHVjZWQgYnkgZHJpdmVycy9idXMvbWhpL2NvcmUvYm9vdC5jIGZpbGUswqAgYnkKCnZvaWQg
bWhpX2Z3X2xvYWRfaGFuZGxlcihzdHJ1Y3QgbWhpX2NvbnRyb2xsZXIgKm1oaV9jbnRybCkgZnVu
Y3Rpb24uwqDCoCAKQW5kIHRoaXMgbWVzc2FnZSBzZWVtcyB0byBiZSBnZW5lcmF0ZWQgaWYgZXZl
cnl0aGluZyBpcyB3b3JraW5nIE9LIC0gc28gCnRoZSBjYXJkIHNob3VsZCByZWFjaCB0aGlzIFNC
TCBvciBNaXNzaW9uIG1vZGUgYW5kIGNvbnRpbnVlIGJ1dCBpdCBkb2VzIApub3QswqAgbm8gZm9s
bG93IHVwIG1lc3NhZ2VzIGFuZCB0aGUgV2lGaSBkZXZpY2UgaXMgbm90IGF2YWlsYWJsZSBhbnlt
b3JlLgoKCgoKCk9uIDA3LjEwLjIwMjEgMTA6NDgsIEthbGxlIFZhbG8gd3JvdGU6Cj4gTWFyayBI
ZXJiZXJ0IDxtYXJrLmhlcmJlcnQ0MkBnbWFpbC5jb20+IHdyaXRlczoKPgo+PiBJJ3ZlIGZvdW5k
IHNpbWlsYXIgYnVnIGZpbGVzIGFscmVhZHkgLSBzbyBub3QgdG8gY3JlYXRlIGR1cGxpY2F0ZXMK
Pj4gc2ltcGx5IGNvbW1lbnRlZCB0aGVyZQo+Pgo+PiBodHRwczovL2J1Z3ppbGxhLmtlcm5lbC5v
cmcvc2hvd19idWcuY2dpP2lkPTIxNDU0MQo+Pgo+PiBFeGFjdGx5IC0gaGliZXJuYXRpb24gbWVh
bnMgc2F2aW5nIHN0YXRlIG9uIGRpc2sgYW5kIHJlc3VtaW5nIGxhdGVyLAo+PiBpdCBpcyBhIHZl
cnkgdXNlZnVsbCBmZWF0dXJlIHdoZW4geW91IGFyZSBydW5uaW5nIG91dCBvZiBiYXR0ZXJ5IGFu
ZAo+PiB3YW50IHRvIHNhdmUgeW91ciB3b3JrLgo+IEdvdCBpdCwgdGhhbmtzLiBTbyBpdCBzZWVt
cyB3ZSBoYXZlIHR3byBpc3N1ZXMgaGVyZTogYXRoMTFrIGRvZXMgbm90Cj4gc3VwcG9ydCBoaWJl
cm5hdGlvbiBhbmQgYXRoMTFrIG1vZHVsZSByZWxvYWQgZmFpbGluZy4gTGV0J3MgaGFuZGxlIHRo
ZQo+IG1vZHVsZSByZWxvYWQgZmFpbGluZyBpbiBidWcgIzIxNDU0MSwgYnV0IGNhbiB5b3UgZmls
ZSBhbm90aGVyIGJ1ZyBhYm91dAo+IHRoZSBtaXNzaW5nIHN1cHBvcnQgZm9yIGhpYmVybmF0aW9u
PyBMZXQncyBoYXZlIG9uZSBpc3N1ZSBwZXIgYnVnCj4gcmVwb3J0LCBpdCdzIGVhc2llciB0byBt
YW5hZ2UgYnVnemlsbGEgdGhhdCB3YXkuCj4KPj4gQWxzbyBvbmUgbW9yZSBwb2ludCBJJ3ZlIGZv
dW5kIC0gaWYgTUhJIGlzIGNvbmZpZ3VyZWQgaW4gdGhlIGtlcm5lbCAtCj4+IHRoZSBjYXJkIGlz
IHN0YXJ0aW5nIHVwIG9uIHRociBmaXJzdCBib290IGFuZCB3b3Jrcy4gQnV0IGlmIGkKPj4gY29u
ZmlndXJlIE1ISSBhcyBhIG1vZHVsZSAtIGl0IGRvZXMgbm90LiBNSEkgbW9kdWxlIGRvIGxvYWQu
IFNvIGRvCj4+IGF0aDExayBhbmQgYXRoMTFrX3BjaS7CoCBCdXQgdGhlIGxhc3QgYXRoMTFrIGRt
ZXNnIHNheXMgOgo+Pgo+PiBtaGkgbWhpMDogV2FpdCBmb3IgZGV2aWNlIHRvIGVudGVyIFNCTCBv
ciBNaXNzaW9uIG1vZGUKPj4KPj4gRXhhY3RseSBhcyBpZiBJwqAgZG8gcm1tb2QvbW9kcHJvYmUg
c2VxdWVuY2UuCj4+Cj4+IEkgdXNlIGxhdGVzdCBCSU9TIGZyb20gRGVsbCAoaW4gZmFjdCB1cGdy
YWRpbmcgMy4wLjQgdG8gMy4xLjAgZGlkIG5vdAo+PiBjYW5nZSBhbnl0aG5nKSAswqAgYW5kIGhh
dmUgdHJpZWQgbXVsdGlwbGUga2VybmVscy4gU3RhYmxlIDUuMTQgc2VyaWVzCj4+IGFuZCBhdGgx
MWsgZ2l0IHRyZWUgKG5leHQgYW5kIG1hc3Rlci1wZW5kaW5nKS4gTm90aGluZyBoZWxwcy4KPj4g
U29tZXRpbWVzIGl0IHdva3Mgb3V0IC0gSSBoYWQgY291cGxlIG9mIHRpbWVzIHN1Y2Nlc3NmdWxs
eQo+PiBybW1vZC9tb2Rwcm9iZSBhdGgxMWtfcGNpIGJ1dCBpdCBzIGEga2luZCBvZiByYW5kb20g
YW5kIHZlcnkgcmFyZQo+PiBldmVudCAoIEkgaGFkIGl0IDIgdGltZXMgb25seSkuCj4+Cj4+IFNv
IGZvciBtZSBpdCBsb29rcyBsaWtlIGFuIGlzc3VlIGJldHdlZW4gTUhJIGFuZCBhdGgxMWsgLCBi
dXQKPj4gdWJmb3J0dW5hdGVseSBteSBrbm93bGVkZ2UgaXMgbm90IGVub3VnaCB0byBwcm9wb3Nl
IGFueSBzb2x1dGlvbiBoZXJlLgo+IE9uIG15IE5VQyB4ODYgdGVzdCBib3ggSSByZWxvYWQgYXRo
MTFrIG1vZHVsZXMgc2V2ZXJhbCB0aW1lcyBhIGRheSB3aGlsZQo+IEkgdGVzdCBhdGgxMWsgYnV0
IEkgYWx3YXlzIHJlbG9hZCB0aGUgbWhpIG1vZHVsZXMgYXQgdGhlIHNhbWUgdGltZSwKPiBtYXli
ZSB0aGF0IG1ha2VzIHRoZSBkaWZmZXJlbmNlPyBPciBYUFMgMTMgOTMxMCB3b3JrcyBkaWZmZXJl
bnRseSBmcm9tCj4gTlVDLCB0aGF0J3MgYWxzbyBwb3NzaWJsZS4KPgoKLS0gCmF0aDExayBtYWls
aW5nIGxpc3QKYXRoMTFrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9hdGgxMWsK
