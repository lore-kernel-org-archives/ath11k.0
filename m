Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3608C433EF
	for <ath11k@archiver.kernel.org>; Wed, 24 Nov 2021 17:06:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tCAIFD+WExBI1T+fYuVwXHrGn2QXhiGezMFluL/hvzQ=; b=a2K8vaI3GHGkIc
	dYwpD6kGVboYRCp48h1zJ1c8CnkhH8jlNoDpiP6y49NP49tPni0222EvZZqHS6OXyM8xFyHuV5yQk
	qCuTe/601ObPCDq6BuxxiLHN5HsTCqgA7W2r1dALlmK4oeSAQnUMs4twe2fDaQVjIY+2zlNo7goGb
	gp1+ClNaYx+m/O8dwERVEZSqMFf5i6gNhVC47y8M1mgx+yrv0Yqctl8XCJfrz0A3ZHWWcQsZ16KGr
	XBaW7NT9I2EO4D9DrUmxsda6S4jEhmPtE0Y0fc/WUMzDx0EpuBucy+wy6j3rgA2zmIdRuPous/HPg
	F0JZxIl0sWFXU7NlMi7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mpvj3-005Mhz-MN; Wed, 24 Nov 2021 17:06:29 +0000
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mpvj1-005Mha-DF
 for ath11k@lists.infradead.org; Wed, 24 Nov 2021 17:06:28 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1637773586; h=Date: Message-ID: Cc: To: References:
 In-Reply-To: From: Subject: Content-Transfer-Encoding: MIME-Version:
 Content-Type: Sender; bh=9AIBPHdpZnDFqk5hYjgPbB3hrnfSSYgKlUUZpZpTGwQ=;
 b=MI1OloshXf6PZ0qJ8kszOUPjTib3HOhDabS37bvk45ovUGYSE5ziF/8/a3kUKx4CiOwKsqAX
 OH2wIREq0OHbQr8ZtQ0mtYTsoReqsWXuZLcc3r1ET18NRrAKhRGYi7oAzS4mv47zFUTjxWeH
 At3jB77WmFZC9OVTplba6m7sANI=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 619e7111465c4a723b08c95c (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 24 Nov 2021 17:06:25
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 5A8B5C43616; Wed, 24 Nov 2021 17:06:25 +0000 (UTC)
Received: from tykki.adurom.net (tynnyri.adurom.net [51.15.11.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 1D6D7C4338F;
 Wed, 24 Nov 2021 17:06:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 1D6D7C4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
MIME-Version: 1.0
Subject: Re: [PATCH] Revert "ath11k: add read variant from SMBIOS for download
 board data"
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20211124094316.9096-1-kvalo@codeaurora.org>
References: <20211124094316.9096-1-kvalo@codeaurora.org>
To: Kalle Valo <kvalo@codeaurora.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <163777357973.11557.3669643271854630297.kvalo@codeaurora.org>
Date: Wed, 24 Nov 2021 17:06:25 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211124_090627_518386_7ED210C3 
X-CRM114-Status: UNSURE (   8.78  )
X-CRM114-Notice: Please train this message.
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

S2FsbGUgVmFsbyA8a3ZhbG9AY29kZWF1cm9yYS5vcmc+IHdyb3RlOgoKPiBUaGlzIHJldmVydHMg
Y29tbWl0IDQ2ZTQ2ZGIzMTNhMmJmM2M0OGNhYzRlYjhiZGI2MTNiNzYyZjMwMWIuIE1hcmsgcmVw
b3J0ZWQKPiB0aGF0IGl0IGJyZWFrcyBRQ0E2MzkwIGh3Mi4wIG9uIERlbGwgWFBTIDEzIDkzMTA6
Cj4gCj4gW8KgwqDCoCA1LjUzNzAzNF0gYXRoMTFrX3BjaSAwMDAwOjcyOjAwLjA6IGNoaXBfaWQg
MHgwIGNoaXBfZmFtaWx5IDB4YiBib2FyZF9pZCAweGZmIHNvY19pZCAweGZmZmZmZmZmCj4gW8Kg
wqDCoCA1LjUzNzAzOF0gYXRoMTFrX3BjaSAwMDAwOjcyOjAwLjA6IGZ3X3ZlcnNpb24gMHgxMDFj
MDZjYyBmd19idWlsZF90aW1lc3RhbXAgMjAyMC0wNi0yNCAxOTo1MCBmd19idWlsZF9pZAo+IFvC
oMKgwqAgNS41MzcyMzZdIGF0aDExa19wY2kgMDAwMDo3MjowMC4wOiBmYWlsZWQgdG8gZmV0Y2gg
Ym9hcmQgZGF0YSBmb3IgYnVzPXBjaSxxbWktY2hpcC1pZD0wLHFtaS1ib2FyZC1pZD0yNTUsdmFy
aWFudD1ERV8xOTAxIGZyb20gYXRoMTFrL1FDQTYzOTAvaHcyLjAvYm9hcmQtMi5iaW4KPiBbwqDC
oMKgIDUuNTM3MjU1XSBhdGgxMWtfcGNpIDAwMDA6NzI6MDAuMDogZmFpbGVkIHRvIGZldGNoIGJv
YXJkLTIuYmluIG9yIGJvYXJkLmJpbiBmcm9tIFFDQTYzOTAvaHcyLjAKPiBbwqDCoMKgIDUuNTM3
MjU3XSBhdGgxMWtfcGNpIDAwMDA6NzI6MDAuMDogcW1pIGZhaWxlZCB0byBmZXRjaCBib2FyZCBm
aWxlOiAtMgo+IFvCoMKgwqAgNS41MzcyNThdIGF0aDExa19wY2kgMDAwMDo3MjowMC4wOiBmYWls
ZWQgdG8gbG9hZCBib2FyZCBkYXRhIGZpbGU6IC0yCj4gCj4gU28gd2UgbmVlZCB0byBiYWNrIHRv
IHRoZSBkcmF3aW5nIGJvYXJkIGFuZCBpbXBsZW1lbnQgaXQgc28gdGhhdCBiYWNrd2FyZHMKPiBj
b21wYXRpYmxpdHkgaXMgbm90IGJyb2tlbi4KPiAKPiBSZXBvcnRlZC1ieTogTWFyayBIZXJiZXJ0
IDxtYXJrLmhlcmJlcnQ0MkBnbWFpbC5jb20+Cj4gU2lnbmVkLW9mZi1ieTogS2FsbGUgVmFsbyA8
a3ZhbG9AY29kZWF1cm9yYS5vcmc+CgpQYXRjaCBhcHBsaWVkIHRvIGF0aC1uZXh0IGJyYW5jaCBv
ZiBhdGguZ2l0LCB0aGFua3MuCgo3MmY0MTI0MzQ3NzIgUmV2ZXJ0ICJhdGgxMWs6IGFkZCByZWFk
IHZhcmlhbnQgZnJvbSBTTUJJT1MgZm9yIGRvd25sb2FkIGJvYXJkIGRhdGEiCgotLSAKaHR0cHM6
Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wcm9qZWN0L2xpbnV4LXdpcmVsZXNzL3BhdGNoLzIwMjEx
MTI0MDk0MzE2LjkwOTYtMS1rdmFsb0Bjb2RlYXVyb3JhLm9yZy8KCmh0dHBzOi8vd2lyZWxlc3Mu
d2lraS5rZXJuZWwub3JnL2VuL2RldmVsb3BlcnMvZG9jdW1lbnRhdGlvbi9zdWJtaXR0aW5ncGF0
Y2hlcwoKCi0tIAphdGgxMWsgbWFpbGluZyBsaXN0CmF0aDExa0BsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vYXRoMTFrCg==
