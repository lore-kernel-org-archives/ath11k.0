Return-Path: <SRS0=PtVs=HO=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2AF5C433DB
	for <ath11k@archiver.kernel.org>; Fri, 12 Feb 2021 06:16:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5F3DD64E6B
	for <ath11k@archiver.kernel.org>; Fri, 12 Feb 2021 06:16:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5F3DD64E6B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:Date:References:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=FGmObDMmhF1ex96Dk8hS4SmlbGvBsOrhezOHiRHMGNI=; b=DGDSk5mQA+we1FCpfg1ZWoMeE
	lZPn09ECXPXklpoXaft9m8PBhRhK+VuXlwrmhdVf2iOxEbfvVBaTE9NWI4afzBAxiWKcTCXWRFIKv
	m5gpG3ATaQuQrKTWeGFjrY5ieVJ9op2pjbq6njWgupcgV/cCe0IubcH4XKP4uDESPCs8F6PtNqtM2
	qUgkjazxidU7XW51AV6si8CTFvQsAyN6S5r5fI7dfw0Vezb4DTpfw/ajj+foE9aK+y1CzOsBTLELI
	ugG3L1UPkLhLfmvBOS16Rt0C3AokSOy4K6gAzj25zd3WOWl31mTtnkYnaePvxt+ZCPXXSsUKSeNRn
	ioYdNoIjg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lARkh-0001Iv-8m; Fri, 12 Feb 2021 06:16:27 +0000
