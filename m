Return-Path: <SRS0=JrPu=HD=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11F22C433DB
	for <ath11k@archiver.kernel.org>; Mon,  1 Feb 2021 21:47:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A48B664EBF
	for <ath11k@archiver.kernel.org>; Mon,  1 Feb 2021 21:47:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A48B664EBF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=eero.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=tByW+LEj32UVwIMrYeNgB2yfsCbdv2kEFuXsMFFeNVo=; b=1Q8VKPfPxfEJFFFKudAiat96i
	ooh0SbP1sKCrmgLsOBf+AXUUlWaOViz0vNjvPqmMPsBl1Ur8uNpaZrGurZUh/YhmjZuIPIMuNXqKJ
	wLAKoxZdp9al6bgkTINzotgKVFeqE4nm8V6b/7wVKjdiNbC0pqSPGrq7P/UfQBDwpaWU3U3fvfEiN
	LoIX1+KFeVV/dAXoMfAO68YoC22UTWe5dn9MuShOrjf4hKlFj8vWwfXjjoYkzVahJxyeWJdg4BiWw
	QZNXFcIGzLC1ZYX5fnlm3gehv8S9ZE/4wMw6u5nE9yVU3ztBiBS6XcTr4xniyBaz9hoHq4xrIMf2K
	t43CaRxUg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l6h2n-0004ce-6u; Mon, 01 Feb 2021 21:47:37 +0000
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l6h2k-0004c7-3y
 for ath11k@lists.infradead.org; Mon, 01 Feb 2021 21:47:35 +0000
Received: by mail-pg1-x534.google.com with SMTP id i7so13001210pgc.8
 for <ath11k@lists.infradead.org>; Mon, 01 Feb 2021 13:47:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eero.com; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=3jrybrZXt/b8n85ODtKeUfuhoYR0zahuJQZ5wiSQlzo=;
 b=IJxDv9cnOzJcP7D1qRq5hv6GEqCDerCAexj1WliDB9nKLO59T8Ad56+k8H9wlKGayV
 FV+4OuDVN4hgvAhH2HiJUFapyQ/RyuKUqPf9dCJIOrpAxIT15LTHl3HDSq2F1HwAaLD/
 PS4c966O/2fDKeeCNd4rntZ0HTOBPzkBAaoqk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=3jrybrZXt/b8n85ODtKeUfuhoYR0zahuJQZ5wiSQlzo=;
 b=Iy+cykhAOMbWynGo5wRbrHigOS0rhI7ZBCnH/GXChz5VdrKObc9mcWeBI7tDe2wK24
 UhwN1CJ+YUATRxDnj3KTbhrrD4I/gB1XHWKV+9sXcTjkzuVnqro3it2ZBEM+TyrvJ0iB
 1rwVpsHlgprOpIx4zEBO9q2K4f1ybRXtLGstpLjEfYKlZEkGeT+B0wgmXQz5MBVx99ox
 ZQtGshz5I5mlL1ql9PiIzsngvlWxVkUVGSxaCTTc95HjJvebkO8Irlq0LB6aZ70w7ZiH
 hdmZ2jQpVnn386ODa4UIJAKZubYjXuM7SLi9BJCcoyN+FFztgvh3qVRV7cpqloQQdsLA
 +wsg==
X-Gm-Message-State: AOAM5321szQZtbOowv5HrTIlSNpV1NIJDzUphv0YKY/zuCRJH8NGc6DS
 cS0iEUvmEFuVmbzsjE4ZC+qMQ5ef54lVxP8M
X-Google-Smtp-Source: ABdhPJw5C96PqE/ogjf1MYJgWK71uL6BpMTHYebb4lLz+gUEhPWju06nZGjvHP7oUy2X9mMgF+w/mg==
X-Received: by 2002:a63:9811:: with SMTP id q17mr19079307pgd.238.1612216050662; 
 Mon, 01 Feb 2021 13:47:30 -0800 (PST)
Received: from [192.168.4.200]
 (107-196-182-50.lightspeed.sntcca.sbcglobal.net. [107.196.182.50])
 by smtp.gmail.com with ESMTPSA id 6sm18558803pfd.212.2021.02.01.13.47.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Feb 2021 13:47:30 -0800 (PST)
