Return-Path: <SRS0=85K5=O7=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5868C433EF
	for <ath11k@archiver.kernel.org>; Mon, 11 Oct 2021 05:41:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7B4E260F35
	for <ath11k@archiver.kernel.org>; Mon, 11 Oct 2021 05:41:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7B4E260F35
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DYL7e7Gj37fsz56B1RdOBXsiAfeNre4VW7Yd8nqUXMI=; b=wUm/Dg/yNihhAQ
	/le6weG4ysDYMbo3rpLE9kXVdHLvAY6jqUdrZx7KjLCwQ1uFcYroJ5wfLEmOSGWCf8zhjbQcK007U
	p76n3NxNTJXYKkdP6rVMxKzdnNHRWecP2CJb4NIL6SZo+nKyl51ItDNrg7+rcdn6lKFHjM9cqETb4
	vTeAlrerjcg6EvisDjR+qBo6NrgbeQsX9AmonkNCCkyFaVnzKQsBM/1VMSNg5KdKMx4BN4bJ17d7/
	l1ZI2i2ManEZgHuhGcrbNHcITq+vBz3KXjjd+DR09V8jJ9jZyQgxPPg0h9+HIsDXfRBKPHljFWnzM
	gkX8vCrkwCLmPilukLkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mZo47-007oIP-4H; Mon, 11 Oct 2021 05:41:35 +0000
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mZo43-007oHM-Mx
 for ath11k@lists.infradead.org; Mon, 11 Oct 2021 05:41:33 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1633930891; h=Content-Transfer-Encoding: Content-Type:
 MIME-Version: Message-ID: In-Reply-To: Date: References: Subject: Cc:
 To: From: Sender; bh=Zjl8P1G+GFKNrIUYl7UaXzXcKT/hGSRRhYjHIlwRqgg=;
 b=jMRFeMS35w9ZfYeYznlLr0p3pouKtQ5yC+LD7oSlLa8wAgCdYmkmbd6zh2mbDJW/rRJdhwYV
 ZoGHEQHzDoWI3GpGDSsgWgj6nDPJIjTquQvrQpR0BbPzi5YIEPB3Qy8uplAw92H6Lmkpz9cN
 Jj2GN1+v4+bhztBun3o3ycFICCs=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 6163ce884ccc4cf2c786a25f (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 11 Oct 2021 05:41:28
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 07A38C43616; Mon, 11 Oct 2021 05:41:28 +0000 (UTC)
Received: from tynnyri.adurom.net (tynnyri.adurom.net [51.15.11.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id D2AB1C4338F;
 Mon, 11 Oct 2021 05:41:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org D2AB1C4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
From: Kalle Valo <kvalo@codeaurora.org>
To: Mark Herbert <mark.herbert42@gmail.com>
Cc: ath11k@lists.infradead.org
Subject: Re: High battery usage with ath11k on Dell 9310
References: <c2c790a6-b86a-6664-e147-bc642e00e325@gmail.com>
Date: Mon, 11 Oct 2021 08:41:24 +0300
In-Reply-To: <c2c790a6-b86a-6664-e147-bc642e00e325@gmail.com> (Mark Herbert's
 message of "Sun, 10 Oct 2021 15:24:13 +0300")
Message-ID: <87k0ik2k57.fsf@tynnyri.adurom.net>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211010_224132_130852_6AA76C7F 
X-CRM114-Status: GOOD (  13.27  )
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

TWFyayBIZXJiZXJ0IDxtYXJrLmhlcmJlcnQ0MkBnbWFpbC5jb20+IHdyaXRlczoKCj4gU2ltcGx5
IGRpc2FibGluZyB3aWZpwqAgZHJvcHMgMC44LTEgd2F0dHMgZnJvbSBwb3dlciBjb25zdW1wdGlv
bi4KPiBDb21wYXJpbmcgYWxtb3N0IHNhbWUgbW9kZWwgKDE2IGdiIFJBTSB2cyAzMikgYnV0IGJh
c2VkIG9uIEludGVsIGNhcmQKPiBzaG93cyB0aGUgc2FtZSBkaWZmZXJlbmNlIC0gSW50ZWwgYmFz
ZWQgbGFwdG9wIHdpdGggV2lGaSBjb25uZWN0ZWQKPiBjb25zdW1lcyBhYm91dCBzYW1lIGFzIGF0
aDExayB3aXRoIFdpZmkgZGlzY25uZWN0ZWQuCj4KPiBQb3dlcnRvcMKgIG5ld2VyIHNob3dzIFBD
IHN0YXRlcyBiZWxvdyBQQzYuIERpc2FibGluZyBXaUZpIGFsbG93cyBQQzgsCj4gZGlzYWJsaW5n
IGF0aDExayBjb21wbGV0ZWx5IChiaW9zKSAtIFBDMTAuCj4KPiBXaWZpIGVuYWJsZWQKPgo+IMKg
wqDCoMKgwqDCoMKgwqDCoMKgIFBrZyhIVykKPiBDMiAocGMyKcKgwqAgMTgsNSXCoMKgwqAgfAo+
IEMzIChwYzMpwqDCoCAxNCwyJcKgwqDCoCB8Cj4gQzYgKHBjNinCoMKgIDQ3LDUlwqDCoMKgIHwK
PiBDNyAocGM3KcKgwqDCoCAwLDAlwqDCoMKgIHwKPiBDOCAocGM4KcKgwqDCoCAwLDAlwqDCoMKg
IHwKPiBDOSAocGM5KcKgwqDCoCAwLDAlwqDCoMKgIHwKPiBDMTAgKHBjMTApwqAgMCwwJcKgwqDC
oCB8Cj4KPiBXZmkgZGlzYWJsZWQgKGJ5IG5ldHdvcmttYW5hZ2VyL25tLWFwcGxldCkKPgo+Cj4g
wqDCoMKgwqDCoMKgwqDCoMKgwqAgUGtnKEhXKQo+IEMyIChwYzIpwqDCoCAxMCw4JcKgwqDCoCB8
Cj4gQzMgKHBjMynCoMKgIDE4LDUlwqDCoMKgIHwKPiBDNiAocGM2KcKgwqDCoCAxLDElwqDCoMKg
IHwKPiBDNyAocGM3KcKgwqDCoCAwLDMlwqDCoMKgIHwKPiBDOCAocGM4KcKgwqAgMjgsMyXCoMKg
wqAgfAo+IEM5IChwYzkpwqDCoMKgIDAsMCXCoMKgwqAgfAo+IEMxMCAocGMxMCnCoCAwLDAlwqDC
oMKgIHwKPgo+IFNlZW1zIHRoYXQgZXZlbiBvbiBubyBuZXR3b3JrIGFjdGl2aXR5IGF0aDExayBm
b3JjZXMgQ1BVIHRvIHN0YXkgYXdha2UKPiBhbmQgZWF0IGJhdHRlcnkuIFRoZXJlIGFyZSBzb21l
IGJhY2tncm91bmQgdHJhbnNmZXIgaGFwcGVuaW5nIGFzIEkKPiBoYXZlIFZpYmVyLCB0aHVuZGVy
YmlyZCBhbmQgZmlyZWZveCBvcGVuZWQgc28gSSBiZXQgdGhleSBkbyBzZW50IHNvbWUKPiBidXQg
dGhlcmUgaXMgbm8gZmlsZSB0cmFuc2ZlcnMsIG1lZGlhIHN0cmVhbXMgZXRjLiBVbmRlciB0aGUg
c2FtZQo+IGNvbmRpdGlvbnMgKHRha2luZyB0aGlzIGRpc2sgZnJvbSBvbmUgOTMxMCB0byBvdGhl
ciA5MzEwIC0gc2FtZQo+IHNvZnR3YXJlLCBzYW1lIGtlcm5lbCAtIGp1c3Qgd2lmaSdzIGRpZmZl
cmVudCkgLSBpd2x3aWZpIG1hbmFnZXMgdG8KPiByZWFjaCBQQzgtUEMxMCBiZWluZyBjb25uZWN0
ZWQuwqAgV2l0aCBhdGgxMGsgb24gZGVsbCBYUFMtMTMgOTM1MCBpbnRlbAo+IGFsc28gd2FzIHNh
dmluZyBiYXR0ZXJ5IG11Y2ggYmV0dGVyIHRoYW4gYXRoMTBrLCBiaXQgdGhlcmUgd2FzIGxpa2UK
PiA4OCUgb2YgUEMxMCB3aXRoIGludGVsIGFuZCA2NSUgUEMxMCBhbmQgMjAlIFBDOCB3aXRoIGF0
aDEway4gQnV0IGl0Cj4gd2FzIG5vdCBzdWNoIHRlcnJpYmx5IGJhZCBhcyB3aXRoIGF0aDExLgo+
Cj4gVGhlcmUgaXMgYWxyZWFkeSBrZXJuZWwgYnVnIGZvciB0aGlzLCBub3QgY3JlYXRpbmcgZHVw
bGljYXRlcwo+Cj4gaHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0y
MTQ1NDMKClRoYW5rcyBmb3IgdGhlIGV4Y2VsbGVudCByZXBvcnQgYW5kIGluY2x1ZGluZyBhbGwg
dGhhdCBpbmZvcm1hdGlvbiB0bwp0aGUgYnVnIHJlcG9ydCBhcyB3ZWxsLCB3ZSB3aWxsIGludmVz
dGlnYXRlIHRoaXMuCgotLSAKaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wcm9qZWN0L2xp
bnV4LXdpcmVsZXNzL2xpc3QvCgpodHRwczovL3dpcmVsZXNzLndpa2kua2VybmVsLm9yZy9lbi9k
ZXZlbG9wZXJzL2RvY3VtZW50YXRpb24vc3VibWl0dGluZ3BhdGNoZXMKCi0tIAphdGgxMWsgbWFp
bGluZyBsaXN0CmF0aDExa0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vYXRoMTFrCg==
