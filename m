Return-Path: <SRS0=rto1=NR=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14961C432BE
	for <ath11k@archiver.kernel.org>; Thu, 26 Aug 2021 11:01:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D525661026
	for <ath11k@archiver.kernel.org>; Thu, 26 Aug 2021 11:01:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D525661026
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EVaSvr03JpWLRQBFDIlWzPNI37MYrje6qO4m61NXM1c=; b=TY6Bf22ElV+I0RXXsw0zMgK2ZX
	XHtw/Nq+9yWOts3psVJ+VyK8rvKUfKQIaQoh4B7wJp4TSGEkAcppbdJ/CBYNudiWAcLiROGqOF0G+
	6YJYBUq5VYPwQ9D7MU4FwKJ7OWDmDYT05eI+u8OfRMHaqPcNKY4A9CRN9A5o8gJ2m3j/sEcrovWWk
	xnY2W5NGu4SEsrZMuDXccbz4TZLDZSaC7+VW1h32YFZ7Ub2iQzjGwcHjb8FsXGbo5pUQMlD3QITeW
	H+R+uMhvI6ImQ8nQi+jKGSrP2//YRBtkaXWeK0e8Bh9r4Z5AHEoml1GuKZRp8zebRAQI6+lEVSgUQ
	m44xKa8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mJD8o-009r0t-Lu; Thu, 26 Aug 2021 11:01:50 +0000
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mJD8h-009qzQ-89
 for ath11k@lists.infradead.org; Thu, 26 Aug 2021 11:01:49 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1629975705; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=uMWtL2dwizJJtFTSEw5cH9UyiSvAd8WzrKtTJiAun4Q=;
 b=Dj4F7WaOBnU0KJMCcBt+ZWaFlSIm5oq7HYJXl1/58FqwqPqOFs4eCz+3ogjjH2Vw+N+00Y7L
 938W28CRWWJcFMW0RLaebIfSj9FhgmNwGaVgHr0KNqSwkVZ5HkJ1jBk9URy0cl8G8ngwEeUp
 8D5au90/vx5YW985lxeCC/UF1DE=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 612774894d644b7d1c6e0605 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 26 Aug 2021 11:01:29
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 54493C4360C; Thu, 26 Aug 2021 11:01:29 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: wgong)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id E8754C4338F;
 Thu, 26 Aug 2021 11:01:28 +0000 (UTC)
MIME-Version: 1.0
Date: Thu, 26 Aug 2021 19:01:28 +0800
From: Wen Gong <wgong@codeaurora.org>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org
Subject: Re: [PATCH v2 1/8] cfg80211: add power type definition for 6 GHz
In-Reply-To: <7e07a64f33bc1a1ca09e36d6152628478a622b69.camel@sipsolutions.net>
References: <20210820122041.12157-1-wgong@codeaurora.org>
 <20210820122041.12157-2-wgong@codeaurora.org>
 <b6ba152ce1efde5863cae53a94728e8472ba53c0.camel@sipsolutions.net>
 <e6006814059d085a1f57af24b9561dde@codeaurora.org>
 <7e07a64f33bc1a1ca09e36d6152628478a622b69.camel@sipsolutions.net>
Message-ID: <77226d0fba70d65f63b40c1b90ade3dd@codeaurora.org>
X-Sender: wgong@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210826_040145_405168_7F54E4D0 
X-CRM114-Status: GOOD (  15.94  )
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

