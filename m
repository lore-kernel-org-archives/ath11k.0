Return-Path: <SRS0=NPuH=H2=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 068BFC433E0
	for <ath11k@archiver.kernel.org>; Wed, 24 Feb 2021 21:33:16 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7B44A64F08
	for <ath11k@archiver.kernel.org>; Wed, 24 Feb 2021 21:33:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7B44A64F08
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=justinmp.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=OJq/ZWT0CBB/uIpfly7Ys+/iBGWhambTAI05XroZwdc=; b=ZUKpmHOpaMOQdD7n+9gIM7H7v
	1VqmWeJ++Wf84KAd29vNo+YHKPlgccgLt7GBSsQwzpewOqGRpPMX9ZdSSMF1Dt8SAoBAuVxkuxx4U
	T2TP75jWj6esjva8nqhjCWzbZla736sXku2vDzfYo5RnZEwuaeO3fKLrSv2sOneRfECE8TSo+L7mJ
	cNObFAwcSozx10D6chAGM3k88IvblJFYbcthxw4pjIyURPLDun0JehVbzZQ5S+tFi8/KDxgjuVFeY
	JSokTLf42/2g9N7sdRxeFah4sVpVvX6VuZdWxP764Q9dR8082sL3uChrf6Duni+7rjP59ZTUA5RJU
	kMRxcsbQA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lF1mQ-0001Fp-0P; Wed, 24 Feb 2021 21:33:10 +0000
Received: from mail-qk1-x730.google.com ([2607:f8b0:4864:20::730])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lF1mO-0001FT-Ct
 for ath11k@lists.infradead.org; Wed, 24 Feb 2021 21:33:09 +0000
Received: by mail-qk1-x730.google.com with SMTP id x124so3769042qkc.1
 for <ath11k@lists.infradead.org>; Wed, 24 Feb 2021 13:33:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=justinmp-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=ICYIbeNFNzXmRJUUcT3KdZBRagHVM9z74L/nhn21k9o=;
 b=ibx3hTIKXmcXfZy+UUUuIlEQo6VUJDyxfPHHMJMO9R6ZXxAsRPk/DWR90Xe9l5bZsa
 Qe4iPxjvvwth9XaQKJwCb992E2OiarBbFU3ueardp8YIqDyucWLQw8/SlXbZly3Pi8ex
 n2ELirx72rjibJh2DUFtuVIXGcsWFSiwTq9XTtw3IOa8L6GZh+Vp/DrW5yKM/kVXfkMv
 2lFiKUlxBygJphH/OQjxw4ghNt3r2mOx+2+UN83BKZl9ivXaBDJhbevJHin+Ic1airgn
 PrkxBJbqh4pGoK5ykTTODBrwe5uZVmglR3cP9bBtYoXpMhz/vPb3ExfRQQcHR4kUEV6K
 7JOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=ICYIbeNFNzXmRJUUcT3KdZBRagHVM9z74L/nhn21k9o=;
 b=NpzYMWkM3o6p0bmE7ZD8vKLjcnOJeO0yKDGTGGC0QFqjEswrBVZP12/fk201xGnRw1
 2RctR/6Z/WW5nUvQ1JZjUk17RjCnGDnz1TKym7rdKnXOyZjp0O/GLXZZwJH3rHwShRqw
 7Il3sssgGhNGPvxTQwOkn6hjz/vbX2yzrqm2ZzuMTuMtl0gypX5cPKI2NZ/yIhKNFiRU
 2kCzVq/03wL9OYWxOCpD/TLXZ0NwEbpK++4h3mr/HOVp9+B8Yin6V743cfRLBYItT8zP
 QMTD77m7Es5RhriQ3G/A7CE/ea3gGhibRv8VOX3Zqg7h2Hoat4snCKBJl4Jz1Eh6sS6h
 D+FA==
X-Gm-Message-State: AOAM533mZNrdJudVWmzf8GkJUcxHzhciwEqlJf7CEv+HapYTVUP1B8WO
 4rvKkvuf0LRii0uSXhX7IiN+pA==
