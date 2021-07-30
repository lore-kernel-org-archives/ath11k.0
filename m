Return-Path: <SRS0=zwws=MW=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,LOTS_OF_MONEY,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,MONEY_NOHTML,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2802DC4338F
	for <ath11k@archiver.kernel.org>; Fri, 30 Jul 2021 22:11:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E326360F01
	for <ath11k@archiver.kernel.org>; Fri, 30 Jul 2021 22:11:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E326360F01
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gecius.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Khl6xQnqkn/xteQAqNrnW3NkrXVZjMH8fYreLFGjgoY=; b=iYNkBMNa79CBSsrLU+KMY5UmEg
	9CVQ4HrDMaYImmRINrjXFaX/F61IhkMfMYtbUEDY3Ru55m5yBtZDjhoC7HSKQ4B5QX8a4Kb9htzug
	nMm1e4ZiEHyYfCBPjYKJvSZyKd/oLqd0FkmsISB82wnkTuh49YK0C7JF6AtelrwsU4LH7KRDCcItp
	DbpGWSDFe8XolGR+1/vzk+1lDPRTeAbNhpezv/sj+WHfg944vjWjo8cwuN0wvDagvrzJCgTE69bGF
	jjTwPpe1M9uvd3uRSm03x0JJ5aUCSSOKwlIxJLGi1fQ+P81GP+usFFSELJVIvtrgOHPQotRF0vt/O
	T8owob2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m9ajM-00APLQ-G3; Fri, 30 Jul 2021 22:11:48 +0000
Received: from [2a01:4f8:210:31ae:175::25] (helo=bum5.dynsinn.org)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m9ajJ-00APKN-B8
 for ath11k@lists.infradead.org; Fri, 30 Jul 2021 22:11:47 +0000
Received: from [192.168.178.88] (p5791c226.dip0.t-ipconnect.de [87.145.194.38])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: jens@gecius.de)
 by bum5.dynsinn.org (mail2.gecius.de) with ESMTPSA id BC616400E6F2
 for <ath11k@lists.infradead.org>; Sat, 31 Jul 2021 00:11:36 +0200 (CEST)
Subject: Re: Have the QCA6390 patches for XPS 9310 landed yet?
To: ath11k@lists.infradead.org
References: <bP3y5saYYXBGS8eME0-maHlpNyii00kJNgq58St0q7PDo9pXsMd5zmUI-0Jou4dCD91Jf5fjwyPlQb8PaTOGvBBRu0FjYoW1XCjWpzZm-6E=@mitchellnordine.com>
 <87y29nefm7.fsf@codeaurora.org>
 <CAHUdJJWAbwnjUgSXEwVCu7TL6byD26FxZyMN4ZaR4o1eHQypYA@mail.gmail.com>
 <bc4f75cb-89f9-fc15-b18e-2348e5d0c607@justinmp.com>
From: Jens Gecius <jens@gecius.de>
Message-ID: <f5648123-c612-bb5a-dce4-1022aedc28c8@gecius.de>
Date: Sat, 31 Jul 2021 00:11:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <bc4f75cb-89f9-fc15-b18e-2348e5d0c607@justinmp.com>
Content-Language: de-DE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210730_151145_594371_7C0F97BD 
X-CRM114-Status: GOOD (  23.32  )
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

