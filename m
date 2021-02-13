Return-Path: <SRS0=fg25=HP=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D982C433DB
	for <ath11k@archiver.kernel.org>; Sat, 13 Feb 2021 19:10:20 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 95CA464E3D
	for <ath11k@archiver.kernel.org>; Sat, 13 Feb 2021 19:10:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 95CA464E3D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=justinmp.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=SdWcoovO7wuT7vs22WdxqP/l+cYifgJXBm5NoeUty8A=; b=UEOb/v3tI7zVrpvvJo6bwpgGy
	IyY4UWQrvtLm6dut0SUTtDBgDkJdQGENoeeOLLSPMWzKkjcHz1Azyf+IlOQeepjTTDDGDaaJqpyA7
	4k1vyPkq1P5hf4FLv3/vF/DoY00HY8wBeNUG9+VLJ+xs7484o+xv7j95KS6hJRrkYRd51eLNUbS94
	+TfF5wlavJsISDSoMvBZnscXQ+Q0eUKnfYjO91kY1VmuAkVqIpxX1D2eJ64UWdy5t7iGbQod1NxUq
	wh1QA+uXG9ks31lvKKhbb3U6nb5U/sG+3BIlBCsuxvuPfD66PX9jAMGXdg2Odw593GYCcleJ5VP9+
	WfuqVk5Ig==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lB0J5-0004TD-Ns; Sat, 13 Feb 2021 19:10:15 +0000
Received: from mail-qv1-xf2c.google.com ([2607:f8b0:4864:20::f2c])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lB0J3-0004SX-Cd
 for ath11k@lists.infradead.org; Sat, 13 Feb 2021 19:10:14 +0000
Received: by mail-qv1-xf2c.google.com with SMTP id t18so1418269qvn.8
 for <ath11k@lists.infradead.org>; Sat, 13 Feb 2021 11:10:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=justinmp-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=xfc84tRJdQ+r47o9nBmC13eNffNHT4BvWEdxMB4Kddw=;
 b=CLc0aO+jwa307D0KlnOs9LL+NZyH1UxbOr5jH6hH+wRWQCTJERCGvSsxaq/ARf6tP+
 6NTCCl996Yx+LqsOw3M8/aX/9ZoJoe0siFaUudnjwDa6ud6H6NiXeoo3WIvchKDU2C00
 kX22+5t7+J6vyUNOh+eyPeNROivmkc/kzVj+Siro78gjbY4XRaGQMAG9LAHVGMzCjt8Y
 oWlbhM70fgklGQ+lOVhDB5QMCgN1fxAi0JLfc2BNGfKf6wrO+7VL9Y1r36ScmZd5VBcv
 DaaDpCCStwXWY0jDrv0TD88G8SWR6jWeg0aB4crVHbpe14GjeW3q9gBft3k3RftSlrPp
 NeTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=xfc84tRJdQ+r47o9nBmC13eNffNHT4BvWEdxMB4Kddw=;
 b=pEuRLxEChSr7gWtOsNKBWCuLLhYrRmoauvoJmpDihKlFVTRCJumdYxRumdLUs+/VpV
 X7VhuDvbpZ+iGxEVwgl5QJsU/qqU3rvcls/BkpDf0D+nUeOO06r8cKXc7kw/VYsi1scR
 E2D/b8qkPvpdg3mNx40Wfn0I1iPDmFrEajomQQ4djRr66RGT92elrVEJhOTCKp/d6aHY
 61JJeYYvbqOeISZbuyYA5nbKRkgt+2CT6KHT7dm1SRxVA8yu+nnRoymuxJE8NdPoMEr0
 ckkd2RHYTrsfAZeszt4S/kmoVuePVKzqYouH7pEsMHu9ZFGH/1zc0SrfLFzbA7zgU6j1
 okLQ==
X-Gm-Message-State: AOAM533AR0US1pqhryUNRRJbcJyDgLy9Z2avVidMEW1VKMVBaCu4REt9
 peLP+LGiv73+Tg/FgX+KmgFtTEbFtYwVSCMY
X-Google-Smtp-Source: ABdhPJxnN3CvXKYkrw5Auv/7DVJXfLi8p9TJcKesq/jP1EDTJibb1dn/KMnyCqRLJghJacWC0098NA==
X-Received: by 2002:a05:6214:1110:: with SMTP id
 e16mr7986616qvs.62.1613243409431; 
 Sat, 13 Feb 2021 11:10:09 -0800 (PST)
