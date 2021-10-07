Return-Path: <SRS0=tHTJ=O3=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE0C7C433EF
	for <ath11k@archiver.kernel.org>; Thu,  7 Oct 2021 06:23:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6FC1361215
	for <ath11k@archiver.kernel.org>; Thu,  7 Oct 2021 06:23:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6FC1361215
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0edLVokeAhh6xgmX4Ga8kH19yEduN9FssdAd2jyfGWo=; b=V8EVUeCkYz/Cvv
	sQCgo1xzhG7JDU3qs+IVU1hpw6UXY5UDIqFXa2cCjYhBYCbYSaBeCiSFuqbgQmBFldp2UrvbOSEEp
	c8+P3DoSkt8AmM358PuRcW8Idp12g3g5d3NDDMTBdbaTpkUbCYFIrVlYc5iEYrR+M3oWRWKvyDwW6
	PBkKUpYCps3dhb8WirnmH8T3va2+Cgq55xL8zxHBDQlJXB5MHGxGoh+ikV6FTuuEbnkvMZYTjTDq4
	mdi2mn5xaB+KZeL3d+4SF2p1UGEPz8CNOPpFZ/SgNOIbNa7V/Pw2a6uW7JaJoFKQFj0rEjMWv5R69
	r4p8dO8IRzROc0ekHl8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mYMo0-00GGdi-Dh; Thu, 07 Oct 2021 06:23:00 +0000
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mYMnw-00GGdE-SM
 for ath11k@lists.infradead.org; Thu, 07 Oct 2021 06:22:58 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1633587776; h=Content-Transfer-Encoding: Content-Type:
 MIME-Version: Message-ID: In-Reply-To: Date: References: Subject: Cc:
 To: From: Sender; bh=V6w5blgkN0H+KSS+qJxQJbAKjfmF5qphFIcpWhNKI4Q=;
 b=eL86eU1Ip1vVFpkSOE0CwajHZneMTFsnAIsl7C19KAuHIlUSVUD/zzeJWP6MDjbFGpYCX23d
 43Q++eEHMt5R6je1vd3NSPv+2LpfbovI4jhfAKVaaR/MqY4ojFc+3abEFRu17MjlU1swE//u
 Zjui4EjWZjxkkh+V6qlRo4IPib8=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 615e923f09ab5538895e5340 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 07 Oct 2021 06:22:55
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 58CE1C43460; Thu,  7 Oct 2021 06:22:54 +0000 (UTC)
Received: from tykki (tynnyri.adurom.net [51.15.11.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 49394C4338F;
 Thu,  7 Oct 2021 06:22:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 49394C4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
From: Kalle Valo <kvalo@codeaurora.org>
To: Mark Herbert <mark.herbert42@gmail.com>
Cc: ath11k@lists.infradead.org
Subject: Re: Can not unload ath11k_pci and load it back
References: <190a1b14-0a8c-f1fb-9f0d-e25cc57034a7@gmail.com>
Date: Thu, 07 Oct 2021 09:22:49 +0300
In-Reply-To: <190a1b14-0a8c-f1fb-9f0d-e25cc57034a7@gmail.com> (Mark Herbert's
 message of "Tue, 5 Oct 2021 22:32:43 +0300")
Message-ID: <875yu9e4li.fsf@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211006_232257_014648_6BA8CF73 
X-CRM114-Status: GOOD (  18.00  )
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

TWFyayBIZXJiZXJ0IDxtYXJrLmhlcmJlcnQ0MkBnbWFpbC5jb20+IHdyaXRlczoKCj4gRGVhciBh
dGgxMWsgdGVhbSwKPgo+IFRoZSBtYWluIGlzc3VlIGlzIEkgY2FuIG5vdCBoaWJlcm5hdGUgYW5k
IHdha2UgdXAgbXkgWFBTIDEzIDkzMTAuwqAgSWYKPiBJIGtlZXAgbW9kdWxlIGxvYWRlZCBpdCBo
aWJlcm5hdGUuIEJ1IGhhbmdzIG9uIHJlc3VtZS4KCkp1c3QgdG8gYXZvaWQgY29uZnVzaW9ucyB3
aXRoIHRlcm1pbm9sb2d5LCB3aXRoIGhpYmVybmF0ZSB5b3UgbWVhbgpzdG9yaW5nIHRoZSBzeXN0
ZW0gc3RhdGUgdG8gYSBkaXNrIGFuZCBjb21wbGV0ZWx5IHBvd2VyaW5nIG9mZiB0aGUKbGFwdG9w
PwoKSSBhc3N1bWUgaGliZXJuYXRpb24gZmFpbHMgYmVjYXVzZSBhdGgxMWsga2VlcHMgdGhlIGZp
cm13YXJlIHJ1bm5pbmcKZHVyaW5nIHN1c3BlbmQgYW5kIGF0aDExayBpcyBub3QgYWJsZSB0byBy
ZWNvdmVyIGlmIHRoZSBmaXJtd2FyZSBpcyBkZWFkCmR1cmluZyByZXN1bWUuCgpDYW4geW91IGZp
bGUgYSBidWcgYWJvdXQgdGhpcywgaW5zdHJ1Y3Rpb25zIGhlcmU6CgpodHRwczovL3dpcmVsZXNz
Lndpa2kua2VybmVsLm9yZy9lbi91c2Vycy9kcml2ZXJzL2F0aDExay9idWdyZXBvcnQKCj4gSWYg
SSB1bmxvYWQgbW9kdWxlIC0gaXQgcmVzdW1lcyBPSyBidXQgdGhlcmUgaXMgbm8gY2hhbmNlIHRv
IGhhdmUgV0lGSQo+IGJhY2sgd2l0aG91dCByZWJvb3QuCj4KPiBJZiBJIGRvIHJtbW9kIGF0aDEx
a19wY2kgLSBpdCBzaG93cyBlcnJvcnMgaW4gZG1lc2c6Cj4KPiBbwqDCoCA0OC44MDE1MDRdIGF0
aDExa19wY2kgMDAwMDo3MjowMC4wOiBsaW5rIGRvd24gZXJyb3IgZHVyaW5nIGdsb2JhbCByZXNl
dAo+IFvCoMKgIDQ4LjgwMTcwMF0gRE1BUjogRFJIRDogaGFuZGxpbmcgZmF1bHQgc3RhdHVzIHJl
ZyAyCj4gW8KgwqAgNDguODAxNzA5XSBETUFSOiBbSU5UUi1SRU1BUF0gUmVxdWVzdCBkZXZpY2Ug
WzB4NzI6MHgwMC4wXSBmYXVsdAo+IGluZGV4IDB4NjAgW2ZhdWx0IHJlYXNvbiAweDIyXSBQcmVz
ZW50IGZpZWxkIGluIHRoZSBJUlRFIGVudHJ5IGlzCj4gY2xlYXIKPgo+IElmIEkgZG8gbW9kcHJv
YmUgaW1tZWRpYXRlbHkgaXQgZG9lcyBsb2FkIG1vZHVsZSBidXQgY2FyZCB3aWxsIG5vdAo+IGNv
bWUgYmFjayBhZ2Fpbi4KPgo+IEluIEFyY2ggd2lraSByZWxvYWRpbmcgbW9kdWxlcyB3YXMgZXhw
bGFpbmVkIGFzIGEgd29ya2Fyb3VuZCB0bwo+IHN1c3BlbmQtcmVzdW1lIDkzMTAsIGJ1dCBsb29r
cyBsaWtlIGl0IGRvZXMgbm90IHdvcmsgYW55bW9yZS4gU3VzcGVuZAo+IHRvIGlkbGUgd29ya3Mg
ZmluZSAtIG5vIG1vZHVsZSB1bmxvYWRpbmcgbmVlZGVkLgoKSSBoYXZlIGFuIFhQUyAxMyA5MzEw
IGFzIHdlbGwgYnV0IEkgY2FuJ3QgdGVzdCB0aGlzIHJpZ2h0IG5vdy4gQ2FuIHlvdQpwcm92aWRl
IG1vcmUgaW5mb3JtYXRpb24gYWJvdXQgdGhlIGNhcmQgbm90IGdldHRpbmcgYmFjayBhZnRlciBt
b2Rwcm9iZT8KV2hhdCBleGFjdCBrZXJuZWwgYW5kIEJJT1MgdmVyc2lvbnMgYXJlIHlvdSB1c2lu
Zz8gV2hhdCBsb2cgbWVzc2FnZXMgeW91CmdldCBmcm9tIGF0aDExaz8gUHJlZmVyYWJseSB0aGUg
ZXhhY3QgY29tbWFuZHMgeW91IHVzZSBhbmQgdGhlIG91dHB1dAp5b3UgZ2V0IGZyb20gYXRoMTFr
IHdvdWxkIGhlbHAgYSBsb3QgdG8gdW5kZXJzdGFuZCB3aGF0J3MgaGFwcGVuaW5nLgoKLS0gCmh0
dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcHJvamVjdC9saW51eC13aXJlbGVzcy9saXN0LwoK
aHR0cHM6Ly93aXJlbGVzcy53aWtpLmtlcm5lbC5vcmcvZW4vZGV2ZWxvcGVycy9kb2N1bWVudGF0
aW9uL3N1Ym1pdHRpbmdwYXRjaGVzCgotLSAKYXRoMTFrIG1haWxpbmcgbGlzdAphdGgxMWtAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2F0aDExawo=
