Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACAAAC433F5
	for <ath11k@archiver.kernel.org>; Wed, 24 Nov 2021 09:44:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DTeGgMom/eI5+/xYPBbDXE9X14oee7DC/792hu25nOk=; b=qlL51hSvH2hgVa
	2CoJ2SxKQePpSMSHIZH49SpVR//9/YPm3UWO33ptQEtiy/Lw2ESXedU81sHGJ6MknLVlLT9HrJ5J4
	DZVxNLtX0pKGkVjxR7VW6Vv7jNgagN3bGbqZ+SJAmwDh78ndII0bGI0G3v8Mj6u5bB4DKZhtZpLSV
	/hN1hT6Lidct22zGYQeS417lEzxGkaEUswud1fyq5ncR3AFFogZvdY58i4sExSnsIZM9hI3+u/OZD
	sWHhRznrI2hS2khltMEisJ77JW2hVd2l3DxO2Who4xzZDdjinXO6U05KWvoxtPaROyMFQCMUVzH3f
	Ix/bMym1yuQHOeNveP9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mpop6-004PyY-DS; Wed, 24 Nov 2021 09:44:16 +0000
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mpop3-004Ppk-IV
 for ath11k@lists.infradead.org; Wed, 24 Nov 2021 09:44:15 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1637747053; h=Content-Transfer-Encoding: Content-Type:
 MIME-Version: Message-ID: In-Reply-To: Date: References: Subject: Cc:
 To: From: Sender; bh=41o6sS1MLx/lIjXZseK5m7ONkaKla+cYhstE3GPbMAU=;
 b=c/eOSXKCUfhNnkQQkGyI9d/b8HWUxRnNuwDTfyh+KB1MGyftLtwD3gGSPZ+OyEbcMbE3TK2Q
 hEdahYkgx6hfuueTttT766zb+2nquZKmifnxGJCmiAvUifgTiYyPVe56J48xGBEvW9YT5MxW
 dGcRiR9tdcR74kzsStE0JypMoRs=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 619e096d6bacc185a53678b4 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 24 Nov 2021 09:44:13
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 59C74C4360D; Wed, 24 Nov 2021 09:44:12 +0000 (UTC)
Received: from tykki (tynnyri.adurom.net [51.15.11.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id D936EC4338F;
 Wed, 24 Nov 2021 09:44:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org D936EC4338F
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
 <871r3883q9.fsf@codeaurora.org>
Date: Wed, 24 Nov 2021 11:44:09 +0200
In-Reply-To: <871r3883q9.fsf@codeaurora.org> (Kalle Valo's message of "Mon, 22
 Nov 2021 20:06:22 +0200")
Message-ID: <87fsrl6g7q.fsf@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211124_014413_698566_9C72C7FD 
X-CRM114-Status: GOOD (  13.94  )
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

S2FsbGUgVmFsbyA8a3ZhbG9AY29kZWF1cm9yYS5vcmc+IHdyaXRlczoKCj4gTWFyayBIZXJiZXJ0
IDxtYXJrLmhlcmJlcnQ0MkBnbWFpbC5jb20+IHdyaXRlczoKPgo+PiBUcmllZCB0aGlzIG9uIERl
bGwgWFBTIDEzIDkzMTAKPj4KPj4gTWF5YmUgdGhpcyBwYXRjaCBpcyBnb29kIGZvciA2ODU1LCBi
dXQgNjM5MCBpbiBEZWxsIHNlZW1zIHRvIGJlIGtpbGxlZAo+PiBjb21wbGV0ZWx5IHdpdGggaXQu
IFJldmVydGluZyBpdCBtYWtlcyB0aGluZ3Mgd29yayBhZ2Fpbi4KPj4KPj4gW8KgwqDCoCA1LjUz
NzAzNF0gYXRoMTFrX3BjaSAwMDAwOjcyOjAwLjA6IGNoaXBfaWQgMHgwIGNoaXBfZmFtaWx5IDB4
Ygo+PiBib2FyZF9pZCAweGZmIHNvY19pZCAweGZmZmZmZmZmCj4+IFvCoMKgwqAgNS41MzcwMzhd
IGF0aDExa19wY2kgMDAwMDo3MjowMC4wOiBmd192ZXJzaW9uIDB4MTAxYzA2Y2MKPj4gZndfYnVp
bGRfdGltZXN0YW1wIDIwMjAtMDYtMjQgMTk6NTAgZndfYnVpbGRfaWQKPj4gW8KgwqDCoCA1LjUz
NzIzNl0gYXRoMTFrX3BjaSAwMDAwOjcyOjAwLjA6IGZhaWxlZCB0byBmZXRjaCBib2FyZCBkYXRh
IGZvcgo+PiBidXM9cGNpLHFtaS1jaGlwLWlkPTAscW1pLWJvYXJkLWlkPTI1NSx2YXJpYW50PURF
XzE5MDEgZnJvbQo+PiBhdGgxMWsvUUNBNjM5MC9odzIuMC9ib2FyZC0yLmJpbgo+PiBbwqDCoMKg
IDUuNTM3MjU1XSBhdGgxMWtfcGNpIDAwMDA6NzI6MDAuMDogZmFpbGVkIHRvIGZldGNoIGJvYXJk
LTIuYmluIG9yCj4+IGJvYXJkLmJpbiBmcm9tIFFDQTYzOTAvaHcyLjAKPj4gW8KgwqDCoCA1LjUz
NzI1N10gYXRoMTFrX3BjaSAwMDAwOjcyOjAwLjA6IHFtaSBmYWlsZWQgdG8gZmV0Y2ggYm9hcmQg
ZmlsZTogLTIKPj4gW8KgwqDCoCA1LjUzNzI1OF0gYXRoMTFrX3BjaSAwMDAwOjcyOjAwLjA6IGZh
aWxlZCB0byBsb2FkIGJvYXJkIGRhdGEgZmlsZTogLTIKPgo+IERvaCwgSSBkaWRuJ3QgcmVhbGlz
ZSB0aGF0LiBJIG9ubHkgdGVzdGVkIHRoaXMgb24gbXkgTlVDIHRlc3Rib3gsIEkKPiBzaG91bGQg
aGF2ZSB0ZXN0ZWQgdGhpcyBvbiBteSBYUFMgMTMgOTMxMCBhcyB3ZWxsLiBUaGFua3MgZm9yIHRo
ZQo+IHJlcG9ydCEKPgo+IEkgdGhpbmsgSSBuZWVkIHRvIHJldmVydCB0aGlzIGFuZCByZXRoaW5r
IGhvdyB0byBoYW5kbGUgdGhlIGJhY2t3YXJkcwo+IGNvbXBhdGliaWxpdHkuCgpSZXZlcnQgc2Vu
dDoKCmh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcHJvamVjdC9saW51eC13aXJlbGVzcy9w
YXRjaC8yMDIxMTEyNDA5NDMxNi45MDk2LTEta3ZhbG9AY29kZWF1cm9yYS5vcmcvCgotLSAKaHR0
cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wcm9qZWN0L2xpbnV4LXdpcmVsZXNzL2xpc3QvCgpo
dHRwczovL3dpcmVsZXNzLndpa2kua2VybmVsLm9yZy9lbi9kZXZlbG9wZXJzL2RvY3VtZW50YXRp
b24vc3VibWl0dGluZ3BhdGNoZXMKCi0tIAphdGgxMWsgbWFpbGluZyBsaXN0CmF0aDExa0BsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vYXRoMTFrCg==
