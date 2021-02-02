Return-Path: <SRS0=0Mgj=HE=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BB3DC433DB
	for <ath11k@archiver.kernel.org>; Tue,  2 Feb 2021 04:33:17 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E7EA664E9C
	for <ath11k@archiver.kernel.org>; Tue,  2 Feb 2021 04:33:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E7EA664E9C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:Date:References:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=b1AA3n0lGS71qHRhqEmPthT6FuJmG1xvjRzUynR5j1A=; b=1AZKeJ88+8llYoMTz1Lv8ZUad
	Mbor1akowRQqJM8mdSGqR33hKKXJmjmmsZbaP4Cg2qqSGejc3DhSiU8+ZvVlpzs+1S4Tiw7v6VgJn
	Id/3uTkmwoDtQCNR7Ud7H8ZrrBWU5lvoOfBxVJmIGIJas75qoBFgv0DU0XR/LerzGUYDOqhja9qal
	nuW1ZHhaE8Zs1f4pwfWKM+p5pmbWuzFeBv+HzQj2Sfe6COInEIWHmWOlWcnLTga/Nm7Z6WAM5Lb1J
	/9cNaznOnZYpbs+jZWSBUumnoPfcQWp9Ofu27blOjUW09SDoYtfuLLnhM6u0JS5w2W3MeHlpkf9tz
	1rwMUHj0A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l6nNI-0003dq-HJ; Tue, 02 Feb 2021 04:33:12 +0000