Subject: Re: [PATCH] ath11k: fix a locking bug in ath11k_mac_op_start()
To: Dan Carpenter <dan.carpenter@oracle.com>, Kalle Valo <kvalo@codeaurora.org>
References: <YBfy+zc3XkiyIe6t@mwanda>
From: Peter Oh <peter.oh@eero.com>
Message-ID: <896a68dd-02ec-4fe3-3fbf-ec1bd2decefe@eero.com>
Date: Mon, 1 Feb 2021 13:47:27 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <YBfy+zc3XkiyIe6t@mwanda>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210201_164734_517703_CE8FF554 
X-CRM114-Status: GOOD (  20.44  )
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
Cc: kernel-janitors@vger.kernel.org, Carl Huang <cjhuang@codeaurora.org>,
 linux-wireless@vger.kernel.org, ath11k@lists.infradead.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Ck9uIDIvMS8yMSA0OjI0IEFNLCBEYW4gQ2FycGVudGVyIHdyb3RlOgo+IFRoaXMgZXJyb3IgcGF0
aCBsZWFkcyB0byBhIFNtYXRjaCB3YXJuaW5nOgo+Cj4gICAgICBkcml2ZXJzL25ldC93aXJlbGVz
cy9hdGgvYXRoMTFrL21hYy5jOjQyNjkgYXRoMTFrX21hY19vcF9zdGFydCgpCj4gICAgICBlcnJv
cjogZG91YmxlIHVubG9ja2VkICcmYXItPmNvbmZfbXV0ZXgnIChvcmlnIGxpbmUgNDI1MSkKPgo+
IFdlJ3JlIG5vdCBob2xkaW5nIHRoZSBsb2NrIHdoZW4gd2UgZG8gdGhlICJnb3RvIGVycjsiIHNv
IGl0IGxlYWRzIHRvIGEKPiBkb3VibGUgdW5sb2NrLiAgV2Ugc2hvdWxkIGhvbGQgdGhlIGxvY2sg
YmVjYXVzZSB0aGUgZXJyb3IgcGF0aCBzZXRzCj4gImFyLT5zdGF0ZSIgc28gdGhlIHJpZ2h0IGZp
eCBpcyB0byB0YWtlIHRoZSBsb2NrIGJlZm9yZSBkb2luZyB0aGUgZ290by4KPgo+IEZpeGVzOiBj
ODNjNTAwYjU1YjYgKCJhdGgxMWs6IGVuYWJsZSBpZGxlIHBvd2VyIHNhdmUgbW9kZSIpCj4gU2ln
bmVkLW9mZi1ieTogRGFuIENhcnBlbnRlciA8ZGFuLmNhcnBlbnRlckBvcmFjbGUuY29tPgo+IC0t
LQo+ICAgZHJpdmVycy9uZXQvd2lyZWxlc3MvYXRoL2F0aDExay9tYWMuYyB8IDEgKwo+ICAgMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9uZXQv
d2lyZWxlc3MvYXRoL2F0aDExay9tYWMuYyBiL2RyaXZlcnMvbmV0L3dpcmVsZXNzL2F0aC9hdGgx
MWsvbWFjLmMKPiBpbmRleCBjMTYwOGY2NGVhOTUuLjEyZTk4MWU5ZTNkNyAxMDA2NDQKPiAtLS0g
YS9kcml2ZXJzL25ldC93aXJlbGVzcy9hdGgvYXRoMTFrL21hYy5jCj4gKysrIGIvZHJpdmVycy9u
ZXQvd2lyZWxlc3MvYXRoL2F0aDExay9tYWMuYwo+IEBAIC00MjU5LDYgKzQyNTksNyBAQCBzdGF0
aWMgaW50IGF0aDExa19tYWNfb3Bfc3RhcnQoc3RydWN0IGllZWU4MDIxMV9odyAqaHcpCj4gICAJ
CQkJCQkxLCBwZGV2LT5wZGV2X2lkKTsKPiAgIAkJaWYgKHJldCkgewo+ICAgCQkJYXRoMTFrX2Vy
cihhYiwgImZhaWxlZCB0byBlbmFibGUgaWRsZSBwczogJWRcbiIsIHJldCk7Cj4gKwkJCW11dGV4
X2xvY2soJmFyLT5jb25mX211dGV4KTsKPiAgIAkJCWdvdG8gZXJyOwo+ICAgCQl9Cj4gICAJfQpJ
dCBzZWVtcyBtb3ZpbmcgaWRsZV9wcyBjb25kaXRpb24gaW4gYmV0d2VlbiBhdGgxMWtfd21pX3Bk
ZXZfbHJvX2NmZygpIAphbmQgbXV0ZXhfdW5sb2NrKCkKIMKgaXMgYSBiZXR0ZXIgd2F5IGluIHRo
aXMgY2FzZS4KClRoYW5rcywKUGV0ZXIKCi0tIAphdGgxMWsgbWFpbGluZyBsaXN0CmF0aDExa0Bs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vYXRoMTFrCg==
