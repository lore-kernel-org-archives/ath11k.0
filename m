Return-Path: <SRS0=NPuH=H2=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 394E5C433E0
	for <ath11k@archiver.kernel.org>; Wed, 24 Feb 2021 22:38:24 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EC00464EDD
	for <ath11k@archiver.kernel.org>; Wed, 24 Feb 2021 22:38:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EC00464EDD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=justinmp.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=fqlPrNHObGcqrnPW+xxYplwy/sNZBC36jilULONeILQ=; b=q0Ucv1F0kH72I0qc+FB6PLjpM
	IoAbqgC0BqipL6kN+AKSIItcAbLHobVxMM6CPF7A3dBV5+Kn58rNMieRx4A/O+c2PdklcYOrWdaxd
	0W8sHaDk4LY4qzF3aGtAYJwOyWT97rN8PmHesAwBLbkSgqEgk0mK9S0C4pl7iBCR3qrWls1VLto8o
	AqrWEbsfNFbgTMa9j0AV70um02EzZFvPkHMhSS7xOdoKHF4AKmbuE8MYGG0KosHVMFPhtDG/ZF18w
	PnotsRfwmAr/RYT5sO6B9CdDcpxUFkUuKwT1316C/NSLwrxrgjQR9EThSlZIdkCIsAb4pmg89j4f+
	e0h56GnLA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lF2nU-0004zw-LZ; Wed, 24 Feb 2021 22:38:20 +0000
Received: from mail-qk1-x72b.google.com ([2607:f8b0:4864:20::72b])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lF2nS-0004zN-Ac
 for ath11k@lists.infradead.org; Wed, 24 Feb 2021 22:38:19 +0000
Received: by mail-qk1-x72b.google.com with SMTP id v206so3929327qkb.3
 for <ath11k@lists.infradead.org>; Wed, 24 Feb 2021 14:38:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=justinmp-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=4vZg0LV48t0YaZJc2NO1L36p1EJeXhlgF/iJovv/qkU=;
 b=ZIq5WhSK0ephlevu/Xoiixl686rNRR+6ydpdpuZ5tv9MJGvlIDUAoACV4UkzvUb4ru
 hPyXwcI93/GS9z8RfGcuZbk2jiuU68CofW6MP8yslK2ZydTlNqooNVrxZBt+vzGvl1nG
 7BD63xPp6g+tiaruKJFBv5jAKwHkmcDn1b8IIyAVlRx4BKrqgFDeMjl/Wlbgj0+YY1Qp
 xYJBniokmo4cZokzauatnU2O7PmNiZJT0j/w2zGeHWD1zPBScCM6iO0LNiubch8yjAoZ
 Zp/8YOh/izH7SSbCCD5B6IkF43KMOEPNFEtA6J7PAkUCc1XjLD77Cd5Oglsd7mlTSPz/
 CSJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=4vZg0LV48t0YaZJc2NO1L36p1EJeXhlgF/iJovv/qkU=;
 b=rgNxFIpE+2q7bQkUyePk3/DCnzyjiP1bGZ3ZJwD2i028LW2qbSbspmtcYqHJdjVYHq
 Y3L1x+RCKud5sAhNbKDLgT4IVQfnWTZQAiypzLmhezESS48v9G30MYDGhMrghVctsczx
 GSCT79OsLDwnFfzCBcYiKDqACU2XHDNgKcnjOWO2d/GR6++c2kbzXOnapRHxKfXuImVC
 HGOH1aHvHEAPnQExJbILhJsS7kNPugVar2zQA5NNdxf3SbQbWULM3+t8JopWYtTR1ko+
 8MFXWCrCubYL7Rn4Dldj+zmkFOIUHtmMrKo20r0bxmmua2OVAhcPqySOAeRppfxZHRAl
 FoCA==
X-Gm-Message-State: AOAM530Nd2ej5OBxNokF/CtVfgFN8rb2iFu/vD3UKOTwAKATYcpdHbdH
 Ko6vEXpTtiTOleEURdMx4rJUiw==
X-Google-Smtp-Source: ABdhPJy0ffqlesdiYx/Y9bu3DOEgvX0nSnceXqwK62frqyvpf5eY0DkxoZrVuo/Y7P3kj7NHFY3nYQ==
X-Received: by 2002:a37:aa4b:: with SMTP id t72mr194822qke.365.1614206296288; 
 Wed, 24 Feb 2021 14:38:16 -0800 (PST)
Received: from ?IPv6:2601:184:4a7f:a732::1f1? ([2601:184:4a7f:a732::1f1])
 by smtp.gmail.com with ESMTPSA id u13sm2269342qtq.87.2021.02.24.14.38.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Feb 2021 14:38:15 -0800 (PST)
Subject: Re: Ordering Dell XPS 13 9310 to test QCA6390
To: Stelian Pop <stelian@popies.net>
References: <tQQZLjnfaM2XZ-LdgoSYE_9yQQmGCtzT108xBh-SzpRhHN7o6_w_jdIcfp67hVNe-kkiNC72u_rhyo1AtUw-41nvcCo_K3pUhkR__6VF6ig=@mitchellnordine.com>
 <87mtydwy7v.fsf@codeaurora.org> <87h7nli16d.fsf@codeaurora.org>
 <CAHUdJJWpHWznHOhdtuRjbH2tr9F5kagGUbNsFO_f7MfY=w_3Gg@mail.gmail.com>
 <878s8xhx1s.fsf@codeaurora.org>
 <CAHUdJJVk3jDY9FGjPTuDTF2+QK+B8f8s6ZqMA+8uH-7Yd==Mmw@mail.gmail.com>
 <87czwshyn3.fsf@codeaurora.org> <20210224091444.GA30965@calypso>
 <bbec5e34-49e4-1e80-0420-63cb046a2c2b@justinmp.com>
 <20210224220246.GA6104@calypso>