Received: from so15.mailgun.net ([198.61.254.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lARke-0001HR-DX
 for ath11k@lists.infradead.org; Fri, 12 Feb 2021 06:16:25 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1613110583; h=Content-Transfer-Encoding: Content-Type:
 MIME-Version: Message-ID: In-Reply-To: Date: References: Subject: Cc:
 To: From: Sender; bh=Jp/fxVG5lJhEK0xtiKB0F1/PCOOx6XwVGX6SQs94RBk=;
 b=m7rvQknN8oGykeIzeL2sYX1F+SbOSymHb+PawRObGyAHsoKlSzqaqOz0rljyvL7KhsPEdccj
 UYW1b5PlNotNMRTsqRrEoV33z/jS0eBHWxceX2ahciZ5eZfaShaQQL3cWluuKGGaiJY3Suck
 w1skr58OfwdAQMsXTiuJEMcWOs0=
X-Mailgun-Sending-Ip: 198.61.254.15
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 60261d34e3df861f4b88299a (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 12 Feb 2021 06:16:20
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 647E3C433C6; Fri, 12 Feb 2021 06:16:19 +0000 (UTC)
Received: from potku.adurom.net (88-114-240-156.elisa-laajakaista.fi
 [88.114.240.156])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 2E55EC433CA;
 Fri, 12 Feb 2021 06:16:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 2E55EC433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=kvalo@codeaurora.org
From: Kalle Valo <kvalo@codeaurora.org>
To: Justin Mazzola Paluska <jmp@justinmp.com>
Subject: Re: ath11k: qca6390 firmware crashes while connecting to 160 MHz
 channel
References: <87blew3e4q.fsf@codeaurora.org> <87blew3e4q.fsf@codeaurora.org>
 <054ddea6-639e-c21e-d404-d551c65128df@justinmp.com>
 <920c8cc9-21fb-b7aa-4b49-be7656fb14b5@justinmp.com>
 <f776233a-0ed6-1ebc-3d68-be4a88514736@justinmp.com>
 <874kkfozhp.fsf@codeaurora.org>
 <a170a87b-072d-dc8e-6833-231e0df5b23c@justinmp.com>
 <875z2yuafn.fsf_-_@codeaurora.org>
 <5fd39674-d513-c28e-5469-693d96e804c0@justinmp.com>
Date: Fri, 12 Feb 2021 08:16:16 +0200
In-Reply-To: <5fd39674-d513-c28e-5469-693d96e804c0@justinmp.com> (Justin
 Mazzola Paluska's message of "Thu, 11 Feb 2021 17:23:47 -0500")
Message-ID: <87k0rdste7.fsf@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.5 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210212_011624_481394_05A5471A 
X-CRM114-Status: GOOD (  14.66  )
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

SnVzdGluIE1henpvbGEgUGFsdXNrYSA8am1wQGp1c3Rpbm1wLmNvbT4gd3JpdGVzOgoKPiBPbiAy
LzExLzIxIDY6MTAgQU0sIEthbGxlIFZhbG8gd3JvdGU6Cj4+IChjaGFuZ2luZyB0aGUgdGl0bGUg
dG8gZmluZCB0aGlzIGVhc2llcikKPj4KPj4gSnVzdGluIE1henpvbGEgUGFsdXNrYSA8am1wQGp1
c3Rpbm1wLmNvbT4gd3JpdGVzOgo+Pgo+Pj4gT24gMTIvMjEvMjAgMTI6MTEgUE0sIEthbGxlIFZh
bG8gd3JvdGU6Cj4+Pj4+IE15IHJvdXRlciBzdXBwb3J0cyAxNjAgTUh6IGNoYW5uZWxzIGluIHRo
ZSA1IEdIeiBiYW5kcyBbMV0uwqAgSQo+Pj4+PiBzd2l0Y2hlZCB0aGUgcm91dGVyIHRvIGFkdmVy
dGlzaW5nIDgwIE1IeiBjaGFubmVscyBhbmQgdGhlIGNhcmQgY291bGQKPj4+Pj4gY29ubmVjdC4K
Pj4+PiBUaGFua3MgZm9yIHRoZSBkZXRhaWxlZCBkZWJ1Z2dpbmcsIHRoaXMgc2hvdWxkIGhlbHAg
dXMgcmVwcm9kdWNpbmcgdGhlCj4+Pj4gcHJvYmxlbS4gV2hhdCdzIHRoZSBleGFjdCBvcGVud3J0
IHZlcnNpb24geW91IGFyZSB1c2luZz8KPj4+IFRoZSBPcGVuV1JUIHZlcnNpb24gaXM6Cj4+Pgo+
Pj4gT3BlbldydCAxOS4wNy41IHIxMTI1Ny01MDkwMTUyYWUzIC8gTHVDSSBvcGVud3J0LTE5LjA3
IGJyYW5jaAo+Pj4gZ2l0LTIwLjM0MS41NzYyNi01MWY1NWI1Cj4+Pgo+Pj4gKFRoaXMgaXMgdGhl
IGxhdGVzdCBzdGFibGUgcmVsZWFzZS4pCj4+IFRoYW5rcy4gSSBnb3QgYSByZXBvcnQgdGhhdCB0
aGlzIG1pZ2h0IGJlIGR1ZSB0byBjb21taXQgMzU3OTk5NDQ3NmI2Cj4+ICgid2lyZWxlc3M6IGZp
eCB3cm9uZyAxNjAvODArODAgTUh6IHNldHRpbmciKS4gQ2FuIHlvdSB0cnkgcmV2ZXJ0aW5nIHRo
ZQo+PiBjb21taXQganVzdCB0byBjb25maXJtIHdlIGFyZSBzZWVpbmcgdGhlIHNhbWUgaXNzdWU/
Cj4KPiBJIHdpbGwgdHJ5IG92ZXIgdGhlIHdlZWtlbmQuwqAgU2hhbGwgSSBzdGlsbCB1c2UgdGhl
Cj4gYXRoMTFrLXFjYTYzOTAtYnJpbmd1cCBicmFuY2ggb3Igc29tZXRoaW5nIGVsc2U/wqAgKEkn
bSBzdGlsbCBydW5uaW5nCj4gdGhlIGF0aDExay1xY2E2MzkwLWJyaW5ndXAgYnJhbmNoIG9uIG15
IGxhcHRvcCkuCgpZZXMsIHVzZSB0aGUgc2FtZSBicmFuY2guIExlYXN0IGFtb3VudCBvZiBjaGFu
Z2VzIHRoYXQgd2F5LgoKLS0gCmh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcHJvamVjdC9s
aW51eC13aXJlbGVzcy9saXN0LwoKaHR0cHM6Ly93aXJlbGVzcy53aWtpLmtlcm5lbC5vcmcvZW4v
ZGV2ZWxvcGVycy9kb2N1bWVudGF0aW9uL3N1Ym1pdHRpbmdwYXRjaGVzCgotLSAKYXRoMTFrIG1h
aWxpbmcgbGlzdAphdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2F0aDExawo=
