Return-Path: <SRS0=iaLC=PU=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65285C43217
	for <ath11k@archiver.kernel.org>; Mon,  1 Nov 2021 12:50:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3420560EE3
	for <ath11k@archiver.kernel.org>; Mon,  1 Nov 2021 12:50:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3420560EE3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0tOc4GI5IYtEGKamgcKEOERoyTgiOxogpCaW1uulDCI=; b=QC+wfO+wAemtV8
	TwrqEKZ2pRn4XVqX7isgfnOrG9opAb93yYM3SGI0BOt6US/LJ9HcI76p17RtD4GVl+pNKRv6Pz4iB
	gLHKVPzDYclHPmnzk2CR6GvVJHmkXEXh3aWianzhavmNtlBFLDkbuXsptGX5Wp+QzdpgKwgG+2TOJ
	HCv1AgwCsAPoAzZjMqhXAKiKcfbweu7QjbSH0gokU+qHbtXgcO8nn8jKBzP/SuA+929MDCAp8Z2c6
	CbH4iKw0HeaMQ2YJb8td44jUnRMAQ+zeIiT6oLN3GKPNUJoOyN2c8sdGhhwFMF7ZJgZCKRE7qQ2kV
	SPwewHl/SIxVGfHQFx3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mhWm0-00GQAZ-Kc; Mon, 01 Nov 2021 12:50:48 +0000
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mhWls-00GQA0-0F
 for ath11k@lists.infradead.org; Mon, 01 Nov 2021 12:50:46 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1635771045; h=Content-Transfer-Encoding: Content-Type:
 MIME-Version: Message-ID: In-Reply-To: Date: References: Subject: Cc:
 To: From: Sender; bh=xGwuo3T+/m9Gi6g7lRtr2Upa0k8GbdWtOjiyHr38EYM=;
 b=Z+SZ7/kVdX9wi4Zywj1tmd+lV3d6IGIOHKnkcK3MLPZCFvFZwXQOknX2DxA/g3fPN83P0qO0
 Tkl95I7xmj3wQs9eoS4Q7yvIg1qdrxMMS+9XDHff8HdpyF++I/a2sBCZ9VzqAlDCGyKeltpU
 ZQlXt0SNqq679N9wFYZNGDyI1c8=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 617fe26efd59e9ce788b0da3 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 01 Nov 2021 12:49:50
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 5862EC4360D; Mon,  1 Nov 2021 12:49:50 +0000 (UTC)
Received: from tykki (tynnyri.adurom.net [51.15.11.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 532EAC4338F;
 Mon,  1 Nov 2021 12:49:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 532EAC4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
From: Kalle Valo <kvalo@codeaurora.org>
To: Mark Herbert <mark.herbert42@gmail.com>
Cc: ath11k@lists.infradead.org
Subject: Re: Dell XPS 9310 does not connect to network if ath11k.frame_mode=2.
References: <16afcd4e-d610-2dfc-91a4-263a17fa2748@gmail.com>
Date: Mon, 01 Nov 2021 14:49:46 +0200
In-Reply-To: <16afcd4e-d610-2dfc-91a4-263a17fa2748@gmail.com> (Mark Herbert's
 message of "Fri, 29 Oct 2021 19:02:00 +0300")
Message-ID: <87bl342g7p.fsf@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211101_055045_252241_C3E31F98 
X-CRM114-Status: GOOD (  10.38  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

TWFyayBIZXJiZXJ0IDxtYXJrLmhlcmJlcnQ0MkBnbWFpbC5jb20+IHdyaXRlczoKCj4gU2V0dGlu
ZyBhdGgxMWsuZnJhbWVfbW9kZT0xwqAgbWFrZXMgdGhpbmdzIHdvcmsgYWdhaW4uwqAgT3JkaW5h
cnkKPiBwZXJzb25hbCB3aWZpIHJvdXRlcnMsIHRoYXQgd29ya3MgZmluZSB3aXRoIGFsbCBlcXVp
cG1lbnQgYXQgaG9tZS4gSQo+IGhhdmUgdHJpZWQgd2l0aCBzZXZlcmFsIG9mIHRoZW0gLSBub25l
IHdvcmtzLgo+Cj4KPiBbwqDCoMKgIDkuMjIyMDYwXSB3bGFuMDogYXV0aGVudGljYXRlIHdpdGgg
YTQ6Yzc6NGI6YTM6NDE6MjAKPiBbwqDCoMKgIDkuMjIyMTUzXSB3bGFuMDogY2FwYWJpbGl0aWVz
L3JlZ3VsYXRvcnkgcHJldmVudGVkIHVzaW5nIEFQCj4gSFQvVkhUIGNvbmZpZ3VyYXRpb24sIGRv
d25ncmFkZWQKPiBbwqDCoMKgIDkuNDEzMzk0XSB3bGFuMDogc2VuZCBhdXRoIHRvIGE0OmM3OjRi
OmEzOjQxOjIwICh0cnkgMS8zKQo+IFvCoMKgwqAgOS40MTc3OTJdIHdsYW4wOiBhdXRoZW50aWNh
dGVkCj4gW8KgwqDCoCA5LjQyMDExN10gd2xhbjA6IGFzc29jaWF0ZSB3aXRoIGE0OmM3OjRiOmEz
OjQxOjIwICh0cnkgMS8zKQo+IFvCoMKgwqAgOS40MjMxNTFdIHdsYW4wOiBSWCBBc3NvY1Jlc3Ag
ZnJvbSBhNDpjNzo0YjphMzo0MToyMAo+IChjYXBhYj0weDE1MzEgc3RhdHVzPTAgYWlkPTEpCj4g
W8KgwqDCoCA5LjQzOTQxNl0gd2xhbjA6IGFzc29jaWF0ZWQKPiBbwqDCoCAxNC40Mzk4MTVdIHds
YW4wOiBkZWF1dGhlbnRpY2F0aW5nIGZyb20gYTQ6Yzc6NGI6YTM6NDE6MjAgYnkgbG9jYWwKPiBj
aG9pY2UgKFJlYXNvbjogMTU9NFdBWV9IQU5EU0hBS0VfVElNRU9VVCkKPgo+IE5vIG1hdHRlciBo
b3cgbWFueSB0aW1lcyBpIHJldHJ5IHRvIGNvbm5lY3QgLSBzYW1lIHN0b3J5LiBTZXR0aW5nCj4g
ZnJhbWVfbW9kZT0xIG1ha2VzIHRoaW5ncyB3b3JrIGZyb20gdGhlIHN0YXJ0LgoKQUZBSUsgUUNB
NjM5MCBmaXJtd2FyZSBkb2VzIG5vdCBzdXBwb3J0IGV0aGVybmV0IGZyYW1lIGZvcm1hdAooZnJh
bWVfbW9kZT0yKSBzbyB0aGlzIGlzIGV4cGVjdGVkLiBUaG91Z2ggaXQgd291bGQgdGhhdCBhdGgx
MWsgd291bGQKbm90aWNlIHRoYXQgYW5kIGZhaWwgaW5pdGlhbGlzYXRpb24gd2l0aCBhIHByb3Bl
ciBlcnJvciBtZXNzYWdlLiBQYXRjaGVzCndlbGNvbWUuCgotLSAKaHR0cHM6Ly9wYXRjaHdvcmsu
a2VybmVsLm9yZy9wcm9qZWN0L2xpbnV4LXdpcmVsZXNzL2xpc3QvCgpodHRwczovL3dpcmVsZXNz
Lndpa2kua2VybmVsLm9yZy9lbi9kZXZlbG9wZXJzL2RvY3VtZW50YXRpb24vc3VibWl0dGluZ3Bh
dGNoZXMKCi0tIAphdGgxMWsgbWFpbGluZyBsaXN0CmF0aDExa0BsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vYXRoMTFrCg==