Received: from ?IPv6:2601:184:4a7f:a732::1f1? ([2601:184:4a7f:a732::1f1])
 by smtp.gmail.com with ESMTPSA id i5sm1848873qtw.3.2021.02.13.11.10.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 13 Feb 2021 11:10:09 -0800 (PST)
Subject: Re: Ordering Dell XPS 13 9310 to test QCA6390
To: Kalle Valo <kvalo@codeaurora.org>
References: <tQQZLjnfaM2XZ-LdgoSYE_9yQQmGCtzT108xBh-SzpRhHN7o6_w_jdIcfp67hVNe-kkiNC72u_rhyo1AtUw-41nvcCo_K3pUhkR__6VF6ig=@mitchellnordine.com>
 <87mtydwy7v.fsf@codeaurora.org> <87h7nli16d.fsf@codeaurora.org>
 <CAHUdJJWpHWznHOhdtuRjbH2tr9F5kagGUbNsFO_f7MfY=w_3Gg@mail.gmail.com>
 <878s8xhx1s.fsf@codeaurora.org>
 <CAHUdJJVk3jDY9FGjPTuDTF2+QK+B8f8s6ZqMA+8uH-7Yd==Mmw@mail.gmail.com>
 <075eed74b59afc9bc4f870aea6765f85d040cf47.camel@ciena.com>
 <874kjkix7m.fsf_-_@codeaurora.org>
 <97390297b66298e485ac5d477594b7d31d3aa7df.camel@ciena.com>
 <ef858ed0-b561-cf30-8741-bb3d85b22d83@justinmp.com>
 <87ft21sqpr.fsf@codeaurora.org>
From: Justin Mazzola Paluska <jmp@justinmp.com>
Message-ID: <01ab528c-7b35-4cf5-9147-bf74dd097bbc@justinmp.com>
Date: Sat, 13 Feb 2021 14:10:07 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <87ft21sqpr.fsf@codeaurora.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210213_141013_467875_0FF0C04D 
X-CRM114-Status: GOOD (  18.77  )
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
Cc: "Luo, Sining" <sluo@ciena.com>,
 "ath11k@lists.infradead.org" <ath11k@lists.infradead.org>,
 "wink@technolu.st" <wink@technolu.st>,
 "mail@mitchellnordine.com" <mail@mitchellnordine.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