Received: from mail29.static.mailgun.info ([104.130.122.29])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l6nNE-0003dQ-W4
 for ath11k@lists.infradead.org; Tue, 02 Feb 2021 04:33:10 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1612240386; h=Content-Transfer-Encoding: Content-Type:
 MIME-Version: Message-ID: In-Reply-To: Date: References: Subject: Cc:
 To: From: Sender; bh=PtR/UtoHlz8eXcl6vbirWe2nIkoVwvfU1OnuGoOADZk=;
 b=vIGSfa30UcifKG0A/XoBHXjdTWC22VFlPNS5SsnpMTXotgYN7epoUKJcC1reQI9YEYBmuvOQ
 gbZPFI/1cQ+I6IHgCmO0u34YYtl9kOKGY72f1ztBQEj9VcADqP6HZzqK76UfJmYBtdnOh6fj
 ozRBsrOQmB46rHCjlNotz9ghXBU=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 6018d5f167765734881759cb (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 02 Feb 2021 04:32:49
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 50043C43463; Tue,  2 Feb 2021 04:32:49 +0000 (UTC)
Received: from potku.adurom.net (88-114-240-156.elisa-laajakaista.fi
 [88.114.240.156])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id E307AC433CA;
 Tue,  2 Feb 2021 04:32:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org E307AC433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=kvalo@codeaurora.org
From: Kalle Valo <kvalo@codeaurora.org>
To: Peter Oh <peter.oh@eero.com>
Subject: Re: [PATCH] ath11k: fix a locking bug in ath11k_mac_op_start()
References: <YBfy+zc3XkiyIe6t@mwanda>
 <896a68dd-02ec-4fe3-3fbf-ec1bd2decefe@eero.com>
Date: Tue, 02 Feb 2021 06:32:44 +0200
In-Reply-To: <896a68dd-02ec-4fe3-3fbf-ec1bd2decefe@eero.com> (Peter Oh's
 message of "Mon, 1 Feb 2021 13:47:27 -0800")
Message-ID: <875z3b84yb.fsf@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.5 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210201_233309_160288_6B14B80E 
X-CRM114-Status: GOOD (  19.51  )
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
Cc: linux-wireless@vger.kernel.org, Carl Huang <cjhuang@codeaurora.org>,
 kernel-janitors@vger.kernel.org, ath11k@lists.infradead.org,
 Dan Carpenter <dan.carpenter@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

UGV0ZXIgT2ggPHBldGVyLm9oQGVlcm8uY29tPiB3cml0ZXM6Cgo+IE9uIDIvMS8yMSA0OjI0IEFN
LCBEYW4gQ2FycGVudGVyIHdyb3RlOgo+PiBUaGlzIGVycm9yIHBhdGggbGVhZHMgdG8gYSBTbWF0
Y2ggd2FybmluZzoKPj4KPj4gICAgICBkcml2ZXJzL25ldC93aXJlbGVzcy9hdGgvYXRoMTFrL21h
Yy5jOjQyNjkgYXRoMTFrX21hY19vcF9zdGFydCgpCj4+ICAgICAgZXJyb3I6IGRvdWJsZSB1bmxv
Y2tlZCAnJmFyLT5jb25mX211dGV4JyAob3JpZyBsaW5lIDQyNTEpCj4+Cj4+IFdlJ3JlIG5vdCBo
b2xkaW5nIHRoZSBsb2NrIHdoZW4gd2UgZG8gdGhlICJnb3RvIGVycjsiIHNvIGl0IGxlYWRzIHRv
IGEKPj4gZG91YmxlIHVubG9jay4gIFdlIHNob3VsZCBob2xkIHRoZSBsb2NrIGJlY2F1c2UgdGhl
IGVycm9yIHBhdGggc2V0cwo+PiAiYXItPnN0YXRlIiBzbyB0aGUgcmlnaHQgZml4IGlzIHRvIHRh
a2UgdGhlIGxvY2sgYmVmb3JlIGRvaW5nIHRoZSBnb3RvLgo+Pgo+PiBGaXhlczogYzgzYzUwMGI1
NWI2ICgiYXRoMTFrOiBlbmFibGUgaWRsZSBwb3dlciBzYXZlIG1vZGUiKQo+PiBTaWduZWQtb2Zm
LWJ5OiBEYW4gQ2FycGVudGVyIDxkYW4uY2FycGVudGVyQG9yYWNsZS5jb20+Cj4+IC0tLQo+PiAg
IGRyaXZlcnMvbmV0L3dpcmVsZXNzL2F0aC9hdGgxMWsvbWFjLmMgfCAxICsKPj4gICAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKykKPj4KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbmV0L3dp
cmVsZXNzL2F0aC9hdGgxMWsvbWFjLmMgYi9kcml2ZXJzL25ldC93aXJlbGVzcy9hdGgvYXRoMTFr
L21hYy5jCj4+IGluZGV4IGMxNjA4ZjY0ZWE5NS4uMTJlOTgxZTllM2Q3IDEwMDY0NAo+PiAtLS0g
YS9kcml2ZXJzL25ldC93aXJlbGVzcy9hdGgvYXRoMTFrL21hYy5jCj4+ICsrKyBiL2RyaXZlcnMv
bmV0L3dpcmVsZXNzL2F0aC9hdGgxMWsvbWFjLmMKPj4gQEAgLTQyNTksNiArNDI1OSw3IEBAIHN0
YXRpYyBpbnQgYXRoMTFrX21hY19vcF9zdGFydChzdHJ1Y3QgaWVlZTgwMjExX2h3ICpodykKPj4g
ICAJCQkJCQkxLCBwZGV2LT5wZGV2X2lkKTsKPj4gICAJCWlmIChyZXQpIHsKPj4gICAJCQlhdGgx
MWtfZXJyKGFiLCAiZmFpbGVkIHRvIGVuYWJsZSBpZGxlIHBzOiAlZFxuIiwgcmV0KTsKPj4gKwkJ
CW11dGV4X2xvY2soJmFyLT5jb25mX211dGV4KTsKPj4gICAJCQlnb3RvIGVycjsKPj4gICAJCX0K
Pj4gICAJfQo+Cj4gSXQgc2VlbXMgbW92aW5nIGlkbGVfcHMgY29uZGl0aW9uIGluIGJldHdlZW4g
YXRoMTFrX3dtaV9wZGV2X2xyb19jZmcoKQo+IGFuZCBtdXRleF91bmxvY2soKQo+IMKgaXMgYSBi
ZXR0ZXIgd2F5IGluIHRoaXMgY2FzZS4KCkkgYWdyZWUuIEluIERhbidzIGFwcHJvYWNoIEknbSB3
b3JyaWVkIGFib3V0IHRoZSByYWNlIHdoZW4gd2UgdW5sb2NrIGFuZApsb2NrIGFnYWluLCB0aGUg
c3RhdGUgY2FuIGNoYW5nZSBpbiB0aGF0IGNhc2UuCgotLSAKaHR0cHM6Ly9wYXRjaHdvcmsua2Vy
bmVsLm9yZy9wcm9qZWN0L2xpbnV4LXdpcmVsZXNzL2xpc3QvCgpodHRwczovL3dpcmVsZXNzLndp
a2kua2VybmVsLm9yZy9lbi9kZXZlbG9wZXJzL2RvY3VtZW50YXRpb24vc3VibWl0dGluZ3BhdGNo
ZXMKCi0tIAphdGgxMWsgbWFpbGluZyBsaXN0CmF0aDExa0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vYXRoMTFrCg==
