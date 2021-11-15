Return-Path: <SRS0=utSp=QC=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 821AAC433F5
	for <ath11k@archiver.kernel.org>; Mon, 15 Nov 2021 10:43:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4510D61AAD
	for <ath11k@archiver.kernel.org>; Mon, 15 Nov 2021 10:43:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4510D61AAD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=13OiIO3gsT5llTKnGV70vwfEbE6g2Q1F/3rNXqArXPw=; b=kZjYrjybNpMgWS
	VV0CYL7V6pQ/D9xYdWreXyl4U50t2lqohtTZ+8k3USeTdylVW94cm71IOuG1ZRw4ayOBtx9a0eRXK
	Ai53kKZLPM0opM4cw3AUgGZ+uIoW9DK/nJApXvks90giXSGHYzkrlXYD7iecF2aR4215H0rASUyyz
	jNS+WPWUU+p1qTIvg2gnUSrLWW+uA2LC2aSetvtXO5zn7Qby954OC9CSOU/CIL7VbzkpXp5jedGWK
	kRqhBO7NEBU6SnulaAj1qy0zDNi7HhLcO9YySqP3IyV9Rn5l8wEI1wwaXa54tiG96eK+sjO8UMs1a
	RC7/mMUIWUcviVbcDkSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mmZSl-00FFHb-FO; Mon, 15 Nov 2021 10:43:47 +0000
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mmZSh-00FFGB-Hd
 for ath11k@lists.infradead.org; Mon, 15 Nov 2021 10:43:45 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1636973023; h=Content-Transfer-Encoding: Content-Type:
 MIME-Version: Message-ID: In-Reply-To: Date: References: Subject: Cc:
 To: From: Sender; bh=lHHQtvzm1kZlhsMmeFc8wx+xr4QzIoTJvqtDFW9WNKw=;
 b=ksShXhnwClS5e+j/BcPg4q7oDlSAc5PzeznfL0u7prRfDYajs6auBhxNJMB0/M2CWmMQn38w
 dCOUol3u7xWogwPGAI5DFkhj5sq1rQ+LpxHk0jJjfpInGDCrJrWQEPKyUTKqZI0NLb0YREW9
 brTHvEIviRGeA18kcpNAitW8k0g=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 619239debb7027b8e1b29038 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 15 Nov 2021 10:43:42
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id D4DB9C43617; Mon, 15 Nov 2021 10:43:41 +0000 (UTC)
Received: from tykki (tynnyri.adurom.net [51.15.11.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 127D6C43616;
 Mon, 15 Nov 2021 10:43:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 127D6C43616
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
From: Kalle Valo <kvalo@codeaurora.org>
To: Janusz Dziedzic <janusz.dziedzic@gmail.com>
Cc: Carl Huang <cjhuang@codeaurora.org>, ath11k@lists.infradead.org,
 linux-wireless <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH 0/6] ath11k: support one MSI vector
References: <20201223030225.2345-1-cjhuang@codeaurora.org>
 <87czx7t748.fsf@codeaurora.org>
 <CAFED-jnaYfXvz8S7d8orJmY+_=T-MRZ+v-c9OJFCg78HqS7=cw@mail.gmail.com>
Date: Mon, 15 Nov 2021 12:43:34 +0200
In-Reply-To: <CAFED-jnaYfXvz8S7d8orJmY+_=T-MRZ+v-c9OJFCg78HqS7=cw@mail.gmail.com>
 (Janusz Dziedzic's message of "Fri, 22 Oct 2021 10:04:46 +0200")
Message-ID: <87zgq5hf6x.fsf@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211115_024343_696400_C8FC981F 
X-CRM114-Status: GOOD (  18.33  )
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

SmFudXN6IER6aWVkemljIDxqYW51c3ouZHppZWR6aWNAZ21haWwuY29tPiB3cml0ZXM6Cgo+IGN6
dy4sIDExIGx1dCAyMDIxIG8gMDg6MTAgS2FsbGUgVmFsbyA8a3ZhbG9AY29kZWF1cm9yYS5vcmc+
IG5hcGlzYcWCKGEpOgo+Pgo+PiBDYXJsIEh1YW5nIDxjamh1YW5nQGNvZGVhdXJvcmEub3JnPiB3
cml0ZXM6Cj4+Cj4+ID4gVGhpcyBwYXRjaCBzZXQgaXMgdG8gc3VwcG9ydCBvbmUgTVNJIHZlY3Rv
ciBmb3IgUUNBNjM5MC4KPj4gPgo+PiA+IENhcmwgSHVhbmcgKDYpOgo+PiA+ICAgYXRoMTFrOiBn
ZXQgbXNpX2RhdGEgYWdhaW4gYWZ0ZXIgcmVxdWVzdF9pcnEgaXMgY2FsbGVkCj4+ID4gICBhdGgx
MWs6IGFkZCBjZSBhbmQgZXh0IGlycSBmbGFnIHRvIGluZGljYXRlIGlycV9oYW5kbGVyCj4+ID4g
ICBhdGgxMWs6IHVzZSBBVEgxMUtfUENJX0lSUV9EUF9PRkZTRVQgZm9yIGRwIGlycXgKPj4gPiAg
IGF0aDExazogcmVmYWN0b3IgbXVsaXRwbGUgbXNpIHZlY3RvciBpbXBsZW1lbnRhdGlvbgo+PiA+
ICAgYXRoMTFrOiBzdXBwb3J0cyBvbmUgTVNJIHZlY3Rvcgo+PiA+ICAgYXRoMTFrOiBkbyBub3Qg
cmVzdG9yZSBBU1BNIGluIGNhc2Ugb2Ygc2luZ2xlIE1TSSB2ZWN0b3IKPj4KPj4gSSBkaWQgc29t
ZSBjbGVhbnVwIGFuZCBiZWZvcmUgc3VibWl0dGluZyB2MiBJIG5vdGljZWQgdGhlIHBhdGNoc2V0
IChib3RoCj4+IHYxIGFuZCB2MikgaXMgY3Jhc2hpbmcgZHVyaW5nIHN1c3BlbmQgb24gbXkgRGVs
bCBYUFMgMTMgOTMxMC4gV2UgYXJlCj4+IGludmVzdGlnYXRpbmcgdGhlIHJlYXNvbiBmb3IgdGhh
dCBhbmQgd2lsbCBzdWJtaXQgdjIgb25jZSB0aG9zZSBhcmUKPj4gZml4ZWQuCj4+Cj4gSGVsbG8g
S2FsbGUsCj4KPiBXaGF0IGlzIHN0YXR1cyBmb3IgdGhpcyBzZXJpZXM/CgpUaGVyZSdzIG5vdyBh
IG5ldyB2ZXJzaW9uIGF2YWlsYWJsZToKCmh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcHJv
amVjdC9saW51eC13aXJlbGVzcy9jb3Zlci8yMDIxMTAyNjA0MTYxNi40OTU2LTEtYnFpYW5nQGNv
ZGVhdXJvcmEub3JnLwoKSWYgeW91IGNhbiwgcGxlYXNlIGRvIHRlc3QgdGhlIHZlcnNpb24gaW4g
dGhlIG1hc3Rlci1wZW5kaW5nIGJyYW5jaAooY29tbWl0IDlhOTE0Y2ZkYmZkNjkpOgoKaHR0cHM6
Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQva3ZhbG8vYXRoLmdpdC9s
b2cvP2g9bWFzdGVyLXBlbmRpbmcKCj4gSSBhbSB1c2luZyBhdGgxMWsgaW4gbXkgYmFuYW5hLXBp
LXI2NCAoYmFja3BvcnRzLTUuMTUtcmM2KSBib2FyZCBhbmQgaGl0Ogo+IFsgIDE2Mi4zOTIwNDNd
IGF0aDExa19wY2kgMDAwMDowMTowMC4wOiBmYWlsZWQgdG8gZ2V0IDMyIE1TSSB2ZWN0b3JzLAo+
IG9ubHkgLTI4IGF2YWlsYWJsZQo+IFsgIDE2Mi4zOTk5MjddIGF0aDExa19wY2kgMDAwMDowMTow
MC4wOiBmYWlsZWQgdG8gZW5hYmxlIG1zaTogLTI4Cj4gWyAgMTYyLjQwNTc3OF0gYXRoMTFrX3Bj
aSAwMDAwOjAxOjAwLjA6IGRpc2FibGluZyBidXMgbWFzdGVyaW5nCj4gWyAgMTYyLjQxMTQ4MV0g
YXRoMTFrX3BjaTogcHJvYmUgb2YgMDAwMDowMTowMC4wIGZhaWxlZCB3aXRoIGVycm9yIC0yOAo+
Cj4gSSBzdXNwZWN0IHRoaXMgc2VyaWVzIHNob3VsZCBmaXggbXkgaXNzdWU/CgpNb3N0IGxpa2Vs
eSB0aGlzIHNob3VsZCBmaXggaXQuIFlvdSBjb3VsZCBhbHNvIHRyeSBjaGFuZ2luZyB5b3VyIEJJ
T1MKc2V0dGluZ3MgdG8gZ2V0IG1vcmUgTVNJIHZlY3RvcnMsIElJUkMgZW5hYmxpbmcgVlQtZCBo
ZWxwIG9uIE5VQyBib2FyZHMKYXQgbGVhc3QuCgotLSAKaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVs
Lm9yZy9wcm9qZWN0L2xpbnV4LXdpcmVsZXNzL2xpc3QvCgpodHRwczovL3dpcmVsZXNzLndpa2ku
a2VybmVsLm9yZy9lbi9kZXZlbG9wZXJzL2RvY3VtZW50YXRpb24vc3VibWl0dGluZ3BhdGNoZXMK
Ci0tIAphdGgxMWsgbWFpbGluZyBsaXN0CmF0aDExa0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vYXRoMTFrCg==
