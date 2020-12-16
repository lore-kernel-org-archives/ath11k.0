Return-Path: <SRS0=Dsd9=FU=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EDE3C4361B
	for <ath11k@archiver.kernel.org>; Wed, 16 Dec 2020 18:39:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1F9B523428
	for <ath11k@archiver.kernel.org>; Wed, 16 Dec 2020 18:39:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1F9B523428
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:Date:References:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ETwRgSC9gUs36yKp2dvNb6h4wSZp+jeToCKStb6xtGQ=; b=Qo3eCG/HwqkoDMqHlzZjZjw/7
	4EWN297hD87EFFMxv+XDj7s06cD+dXEnsHPdQ5SGYsb/NNspzTcdtXwaM+VXyZUH74I6Cyfchsokv
	DEPR9tCCdnXGGOsYXl/rSHRoW7jEAO7ugrl8rZ7SKKMAjhY9180MD+VBQIDPI0mjShMtnmN6pcpob
	UrtQV004JQps3L1WgNzYydxtqTlZuXOj6/HUnURyJTuXa/Y9yqgn1GCryWCnkvzR76qlmgYxLZbuY
	+Bb7F7YaNl2KzLg+UG1fCZu8Xf2CgEt1xRe1TF/iUP1kVN4mKd7zAUTyTuLnMUMwvjojQtimlPe3s
	QeN/zgoZw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kpbi3-0003KM-HK; Wed, 16 Dec 2020 18:39:35 +0000
Received: from so254-31.mailgun.net ([198.61.254.31])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kpbhy-0003J7-NH
 for ath11k@lists.infradead.org; Wed, 16 Dec 2020 18:39:33 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1608143972; h=Content-Transfer-Encoding: Content-Type:
 MIME-Version: Message-ID: In-Reply-To: Date: References: Subject: Cc:
 To: From: Sender; bh=J2Bis4FfKgb6IWpxB95PLAmCk8eMgw1QGWh9YFy+Jqg=;
 b=U1M2Dv9dzhslV2CHSH9yYmKTyW4HbfFmhDsFoj5CiYEJUWdW7d0yVhXdE1vd/uRs9SyDOHcq
 KjEncD9nC2KQ4sGMfCp4vY9Gb7B+wCtSpmV0P7pI7QkC/VAxtRakne7CxpKP8ybrUUPe2gzq
 lhsOI3A35HNYUsyl9V7k7YECnB0=
X-Mailgun-Sending-Ip: 198.61.254.31
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 5fda545b75ab652e875e1021 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 16 Dec 2020 18:39:23
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 05FC2C433C6; Wed, 16 Dec 2020 18:39:23 +0000 (UTC)
Received: from potku.adurom.net (88-114-240-156.elisa-laajakaista.fi
 [88.114.240.156])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id B2516C433CA;
 Wed, 16 Dec 2020 18:39:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org B2516C433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=kvalo@codeaurora.org
From: Kalle Valo <kvalo@codeaurora.org>
To: alan <alan@abraxas.to>
Subject: Re: ath11k/mhi backtraces on shutdown with linux-next
References: <01AD5E2A-6A3A-4F67-B050-70859285A4C0@abraxas.to>
Date: Wed, 16 Dec 2020 20:39:19 +0200
In-Reply-To: <01AD5E2A-6A3A-4F67-B050-70859285A4C0@abraxas.to>
 (alan@abraxas.to's message of "Sun, 13 Dec 2020 14:22:48 -0500")
Message-ID: <87tuslvbmw.fsf@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.5 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201216_133932_637026_87B51686 
X-CRM114-Status: GOOD (  15.46  )
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
Cc: ath11k@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

YWxhbiA8YWxhbkBhYnJheGFzLnRvPiB3cml0ZXM6Cgo+IEkgd2FudCB0byB0aGFuayB5b3UgZm9y
IHlvdXIgd29yayBvbiBhdGgxMWsuIEkganVzdCBib3VnaHQgYSBEZWxsIFhQUwo+IDEzIDkzMTAg
d2l0aCB0aGUgQVg1MDAgd2lyZWxlc3MgY2hpcCBhbmQgd2FzIGRpc2FwcG9pbnRlZCB0byBkaXNj
b3Zlcgo+IGl0IGRpZG7igJl0IHdvcmsgd2l0aCBsaW51eC4KPgo+IEkgaGF2ZSBiZWVuIGZvbGxv
d2luZyB0aGUgYXRoMTFrIG1haWxpbmcgbGlzdCBhbmQgaXQgYXBwZWFycyB0aGF0IHlvdQo+IGFy
ZSBnZXR0aW5nIGNsb3NlIHRvIGEgc29sdXRpb24gLSB0aGF0IG9ic2VydmF0aW9uIGFib3V0IHRo
ZSBNMiBzdGF0ZQo+IGluIHRoZSBNSEkgbG9va3MgdmVyeSBwcm9taXNpbmcuCgpJbmRlZWQsIGl0
IHNlZW1zIHdlIGhhdmUgYSBmdW5jdGlvbmFsIHdvcmthcm91bmQgbm93LiBJIGhvcGUgeW91IHNh
dwp0aGlzOgoKaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYXRoMTFrLzg3YmxldzNlNHEuZnNmQGNv
ZGVhdXJvcmEub3JnLwoKSSBoYXZlIHJlY2VpdmVkIG11bHRpcGxlIHBvc2l0aXZlIHJlcG9ydHMg
d2l0aCB0YWcuCgo+IFBTLiBJIHZpc2l0ZWQgVGFtcGVyZSBvbmNlLCBpbiAxOTk1LiBJIGdhdmUg
YSB0YWxrIGF0IHRoZSBTY2FuZGljCj4gUm9zZW5kYWhsIGluIFB5eW5pa2tpLiBCZWF1dGlmdWwg
cGxhY2UhCgpJIGJldCBpdCB3YXNuJ3QgdGhpcyB0aW1lIG9mIHllYXIsIG5vdyBpdCdzIHNvIGRh
cmsgYW5kIG11ZGR5IDspIEhvcGluZwpmb3IgdGhlIHNub3cgdG8gY29tZSBzb29uLCB0aGVuIGl0
IHdpbGwgYmUgYmV0dGVyLgoKLS0gCmh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcHJvamVj
dC9saW51eC13aXJlbGVzcy9saXN0LwoKaHR0cHM6Ly93aXJlbGVzcy53aWtpLmtlcm5lbC5vcmcv
ZW4vZGV2ZWxvcGVycy9kb2N1bWVudGF0aW9uL3N1Ym1pdHRpbmdwYXRjaGVzCgotLSAKYXRoMTFr
IG1haWxpbmcgbGlzdAphdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2F0aDExawo=