X-Google-Smtp-Source: ABdhPJy0QyuTor04w/aHosIsj24C1cbPZUwmfGC1CsEOcDznfu/JyFJDJjzGWHhjGSrSI4NfPM8zOQ==
X-Received: by 2002:a05:620a:2041:: with SMTP id
 d1mr32793008qka.326.1614202385664; 
 Wed, 24 Feb 2021 13:33:05 -0800 (PST)
Received: from ?IPv6:2601:184:4a7f:a732::1f1? ([2601:184:4a7f:a732::1f1])
 by smtp.gmail.com with ESMTPSA id 14sm2106086qtx.84.2021.02.24.13.33.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Feb 2021 13:33:04 -0800 (PST)
Subject: Re: Ordering Dell XPS 13 9310 to test QCA6390
To: Stelian Pop <stelian@popies.net>, ath11k@lists.infradead.org
References: <tQQZLjnfaM2XZ-LdgoSYE_9yQQmGCtzT108xBh-SzpRhHN7o6_w_jdIcfp67hVNe-kkiNC72u_rhyo1AtUw-41nvcCo_K3pUhkR__6VF6ig=@mitchellnordine.com>
 <87mtydwy7v.fsf@codeaurora.org> <87h7nli16d.fsf@codeaurora.org>
 <CAHUdJJWpHWznHOhdtuRjbH2tr9F5kagGUbNsFO_f7MfY=w_3Gg@mail.gmail.com>
 <878s8xhx1s.fsf@codeaurora.org>
 <CAHUdJJVk3jDY9FGjPTuDTF2+QK+B8f8s6ZqMA+8uH-7Yd==Mmw@mail.gmail.com>
 <87czwshyn3.fsf@codeaurora.org> <20210224091444.GA30965@calypso>
From: Justin Mazzola Paluska <jmp@justinmp.com>
Message-ID: <bbec5e34-49e4-1e80-0420-63cb046a2c2b@justinmp.com>
Date: Wed, 24 Feb 2021 16:33:03 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210224091444.GA30965@calypso>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210224_163308_551264_07D8361C 
X-CRM114-Status: UNSURE (   9.09  )
X-CRM114-Notice: Please train this message.
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
Cc: kvalo@codeaurora.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

T24gMi8yNC8yMSA0OjE0IEFNLCBTdGVsaWFuIFBvcCB3cm90ZToKPiBUaGVyZSBhcmUgcHJvYmFi
bHkgbXVsdGlwbGUgaXNzdWVzLCB0aGUgZmlyc3Qgb2Ygd2hpY2ggaXMgdGhlIG9uZSBKdXN0aW4K
PiByZXBvcnRlZCAodW5hYmxlIHRvIGdvIHRvIHNsZWVwIHdoZW4gYXRoMTFrIGlzIGxvYWRlZCku
IEkgc3VnZ2VzdCB5b3UKPiBsb29rIGludG8gdGhpcyBCRUZPUkUgdXBkYXRpbmcgdGhlIEJJT1Mu
Li4KClRvIGJlIGNsZWFyLCBzMmlkbGUgd29ya3MgKGFuZCBJIGRvIGdldCBpbnRvIFMwaXggc3Rh
dGVzIHdoZW4gZG9pbmcgCnMyaWRsZSBzdXNwZW5kKSBmb3IgbWUgd2l0aCB0aGUgcHJlLTIuMC4w
IEJJT1MuCgpXaGF0IGRvZXNuJ3Qgd29yayBpcyBvcHBvcnR1bmlzdGljIFMwaXggc3RhdGVzICh3
aGVyZSB0aGUgbWFjaGluZSBnb2VzIAppbnRvIHZlcnkgbG93IHBvd2VyIHN0YXRlcyB3aGVuIG5v
dCBzdXNwZW5kZWQpLgogwqDCoMKgIC0tSnVzdGluCgotLSAKYXRoMTFrIG1haWxpbmcgbGlzdAph
dGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2F0aDExawo=