T24gMi8xMi8yMSAyOjE0IEFNLCBLYWxsZSBWYWxvIHdyb3RlOgo+IEp1c3RpbiBNYXp6b2xhIFBh
bHVza2EgPGptcEBqdXN0aW5tcC5jb20+IHdyaXRlczoKPj4gSSdtIHN0aWxsIHVzaW5nIHRoZSBh
dGgxMWstcWNhNjM5MC1icmluZ3VwLTIwMjAxMjE0MDkzOCBicmFuY2guwqAgSSdtCj4+IGhhcHB5
IHRvIHRyeSBvdXQgbmV3IHBhdGNoZXMsIHBhcnRpY3VsYXJseSBvbmVzIHJlbGF0ZWQgdG8gcG93
ZXIKPj4gbWFuYWdlbWVudC7CoCBUaGUgbGFwdG9wIGRvZXNuJ3QgZ2V0IGludG8gc3RhdGVzIGxv
d2VyIHRoYW4gcGM2IHdoaWxlCj4+IHRoZSB3aXJlbGVzcyBjYXJkIGlzIHJ1bm5pbmcuwqAgSWYg
SSBzaHV0IGRvd24gdGhlIGNhcmQsIHRoZSBsYXB0b3AKPj4gd2lsbCBvcHBvcnR1bmlzdGljYWxs
eSBnZXQgZG93biBpbnRvIHRoZSBwYzEwIHN0YXRlLCB3aGljaCBsZWFkcyB0bwo+PiBtYXNzaXZl
IHBvd2VyIHNhdmluZ3MuCj4gSSdtIG5vdCBmYW1pbGlhciB3aXRoIHBjIHN0YXRlcywgZG8geW91
IGhhdmUgYW55IHBvaW50ZXJzPyBIb3cgZG8geW91Cj4gY2hlY2sgdGhlIHN0YXRlcyB5b3Vyc2Vs
Zj8KCiJjIiBzdGF0ZXMgYXJlIHBvd2VyIHNhdmluZyBzdGF0ZXMgZm9yIGEgY29yZS7CoCAicGMi
IHN0YXRlcyBhcmUgcGFja2FnZSAKYy1zdGF0ZXMgYW5kIGFyZSBkZWVwZXIgcG93ZXIgc2F2aW5n
IHN0YXRlcyB0aGF0IGNhbiBvbmx5IGJlIHJlYWNoZWQgCndoZW4gYWxsIGNvcmVzIGluIGEgcGFj
a2FnZSBhcmUgaW4gbG93LXBvd2VyIGMtc3RhdGVzLiBIaWdoZXIgbnVtYmVyZWQgCnN0YXRlcyBz
YXZlIG1vcmUgcG93ZXIgdGhhbiBsb3dlciBudW1iZXJlZCBzdGF0ZXMuIEdldHRpbmcgaW50byB0
aGUgCmxvd2VzdC1wb3dlciBzdGF0ZXMgKHBjMTApIGFsbG93cyB0aGUgc3lzdGVtIHRvIGdldCBp
bnRvIHdoYXQgSW50ZWwgCmNhbGxzICJTMGl4IiBpZGxlIHN0YXRlcyB0aGF0IHNhdmUgYSBsb3Qg
b2YgcG93ZXIuCgpUaGUgYmVzdCBwb2ludGVycyBJIGhhdmUgZm9yIHRoaXMgc3R1ZmYgaXMgCmh0
dHBzOi8vMDEub3JnL2Jsb2dzL3F3YW5nNTkvMjAxOC9ob3ctYWNoaWV2ZS1zMGl4LXN0YXRlcy1s
aW51eCAuIEl0J3MgCndyaXR0ZW4gZm9yIGEgbGF5IHVzZXIsIG5vdCBhIGtlcm5lbCBkZXZlbG9w
ZXIuIApodHRwczovLzAxLm9yZy9ibG9ncy9xd2FuZzU5LzIwMjAvbGludXgtczBpeC10cm91Ymxl
c2hvb3RpbmcgZ29lcyBpbnRvIAptb3JlIGRldGFpbC4KCkkgZ2VuZXJhbGx5IGNoZWNrIHRoZSBz
dGF0ZXMgdXNpbmcgcG93ZXJ0b3AuwqAgSWYgeW91IHJ1biBwb3dlcnRvcCBhbmQgCnRhYiBvdmVy
IHRvIHRoZSAiSWRsZSBzdGF0cyIgdGFiLCB0aGUgbGVmdC1tb3N0IGNvbHVtbiBoYXMgdGhlIHBj
IHN0YXRlcy4KCkl0J3MgYWxzbyBwb3NzaWJsZSB0byB1c2UgYSBwcm9ncmFtIGZyb20gSW50ZWwg
Y2FsbGVkIHR1cmJvc3RhdC4gKE9uIApEZWJpYW4gYW5kIGRlcml2YXRpdmVzLCB0dXJib3N0YXQg
aXMgaW4gdGhlIGxpbnV4LWNwdXBvd2VyIHBhY2thZ2UuKcKgIAp0dXJib3N0YXQgc3BpdHMgb3V0
IGZyZXF1ZW5jeSBhbmQgcG93ZXIgaW5mb3JtYXRpb24gdG8gc3Rkb3V0IGFuZCBpcyB3YXkgCmJl
dHRlciBmb3Igc2NyaXB0aW5nIGNvbXBhcmVkIHRvIHBvd2VydG9wLgoKPiBBdCB0aGUgbW9tZW50
IGluIHN1c3BlbmQgd2UgbGVhdmUgdGhlIGZpcm13YXJlIHJ1bm5pbmcgaW4gbG93IHBvd2VyCj4g
c3RhdGUgZHVlIHRvIHByb2JsZW1zIGluIE1ISS4gVGhlIGlkZWFsIHN0YXRlIHdvdWxkIGJlIHRv
IHBvd2VyIG9mZiB0aGUKPiBmaXJtd2FyZSBlbnRpcmVseSwgYnV0IHRoYXQgbmVlZHMgY2hhbmdl
cyBpbiBNSEkuIEJ1dCBJIHN1c3BlY3QgeW91IGFyZQo+IG5vdCB0YWxraW5nIGFib3V0IHN1c3Bl
bmQuCgpJbmRlZWQsIEknbSBub3QgdGFsa2luZyBhYm91dCBzdXNwZW5kLCBJJ20gdGFsa2luZyBh
Ym91dCB3aGVuIHRoZSAKY29tcHV0ZXIgaXMgYXdha2UsIGJ1dCBpZGxlIGJlY2F1c2UgSSdtIG5v
dCBwdXR0aW5nIG11Y2ggbG9hZCBvbiBpdC7CoCAKRm9yIGV4YW1wbGUsIHdoZW4gcmVhZGluZyBh
IFBERiwgdGhlIGNvbXB1dGVyIGRvZXNuJ3QgbmVlZCB0byBkbyBtdWNoIAphbmQgY2FuIGdvIGlu
dG8gYSB2ZXJ5IGxvdy1wb3dlciBzdGF0ZS4KCldoYXQncyBpbnRlcmVzdGluZyBhYm91dCB0aGUg
RGVsbCBYUFMgOTMxMCBpcyB0aGF0IHN1c3BlbmQgaXMgbm8gbG9uZ2VyIAp0aGUgZ29vZCBvbGQg
UzMgInMycmFtIiBzdXNwZW5kLCBidXQgcmF0aGVyIFMwaXggInMyaWRsZSIgc3VzcGVuZC7CoCAK
TWljcm9zb2Z0IGhhcyBiZWVuIHB1c2hpbmcgczJpZGxlIGtpbmQgb2Ygc3VzcGVuZCBhcyAiTW9k
ZXJuIFN0YW5kYnkiIAphbmQgYXMgb2YgVGlnZXIgTGFrZSwgSW50ZWwgb25seSBhbGxvd3MgczJp
ZGxlLgoKWW91J2xsIG5vdGUgdGhhdCB0aGUgd29yZCBTMGl4IGFwcGVhcnMgYm90aCBmb3IgczJp
ZGxlIHN1c3BlbmQgYW5kIGZvciAKdGhlIHBjIHN0YXRlcyBwb3dlciBtYW5hZ2VtZW50IHN0dWZm
IGFib3ZlLsKgIEl0J3MgYmVjYXVzZSB0aGV5J3JlIHRoZSAKc2FtZSEgSXQncyB0aGVvcmV0aWNh
bGx5IHBvc3NpYmxlIGZvciBhIHJ1bm5pbmcgY29tcHV0ZXIgdG8gCm9wcG9ydHVuaXN0aWNhbGx5
IGdldCBpdHNlbGYgaW50byBhIFMwaXggc3RhdGUgdGhhdCdzIGFsbW9zdCBhcyBsb3cgCnBvd2Vy
IGFzIHMyaWRsZS4KCldoZW4gSSBoYWQgYWNjZXNzIHRvIGEgRGVsbCBYUFMgOTMwMCAoSW50ZWwg
MTB0aCBHZW4gQ1BVICYgSW50ZWwgV2lGSSksIApJIHJhbiBwb3dlcnRvcCB3aGlsZSBJIHdlbnQg
YWJvdXQgbXkgbm9ybWFsIHVzYWdlIGFuZCB0aGUgOTMwMCB3b3VsZCAKcmVndWxhcmx5IGdldCBp
dHNlbGYgaW50byBwYzEwIHN0YXRlcyB3aGVuIEkgd2FzIHJlYWRpbmcgYSBQREYgYW5kIEkgCndh
c24ndCBhY3RpdmVseSB1c2luZyB0aGUgbmV0d29yayAodGhlIGNhcmQgd2FzIGNvbm5lY3RlZCB0
byBteSBhY2Nlc3MgCnBvaW50IGFuZCBJIGhhZCBjb25uZWN0aW9ucyBvcGVuLCBidXQgbm9uZSBv
ZiB0aGVtIHdlcmUgYWN0aXZlbHkgCnRyYW5zbWl0dGluZyBkYXRhKS4KClRoZSBEZWxsIFhQUyA5
MzEwIHRoYXQncyBteSBkYWlseSBkcml2ZXIgY2FuIGdldCBpbnRvIGEgcGM2IHN0YXRlIHdoZW4g
CmRvaW5nIGEgc2ltaWxhciB0YXNrLCBidXQgd29uJ3QgZ28gaW50byBhIHBjMTAgb3IgczBpeCBz
dGF0ZSB1bnRpbCBJIApkaXNhYmxlIFdpRmkuCiDCoMKgwqAgLS1KdXN0aW4KCi0tIAphdGgxMWsg
bWFpbGluZyBsaXN0CmF0aDExa0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vYXRoMTFrCg==
