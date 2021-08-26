Return-Path: <SRS0=rto1=NR=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39C23C432BE
	for <ath11k@archiver.kernel.org>; Thu, 26 Aug 2021 08:22:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 00A8660C51
	for <ath11k@archiver.kernel.org>; Thu, 26 Aug 2021 08:22:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 00A8660C51
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=sipsolutions.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wVPeCUc+Y/5tQaldKexnWAs4HPE9cCEUGVzA1gbYwKA=; b=EL9s2+puKSra/B
	fgbxZZqYn/Cq/G3zaB7VySZJ1DBhCFSwAsL8XcTScbrcPvmJmZ+5TAb1BMm72tKouGBFhXnA4Ey0J
	Nz7hpDNyITbBlsbnKEHC5BqFAd68A32Op5lf/WhD4+oPk3Bz+qTro385YXa8CzweYQrfHW1hiFyZ5
	ZCbLbQd0QZEuaOzuKuOO+a6SASFxfSy7zgDoT80VMfgEG7BVIYuMOp9Fr8LuzSnYYUXl6eOPndEy8
	la+316PHQI1k3p8T02brE9tRg0JGgvRIykpNZR+ZX7zTNKwR1V3jMmhon//FlqUJ1ZtD5G8fN9vT8
	gExKIw2Kb6LrYZs54lsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mJAe6-009XYw-T6; Thu, 26 Aug 2021 08:21:58 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2]
 helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mJAdr-009XXY-Pm
 for ath11k@lists.infradead.org; Thu, 26 Aug 2021 08:21:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sipsolutions.net; s=mail; h=Content-Transfer-Encoding:MIME-Version:
 Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
 Resent-Cc:Resent-Message-ID; bh=reGQwn0U0r6SOYBVaB3+nEcenBEIRLAq14E/8niIQIM=; 
 t=1629966103; x=1631175703; b=KX+9fWYchEcYNJbHz+BCKUXRq9Atn4BhyVyXGUMzQiE9YjP
 gLHkRNu3rEZ74gfD9Dwm3t9DjNMNg/fvQL0ja8bkB2eu9+bycgbxWTTJopsaESVkfrM+tdxQRAiUy
 vuh7aUQ9sB6t8Pvuj86RRE1iZ4N3iJE5Xa93m56u/MplaR1mMvUJV6ef10cLcowmRXxD8j+RHbTBB
 2d1XDTxHer+HBUHIHG7THRyYbUYijPtoiDaq1uz7/dggO65BrqAcn+kSMpC/Z6zZmw5CyQC0Gb7e0
 h6MgZyUd/uEQLMOqLHQi/IZbBHxYhn9NF1/3zJStpomym842HAysFTlSrn6y+F0A==;
Received: by sipsolutions.net with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.94.2) (envelope-from <johannes@sipsolutions.net>)
 id 1mJAdq-00G4gh-7b; Thu, 26 Aug 2021 10:21:42 +0200
Message-ID: <57012b81620f7c176c405262f2caf8d497393cae.camel@sipsolutions.net>
Subject: Re: [PATCH v2 3/8] mac80211: add parse regulatory info in 6 GHz
 operation information
From: Johannes Berg <johannes@sipsolutions.net>
To: Wen Gong <wgong@codeaurora.org>, ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Date: Thu, 26 Aug 2021 10:21:41 +0200
In-Reply-To: <20210820122041.12157-4-wgong@codeaurora.org>
References: <20210820122041.12157-1-wgong@codeaurora.org>
 <20210820122041.12157-4-wgong@codeaurora.org>
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210826_012143_864974_1CFB974D 
X-CRM114-Status: GOOD (  14.20  )
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

T24gRnJpLCAyMDIxLTA4LTIwIGF0IDA4OjIwIC0wNDAwLCBXZW4gR29uZyB3cm90ZToKPiBUaGlz
IHBhdGNoIGlzIHRvIGNvbnZlcnQgdGhlIHJlZ3VsYXRvcnkgaW5mbyBzdWJmaWVsZCBpbiBIRSBv
cGVyYXRpb24KPiBlbGVtZW50IHRvIHBvd2VyIHR5cGUgYW5kIHNhdmUgaW4gc3RydWN0IGNmZzgw
MjExX2NoYW5fZGVmLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFdlbiBHb25nIDx3Z29uZ0Bjb2RlYXVy
b3JhLm9yZz4KPiAtLS0KPiDCoG5ldC9tYWM4MDIxMS91dGlsLmMgfCAxMCArKysrKysrKysrCj4g
wqAxIGZpbGUgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9uZXQv
bWFjODAyMTEvdXRpbC5jIGIvbmV0L21hYzgwMjExL3V0aWwuYwo+IGluZGV4IDkzZDk2YTRmOWMz
ZS4uY2IxYzM1ZDhlZjQ4IDEwMDY0NAo+IC0tLSBhL25ldC9tYWM4MDIxMS91dGlsLmMKPiArKysg
Yi9uZXQvbWFjODAyMTEvdXRpbC5jCj4gQEAgLTMzOTUsNiArMzM5NSwxNiBAQCBib29sIGllZWU4
MDIxMV9jaGFuZGVmX2hlXzZnaHpfb3BlcihzdHJ1Y3QgaWVlZTgwMjExX3N1Yl9pZl9kYXRhICpz
ZGF0YSwKPiDCoAkJCQkJICAgICAgTkw4MDIxMV9CQU5EXzZHSFopOwo+IMKgCWhlX2NoYW5kZWYu
Y2hhbiA9IGllZWU4MDIxMV9nZXRfY2hhbm5lbChzZGF0YS0+bG9jYWwtPmh3LndpcGh5LCBmcmVx
KTsKPiDCoAo+IAo+ICsJc3dpdGNoICh1OF9nZXRfYml0cyhoZV82Z2h6X29wZXItPmNvbnRyb2ws
Cj4gKwkJCSAgICBJRUVFODAyMTFfSEVfNkdIWl9PUEVSX0NUUkxfUkVHX0lORk8pKSB7Cj4gKwlj
YXNlIElFRUU4MDIxMV82R0haX0NUUkxfUkVHX0xQSV9BUDoKPiArCQloZV9jaGFuZGVmLnBvd2Vy
X3R5cGUgPSBOTDgwMjExX1JFR19MUElfQVA7Cj4gKwkJYnJlYWs7Cj4gKwljYXNlIElFRUU4MDIx
MV82R0haX0NUUkxfUkVHX1NQX0FQOgo+ICsJCWhlX2NoYW5kZWYucG93ZXJfdHlwZSA9IE5MODAy
MTFfUkVHX1NQX0FQOwo+ICsJCWJyZWFrOwo+ICsJfQoKTm93IGhlcmUgeW91IHB1dCBpdCBpbiB0
aGUgY2hhbmRlZiwgYnV0IGRvbid0IHByb3BhZ2F0ZSBpdCBhbnl3aGVyZSBpZgpjaGFubmVscyBh
cmUgbWVyZ2VkLCBldGMuIEkgZG9uJ3QgdGhpbmsgdGhpcyBjYW4gd29yayBjb3JyZWN0bHkgaW4g
YWxsCmJ1dCB0aGUgbW9zdCB0cml2aWFsIHVzZSBjYXNlcy4KCmpvaGFubmVzCgoKLS0gCmF0aDEx
ayBtYWlsaW5nIGxpc3QKYXRoMTFrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9hdGgxMWsK
