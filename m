Return-Path: <SRS0=zrFu=JD=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 394C9C433ED
	for <ath11k@archiver.kernel.org>; Tue,  6 Apr 2021 18:30:01 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CD4C6613B3
	for <ath11k@archiver.kernel.org>; Tue,  6 Apr 2021 18:30:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CD4C6613B3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Rft8GbZzzVJD4jw0Jit/4N1GjIF0tzM74AnJfnRmloQ=; b=VXsIcwcQGzMI2sspkyf2fWT0m
	3nU3t+4iHNWLrm1f/o76j4NV1PPdHSmeunLPU5LaSfFNJH+aGGGLhlIJRJQOaal6n6Kk91cVPIUNA
	2G6nFhhb83Bko7RpubzPqr/S9wrgFHgPiUPNOLT3l9UorSZ11LxG5ryu/ozEk1kto9fMZIpDD5Iju
	z74ZpqS78+GewHL3kvjP1mGoOOq+aJapoo3TSwtX0DZsJOrXJ7X1A7oz7hoHz9BV9cBnw8H1v9shT
	Ycy4wvOjDXmg18/FH1u6e7k98BIOSxgkislaHA8FUGRxi4Vfv6fbWKHSeZm7TavdRzFCZMiNaB4sf
	vtMxUQTBA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lTqSY-003HGa-Sj; Tue, 06 Apr 2021 18:29:55 +0000
Received: from so254-9.mailgun.net ([198.61.254.9])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lTqSV-003HG9-88
 for ath11k@lists.infradead.org; Tue, 06 Apr 2021 18:29:53 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1617733788; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=/Tpk/i5gAFjFHype6+eHyN/1UENfXc8j0unCtXTFneU=;
 b=xgnzCapkPjGewH/gUETJsDaBBuGKYUuV/thdNhVYpyVAmepNk3nfEepo7rTer5xFqzWwG5mS
 ygwfYnMUdieOlmRe3A2q2STEaSdbcGBN9WM45E68zMvrU5PbxgLpneD6NEYxTeFkEN8dsFae
 jSqEACtcFVbN4oHd58pvIecPmCc=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 606ca89a8807bcde1d3c2d6b (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 06 Apr 2021 18:29:46
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 89097C433ED; Tue,  6 Apr 2021 18:29:46 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: gsamin)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 3DE70C43461;
 Tue,  6 Apr 2021 18:29:46 +0000 (UTC)
MIME-Version: 1.0
Date: Tue, 06 Apr 2021 23:59:46 +0530
From: Govindaraj Saminathan <gsamin@codeaurora.org>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org
Subject: Re: [PATCH] mac80211: fix low throughput due to invalid addba
 extension
In-Reply-To: <631e58cbfc146db2a6ca70ffc8b90648@codeaurora.org>
References: <1615909674-13412-1-git-send-email-gsamin@codeaurora.org>
 <e38a1ff5efbe5532a97310c053b50c6ce5ef027e.camel@sipsolutions.net>
 <631e58cbfc146db2a6ca70ffc8b90648@codeaurora.org>
Message-ID: <68a9d6b4eb7b77295f538f4aec3d8f84@codeaurora.org>
X-Sender: gsamin@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210406_192951_491102_DF15521E 
X-CRM114-Status: GOOD (  11.05  )
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

