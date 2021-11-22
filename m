Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BC4EC433F5
	for <ath11k@archiver.kernel.org>; Mon, 22 Nov 2021 18:06:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7OWKJzcTcSs/SjBUIKPZPrq1t6tlzCdmzKyO4YQuRAo=; b=ZWmRxj7ZYvI7sf
	e4H6DRQ9iSdVHw+r4TIN9AO4sSI6B7f97ceX/haYmn8nGJnysh3iMxTHpixtfUZIyTlJl3aAR2iud
	WLzjs3d0l7HdoWuC5idL2Lzi7lCarKbZgMheQ3F79io4BY0z948C9GnT4+PdcLNKbeeo6upqupY0W
	G8aPR6xvqQ0yHOx+HNUhoyfumjt9yu5fpXdWC2IJEjZ0IlVpN7lCAwgv3l9dEw3QT77pBYNBdYOqi
	8tuCJWL2pA6Q0RbCwOWi5Z2PCHjp7Br/ASp3waC6idGR4L7CLg8sXz2/kTYsd5sqd1iNTvZueIr8+
	dPurIqg2I9C48YhV8DDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mpDi8-00HJJ0-2M; Mon, 22 Nov 2021 18:06:36 +0000
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mpDi4-00HJIU-Mz
 for ath11k@lists.infradead.org; Mon, 22 Nov 2021 18:06:35 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1637604393; h=Content-Transfer-Encoding: Content-Type:
 MIME-Version: Message-ID: In-Reply-To: Date: References: Subject: Cc:
 To: From: Sender; bh=txqi+m8lpFE58mm65vzUCp6Li/mJaI8t5LyHVDayOhM=;
 b=hnHjj76QakDi8b5rbAutQXadHstzgg0SxVcz4nRivHKzr3y1WVxu1BTqGH1ZkAuSp751Mk1G
 q1nZ1tPeA1dcn3zawOKLYd5isYXhUcPUcFzOQNpxgV5Pr//9xQkdg0IblsxdaqC4MAeAzGpI
 ayyUtl4qdy2gmQRvX2zizuSBOm0=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 619bdc24db3ac5552aa6def7 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 22 Nov 2021 18:06:27
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id ACF63C43616; Mon, 22 Nov 2021 18:06:27 +0000 (UTC)
Received: from tykki (tynnyri.adurom.net [51.15.11.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 3D657C4338F;
 Mon, 22 Nov 2021 18:06:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 3D657C4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
From: Kalle Valo <kvalo@codeaurora.org>
To: Mark Herbert <mark.herbert42@gmail.com>
Cc: Wen Gong <quic_wgong@quicinc.com>, ath11k@lists.infradead.org,
 linux-wireless@vger.kernel.org
Subject: Re: [PATCH v2] ath11k: add read variant from SMBIOS for download
 board data
References: <20211118100033.8384-1-quic_wgong@quicinc.com>
 <163759171706.17469.3004620526954131593.kvalo@codeaurora.org>
 <f237c04d-6574-ec9a-ebca-65d2d9ff9edd@gmail.com>
Date: Mon, 22 Nov 2021 20:06:22 +0200
In-Reply-To: <f237c04d-6574-ec9a-ebca-65d2d9ff9edd@gmail.com> (Mark Herbert's
 message of "Mon, 22 Nov 2021 20:58:56 +0300")
Message-ID: <871r3883q9.fsf@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211122_100633_851534_98A0A5F6 
X-CRM114-Status: GOOD (  12.93  )
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

TWFyayBIZXJiZXJ0IDxtYXJrLmhlcmJlcnQ0MkBnbWFpbC5jb20+IHdyaXRlczoKCj4gVHJpZWQg
dGhpcyBvbiBEZWxsIFhQUyAxMyA5MzEwCj4KPiBNYXliZSB0aGlzIHBhdGNoIGlzIGdvb2QgZm9y
IDY4NTUsIGJ1dCA2MzkwIGluIERlbGwgc2VlbXMgdG8gYmUga2lsbGVkCj4gY29tcGxldGVseSB3
aXRoIGl0LiBSZXZlcnRpbmcgaXQgbWFrZXMgdGhpbmdzIHdvcmsgYWdhaW4uCj4KPiBbwqDCoMKg
IDUuNTM3MDM0XSBhdGgxMWtfcGNpIDAwMDA6NzI6MDAuMDogY2hpcF9pZCAweDAgY2hpcF9mYW1p
bHkgMHhiCj4gYm9hcmRfaWQgMHhmZiBzb2NfaWQgMHhmZmZmZmZmZgo+IFvCoMKgwqAgNS41Mzcw
MzhdIGF0aDExa19wY2kgMDAwMDo3MjowMC4wOiBmd192ZXJzaW9uIDB4MTAxYzA2Y2MKPiBmd19i
dWlsZF90aW1lc3RhbXAgMjAyMC0wNi0yNCAxOTo1MCBmd19idWlsZF9pZAo+IFvCoMKgwqAgNS41
MzcyMzZdIGF0aDExa19wY2kgMDAwMDo3MjowMC4wOiBmYWlsZWQgdG8gZmV0Y2ggYm9hcmQgZGF0
YSBmb3IKPiBidXM9cGNpLHFtaS1jaGlwLWlkPTAscW1pLWJvYXJkLWlkPTI1NSx2YXJpYW50PURF
XzE5MDEgZnJvbQo+IGF0aDExay9RQ0E2MzkwL2h3Mi4wL2JvYXJkLTIuYmluCj4gW8KgwqDCoCA1
LjUzNzI1NV0gYXRoMTFrX3BjaSAwMDAwOjcyOjAwLjA6IGZhaWxlZCB0byBmZXRjaCBib2FyZC0y
LmJpbiBvcgo+IGJvYXJkLmJpbiBmcm9tIFFDQTYzOTAvaHcyLjAKPiBbwqDCoMKgIDUuNTM3MjU3
XSBhdGgxMWtfcGNpIDAwMDA6NzI6MDAuMDogcW1pIGZhaWxlZCB0byBmZXRjaCBib2FyZCBmaWxl
OiAtMgo+IFvCoMKgwqAgNS41MzcyNThdIGF0aDExa19wY2kgMDAwMDo3MjowMC4wOiBmYWlsZWQg
dG8gbG9hZCBib2FyZCBkYXRhIGZpbGU6IC0yCgpEb2gsIEkgZGlkbid0IHJlYWxpc2UgdGhhdC4g
SSBvbmx5IHRlc3RlZCB0aGlzIG9uIG15IE5VQyB0ZXN0Ym94LCBJCnNob3VsZCBoYXZlIHRlc3Rl
ZCB0aGlzIG9uIG15IFhQUyAxMyA5MzEwIGFzIHdlbGwuIFRoYW5rcyBmb3IgdGhlCnJlcG9ydCEK
CkkgdGhpbmsgSSBuZWVkIHRvIHJldmVydCB0aGlzIGFuZCByZXRoaW5rIGhvdyB0byBoYW5kbGUg
dGhlIGJhY2t3YXJkcwpjb21wYXRpYmlsaXR5LgoKLS0gCmh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5l
bC5vcmcvcHJvamVjdC9saW51eC13aXJlbGVzcy9saXN0LwoKaHR0cHM6Ly93aXJlbGVzcy53aWtp
Lmtlcm5lbC5vcmcvZW4vZGV2ZWxvcGVycy9kb2N1bWVudGF0aW9uL3N1Ym1pdHRpbmdwYXRjaGVz
CgotLSAKYXRoMTFrIG1haWxpbmcgbGlzdAphdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2F0aDExawo=