From: Justin Mazzola Paluska <jmp@justinmp.com>
Message-ID: <ca0dc6e4-364e-2525-b7d6-d02c2dc0c5fd@justinmp.com>
Date: Wed, 24 Feb 2021 17:38:12 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210224220246.GA6104@calypso>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210224_173818_514911_E7238569 
X-CRM114-Status: GOOD (  15.89  )
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
Cc: ath11k@lists.infradead.org, kvalo@codeaurora.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

CgpPbiAyLzI0LzIxIDU6MDIgUE0sIFN0ZWxpYW4gUG9wIHdyb3RlOgo+IFtTb3JyeSBmb3IgdGhl
IHByZXZpb3VzIEhUTUwgbWFpbC4uLl0KPgo+IEhpIEp1c3RpbiwKPgo+IE9uIFdlZCwgRmViIDI0
LCAyMDIxIGF0IDA0OjMzOjAzUE0gLTA1MDAsIEp1c3RpbiBNYXp6b2xhIFBhbHVza2Egd3JvdGU6
Cj4+IE9uIDIvMjQvMjEgNDoxNCBBTSwgU3RlbGlhbiBQb3Agd3JvdGU6Cj4+PiBUaGVyZSBhcmUg
cHJvYmFibHkgbXVsdGlwbGUgaXNzdWVzLCB0aGUgZmlyc3Qgb2Ygd2hpY2ggaXMgdGhlIG9uZSBK
dXN0aW4KPj4+IHJlcG9ydGVkICh1bmFibGUgdG8gZ28gdG8gc2xlZXAgd2hlbiBhdGgxMWsgaXMg
bG9hZGVkKS4gSSBzdWdnZXN0IHlvdQo+Pj4gbG9vayBpbnRvIHRoaXMgQkVGT1JFIHVwZGF0aW5n
IHRoZSBCSU9TLi4uCj4+IFRvIGJlIGNsZWFyLCBzMmlkbGUgd29ya3MgKGFuZCBJIGRvIGdldCBp
bnRvIFMwaXggc3RhdGVzIHdoZW4gZG9pbmcgczJpZGxlCj4+IHN1c3BlbmQpIGZvciBtZSB3aXRo
IHRoZSBwcmUtMi4wLjAgQklPUy4KPiBBcyB5b3Ugc2FpZCBwcmV2aW91c2x5LCBlbnRlcmluZyBT
MGl4IG9ubHkgd29ya3MgaWYgeW91ICdyZmtpbGwgYmxvY2sgYWxsJwo+IGZpcnN0IGJlZm9yZSBn
b2luZyBpbnRvIHMyaWRsZSBzdXNwZW5kLiBUaGF0IHdhcyB0aGUgaXNzdWUgSSB3YXMgcmVmZXJy
aW5nCj4gdG8uCgpObywgdGhlIGJlaGF2aW9yIEkgc2VlIG9uIGEgcHJlLTIuMC4wIEJJT1MgaXM6
CgpzMmlkbGUgc3VzcGVuZCB3b3JrcyB3ZWxsIChpbmNsdWRpbmcgZ2V0dGluZyBpbnRvIFMwaXgg
c3RhdGVzKSB3aXRoIG5vIAplZmZvcnQgb24gbXkgcGFydC7CoCBJIGhhdmUgbm8gaWRlYSBpZiBz
MmlkbGUgZG9lcyByZmtpbGwgYnkgaXRzZWxmLCBidXQgCmFsbCBJIGRvIGlzIHNodXQgdGhlIGxp
ZCBhbmQgdGhlIHJpZ2h0IHRoaW5nIGhhcHBlbnMuCgpPcHBvcnR1bmlzdGljIFMwaXggKHdoZW4g
dGhlIGxhcHRvcCBpcyBmdWxseSBwb3dlcmVkIHVwIGFuZCBpbiB1c2UpIG9ubHkgCmhhcHBlbnMg
aWYgSSB1c2UgcmZraWxsIHRvIHNodXQgZG93biBXaUZpIGFuZCBCbHVldG9vdGguwqAgSWYgZWl0
aGVyIFdpRmkgCm9yIEJsdWV0b290aCBhcmUgb24sIHRoZSBsYXB0b3Agc3RheXMgaW4gcG93ZXIg
c3RhdGVzIHdlbGwgYWJvdmUgdGhlIApsb3dlc3QtcG93ZXIgU09peCBzdGF0ZXMuCgpJdCBzb3Vu
ZHMgbGlrZSB0aGUgMi4wLjAgQklPUyBwcmV2ZW50cyB3aGF0ZXZlciBzMmlkbGUgaXMgZG9pbmcg
ZnJvbSAKd29ya2luZyB3aXRob3V0IGFuIHJma2lsbC4KIMKgwqDCoCAtLUp1c3RpbgoKLS0gCmF0
aDExayBtYWlsaW5nIGxpc3QKYXRoMTFrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9hdGgxMWsK