T24gMjAyMS0wMy0xNiAyMzoxNSwgR292aW5kYXJhaiBTYW1pbmF0aGFuIHdyb3RlOgo+IE9uIDIw
MjEtMDMtMTYgMjE6MjEsIEpvaGFubmVzIEJlcmcgd3JvdGU6Cj4+IE9uIFR1ZSwgMjAyMS0wMy0x
NiBhdCAyMToxNyArMDUzMCwgR292aW5kYXJhaiB3cm90ZToKPj4+IEFkZGJhIHJlcXVlc3QgYWN0
aW9uIGZyYW1lIHJlY2VpdmVkIHdpdGggdGhlIGV4dGVuc2lvbiBlbGVtZW50IGZyb20KPj4+IGNl
cnRhaW4gMTFhYyBzdGF0aW9ucywKPj4+IAo+PiAKPj4gUGxlYXNlIGluZGljYXRlIHdoaWNoIHNv
IHdlIGhhdmUgYSByZWNvcmQgb2Ygd2hvJ3Mgc2hpcHBpbmcgYnJva2VuIAo+PiBqdW5rLgpUaGUg
YmVsb3cgbG9nIGkgdGFrZW4gd2l0aCBwaXhlbDMgY2xpZW50IGRldmljZQo+PiAKPj4+IGJ1dCB0
aGUgY21kIGlkIGFuZCBsZW5ndGggbm90IG1hdGNoaW5nIHRvIGFkZGJhCj4+PiBleHRlbnNpb24g
YW5kIGl0IGZhaWxpbmcgaW4gZWxlbWVudCBwYXJzaW5nLgo+PiAKPj4+IER1ZSB0byB0aGlzLCBh
ZGRiYSByZXF1ZXN0Cj4+PiBub3QgYWNrbm93bGVkZ2VkIGFuZCBhZ2dyZWdhdGlvbiBub3Qgc3Rh
cnRlZCB3aGljaCBpcyBjYXVzaW5nIGxvdwo+Pj4gdGhyb3VnaHB1dC4gSGVuY2UgdmFsaWRhdGlu
ZyB0aGUgY21kIGlkIGJlZm9yZSBwcm9jZXNzaW5nIGFkZGJhIAo+Pj4gZXh0ZW5zaW9uLgo+PiAK
Pj4+IMKgCWllc19sZW4gPSBsZW4gLSBvZmZzZXRvZihzdHJ1Y3QgaWVlZTgwMjExX21nbXQsCj4+
PiDCoAkJCQkgdS5hY3Rpb24udS5hZGRiYV9yZXEudmFyaWFibGUpOwo+Pj4gLQlpZiAoaWVzX2xl
bikgewo+Pj4gKwlpZiAoaWVzX2xlbiAmJgo+Pj4gKwkgICAgbWdtdC0+dS5hY3Rpb24udS5hZGRi
YV9yZXEudmFyaWFibGVbMF0gPT0gV0xBTl9FSURfQUREQkFfRVhUKSB7Cj4+PiDCoAkJaWVlZTgw
Ml8xMV9wYXJzZV9lbGVtcyhtZ210LT51LmFjdGlvbi51LmFkZGJhX3JlcS52YXJpYWJsZSwKPj4+
IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoGllc19sZW4sIHRydWUsICZlbGVtcywgbWdtdC0+YnNzaWQsIAo+Pj4gTlVMTCk7
Cj4+PiDCoAkJaWYgKGVsZW1zLnBhcnNlX2Vycm9yKQo+PiAKPj4gU28gd2UgZ2V0IGludG8gcGFy
c2VfZXJyb3Igd2l0aG91dCB0aGlzPwo+IHllcywgd2UgZ2V0dGluZyBwYXJzZSBlcnJvci4KPj4g
Cj4+IFdoYXQgYXJlIHRoZXkgcHV0dGluZyB0aGVyZSBpbnN0ZWFkPwo+IGZpcnN0IDkgYnl0ZXMg
YXJlIGFkZGJhIHJlcXVlc3QgYWN0aW9uIGZyYW1lIGFuZCByZW1haW5pbmcgNyBieXRlcwo+IGV4
dGVuc2lvbiBjYXVzaW5nIGZvciBwYXJzZSBlcnJvci4KPiAwMyAwMCAwMSAwMiAxMCAwMCAwMCBl
MCAwYSBjZiAwOCAwNiAxMWEgNDYgMDkgZmUKPj4gCj4+IGpvaGFubmVzCgotLSAKYXRoMTFrIG1h
aWxpbmcgbGlzdAphdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2F0aDExawo=
