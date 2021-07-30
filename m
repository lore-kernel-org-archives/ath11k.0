Return-Path: <SRS0=zwws=MW=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 076FDC4338F
	for <ath11k@archiver.kernel.org>; Fri, 30 Jul 2021 10:01:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BA7A760E93
	for <ath11k@archiver.kernel.org>; Fri, 30 Jul 2021 10:01:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BA7A760E93
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5aI4RtfJFbZf9iCLTyIQn5Adji+a5i5qHQXdu1K8TzM=; b=ujazABmX+EQ0CsTNFyOIJorpJM
	vfjtK4a4hHYu3dYPrQOmhqfGlHf5H1K+DQ2TXVTFsPmjvc2ZFPpTd8Yz7kPfZmwi4/aBYVqaL3mjq
	QpePMg+mdB4wn7XAj/rW72euEpD7xLi5GiRaamffP4sEqVsjDUu6R5dPG/DVSGkiJcTODn+WfsIH2
	G6tWWcdlDrNKSEz+3tYwU2cc4SpX+14YUx25z7zcTGTaFlfK+spD8nexqVZbfZ+iepy3N9d4PjD/Z
	XDOppbZmG2BSUHac1SRIqs+p9k3j4t78d4V/OX/XnyyrYM6MIVPdb3WJaMNTjFR9h7ZOljN6dKDek
	A5yljb3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m9PKD-0082j0-O3; Fri, 30 Jul 2021 10:01:05 +0000
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m9PKB-0082hD-GK
 for ath11k@lists.infradead.org; Fri, 30 Jul 2021 10:01:04 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1627639261; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=6RM5Uu/oSEmhpz4cWgunG9ycHktCXaT1NMpEnZ6L2H0=;
 b=QWyX6uVQABB2nodBfbohDPZe8slSJzexpFnXsAzsIZJZwrjKt9Vmvesu8SNfCXTkJ+iXsT9n
 XUWVcFoq3muJVx6hWAQ7FpXF/qocsS9/kBo2zoT+dXXY1iTa2I4Adrh6GcMGZnewFU150ddL
 iE17RLM5pvMptUqscUREuaqlRg4=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 6103cdd2b653fbdaddd03214 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 30 Jul 2021 10:00:50
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 46471C433F1; Fri, 30 Jul 2021 10:00:49 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: wgong)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 01DB8C433D3;
 Fri, 30 Jul 2021 10:00:48 +0000 (UTC)
MIME-Version: 1.0
Date: Fri, 30 Jul 2021 18:00:48 +0800
From: Wen Gong <wgong@codeaurora.org>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org
Subject: Re: [PATCH 4/9] cfg80211: add definition for 6G power spectral
 density(psd)
In-Reply-To: <1553c2923cc332acf3da00b49e2d2ac17cc12ba0.camel@sipsolutions.net>
References: <20210517201932.8860-1-wgong@codeaurora.org>
 <20210517201932.8860-5-wgong@codeaurora.org>
 (sfid-20210517_222029_605505_DDB76CEE)
 <1553c2923cc332acf3da00b49e2d2ac17cc12ba0.camel@sipsolutions.net>
Message-ID: <03159ab593d309353d69cd65db0a8da8@codeaurora.org>
X-Sender: wgong@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210730_030103_643390_CB9FBD6B 
X-CRM114-Status: GOOD (  14.15  )
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

T24gMjAyMS0wNy0yMyAxNzoyNCwgSm9oYW5uZXMgQmVyZyB3cm90ZToKPiBPbiBNb24sIDIwMjEt
MDUtMTcgYXQgMTY6MTkgLTA0MDAsIFdlbiBHb25nIHdyb3RlOgo+PiAKPj4gKyAqIEBJRUVFODAy
MTFfQ0hBTl9QU0Q6IHBvd2VyIHNwZWN0cmFsIGRlbnNpdHkgKGluIGRCbSkKPj4gKyAqCW9uIHRo
aXMgY2hhbm5lbC4KPiAKPiBEbyB3ZSBuZWVkIHRoYXQ/IFdoaWNoIHJlYWxseSBpcyBqdXN0IGFu
b3RoZXIgd2F5IG9mIGFza2luZwo+IAo+PiArICogQHBzZDogcG93ZXIgc3BlY3RyYWwgZGVuc2l0
eSAoaW4gZEJtKQo+IAo+IHdoZXRoZXIgb3Igbm90IDAgaXMgYSB2YWxpZCB2YWx1ZSBmb3IgdGhp
cz8KeWVzLCAwIGlzIGFsc28gYSB2YWxpZCB2YWx1ZS4KSXQgYWxzbyBoYXZlIG5lZ2F0aXZlLCBz
dWNoIGFzIC0xZEJtLgo+IAo+PiArKysgYi9pbmNsdWRlL3VhcGkvbGludXgvbmw4MDIxMS5oCj4+
IEBAIC00MDQwLDYgKzQwNDAsNyBAQCBlbnVtIG5sODAyMTFfc2NoZWRfc2Nhbl9tYXRjaF9hdHRy
IHsKPj4gwqDCoCogQE5MODAyMTFfUlJGX05PXzgwTUhaOiA4ME1IeiBvcGVyYXRpb24gbm90IGFs
bG93ZWQKPj4gwqDCoCogQE5MODAyMTFfUlJGX05PXzE2ME1IWjogMTYwTUh6IG9wZXJhdGlvbiBu
b3QgYWxsb3dlZAo+PiDCoMKgKiBATkw4MDIxMV9SUkZfTk9fSEU6IEhFIG9wZXJhdGlvbiBub3Qg
YWxsb3dlZAo+PiArICogQE5MODAyMTFfUlJGX1BTRDogY2hhbm5lbHMgaGFzIHBvd2VyIHNwZWN0
cmFsIGRlbnNpdHkgdmFsdWUKPiAKPiBJdCBkb2Vzbid0IHNlZW0gbGlrZSB3ZSBuZWVkIHRoaXMs
IGFmdGVyIGFsbCwgdGhlcmUgbXVzdCBiZSBzb21lIGtpbmQgCj4gb2YKPiBhdHRyaWJ1dGUgZm9y
IHRoZSBQU0QsIGFuZCB0aGVuIGl0cyBwcmVzZW5jZS9hYnNlbmNlIGFscmVhZHkgaW5kaWNhdGVz
Cj4gdGhpcz8KTm93IHRoZSBwc2QgdmFsdWUgMCBpcyBhbHNvIGEgdmFsaWQgdmFsdWUsIHNvIG5v
dyB3ZSBjYW4gbm90IGNvbnNpZGVyIAp0aGUKcHNkIDAgYXMgTk9OLVBTRCwgc28gd2UgbmVlZCB0
aGlzIGZsYWcgdG8gY2hlY2sgaXQgaXMgcHNkIG9yIE5PTi1wc2QuCj4gCj4gam9oYW5uZXMKCi0t
IAphdGgxMWsgbWFpbGluZyBsaXN0CmF0aDExa0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vYXRoMTFrCg==