CgpBbSAzMC4wNy4yMSB1bSAyMzo1MiBzY2hyaWViIEp1c3RpbiBNYXp6b2xhIFBhbHVza2E6Cj4g
T24gNy8zMC8yMSA0OjA4IFBNLCB3aSBuayB3cm90ZToKPj4gT24gRnJpLCBKdWwgMzAsIDIwMjEg
YXQgMTA6MDEgUE0gS2FsbGUgVmFsbyA8a3ZhbG9AY29kZWF1cm9yYS5vcmc+IAo+PiB3cm90ZToK
Pj4+IE1pdGNoZWxsIE5vcmRpbmUgPG1haWxAbWl0Y2hlbGxub3JkaW5lLmNvbT4gd3JpdGVzOgo+
Pj4KPj4+PiBIaSBrdmFsbyBhbmQgd2luayEKPj4+Pgo+Pj4+IEl0J3MgYmVlbiBhIHdoaWxlIHNp
bmNlIEkndmUgaGFkIGEgY2hhbmNlIHRvIGNoZWNrIGluIG9uIHRoaXMgLSBoYXZlIEkKPj4+PiBt
aXNzZWQgYW55IFFDQTYzOTAgcHJvZ3Jlc3M/Cj4+Pj4KPj4+PiBDdXJyZW50bHkgdGhlIG5peG9z
LWhhcmR3YXJlIHJlcG8gaXMgZml4ZWQgdG8gNS4xMC4xOCBhbG9uZyB3aXRoIG1vc3QKPj4+PiBv
ZiB0aGUgcGF0Y2hlcyBvbiBhdGgxMWstcWNhNjM5MC1icmluZ3VwLCBhcGFydCBmcm9tIHR3byBj
b21taXRzIHRoYXQKPj4+PiBJJ20gc3VyZSB3ZXJlIG1lcmdlZCBhIHdoaWxlIGFnby4KPj4+Pgo+
Pj4+IGh0dHBzOi8vZ2l0aHViLmNvbS9OaXhPUy9uaXhvcy1oYXJkd2FyZS9ibG9iLzMxZjYxYjkw
ZGRiOTI1N2I5NDg4OGVlMTdjY2Y5NjIzNmUxODBjNzYvZGVsbC94cHMvMTMtOTMxMC9kZWZhdWx0
Lm5peCNMMTQgCj4+Pj4KPj4+Pgo+Pj4+IEp1c3Qgd29uZGVyaW5nIGlmIHRoZSByZXN0IG9mIHRo
ZSBwYXRjaGVzIG9yIHNvbWUgYWx0ZXJuYXRpdmUgZml4ZXMKPj4+PiBoYXZlIGxhbmRlZCBpbiBh
IG1vcmUgcmVjZW50IHZlcnNpb24gb2YgdGhlIGtlcm5lbCB5ZXQsIGFuZCB3aGV0aGVyCj4+Pj4g
aXQncyB3b3J0aCBkaXZpbmcgaW4gYW5kIHVwZGF0aW5nIG91ciBuaXggZXhwciB5ZXQ/Cj4+PiBC
YXNpY2FsbHkgYWxsIHlvdSBuZWVkIGlzIGEgQklPUyB1cGRhdGUgZm9yIFhQUyA5MzEwICh0byBn
ZXQgMzIgTVNJCj4+PiB2ZWN0b3JzIHdvcmtpbmcpIGFuZCBhIHJlY2VudCBMaW51eCByZWxlYXNl
LiBJIGRvbid0IHJlbWVtYmVyIHRoZSBleGFjdAo+Pj4ga2VybmVsIHJlbGVhc2UsIGFuZCBjYW4n
dCBjaGVjayBpdCBub3csIGJ1dCBzb21ldGhpbmcgbGlrZSB2NS4xMiBvcgo+Pj4gdjUuMTMgc2hv
dWxkIHdvcmsgd2l0aG91dCBleHRyYSBwYXRjaGVzLgo+Pj4KPj4+IC0tIAo+Pj4gaHR0cHM6Ly9w
YXRjaHdvcmsua2VybmVsLm9yZy9wcm9qZWN0L2xpbnV4LXdpcmVsZXNzL2xpc3QvCj4+Pgo+Pj4g
aHR0cHM6Ly93aXJlbGVzcy53aWtpLmtlcm5lbC5vcmcvZW4vZGV2ZWxvcGVycy9kb2N1bWVudGF0
aW9uL3N1Ym1pdHRpbmdwYXRjaGVzIAo+Pj4KPj4+Cj4+PiAtLSAKPj4+IGF0aDExayBtYWlsaW5n
IGxpc3QKPj4+IGF0aDExa0BsaXN0cy5pbmZyYWRlYWQub3JnCj4+PiBodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2F0aDExawo+Pgo+PiBIZXkgTWl0Y2hlbGwhCj4+
Cj4+IMKgwqAgSnVzdCB0byBhZGQgYSBsaXR0bGUsIERlbGwgcmVsZWFzZWQgYSBCSU9TIHVwZGF0
ZSB0aGF0IG5vdyBhbGxvd3MKPj4gdGhlIGRyaXZlciB0byBvYnRhaW4gYWxsIDMyIE1TSSB2ZWN0
b3JzIChJIHBvc3RlZCBhcm91bmQgdGhlIHRpbWUgdGhhdAo+PiBoYXBwZW5lZCBpZiB5b3UgbmVl
ZCB0aGUgZWFybGllc3QgdmVyc2lvbiwgb3RoZXJ3aXNlIGp1c3QgZ3JhYiB0aGUKPj4gbGF0ZXN0
IHZlcnNpb24pLsKgIEkndmUgYmVlbiBydW5uaW5nIDUuMTIgYW5kIDUuMTMgd2l0aG91dCBXSUZJ
IGlzc3Vlcy4KPj4gT2NjYXNpb25hbGx5IEkgc3RpbGwgaGF2ZSBibHVldG9vdGggcHJvYmxlbXMg
YW5kIHRoZSBpOTE1IGRyaXZlcnMgYXJlCj4+IGNhdXNpbmcgdmlkZW8gYXJ0aWZhY3RzIHJhbmRv
bWx5LCBidXQgdGhlIHdpcmVsZXNzIGNvbm5lY3Rpb24gc2VlbXMKPj4gcHJldHR5IHNvbGlkIGF0
IHRoaXMgcG9pbnQuCj4KPiBXaGljaCBCSU9TIGRvIHlvdSBoYXZlP8KgIEkgaGF2ZSAxLjIuNS4K
Ckp1c3QgdG8gYWRkIG15IGV4cGVyaWVuY2UgLSBXaUZpIGFuZCBCVCBhcmUgd29ya2luZy4gSSdt
IG9uIEJJT1MgMy4wLjQgCih1cGdyYWRlZCB0b2RheSB2aWEgZnd1cGRtZ3IgLyBsdmZzKSB3aXRo
IDUuMTMuNSAvIGZlZG9yYSAzNCAvIHhwcyA5MzEwIAozMkcgZGV2IGVkaXRpb24uIEJUIHdvcmtz
IHNpbmNlIEJJT1MgMi5zb21ldGhpbmcgYW5kIGtlcm5lbCA1LjEyCgpObyBtZW1tYXAga2VybmVs
IHBhcmFtZXRlciBuZWVkZWQuCgo+Cj4gSSdtIGN1cnJlbnRseSBydW5uaW5nIDUuMTMgd2l0aCBh
IHBhdGNoIHRoYXQgcmV2ZXJ0ZWQgCj4gMzU3OTk5NDQ3NmI2NWNiNWUyNzJmZjBmNzIwYTFmZDMx
MzIyZTUzZi7CoCBJIG5lZWRlZCB0byBkbyB0aGF0IG9yIHRoZSAKPiA1LjEzIGtlcm5lbCB3b3Vs
ZG4ndCBjb25uZWN0IHRvIG15IGFjY2VzcyBwb2ludCBiZWNhdXNlIHRoZSBmaXJtd2FyZSAKPiBj
cmFzaGVkLsKgIChJIGdvdCB0aGF0IHBvaW50ZXIgZnJvbSAKPiBodHRwczovL2J1Z3ppbGxhLmtl
cm5lbC5vcmcvc2hvd19idWcuY2dpP2lkPTIxMjA1OS4pwqAgV2l0aCAzNTc5OTkgCj4gcmV2ZXJ0
ZWQsIGV2ZXJ5dGhpbmcgd29ya3Mgd2VsbC4KPgo+IEkgc3RpbGwgaGF2ZSB0aGUgbWVtbWFwPTIw
TSQxMk0ga2VybmVsIGFyZ3VtZW50IHNldCBmcm9tIHRoZSBvbGQgcWNhIAo+IGJyaW5ndXAgYnJh
bmNoIGRheXMuwqAgRG8geW91IGFsc28gdXNlIHRoYXQ/Cj4gwqDCoMKgwqAgLS1KdXN0aW4KPgoK
Ci0tIAphdGgxMWsgbWFpbGluZyBsaXN0CmF0aDExa0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vYXRoMTFrCg==