T24gMjAyMS0wOC0yNiAxODo1OSwgSm9oYW5uZXMgQmVyZyB3cm90ZToKPiBPbiBUaHUsIDIwMjEt
MDgtMjYgYXQgMTg6NTcgKzA4MDAsIFdlbiBHb25nIHdyb3RlOgo+PiBPbiAyMDIxLTA4LTI2IDE2
OjIwLCBKb2hhbm5lcyBCZXJnIHdyb3RlOgo+PiA+ID4gwqBzdHJ1Y3QgY2ZnODAyMTFfY2hhbl9k
ZWYgewo+PiA+ID4gwqAJc3RydWN0IGllZWU4MDIxMV9jaGFubmVsICpjaGFuOwo+PiA+ID4gQEAg
LTY4NCw2ICs2ODUsNyBAQCBzdHJ1Y3QgY2ZnODAyMTFfY2hhbl9kZWYgewo+PiA+ID4gwqAJdTMy
IGNlbnRlcl9mcmVxMjsKPj4gPiA+IMKgCXN0cnVjdCBpZWVlODAyMTFfZWRtZyBlZG1nOwo+PiA+
ID4gwqAJdTE2IGZyZXExX29mZnNldDsKPj4gPiA+ICsJZW51bSBubDgwMjExX2FwX3JlZ19wb3dl
ciBwb3dlcl90eXBlOwo+PiA+Cj4+ID4gSSdtIG5vdCBzdXJlIHdoeSB0aGlzIHNob3VsZCBiZSBp
biB0aGUgY2hhbmRlZiwgdGhlcmUncyBubyB3YXkgdGhhdAo+PiA+IGFueXRoaW5nIGluIGNmZzgw
MjExIGlzIGV2ZXIgdXNpbmcgaXQgdGhlcmUsIGF0IGxlYXN0IGluIHlvdXIgcGF0Y2hlcy4KPj4g
Pgo+PiBJdCBpcyB1c2VkIGluIG1hYzgwMjExIG9mIFtQQVRDSCB2MiAzLzhdIG1hYzgwMjExOiBh
ZGQgcGFyc2UgCj4+IHJlZ3VsYXRvcnkKPj4gaW5mbyBpbiA2IEdIeiBvcGVyYXRpb24gaW5mb3Jt
YXRpb24uCj4+IHNob3VsZCBpIG1vdmUgaXQgdG8gbWFjODAyMTEncyAuaCBmaWxlPwo+PiA+ID4g
Ky8qKgo+PiA+ID4gKyAqIGVudW0gbmw4MDIxMV9hcF9yZWdfcG93ZXIgLSByZWd1bGF0b3J5IHBv
d2VyIGZvciBhIEFjY2VzcyBQb2ludAo+IFsuLi5dCj4+ID4KPj4gSXQgaXMgdXNlZCBpbiBtYWM4
MDIxMSBvZiBbUEFUQ0ggdjIgMy84XSBtYWM4MDIxMTogYWRkIHBhcnNlIAo+PiByZWd1bGF0b3J5
Cj4+IGluZm8gaW4gNiBHSHogb3BlcmF0aW9uIGluZm9ybWF0aW9uLgo+PiBzaG91bGQgaSBtb3Zl
IGl0IHRvIG1hYzgwMjExJ3MgLmggZmlsZT8KPiAKPiBZZWFoIEkgc2F3IGJvdGggb2YgdGhlbSBh
cmUgdXNlZCwgYnV0IHdoeSBhcmUgdGhleSBkZWZpbmVkIGFzIG5sODAyMTEKPiBBUEk/IERvIHlv
dSBoYXZlIGFueSBpbnRlbnRpb24gdG8gc2V0IHRoZW0gdGhyb3VnaCBubDgwMjExPwo+IAo+IEFu
ZCBsaWtlIEkgc2FpZCwgSSdtIG5vdCByZWFsbHkgY29udmluY2VkIHRoaXMgYmVsb25ncyBpbnRv
IHN0cnVjdAo+IGNmZzgwMjExX2NoYW5fZGVmIGVpdGhlci4gTWF5YmUgaXQgc2hvdWxkIGJlIGlu
IGJzc19jb25mIHRvbz8KeWVzLCBJIGFsc28gd2FudCB0byBtb3ZlIGl0IHRvIHN0cnVjdCBpZWVl
ODAyMTFfYnNzX2NvbmYuCj4gCj4gam9oYW5uZXMKPj4gCgotLSAKYXRoMTFrIG1haWxpbmcgbGlz
dAphdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2F0aDExawo=
